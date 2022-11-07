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
          <v-btn rounded elevation="0" style="margin-top: 10px" color="white" @click="refreshNickname">
            <v-icon>mdi-refresh</v-icon>
          </v-btn>
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
import {mapActions, mapState} from "vuex";

export default {
  name: "MyPageForm",
  components: {ToolBarComponent},
  data() {
    return {
      nickName: '',
      signInCheckNicknamePassValue: false,
    }
  },
  methods: {
    ...mapState([
      'currentUserNickname'
    ]),
    ...mapActions([
      'checkDuplicateNicknameToSpring'
    ]),
    onSubmit() {
      if (this.$refs.form.validate()) {
        const {nickName} = this
        this.$emit("submit", {nickName})
      } else {
        alert("닉네임을 입력하세요")
      }
    },
    async changeNicknameOverlapCheck() {
      const {nickName} = this
      await this.checkDuplicateNicknameToSpring({nickName})

      if (this.$store.state.nicknamePassValue) {
        this.signInCheckNicknamePassValue = true
      } else {
        this.signInCheckNicknamePassValue = false
      }
    },
    refreshNickname() {
      this.nickName = this.$store.state.currentUserNickname
    }
  },
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