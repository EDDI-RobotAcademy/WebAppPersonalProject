<template>
  <nav>
    <header-view-practice/>

    <br/><br/><br/><br/><br/>

    <v-row>
      <community-register @submit="onSubmit"/>
    </v-row>

    <br/>
    <br/>
    <br/>

    <FooterForm/>
  </nav>
</template>

<script>

import HeaderViewPractice from "@/views/main/HeaderViewPractice";
import CommunityRegister from "@/components/boards/communityBoards/CommunityRegister";
import {mapActions} from "vuex";
import FooterForm from "@/components/common/FooterForm";

export default {
  name: "CommunityRegisterView",
  components: {FooterForm, HeaderViewPractice, CommunityRegister},
  methods: {
    ...mapActions([
      'requestRegisterCommunityToSpring'
    ]),
    async onSubmit (payload) {
      await this.requestRegisterCommunityToSpring(payload)
      await this.$router.push({
        name: 'CommunityListView'
      })
    }
  }
}
</script>

<style scoped>
/*.header{
  margin-top:5%;
  margin-bottom: 6%;
  width:100%;
}*/
</style>