<?php
// +----------------------------------------------------------------------
// | LikeShop有特色的全开源社交分销电商系统
// +----------------------------------------------------------------------
// | 欢迎阅读学习系统程序代码，建议反馈是我们前进的动力
// | 商业用途务必购买系统授权，以免引起不必要的法律纠纷
// | 禁止对系统程序代码以任何目的，任何形式的再发布
// | 微信公众号：好象科技
// | 访问官网：http://www.likemarket.net
// | 访问社区：http://bbs.likemarket.net
// | 访问手册：http://doc.likemarket.net
// | 好象科技开发团队 版权所有 拥有最终解释权
// +----------------------------------------------------------------------
// | Author: LikeShopTeam
// +----------------------------------------------------------------------
namespace app\api\logic;
use app\api\model\Goods;
use app\common\model\Footprint;
use think\Db;
use think\facade\Hook;

class GoodsLogic{
    //商品列表
    public static function getGoodsList($user_id,$get,$page,$size){
        $where = [];
        $order = [];
        $where[] = ['status','=',1];
        $where[] = ['del','=',0];

        $goods = new Goods();
        //品牌筛选
        if(isset($get['brand_id']) && $get['brand_id']) {
            $where[] = ['brand_id', '=', $get['brand_id']];
        }
        //分类筛选
        if(isset($get['category_id']) && $get['category_id']){
            $where[] = ['third_category_id','=',$get['category_id']];
        }
        //关键词搜索
        if(isset($get['keyword']) && $get['keyword']){
            $where[] = ['name','like','%'.$get['keyword'].'%'];
            if($user_id){//记录关键词
                self::recordKeyWord(trim($get['keyword']),$user_id);
            }
        }
        //销量排序
        if(isset($get['sales_sum']) && $get['sales_sum']){
            $order['sales_sum'] = $get['sales_sum'];
        }
        //价格排序
        if(isset($get['price']) && $get['price']){
            $order['min_price'] = $get['price'];
        }


        $goods_count = $goods
                    ->where($where)
                    ->count();

        $goods_list = $goods
                    ->where($where)
                    ->page($page,$size)
                    ->order($order)
                    ->field('id,name,image,min_price as price,market_price,sales_sum+virtual_sales_sum as sales_sum')
                    ->select();

        $more = is_more($goods_count,$page,$size);  //是否有下一页

        $data = [
            'list'          => $goods_list,
            'page_no'       => $page,
            'page_size'     => $size,
            'count'         => $goods_count,
            'more'          => $more
        ];
        return $data;

    }

    //记录搜索关键词
    public static function recordKeyWord($keyword,$user_id){
        $record = Db::name('search_record')->where(['user_id'=>$user_id,'keyword'=>$keyword,'del'=>0])->find();

        if($record){
            return Db::name('search_record')->where(['id'=>$record['id']])->update(['count'=>Db::raw('count+1'),'update_time'=>time()]);
        }
        return Db::name('search_record')->insert(['user_id'=>$user_id,'keyword'=>$keyword]);
    }
    //商品详情
    public static function getGoodsDetail($user_id,$id){

        $goods = Goods::get(['id'=>$id,'status'=>1],['goods_image','goods_item']);

        if($goods){
            //点击量
            $goods->click_count = $goods->click_count  + 1;
            $goods->save();

            $goods->is_collect = 0;
            $goods->sales_sum = $goods->sales_sum + $goods->virtual_sales_sum;
            //检查商品是否整在参加活动，如果正在参加活动替换商品的价格为活动价
            $goods = self::checkActivity($goods);
            $goods->price = $goods->goods_item[0]->price;
            $goods->market_price = $goods->goods_item[0]->market_price;
            if($user_id){
                //是否收藏
                $collect = Db::name('goods_collect')->where(['user_id'=>$user_id,'goods_id'=>$id])->find();
                $goods->is_collect= $collect ? 1 : 0;
            }
            //猜你喜欢
            $like = $goods->Like();
            $goods->like = $like;
            //商品规格
            $goods_spec = $goods->GoodsSpec();
            $goods->goods_spec = $goods_spec;

            $goods->append(['comment'])->hidden(['Spec','GoodsSpecValue'])->visible(['id','name','image','stock','remark','content','sales_sum','click_count','price','market_price','is_collect','goods_spec','goods_image','goods_item','activity']);

            // 钩子-记录足迹(浏览商品)
            Hook::listen('footprint', [
                'type'     => Footprint::browse_goods,
                'user_id'  => $user_id,
                'goods_id' => $id
            ]);

            return $goods;
        }
        return [];

    }
    //好物优选
    public static function getBestList($page,$size){
        $goods = new Goods();
        $goods_count = $goods
                    ->where(['del'=>0,'status'=>1,'is_best'=>1])
                    ->count();

        $goods_list = $goods
                    ->where(['del'=>0,'status'=>1,'is_best'=>1])
                    ->field('id,name,image,min_price as price,market_price,sales_sum+virtual_sales_sum as sales_sum')
                    ->order('sort desc')
                    ->page($page,$size)
                    ->select();

        $more = is_more($goods_count,$page,$size);  //是否有下一页

        $data = [
            'list'          => $goods_list,
            'page_no'       => $page,
            'page_size'     => $size,
            'count'         => $goods_count,
            'more'          => $more
        ];
        return $data;
    }

    public static function getHostList($page,$size){
        $goods = new Goods();
        $goods_count = $goods
            ->where(['del'=>0,'status'=>1])
            ->count();

        $goods_list = $goods
            ->where(['del'=>0,'status'=>1])
            ->field('id,name,image,min_price as price,market_price,sales_sum+virtual_sales_sum as sales_sum,click_count')
            ->order('sales_sum DESC,click_count DESC')
            ->page($page,$size)
            ->select();

        $more = is_more($goods_count,$page,$size);  //是否有下一页

        $data = [
            'list'          => $goods_list,
            'page_no'       => $page,
            'page_size'     => $size,
            'count'         => $goods_count,
            'more'          => $more
        ];
        return $data;
    }



    //搜索记录
    public static function getSearchPage($user_id,$limit){
        $history_list = Db::name('search_record')
            ->where(['user_id'=>$user_id,'del'=>0])
            ->limit($limit)
            ->order('id desc')
            ->column('keyword');
        return[
            'history_lists' => $history_list,
            'hot_lists' => [],
        ];
    }

    //检查商品是否正在参加活动
    public static function checkActivity($goods){
        $goods['activity'] = [];
        $seckill = SeckillLogic::getSeckillGoods();
        if($seckill['seckill_goods']){
            $seckill_goods_ids = array_column($seckill['seckill_goods'],'goods_id');
            if($seckill['seckill_goods'] && in_array($goods['id'],$seckill_goods_ids)){
                $goods['activity'] = [
                    'type'       => 1,
                    'info'       => $seckill['seckill'],
                ];
                foreach ($goods['goods_item'] as &$item){
                    if(isset($seckill['seckill_goods'][$item['id']])){

                        $item['price'] = $seckill['seckill_goods'][$item['id']]['price'];
                    }
                }
            }

        }
        return $goods;

    }
}