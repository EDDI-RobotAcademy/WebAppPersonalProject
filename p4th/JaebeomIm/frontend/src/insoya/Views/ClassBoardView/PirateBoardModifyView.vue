<template>
  <div align="center">
    <h2>해적게시글 수정</h2>
    <pirate-board-modify-form v-if="pirateBoard" :pirateBoard="pirateBoard" @submit="onSubmit"/>
    <p v-else>Loading .........</p>
  </div>
</template>

<script>
import PirateBoardModifyForm from "@/insoya/Components/ClassBoard/PirateBoardModifyForm";
import {mapActions, mapState} from "vuex";
export default {
  name: "PirateBoardModifyView",
  components: {PirateBoardModifyForm},
  props: {
    boardNo: {
      type: String,
      required: true,
    }
  },
  computed: {
    ...mapState(['pirateBoard'])
  },
  methods: {
    ...mapActions([
      'requestPirateBoardFromSpring',
      'requestPirateBoardModifyToSpring'
    ]),
    async onSubmit (payload) {
      const { title, content, writer, regDate } = payload
      const boardNo = this.boardNo

      await this.requestPirateBoardModifyToSpring({ boardNo, title, content, writer, regDate })
      await this.$router.push({
        name: 'PirateBoardReadView',
        params: { boardNo: this.boardNo }
      })
    }
  },
  created () {
    this.requestPirateBoardFromSpring(this.boardNo)
  }
}
</script>

<style scoped>

</style>