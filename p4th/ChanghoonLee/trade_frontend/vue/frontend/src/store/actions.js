import {
    REQUEST_BUY_BARAM_COMMENT_LIST_FROM_SPRING,
    REQUEST_BUY_BARAM_FROM_SPRING,
    REQUEST_BUY_BARAM_LIST_FROM_SPRING,
    REQUEST_BUY_DIABLO_COMMENT_LIST_FROM_SPRING,
    REQUEST_BUY_DIABLO_FROM_SPRING,
    REQUEST_BUY_DIABLO_LIST_FROM_SPRING,
    REQUEST_CHECK_DUPLICATE_EMAIL_TO_SPRING,
    REQUEST_SELL_BARAM_COMMENT_LIST_FROM_SPRING,
    REQUEST_SELL_BARAM_FROM_SPRING,
    REQUEST_SELL_BARAM_LIST_FROM_SPRING,
    REQUEST_SELL_DIABLO_COMMENT_LIST_FROM_SPRING,
    REQUEST_SELL_DIABLO_FROM_SPRING,
    REQUEST_SELL_DIABLO_LIST_FROM_SPRING

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



    requestBuyBaramCommentListFromSpring ({ commit }, buyBaramNo) {
        console.log('requestBuyBaramCommentListFromSpring()')

        return axios.get(`http://localhost:7777/trade-item/boards/buy/baram/comment/${buyBaramNo}`)
            .then((res) => {
                commit(REQUEST_BUY_BARAM_COMMENT_LIST_FROM_SPRING, res.data)
            })
    },

    //eslint-disable-next-line no-empty-pattern
    requestBuyBaramCommentRegisterToSpring ({ }, payload) {
        console.log('requestBuyBaramCommentRegisterToSpring()')

        const { comment, commentWriter } = payload
        return axios.post('http://localhost:7777/trade-item/boards/buy/baram/comment/register',
            { comment, commentWriter })
            .then(() => {
                alert('댓글 등록 성공')
            })
    },

    requestSellBaramListFromSpring ({ commit }) {
        console.log('requestSellBaramListFromSpring()')

        return axios.get('http://localhost:7777/trade-item/boards/sell/baram/list')
            .then((res) => {
                commit(REQUEST_SELL_BARAM_LIST_FROM_SPRING, res.data)
            })
    },

    requestSellBaramFromSpring ({ commit }, sellBaramNo) {
        console.log('requestSellBaramFromSpring()')

        return axios.get(`http://localhost:7777/trade-item/boards/sell/baram/${sellBaramNo}`)
            .then((res) => {
                commit(REQUEST_SELL_BARAM_FROM_SPRING, res.data)
            })
    },

    //eslint-disable-next-line no-empty-pattern
    requestCreateSellBaramContentsToSpring ({ }, payload) {
        console.log('requestCreateSellBaramContentsToSpring()')

        const { title, content, writer } = payload
        return axios.post('http://localhost:7777/trade-item/boards/sell/baram/register',
            { title, content, writer })
            .then(() => {
                alert('게시물 등록 성공')
            })
    },

    // eslint-disable-next-line no-empty-pattern
    requestSellBaramModifyToSpring ({ }, payload) {
        console.log('requestSellBaramModifyToSpring()')

        const { title, content, sellBaramNo, writer, regDate } = payload

        return axios.put(`http://localhost:7777/trade-item/boards/sell/baram/${sellBaramNo}`,
            { title, content, writer, regDate })
            .then(() => {
                alert('수정 성공')
            })
    },

    // eslint-disable-next-line no-empty-pattern
    requestDeleteSellBaramToSpring ({ }, sellBaramNo) {
        console.log('requestDeleteBuyBaramToSpring()')

        return axios.delete(`http://localhost:7777/trade-item/boards/sell/baram/${sellBaramNo}`)
            .then(() => {
                alert('삭제 성공')
            })
    },



    requestSellBaramCommentListFromSpring ({ commit }, sellBaramNo) {
        console.log('requestBuyBaramCommentListFromSpring()')

        return axios.get(`http://localhost:7777/trade-item/boards/sell/baram/comment/${sellBaramNo}`)
            .then((res) => {
                commit(REQUEST_SELL_BARAM_COMMENT_LIST_FROM_SPRING, res.data)
            })
    },

    //eslint-disable-next-line no-empty-pattern
    requestSellBaramCommentRegisterToSpring ({ }, payload) {
        console.log('requestSellBaramCommentRegisterToSpring()')

        const { comment, commentWriter } = payload
        return axios.post('http://localhost:7777/trade-item/boards/sell/baram/comment/register',
            { comment, commentWriter })
            .then(() => {
                alert('댓글 등록 성공')
            })
    },

    requestBuyDiabloListFromSpring ({ commit }) {
        console.log('requestBuyDiabloListFromSpring()')

        return axios.get('http://localhost:7777/trade-item/boards/buy/diablo/list')
            .then((res) => {
                commit(REQUEST_BUY_DIABLO_LIST_FROM_SPRING, res.data)
            })
    },

    requestBuyDiabloFromSpring ({ commit }, buyDiabloNo) {
        console.log('requestBuyDiabloFromSpring()')

        return axios.get(`http://localhost:7777/trade-item/boards/buy/diablo/${buyDiabloNo}`)
            .then((res) => {
                commit(REQUEST_BUY_DIABLO_FROM_SPRING, res.data)
            })
    },

    //eslint-disable-next-line no-empty-pattern
    requestCreateBuyDiabloContentsToSpring ({ }, payload) {
        console.log('requestCreateBuyDiabloContentsToSpring()')

        const { title, content, writer } = payload
        return axios.post('http://localhost:7777/trade-item/boards/buy/diablo/register',
            { title, content, writer })
            .then(() => {
                alert('게시물 등록 성공')
            })
    },

    // eslint-disable-next-line no-empty-pattern
    requestBuyDiabloModifyToSpring ({ }, payload) {
        console.log('requestBuyDiabloModifyToSpring()')

        const { title, content, buyDiabloNo, writer, regDate } = payload

        return axios.put(`http://localhost:7777/trade-item/boards/buy/diablo/${buyDiabloNo}`,
            { title, content, writer, regDate })
            .then(() => {
                alert('수정 성공')
            })
    },

    // eslint-disable-next-line no-empty-pattern
    requestDeleteBuyDiabloToSpring ({ }, buyDiabloNo) {
        console.log('requestDeleteBuyDiabloToSpring()')

        return axios.delete(`http://localhost:7777/trade-item/boards/buy/diablo/${buyDiabloNo}`)
            .then(() => {
                alert('삭제 성공')
            })
    },



    requestBuyDiabloCommentListFromSpring ({ commit }, buyDiabloNo) {
        console.log('requestBuyDiabloCommentListFromSpring()')

        return axios.get(`http://localhost:7777/trade-item/boards/buy/diablo/comment/${buyDiabloNo}`)
            .then((res) => {
                commit(REQUEST_BUY_DIABLO_COMMENT_LIST_FROM_SPRING, res.data)
            })
    },

    //eslint-disable-next-line no-empty-pattern
    requestBuyDiabloCommentRegisterToSpring ({ }, payload) {
        console.log('requestBuyDiabloCommentRegisterToSpring()')

        const { comment, commentWriter } = payload
        return axios.post('http://localhost:7777/trade-item/boards/buy/diablo/comment/register',
            { comment, commentWriter })
            .then(() => {
                alert('댓글 등록 성공')
            })
    },

    requestSellDiabloListFromSpring ({ commit }) {
        console.log('requestSellDiabloListFromSpring()')

        return axios.get('http://localhost:7777/trade-item/boards/sell/diablo/list')
            .then((res) => {
                commit(REQUEST_SELL_DIABLO_LIST_FROM_SPRING, res.data)
            })
    },

    requestSellDiabloFromSpring ({ commit }, sellDiabloNo) {
        console.log('requestSellDiabloFromSpring()')

        return axios.get(`http://localhost:7777/trade-item/boards/sell/diablo/${sellDiabloNo}`)
            .then((res) => {
                commit(REQUEST_SELL_DIABLO_FROM_SPRING, res.data)
            })
    },

    //eslint-disable-next-line no-empty-pattern
    requestCreateSellDiabloContentsToSpring ({ }, payload) {
        console.log('requestCreateSellDiabloContentsToSpring()')

        const { title, content, writer } = payload
        return axios.post('http://localhost:7777/trade-item/boards/sell/diablo/register',
            { title, content, writer })
            .then(() => {
                alert('게시물 등록 성공')
            })
    },

    // eslint-disable-next-line no-empty-pattern
    requestSellDiabloModifyToSpring ({ }, payload) {
        console.log('requestSellDiabloModifyToSpring()')

        const { title, content, sellDiabloNo, writer, regDate } = payload

        return axios.put(`http://localhost:7777/trade-item/boards/sell/diablo/${sellDiabloNo}`,
            { title, content, writer, regDate })
            .then(() => {
                alert('수정 성공')
            })
    },

    // eslint-disable-next-line no-empty-pattern
    requestDeleteSellDiabloToSpring ({ }, sellDiabloNo) {
        console.log('requestDeleteBuyDiabloToSpring()')

        return axios.delete(`http://localhost:7777/trade-item/boards/sell/diablo/${sellDiabloNo}`)
            .then(() => {
                alert('삭제 성공')
            })
    },



    requestSellDiabloCommentListFromSpring ({ commit }, sellDiabloNo) {
        console.log('requestBuyDiabloCommentListFromSpring()')

        return axios.get(`http://localhost:7777/trade-item/boards/sell/diablo/comment/${sellDiabloNo}`)
            .then((res) => {
                commit(REQUEST_SELL_DIABLO_COMMENT_LIST_FROM_SPRING, res.data)
            })
    },

    //eslint-disable-next-line no-empty-pattern
    requestSellDiabloCommentRegisterToSpring ({ }, payload) {
        console.log('requestSellDiabloCommentRegisterToSpring()')

        const { comment, commentWriter } = payload
        return axios.post('http://localhost:7777/trade-item/boards/sell/diablo/comment/register',
            { comment, commentWriter })
            .then(() => {
                alert('댓글 등록 성공')
            })
    },
}