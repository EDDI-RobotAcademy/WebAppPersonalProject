<template>
  <div align="center">
    <h2>마법사게시글 읽기</h2>
    <mage-board-read v-if="mageBoard" :mageBoard="mageBoard"/>
    <p v-else>Loading .......</p>



    <router-link :to="{ name: 'MageBoardModifyView', params: { boardNo } }">
      게시물 수정
    </router-link>
    <button @click="onDelete">삭제</button>
    <router-link :to="{ name: 'MageBoardListView' }">
      돌아가기
    </router-link><br/><br/>
  </div>
</template>

<script>
import MageBoardRead from "@/insoya/Components/ClassBoard/MageBoardRead";
import {mapActions, mapState} from "vuex";
export default {
  name: "MageBoardReadView",
  components: {MageBoardRead},
  props: {
    boardNo: {
      type: String,
      required: true
    }
  },
  computed: {
    ...mapState(['mageBoard'])
  },
  methods: {
    ...mapActions([
      'requestMageBoardFromSpring',
      'requestDeleteMageBoardToSpring',
    ]),
    async onDelete () {
      await this.requestDeleteMageBoardToSpring(this.boardNo);
      await this.$router.push({ name: 'MageBoardListView' })
    }
  },
  created() {
    this.requestMageBoardFromSpring(this.boardNo)
  }
}
</script>

<style scoped>

</style>