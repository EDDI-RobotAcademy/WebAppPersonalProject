<template>
  <v-container>
    <v-card elevation="0" style="background-color: #ffff">
      <common-my-page-menu-button/>
      <common-board-list :board-list="this.$store.state.memberWriteBoardList"/>
    </v-card>
  </v-container>
</template>

<script>
import CommonMyPageMenuButton from "@/components/common/CommonMyPageMenuButton";
import CommonBoardList from "@/components/common/CommonBoardList";
import {mapActions,} from "vuex";
export default {
  name: "LoginedMemberBoardList",
  components: {CommonBoardList, CommonMyPageMenuButton},
  data() {
    return {

    }
  },
  methods: {
    ...mapActions(['requestMemberWriteBoardList']),

    async getMemberBoard() {
      let memberId = this.$store.state.loginUserProfile.id
      await this.requestMemberWriteBoardList(memberId)
    }
  },
  mounted() {
    this.getMemberBoard()
  }
}
</script>

<style scoped>

</style>