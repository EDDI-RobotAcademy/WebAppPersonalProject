<template>
  <div align="center">
    <h2>질문게시글 작성</h2>
    <question-board-register-form @submit="onSubmit"/>
  </div>
</template>

<script>
import QuestionBoardRegisterForm from "@/views/insoya/Components/QuestionBoard/QuestionBoardRegisterForm";
import {mapActions} from "vuex";
export default {
  name: "QuestionBoardRegisterView",
  components: {QuestionBoardRegisterForm},
  data () {
    return {

    }
  },
  methods: {

    ...mapActions([
      'requestCreateQuestionBoardContentsToSpring'
    ]),
    async onSubmit (payload) {
      await this.requestCreateQuestionBoardContentsToSpring(payload)

      await this.$router.push({
        name: 'QuestionBoardListView'
      })
    },

  }
}
</script>

<style scoped>

</style>