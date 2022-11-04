<template>
  <v-container>
    <sign-up-form @submit="onSubmit"/>
  </v-container>
</template>

<script>
import SignUpForm from "@/components/account/SignUpForm";
import {mapActions} from "vuex";
export default {
  name: "SignUpView",
  components: {SignUpForm},
  methods: {
    ...mapActions([
       'requestSignUpDataToSpring'
    ]),
    onSubmit (payload) {
      this.requestSignUpDataToSpring(payload)
    }
  }
}
</script>

<style scoped>

</style>