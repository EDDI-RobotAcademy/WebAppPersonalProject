<template>


  <div>
    <div style="float: right">
      <v-btn class="Normal" rounded>
        <v-icon>mdi-account-outline</v-icon>
        <router-link to="/login-view"> 로그인</router-link>
      </v-btn>

      <v-btn class="Normal" rounded>
        <v-icon>mdi-account-plus-outline</v-icon>
        <router-link to="/signup-view"> 회원가입</router-link>
      </v-btn>
    </div>

    <br>
    <p></p><br><br><br>
    <ToolbarButton/>
    <br>

    <br><br>

    <BoardWriteButton/>

    <br><br>

    <jpa-board-list :boards="boards"/>


  <br><br><br><br><br><br><br><br><br><br><br>


  <FooterView/>

  </div>
</template>


<script>

import {mapState, mapActions} from "vuex";
import JpaBoardList from "@/components/boards/JpaBoardList";
import ToolbarButton from "@/components/common/button/ToolbarButton";
import FooterView from "@/views/mainpage/FooterView";
import BoardWriteButton from "@/components/common/button/BoardWriteButton";

export default {
  name: "BoardListView.vue",
  components: {
    BoardWriteButton,
    FooterView,
    JpaBoardList,
    ToolbarButton,
  },
  computed: {
    ...mapState([
      'boards'
    ]),
  },
  mounted() {
    this.requestBoardListFromSpring()
  },
  methods: {
    ...mapActions([
      'requestBoardListFromSpring'
    ])
  }
}
</script>

<style scoped>

</style>