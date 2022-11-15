<template>
  <v-container>
  <div>
    <h2>직업게시판 - 마법사</h2>
    <common-board-form/>
  </div>

  <div id="board">
    <mage-board-list :mage-boards="mageBoards"/>
  </div>

  <router-link :to="{ name: 'MageBoardRegisterView' }">
    <v-btn>글쓰기</v-btn>
  </router-link><br/><br/>

</v-container>
</template>

<script>
import CommonBoardForm from "@/insoya/Components/CommonBoardForm";
import {mapActions, mapState} from "vuex";
import MageBoardList from "@/insoya/Components/ClassBoard/MageBoardList";
export default {
  name: "MageBoardListView",
  props: {
    mageBoards: {
      type: Array
    }
  },
  components: {MageBoardList, CommonBoardForm},
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
      'mageBoards'
    ]),
  },
  mounted() {
    this.requestMageBoardListFromSpring()
  },
  methods: {
    ...mapActions([
      'requestMageBoardListFromSpring'
    ])
  }
}
</script>

<style scoped>

</style>