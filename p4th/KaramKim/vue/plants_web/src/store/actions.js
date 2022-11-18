import axios from "axios";
import router from "@/router";
import {REQUEST_QUESTION_BOARD_LIST_FROM_SPRING} from "@/store/mutation-types";

export default {
    requestSignUpDataToSpring (_, payload) {
        console.log('requestSignUpDataToSpring')
        axios.post("http://localhost:7777/plants/member/sign-up", payload)
            .then(() => {
                alert('회원가입 완료!')
                router.push("/sign-in")
            })
            .catch((res) => {
                alert(res.response.data.message)
            })
    },
    requestQuestionBoardListFromSpring({ commit }) {
        console.log('requestQuestionBoardListFromSpring')

        axios.post('http://localhost:7777/plants/question-board/list')
            .then((res) => {
                commit(REQUEST_QUESTION_BOARD_LIST_FROM_SPRING, res.data)
            })
    },
}


