<template>
  <div align="center">
    <h2>궁수게시글 읽기</h2>
    <archer-board-read v-if="archerBoard" :archerBoard="archerBoard"/>
    <p v-else>Loading .......</p>



    <router-link :to="{ name: 'ArcherBoardModifyView', params: { boardNo } }">
      게시물 수정
    </router-link>
    <button @click="onDelete">삭제</button>
    <router-link :to="{ name: 'ArcherBoardListView' }">
      돌아가기
    </router-link><br/><br/>
  </div>
</template>

<script>
import ArcherBoardRead from "@/insoya/Components/ClassBoard/ArcherBoardRead";
import {mapActions, mapState} from "vuex";
export default {
  name: "ArcherBoardReadView",
  components: {ArcherBoardRead},
  props: {
    boardNo: {
      type: String,
      required: true
    }
  },
  computed: {
    ...mapState(['archerBoard'])
  },
  methods: {
    ...mapActions([
      'requestArcherBoardFromSpring',
      'requestDeleteArcherBoardToSpring',
    ]),
    async onDelete () {
      await this.requestDeleteArcherBoardToSpring(this.boardNo);
      await this.$router.push({ name: 'ArcherBoardListView' })
    }
  },
  created() {
    this.requestArcherBoardFromSpring(this.boardNo)
  }

}
</script>

<style scoped>

</style>