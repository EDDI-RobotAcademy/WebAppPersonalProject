import {
    CHECK_DUPLICATE_EMAIL_TO_SPRING,
    CHECK_DUPLICATE_NICKNAME_TO_SPRING,
    REQUEST_CURRENT_USER_NICKNAME_FROM_SPRING
    // REQUEST_LOGIN_STATE_TO_SPRING
} from './mutation-types'

// import axios from "axios";

import axios from "axios";
import cookies from 'vue-cookies';
import Vue from 'vue';

Vue.use(cookies);

export default {
    // eslint-disable-next-line no-unused-vars
    checkDuplicateEmailToSpring({ commit }, payload) {

        const {email} = payload;

        axios.post(`http://localhost:7777/member/check-email/${email}`)
            .then((res) => {
                if (res.data) {
                    alert("사용 가능한 이메일입니다.")
                    commit(CHECK_DUPLICATE_EMAIL_TO_SPRING, res.data);
                } else {
                    alert("중복된 이메일입니다.")
                    commit(CHECK_DUPLICATE_EMAIL_TO_SPRING, res.data);
                }
            })
    },

    // eslint-disable-next-line no-empty-pattern
    signUpDataFromSpring({ }, payload) {

        const {email, password, nickName} = payload

        axios.post("http://localhost:7777/member/sign-up", {
            email, password, nickName
        })
            .then((res) => {
                alert("회원 가입 완료!" + res)
            })
            .catch((res) => {
                alert(res.response.data.message)
            })

    },
    requestCurrentUserNickNameFromSpring({ commit }) {
        axios.get('http://localhost:7777/member/get-nickName')
            .then((res) => {
                commit(REQUEST_CURRENT_USER_NICKNAME_FROM_SPRING, res.data)
            });
    },
    checkDuplicateNicknameToSpring({ commit }, payload) {
        const {nickName} = payload;

        axios.post(`http://localhost:7777/member/check-nickname/${nickName}`)
            .then((res) => {
                if (res.data) {
                    alert("사용 가능한 닉네임입니다.")
                    commit(CHECK_DUPLICATE_NICKNAME_TO_SPRING, res.data);

                } else {
                    alert("사용중인 닉네임입니다.")
                    commit(CHECK_DUPLICATE_NICKNAME_TO_SPRING, res.data);
                }
            })
    },

}