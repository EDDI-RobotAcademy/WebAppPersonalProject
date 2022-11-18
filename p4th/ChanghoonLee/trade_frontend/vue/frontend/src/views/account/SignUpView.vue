<template>
  <v-container>
    <top-menu-form/>
    <toolbar-form/>
    <sign-up-form @submit="onSubmit"/>
  </v-container>
</template>

<script>
import SignUpForm from "@/components/account/SignUpForm";
import ToolbarForm from "@/components/toolbar/ToolbarForm";
import TopMenuForm from "@/components/topMenubar/TopMenuForm";
import {mapActions} from "vuex";
export default {
  name: "SignUpView",
  components: {
    TopMenuForm,
    ToolbarForm,
    SignUpForm
  },
  methods: {
    ...mapActions(['requestMemberRegisterToSpring']),

    async onSubmit (payload) {
      const { email, password, city, street, addressDetail, zipcode } = payload;
      await this.requestMemberRegisterToSpring({ email, password, city, street, addressDetail, zipcode })

    }
  }
}
</script>

<style scoped>
body{
  margin:120px;
}
</style>