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
namespace app\admin\logic;
use app\admin\model\User;
use app\common\logic\AccountLogLogic;
use app\common\logic\UserLevelLogic;
use app\common\model\AccountLog;
use app\common\model\Order;
use app\common\model\Pay;
use app\common\server\UrlServer;
use think\Db;
use think\Exception;

class UserLogic{
    /**
     * 列表
     * @param $get
     * @return array
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public static function lists($get){
        $user = new User();

        $where = [];
        $where[] = ['del','=', '0'];

        //查询
        if(isset($get['keyword']) && $get['keyword']){
            $where[] = ['nickname|mobile','like','%'.$get['keyword'].'%'];
        }
        //等级查询
        if(isset($get['level']) && $get['level']){
            $where[] = ['level','=',$get['level']];
        }
        //分组查询
        if(isset($get['group_id']) && $get['group_id']){
            $where[] = ['group_id','=',$get['group_id']];
        }
        //消费金额
        if(isset($get['total_amount_start']) && $get['total_amount_start']){
            $where[] = ['total_amount','>=',$get['total_amount_start']];
        }
        if(isset($get['total_amount_end']) && $get['total_amount_end']){
            $where[] = ['total_amount','<=',$get['total_amount_end']];
        }

        //注册时间
        if(isset($get['create_start']) && $get['create_start']!=''){
            $where[] = ['create_time','>=',strtotime($get['create_start'])];
        }
        if(isset($get['create_end']) && $get['create_end']!=''){
            $where[] = ['create_time','<=',strtotime($get['create_end'])];
        }

        $user_count = $user
                    ->where($where)
                    ->count();

        $user_list = $user
                    ->where($where)
                    ->field('password,pay_password,salt',true)
                    ->page($get['page'],$get['limit'])
                    ->order('id desc')
                    ->select()->toArray();
        //会员分组
        $user_group = Db::name('user_group')->where(['del'=>0])->column('name','id');
        //会员等级
        $user_level = Db::name('user_level')->where(['del'=>0])->column('name','id');

        $all_user_list = $user->where(['del'=>0])->column('nickname,avatar,mobile,level','id');
        $group_list = db::name('user_group')->where(['del'=>0])->column('name','id');

        foreach ($user_list as &$item){
            $item['group_name'] = '-';
            $item['level_name'] = '无等级';
            //会员所属分组
            if(isset($user_group[$item['group_id']])){
                $item['group_name'] = $user_group[$item['group_id']];
            }

            if(isset($user_level[$item['level']])){
                $item['level_name'] = $user_level[$item['level']];
            }

            $item['referrer_nickname'] = '';
            $item['referrer_mobile'] = '';
            $item['referrer_avatar'] = '';
            $item['referrer_level_name'] = '-';
            if(isset($all_user_list[$item['first_leader']])){
                 $referrer_user = $all_user_list[$item['first_leader']];
                 $item['referrer_nickname'] = $referrer_user['nickname'];
                 $item['referrer_mobile'] = $referrer_user['mobile'];
                 $item['referrer_avatar'] = $referrer_user['avatar'];
                 if(isset($user_level[$referrer_user['level']])){
                     $item['referrer_level_name'] =$user_level[$referrer_user['level']];

                 }
            }

            $item['total_order_amount'] = '￥'.$item['total_order_amount'];

            if(isset($group_list[$item['group_id']])){
                $item['group_name'] = $group_list[$item['group_id']];
            }

        }

        return ['count'=>$user_count , 'lists'=>$user_list];
    }
    /*
     * 获取用户信息
     */
    public static function getUser($id,$getdata = false,$expenditure = false){
        $user =  User::get($id);
        $user->append(['level_name','group_name']);
        if($getdata){
            $user = $user->getData();
            if($user['birthday']) $user['birthday'] = date('Y-m-d',$user['birthday']);
        }
        if($expenditure){
            //本月的消费金额
            $month_amount = Db::name('order')
                        ->where('order_status','not in',[Order::STATUS_CLOSE,Order::STATUS_WAIT_PAY])
                        ->where(['user_id'=>$id,'pay_status'=>Pay::ISPAID])
                        ->whereTime('create_time', 'month')
                        ->sum('order_amount');
            //本月的订单笔数
            $month_num = Db::name('order')
                       ->where('order_status','not in',[Order::STATUS_CLOSE,Order::STATUS_WAIT_PAY])
                       ->where(['user_id'=>$id,'pay_status'=>Pay::ISPAID])
                       ->whereTime('create_time', 'month')
                       ->count();
            //累计消费笔数
            $total_num =Db::name('order')
                        ->where('order_status','not in',[Order::STATUS_CLOSE,Order::STATUS_WAIT_PAY])
                        ->where(['user_id'=>$id,'pay_status'=>Pay::ISPAID])
                        ->sum('order_amount');
            $avg_amount = Db::name('order')
                        ->where('order_status','not in',[Order::STATUS_CLOSE,Order::STATUS_WAIT_PAY])
                        ->where(['user_id'=>$id,'pay_status'=>Pay::ISPAID])
                        ->avg('order_amount');
            $user['month_amount'] = '￥'.round($month_amount,2);
            $user['month_num'] = round($month_num,2);
            $user['total_num'] = round($total_num,2);
            $user['avg_amount'] = '￥'.round($avg_amount,2);
            //分销会员
            $user['distribution_tips'] = '否';
            $user['superior_referrer'] = '-';
            $user['superior_referrer_sn'] = '-';
            if($user['is_distribution']){
                $user['distribution_tips'] = '是';
                $superior_referrer = Db::name('user')->where(['id'=>$user['first_leader']])->field('nickname,sn');
                $user['superior_referrer'] = $superior_referrer['nickname'];
                $user['superior_referrer_sn'] = $superior_referrer['sn'];
            }

        }
        return $user;
    }
    /*
     * 批量设置会员分组
     */
    public static function setGroup($post){
        return Db::name('user')->where(['id'=>$post['user_ids']])->update(['group_id'=>$post['group_id']]);
    }

