<template>
  <nav>
    <header-view-practice/>

    <br/><br/><br/><br/><br/>

    <v-row justify="center">
      <review-modify v-if="reviewBoard" :reviewBoard="reviewBoard" @submit="onSubmit"/>
      <p v-else>Loading .........</p>
    </v-row>

    <br/><br/><br/>

    <FooterForm/>
  </nav>
</template>

<script>
import ReviewModify from "@/components/boards/reviewBoards/ReviewModify";
import HeaderViewPractice from "@/views/main/HeaderViewPractice";
import FooterForm from "@/components/common/FooterForm";
import {mapActions, mapState} from "vuex";
export default {
  name: "ReviewModifyView",
  components: {FooterForm, HeaderViewPractice, ReviewModify},
  props: {
    reviewNo: {
      type: String,
      required: true
    }
  },
  computed: {
    ...mapState(['reviewBoard'])
  },
  methods: {
    ...mapActions([
      'requestReviewFromSpring',
      'requestModifyReviewToSpring'
    ]),
    async onSubmit (payload) {
      const { type, title, writer, content, regDate } = payload
      const reviewNo = this.reviewNo
      await this.requestModifyReviewToSpring({ reviewNo, type, title, writer, content, regDate })
      await this.$router.push({
        name: 'ReviewReadView',
        params: { reviewNo: this.reviewNo }
      })
    }
  },
  created () {
    this.requestReviewFromSpring(this.reviewNo)
  }

}
</script>

<style scoped>

</style>