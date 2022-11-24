<template>
  <v-container>
<!--    댓글 게시란 -->
  <!--   1. 등록된 댓글이 없을 경우-->
    <v-row v-if="!diaryComment || (Array.isArray(diaryComment) && diaryComment.length === 0)">
      <v-card width="850px" height="auto" style="background-color:white; border-top: 4px solid gray ">
        <v-row class="ml-3 mt-3">
        <p><b>댓글</b><v-icon>mdi-message-text-outline</v-icon></p>
        </v-row>
        <v-row class="ml-3 mt-3" style="height: 60px">
          {{commentDefault}}
        </v-row>
      </v-card>
    </v-row>
  <!--   2. 등록된 댓글이 있는 경우-->
    <v-row v-else>
      <v-card width="850px" height="auto" style="background-color:white; ">
        <v-row class="ml-3 mt-5" >
          <p><b>댓글</b><v-icon>mdi-message-text-outline</v-icon></p>
        </v-row>
    <!-- v-for 돌려서 store에 있는 diaryComment 리스트 뿌려주기 -->
        <v-card v-for="(commentList, idx) in diaryComment" :key="idx" class="ml-3 mt-5 mb-10 pb-5" style="width:800px; height:auto" elevation="1" >
          <v-row class="ml-3" style="height: 40px">
            <p class="mt-2" style="color:dodgerblue" >{{commentList.writerNickname}}</p>&nbsp;&nbsp;&nbsp;&nbsp;
            <p class="mt-3" style="color: gray; font-size: small">{{commentList.regDate}}</p>
            <p><v-btn plain class="mt-0 " style=" font-size: small" >답글</v-btn></p>
            <v-spacer></v-spacer>
      <!-- 작성자 본인만 수정 삭제 버튼 보이도록   -->
            <span v-if="isAuthenticated && (loginUser[0].id == commentList.writerId)">
              <p class="mt-1 mr-3">
              <v-btn plain style="padding-right:0px; font-size: small" @click="commentModify(commentList.id)" >수정</v-btn>
              <v-btn plain style="font-size: small" @click="deleteComment(commentList.id)"><v-icon >mdi-trash-can-outline</v-icon></v-btn>
               </p>
            </span>
          </v-row>
      <!-- 댓글 수정버튼 누름 : !commentModifyShow 이지만 commentModifySelectId가 아닌 게시글은 그대로 출력되게-->
        <!-- (1) 댓글 수정 버튼 누르기 전   -->
          <v-row v-if="!commentModifyShow" class="ml-3" style=" width:770px">{{commentList.content}}</v-row>
        <!-- (2) 댓글 수정 버튼 눌렀을 때 해당 수정 댓글 아닌 다른 댓글의 경우 그냥 그대로 있기 ->조건:  commentModifyShow= true & 해당 댓글 id와 일치 안함  -->
          <v-row v-else-if="commentModifyShow && !(commentList.id == commentModifySelectId)" class="ml-3" style=" width:770px">{{commentList.content}}</v-row>
        <!-- (3) 댓글 수정 버튼 눌렀을 때 해당 댓글인 경우 -> 해당 댓글 본문 담아서(v-for 값) input 박스 보여줌  -->
          <v-row v-else>
            <form @submit="modifySubmit(commentList.content)">
              <v-row class="ml-10 mt-1">
                <input type="text" name="content" v-model="commentList.content" style="width:720px; height: 30px; border:2px solid gray; border-radius: 2px; background-color: white ; ">
              </v-row>
              <v-row class="justify-end mr-0 mt-5 mb-5">
                <common-button-blue btn-name="완료" type="submit"/>
              </v-row>
            </form>
          </v-row>

        </v-card>

      </v-card>

    </v-row>

<!--    댓글 입력 창 -->
    <v-row>
      <v-card width="850px" height="210px" style="background-color:ghostwhite; border-bottom: 4px solid gray; border-top: 4px solid gray ">
        <v-row class="ml-3 mt-3">
          <p><b>댓글 작성</b><v-icon>mdi-pen</v-icon></p>
        </v-row>
        <form @submit="onSubmit">
        <v-row class="ml-1 mt-1">
          <input type="text" name="content" v-model="content" style="width:840px; height: 110px; border:2px solid gray; border-radius: 2px; background-color: white ; ">
        </v-row>
        <v-row class="justify-end mr-3 mt-5">
          <common-button-blue btn-name="작성" type="submit"/>
        </v-row>
        </form>
      </v-card>
    </v-row>
  </v-container>

</template>

<script>
import {mapState} from "vuex";

export default {
  name: "CommonCommentTextField",
  data(){
    return{
      content:"",
      parentsCommentId: 0, // 답글용
      commentDefault: "등록된 댓글이 없습니다",
      commentModifyShow: false,
      commentModifySelectId: ""
    }
  },
  computed: {
    ...mapState(['diaryComment', 'loginUser', 'isAuthenticated'])
  },
  methods:{
    onSubmit() {
      if (window.localStorage.getItem('userInfo') != null) {
        const {content, parentsCommentId} = this
        this.$emit('submit', {content, parentsCommentId})
      } else {
        alert("로그인한 경우 댓글 작성이 가능합니다.")
      }
    },
    commentModify(payload){
      this.commentModifySelectId = payload
      console.log("댓글 수정 선택번호: "+ this.commentModifySelectId)
      this.commentModifyShow = true
    },
    modifySubmit(content){
      const updateContent = content
      const commentId = this.commentModifySelectId
      console.log("1차 에밋-댓글 수정 전 id: "+ commentId +"컨텐트: "+ updateContent)
      const {parentsCommentId} = this
      this.$emit('modify', {commentId, updateContent, parentsCommentId})
      this.commentModifyShow = false
    },
    deleteComment(id){
      this.$emit('delete', {id})
    }
  }
}
</script>

<style scoped>

</style>