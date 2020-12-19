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

namespace app\common\logic;

use app\common\model\SmsLog;

class SmsLogic
{
    protected $message_key = '';
    protected $mobile = '';
    protected $code = '';
    protected $sms = '';
    protected $indate = 300;//todo 验证码有效期

    public function __construct($key, $mobile, $code)
    {
        $this->message_key = $key;
        $this->mobile = $mobile;
        $this->code = $code;
        $sms_Log = new SmsLog();
        $sms = $sms_Log
            ->where(['message_key' => $this->message_key, 'mobile' => $this->mobile, 'is_verify' => 0])
            ->order('id desc')
            ->field('id,code,send_time')
            ->find();

        $this->sms = $sms;
    }

    //检查验证码
    public function checkCode()
    {
        if (!isset($this->sms) || $this->sms->code !== $this->code) {
            return '验证码错误';
        }
        $send_time = $this->sms->getData('send_time');

        $now = time();
        if ($this->sms->code === $this->code && $send_time + $this->indate < $now) {
            return '验证码已过期';
        }
        return true;

    }

    //标记已验证
    public function cancelCode()
    {
        if (empty($this->sms)) {
            return false;
        }
        unset($this->sms->send_time);
        $this->sms->is_verify = 1;
        $this->sms->update_time = time();
        return $this->sms->save();
    }
}