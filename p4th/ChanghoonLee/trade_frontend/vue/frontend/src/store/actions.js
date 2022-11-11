import {
    REQUEST_CHECK_DUPLICATE_EMAIL_TO_SPRING

} from './mutation-types'
import axios from "axios";
import router from "@/router";

export default {
    requestCheckDuplicateEmailToSpring ({ commit }, payload) {
        console.log("requestBuyItem()")

        const{ email } = payload

        return axios.post(`http://localhost:7777/trade-item/member/check-email/${email}`)
            .then((res) => {
                if(res.data) {
                    alert("사용 가능한 이메일입니다.")
                    commit(REQUEST_CHECK_DUPLICATE_EMAIL_TO_SPRING, res.data)
                } else {
                    alert("이미 등록되어있는 이메일입니다.")
                }
            })
    },

    // eslint-disable-next-line no-empty-pattern
    requestMemberRegisterToSpring ({ }, payload) {
        console.log("requestMemberRegisterToSpring()")

        const { email, password, city, street, addressDetail, zipcode } = payload

        return axios.post(`http://localhost:7777/trade-item/member/sign-up`, {
            email, password, city, street, addressDetail, zipcode })
            .then((res) => {
                if(res.data) {
                    alert("회원가입이 완료되었습니다!")
                    router.push({name: 'SignInView'})
                } else {
                    alert("잘못된 입력입니다.")
                }
            })
    },
}