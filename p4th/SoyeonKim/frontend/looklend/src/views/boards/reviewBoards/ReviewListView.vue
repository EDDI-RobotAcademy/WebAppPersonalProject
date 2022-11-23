<template>
  <nav>
    <header-view-practice/>

    <br/>

    <v-row justify="center">
      <review-list :reviewBoards="reviewBoards"/>
    </v-row>

    <br/>
    <br/>
    <br/>

    <FooterForm/>
  </nav>
</template>

<script>
import ReviewList from "@/components/boards/reviewBoards/ReviewList";
import HeaderViewPractice from "@/views/main/HeaderViewPractice";
import FooterForm from "@/components/common/FooterForm";
import {mapActions, mapState} from "vuex";
export default {
  name: "ReviewListView",
  components: {FooterForm, HeaderViewPractice, ReviewList},
  data () {
    return {
      keyword: ''
    }
  },
  computed: {
    ...mapState(['reviewBoards'])
  },
  mounted () {
    this.requestReviewListFromSpring()
  },
  methods: {
    ...mapActions(['requestReviewListFromSpring'])
  }
}
</script>
<style scoped>

</style>