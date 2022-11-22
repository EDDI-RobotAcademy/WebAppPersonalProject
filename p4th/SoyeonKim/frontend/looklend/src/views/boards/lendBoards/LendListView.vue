<template>
  <nav>
    <header-view-practice/>

    <br/>

    <v-row justify="center">
      <lend-list :lends="lends"/>
    </v-row>

    <br/>
    <br/>
    <br/>

    <FooterForm/>
  </nav>
</template>

<script>
import LendList from "@/components/boards/lendBoards/LendList";
import {mapActions, mapState} from "vuex";
import HeaderViewPractice from "@/views/main/HeaderViewPractice";
import FooterForm from "@/components/common/FooterForm";

export default {
  name: "LendListView",
  components: {
    FooterForm,
    LendList,
    HeaderViewPractice
  },
  computed: {
    ...mapState([
      'lends'
    ]),
  },
  mounted() {
    this.requestLendListFromSpring()
  },
  methods: {
    ...mapActions([
      'requestLendListFromSpring'
    ])
  }
}
</script>

<style scoped>/*
.header{
  margin-top:5%;
  margin-bottom: 6%;
  width:100%;
}*/
</style>