<template>
<v-container>
  <div>
    <h2>직업게시판 - 궁수</h2>
    <common-board-form/>
  </div>

  <div id="board">
    <archer-board-list :archer-boards="archerBoards"/>
  </div>

  <router-link :to="{ name: 'ArcherBoardRegisterView' }">
    <v-btn>글쓰기</v-btn>
  </router-link><br/><br/>

</v-container>
</template>

<script>
import CommonBoardForm from "@/insoya/Components/CommonBoardForm";
import ArcherBoardList from "@/insoya/Components/ClassBoard/ArcherBoardList";
import {mapActions, mapState} from "vuex";
export default {
  name: "ArcherBoardListView",
  props: {
    archerBoards: {
      type: Array
    }
  },
  components: {ArcherBoardList, CommonBoardForm},
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
      'archerBoards'
    ]),
  },
  mounted() {
    this.requestArcherBoardListFromSpring()
  },
  methods: {
    ...mapActions([
      'requestArcherBoardListFromSpring'
    ])
  }
}
</script>

<style scoped>

</style>