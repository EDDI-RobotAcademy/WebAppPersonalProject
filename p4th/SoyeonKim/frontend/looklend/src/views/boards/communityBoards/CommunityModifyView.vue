<template>
  <nav>
    <header-view-practice/>

    <br/><br/><br/><br/><br/>

    <v-row justify="center">
      <community-modify v-if="communityBoard" :communityBoard="communityBoard" @submit="onSubmit"/>
      <p v-else>Loading .........</p>
    </v-row>

    <br/><br/><br/>

    <FooterForm/>
  </nav>
</template>

<script>
import CommunityModify from "@/components/boards/communityBoards/CommunityModify";
import {mapActions, mapState} from "vuex";
import HeaderViewPractice from "@/views/main/HeaderViewPractice";
import FooterForm from "@/components/common/FooterForm";


export default {
  name: "CommunityModifyView",
  components: {FooterForm, HeaderViewPractice, CommunityModify},
  props: {
    communityNo: {
      type: String,
      required: true
    }
  },
  computed: {
    ...mapState(['communityBoard'])
  },
  methods: {
    ...mapActions([
      'requestCommunityFromSpring',
      'requestModifyCommunityToSpring'
    ]),
    async onSubmit (payload) {
      const { type, title, writer, content, regDate } = payload
      const communityNo = this.communityNo
      await this.requestModifyCommunityToSpring({ communityNo, type, title, writer, content, regDate })
      await this.$router.push({
        name: 'CommunityReadView',
        params: { communityNo: this.communityNo }
      })
    }
  },
  created () {
    this.requestCommunityFromSpring(this.communityNo)
  }

}
</script>

<style scoped>

</style>