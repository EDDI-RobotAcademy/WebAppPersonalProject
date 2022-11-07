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
    onSubmit(payload){
      const {nickName} = payload
      console.log(nickName)

      if (nickName == null || nickName == '' || nickName == ' ') {
        alert("정확한 닉네임을 입력해주세요")
      } else {
        this.requestChangeNicknameToSpring({nickName})
        this.$router.push({name: 'MyPageView'})
      }
    }
  }
}
</script>

<style scoped>

</style>