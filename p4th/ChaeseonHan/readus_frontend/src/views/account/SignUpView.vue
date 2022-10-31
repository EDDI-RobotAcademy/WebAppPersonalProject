<template>
  <v-container>
    <register-form @submit="onSubmit"/>
  </v-container>
</template>

<script>
import RegisterForm from "@/components/account/RegisterForm";
import {mapActions} from "vuex";
export default {
  name: "SignUpView",
  components: {RegisterForm},
  data() {
    return {

    }
  }, // data
  methods: {
    ...mapActions(['requestMemberRegisterToSpring']),
    async onSubmit(payload) {
      const { email, password, nickname } = payload
      await this.requestMemberRegisterToSpring({ email, password, nickname } )
    }
  }, // methods
}
</script>

<style scoped>

</style>