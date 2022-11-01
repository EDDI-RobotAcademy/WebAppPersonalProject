<template>
  <v-container>
  <div>
    <h2>자유 게시판</h2>
    <common-board-form/>

    <div id="board">
      <free-board-list :free-boards="freeBoards"/>
    </div>

  </div>
    <router-link :to="{ name: 'FreeBoardRegisterView' }">
      <v-btn>글쓰기</v-btn>
    </router-link>
  </v-container>
</template>

<script>
import CommonBoardForm from "@/views/insoya/Components/CommonBoardForm";
import { mapState, mapActions } from "vuex";
import FreeBoardList from "@/views/insoya/Components/FreeBoard/FreeBoardList";
export default {
  name: "FreeBoardView",
  props: {
    freeBoards: {
      type: Array
    }
  },
  components: {FreeBoardList, CommonBoardForm},
  computed: {
    ...mapState([
      'freeBoards'
    ]),
  },
  mounted() {
    this.requestFreeBoardListFromSpring()
  },
  methods: {
    ...mapActions([
      'requestFreeBoardListFromSpring'
    ])
  }
}

</script>

<style scoped>

</style>