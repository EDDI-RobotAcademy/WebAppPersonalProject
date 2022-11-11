import {REQUEST_BESTSELLER_LIST, REQUEST_EMAIL_PASS_CHECK, REQUEST_LOGGED_IN_USER_PROFILE} from './mutation-types'

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

        const { email, password, nickName } = payload

        return axios.post('http://localhost:7776/member/register', { email, password, nickName })
            .then((res) => {
                if(res.data) {
                    alert("회원 가입이 완료되었습니다. 메인으로 돌아가 로그인 해주세요.")
                    router.push({ name: 'SignIn' });
                }
            })
            .catch((error) => {
                alert(error)
            })
    },

    requestLoggedInUserProfileToSpring ( { commit }, payload) {
        console.log('requestLoggedInUserProfileToSpring')

        const { userToken } = payload
        return axios.post(`http://localhost:7776/member/login-user-nickname/${userToken}`, { userToken })
            .then((res) => {
                if(res.data) {
                    commit(REQUEST_LOGGED_IN_USER_PROFILE, res.data)
                }
            }).catch((error) => {
                console.log(error)
            })
    },

    requestBestSellerListToAladin ( { commit } ) {
        console.log("requestBestSellerListToAladin")

        return axios.get('https://cors-anywhere.herokuapp.com/https://www.aladin.co.kr/ttb/api/ItemList.aspx?ttbkey=[ttb키]&QueryType=Bestseller&MaxResults=10&start=1&SearchTarget=Book&output=js&Version=20131101')
            .then((res) => {
                commit(REQUEST_BESTSELLER_LIST, res.data.item)
            }).catch((error) => {
                console.log(error)
            })
    },

    // eslint-disable-next-line no-empty-pattern
    requestWriteBoardToSpring ( { }, payload ) {
        console.log("requestWriteBoardToSpring")
        const { category, title, contents, memberEmail } = payload

        return axios.post('http://localhost:7776/board/write/', {category, title, contents, memberEmail})
            .then((res) => {
                if(res.data == true) {
                    alert("게시글이 등록되었습니다!")
                } else {
                    alert("알 수 없는 오류입니다!")
                }
            }).catch((error) => {
                console.log(error.message)
            })

    },

    requestAllCommunityBoardListTOSpring( { commit } ) {
        console.log("requestAllCommunityBoardListTOSpring()")

        return axios.get('http://localhost:7776/board/list-temporary')
            .then((res) => {
                commit(REQUEST_COMMUNITY_MAIN_BOARD_LIST, res.data)
            }).catch((error) => {
                console.log(error.message)
            })
    },
}