<template>
  <div>

    <MemberButton/>

    <br>
    <p></p><br><br><br>

    <ToolbarButton/>

    <br>
    <br><br><br><br>

        <BoardWriteButton/>

        <br><br><br><br><br>

        <jpa-board-list :boards="boards"/>

    <br><br><br><br><br><br><br><br><br><br><br>

    <FooterView/>

  </div>

</template>

<script>
import ToolbarButton from "@/components/common/button/ToolbarButton";

import FooterView from "@/views/mainpage/FooterView";

import {mapActions, mapState} from "vuex";
import JpaBoardList from "@/components/boards/JpaBoardList";
import MemberButton from "@/components/common/button/MemberButton";
import BoardWriteButton from "@/components/common/button/BoardWriteButton";


export default {
  name: "OceaniaBoardList",
  components: {
    FooterView,
    ToolbarButton,
    JpaBoardList,
    MemberButton,
    BoardWriteButton,
  },
  computed:{

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