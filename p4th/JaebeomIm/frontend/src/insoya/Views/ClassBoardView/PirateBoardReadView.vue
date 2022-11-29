<template>
  <div align="center">
    <h2>해적게시글 읽기</h2>
    <pirate-board-read v-if="pirateBoard" :pirateBoard="pirateBoard"/>
    <p v-else>Loading .......</p>



    <router-link :to="{ name: 'PirateBoardModifyView', params: { boardNo } }">
      게시물 수정
    </router-link>
    <button @click="onDelete">삭제</button>
    <router-link :to="{ name: 'PirateBoardListView' }">
      돌아가기
    </router-link><br/><br/>
  </div>
</template>

<script>
import PirateBoardRead from "@/insoya/Components/ClassBoard/PirateBoardRead";
import {mapActions, mapState} from "vuex";
export default {
  name: "PirateBoardReadView",
  components: {PirateBoardRead},
  props: {
    boardNo: {
      type: String,
      required: true
    }
  },
  computed: {
    ...mapState(['pirateBoard'])
  },

  methods: {
    ...mapActions([
      'requestPirateBoardFromSpring',
      'requestDeletePirateBoardToSpring',
    ]),
    async onDelete () {
      await this.requestDeletePirateBoardToSpring(this.boardNo);
      await this.$router.push({ name: 'PirateBoardListView' })
    }
  },
  created() {
    this.requestPirateBoardFromSpring(this.boardNo)
  }
}
</script>

<style scoped>

</style>