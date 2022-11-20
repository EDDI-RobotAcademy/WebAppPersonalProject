<template>
  <div align="center">
    <h2>게시물 읽기</h2>
    <board-read-form
        :board="board"
        v-if="board"
    />
    <p v-else>Loading.............</p>
    <router-link
        :to="{name: 'BoardModifyView', params: { boardNo }}"
        style="text-decoration: none;"
    >
      <common-button
          btn-name="수정">
      </common-button>
    </router-link>
    <common-button
        btn-name="삭제"
        @click="deleteBoard"
    />
    <router-link
        :to="{ name: 'QuestionBoardListView' }"
        style="text-decoration: none;"
    >
      <common-button
          btn-name="돌아가기">
      </common-button>
    </router-link>
  </div>

</template>

<script>
import {mapActions, mapState} from "vuex";
import BoardReadForm from "@/components/board/BoardReadForm";

export default {
  name: "BoardReadView",
  components: {BoardReadForm},
  props: {
    boardNo: {
      type: String,
      required: true
    },
  },
  computed: {
    ...mapState([
      'board'
    ])
  },
  methods: {
    ...mapActions([
      'requestQuestionBoardContentsFromSpring',
      'requestDeleteBoardToSpring'
    ]),
    deleteBoard() {
      this.requestDeleteBoardToSpring(this.boardNo)
      this.$router.push({ name: 'QuestionBoardListView' })

    }
  },
  created() {
    this.requestQuestionBoardContentsFromSpring(this.boardNo)
  }
}
</script>

<style scoped>

</style>