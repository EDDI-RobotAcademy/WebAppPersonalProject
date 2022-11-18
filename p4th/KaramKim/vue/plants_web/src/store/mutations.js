import {REQUEST_QUESTION_BOARD_LIST_FROM_SPRING} from "@/store/mutation-types";

export default {
    [REQUEST_QUESTION_BOARD_LIST_FROM_SPRING] (state, passingData) {
        state.boards = passingData
    }


}