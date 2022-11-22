<template>
  <nav>
    <header-view-practice/>

    <br/>

    <v-row justify="center">
      <community-list :communityBoards="communityBoards"/>
    </v-row>

    <br/>
    <br/>
    <br/>


    <FooterForm/>
  </nav>
</template>

<script>
import CommunityList from "@/components/boards/communityBoards/CommunityList";
import HeaderViewPractice from "@/views/main/HeaderViewPractice";
import {mapActions, mapState} from "vuex";
import FooterForm from "@/components/common/FooterForm";
export default {
  name: "CommunityListView",
  components: {
    FooterForm,
    CommunityList,
    HeaderViewPractice,
  },
  computed: {
    ...mapState(['communityBoards'])
  },
  mounted () {
    this.requestCommunityListFromSpring()
  },
  methods: {
    ...mapActions(['requestCommunityListFromSpring'])
  }
}
</script>
<style scoped>

</style>