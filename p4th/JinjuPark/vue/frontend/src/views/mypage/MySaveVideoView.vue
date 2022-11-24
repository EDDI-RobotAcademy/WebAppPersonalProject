<template>
  <v-container>
    <div>
      <common-main-menu-template :main-page-show="mainPageShow"/>
      <common-image-card
          imgName="training_back.jpg"/>
      <my-save-video/>
      <common-footer-template/>
    </div>

  </v-container>

</template>

<script>

import MySaveVideo from "@/components/mypage/MySaveVideo";
import {mapActions, mapState} from "vuex";

export default {
  name: "MyPageView",
  computed: {
    ...mapState([
      'loginUser'
    ])
  },
  components: {
    MySaveVideo
  },
  data() {
    return {
      mainPageShow: true
    }
  },
  methods: {
    ...mapActions([
      'requestLoginUserFromSpring',
      'requestMySaveVideoListFromSpring'
    ]),
  },
  async mounted() {
    let userToken = window.localStorage.getItem('userInfo')
    await this.requestLoginUserFromSpring(userToken)
    const memberId = this.loginUser[0].id
    await this.requestMySaveVideoListFromSpring(memberId)
  }
}
</script>

<style scoped>

</style>