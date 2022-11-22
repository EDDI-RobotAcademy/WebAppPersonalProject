<template>
  <nav>
    <header-view-practice/>

    <br/><br/><br/><br/><br/>

    <v-row>
      <review-register @submit="onSubmit"/>
    </v-row>

    <br/>
    <br/>
    <br/>

    <FooterForm/>
  </nav>
</template>

<script>
import ReviewRegister from "@/components/boards/reviewBoards/ReviewRegister";
import HeaderViewPractice from "@/views/main/HeaderViewPractice";
import FooterForm from "@/components/common/FooterForm";
import {mapActions} from "vuex";
export default {
  name: "ReviewRegisterView",
  components: {FooterForm, HeaderViewPractice, ReviewRegister},
  methods: {
    ...mapActions([
      'requestRegisterReviewToSpring'
    ]),
    async onSubmit (payload) {
      await this.requestRegisterReviewToSpring(payload)
      await this.$router.push({
        name: 'ReviewListView'
      })
    }
  }
}
</script>

<style scoped>
</style>