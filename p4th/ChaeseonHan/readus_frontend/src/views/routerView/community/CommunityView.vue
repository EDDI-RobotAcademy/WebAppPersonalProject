<template>
  <v-container>
    <!-- TODO: 2022.11.11 후에 pageble 이용해서 수정해야함 -->
    <common-community-category-buttons/>
    <common-board-list :board-list="this.$store.state.communityMainBoardList"/>
    <common-search-and-write-buttons/>
  </v-container>
</template>

<script>
import CommonBoardList from "@/components/common/CommonBoardList";
import {mapActions} from "vuex";
import CommonSearchAndWriteButtons from "@/components/common/CommonSearchAndWriteButtons";
import CommonCommunityCategoryButtons from "@/components/common/CommonCommunityCategoryButtons";
export default {
  name: "CommunityView",
  components: { CommonCommunityCategoryButtons, CommonSearchAndWriteButtons, CommonBoardList },
  data() {
    return {

    }
  },
  methods: {
    ...mapActions(['requestAllCommunityBoardListTOSpring']),

  },

  mounted() {
    this.requestAllCommunityBoardListTOSpring()
  }
}
</script>

<style scoped>

</style>