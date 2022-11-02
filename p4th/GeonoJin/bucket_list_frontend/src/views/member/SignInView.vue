<template>
  <div>
    <sign-in-form @submit="onSubmit"/>
  </div>

</template>

<script>

import SignInForm from "@/components/common/account/SignInForm";
import axios from "axios";
// import {mapActions} from "vuex";

export default {
  name: "SignInView",
  components: {
    SignInForm
  },
  data() {
    return {
      isLogin: false
    }
  },
  mounted() {
    if (this.$store.state.isAuthenticated != false) {
      this.isLogin = true;
    } else {
      this.isLogin = false;
    }
  },
  methods: {
    // ...mapActions([
    //   'requestLoginStateToSpring'
    // ]),
    // onSubmit(payload) {
    //   if (!this.isLogin) {
    //     const {email, password} = payload
    //     this.requestLoginStateToSpring({email, password})
    //
    //     this.isLogin = true
    //     this.$router.push({name: 'HomeView'})
    //   } else {
    //     alert("이미 로그인 되어 있습니다.")
    //   }
    // }
    onSubmit (payload) {
      if (!this.isLogin) {
        const { email, password } = payload
        axios.post("http://localhost:7777/member/sign-in", { email, password })
            .then((res) => {
              if (res.data) {
                console.log(res.data)
                alert("로그인 성공!")
                this.$store.state.isAuthenticated = true
                this.$cookies.set("user", res.data, 3600);
                localStorage.setItem("userInfo", JSON.stringify(res.data))
                this.isLogin = true
                this.$router.push("/home")
              } else {
                alert("아이디 혹은 비밀번호가 존재하지 않거나 틀렸습니다!")
              }
            })
            .catch((res) => {
              alert(res.response.data.message)
            })
      } else {
        console.log(this.$store.state.isAuthenticated)
        alert("이미 로그인 되어 있습니다!")
      }
    }
  }


}
</script>

<style scoped>

</style>