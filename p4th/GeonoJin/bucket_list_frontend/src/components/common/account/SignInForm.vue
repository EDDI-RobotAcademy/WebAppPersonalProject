<template>
  <div style="font-family: Arial">
    <v-row justify="center">
      <v-col cols="auto" style="padding-bottom: 90px">
        <div align="center">
          <router-link to="/home">
            <logo-component
                class="logo"
            />
          </router-link>
        </div>
        <br/>
        <v-form @submit.prevent="onSubmit">
          <div class="text-h4 font-weight-black mb-10" align="center">로그인</div>
          <v-divider></v-divider>
          <br/>
          <br/>

          <div class="d-flex">
            <v-text-field v-model="email" label="이메일" color="teal"
                          :rules="email_rule" clearable prepend-icon="mdi-account-outline" outlined dense/>
          </div>

          <div class="d-flex">
            <v-text-field v-model="password" label="비밀번호" type="password" color="teal"
                          :rules="password_rule" clearable prepend-icon="mdi-lock-outline" outlined dense/>
          </div>

          <v-btn type="submit" block x-large rounded color="green lighten-2"
                 class="mt-6"  :disabled="false">
            로그인
          </v-btn>
          <br/>
          <v-divider></v-divider>
          <br/>
          <div align="center">
            <h5>아직 회원이 아니신가요? <a href="/signUp" class="textLink">회원가입</a></h5>
          </div>
        </v-form>
      </v-col>
    </v-row>
  </div>
</template>

<script>

import LogoComponent from "@/components/common/LogoComponent";

export default {
  name: "SignInForm",
  components:{
    LogoComponent
  },
  data(){
    return{
      email: "",
      password: "",
      email_rule: [
        v => !!v || '이메일을 입력해주세요.',
        v => {
          const replaceV = v.replace(/(\s*)/g, '')
          const pattern = /^(([^<>()[\]\\.,;:\s@]+(\.[^<>()[\]\\.,;:\s@]+)*)|(.+))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
          return pattern.test(replaceV) || '이메일 형식을 입력하세요.'
        }
      ],
      password_rule: [
        v => this.state === 'ins' ? !!v || '패스워드는 필수 입력사항입니다.' : true,
        v => !(v && v.length >= 30) || '패스워드는 30자 이상 입력할 수 없습니다.',
      ],
    }
  },
  methods: {
    onSubmit () {
      const { email, password } = this
      this.$emit("submit", { email, password })
    }
  }
}
</script>

<style scoped>
.logo {
  width: 170px;
  margin-top: 80px;
  margin-bottom: 50px;
}
 .textLink{
   text-decoration: none;
   color: purple;
 }
</style>