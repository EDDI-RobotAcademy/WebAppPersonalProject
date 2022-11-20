<template>
  <div>
    <my-page-form @submit="onSubmit" :nickname="nickName"/>
  </div>
</template>

<script>


import MyPageForm from "@/components/mypage/MyPageForm";
import {mapActions, mapState} from "vuex";
export default {
  name: "MyPageView",
  components: {MyPageForm},
  computed:{
    ...mapState([
        'currentUserNickname'
    ])
  },
  props:{
    nickName:{
      type: String,
      required: true
    }
  },
  methods:{
    ...mapActions([
      'requestChangeNicknameToSpring'
    ]),
    async onSubmit(payload){

      const {nickName, currentUserToken} = payload

      if (nickName == null || nickName == '' || nickName == ' ') {
        alert("정확한 닉네임을 입력해주세요")
      } else {
        const {nickName} = payload

        await this.requestChangeNicknameToSpring({nickName, currentUserToken})
        await this.$router.push({name: 'HomeView'})
      }
    }
  },
  data(){
    return{
      nickname: ''
    }
  },
}
</script>

<style scoped>

</style>