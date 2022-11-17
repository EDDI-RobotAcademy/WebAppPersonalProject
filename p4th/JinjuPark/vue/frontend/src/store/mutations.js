import {
    REQUEST_DIARY_BOARD_LIST_FROM_SPRING,
    REQUEST_DIARY_BOARD_FROM_SPRING,
    REQUEST_LOGIN_USER_FROM_SPRING,
    IS_AUTHENTICATED, USER_LOGIN_CHECK,
} from './mutation-types'

export default {

    [REQUEST_DIARY_BOARD_LIST_FROM_SPRING] (state, passingData) {
        state.diaryBoards = passingData
    },

    [REQUEST_DIARY_BOARD_FROM_SPRING] (state, passingData) {
        state.diaryBoard = passingData
    },

    [REQUEST_LOGIN_USER_FROM_SPRING] (state, passingData) {
        state.loginUser = passingData
    },


    [IS_AUTHENTICATED] (state, passingData) {
        state.isAuthenticated = passingData
    },

    [USER_LOGIN_CHECK] (state, passingData) {
        state.userLoginCheck = passingData
    },

}