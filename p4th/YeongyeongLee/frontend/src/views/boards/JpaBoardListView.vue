<template>


  <div>
    <MemberButton/>

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
import MemberButton from "@/components/common/button/MemberButton";

export default {
  name: "BoardListView.vue",
  components: {
    MemberButton,
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