<template>
  <v-container>
    <div>
      <h2>등업 게시판</h2>
      <common-board-form/>

      <div id="board">
        <grade-up-board-list :grade-up-boards="gradeUpBoards"/>
      </div>

    </div>
    <router-link :to="{ name: 'GradeUpBoardRegisterView' }">
      <v-btn>글쓰기</v-btn>
    </router-link>
  </v-container>
</template>

<script>
import CommonBoardForm from "@/views/insoya/Components/CommonBoardForm";
import GradeUpBoardList from "@/views/insoya/Components/GradeUpBoard/GradeUpBoardList";
import {mapActions, mapState} from "vuex";
export default {
  name: "GradeUpBoardListView",
  props: {
    gradeUpBoards: {
      type: Array
    }
  },
  components: {GradeUpBoardList, CommonBoardForm},
  computed: {
    ...mapState([
      'gradeUpBoards'
    ]),
  },
  mounted() {
    this.requestGradeUpBoardListFromSpring()
  },
  methods: {
    ...mapActions([
      'requestGradeUpBoardListFromSpring'
    ])
  }
}
</script>

<style scoped>

</style>