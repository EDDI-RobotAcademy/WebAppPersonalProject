<template>
  <div align="center">
    <h2>도적게시글 읽기</h2>
    <thief-board-read v-if="thiefBoard" :thiefBoard="thiefBoard"/>
    <p v-else>Loading .......</p>



    <router-link :to="{ name: 'ThiefBoardModifyView', params: { boardNo } }">
      게시물 수정
    </router-link>
    <button @click="onDelete">삭제</button>
    <router-link :to="{ name: 'ThiefBoardListView' }">
      돌아가기
    </router-link><br/><br/>
  </div>
</template>

<script>
import ThiefBoardRead from "@/insoya/Components/ClassBoard/ThiefBoardRead";
import {mapActions, mapState} from "vuex";
export default {
  name: "ThiefBoardReadView",
  components: {ThiefBoardRead},
  props: {
    boardNo: {
      type: String,
      required: true
    }
  },
  computed: {
    ...mapState(['thiefBoard'])
  },

  methods: {
    ...mapActions([
      'requestThiefBoardFromSpring',
      'requestDeleteThiefBoardToSpring',
    ]),
    async onDelete () {
      await this.requestDeleteThiefBoardToSpring(this.boardNo);
      await this.$router.push({ name: 'ThiefBoardListView' })
    }
  },
  created() {
    this.requestThiefBoardFromSpring(this.boardNo)
  }
}
</script>

<style scoped>

</style>