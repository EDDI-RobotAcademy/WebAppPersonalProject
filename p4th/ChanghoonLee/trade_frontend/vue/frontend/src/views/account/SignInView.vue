<template>
  <v-container>
    <top-menu-form/>
    <toolbar-form/>
    <sign-in-form @submit="onSubmit"/>
  </v-container>
</template>

<script>
import ToolbarForm from "@/components/toolbar/ToolbarForm";

import cookies from 'vue-cookies';
import axios from "axios";
import Vue from 'vue';
import SignInForm from "@/components/account/SignInForm";
import TopMenuForm from "@/components/topMenubar/TopMenuForm";

Vue.use(cookies);

export default {
  name: "SignInView",
  components: {
    SignInForm,
    ToolbarForm,
    TopMenuForm
  },
  data () {
    return {
      isLogin: false
    }
  },
  mounted () {
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
        axios.post("http://localhost:7777/trade-item/member/sign-in", { email, password })
            .then((res) => {
              if (res.data) {
                alert("로그인 성공!")
                this.$store.state.isAuthenticated = true
                this.$cookies.set("user", res.data, 3600);
                localStorage.setItem("userInfo", JSON.stringify(res.data))
                this.isLogin = true
                this.$router.push("/")
              } else {
                alert("이메일 혹은 비밀번호가 존재하지 않거나 틀렸습니다!")
              }
            })
            .catch((res) => {
              alert(res.response.data.message)
            })
      } else {
        alert("이미 로그인 되어 있습니다!")
      }
    }
  }
}
</script>

<style scoped>
</style>