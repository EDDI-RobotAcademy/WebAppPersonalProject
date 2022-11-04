<template>
  <div style="font-family: Arial">
    <v-row justify="center">
      <v-col cols="auto" class="mt-10">
        <v-card flat width="460">
          <v-card-text class="text-center px-12 py-16">
            <v-form @submit.prevent="onSubmit">
              <div class="text-h4 font-weight-bold grey--text text--darken-1 mb-13">
                로그인
              </div>
              <div class="d-flex">
                <v-text-field v-model="email" label="이메일" color="light-green darken-3"
                              :rules="email_rule" outlined clearable/>
              </div>
              <div class="d-flex">
                <v-text-field v-model="password" label="비밀번호" type="password" color="light-green darken-3"
                              :rules="password_rule" outlined clearable/>
              </div>
              <v-btn type="submit" block x-large color="light-green"
                     class="mt-1 font-weight-bold white--text" :disabled="false">
                로그인
              </v-btn>
              <router-link to="/sign-up" style="text-decoration: none">
              <v-btn type="submit" block x-large color="white"
                     class="mt-6 font-weight-bold light-green--text" :disabled="false">
                회원가입
              </v-btn>
              </router-link>
            </v-form>
          </v-card-text>
        </v-card>
      </v-col>
    </v-row>
  </div>
</template>

<script>

export default {
  name: "SignInForm",
  data() {
    return {
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
        v => !!v || '비밀번호를 입력해주세요.',
        v => !(v && v.length >= 16) || '패스워드는 16자 이상 입력할 수 없습니다.',
      ]
    }
  },
  methods: {
    onSubmit() {
      const {email, password} = this
      this.$emit("submit", {email, password})
    },
  }
}
</script>

<style scoped>

</style>