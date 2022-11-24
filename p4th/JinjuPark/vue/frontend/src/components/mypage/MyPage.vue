<template>
  <v-container style="height: 380px">
    <v-card style="height: 380px;" >
      <v-card-title ><b class="mt-5 ml-5">{{ loginUser[0].username }}님의 마이페이지 <v-icon>mdi-account-circle-outline</v-icon></b></v-card-title>
      <v-card class="mt-10" >
      <v-row>
        <v-col class="ml-12 mt-5" style="height: 250px">
          <v-img
            max-width="180px"
            height="180px"
            :src="require(`@/assets/profile_image.png`)">
          </v-img>
        </v-col>
        <v-col align-self="center">
          <p>이름</p>
          <p>이메일</p>
          <p>닉네임</p>
          <p>My Diary</p>
        </v-col>
<!--        닉네임 수정 버튼 누르기 전-->
        <v-col align-self="center" v-if="!this.modifyNickNameShow">
          <p>{{loginUser[0].username}}</p>
          <p>{{loginUser[0].email}}</p>
          <p>{{loginUser[0].nickname}}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <v-btn small @click="modifyNickName">수정</v-btn></p>
          <p>내 다이어리 이동<v-btn icon ><v-icon @click="toMyDiary">mdi-clipboard-check-multiple-outline</v-icon></v-btn></p>
        </v-col>
<!--        닉네임 수정 버튼 누른 후-->
        <v-col align-self="center" v-else>
          <p>{{loginUser[0].username}}</p>
          <p>{{loginUser[0].email}}</p>
          <form @submit="modifySubmit(updateNickName)">
           <p><input type="text" name="nickname" v-model="updateNickName" style="width:200px; height: 30px; border:2px solid gray; border-radius: 2px; background-color: white; ">&nbsp;&nbsp;&nbsp;
             <v-btn small @click="modifySubmit" type="submit">완료</v-btn></p>
          </form>
          <p>내 다이어리 이동<v-btn icon ><v-icon @click="toMyDiary">mdi-clipboard-check-multiple-outline</v-icon></v-btn></p>
        </v-col>

      </v-row>
      </v-card>
    </v-card>
  </v-container>
</template>

<script>
import {mapActions, mapState} from "vuex";

export default {
  name: "MyPage",
  computed: {
    ...mapState([
        'loginUser'
    ])
  },
  data(){
    return{
      modifyNickNameShow: false,
      updateNickName:""
      }
  },
  mounted() {
    if(window.localStorage.getItem('userInfo') != null) {
      let userToken = window.localStorage.getItem('userInfo')
      this.requestLoginUserFromSpring(userToken)
    }
  },
  methods: {
    ...mapActions([
      'requestLoginUserFromSpring'
    ]),
    modifyNickName(){
      this.modifyNickNameShow= true
    },
    modifySubmit(updateNickName){
      const reNickName = updateNickName
      this.$emit('modify', reNickName)
    },
    toMyDiary(){
      this.$router.push({name: 'MyDiaryBoardListView',
        params: { memberId: this.loginUser[0].id }})
    }
  }

}
</script>

<style scoped>

</style>