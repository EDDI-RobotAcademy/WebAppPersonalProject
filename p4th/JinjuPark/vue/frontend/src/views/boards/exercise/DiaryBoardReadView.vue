<template>
  <v-container>
  <div>
    <common-main-menu-template/>
    <common-image-card
        board-title="운동 일기"
        board-sub-text="오늘의 운동은 어떠셨나요? 당신의 근성장을 응원합니다."
        imgName="diary_camera.jpg"/>
    <diary-board-read v-if="diaryBoard" :diaryBoard="diaryBoard"/>
    <p v-else>Loading....</p>
    <v-container>
<!--      로그인한 경우, 작성자와 닉네임이 동일한 경우에만 수정 삭제 버튼 보이도록 구현 -->
    <v-card class="mt-3" width="850px" elevation="0" v-if="this.$store.state.userLoginCheck">
      <v-row >
      <v-col align="left"><common-button-white btn-name="Back" @click="back"/></v-col>
      <v-col align="right" v-if="loginUser[0].nickname === diaryBoard.writer">
        <common-button-white btn-name="수정" @click="toModifyView"/>
        <common-button-blue btn-name="삭제" />
      </v-col>
      <!--        추천 /비추천 가운데 정렬용으로 내용없는 v-card 배치-->
        <v-col v-else>
          <v-card style="background-color: white"></v-card>
        </v-col>

      </v-row>
    </v-card>
<!--       로그인하지 않은 경우, back 버튼만 구현 -->
      <v-card class="mt-3" width="850px" elevation="0" v-else>
        <v-row >
          <v-col align="left"><common-button-white btn-name="Back" @click="back"/></v-col>
          <!--        추천 /비추천 가운데 정렬용으로 내용없는 v-card 배치-->
          <v-col>
            <v-card style="background-color: white"></v-card>
          </v-col>
        </v-row>
      </v-card>
    </v-container>
    <common-footer-template/>
  </div>
  </v-container>
</template>

<script>
import DiaryBoardRead from "@/components/boards/exercise/DiaryBoardRead";
import {mapActions, mapState} from "vuex";

export default {
  name: "DiaryBoardReadView",
  components: {DiaryBoardRead},
  props: {
    boardNo: {
      type: String,
      required: true
    }
  },
  data(){
    return{
      thumbType: "",
    }
  },
  computed: {
    ...mapState(['diaryBoard', 'loginUser', 'userLoginCheck'])
  },
  methods:{
    ...mapActions([
        'requestDiaryBoardFromSpring',
        'requestLoginUserFromSpring',
        'requestModifyDiaryBoardCommentToSpring',
    ]),
    toModifyView(){
      this.$router.push({name: 'DiaryBoardModifyView',
        params: { boardNo: this.boardNo }})
    },
    back(){
      this.$router.push({ name: 'DiaryBoardListView' })
    },
  },
  created() {
    console.log("다이어리 게시글 조회 페이지")
    this.requestDiaryBoardFromSpring(this.boardNo)

  },
  mounted(){
    if(window.localStorage.getItem('userInfo') != null) {
      this.$store.commit('USER_LOGIN_CHECK', true)
      let userToken = window.localStorage.getItem('userInfo')
      this.requestLoginUserFromSpring(userToken)
    }
  },
}
</script>

<style scoped>

</style>