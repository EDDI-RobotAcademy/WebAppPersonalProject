<template>
  <div>
    <MemberButton/>
    <br>
    <p></p><br><br><br>
    <ToolbarButton/>
    <br>

    <br><br><br><br>


    <div>


      <div id="board">

        <v-btn class="Normal" rounded style="float: right">
          <v-icon>mdi-view-list-outline</v-icon>
          <router-link :to="{ name: 'JpaBoardRegisterView' }">
            게시물 작성
          </router-link>
        </v-btn>
        <br><br><br><br><br>
        <jpa-board-list :boards="boards"/>
      </div>
    </div>



    <br><br><br><br><br><br><br><br><br><br><br>
    <FooterView/>
  </div>

</template>

<script>
import ToolbarButton from "@/components/common/button/ToolbarButton";

import FooterView from "@/views/mainpage/FooterView";

import {mapActions, mapState} from "vuex";
import JpaBoardList from "@/components/boards/BoardList";
import MemberButton from "@/components/common/button/MemberButton";


export default {
  name: "OceaniaBoardList",
  components: {
    FooterView,
    ToolbarButton,
    JpaBoardList,
    MemberButton,
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