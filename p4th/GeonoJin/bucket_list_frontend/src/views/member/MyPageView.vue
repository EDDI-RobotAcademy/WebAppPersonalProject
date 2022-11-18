<template>
  <div>
    <my-page-form @submit="onSubmit"/>
  </div>
</template>

<script>


import MyPageForm from "@/components/mypage/MyPageForm";
import {mapActions} from "vuex";
export default {
  name: "MyPageView",
  components: {MyPageForm},
  methods:{
    ...mapActions([
      'requestChangeNicknameToSpring'
    ]),
    async onSubmit(payload){

      const {nickName, currentUserToken} = payload
      console.log("1"+nickName, currentUserToken)

      if (nickName == null || nickName == '' || nickName == ' ') {
        alert("정확한 닉네임을 입력해주세요")
      } else {
        const {nickName} = payload
        console.log("2"+nickName, currentUserToken)

        await this.requestChangeNicknameToSpring({nickName, currentUserToken})
        await this.$router.push({name: 'HomeView'})
      }
    }
  }
}
</script>

<style scoped>

</style>