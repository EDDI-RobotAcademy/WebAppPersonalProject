<template>
  <login-form @submit="onSubmit"/>
</template>

<script>
import LoginForm from "@/components/account/LoginForm";
import { mapActions, mapState } from "vuex";
import axios from "axios";


export default {
  name: "SignInView",
  components: { LoginForm },
  data() {
    return {
      ...mapState(['isAuthenticated']),
      isLogin: false,
    }
  }, // data
  mounted() {
    if (this.$store.state.isAuthenticated != false) {
      this.isLogin = true
    } else {
      this.isLogin = false
    }
  }, // mounted
  methods: {
    ...mapActions([ 'requestSignInToSpring' ]),
    async onSubmit(payload) {
      if (!this.isLogin) {
        const { email, password } = payload
        axios.post("http://localhost:7776/member/login", { email, password })
            .then((res) => {
              if (res.data) {
                alert("로그인 성공!")
                this.$store.state.isAuthenticated = true
                this.$cookies.set("user", res.data, 3600);
                localStorage.setItem("userInfo", JSON.stringify(res.data))
                this.isLogin = true
                this.$router.push("/")
              } else {
                alert("아이디 혹은 비밀번호가 존재하지 않거나 틀렸습니다!")
              }
            })
            .catch((res) => {
              alert(res.response.data.message)
            })
      } else {
        alert("이미 로그인 되어 있습니다!")
      }
    }
  }, //methods
}
</script>

<style scoped>

</style>