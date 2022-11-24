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
                         style="margin-top: 2px"
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

          <v-divider style="margin-top: 50px"></v-divider>

          <div>
            <div class="myPageContent">
              <h3>회원 탈퇴</h3>
            </div>

            <div class="myPageContent">
              <v-layout style="margin-left: 90px">
                <v-card>
                  <v-card-text>
                    <h4 style="margin-bottom: 20px">주의!🚨 꼭 읽어봐주세요!</h4>
                    <hr/>
                    <h5 style="margin-top: 5px"> ▪ 직접 작성한 버킷리스트는 자동으로 삭제되지 않으며, <br/> &nbsp;&nbsp;&nbsp; 만일 삭제를 원하시면 탈퇴 이전에 직접 삭제해야합니다. </h5>
                    <h5 style="margin-top: 10px; margin-bottom: 30px">▪ 탈퇴 후 동일한 메일로 재가입이 가능합니다.</h5>
                    <v-divider></v-divider>
                    <h5 style="margin-top: 10px">▪ 닉네임 확인 시 위의 항목들에 대해 동의한 것으로 간주됩니다.</h5>
                  </v-card-text>
                </v-card>
              </v-layout>

              <div style="margin-top: 40px">
                <v-form style="width: 500px">
                  <div style="margin-bottom: 5px">
                    <h5 style="color: red"> 🚨 계정을 삭제하시려면 현재 닉네임을 입력해주세요. </h5>
                  </div>
                  <v-layout>
                    <v-text-field placeholder="현재 닉네임 입력" outlined dense
                                  v-model="deleteNickname"
                    />
                    <v-btn color="yellow" rounded-xl elevation="0" style="margin-top: 2px"
                           @click="checkNickname"
                    >
                      닉네임 확인
                    </v-btn>
                  </v-layout>

                  <div v-if="!this.alertWarning">
                    <v-alert :value="checkNicknameValue"
                             outlined
                             type="warning"
                             text
                             dense
                    >
                      <h4>{{ this.alertMessage }}</h4>
                    </v-alert>
                  </div>
                  <div v-else>
                    <v-alert :value="checkNicknameValue"
                             outlined
                             type="success"
                             text
                             dense
                    >
                      <h4>{{ this.alertMessage }}</h4>
                    </v-alert>
                  </div>

                  <div align="end">
                    <v-btn rounded elevation="0" color="red lighten-1" type="submit"
                           :disabled="this.alertWarning == false"
                           @click.prevent="deleteUserInfo"
                    >
                      <h4>회원탈퇴</h4>
                    </v-btn>
                  </div>
                </v-form>
              </div>
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
  props: {
    nickname: {
      type: String,
      required: true
    }
  },
  data() {
    return {
      nickName: '',
      signInCheckNicknamePassValue: false,
      currentUserToken: '',
      deleteNickname: '',
      alertMessage: '',
      checkNicknameValue: false,
      alertWarning: false,
      snackbar: false
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
    checkNickname(){
      if (this.deleteNickname == this.nickname) {
        this.checkNicknameValue = true;
        this.alertMessage = "입력한 닉네임과 일치합니다. 회원탈퇴를 진행합니다.";
        this.alertWarning = true

      } else {
        this.checkNicknameValue = true;
        this.alertMessage = "입력한 닉네임과 일치하지 않습니다."
      }
    },
    deleteUserInfo(){
      this.$emit('deleteMember', this.nickname)
    }
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