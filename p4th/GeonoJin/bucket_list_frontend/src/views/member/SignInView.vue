<template>
  <div>
    <sign-in-form @submit="onSubmit"/>
  </div>

</template>

<script>

import SignInForm from "@/components/common/account/SignInForm";
import axios from "axios";
import cookies from 'vue-cookies';
import Vue from 'vue';
import {mapState} from "vuex";

Vue.use(cookies);

export default {
  name: "SignInView",
  components: {
    SignInForm
  },
  data() {
    return {
    }
  },
  // mounted() {
  //   if (this.$store.state.isAuthenticated != false) {
  //     this.isLogin = true;
  //   } else {
  //     this.isLogin = false;
  //   }
  // },
  methods: {

    ...mapState([
      'isAuthenticated'
    ]),
    async onSubmit(payload) {
      if (localStorage.getItem('userInfo') == null) {
        const {email, password} = payload

        await axios.post("http://localhost:7777/member/sign-in", {email, password})
            .then((res) => {
              if (localStorage.getItem('userInfo') == null) {

                alert("로그인 성공!")

                this.$store.state.isAuthenticated = true

                this.$cookies.set("user", res.data, 3600);
                localStorage.setItem("userInfo", JSON.stringify(res.data))

                this.$store.state.currentLoginUserCheck = true

                this.$router.push("/home")
              } else {
                alert("아이디 혹은 비밀번호가 존재하지 않거나 틀렸습니다!")
              }
            })
            .catch((error) => {
              alert(error)
            })
      } else {
        alert("이미 로그인 되어 있습니다!")
      }
    },
  },
}
</script>

<style scoped>

</style>