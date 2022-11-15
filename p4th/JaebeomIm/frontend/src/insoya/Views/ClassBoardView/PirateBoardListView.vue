<template>
  <v-container>
    <div>
      <h2>직업게시판 - 해적</h2>
      <common-board-form/>
    </div>

    <div id="board">
      <pirate-board-list :pirate-boards="pirateBoards"/>
    </div>

    <router-link :to="{ name: 'PirateBoardRegisterView' }">
      <v-btn>글쓰기</v-btn>
    </router-link><br/><br/>

  </v-container>
</template>

<script>
import CommonBoardForm from "@/insoya/Components/CommonBoardForm";
import PirateBoardList from "@/insoya/Components/ClassBoard/PirateBoardList";
import {mapActions, mapState} from "vuex";
export default {
  name: "PirateBoardListView",
  components: {PirateBoardList, CommonBoardForm},
  props: {
    pirateBoards: {
      type: Array
    }
  },
  data () {
    return {
      headerTitle: [
        { text: '번호', value: 'boardNo', width: "70px" },
        { text: '제목', value: 'title', width: "200px" },
        { text: '작성자', value: 'writer', width: "100px" },
        { text: '내용', value: 'content', width: "100px" },
        { text: '작성일자', value: 'regDate', width: "100px" },
      ],
    }
  },
  computed: {
    ...mapState([
      'pirateBoards'
    ]),
  },
  mounted() {
    this.requestPirateBoardListFromSpring()
  },
  methods: {
    ...mapActions([
      'requestPirateBoardListFromSpring'
    ])
  }
}
</script>

<style scoped>

</style>