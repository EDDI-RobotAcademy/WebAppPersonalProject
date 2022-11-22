<template>
  <div align="center" style="margin-bottom: 50px">
    <div>
      <board-read-form
          :board="board"
          v-if="board"
      />
      <p v-else>Loading.............</p>
    </div>
    <div>
      <router-link
          :to="{name: 'BoardModifyView', params: { boardNo }}"
          style="text-decoration: none;"
      >
        <common-button
            btn-name="수정"
            class="mr-3 ml-3"
        />
      </router-link>
      <common-button
          btn-name="삭제"
          @click="deleteBoard"
          class="mr-3 ml-3"
      />
      <router-link
          :to="{ name: 'QuestionBoardListView' }"
          style="text-decoration: none;"
      >
        <common-button
            btn-name="돌아가기"
            class="mr-3 ml-3"
        />
      </router-link>
    </div>
    <div class="mt-5">
      <comment-list-form
          :headers="headers"
          :items="comments"/>
    </div>
  </div>

</template>

<script>
import {mapActions, mapState} from "vuex";
import BoardReadForm from "@/components/board/BoardReadForm";
import CommentListForm from "@/components/board/CommentListForm";

export default {
  name: "BoardReadView",
  components: {BoardReadForm, CommentListForm},
  data() {
    return {
      headers: [
        {text: '작성자', value: 'writer'},
        {text: '내용', value: 'content'},
        {text: '등록일자', value: 'regDate'},
      ],
    }
  },
  props: {
    boardNo: {
      type: String,
      required: true
    },
  },
  computed: {
    ...mapState([
      'board',
      'comments'
    ])
  },
  methods: {
    ...mapActions([
      'requestQuestionBoardContentsFromSpring',
      'requestDeleteBoardToSpring',
      'requestCommentsFromSpring'
    ]),
    deleteBoard() {
      this.requestDeleteBoardToSpring(this.boardNo)
      this.$router.push({ name: 'QuestionBoardListView' })
    }
  },
  created() {
    this.requestQuestionBoardContentsFromSpring(this.boardNo)
    this.requestCommentsFromSpring(this.boardNo)
  }
}
</script>

<style scoped>

</style>