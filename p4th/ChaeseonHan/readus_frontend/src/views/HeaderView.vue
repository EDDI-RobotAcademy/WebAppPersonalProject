<template>
  <div style="background-color: #356859">
    <v-container style="font-family: '210 M고딕 040'">
      <app-bar-component/>
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
      /* userToken: "", */
    }
  },

  async created() {
    await this.getUserProfile()
  },

  methods: {
    ...mapActions(['requestLoggedInUserProfileToSpring']),

    getUserProfile() {
      this.userToken = localStorage.getItem("userInfo")
      const { userToken } = this
      this.requestLoggedInUserProfileToSpring( { userToken })
    }

  }

}
</script>

<style scoped>

</style>