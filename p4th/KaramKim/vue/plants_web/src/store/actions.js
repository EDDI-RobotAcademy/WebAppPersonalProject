import axios from "axios";
import router from "@/router";
import {
    REQUEST_QUESTION_BOARD_CONTENTS_FROM_SPRING,
    REQUEST_QUESTION_BOARD_LIST_FROM_SPRING
} from "@/store/mutation-types";
import store from "@/store/index";
import cookies from "vue-cookies";

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
    requestSignInDataToSpring(_, payload) {
        console.log('requestSignInDataFromSpring')

        return axios.post("http://localhost:7777/plants/member/sign-in", payload)
            .then((res) => {
                if(res.data) {
                    alert("로그인 성공!")
                    store.state.isAuthenticated = true
                    cookies.set("user", res.data, 3600)
                    localStorage.setItem("userInfo", JSON.stringify(res.data))
                    store.state.checkUserInfo = true
                }
            })
            .catch((res) => {
                alert((res.response.data.message))
            })
    },
    requestQuestionBoardListFromSpring({ commit }) {
        console.log('requestQuestionBoardListFromSpring')

        axios.post('http://localhost:7777/plants/question-board/list')
            .then((res) => {
                commit(REQUEST_QUESTION_BOARD_LIST_FROM_SPRING, res.data)
            })
    },
    requestCreateQuestionBoardContentsToSpring(_, payload) {
        console.log('requestQuestionBoardListFromSpring')

        axios.post('http://localhost:7777/plants/question-board/register', payload)
            .then(() => {
                alert('게시물 등록 완료')
            })
    },
}


