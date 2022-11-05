import axios from "axios";
import router from "@/router";

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
    }



}


