<template>
  <div align="center">
    <h2>전사게시글 읽기</h2>
    <warrior-board-read v-if="warriorBoard" :warriorBoard="warriorBoard"/>
    <p v-else>Loading .......</p>



    <router-link :to="{ name: 'WarriorBoardModifyView', params: { boardNo } }">
      게시물 수정
    </router-link>
    <button @click="onDelete">삭제</button>
    <router-link :to="{ name: 'WarriorBoardListView' }">
      돌아가기
    </router-link><br/><br/>
  </div>
</template>

<script>
import WarriorBoardRead from "@/insoya/Components/ClassBoard/WarriorBoardRead";
import {mapActions, mapState} from "vuex";
export default {
  name: "WarriorBoardReadView",
  components: {WarriorBoardRead},
  props: {
    boardNo: {
      type: String,
      required: true
    }
  },
  computed: {
    ...mapState(['warriorBoard'])
  },
  methods: {
    ...mapActions([
      'requestWarriorBoardFromSpring',
      'requestDeleteWarriorBoardToSpring',
    ]),
    async onDelete () {
      await this.requestDeleteWarriorBoardToSpring(this.boardNo);
      await this.$router.push({ name: 'WarriorBoardListView' })
    }
  },
  created() {
    this.requestWarriorBoardFromSpring(this.boardNo)
  }
}
</script>

<style scoped>

</style>