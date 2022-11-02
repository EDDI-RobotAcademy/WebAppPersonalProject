<template>
  <div align="center">
    <h2>자유게시글 수정</h2>
    <free-board-modify-form v-if="freeBoard" :freeBoard="freeBoard" @submit="onSubmit"/>
    <p v-else>Loading .........</p>
  </div>
</template>

<script>
import FreeBoardModifyForm from "@/views/insoya/Components/FreeBoard/FreeBoardModifyForm";
import {mapActions, mapState} from "vuex";

export default {
  name: "FreeBoardModifyVue",
  components: {FreeBoardModifyForm},
  props: {
    boardNo: {
      type: String,
      required: true,
    }
  }, computed: {
    ...mapState(['freeBoard'])
  },
  methods: {
    ...mapActions([
      'requestFreeBoardFromSpring',
      'requestFreeBoardModifyToSpring'
    ]),
    async onSubmit (payload) {
      const { title, content, writer, regDate } = payload
      const boardNo = this.boardNo

      await this.requestFreeBoardModifyToSpring({ boardNo, title, content, writer, regDate })
      await this.$router.push({
        name: 'FreeBoardReadView',
        params: { boardNo: this.boardNo }
      })
    }
  },
  created () {
    this.requestFreeBoardFromSpring(this.boardNo)
  }
}
</script>

<style scoped>

</style>