    /*
     * 用户账户调整
     */
    public static function adjustAccount($post_data){
        Db::startTrans();
        try {
            $update_data = [];
            $account_log = [];
            //余额调整
            if (isset($post_data['money_handle'])) {
                $number = $post_data['money'];
                $change_type = 1;
                $source_type = AccountLog::admin_add_money;
                $money_sql = Db::raw('user_money + ' . $post_data['money']);
                if ($post_data['money_handle'] == 0) {
                    $change_type = 2;
                    $source_type = AccountLog::admin_reduce_money;
                    $money_sql = Db::raw('user_money - ' . $post_data['money']);
                }
                $update_data['user_money'] = $money_sql;
                $account_log[] = [
                    'number'        => $number,
                    'change_type'   => $change_type,
                    'source_type'   => $source_type,
                    'remark'        => $post_data['money_remark'],
                ];
            }
            //积分调整
            if (isset($post_data['integral_handle'])) {
                $number = $post_data['integral'];
                $change_type = 1;
                $source_type = AccountLog::admin_add_integral;
                $integral_sql = Db::raw('user_integral + ' . $post_data['integral']);

                if ($post_data['integral_handle'] == 0) {
                    $change_type = 2;
                    $source_type = AccountLog::admin_reduce_integral;
                    $integral_sql = Db::raw('user_integral - ' . $post_data['integral']);
                }
                $update_data['user_integral'] = $integral_sql;
                $account_log[] = [
                    'number'        => $number,
                    'change_type'   => $change_type,
                    'source_type'   => $source_type,
                    'remark'        => $post_data['integral_remark'],
                ];
            }
            //成长值调整
            if (isset($post_data['growth_handle'])) {
                $number = $post_data['growth'];
                $change_type = 1;
                $source_type = AccountLog::admin_add_growth;
                $growth_sql = Db::raw('user_growth + ' . $post_data['growth']);

                if ($post_data['growth_handle'] == 0) {
                    $change_type = 2;
                    $source_type = AccountLog::admin_reduce_growth;
                    $growth_sql = Db::raw('user_growth - ' . $post_data['growth']);
                }
                $update_data['user_growth'] = $growth_sql;
                $account_log[] = [
                    'number'        => $number,
                    'change_type'   => $change_type,
                    'source_type'   => $source_type,
                    'remark'        => $post_data['growth_remark'],
                ];
            }


            Db::name('user')->where('id', $post_data['id'])->update($update_data);
            foreach ($account_log as $item => $value){
                AccountLogLogic::AccountRecord($post_data['id'],$value['number'],$value['change_type'],$value['source_type'],$value['remark']);
            }
            if (isset($post_data['growth_handle'])) {
                UserLevelLogic::updateUserLevel($post_data['id']);
            }
            Db::commit();
            return true;
        } catch (Exception $e) {
            Db::rollback();
            return false;
        }
    }


