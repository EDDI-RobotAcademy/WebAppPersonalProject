<template>
  <div align="center">
    <h2>자유게시글 수정</h2>
    <trade-board-modify-form v-if="tradeBoard" :tradeBoard="tradeBoard" @submit="onSubmit"/>
    <p v-else>Loading .........</p>
  </div>
</template>

<script>

import {mapActions, mapState} from "vuex";
import TradeBoardModifyForm from "@/views/insoya/Components/TradeBoard/TradeBoardModifyForm";

export default {
  name: "TradeBoardModifyView",
  components: {TradeBoardModifyForm},
  props: {
    boardNo: {
      type: String,
      required: true,
    }
  },
  computed: {
    ...mapState(['tradeBoard'])
  },
  methods: {
    ...mapActions([
      'requestTradeBoardFromSpring',
      'requestTradeBoardModifyToSpring'
    ]),
    async onSubmit (payload) {
      const { title, content, writer, regDate } = payload
      const boardNo = this.boardNo

      await this.requestTradeBoardModifyToSpring({ boardNo, title, content, writer, regDate })
      await this.$router.push({
        name: 'TradeBoardReadView',
        params: { boardNo: this.boardNo }
      })
    }
  },
  created () {
    this.requestTradeBoardFromSpring(this.boardNo)
  }
}
</script>

<style scoped>

</style>