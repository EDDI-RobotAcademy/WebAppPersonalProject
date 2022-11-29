<template>
  <div align="center">
    <h2>자유게시글 읽기</h2>
    <free-board-read v-if="freeBoard" :freeBoard="freeBoard"/>
    <p v-else>Loading .......</p>
    <router-link :to="{ name: 'FreeBoardModifyView', params: { boardNo } }">
      게시물 수정
    </router-link>
    <button @click="onDelete">삭제</button>
    <router-link :to="{ name: 'FreeBoardListView' }">
      돌아가기
    </router-link>
  </div>
</template>

<script>
import FreeBoardRead from "@/views/insoya/Components/FreeBoard/FreeBoardRead";
import {mapActions, mapState} from "vuex";

export default {
  name: "FreeBoardReadView",

  components: {FreeBoardRead},
  props: {
    boardNo: {
      type: String,
      required: true
    }
  },
  computed: {
    ...mapState(['freeBoard'])
  },
methods: {
...mapActions([
    'requestFreeBoardFromSpring',
    'requestDeleteFreeBoardToSpring',
  ]),
      async onDelete () {
    await this.requestDeleteFreeBoardToSpring(this.boardNo);
    await this.$router.push({ name: 'FreeBoardListView' })
  }
},
created() {
  this.requestFreeBoardFromSpring(this.boardNo)
}

}
</script>

<style scoped>

</style>