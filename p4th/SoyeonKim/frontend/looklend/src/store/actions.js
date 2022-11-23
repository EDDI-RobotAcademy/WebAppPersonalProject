import {
    REQUEST_LOGIN_USER_FROM_SPRING,
    REQUEST_LOGIN_USER_NICKNAME_FROM_SPRING,

    REQUEST_COMMUNITY_FROM_SPRING,
    REQUEST_COMMUNITY_LIST_FROM_SPRING,

    REQUEST_LEND_FROM_SPRING,
    REQUEST_LEND_LIST_FROM_SPRING,

    REQUEST_REVIEW_FROM_SPRING,
    REQUEST_REVIEW_LIST_FROM_SPRING

} from './mutation-types'

import axios from "axios";

export default {

    requestLoginUserFromSpring({commit}, payload) {
        console.log("로그인 유저 정보 가져오기")
        console.log("로그인 유저 정보 가져오기()")

        // const {} = payload
        return axios.post('http://localhost:7777/member/login-user', payload)
            .then((res) => {
                commit(REQUEST_LOGIN_USER_FROM_SPRING, res.data)
                console.log("로그인한 회원정보: " + res.data)
            })
    },

    async requestLoginUserNickNameFromSpring({commit}, payload) {
        const {replacedUserValue} = payload
        await axios.post(`http://localhost:7777/member/login-user-nickname/${replacedUserValue}`)
            .then((res) => {
                commit(REQUEST_LOGIN_USER_NICKNAME_FROM_SPRING, res.data)
                console.log("닉네임: " + res.data)
            })
            .catch((res) => {
                console.log(res.data)
            });
    },



    //lend
    requestLendListFromSpring ({ commit }) {
        console.log('requestLendListFromSpring()')

        return axios.get('http://localhost:7777/lendBoard/list')
            .then((res) => {
                commit(REQUEST_LEND_LIST_FROM_SPRING, res.data)
            })
    },
    requestLendFromSpring ({ commit }, lendNo) {
        console.log('requestLendFromSpring()')

        return axios.get(`http://localhost:7777/lendBoard/${lendNo}`)
            .then((res) => {
                commit(REQUEST_LEND_FROM_SPRING, res.data)
            })
    },
    // eslint-disable-next-line no-empty-pattern
    requestRegisterLendToSpring ({ }, payload) {
        console.log('requestRegisterLendToSpring()')

        const { title, content, writer, price } = payload
        return axios.post('http://localhost:7777/lendBoard/register',
            { title, content, writer, price })
            .then(() => {
                alert('게시글이 등록되었습니다')
            })
    },
    // eslint-disable-next-line no-empty-pattern
    requestDeleteLendToSpring ({ }, lendNo) {
        console.log('requestDeleteLendToSpring()')

        return axios.delete(`http://localhost:7777/lendBoard/${lendNo}`)
            .then(() => {
                alert('게시글이 삭제되었습니다')
            })
    },
    // eslint-disable-next-line no-empty-pattern
    requestModifyLendToSpring ({ }, payload) {
        console.log('requestModifyLendToSpring()')

        const { lendNo, title, writer, price, content, regDate } = payload

        return axios.put(`http://localhost:7777/lendBoard/${lendNo}`,
            { title, writer, price, content, regDate })
            .then(() => {
                alert('게시글이 수정되었습니다')
            })
    },


    //community
    requestCommunityListFromSpring ({ commit }) {
        console.log('requestCommunityListFromSpring()')

        return axios.get('http://localhost:7777/communityBoard/list')
            .then((res) => {
                commit(REQUEST_COMMUNITY_LIST_FROM_SPRING, res.data)
            })
    },
    requestCommunityFromSpring ({ commit }, communityNo) {
        console.log('requestCommunityFromSpring()')

        return axios.get(`http://localhost:7777/communityBoard/${communityNo}`)
            .then((res) => {
                commit(REQUEST_COMMUNITY_FROM_SPRING, res.data)
            })
    },
    // eslint-disable-next-line no-empty-pattern
    requestRegisterCommunityToSpring ({ }, payload) {
        console.log('requestRegisterCommunityToSpring()')

        const { type, title, content, writer } = payload
        return axios.post('http://localhost:7777/communityBoard/register',
            { type, title, content, writer })
            .then(() => {
                alert('게시글이 등록되었습니다')
            })
    },
    // eslint-disable-next-line no-empty-pattern
    requestDeleteCommunityToSpring ({ }, communityNo) {
        console.log('requestDeleteCommunityToSpring()')

        return axios.delete(`http://localhost:7777/communityBoard/${communityNo}`)
            .then(() => {
                alert('게시글이 삭제되었습니다')
            })
    },
    // eslint-disable-next-line no-empty-pattern
    requestModifyCommunityToSpring ({ }, payload) {
        console.log('requestModifyCommunityToSpring()')

        const { communityNo, type, title, writer, content, regDate } = payload

        return axios.put(`http://localhost:7777/communityBoard/${communityNo}`,
            { type, title, writer, content, regDate })
            .then(() => {
                alert('게시글이 수정되었습니다')
            })
    },


    //review
    requestReviewListFromSpring ({ commit }) {
        console.log('requestReviewListFromSpring()')

        return axios.get('http://localhost:7777/reviewBoard/list')
            .then((res) => {
                commit(REQUEST_REVIEW_LIST_FROM_SPRING, res.data)
            })
    },
    requestReviewFromSpring ({ commit }, reviewNo) {
        console.log('requestReviewFromSpring()')

        return axios.get(`http://localhost:7777/reviewBoard/${reviewNo}`)
            .then((res) => {
                commit(REQUEST_REVIEW_FROM_SPRING, res.data)
            })
    },
    // eslint-disable-next-line no-empty-pattern
    requestRegisterReviewToSpring ({ }, payload) {
        console.log('requestRegisterReviewToSpring()')

        const { type, title, content, writer } = payload
        return axios.post('http://localhost:7777/reviewBoard/register',
            { type, title, content, writer })
            .then(() => {
                alert('게시글이 등록되었습니다')
            })
    },
    // eslint-disable-next-line no-empty-pattern
    requestDeleteReviewToSpring ({ }, reviewNo) {
        console.log('requestDeleteCommunityToSpring()')

        return axios.delete(`http://localhost:7777/reviewBoard/${reviewNo}`)
            .then(() => {
                alert('게시글이 삭제되었습니다')
            })
    },
    // eslint-disable-next-line no-empty-pattern
    requestModifyReviewToSpring ({ }, payload) {
        console.log('requestModifyCommunityToSpring()')

        const { reviewNo, type, title, writer, content, regDate } = payload

        return axios.put(`http://localhost:7777/reviewBoard/${reviewNo}`,
            { type, title, writer, content, regDate })
            .then(() => {
                alert('게시글이 수정되었습니다')
            })
    },


}