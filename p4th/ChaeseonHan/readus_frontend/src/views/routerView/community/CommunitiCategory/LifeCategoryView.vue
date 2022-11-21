<template>
  <v-container>
    <common-community-category-buttons/>
    <common-board-list :board-list="this.$store.state.communityMainBoardList"/>
    <common-search-and-write-buttons/>
  </v-container>
</template>

<script>
import CommonBoardList from "@/components/common/CommonBoardList";
import CommonCommunityCategoryButtons from "@/components/common/CommonCommunityCategoryButtons";
import CommonSearchAndWriteButtons from "@/components/common/CommonSearchAndWriteButtons";
import {mapActions} from "vuex";
export default {
  name: "LifeCategoryView",
  components: {CommonSearchAndWriteButtons, CommonCommunityCategoryButtons, CommonBoardList},
  data() {
    return {
      category: "일상"
    }
  },

  methods: {
    ...mapActions(['requestCategoryBoardList']),
  },
  created() {
    this.requestCategoryBoardList(this.category)
  }

}
</script>

<style scoped>

</style>