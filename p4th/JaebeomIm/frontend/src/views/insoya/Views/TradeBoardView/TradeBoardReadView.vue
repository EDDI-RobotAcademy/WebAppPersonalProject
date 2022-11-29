<template>
  <div align="center">
    <h2>자유게시글 읽기</h2>
    <trade-board-read v-if="tradeBoard" :tradeBoard="tradeBoard"/>
    <p v-else>Loading .......</p>
    <router-link :to="{ name: 'TradeBoardModifyView', params: { boardNo } }">
      게시물 수정
    </router-link>
    <button @click="onDelete">삭제</button>
    <router-link :to="{ name: 'TradeBoardListView' }">
      돌아가기
    </router-link>
  </div>
</template>

<script>
import TradeBoardRead from "@/views/insoya/Components/TradeBoard/TradeBoardRead";
import {mapActions, mapState} from "vuex";
export default {
  name: "TradeBoardReadView",
  components: {TradeBoardRead},
  props: {
    boardNo: {
      type: String,
      required: true
    }
  },
  computed: {
    ...mapState(['tradeBoard'])
  },
  methods: {
    ...mapActions([
      'requestTradeBoardFromSpring',
      'requestDeleteTradeBoardToSpring',
    ]),
    async onDelete () {
      await this.requestDeleteTradeBoardToSpring(this.boardNo);
      await this.$router.push({ name: 'TradeBoardListView' })
    }
  },
  created() {
    this.requestTradeBoardFromSpring(this.boardNo)
  }
}
</script>

<style scoped>

</style>