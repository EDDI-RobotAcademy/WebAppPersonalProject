<template>
  <div align="center">
    <board-modify-form
        v-if="board"
        :board="board"
        @submit="onSubmit"
    />
    <p v-else>Loading......</p>
  </div>
</template>

<script>
import BoardModifyForm from "@/components/board/BoardModifyForm";
import {mapActions, mapState} from "vuex";
export default {
  name: "BoardModifyView",
  components: {BoardModifyForm},
  props: {
    boardNo: {
      type: String,
      required: true
    }
  },
  computed: {
    ...mapState([
        'board'
    ])
  },
  methods: {
    ...mapActions([
        'requestQuestionBoardContentsFromSpring',
        'requestBoardModifyToSpring'
    ]),
    onSubmit(payload) {
      const { title, content, writer, regDate } = payload
      const boardNo = this.boardNo

      this.requestBoardModifyToSpring({ boardNo, title, content, writer, regDate })
      this.$router.push({ name: 'BoardReadView', params: { boardNo: this.boardNo } })
    }
  },
  created() {
    this.requestQuestionBoardContentsFromSpring(this.boardNo)
  }
}
</script>

<style scoped>

</style>