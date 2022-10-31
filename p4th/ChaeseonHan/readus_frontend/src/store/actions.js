import {REQUEST_LOGIN_FROM_SPRING} from './mutation-types'

import axios from 'axios'
import Vue from 'vue';
import Vuex from 'vuex'
import cookies from "vue-cookies";
import store from "@/store";
Vue.use(cookies, Vuex, store)

export default {

    // eslint-disable-next-line no-empty-pattern
    requestSignInToSpring({ commit }, payload ) {
        console.log("requestSignInToSpring()")

        const { email, password } = payload

        return axios.post('http://localhost:7776/member/login', {email, password})
            .then((res) => {
                if (res.data) {
                    commit(REQUEST_LOGIN_FROM_SPRING, true)

                } else {
                    alert("아이디 혹은 비밀번호가 존재하지 않거나 틀렸습니다!")
                }
            })
            .catch((error) => {
                alert(error)
            })

    }, // requestSignInToSpring



}