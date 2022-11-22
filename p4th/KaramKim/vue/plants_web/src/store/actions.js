import axios from "axios";
import router from "@/router";
import {
    REQUEST_COMMENTS_FROM_SPRING,
    REQUEST_GENERAL_BOARD_LIST_FROM_SPRING,
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
    requestSaveCommentToSpring(_, payload) {
        console.log('requestSaveCommentToSpring')

        const { boardNo, writer, content } = payload
        
        axios.post(`http://localhost:7777/plants/comment/register/${boardNo}`,
            { writer, content })
            .then(() => {
                alert('댓글을 등록했습니다.')
            })
    },
    // requestModifyCommentToSpring(_, payload) {
    //
    //     const { boardNo, id, writer, content, regDate } = payload
    //
    //     axios.put(`http://localhost:7777/plants/comment/modify/${boardNo}/${id}`,
    //         { writer, content, regDate })
    //         .then(() => {
    //             alert('댓글을 수정했습니다.')
    //         })
    // },
    requestModifyCommentToSpring(_, payload) {
        const { id, content } = payload
        axios.put(`http://localhost:7777/plants/comment/modify/${id}`,
                { content })
                .then(() => {
                    alert('댓글을 수정했습니다.')
                })
    },
    requestDeleteCommentToSpring(_, id) {
        console.log('requestDeleteCommentToSpring()')

        axios.delete(`http://localhost:7777/plants/comment/delete/${id}`)
            .then(() => {
                alert('해당 댓글을 삭제 완료했습니다.')
            })

    },
    requestQuestionBoardContentsFromSpring({ commit }, boardNo) {
        console.log('requestQuestionBoardContentsFromSpring()')

        axios.post(`http://localhost:7777/plants/question-board/read/${boardNo}`)
            .then((res) => {
                commit(REQUEST_QUESTION_BOARD_CONTENTS_FROM_SPRING, res.data)
            })
    },
    requestCommentsFromSpring({ commit }, boardNo) {
        console.log("requestCommentsFromSpring()")

        axios.post(`http://localhost:7777/plants/comment/list/${boardNo}`)
            .then((res) => {
                commit(REQUEST_COMMENTS_FROM_SPRING, res.data)
            })
    },
    requestDeleteBoardToSpring(_, boardNo) {
        console.log('requestDeleteBoardToSpring()')

        axios.delete(`http://localhost:7777/plants/question-board/delete/${boardNo}`)
            .then(() => {
                alert('해당 게시물을 삭제 완료했습니다.')
            })
    },
    requestBoardModifyToSpring(_, payload) {
        console.log('requestBoardModifyToSpring()')

        const { boardNo, title, content, writer, regDate } = payload

        axios.put(`http://localhost:7777/plants/question-board/modify/${boardNo}`,
            { title, content, writer, regDate })
            .then(() => {
                alert('게시물을 수정 완료했습니다.')
            })
    },

    requestGeneralBoardListFromSpring({ commit }) {
        console.log('requestGeneralBoardListFromSpring')

        axios.post('http://localhost:7777/plants/general-board/list')
            .then((res) => {
                commit(REQUEST_GENERAL_BOARD_LIST_FROM_SPRING, res.data)
            })
    },

}


