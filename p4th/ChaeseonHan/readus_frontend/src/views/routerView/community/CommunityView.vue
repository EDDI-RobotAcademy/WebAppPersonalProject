<template>
  <v-container>
    <CommonCommunityCategoryButtons/>

    <!-- TODO: 2022.11.11 PROPS board-list 배열 데이터 여기 넘겨주면 됨(actions로 가져와서 state에 넣을 예정) 임시로 모두 가져옴 -->

    <common-board-list :board-list="this.communityMainBoardList"/>
  </v-container>
</template>

<script>
import CommonCommunityCategoryButtons from "@/components/common/CommonCommunityCategoryButtons";
import CommonBoardList from "@/components/common/CommonBoardList";
import {mapActions, mapState} from "vuex";
export default {
  name: "CommunityView",
  components: {CommonCommunityCategoryButtons, CommonBoardList},
  computed: {
    ...mapState(['communityMainBoardList'])
  },

  methods: {
    ...mapActions(['requestAllCommunityBoardListTOSpring'])
  },

  mounted() {
    this.requestAllCommunityBoardListTOSpring()
  }
}
</script>

<style scoped>

</style>