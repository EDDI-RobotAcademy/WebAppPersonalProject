<template>
  <v-container>
    <div>
      <h2>직업게시판 - 전사</h2>
      <common-board-form/>
    </div>

    <div id="board">
      <warrior-board-list :warrior-boards="warriorBoards"/>
    </div>

    <router-link :to="{ name: 'WarriorBoardRegisterView' }">
      <v-btn>글쓰기</v-btn>
    </router-link><br/><br/>

  </v-container>
</template>

<script>
import CommonBoardForm from "@/insoya/Components/CommonBoardForm";
import WarriorBoardList from "@/insoya/Components/ClassBoard/WarriorBoardList";
import {mapActions, mapState} from "vuex";
export default {
  name: "WarriorBoardListView",
  components: {WarriorBoardList, CommonBoardForm},
  props: {
    warriorBoards: {
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
      'warriorBoards'
    ]),
  },
  mounted() {
    this.requestWarriorBoardListFromSpring()
  },
  methods: {
    ...mapActions([
      'requestWarriorBoardListFromSpring'
    ])
  }
}
</script>

<style scoped>

</style>