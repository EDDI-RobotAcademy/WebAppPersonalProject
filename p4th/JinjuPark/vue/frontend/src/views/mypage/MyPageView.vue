<template>
  <v-container>
    <div>
      <common-main-menu-template :main-page-show="mainPageShow"/>
      <common-image-card imgName="re_home_white_banner.png"/>
      <my-page @modify="modifySubmit"/>
      <common-footer-template/>
    </div>
  </v-container>
</template>

<script>
import MyPage from "@/components/mypage/MyPage";
import {mapActions, mapState} from "vuex";

export default {
  name: "MyPageView",
  components: {
    MyPage
  },
  computed: {
    ...mapState([
      'loginUser'
    ])
  },
  data(){
    return{
      mainPageShow: true,
    }
  },
  methods:{
    ...mapActions([
        'requestModifyNickNameToSpring'
    ]),
    async modifySubmit(payload){
      const reNickName = payload
      const memberId = this.loginUser[0].id
      await this.requestModifyNickNameToSpring({memberId, reNickName})
      }
    }

}
</script>

<style scoped>

</style>