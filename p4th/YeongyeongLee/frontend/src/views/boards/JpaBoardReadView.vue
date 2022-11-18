<template>
  <div align="center">
    <div class="text"> 게시글 읽기</div>
    <br><br>
    <jpa-board-read v-if="board" :board="board"/>
    <p v-else>Loading .......</p>

    <br><br><br><br>

    <div style="float:right">
    <v-icon>mdi-note-check</v-icon>
    <router-link :to="{ name: 'JpaBoardModifyView', params: { boardNo } }" style="color: burlywood">
      Edit
    </router-link>


    <v-icon>mdi-trash-can</v-icon>
    <button style="color: burlywood" @click="onDelete">
      Delete</button>


    <v-icon>mdi-arrow-left</v-icon>
    <router-link :to="{ name: 'JpaBoardListView' }" style="color: burlywood">
      Back
    </router-link>
    </div>

  </div>
</template>

<script>
import JpaBoardRead from "@/components/boards/JpaBoardRead";
import {mapActions, mapState} from "vuex";

export default {
  name: "JpaBoardReadView",
  components: {
    JpaBoardRead
  },
  props: {
    boardNo: {
      type: String,
      required: true
    }
  },
  computed: {
    ...mapState(['board'])
  },
  methods: {
    ...mapActions([
      'requestBoardFromSpring',
      'requestDeleteBoardToSpring',
    ]),
    async onDelete() {
      await this.requestDeleteBoardToSpring(this.boardNo);
      await this.$router.push({name: 'JpaBoardListView'})
    }
  },
  created() {
    this.requestBoardFromSpring(this.boardNo)
  }
}
</script>

<style scoped>

.text {
  font-size: 45px;
  text-align: center;
  color: #FFECB3;
}


</style>