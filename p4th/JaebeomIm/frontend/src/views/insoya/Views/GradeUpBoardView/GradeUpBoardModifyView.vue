<template>
  <div align="center">
    <h2>등업게시글 수정</h2>
    <grade-up-board-modify-form v-if="gradeUpBoard" :gradeUpBoard="gradeUpBoard" @submit="onSubmit"/>
    <p v-else>Loading .........</p>
  </div>
</template>

<script>
import GradeUpBoardModifyForm from "@/views/insoya/Components/GradeUpBoard/GradeUpBoardModifyForm";
import {mapActions, mapState} from "vuex";
export default {
  name: "GradeUpBoardModifyView",
  components: {GradeUpBoardModifyForm},
  props: {
    boardNo: {
      type: String,
      required: true,
    }
  },
  computed: {
    ...mapState(['gradeUpBoard'])
  },
  methods: {
    ...mapActions([
      'requestGradeUpBoardFromSpring',
      'requestGradeUpBoardModifyToSpring'
    ]),
    async onSubmit (payload) {
      const { title, content, writer, regDate } = payload
      const boardNo = this.boardNo

      await this.requestGradeUpBoardModifyToSpring({ boardNo, title, content, writer, regDate })
      await this.$router.push({
        name: 'GradeUpBoardReadView',
        params: { boardNo: this.boardNo }
      })
    }
  },
  created () {
    this.requestGradeUpBoardFromSpring(this.boardNo)
  }
}
</script>

<style scoped>

</style>