<template>
  <div>
    <v-container class="myPageHeader">
      <div>
        <tool-bar-component/>
      </div>
      <br/>
      <v-divider></v-divider>
    </v-container>
    <br/>

    <v-container>
      <div class="row" style="height: 600px">
        <div class="col-sm-3">
          <h2 align="center">마이페이지</h2>
        </div>
        <v-divider vertical></v-divider>
        <div class="col-sm-9">
          <div class="myPageContent">
            <h3>계정 정보</h3>
          </div>
          <v-divider></v-divider>
          <div style="margin-left: 80px">
            <div class="settingTitle">
              <h5>닉네임</h5>
            </div>
            <div class="settingContent">
              <v-form @submit.prevent="onSubmit" ref="form">
                <v-layout>
                  <v-text-field v-model="nickName"
                                outlined dense
                  >
                  </v-text-field>
                  <v-btn rounded-xl elevation="0" color="green lighten-1"
                         @click="changeNicknameOverlapCheck"
                  >
                    중복 확인
                  </v-btn>
                </v-layout>
                <div align="end">
                  <v-btn rounded elevation="0" color="green lighten-1" type="submit"
                         :disabled="signInCheckNicknamePassValue == false"
                  >
                    수정
                  </v-btn>
                </div>
              </v-form>
            </div>
          </div>
        </div>
      </div>
    </v-container>
  </div>


</template>

<script>
import ToolBarComponent from "@/components/common/ToolBarComponent";
import {mapActions} from "vuex";

export default {
  name: "MyPageForm",
  components: {ToolBarComponent},
  props:{
    nickname:{
      type: String,
      required: true
    }
  },
  data() {
    return {
      nickName: '',
      signInCheckNicknamePassValue: false,
      currentUserToken: ''
    }
  },
  methods: {
    ...mapActions([
      'checkDuplicateNicknameToSpring'
    ]),
    onSubmit() {
      if (this.$refs.form.validate()) {
        const {nickName, currentUserToken} = this
        this.$emit("submit", {nickName, currentUserToken})
      } else {
        alert("닉네임을 입력하세요")
      }
    },
    async changeNicknameOverlapCheck() {
      await this.checkDuplicateNicknameToSpring(this.nickName)

      if (this.$store.state.nicknamePassValue) {
        const userToken = localStorage.getItem('userInfo')
        const replacedUserValue = userToken.replaceAll("\"", "")

        this.currentUserToken = replacedUserValue
        this.signInCheckNicknamePassValue = true

      } else {
        this.signInCheckNicknamePassValue = false
      }
    },
  },
  created() {
    this.nickName = this.nickname
  }
}
</script>

<style scoped>
.myPageHeader {
  padding-top: 50px;
}

.myPageContent {
  margin-left: 80px;
  margin-top: 50px;
  margin-bottom: 40px;
}

.settingTitle {
  margin-top: 80px;
  margin-left: 20px;
}

.settingContent {
  margin-top: 10px;
  margin-left: 20px;
  width: 450px;
}
</style>