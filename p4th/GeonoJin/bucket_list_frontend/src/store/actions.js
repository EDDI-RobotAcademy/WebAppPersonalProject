import {
    CHECK_DUPLICATE_EMAIL_TO_SPRING
} from './mutation-types'

// import axios from "axios";

import axios from "axios";

export default{
    // eslint-disable-next-line no-unused-vars
    checkDuplicateEmailToSpring({ commit } ,payload) {

        const {email} = payload;

        axios.post(`http://localhost:7777/member/check-email/${email}`)
            .then((res) => {
                if (res.data) {
                    alert("사용 가능한 이메일입니다.")
                    commit(CHECK_DUPLICATE_EMAIL_TO_SPRING, res.data);
                } else {
                    alert("중복된 이메일입니다.")
                }
            })
    },

}