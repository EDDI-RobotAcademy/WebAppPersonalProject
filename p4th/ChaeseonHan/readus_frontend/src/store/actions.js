import {} from './mutation-types'

import axios from 'axios'

export default {

    // eslint-disable-next-line no-empty-pattern
    requestSignInToSpring({ }, payload ) {
        console.log("requestSignInToSpring()")

        const { email, password } = payload

        return axios.post('http://localhost:7776/member/login', {email, password})
            .then((res) => {
                if (res.data) {
                    this.$store.state.isAuthenticated = true
                    this.$cookies.set("user", res.data, 3600)
                    localStorage.setItem("userInfo", JSON.stringify(res.data))
                    alert("로그인 성공!")
                    this.$router.push({
                        name: 'home'
                    })
                } else {
                    alert("아이디 혹은 비밀번호가 존재하지 않거나 틀렸습니다!")
                }
            })
            .catch((error) => {
                alert(error)
            })

    }, // requestSignInToSpring



}