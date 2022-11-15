<template>
  <div align="center">
    <h2>도적게시글 수정</h2>
    <thief-board-modify-form v-if="thiefBoard" :thiefBoard="thiefBoard" @submit="onSubmit"/>
    <p v-else>Loading .........</p>
  </div>
</template>

<script>
import ThiefBoardModifyForm from "@/insoya/Components/ClassBoard/ThiefBoardModifyForm";
import {mapActions, mapState} from "vuex";
export default {
  name: "ThiefBoardModifyView",
  components: {ThiefBoardModifyForm},
  props: {
    boardNo: {
      type: String,
      required: true,
    }
  },
  computed: {
    ...mapState(['thiefBoard'])
  },
  methods: {
    ...mapActions([
      'requestThiefBoardFromSpring',
      'requestThiefBoardModifyToSpring'
    ]),
    async onSubmit (payload) {
      const { title, content, writer, regDate } = payload
      const boardNo = this.boardNo

      await this.requestThiefBoardModifyToSpring({ boardNo, title, content, writer, regDate })
      await this.$router.push({
        name: 'ThiefBoardReadView',
        params: { boardNo: this.boardNo }
      })
    }
  },
  created () {
    this.requestThiefBoardFromSpring(this.boardNo)
  }
}
</script>

<style scoped>

</style>