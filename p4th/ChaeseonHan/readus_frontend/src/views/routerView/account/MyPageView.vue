<template>
  <v-container>
    <!-- TODO: 2022.11.19 마이페이지 만들기!!!!! -->
    <member-information :login-user-profile="this.$store.state.loginUserProfile"/>
  </v-container>
</template>

<script>
import MemberInformation from "@/components/account/MemberInformation";
import {mapActions} from "vuex";
export default {
  name: "MyPageView",
  components: {MemberInformation},
  methods: {
    ...mapActions(['requestLoggedInUserProfileToSpring']),
  },
}
</script>

<style scoped>

</style>