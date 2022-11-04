import {
    CHECK_DUPLICATE_EMAIL_TO_SPRING,
    CHECK_DUPLICATE_NICKNAME_TO_SPRING,
    REQUEST_CURRENT_USER_NICKNAME_FROM_SPRING
    // REQUEST_LOGIN_STATE_TO_SPRING
} from './mutation-types'

// import axios from "axios";

import axios from "axios";


export default {
    // eslint-disable-next-line no-unused-vars
    async checkDuplicateEmailToSpring({commit}, payload) {

        const {email} = payload;

        await axios.post(`http://localhost:7777/member/check-email/${email}`)
            .then((res) => {
                if (res.data) {
                    alert("사용 가능한 이메일입니다.")
                    commit(CHECK_DUPLICATE_EMAIL_TO_SPRING, res.data);
                    console.log("이메일 중복체크 결과값(사용가능)(actions -> res.data: " + res.data)
                } else {
                    alert("중복된 이메일입니다.")
                    commit(CHECK_DUPLICATE_EMAIL_TO_SPRING, res.data);
                    console.log("이메일 중복체크 결과값(중복)(actions -> res.data: " + res.data)
                }
            })
    },
    async checkDuplicateNicknameToSpring({commit}, payload) {

        const {nickName} = payload;

        await axios.post(`http://localhost:7777/member/check-nickname/${nickName}`)
            .then((res) => {
                if (res.data) {
                    alert("사용 가능한 닉네임입니다.")
                    commit(CHECK_DUPLICATE_NICKNAME_TO_SPRING, res.data);
                    console.log(" 닉네임 중복체크 결과값(사용가능)(actions -> res.data: " + res.data)

                } else {
                    alert("사용중인 닉네임입니다.")
                    commit(CHECK_DUPLICATE_NICKNAME_TO_SPRING, res.data);
                    console.log(" 닉네임 중복체크 결과값(중복)(actions -> res.data: " + res.data)
                }
            })
    },

    // eslint-disable-next-line no-empty-pattern
    signUpDataFromSpring({}, payload) {

        const {email, password, nickName} = payload

        axios.post("http://localhost:7777/member/sign-up", {
            email, password, nickName
        })
            .then((res) => {
                alert("회원 가입 완료!" + res)
            })
            .catch((res) => {
                alert(res.response.data.message)
            })

    },
    async requestCurrentUserNickNameFromSpring({commit}, payload) {

        const {currentUserValue} = payload

        await axios.post(`http://localhost:7777/member/get-current-user-nickname/${currentUserValue}`)
            .then((res) => {
                commit(REQUEST_CURRENT_USER_NICKNAME_FROM_SPRING, res.data)
                console.log("닉네임: " + res.data)
            })
            .catch((res) => {
                console.log(res.data)
            });
    },
}