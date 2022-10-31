<template>
  <v-container>
    <sign-up-form @submit="onSubmit"/>
  </v-container>
</template>

<script>

import axios from "axios";
import SignUpForm from "@/components/account/SignUpForm";

export default {
  name: "SignUpView",
  components: {
    SignUpForm
  },
  methods: {
     onSubmit (payload) {
      const { username, email, password, city, street, addressDetail, zipcode } = payload;

      axios.post("http://localhost:7777/hometwang/member/sign-up", {
        username, email, password, city, street, addressDetail, zipcode
      })
      .then((res) => {
        alert("회원 가입 완료!")
        console.log(res)
        this.$router.push("/sign-in")
      })
      .catch((res) => {
        alert(res.response.data.message)
      })
    }
  }
}
</script>

<style scoped>

</style>