    //todo 会员等级调整记录待完成
    public static function adjustLevel($post_data){

        return Db::name('user')->where('id',$post_data['id'])->update(['level'=>$post_data['level']]);
    }
    /*
     * 获取分组
     */
    public static function getGroupList(){
        return Db::name('user_group')->where(['del'=>0])->field('id,name')->select();
    }

    /*
     * 获取等级
     */
    public static function getLevelList(){
        return Db::name('user_level')->where(['del'=>0])->field('id,name')->select();
    }

    /*
     * 编辑会员
     */
    public static function edit($post){
        $user = new User();
        $post['update_time'] = time();
        $post['birthday'] = strtotime($post['birthday']);
        return $user->save($post,['id'=>$post['id']]);
    }

    public static function getList($get){
        switch ($get['type']){
            case 0:
                $order = new Order();
                $count = $order->alias('o')
                        ->where(['user_id'=>$get['user_id']])
                        ->where('order_status','not in',[Order::STATUS_CLOSE,Order::STATUS_WAIT_PAY])
                        ->count();

                $list = $order->alias('o')
                        ->where(['user_id'=>$get['user_id']])
                        ->where('order_status','not in',[Order::STATUS_CLOSE,Order::STATUS_WAIT_PAY])
                        ->page($get['page'],$get['limit'])
                        ->order('id desc')
                        ->field('o.id,order_sn,total_num,pay_time,total_amount,order_amount,discount_amount,
                                o.create_time,consignee,province,city,district,o.address,mobile')
                        ->select();

                break;
            case 1:
                $account_log =new AccountLog();
                $count = $account_log
                        ->where(['user_id'=>$get['user_id'],'source_type'=>AccountLog::integral_change])
                        ->count();
                $list = $account_log
                        ->where(['user_id'=>$get['user_id'],'source_type'=>AccountLog::integral_change])
                        ->page($get['page'],$get['limit'])
                        ->select();
                break;
            case 2:
                $account_log =new AccountLog();
                $count = $account_log
                        ->where(['user_id'=>$get['user_id'],'source_type'=>AccountLog::sign_in_integral])
                        ->count();
                $list = $account_log
                        ->where(['user_id'=>$get['user_id'],'source_type'=>AccountLog::sign_in_integral])
                        ->page($get['page'],$get['limit'])
                        ->select();
                break;
            case 3:
                $account_log = new AccountLog();
                $count = $account_log
                    ->where(['user_id'=>$get['user_id'],'source_type'=>AccountLog::money_change])
                    ->count();
                $list = $account_log
                    ->where(['user_id'=>$get['user_id'],'source_type'=>AccountLog::money_change])
                    ->page($get['page'],$get['limit'])
                    ->select();
                break;
            case 4:
                $count = 1;
                $first_leader = Db::name('user')->where(['id'=>$get['user_id']])->value('first_leader');
                $list = [];
                if($first_leader){
                    $user = new User();
                    $list = $user
                            ->where(['id'=>$first_leader])
                            ->field('id,sn,nickname,mobile,avatar,level,sex,create_time,total_order_amount,user_money,user_integral')
                            ->select();
                    $level_list = Db::name('user_level')->where(['del'=>0])->column('name','id');
                    foreach ($list as &$item) {
                        $item['level_name'] = '-';
                        if(isset($level_list[$item['level']])){
                            $item['level_name'] = $level_list[$item['level']];
                        }
                    }
                }
                break;
            case 5:
                $count = Db::name('user_address')
                            ->where(['user_id'=>$get['user_id'],'del'=>0])
                            ->count();
                $list = Db::name('user_address')
                            ->where(['user_id'=>$get['user_id'],'del'=>0])
                            ->select();
                foreach ($list as &$item){
                    $item['default'] = '否';
                    $region = Db::name('dev_region')
                        ->where('id', 'IN', [$item['province_id'], $item['city_id'], $item['district_id']])->order('level asc')->column('name');
                    $region_desc = implode('', $region);
                    $item['address'] = $region_desc.$item['address'];
                    if($item['is_default']){
                        $item['default'] = '是';
                    }
                }
                break;
        }

        return ['count'=>$count , 'lists'=>$list];
    }


}