
// +----------------------------------------------------------------------
// | LikeShop有特色的全开源社交分销电商系统
// +----------------------------------------------------------------------
// | 欢迎阅读学习系统程序代码，建议反馈是我们前进的动力
// | 商业用途务必购买系统授权，以免引起不必要的法律纠纷
// | 禁止对系统程序代码以任何目的，任何形式的再发布
// | 微信公众号：好象科技
// | 访问官网：http://www.likemarket.net
// | 访问社区：http://home.likemarket.net
// | 访问手册：http://doc.likemarket.net
// | 好象科技开发团队 版权所有 拥有最终解释权
// +----------------------------------------------------------------------
// | Author: LikeShopTeam
// +----------------------------------------------------------------------


import Vue from 'vue'
import Vuex from 'vuex'
import createVuexAlong from 'vuex-along'
import {getCartNum} from '@/api/store'
Vue.use(Vuex)

export default new Vuex.Store({
    state: {
        token: "",
        cartNum: ''
    },
    mutations: {
        LOGIN(state, data) {
            state.token = data.token;
        },
        LOGOUT(state, ) {
            state.token = null;
            state.cartNum = ""
        },
        SETCARTNUM(state, num) {
            state.cartNum = num
        }
    },
    actions: {
        getCartNum({ state, commit }) {
            if (!state.token) return
            getCartNum().then(res => {
                if (res.code == 1) {
                    commit('SETCARTNUM', res.data.num)
                }
            })
        }
    },
    modules: {
    },
    plugins: [createVuexAlong()]
})
