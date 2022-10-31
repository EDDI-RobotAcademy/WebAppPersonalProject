<template>
  <login-form @submit="onSubmit"/>
</template>

<script>
import LoginForm from "@/components/account/LoginForm";
import {mapActions, } from "vuex";


export default {
  name: "SignInView",
  components: {LoginForm},
  data() {
    return {
      isLogin: false,
    }
  }, // data
  mounted() {
    this.isLogin = (this.$store.state.isAuthenticated != false);
  }, // mounted
  methods: {
    ...mapActions([ 'requestSignInToSpring' ]),
    async onSubmit(payload) {
      if(!this.isLogin) {
        const { email, password } = payload
        await this.requestSignInToSpring( {email, password});
        this.isLogin = true;
        await this.$router.push("/")
      } else {
        alert("이미 로그인이 되어있습니다.")
      }
    }
  }, //methods
}
</script>

<style scoped>

</style>