<template>
  <div align="center">
    <h2>질문게시글 수정</h2>
    <question-board-modify-form v-if="questionBoard" :questionBoard="questionBoard" @submit="onSubmit"/>
    <p v-else>Loading .........</p>
  </div>
</template>

<script>
import QuestionBoardModifyForm from "@/views/insoya/Components/QuestionBoard/QuestionBoardModifyForm";
import {mapActions, mapState} from "vuex";
export default {
  name: "QuestionBoardModifyView",
  components: {QuestionBoardModifyForm},
  props: {
    boardNo: {
      type: String,
      required: true,
    }
  },
  computed: {
    ...mapState(['questionBoard'])
  },
  methods: {
    ...mapActions([
      'requestQuestionBoardFromSpring',
      'requestQuestionBoardModifyToSpring'
    ]),
    async onSubmit (payload) {
      const { title, content, writer, regDate } = payload
      const boardNo = this.boardNo

      await this.requestQuestionBoardModifyToSpring({ boardNo, title, content, writer, regDate })
      await this.$router.push({
        name: 'QuestionBoardReadView',
        params: { boardNo: this.boardNo }
      })
    }
  },
  created () {
    this.requestQuestionBoardFromSpring(this.boardNo)
  }
}
</script>

<style scoped>

</style>