<template>
  <v-container>
      <v-card elevation="0" style="background-color: #ffff">
        <common-my-page-menu-button/>
        <v-card-text class="px-6 py-6">
          <table class="infotable">

            <tr>
              <th class="pr-1 text-right" style="font-weight: bolder">가입 날짜 : </th>
              <td class="pr-1">{{ loginUserProfile.createdDate }}</td>
            </tr>
            <!-- 아이디 -->
            <tr>
              <th class="pr-1 text-right" style="font-weight: bolder">아이디 : </th>
              <td class="pr-1">{{ this.loginUserProfile.email }}</td>
            </tr>

            <!-- 닉네임 -->
            <tr>
              <th class="pr-1 text-right" style="font-weight: bolder">닉네임 : </th>
              <td class="pr-1">

                <div class="d-flex justify-space-between" v-if="this.nickNameStatus == false">
                  {{ this.loginUserProfile.nickName }}
                  <v-btn x-small outlined class="ml-2" color="#356859" @click="changeNickNameStatus"> 수정 </v-btn>
                </div>

                <div class="d-flex justify-space-between" v-if="this.nickNameStatus == true">
                  <v-text-field
                      class="text-center"
                      style="font-size: small"
                      v-model="nickName"/>
                  <div class="d-flex justify-center flex-column">
                    <v-btn x-small outlined class="ml-2 mb-2" color="#356859" @click="toModifyNickName"> 등록 </v-btn>
                    <v-btn x-small outlined class="ml-2" color="#356859" @click="changeNickNameStatus"> 취소 </v-btn>
                  </div>
                </div>

              </td>
            </tr>

            <!-- 자기소개 -->

            <tr>

              <th class="pr-1 text-right" style="font-weight: bolder">자기소개 : </th>
              <td class="pr-1 text-center">
                <div class="d-flex justify-space-between" v-if="this.bioModifyStatus == false">
                  <p v-if="this.biography.length <= 0">
                    소개글이 없습니다.
                  </p>
                  <p v-else>
                    {{ loginUserProfile.biography }}
                  </p>
                  <v-btn x-small outlined class="ml-2" color="#356859" @click="changeBiographyStatus"> 수정 </v-btn>
                </div>

                <div class="d-flex justify-space-between" v-if="this.bioModifyStatus == true">
                  <v-textarea
                      class="text-center"
                      style="font-size: small"
                      v-model="biography"/>
                  <div class="d-flex justify-center flex-column">
                    <v-btn x-small outlined class="ml-2 mb-2" color="#356859" @click="toModifyBiography"> 등록 </v-btn>
                    <v-btn x-small outlined class="ml-2" color="#356859" @click="changeBiographyStatus"> 취소 </v-btn>
                  </div>
                </div>

              </td>

            </tr>

          </table>
        </v-card-text>
      </v-card>
  </v-container>
</template>

<script>
import CommonMyPageMenuButton from "@/components/common/CommonMyPageMenuButton";
import {mapActions} from "vuex";
export default {
  name: "MemberInformation",
  components: {CommonMyPageMenuButton},
  props: {
    loginUserProfile: {
      type: Array,
      required: true,
    }
  },
  data() {
    return {
      biography: "",
      bioModifyStatus: false,

      nickName: "",
      nickNameStatus: false,

      userToken: "",
    }
  },
  methods: {
    ...mapActions(['requestLoggedInUserProfileToSpring','requestNicknameModifyToSpring', 'requestBiographyModifyToSpring']),

    changeNickNameStatus() {
      if(this.nickNameStatus == true) {
        this.nickNameStatus = false
      } else {
        this.nickNameStatus = true
      }
    },

    changeBiographyStatus() {
      if(this.bioModifyStatus == true) {
        this.bioModifyStatus = false
      } else {
        this.bioModifyStatus = true
      }
    },

    async toModifyNickName() {
      this.userToken = localStorage.getItem("userInfo")
      const { userToken, nickName} = this
      await this.requestNicknameModifyToSpring({ userToken, nickName })
      await this.$router.go();
    },

    async toModifyBiography() {
      this.userToken = localStorage.getItem("userInfo")
      const { userToken, biography } = this
      await this.requestBiographyModifyToSpring({ userToken, biography })
      await this.$router.go();
    },

  },

  async mounted() {
    this.biography = this.loginUserProfile.biography
    this.nickName = this.loginUserProfile.nickName
  }
}
</script>

<style scoped>

.infotable {
  border-collapse: collapse;
  font-size: small;
}
.infotable th {
  color: #356859;
  background: #e1f0eb;
}
.infotable th, .infotable td {
  padding: 10px;
  border: 1px solid #ddd;
}
.infotable th:first-child, .infotable td:first-child {
  border-left: 0;
}
.infotable th:last-child, .infotable td:last-child {
  border-right: 0;
}

</style>