<template>
  <div style="font-family: Arial">
    <v-row justify="center">
      <v-col cols="auto" class="mt-10">
        <v-card flat width="460">
          <v-card-text class="text-center px-12 py-16">
            <v-form @submit.prevent="onSubmit" ref="form">
              <div class="text-h4 font-weight-bold grey--text text--darken-1 mb-13">
                회원가입
              </div>
              <div class="d-flex">
                <v-text-field outlined v-model="email" label="이메일" @change="emailValidation"
                              :rules="email_rule" :disabled="false" color="light-green darken-3" required/>
                <v-btn text x-large outlined style="font-size: 13px"
                       class="mt-1 ml-5" color="light-green darken-3"
                       @click="checkDuplicateEmail"
                       :disabled="!emailPass">
                  이메일 <br/>중복 확인
                </v-btn>
              </div>
              <div class="d-flex">
                <v-text-field outlined v-model="password" label="비밀번호" type="password" color="light-green darken-3"
                              :rules="password_rule" :disabled="false" required/>
              </div>
              <div class="d-flex">
                <v-text-field outlined v-model="password_confirm" label="비밀번호 확인" type="password"
                              :rules="password_confirm_rule" :disabled="false" color="light-green darken-3" required/>
              </div>
              <div class="d-flex">
                <v-text-field outlined v-model="name" label="이름" :disabled="false" color="light-green darken-3" required/>
              </div>
              <div class="d-flex">
                <v-text-field outlined v-model="zipcode" label="우편번호" :disabled="true" color="light-green darken-3" required/>
                <common-button
                  text
                  x-large
                  outlined
                  btn-name="주소 확인"
                  style="font-size: 13px"
                  color="light-green darken-3"
                  class="mt-1 ml-5"
                  @click="callDaumAddressApi"
                  :disabled="false"/>
              </div>
              <div class="d-flex">
                <v-text-field outlined v-model="city" label="도시" :disabled="true" color="light-green darken-3" required/>
              </div>
              <div class="d-flex">
                <v-text-field outlined v-model="street" label="기본 주소" :disabled="true" color="light-green darken-3" required/>
              </div>
              <div class="d-flex">
                <v-text-field outlined v-model="addressDetail" label="상세 주소" :disabled="false" color="light-green darken-3" required/>
              </div>
              <common-button
                block
                x-large
                btn-name="가입하기"
                type="submit"
                color="light-green"
                class="mt-1 white--text"
                :disabled="(emailPass & streetPass) == false"/>
            </v-form>
          </v-card-text>
        </v-card>
      </v-col>
    </v-row>
  </div>
</template>

<script>



import axios from "axios";

export default {
  name: "SignUpForm",
  data () {
    return {
      email: "",
      password: "",
      password_confirm: "",
      name: "",
      city: '',
      street: '',
      addressDetail: '',
      zipcode: '',
      emailPass: false,
      streetPass: false,
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
    }
  },
  methods: {
    onSubmit () {
      if (this.$refs.form.validate()) {
        const { email, password, name, city, street, addressDetail, zipcode } = this
        this.$emit("submit", { email, password, name, city, street, addressDetail, zipcode })
      } else {
        alert('올바른 정보를 입력하세요!')
      }
    },
    emailValidation () {
      const emailValid = this.email.match(
          /^(([^<>()[\]\\.,;:\s@]+(\.[^<>()[\]\\.,;:\s@]+)*)|(.+))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
      );
      if (emailValid) {
        this.emailPass = true
      }
    },
    checkDuplicateEmail () {
      const emailValid = this.email.match(
          /^(([^<>()[\]\\.,;:\s@]+(\.[^<>()[\]\\.,;:\s@]+)*)|(.+))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
      );
      if (emailValid) {
        const {email} = this
        axios.post(`http://localhost:7777/plants/member/check-email/${email}`)
            .then((res) => {
              if (res.data) {
                alert("사용 가능한 이메일입니다!")
                this.emailPass = true
              } else {
                alert("중복된 이메일입니다!")
                this.emailPass = false
              }
            })
      }
    },
    callDaumAddressApi () {
      new window.daum.Postcode({
        oncomplete: (data) => {
          let fullRoadAddr = data.roadAddress;
          let extraRoadAddr = '';
          if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
            extraRoadAddr += data.bname;
          }
          if (data.buildingName !== '' && data.apartment === 'Y') {
            extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
          }
          if (extraRoadAddr !== '') {
            extraRoadAddr = ' (' + extraRoadAddr + ')';
          }
          if (fullRoadAddr !== '') {
            fullRoadAddr += extraRoadAddr;
          }
          this.city = data.sido;
          this.zipcode = data.zonecode;
          this.street = data.sigungu + ' ' + fullRoadAddr;
          this.streetPass = true
        }
      }).open()
    }
  }
}
</script>

<style scoped>

</style>