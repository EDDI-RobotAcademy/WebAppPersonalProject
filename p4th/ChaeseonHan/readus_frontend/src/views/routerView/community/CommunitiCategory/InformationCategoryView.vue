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
import {mapActions} from "vuex";
import CommonSearchAndWriteButtons from "@/components/common/CommonSearchAndWriteButtons";
export default {
  name: "InformationCategoryView",
  components: {CommonSearchAndWriteButtons, CommonCommunityCategoryButtons, CommonBoardList},
  data() {
    return {
      category: "정보"
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