<template>
  <v-container>
    <div>
      <h2>직업게시판 - 도적</h2>
      <common-board-form/>
    </div>

    <div id="board">
      <thief-board-list :thief-boards="thiefBoards"/>
    </div>

    <router-link :to="{ name: 'ThiefBoardRegisterView' }">
      <v-btn>글쓰기</v-btn>
    </router-link><br/><br/>

  </v-container>
</template>

<script>
import CommonBoardForm from "@/insoya/Components/CommonBoardForm";
import ThiefBoardList from "@/insoya/Components/ClassBoard/ThiefBoardList";
import {mapActions, mapState} from "vuex";
export default {
  name: "ThiefBoardListView",
  components: {ThiefBoardList, CommonBoardForm},
  props: {
    thiefBoards: {
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
      'thiefBoards'
    ]),
  },
  mounted() {
    this.requestThiefBoardListFromSpring()
  },
  methods: {
    ...mapActions([
      'requestThiefBoardListFromSpring'
    ])
  }
}
</script>

<style scoped>

</style>