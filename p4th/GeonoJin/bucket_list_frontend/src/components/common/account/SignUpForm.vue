<template>
  <div style="font-family: Arial">
    <v-row justify="center">
      <v-col cols="auto">
        <div align="center">
          <router-link to="/home">
            <logo-component
                class="logo"
            />
          </router-link>
        </div>
        <div class="text-center px-12 py-16 mt-5">
          <v-form @submit.prevent="onSubmit" ref="form">
            <div class="text-h5 font-weight-black mb-10">
              회원가입
            </div>
            <v-divider></v-divider>
            <br/>
            <br/>
            <div class="d-flex">
              <v-layout>
                <v-text-field v-model="email" label="이메일" @change="emailValidation"
                              :rules="email_rule" :disabled="false" required outlined/>

                <v-btn text large outlined style="font-size: 13px"
                       class="mt-1 ml-4" color="teal lighten-1"
                       @click="checkDuplicateEmail"
                       :disabled="!emailButtonCheck">
                  이메일<br/>중복 확인
                </v-btn>
              </v-layout>
            </div>

            <div class="d-flex">
              <v-text-field v-model="password" label="비밀번호" type="password"
                            :rules="password_rule" :disabled="false" required outlined/>
            </div>

            <div class="d-flex">
              <v-text-field v-model="password_confirm" label="비밀번호 확인" type="password"
                            :rules="password_confirm_rule" :disabled="false" required outlined/>
            </div>

            <div class="d-flex">
              <v-layout>
                <v-text-field v-model="nickName" label="닉네임" @change="nicknameValidation" :disabled="false" :rules="nickname_rule" required outlined/>

                <v-btn text large outlined style="font-size: 13px"
                       class="mt-1 ml-4" color="teal lighten-1"
                       @click="checkDuplicateNickname"

                       :disabled="!nicknameButtonCheck">
                  닉네임<br/>중복 확인
                </v-btn>
              </v-layout>
            </div>

            <v-btn type="submit" block x-large rounded
                   class="mt-6" color="green lighten-1" :disabled="(signInCheckEmailPassValue & signInCheckNicknamePassValue) == false">
              가입하기
            </v-btn>
            <br/>
            <v-divider></v-divider>
            <br/>
            <div>
              <h5>이미 회원이신가요?<a href="/signIn" class="textLink">로그인</a></h5>
            </div>
          </v-form>
        </div>

      </v-col>
    </v-row>
  </div>
</template>

<script>
import LogoComponent from "@/components/common/LogoComponent";
import {mapActions, mapState} from "vuex";

export default {
  name: "SignUpForm",
  components: {
    LogoComponent
  },
  data() {
    return {
      email: "",
      password: "",
      password_confirm: "",
      nickName: "",
      emailPass: false,
      nicknamePass: false,
      emailButtonCheck: false,
      nicknameButtonCheck: false,
      signInCheckEmailPassValue: false,
      signInCheckNicknamePassValue: false,

      email_rule: [
        v => !!v || '이메일을 입력해주세요.',
        v => {
          const replaceV = v.replace(/(\s*)/g, '')
          const pattern = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/
          return pattern.test(replaceV) || '이메일 형식을 입력하세요.'
        }
      ],
      password_rule: [
          v => !!v || '비밀번호를 입력해주세요',
        v => this.state === 'ins' ? !!v || '패스워드는 필수 입력사항입니다.' : true,
        v => !(v && v.length >= 30) || '패스워드는 30자 이상 입력할 수 없습니다.',
      ],
      password_confirm_rule: [
        v => this.state === 'ins' ? !!v || '패스워드는 필수 입력사항입니다.' : true,
        v => !(v && v.length >= 30) || '패스워드는 30자 이상 입력할 수 없습니다.',
        v => v === this.password || '패스워드가 일치하지 않습니다.'
      ],
      nickname_rule:[
        v => !!v || '닉네임을 입력해주세요.'
      ]
    }
  },
  methods: {
    ...mapActions([
      'checkDuplicateEmailToSpring',
      'checkDuplicateNicknameToSpring'
    ]),
    ...mapState([
      'emailPassValue',
      'nicknamePassValue'
    ]),
    onSubmit() {
      if (this.$refs.form.validate()) {
        const {email, password, nickName} = this
        this.$emit("submit", {email, password, nickName})
      } else {
        alert('올바른 정보를 입력하세요!')
      }


    },
    emailValidation() {
      const emailValid = this.email.match(
          /^(([^<>()[\]\\.,;:\s@]+(\.[^<>()[\]\\.,;:\s@]+)*)|(.+))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
      );
      if (emailValid) {
        this.emailButtonCheck = true
      }
    },
    nicknameValidation(){
      this.nicknameButtonCheck = true
    },
    checkDuplicateEmail: async function() {
      const emailValid = this.email.match(
          /^(([^<>()[\]\\.,;:\s@]+(\.[^<>()[\]\\.,;:\s@]+)*)|(.+))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
      );

      if (emailValid) {
        const {email} = this
        await this.checkDuplicateEmailToSpring({email})

        if (!this.$store.state.emailPassValue) {
          this.signInCheckEmailPassValue = false
        }else{
          this.signInCheckEmailPassValue = true
        }

      }
    },

    async checkDuplicateNickname(){
      await this.checkDuplicateNicknameToSpring(this.nickName)

      if (this.$store.state.nicknamePassValue) {
        this.signInCheckNicknamePassValue = true
      }else{
        this.signInCheckNicknamePassValue = false
      }
    },
  }
}
</script>

<style scoped>
.logo {
  width: 170px;
  margin-top: 50px;
  margin-bottom: 30px;
}

.textLink{
  text-decoration: none;
  color: purple;
}
</style>