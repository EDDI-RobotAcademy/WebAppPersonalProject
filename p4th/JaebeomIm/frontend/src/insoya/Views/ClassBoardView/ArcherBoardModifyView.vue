<template>
  <div align="center">
    <h2>궁수게시글 수정</h2>
    <archer-board-modify-form v-if="archerBoard" :archerBoard="archerBoard" @submit="onSubmit"/>
    <p v-else>Loading .........</p>
  </div>
</template>

<script>
import ArcherBoardModifyForm from "@/insoya/Components/ClassBoard/ArcherBoardModifyForm";
import {mapActions, mapState} from "vuex";
export default {
  name: "ArcherBoardModifyView",
  components: {ArcherBoardModifyForm},
  props: {
    boardNo: {
      type: String,
      required: true,
    }
  },
  computed: {
    ...mapState(['archerBoard'])
  },
  methods: {
    ...mapActions([
      'requestArcherBoardFromSpring',
      'requestArcherBoardModifyToSpring'
    ]),
    async onSubmit (payload) {
      const { title, content, writer, regDate } = payload
      const boardNo = this.boardNo

      await this.requestArcherBoardModifyToSpring({ boardNo, title, content, writer, regDate })
      await this.$router.push({
        name: 'ArcherBoardReadView',
        params: { boardNo: this.boardNo }
      })
    }
  },
  created () {
    this.requestArcherBoardFromSpring(this.boardNo)
  }
}
</script>

<style scoped>

</style>