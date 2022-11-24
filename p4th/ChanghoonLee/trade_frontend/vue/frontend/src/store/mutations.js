import {
    REQUEST_CHECK_DUPLICATE_EMAIL_TO_SPRING,

    REQUEST_BUY_BARAM_FROM_SPRING,
    REQUEST_BUY_BARAM_LIST_FROM_SPRING,
    REQUEST_BUY_BARAM_COMMENT_LIST_FROM_SPRING,

    REQUEST_SELL_BARAM_FROM_SPRING,
    REQUEST_SELL_BARAM_LIST_FROM_SPRING,
    REQUEST_SELL_BARAM_COMMENT_LIST_FROM_SPRING,

    REQUEST_BUY_DIABLO_FROM_SPRING,
    REQUEST_BUY_DIABLO_LIST_FROM_SPRING,
    REQUEST_BUY_DIABLO_COMMENT_LIST_FROM_SPRING,

    REQUEST_SELL_DIABLO_FROM_SPRING,
    REQUEST_SELL_DIABLO_LIST_FROM_SPRING,
    REQUEST_SELL_DIABLO_COMMENT_LIST_FROM_SPRING,

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

    [REQUEST_SELL_BARAM_LIST_FROM_SPRING] (state, passingData) {
        state.sellBaramBoards = passingData
    },
    [REQUEST_SELL_BARAM_FROM_SPRING] (state, passingData) {
        state.sellBaramBoard = passingData
    },
    [REQUEST_SELL_BARAM_COMMENT_LIST_FROM_SPRING] (state, passingData) {
        state.sellBaramComments = passingData
    },

    [REQUEST_BUY_DIABLO_LIST_FROM_SPRING] (state, passingData) {
        state.buyDiabloBoards = passingData
    },
    [REQUEST_BUY_DIABLO_FROM_SPRING] (state, passingData) {
        state.buyDiabloBoard = passingData
    },
    [REQUEST_BUY_DIABLO_COMMENT_LIST_FROM_SPRING] (state, passingData) {
        state.buyDiabloComments = passingData
    },

    [REQUEST_SELL_DIABLO_LIST_FROM_SPRING] (state, passingData) {
        state.sellDiabloBoards = passingData
    },
    [REQUEST_SELL_DIABLO_FROM_SPRING] (state, passingData) {
        state.sellDiabloBoard = passingData
    },
    [REQUEST_SELL_DIABLO_COMMENT_LIST_FROM_SPRING] (state, passingData) {
        state.sellDiabloComments = passingData
    },

}