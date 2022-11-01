import {REQUEST_EMAIL_PASS_CHECK} from './mutation-types'

import axios from 'axios'
import Vue from 'vue';
import Vuex from 'vuex'
import cookies from "vue-cookies";
import store from "@/store";
import router from "@/router";
Vue.use(cookies, Vuex, store)

export default {

    // eslint-disable-next-line no-empty-pattern
    requestCheckDuplicateEmailToSpring({ commit }, payload ) {
        console.log('requestCheck()')

        const{ email } = payload

        return axios.post(`http://localhost:7776/member/check-email/${email}`)
            .then((res) => {
                if(res.data) {
                    alert("사용 가능한 이메일입니다.")
                    commit(REQUEST_EMAIL_PASS_CHECK, res.data)
                } else {
                    alert("이미 등록되어있는 이메일입니다.")
                }
            })

    }, // requestCheckDuplicateEmailToSpring

    // eslint-disable-next-line no-empty-pattern
    requestMemberRegisterToSpring( { }, payload) {
        console.log('requestMemberRegisterToSpring')

        const { email, password, nickname } = payload

        return axios.post('http://localhost:7776/member/register/', { email, password, nickname })
            .then((res) => {
                if(res.data) {
                    alert("회원 가입이 완료되었습니다. 메인으로 돌아가 로그인 해주세요.")
                    router.push({ name: 'SignIn' });
                }
            })
            .catch((error) => {
                alert(error)
            })
    }


}