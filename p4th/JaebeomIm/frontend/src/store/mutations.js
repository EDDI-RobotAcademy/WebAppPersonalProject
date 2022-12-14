import {
    REQUEST_DATA_FROM_SPRING,
    REQUEST_RANDOM_SHOP_ITEM,
    REQUEST_MY_INVENTORY,
    REQUEST_CHARACTER_STATUS_FROM_SPRING,
    REQUEST_CHARACTER_STATUS_UPDATE_FROM_SPRING,
    REQUEST_BOARD_LIST_FROM_SPRING,
    REQUEST_BOARD_FROM_SPRING,
    REQUEST_PRODUCT_LIST_FROM_SPRING,
    REQUEST_PRODUCT_FROM_SPRING,
    REQUEST_FREE_BOARD_LIST_FROM_SPRING,
    REQUEST_FREE_BOARD_FROM_SPRING,
    REQUEST_QUESTION_BOARD_LIST_FROM_SPRING,
    REQUEST_QUESTION_BOARD_FROM_SPRING,
    REQUEST_TRADE_BOARD_LIST_FROM_SPRING,
    REQUEST_TRADE_BOARD_FROM_SPRING,
    REQUEST_GRADE_UP_BOARD_LIST_FROM_SPRING,
    REQUEST_GRADE_UP_BOARD_FROM_SPRING,
    REQUEST_ARCHER_BOARD_LIST_FROM_SPRING,
    REQUEST_ARCHER_BOARD_FROM_SPRING,
    REQUEST_MAGE_BOARD_LIST_FROM_SPRING,
    REQUEST_MAGE_BOARD_FROM_SPRING,
    REQUEST_PIRATE_BOARD_LIST_FROM_SPRING,
    REQUEST_PIRATE_BOARD_FROM_SPRING,
    REQUEST_THIEF_BOARD_LIST_FROM_SPRING,
    REQUEST_THIEF_BOARD_FROM_SPRING, REQUEST_WARRIOR_BOARD_LIST_FROM_SPRING, REQUEST_WARRIOR_BOARD_FROM_SPRING,
} from './mutation-types'

export default {
    [REQUEST_DATA_FROM_SPRING] (state, passingData) {
        state.springFromVueTestValue = passingData
    },
    [REQUEST_RANDOM_SHOP_ITEM] (state, passingData) {
        state.randomShopItem = passingData
    },
    [REQUEST_MY_INVENTORY] (state, passingData) {
        state.myInventory = passingData
    },
    [REQUEST_CHARACTER_STATUS_FROM_SPRING] (state, passingData) {
        state.characterStatus = passingData
    },
    [REQUEST_CHARACTER_STATUS_UPDATE_FROM_SPRING] (state, passingData) {
        state.characterStatusUpdateFlag = passingData
    },
    [REQUEST_BOARD_LIST_FROM_SPRING] (state, passingData) {
        state.boards = passingData
    },
    [REQUEST_BOARD_FROM_SPRING] (state, passingData) {
        state.board = passingData
    },
    [REQUEST_PRODUCT_LIST_FROM_SPRING] (state, passingData) {
        state.products = passingData
    },
    [REQUEST_PRODUCT_FROM_SPRING] (state, passingData) {
        state.product = passingData
    },
    [REQUEST_FREE_BOARD_LIST_FROM_SPRING] (state, passingData) {
        state.freeBoards = passingData
    },
    [REQUEST_FREE_BOARD_FROM_SPRING] (state, passingData) {
        state.freeBoard = passingData
    },

    [REQUEST_QUESTION_BOARD_LIST_FROM_SPRING] (state, passingData) {
        state.questionBoards = passingData
    },

    [REQUEST_QUESTION_BOARD_FROM_SPRING] (state, passingData) {
        state.questionBoard = passingData
    },

    [REQUEST_TRADE_BOARD_LIST_FROM_SPRING] (state, passingData) {
        state.tradeBoards = passingData
    },

    [REQUEST_TRADE_BOARD_FROM_SPRING] (state, passingData) {
        state.tradeBoard = passingData
    },

    [REQUEST_GRADE_UP_BOARD_LIST_FROM_SPRING] (state, passingData) {
        state.gradeUpBoards = passingData
    },

    [REQUEST_GRADE_UP_BOARD_FROM_SPRING] (state, passingData) {
        state.gradeUpBoard = passingData
    },

    [REQUEST_ARCHER_BOARD_LIST_FROM_SPRING] (state, passingData) {
        state.archerBoards = passingData
    },

    [REQUEST_ARCHER_BOARD_FROM_SPRING] (state, passingData) {
        state.archerBoard = passingData
    },

    [REQUEST_MAGE_BOARD_LIST_FROM_SPRING] (state, passingData) {
        state.mageBoards = passingData
    },

    [REQUEST_MAGE_BOARD_FROM_SPRING] (state, passingData) {
        state.mageBoard = passingData
    },

    [REQUEST_PIRATE_BOARD_LIST_FROM_SPRING] (state, passingData) {
        state.pirateBoards = passingData
    },

    [REQUEST_PIRATE_BOARD_FROM_SPRING] (state, passingData) {
        state.pirateBoard = passingData
    },

    [REQUEST_THIEF_BOARD_LIST_FROM_SPRING] (state, passingData) {
        state.thiefBoards = passingData
    },

    [REQUEST_THIEF_BOARD_FROM_SPRING] (state, passingData) {
        state.thiefBoard = passingData
    },

    [REQUEST_WARRIOR_BOARD_LIST_FROM_SPRING] (state, passingData) {
        state.warriorBoards = passingData
    },

    [REQUEST_WARRIOR_BOARD_FROM_SPRING] (state, passingData) {
        state.warriorBoard = passingData
    },





}