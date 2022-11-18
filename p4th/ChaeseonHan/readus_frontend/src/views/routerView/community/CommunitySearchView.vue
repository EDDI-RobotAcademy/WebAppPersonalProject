<template>
  <v-container>
    <common-board-list :board-list="this.$store.state.searchResultBoard"/>
    <common-search-and-write-buttons/>
  </v-container>
</template>

<script>
import CommonBoardList from "@/components/common/CommonBoardList";
import CommonSearchAndWriteButtons from "@/components/common/CommonSearchAndWriteButtons";
export default {
  name: "CommunitySearchView",
  components: {CommonSearchAndWriteButtons, CommonBoardList},
  props: {
    keyword: {
      type: String,
      required: true
    },
  }
}
</script>

<style scoped>

</style>