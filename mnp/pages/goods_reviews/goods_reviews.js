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
import { baseURL } from '../../config'
import { goodsComment, getCommentInfo } from '../../api/user'
import { Tips } from '../../utils/util';
Page({

    /**
     * 页面的初始数据
     */
    data: {
        goodsRate: 0,
        descRate: 0,
        serverRate: 0,
        deliveryRate: 0,
        goodsRateDesc: "",
        fileList: [],
        goods: [],
        comment: ''
    },
    onChange(e) {
        let {type} = e.currentTarget.dataset
        this.setData({
            [type]: e.detail
        })
    },
    goodsRateChange: function (e) {
        let num = e.detail
        let goodsRateDesc = ""
        if (e.detail <= 2) {
            goodsRateDesc = "差评"
        } else if (e.detail == 3) {
            goodsRateDesc = "中评"
        } else {
            goodsRateDesc = "好评"
        }
        this.setData({
            goodsRate: num,
            goodsRateDesc
        })
    },
    onSubmit() {
        let { goodsRate,fileList, comment, deliveryRate, descRate, serverRate, } = this.data
        let image = fileList.map(item => item.base_url)
        if(!goodsRate) return Tips({title: '请对商品进行评分'})
        if(!descRate) return Tips({title: '请对描述相符进行评分'})
        if(!serverRate) return Tips({title: '请对服务态度进行评分'})
        if(!deliveryRate) return Tips({title: '请对配送服务进行评分'})
        goodsComment({
            id: parseInt(this.id),
            goods_comment: goodsRate,
            service_comment: serverRate,
            express_comment: deliveryRate,
            description_comment: descRate,
            comment,
            image
        }).then(res => {
            if(res.code == 1) {
                Tips({title: '评价成功'}, { tab: 5, url: '/pages/goods_comment_list/goods_comment_list?type=1' })
            }
        })
    },
    onInput(e) {
        this.setData({
            comment: e.detail.value
        })
    },
    /**
     * 生命周期函数--监听页面加载
     */
    onLoad: function (options) {
        this.id = options.id
        this.$getCommentInfo()
    },
    $getCommentInfo() {
        getCommentInfo({
            id: this.id
        }).then(res => {
            if(res.code == 1) {
                this.data.goods.push(res.data)
                this.setData({
                    goods: this.data.goods
                })
            }
        })
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

    },
    afterRead(e) {
        const { file } = e.detail;
        wx.showLoading({
            title: '正在上传中...',
            mask: true
        })
        let uploadArr = file.map(item => {
            return this.uploadFile(item.path)
        })
        Promise.all(uploadArr).then(res => {
            const {fileList = []} = this.data
            fileList.push(...res)
            wx.hideLoading()
            this.setData({
                fileList
            })
        })
    },
    uploadFile(path) {
        return new Promise(resolve => {
            wx.uploadFile({
                url: baseURL + 'file/formimage',
                filePath: path,
                name: 'file',
                success: (res) => {
                    const { fileList = [] } = this.data;
                    let data = JSON.parse(res.data)
                    if(data.code == 1) {
                        resolve(data.data)
                        // fileList.push(data.data);
                        // console.log(fileList)
                        // this.setData({ fileList });
                    }
                },
                fail: () => {
                    wx.hideLoading()
                    Tips({title: '上传失败，请重新上传'})
                }
            });
        })
    },
    onDelete(e) {
        const { index } = e.detail;
        const { fileList } = this.data;
        fileList.splice(index, 1)
        this.setData({
            fileList
        })
    }
})