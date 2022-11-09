import {
    REQUEST_DIARY_BOARD_LIST_FROM_SPRING,
} from './mutation-types'

export default {

    [REQUEST_DIARY_BOARD_LIST_FROM_SPRING] (state, passingData) {
        state.diaryBoards = passingData
    },

}