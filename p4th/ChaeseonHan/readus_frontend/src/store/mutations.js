import {
    REQUEST_BESTSELLER_LIST, REQUEST_BOARD_TO_READ,
    REQUEST_COMMUNITY_MAIN_BOARD_LIST,
    REQUEST_EMAIL_PASS_CHECK,
    REQUEST_LOGGED_IN_USER_PROFILE, REQUEST_MEMBER_WRITE_BOARD_LIST, REQUEST_SEARCH_BOARD_WITH_TITLE_AND_KEYWORD,
} from './mutation-types'

export default {

    [REQUEST_EMAIL_PASS_CHECK] (state, passingData) {
        state.unDuplicateEmailPass = passingData
    },

    [REQUEST_LOGGED_IN_USER_PROFILE] (state, passingData) {
        state.loginUserProfile = passingData
    },

    [REQUEST_BESTSELLER_LIST] (state, passingData) {
        state.aladinBestSeller = passingData
    },

    [REQUEST_COMMUNITY_MAIN_BOARD_LIST] (state, passingData){
        state.communityMainBoardList = passingData
    },

    [REQUEST_BOARD_TO_READ] (state, passingData){
        state.communityBoard = passingData
    },

    [REQUEST_SEARCH_BOARD_WITH_TITLE_AND_KEYWORD] (state, passingData) {
        state.searchResultBoard = passingData
    },

    [REQUEST_MEMBER_WRITE_BOARD_LIST] (state, passingData) {
        state.memberWriteBoardList = passingData
    }

}