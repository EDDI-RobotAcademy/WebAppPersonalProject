<template>
  <div>
    <sign-up-form @submit="onSubmit"/>
  </div>
</template>

<script>
import SignUpForm from "@/components/common/account/SignUpForm";
import {mapActions} from "vuex";
export default {
  name: "SignUpView",
  components: {
    SignUpForm
  },
  methods:{
    ...mapActions([
        'signUpDataFromSpring'
    ]),
    async onSubmit(payload) {
      const {email, password, nickName} = payload;
      await this.signUpDataFromSpring({email, password, nickName})
      await this.$router.push({name:'SignInView'})
    }
  }
}
</script>

<style scoped>

</style>