<template>


<div>
  <div class="text"> My Page </div>

  <br><br><br><br><br>

  <form @submit.prevent="onSubmit">
    <div class="right_content">
      <h3 style="color: burlywood">나의 정보 수정</h3>
      <br><br>
      <v-container class="inputYourInfo">

        <v-text-field flat v-model="name" type="text"  dense clearable required placeholder="이메일 변경하기"  color="amber lighten-4"></v-text-field>
        <br>

        <v-text-field flat v-model="pw" type="password"  dense  placeholder="비밀번호 변경하기" :rules="rules_pw" color="amber lighten-4" ></v-text-field>
        <v-text-field flat v-model="pw1" type="password"  dense  placeholder="비밀번호 변경 확인" :rules="rules_pw1" color="amber lighten-4"></v-text-field>
        <br><br><br><br><br>

        <div style="float: right" >
        <v-btn text type="submit" width="260"  style="text-align: center; margin: 0 0 0 18%; color: burlywood" >
          <v-icon>mdi-login</v-icon>정보 수정하기</v-btn>
        <br>
        <v-btn text type="button" @click="deleteInfo" width="260"  style="text-align: center; margin: 0 0 0 18%; color: burlywood">
          <v-icon>mdi-login</v-icon>회원 탈퇴하기</v-btn>

        </div>

      </v-container>


    </div>
  </form>

</div>


</template>

<script>
import axios from "axios";

export default {
  name: "MyPageForm",

  data(){
    return{
    rules_pw: [
        v => v.length >= 6 || '비밀번호를 6자리 이상 입력해주세요'
      ],
      rules_pw1: [
        v => v === this.pw || '비밀번호가 일치하지 않습니다'
      ],
      name:this.memberInfo.name,
      pw:'',
      pw1:'',
      id: this.memberInfo.id,
      userName:'',
      password:'',
      auth:'',
    }
  },
  methods: {
    onSubmit() {
      this.userName = this.name
      this.auth = this.memberInfo.auth
      if(this.pw.length > 0) {
        this.password = this.pw
        const { userName, password, auth } = this
        this.$emit('submit', { userName, password, auth })
      }else{
        this.password = 'no'
        const { userName, password, auth } = this
        this.$emit('submit', { userName, password, auth })
      }

    },
    deleteInfo() {
      alert('지우는 게시물 번호: ' + this.id)
      axios.delete(`http://localhost:7777/Member/${this.id}`)
          .then(() => {
            alert('탈퇴되었습니다.')
            this.$cookies.remove("user")
            this.isLogin = false
            this.$store.state.userInfo = null
            window.localStorage.removeItem("token")
            this.$router.push({ name: 'MainHomepage' })

          })
          .catch(() => {
            alert('삭제 실패! 문제 발생!')
          })
    }
  }
}
</script>

<style scoped>


.text {
  font-size: 45px;
  text-align: center;
  color: #FFECB3;
}




</style>