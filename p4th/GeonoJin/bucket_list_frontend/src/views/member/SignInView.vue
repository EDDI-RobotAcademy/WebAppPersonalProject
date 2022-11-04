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
import {mapActions, mapState} from "vuex";

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
    ...mapActions([
      'requestCurrentUserNickNameFromSpring'
    ]),
    ...mapState([
      'isAuthenticated'
    ]),
    async onSubmit(payload) {
      if (localStorage.getItem('userInfo') == null) {
        const {email, password} = payload

        await axios.post("http://localhost:7777/member/sign-in", {email, password})
            .then((res) => {
              if (localStorage.getItem('userInfo') == null && localStorage.getItem('userInfo') != res.data) {

                alert("로그인 성공!")

                this.$store.state.isAuthenticated = true
                console.log("isAuthenticated값: " + this.$store.state.isAuthenticated)

                // this.$cookies.set("user", res.data, 3600);
                localStorage.setItem("userInfo", JSON.stringify(res.data))

                console.log(this.$store.state.currentLoginUserCheck)

                this.$store.state.currentLoginUserCheck = true

                const currentUserValue = res.data
                console.log(currentUserValue)

                this.requestCurrentUserNickNameFromSpring({currentUserValue})
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