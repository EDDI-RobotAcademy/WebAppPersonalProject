<template>
  <div class="#FFFBE6" style="font-family: Arial">
    <v-row justify="center">
      <v-col cols="auto" style="padding-bottom: 90px">
        <v-card width="460">
          <v-card-text class="text-center px-12 py-16">
            <v-form @submit.prevent="onSubmit" ref="form">
              <div class="text-h4 font-weight-black mb-10">회원가입</div>
              <div class="text-sm-caption">*는 필수 입력 사항입니다.</div>
              <div class="d-flex">
                <v-text-field v-model="email" label="이메일*" @change="emailValidation"
                              :rules="email_rule" :disabled="false" required/>
                <v-btn text large outlined style="font-size: 13px"
                       class="mt-3 ml-5" color="light-green darken-2"
                       @click="checkDuplicateEmail"
                       :disabled="!emailPass">
                  이메일 <br/>중복 확인
                </v-btn>
              </div>
              <div class="d-flex">
                <v-text-field v-model="password" label="비밀번호*" type="password"
                              :rules="password_rule" :disabled="false" required/>
              </div>
              <div class="d-flex">
                <v-text-field v-model="password_confirm" label="비밀번호 확인*" type="password" @change="passwordValidation"
                              :rules="password_confirm_rule" :disabled="false" required/>
              </div>
              <div class="d-flex">
                <v-text-field v-model="nickname" label="닉네임" type="nickName"
                              :rules="nickname_rule" :disabled="false" required/>
              </div>

              <v-btn type="submit" block x-large rounded
                     class="mt-6" color="light-green darken-2" :disabled="(this.$store.state.unDuplicateEmailPass && passwordPass) == false">
                가입하기
              </v-btn>

            </v-form>
          </v-card-text>
        </v-card>
      </v-col>

    </v-row>
  </div>
</template>

<script>
import {mapActions} from "vuex";

export default {
  name: "RegisterForm",
  data() {
    return {
      email: "",
      password: "",
      password_confirm: "",
      nickname: "",
      emailPass: false,
      passwordPass: false,

      email_rule: [
        v => !!v || '이메일을 입력해주세요.',
        v => {
          const replaceV = v.replace(/(\s*)/g, '')
          const pattern = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/
          return pattern.test(replaceV) || '이메일 형식을 입력하세요.'
        }
      ],

      password_rule: [
        v => this.state === 'ins' ? !!v || '패스워드는 필수 입력사항입니다.' : true,
        v => !(v && v.length >= 30) || '패스워드는 30자 이상 입력할 수 없습니다.',
      ],

      password_confirm_rule: [
        v => this.state === 'ins' ? !!v || '패스워드는 필수 입력사항입니다.' : true,
        v => !(v && v.length >= 30) || '패스워드는 30자 이상 입력할 수 없습니다.',
        v => v === this.password || '패스워드가 일치하지 않습니다.'
      ],

      nickname_rule: [
        v => !(v && v.length >= 20) || '닉네임은 30자 이상 입력할 수 없습니다.',
      ]

    } // return
  }, // data

  methods: {
    ...mapActions(['requestCheckDuplicateEmailToSpring']),

    emailValidation () {
      const emailValid = this.email.match(
          /^(([^<>()[\]\\.,;:\s@]+(\.[^<>()[\]\\.,;:\s@]+)*)|(.+))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
      );
      if (emailValid) {
        this.emailPass = true
      }
    },

    passwordValidation() {
      if((this.password == this.password_confirm) && (this.password.length != 0)){
        this.passwordPass = true
      }
    },

    async checkDuplicateEmail() {
      const emailValid = this.email.match(
          /^(([^<>()[\]\\.,;:\s@]+(\.[^<>()[\]\\.,;:\s@]+)*)|(.+))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
      );

      if(emailValid) {
        const { email } = this
        await this.requestCheckDuplicateEmailToSpring({email})
      }
    },

    onSubmit() {
      const { email, password, nickname } = this
      this.$emit("submit", { email, password, nickname})
    }
  }, // methods
}
</script>

<style scoped>

</style>