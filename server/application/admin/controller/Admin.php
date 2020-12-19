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


namespace app\admin\controller;


use app\admin\logic\AdminLogic;

class Admin extends AdminBase
{

    /**
     * 管理员列表
     * @return mixed
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function lists()
    {
        if ($this->request->isAjax()) {
            $get = $this->request->get();
            $this->success('',  AdminLogic::lists($get));
        }

        $this->assign('role_lists', AdminLogic::roleLists());
        return $this->fetch();
    }

    /**
     * 添加管理员
     * @return mixed
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function add()
    {
        if ($this->request->isAjax()) {
            $post = $this->request->post();
            $post['disable'] = isset($post['disable']) && $post['disable'] == 'on' ? 0 : 1;
            $result = $this->validate($post, 'app\admin\validate\Admin.add');
            if ($result === true) {
                AdminLogic::addAdmin($post);
                $this->success('修改成功');
            }
            $this->error($result);
        }
        $this->assign('role_lists', AdminLogic::roleLists());
        return $this->fetch();
    }

    /**
     * 编辑管理员
     * @param string $admin_id
     * @return mixed
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function edit($admin_id = '')
    {
        if ($this->request->isAjax()) {
            $post = $this->request->post();
            $post['disable'] = isset($post['disable']) && $post['disable'] == 'on' ? 0 : 1;
            $post['del'] = 0;
            $result = $this->validate($post, 'app\admin\validate\Admin.edit');
            if ($result === true) {
                AdminLogic::editAdmin($post);
                $this->success('修改成功');
            }
            $this->error($result);
        }

        $this->assign('info', AdminLogic::info($admin_id));
        $this->assign('role_lists', AdminLogic::roleLists());
        return $this->fetch();
    }

    /**
     * 删除管理员
     * @param $admin_id
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public function del($admin_id)
    {
        if ($this->request->isAjax()) {
            $result = AdminLogic::delAdmin($admin_id);
            if ($result) {
                $this->success('删除成功');
            }
            $this->error('删除失败');
        }
    }

}