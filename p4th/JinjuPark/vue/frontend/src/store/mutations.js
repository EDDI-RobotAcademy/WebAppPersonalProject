import {
    REQUEST_DIARY_BOARD_LIST_FROM_SPRING,
    REQUEST_DIARY_BOARD_FROM_SPRING,
    REQUEST_LOGIN_USER_FROM_SPRING,
    IS_AUTHENTICATED, USER_LOGIN_CHECK,
    THUMB_STATUS_COUNT,
    REQUEST_COMMENT_LIST_FROM_SPRING,
    VIDEOS, MY_SAVE_VIDEOS_LIST,
    REQUEST_IMAGES_FROM_SPRING
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

    [THUMB_STATUS_COUNT] (state, passingData) {
        state.thumbStatusCount = passingData
    },

    [REQUEST_COMMENT_LIST_FROM_SPRING] (state, passingData) {
        state.diaryComment = passingData
    },

    [VIDEOS] (state, passingData) {
        state.videos = passingData
    },

    [MY_SAVE_VIDEOS_LIST] (state, passingData) {
        state.mySaveVideos = passingData
    },

    [REQUEST_IMAGES_FROM_SPRING] (state, passingData) {
        state.diaryImages = passingData
    },

}

