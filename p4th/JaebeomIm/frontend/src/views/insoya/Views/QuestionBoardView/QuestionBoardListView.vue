<template>
  <v-container>
    <div>
      <h2>질문 게시판</h2>
      <common-board-form/>

      <div id="board">
        <question-board-list :question-boards="questionBoards"/>
      </div>

    </div>
    <router-link :to="{ name: 'QuestionBoardRegisterView' }">
      <v-btn>글쓰기</v-btn>
    </router-link>
  </v-container>
</template>

<script>
import CommonBoardForm from "@/views/insoya/Components/CommonBoardForm";
import { mapState, mapActions } from "vuex";
import QuestionBoardList from "@/views/insoya/Components/QuestionBoard/QuestionBoardList";
export default {
  name: "QuestionBoardListView",
  props: {
    questionBoards: {
      type: Array
    }
  },
  components: {QuestionBoardList, CommonBoardForm},
  computed: {
    ...mapState([
      'questionBoards'
    ]),
  },
  mounted() {
    this.requestQuestionBoardListFromSpring()
  },
  methods: {
    ...mapActions([
      'requestQuestionBoardListFromSpring'
    ])
  }
}
</script>

<style scoped>

</style>