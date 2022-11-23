<template>
  <nav>
    <header-view-practice/>

    <br/><br/><br/><br/><br/>

    <v-row justify="center">
      <review-read v-if="reviewBoard" :reviewBoard="reviewBoard"/>
      <p v-else>Loading .......</p>

    </v-row>

    <v-row justify="center">
      <v-btn @click="goPage" class="writeBtn" color="grey lighten-5" dark>
        <router-link :to="{ name: 'ReviewListView' }">목록</router-link></v-btn>

      <v-btn v-if="nicknameValue == reviewBoard.writer" @click="onModify" type="submit" class="writeBtn2" color="yellow lighten-5" >수정</v-btn>

      <v-btn v-if="nicknameValue == reviewBoard.writer" @click="onDelete" type="submit" class="writeBtn2" color="grey darken-1" dark>삭제</v-btn>

    </v-row>

    <br/><br/><br/>

    <FooterForm/>
  </nav>
</template>

<script>
import ReviewRead from "@/components/boards/reviewBoards/ReviewRead";
import HeaderViewPractice from "@/views/main/HeaderViewPractice";
import FooterForm from "@/components/common/FooterForm";
import {mapActions, mapState} from "vuex";
export default {
  name: "ReviewReadView",
  components: {FooterForm, HeaderViewPractice, ReviewRead},
  props: {
    reviewBoard: {
      type: Object,
      required: true,
    },
    reviewNo: {
      type: String,
      required: true
    }
  },
  data() {
    return {
      nicknameValue: '',
    }
  },
  async mounted() {
    let replacedUserValue
    const currentUserValue = localStorage.getItem('userInfo');
    if (currentUserValue != null) {
      replacedUserValue = currentUserValue.replaceAll("\"", "")
      await this.requestLoginUserNickNameFromSpring({replacedUserValue});
      this.nicknameValue = this.$store.state.loginUserNickname
    }
  },
  computed: {
    ...mapState(['reviewBoard'])
  },
  methods: {
    ...mapState([
      'loginUserNickname', 'reviewBoard'
    ]),
    ...mapActions([
      'requestReviewFromSpring',
      'requestDeleteReviewToSpring',
      'requestLoginUserNickNameFromSpring'
    ]),
    async onDelete () {
      await this.requestDeleteReviewToSpring(this.reviewNo);
      await this.$router.push({ name: 'ReviewListView' })
    },
    async onModify () {
      await this.$router.push({ name: 'ReviewModifyView' })
    }
  },
  created() {
    this.requestReviewFromSpring(this.reviewNo)
  }
}
</script>

<style scoped>

</style>