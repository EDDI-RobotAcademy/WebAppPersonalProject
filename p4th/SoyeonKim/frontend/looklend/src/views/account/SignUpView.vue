<template>
  <v-container>
    <sign-up-form @submit="onSubmit"/>
  </v-container>

</template>

<script>
import SignUpForm from "@/components/account/SignUpForm";

export default {
  name: "SignUpView",
  components: {SignUpForm},
  methods: {

  }
}
</script>

<style scoped>

</style>