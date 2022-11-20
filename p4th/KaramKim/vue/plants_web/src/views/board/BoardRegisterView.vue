<template>
  <div align="center">
    <h2>게시물 작성</h2>
    <board-register-form @submit="onSubmit"/>
  </div>
</template>

<script>
import BoardRegisterForm from "@/components/board/BoardRegisterForm";
import {mapActions} from "vuex";
export default {
  name: "BoardRegisterView",
  components: {BoardRegisterForm},
  methods: {
    ...mapActions([
      'requestCreateQuestionBoardContentsToSpring'
    ]),
    async onSubmit (payload) {
      await this.requestCreateQuestionBoardContentsToSpring(payload)
      await this.$router.push({
        name: 'QuestionBoardListView'
      })
    }
  }
}
</script>

<style scoped>

</style>