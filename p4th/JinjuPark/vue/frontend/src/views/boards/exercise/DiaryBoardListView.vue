<template>
  <v-container>
  <div>
    <common-main-menu-template/>
    <diary-board-list/>
    <common-footer-template/>
  </div>

  </v-container>
</template>

<script>
import DiaryBoardList from "@/components/boards/exercise/DiaryBoardList";

export default {
  name: "DiaryBoardListView",
  components:{
    DiaryBoardList
  }
}
</script>

<style scoped>

</style>