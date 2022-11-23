<template>
  <v-container>
    <v-card elevation="0" class="pa-2">
      <common-board-list
          :board-name="boardName"
          :board-list="this.$store.state.communityMainBoardList"/>
    </v-card>
  </v-container>
</template>

<script>
import CommonBoardList from "@/components/common/CommonBoardList";
import {mapActions} from "vuex";
export default {
  name: "mainBoardList",
  components: {CommonBoardList},
  data() {
    return{
      boardName: "〉 최신 게시글"
    }
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