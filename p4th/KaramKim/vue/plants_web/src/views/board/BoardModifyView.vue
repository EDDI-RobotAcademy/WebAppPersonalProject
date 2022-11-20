<template>
  <div align="center">
    <h2>게시물 수정</h2>
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
import {mapState} from "vuex";
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
  created() {
    this.requestQuestionBoardContentsFromSpring(this.boardNo)
  }
}
</script>

<style scoped>

</style>