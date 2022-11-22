import {

    REQUEST_LEND_FROM_SPRING,
    REQUEST_LEND_LIST_FROM_SPRING,

    REQUEST_LOGIN_USER_FROM_SPRING,
    REQUEST_LOGIN_USER_NICKNAME_FROM_SPRING,

    USER_LOGIN_CHECK,
    IS_AUTHENTICATED,

    REQUEST_COMMUNITY_LIST_FROM_SPRING,
    REQUEST_COMMUNITY_FROM_SPRING,

    REQUEST_REVIEW_LIST_FROM_SPRING,
    REQUEST_REVIEW_FROM_SPRING,

} from './mutation-types'

export default {

    [REQUEST_LOGIN_USER_FROM_SPRING] (state, passingData) {
        state.loginUser = passingData
    },

    [REQUEST_LOGIN_USER_NICKNAME_FROM_SPRING] (state, passingData) {
        state.loginUserNickname = passingData
    },


    [REQUEST_LEND_LIST_FROM_SPRING] (state, passingData) {
        state.lends = passingData
    },
    [REQUEST_LEND_FROM_SPRING] (state, passingData) {
        state.lend = passingData
    },

    [REQUEST_COMMUNITY_LIST_FROM_SPRING] (state, passingData) {
        state.communityBoards = passingData
    },
    [REQUEST_COMMUNITY_FROM_SPRING] (state, passingData) {
        state.communityBoard = passingData
    },

    [REQUEST_REVIEW_LIST_FROM_SPRING] (state, passingData) {
        state.reviewBoards = passingData
    },
    [REQUEST_REVIEW_FROM_SPRING] (state, passingData) {
        state.reviewBoard = passingData
    },

    [IS_AUTHENTICATED] (state, passingData) {
        state.isAuthenticated = passingData
    },

    [USER_LOGIN_CHECK] (state, passingData) {
        state.userLoginCheck = passingData
    },


}