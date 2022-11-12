<template>
  <v-container>
    <!-- TODO: 2022.11.11 후에 pageble 이용해서 수정해야함 -->

    <common-board-list :board-list="this.$store.state.communityMainBoardList"/>
  </v-container>
</template>

<script>
import CommonBoardList from "@/components/common/CommonBoardList";
import {mapActions} from "vuex";
export default {
  name: "CommunityView",
  components: { CommonBoardList },
  computed: {
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