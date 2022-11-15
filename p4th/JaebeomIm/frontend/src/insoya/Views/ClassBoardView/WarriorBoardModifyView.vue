<template>
  <div align="center">
    <h2>전사게시글 수정</h2>
    <warrior-board-modify-form v-if="warriorBoard" :warriorBoard="warriorBoard" @submit="onSubmit"/>
    <p v-else>Loading .........</p>
  </div>
</template>

<script>
import WarriorBoardModifyForm from "@/insoya/Components/ClassBoard/WarriorBoardModifyForm";
import {mapActions, mapState} from "vuex";
export default {
  name: "WarriorBoardModifyView",
  components: {WarriorBoardModifyForm},
  props: {
    boardNo: {
      type: String,
      required: true,
    }
  },
  computed: {
    ...mapState(['warriorBoard'])
  },
  methods: {
    ...mapActions([
      'requestWarriorBoardFromSpring',
      'requestWarriorBoardModifyToSpring'
    ]),
    async onSubmit (payload) {
      const { title, content, writer, regDate } = payload
      const boardNo = this.boardNo

      await this.requestWarriorBoardModifyToSpring({ boardNo, title, content, writer, regDate })
      await this.$router.push({
        name: 'WarriorBoardReadView',
        params: { boardNo: this.boardNo }
      })
    }
  },
  created () {
    this.requestWarriorBoardFromSpring(this.boardNo)
  }
}
</script>

<style scoped>

</style>