<template>
  <v-container>
    <logined-member-board-list/>
  </v-container>
</template>

<script>
import LoginedMemberBoardList from "@/components/account/LoginedMemberBoardList";
export default {
  name: "MyBoardListView",
  components: {LoginedMemberBoardList}
}
</script>

<style scoped>

</style>