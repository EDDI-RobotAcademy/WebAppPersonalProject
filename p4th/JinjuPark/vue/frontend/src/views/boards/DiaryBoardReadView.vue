<template>
  <v-container>
  <div>
    <common-main-menu-template/>
    <common-image-card
        imgName="re_winter_white_banner.png"/>
    <diary-board-read v-if="diaryBoard" :diaryBoard="diaryBoard"/>
    <p v-else>Loading....</p>
    <v-container>
      <v-row class="mt-3 ml-1">
        <common-comment-text-field @submit="onSubmit" @modify="commentModify" @delete="deleteComment"/>
      </v-row>
    </v-container>
    <v-container>
<!--      로그인한 경우, 작성자와 닉네임이 동일한 경우에만 수정 삭제 버튼 보이도록 구현 -->
    <v-card class="mt-3" width="850px" elevation="0" v-if="this.$store.state.userLoginCheck">
      <v-row >
      <v-col align="left"><common-button-white btn-name="Back" @click="back"/></v-col>
<!--        추천수 스프링에서 받아서 states 값으로 commit -->
        <v-col align="center">
          <v-btn
              color="#757575"
              text
              @click="thumbUp">
            <v-icon>mdi-thumb-up</v-icon>
            {{this.$store.state.thumbStatusCount[0]}} 추천
          </v-btn>
          <v-btn
              color="#757575"
              text
              @click="thumbDown">
            <v-icon>mdi-thumb-down</v-icon>
            {{this.$store.state.thumbStatusCount[1]}}비추천
          </v-btn>
        </v-col>
      <v-col align="right" v-if="loginUser[0].id === diaryBoard.member.id">
        <common-button-white btn-name="수정" @click="toModifyView"/>
        <common-button-blue btn-name="삭제" @click="onDelete"/>
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
          <v-col align="center">
            <v-btn
                color="#757575"
                text
                @click="thumbUp">
              <v-icon>mdi-thumb-up</v-icon>
              {{thumbStatusCount[0]}} 추천
            </v-btn>
            <v-btn
                color="#757575"
                text
                @click="thumbDown">
              <v-icon>mdi-thumb-down</v-icon>
              {{thumbStatusCount[1]}}비추천
            </v-btn>
          </v-col>
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
import DiaryBoardRead from "@/components/boards/DiaryBoardRead";
import {mapActions, mapState} from "vuex";

export default {
  name: "DiaryBoardReadView",
  components: {DiaryBoardRead},
  props: {
    boardNo: {
      type: String,
      required: true
    },
    pageNo: Number
  },
  data(){
    return{
      thumbType: "",
    }
  },
  computed: {
    ...mapState(['diaryBoard', 'loginUser', 'userLoginCheck', 'thumbStatusCount', 'diaryComment'])
  },
  methods:{
    ...mapActions([
        'requestDiaryBoardFromSpring',
      'requestDeleteDiaryBoardToSpring',
        'requestLoginUserFromSpring',
        'requestThumbStatusToSpring',
        'requestCreateDiaryBoardCommentToSpring',
        'requestCommentListFromSpring',
        'requestModifyDiaryBoardCommentToSpring',
        'requestDeleteCommentBoardToSpring',
        'requestImageReadFromSpring'
    ]),
    async onDelete () {
      await this.requestDeleteDiaryBoardToSpring(this.boardNo);
      await this.$router.push({ name: 'DiaryBoardListView' })             // 삭제후 리스트 화면으로 바로 전환되도록
    },
    toModifyView(){
      this.$router.push({name: 'DiaryBoardModifyView',
        params: { boardNo: this.boardNo }})
    },
    back(){
      //DiaryBoardReadView에서 게시글 클릭 시 router- link params에 boardNo와 pageNo 같이 보내서 props로 받음
      if(this.pageNo == 0){
        this.$router.push({ name: 'AllBoardListView' })
      }else if(this.pageNo == 1){
        this.$router.push({ name: 'DiaryBoardListView' })
      }else if (this.pageNo == 2){
        this.$router.push({ name: 'FreeBoardListView' })
      } else if(this.pageNo ==3){
        this.$router.push({ name: 'QNABoardListView' })
      } else if(this.pageNo ==9){
        this.$router.push({ name: 'MyDiaryBoardListView' })
      } else{
        this.$router.push({ name: 'AllBoardListView' })
      }
    },
    async thumbUp(){
      if(window.localStorage.getItem('userInfo') != null) {
        const memberId = this.$store.state.loginUser[0].id
        const thumbType = "thumbUp"
        const boardNo = this.boardNo
        await this.requestThumbStatusToSpring({ memberId, boardNo, thumbType})
      } else {
       alert("로그인한 경우에 추천 가능합니다.")
      }
    },
    async thumbDown(){
      if(window.localStorage.getItem('userInfo') != null) {
        const memberId = this.$store.state.loginUser[0].id
        const thumbType = "thumbDown"
        const boardNo = this.boardNo
        await this.requestThumbStatusToSpring({ memberId, boardNo, thumbType})
      } else {
        alert("로그인한 경우에 비추천 가능합니다.")
      }
    },
    async onSubmit(payload){
      const { content, parentsCommentId } = payload
      const writerId = this.$store.state.loginUser[0].id
      const writerNickname = this.$store.state.loginUser[0].nickname
      const boardNo = this.boardNo
      console.log("댓글 버튼 메소드 호출전:" +content+"부모댓글 id:"+parentsCommentId)
      await this.requestCreateDiaryBoardCommentToSpring({ boardNo, writerId, writerNickname, parentsCommentId, content })
      await this.requestCommentListFromSpring(boardNo)
    },
    async commentModify(payload){
      const { commentId, updateContent, parentsCommentId } = payload
      const writerNickname = this.$store.state.loginUser[0].nickname
      const writerId = this.$store.state.loginUser[0].id
      const boardNo = this.boardNo
      console.log("댓글 수정버튼 메소드 호출전:" +updateContent+"부모댓글 id:"+parentsCommentId)
      await this.requestModifyDiaryBoardCommentToSpring({ commentId, boardNo, writerId, writerNickname, parentsCommentId, updateContent })
      await this.requestCommentListFromSpring(this.boardNo)
    },
    async deleteComment(payload) {
      const commentIdObj = payload.valueOf()
      const commentId = commentIdObj.id
      console.log('삭제 에밋 받은 후- 액션 호출 전' + commentId)
      await this.requestDeleteCommentBoardToSpring({commentId})
      await this.requestCommentListFromSpring(this.boardNo)
    },
  },
  async mounted(){
    if(window.localStorage.getItem('userInfo') != null) {
      this.$store.commit('USER_LOGIN_CHECK', true)
      let userToken = window.localStorage.getItem('userInfo')
      await this.requestLoginUserFromSpring(userToken)
    }
    const boardNo = this.boardNo
    console.log("다이어리 게시글 조회 페이지")
    const memberId = this.$store.state.loginUser[0].id
    const thumbType = "thumbCheck"
    await this.requestImageReadFromSpring(this.boardNo)
    await this.requestDiaryBoardFromSpring(this.boardNo)
    await this.requestThumbStatusToSpring({ memberId, boardNo, thumbType})
    await this.requestCommentListFromSpring(this.boardNo)

  },
}
</script>

<style scoped>

</style>