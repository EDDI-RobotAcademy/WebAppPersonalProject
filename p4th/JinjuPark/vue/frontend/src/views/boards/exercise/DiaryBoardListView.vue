<template>
  <v-container>
  <div>
    <common-main-menu-template :page="page"/>
    <diary-board-list :diaryBoards="diaryBoards"/>
     <common-footer-template/>
  </div>
  </v-container>
</template>
<script>
import DiaryBoardList from "@/components/boards/exercise/DiaryBoardList";
import {mapActions, mapState} from "vuex";

export default {
  name: "DiaryBoardListView",
  components:{
    DiaryBoardList
  },
  computed: {
    ...mapState([
        'diaryBoards',
    ]),
  },
  data(){
    return{
      page : "diary"
    }
  },
  mounted() {
    this.requestDiaryBoardListFromSpring()
  },
  methods: {
    ...mapActions([
        'requestDiaryBoardListFromSpring'
    ]),
  }
}
</script>

<style scoped>

</style>