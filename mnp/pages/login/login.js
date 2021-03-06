// +----------------------------------------------------------------------
// | LikeShop100%开源免费商用电商系统
// +----------------------------------------------------------------------
// | 欢迎阅读学习系统程序代码，建议反馈是我们前进的动力
// | 开源版本可自由商用，可去除界面版权logo
// | 商业版本务必购买商业授权，以免引起法律纠纷
// | 禁止对系统程序代码以任何目的，任何形式的再发布
// | Gitee下载：https://gitee.com/likemarket/likeshopv2
// | 访问官网：https://www.likemarket.net
// | 访问社区：https://home.likemarket.net
// | 访问手册：http://doc.likemarket.net
// | 微信公众号：好象科技
// | 好象科技开发团队 版权所有 拥有最终解释权
// +----------------------------------------------------------------------
// | Author: LikeShopTeam
// +----------------------------------------------------------------------
import { wxLogin } from '../../utils/wxutil'
import { Tips } from '../../utils/util'
const app = getApp()
Page({

    /**
     * 页面的初始数据
     */
    data: {

    },
    getUserInfo(e) {
        if (!e.detail.userInfo) return
        wx.showLoading({
            title: '登录中...',
            mask: true
        })
        let { encryptedData: encrypted_data, iv } = e.detail
        wxLogin({
            encrypted_data,
            iv
        }).then(res => {
            wx.hideLoading()
            if (res.code == 1) {
                app.store.setState({
                    isLogin: true,
                });
                let { token, nickname, avatar } = res.data
                wx.setStorageSync('token', token)
                wx.setStorageSync('nickname', nickname)
                wx.setStorageSync('avatar', avatar)
               
                wx.navigateBack()
            }else {
                Tips({title: '登录失败，请稍后再试' })
            }
        })
    },
    /**
     * 生命周期函数--监听页面加载
     */
    onLoad: function (options) {

    },

    /**
     * 生命周期函数--监听页面初次渲染完成
     */
    onReady: function () {

    },

    /**
     * 生命周期函数--监听页面显示
     */
    onShow: function () {

    },

    /**
     * 生命周期函数--监听页面隐藏
     */
    onHide: function () {

    },

    /**
     * 生命周期函数--监听页面卸载
     */
    onUnload: function () {

    },

    /**
     * 页面相关事件处理函数--监听用户下拉动作
     */
    onPullDownRefresh: function () {

    },

    /**
     * 页面上拉触底事件的处理函数
     */
    onReachBottom: function () {

    },

    /**
     * 用户点击右上角分享
     */
    onShareAppMessage: function () {

    }
})