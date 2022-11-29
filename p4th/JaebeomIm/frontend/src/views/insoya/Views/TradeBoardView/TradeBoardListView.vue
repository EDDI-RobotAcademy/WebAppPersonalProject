<template>
  <v-container>
  <div>
    <h2>사고팔고 게시판</h2>
    <common-board-form/>

    <div id="board">
      <trade-board-list :trade-boards="tradeBoards"/>
    </div>

  </div>
  <router-link :to="{ name: 'TradeBoardRegisterView' }">
    <v-btn>글쓰기</v-btn>
  </router-link>
  </v-container>
</template>

<script>
import CommonBoardForm from "@/views/insoya/Components/CommonBoardForm";
import TradeBoardList from "@/views/insoya/Components/TradeBoard/TradeBoardList";
import {mapActions, mapState} from "vuex";
export default {
  name: "TradeBoardListView",
  props: {
    freeBoards: {
      type: Array
    }
  },
  components: {TradeBoardList, CommonBoardForm},
  computed: {
    ...mapState([
      'tradeBoards'
    ]),
  },
   mounted() {
    this.requestTradeBoardListFromSpring()
  },
  methods: {
    ...mapActions([
      'requestTradeBoardListFromSpring'
    ])
  }
}
</script>

<style scoped>

</style>