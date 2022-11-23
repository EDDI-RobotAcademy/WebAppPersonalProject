<template>
  <nav>
    <header-view-practice/>

    <br/><br/><br/><br/><br/>

    <v-row justify="center">
      <community-read v-if="communityBoard" :communityBoard="communityBoard"/>
      <p v-else>Loading .......</p>

    </v-row>

    <v-row justify="center">
      <v-btn @click="goPage" class="writeBtn" color="grey lighten-5" dark>
        <router-link :to="{ name: 'CommunityListView' }">목록</router-link></v-btn>

      <v-btn v-if="nicknameValue == communityBoard.writer" @click="onModify" type="submit" class="writeBtn2" color="yellow lighten-5" >수정</v-btn>

      <v-btn v-if="nicknameValue == communityBoard.writer" @click="onDelete" type="submit" class="writeBtn2" color="grey darken-1" dark>삭제</v-btn>

    </v-row>

    <br/><br/><br/>

    <FooterForm/>
  </nav>
</template>

<script>
import CommunityRead from "@/components/boards/communityBoards/CommunityRead";
import {mapActions, mapState} from "vuex";
import FooterForm from "@/components/common/FooterForm";
import HeaderViewPractice from "@/views/main/HeaderViewPractice";
export default {
  name: "CommunityReadView",
  components: {HeaderViewPractice, FooterForm, CommunityRead},
  props: {
    communityBoard: {
      type:Object,
      required: true
    },
    communityNo: {
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
    ...mapState([
        'communityBoard', 'loginUserNickname'
    ])
  },
  methods: {
    ...mapActions([
      'requestCommunityFromSpring',
      'requestDeleteCommunityToSpring',
      'requestLoginUserNickNameFromSpring'
    ]),
    async onDelete () {
      await this.requestDeleteCommunityToSpring(this.communityNo);
      await this.$router.push({ name: 'CommunityListView' })
    },
    async onModify () {
      await this.$router.push({ name: 'CommunityModifyView' })
    }
  },
  created() {
    this.requestCommunityFromSpring(this.communityNo)
  }
}
</script>

<style scoped>

</style>