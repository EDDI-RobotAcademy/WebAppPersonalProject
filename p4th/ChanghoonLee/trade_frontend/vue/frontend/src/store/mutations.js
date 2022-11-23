import {
    REQUEST_BUY_BARAM_FROM_SPRING,
    REQUEST_BUY_BARAM_LIST_FROM_SPRING,
    REQUEST_CHECK_DUPLICATE_EMAIL_TO_SPRING,

    REQUEST_BUY_BARAM_COMMENT_LIST_FROM_SPRING,

} from './mutation-types'

export default {
    [REQUEST_CHECK_DUPLICATE_EMAIL_TO_SPRING] (state, passingData) {
        state.checkDuplicateEmail = passingData
    },
    [REQUEST_BUY_BARAM_LIST_FROM_SPRING] (state, passingData) {
        state.buyBaramBoards = passingData
    },
    [REQUEST_BUY_BARAM_FROM_SPRING] (state, passingData) {
        state.buyBaramBoard = passingData
    },
    [REQUEST_BUY_BARAM_COMMENT_LIST_FROM_SPRING] (state, passingData) {
        state.buyBaramComments = passingData
    },

}