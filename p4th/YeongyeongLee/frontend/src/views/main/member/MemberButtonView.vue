<template>

  <div style="float: right">
    <v-btn :href= "`/login-form`">
      <span>로그인</span>
      <v-icon>mdi-account-outline</v-icon>

    </v-btn>

    <v-btn :href= "`/signup-form`">
      <span>회원가입</span>
      <v-icon>mdi-account-plus-outline</v-icon>

    </v-btn>

  </div>


</template>

<script>
export default {
  name: "MemberButtonView"
}
</script>

<style scoped>

</style>