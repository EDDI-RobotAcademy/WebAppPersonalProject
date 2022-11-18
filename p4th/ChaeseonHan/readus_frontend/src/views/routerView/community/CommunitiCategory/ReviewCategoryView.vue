<template>
  <v-container>
    <common-community-category-buttons/>
    <common-board-list/>
  </v-container>
</template>

<script>
import CommonBoardList from "@/components/common/CommonBoardList";
import CommonCommunityCategoryButtons from "@/components/common/CommonCommunityCategoryButtons";
export default {
  name: "ReviewCategoryView",
  components: {CommonCommunityCategoryButtons, CommonBoardList}
}
</script>

<style scoped>

</style>