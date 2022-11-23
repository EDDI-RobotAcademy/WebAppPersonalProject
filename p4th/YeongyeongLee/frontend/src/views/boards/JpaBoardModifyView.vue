<template>
  <div align="center">
    <div class="text"> 게시글 수정 </div>
    <br><br>
    <jpa-board-modify-form v-if="board" :board="board" @submit="onSubmit"/>
    <p v-else>Loading .........</p>
  </div>
</template>

<script>
import JpaBoardModifyForm from "@/components/boards/JpaBoardModifyForm";
import {mapActions, mapState} from "vuex";

export default {
  name: "JpaBoardModifyView",
  components: {JpaBoardModifyForm},
  props: {
    boardNo: {
      type: String,
      required: true,
    }
  },
  computed: {
    ...mapState(['board'])
  },
  methods: {
    ...mapActions([
      'requestBoardFromSpring',
      'requestBoardModifyToSpring'
    ]),
    async onSubmit (payload) {
      const { title, content, writer, regDate } = payload
      const boardNo = this.boardNo

      await this.requestBoardModifyToSpring({ boardNo, title, content, writer, regDate })
      await this.$router.push({
        name: 'JpaBoardReadView',
        params: { boardNo: this.boardNo }
      })
    }
  },
  created () {
    this.requestBoardFromSpring(this.boardNo)
  }
}
</script>
<style scoped>

.text {
  font-size: 45px;
  text-align: center;
  color: #FFECB3;
}

</style>