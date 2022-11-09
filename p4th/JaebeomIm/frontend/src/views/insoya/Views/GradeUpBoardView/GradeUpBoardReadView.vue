<template>
  <div align="center">
    <h2>등업게시글 읽기</h2>
    <grade-up-board-read v-if="gradeUpBoard" :gradeUpBoard="gradeUpBoard"/>
    <p v-else>Loading .......</p>
    <router-link :to="{ name: 'GradeUpBoardModifyView', params: { boardNo } }">
      게시물 수정
    </router-link>
    <button @click="onDelete">삭제</button>
    <router-link :to="{ name: 'GradeUpBoardListView' }">
      돌아가기
    </router-link>
  </div>
</template>

<script>
import GradeUpBoardRead from "@/views/insoya/Components/GradeUpBoard/GradeUpBoardRead";
import {mapActions, mapState} from "vuex";
export default {
  name: "GradeUpBoardReadView",
  components: {GradeUpBoardRead},
  props: {
    boardNo: {
      type: String,
      required: true
    }
  },
  computed: {
    ...mapState(['gradeUpBoard'])
  },
  methods: {
    ...mapActions([
      'requestGradeUpBoardFromSpring',
      'requestDeleteGradeUpBoardToSpring',
    ]),
    async onDelete () {
      await this.requestDeleteGradeUpBoardToSpring(this.boardNo);
      await this.$router.push({ name: 'GradeUpBoardListView' })
    }
  },
  created() {
    this.requestGradeUpBoardFromSpring(this.boardNo)
  }
}
</script>

<style scoped>

</style>