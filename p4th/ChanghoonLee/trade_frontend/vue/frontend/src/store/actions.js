import {
    REQUEST_BUY_BARAM_FROM_SPRING,
    REQUEST_BUY_BARAM_LIST_FROM_SPRING,
    REQUEST_CHECK_DUPLICATE_EMAIL_TO_SPRING

} from './mutation-types'
import axios from "axios";
import router from "@/router";

export default {
    requestCheckDuplicateEmailToSpring ({ commit }, payload) {
        console.log("requestBuyItem()")

        const{ email } = payload

        return axios.post(`http://localhost:7777/trade-item/member/check-email/${email}`)
            .then((res) => {
                if(res.data) {
                    alert("사용 가능한 이메일입니다.")
                    commit(REQUEST_CHECK_DUPLICATE_EMAIL_TO_SPRING, res.data)
                } else {
                    alert("이미 등록되어있는 이메일입니다.")
                }
            })
    },

    // eslint-disable-next-line no-empty-pattern
    requestMemberRegisterToSpring ({ }, payload) {
        console.log("requestMemberRegisterToSpring()")

        const { email, password, city, street, addressDetail, zipcode } = payload

        return axios.post(`http://localhost:7777/trade-item/member/sign-up`, {
            email, password, city, street, addressDetail, zipcode })
            .then((res) => {
                if(res.data) {
                    alert("회원가입이 완료되었습니다!")
                    router.push({name: 'SignInView'})
                } else {
                    alert("잘못된 입력입니다.")
                }
            })
    },

    requestBuyBaramListFromSpring ({ commit }) {
        console.log('requestBuyBaramListFromSpring()')

        return axios.get('http://localhost:7777/trade-item/boards/buy/baram/list')
            .then((res) => {
                commit(REQUEST_BUY_BARAM_LIST_FROM_SPRING, res.data)
            })
    },

    requestBuyBaramFromSpring ({ commit }, buyBaramNo) {
        console.log('requestBuyBaramFromSpring()')

        return axios.get(`http://localhost:7777/trade-item/boards/buy/baram/${buyBaramNo}`)
            .then((res) => {
                commit(REQUEST_BUY_BARAM_FROM_SPRING, res.data)
            })
    },

    //eslint-disable-next-line no-empty-pattern
    requestCreateBuyBaramContentsToSpring ({ }, payload) {
        console.log('requestCreateBuyBaramContentsToSpring()')

        const { title, content, writer } = payload
        return axios.post('http://localhost:7777/trade-item/boards/buy/baram/register',
            { title, content, writer })
            .then(() => {
                alert('게시물 등록 성공')
            })
    },

    // eslint-disable-next-line no-empty-pattern
    requestBuyBaramModifyToSpring ({ }, payload) {
        console.log('requestBuyBaramModifyToSpring()')

        const { title, content, buyBaramNo, writer, regDate } = payload

        return axios.put(`http://localhost:7777/trade-item/boards/buy/baram/${buyBaramNo}`,
            { title, content, writer, regDate })
            .then(() => {
                alert('수정 성공')
            })
    },

    // eslint-disable-next-line no-empty-pattern
    requestDeleteBuyBaramToSpring ({ }, buyBaramNo) {
        console.log('requestDeleteBuyBaramToSpring()')

        return axios.delete(`http://localhost:7777/trade-item/boards/buy/baram/${buyBaramNo}`)
            .then(() => {
                alert('삭제 성공')
            })
    },

}