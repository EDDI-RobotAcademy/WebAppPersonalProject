<template>
  <v-container>
    <login-form @submit="onSubmit"/>
  </v-container>
</template>

<script>

import LoginForm from "@/components/account/LoginForm";
import cookies from 'vue-cookies';
import axios from "axios";
import Vue from 'vue';
import {mapState} from "vuex";

Vue.use(cookies);

export default {
  name: "SignInView",
  components: {
    LoginForm
  },
  data () {
    return {
      isLogin: false,
    }
  },
  computed: {
    ...mapState([
      'isAuthenticated'
    ]),
  },
  beforeMount() {
      if (this.$store.state.isAuthenticated != false) {
        this.isLogin = true
      } else {
        this.isLogin = false
      }
  },
  methods: {
     onSubmit (payload) {
      if (!this.isLogin) {
        const { email, password } = payload

        axios.post("http://localhost:7777/hometwang/member/sign-in", { email, password })
          .then((res) => {
            if (res.data) {
              alert("로그인되었습니다.")

              this.$store.commit('IS_AUTHENTICATED', true)
              this.$store.commit('USER_LOGIN_CHECK', true)
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
        alert("이미 로그인되어 있습니다.")
      }
    }
  }
}

/**
 저장 → localStorage.setItem(”이름”, 저장할 데이터)
 가져올 때 → localStorage.getItem (”이름”)
 삭제 → localStorage.removeItem(”이름”)
 */

</script>


<style scoped>

</style>