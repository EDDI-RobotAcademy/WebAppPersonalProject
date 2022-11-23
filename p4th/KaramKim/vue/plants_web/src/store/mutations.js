import {
    REQUEST_COMMENTS_FROM_SPRING,
    REQUEST_GENERAL_BOARD_LIST_FROM_SPRING,
    REQUEST_QUESTION_BOARD_CONTENTS_FROM_SPRING,
    REQUEST_QUESTION_BOARD_LIST_FROM_SPRING
} from "@/store/mutation-types";

export default {
    [REQUEST_QUESTION_BOARD_LIST_FROM_SPRING] (state, passingData) {
        state.boards = passingData
    },
    [REQUEST_QUESTION_BOARD_CONTENTS_FROM_SPRING] (state, passingData) {
        state.board = passingData
    },
    [REQUEST_GENERAL_BOARD_LIST_FROM_SPRING] (state, passingData) {
        state.boards = passingData
    },
    [REQUEST_COMMENTS_FROM_SPRING] (state, passingData) {
        state.comments = passingData
    }


}