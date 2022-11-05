<template>
  <div style="background-color: #356859" >
    <v-container>
      <app-bar-component :nick-name="this.nickName" :is-login="this.isLogin"/>
    </v-container>
  </div>
</template>

<script>
import AppBarComponent from "@/components/Header/AppBarComponent";
import {mapActions} from "vuex";

export default {
  name: "HeaderView",
  components: {AppBarComponent,},
  data() {
    return {
      nickName: "방문자",
      isLogin: false,
    }
  },
  async mounted() {

    let userToken = this.$cookies.get("user")
    await this.requestLoggedInUserProfileToSpring({ userToken })
    await this.getUserProfile()

    /*if(this.$store.state.isAuthenticated == true) {
      let userToken = this.$cookies.get("user")
      await this.requestLoggedInUserProfileToSpring({ userToken })
      await this.getUserProfile()
    } else {
      this.nickName = "방문자"
    }*/
  },

  methods: {
    ...mapActions(['requestLoggedInUserProfileToSpring']),

    getUserProfile() {
      console.log("getUserProfile()")
      this.nickName = this.$store.state.loggedInUserProfile.nickName
      this.isLogin = true
    }

  },
}
</script>

<style scoped>

</style>