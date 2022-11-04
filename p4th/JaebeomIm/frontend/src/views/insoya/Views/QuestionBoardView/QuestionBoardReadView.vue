<template>
  <div align="center">
    <h2>질문게시글 읽기</h2>
    <question-board-read v-if="questionBoard" :questionBoard="questionBoard"/>
    <p v-else>Loading .......</p>
    <router-link :to="{ name: 'QuestionBoardModifyView', params: { boardNo } }">
      게시물 수정
    </router-link>
    <button @click="onDelete">삭제</button>
    <router-link :to="{ name: 'QuestionBoardListView' }">
      돌아가기
    </router-link>
  </div>
</template>

<script>
import QuestionBoardRead from "@/views/insoya/Components/QuestionBoard/QuestionBoardRead";
import {mapActions, mapState} from "vuex";
export default {
  name: "QuestionBoardReadView",
  components: {QuestionBoardRead},
  props: {
    boardNo: {
      type: String,
      required: true
    }
  },
  computed: {
    ...mapState(['questionBoard'])
  },
  methods: {
    ...mapActions([
      'requestQuestionBoardFromSpring',
      'requestDeleteQuestionBoardToSpring',
    ]),
    async onDelete () {
      await this.requestDeleteQuestionBoardToSpring(this.boardNo);
      await this.$router.push({ name: 'QuestionBoardListView' })
    }

  },
  created() {
    this.requestQuestionBoardFromSpring(this.boardNo)
  }
}
</script>

<style scoped>

</style>