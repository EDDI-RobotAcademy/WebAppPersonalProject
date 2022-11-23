<template>
  <v-container>
  <div>
    <common-main-menu-template :main-page-show="mainPageShow"/>
    <home-main @saveVideo="saveVideo"/>
     <common-footer-template/>
  </div>
  </v-container>
</template>
<script>
import HomeMain from "@/components/video/HomeMain";
import {mapActions, mapState} from "vuex";

export default {
  name: "HomeMainView",
  components:{
    HomeMain
  },
  computed:{
    ...mapState([
      'loginUser',
    ]),
  },
  data(){
    return{
      mainPageShow: true
    }
  },
  mounted() {
    this.requestVideoListFromSpring()
  },
  methods:{
    ...mapActions([
      'requestVideoListFromSpring',
      'requestSaveMyVideoFromSpring',
        'requestLoginUserFromSpring'
    ]),
    async saveVideo(payload){
      if(window.localStorage.getItem('userInfo') != null) {
        let userToken = window.localStorage.getItem('userInfo')
        await this.requestLoginUserFromSpring(userToken)
        const memberId = this.loginUser[0].id
        const videoId = payload.id
        await this.requestSaveMyVideoFromSpring({memberId, videoId})
      }else {
        alert("로그인이 필요한 기능입니다.")
      }

    }
  }

}
</script>

<style scoped>

</style>