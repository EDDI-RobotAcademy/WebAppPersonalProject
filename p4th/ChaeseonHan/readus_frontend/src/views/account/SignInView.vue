<template>
  <login-form @submit="onSubmit"/>
</template>

<script>
import LoginForm from "@/components/account/LoginForm";
import { mapActions, mapState } from "vuex";


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

      const { email, password } = payload

      if(!this.isLogin) {
        await this.requestSignInToSpring( {email, password})
      } else {
        alert("이미 로그인이 되어있습니다.")
        await this.$router.push({
          name: 'home'
        })
      }
    }
  }, //methods
}
</script>

<style scoped>

</style>