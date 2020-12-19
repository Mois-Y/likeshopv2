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

namespace app\admin\validate;

use think\Validate;

class HelpCategory extends Validate
{

    protected $rule = [
        'id' => 'require|CheckHelp',
        'name' => 'require|unique:help_category,name^del',
        'is_show' => 'require'
    ];

    protected $message = [
        'id.require' => 'id不可为空',
        'name.require' => '分类名称不能为空！',
        'name.unique' => '分类名称已存在',
        'is_show.require' => '请选择显示状态'
    ];

    protected function sceneAdd()
    {
        $this->only(['name']);

    }

    protected function sceneEdit()
    {
        $this->only(['id', 'name'])
            ->remove('id', 'CheckHelp');
    }

    public function sceneDel()
    {
        $this->only(['id']);
    }

    protected function CheckHelp($value, $rule, $data)
    {
        if (\app\admin\model\Help::get(['cid' => $value, 'del' => 0])) {
            return '该分类下有文章，不可删除';
        }
        return true;
    }

}