<template>
  <div align="center">
    <h2>마법사게시글 수정</h2>
    <mage-board-modify-form v-if="mageBoard" :mageBoard="mageBoard" @submit="onSubmit"/>
    <p v-else>Loading .........</p>
  </div>
</template>

<script>
import MageBoardModifyForm from "@/insoya/Components/ClassBoard/MageBoardModifyForm";
import {mapActions, mapState} from "vuex";
export default {
  name: "MageBoardModifyView",
  components: {MageBoardModifyForm},
  props: {
    boardNo: {
      type: String,
      required: true,
    }
  },
  computed: {
    ...mapState(['mageBoard'])
  },
  methods: {
    ...mapActions([
      'requestMageBoardFromSpring',
      'requestMageBoardModifyToSpring'
    ]),
    async onSubmit (payload) {
      const { title, content, writer, regDate } = payload
      const boardNo = this.boardNo

      await this.requestMageBoardModifyToSpring({ boardNo, title, content, writer, regDate })
      await this.$router.push({
        name: 'MageBoardReadView',
        params: { boardNo: this.boardNo }
      })
    }
  },
  created () {
    this.requestMageBoardFromSpring(this.boardNo)
  }
}
</script>

<style scoped>

</style>