<template>
  <nav>
    <header-view-practice/>

    <br/><br/><br/><br/><br/>

    <v-row justify="center">
      <lend-read v-if="lend" :lend="lend"/>
      <p v-else>Loading .......</p>

    </v-row>

    <v-row justify="center">
      <v-btn @click="goPage" class="writeBtn" color="grey lighten-5" dark>
        <router-link :to="{ name: 'LendListView' }">목록</router-link></v-btn>

        <v-btn v-if="nicknameValue == lend.writer" @click="onModify" type="submit" class="writeBtn2" color="yellow lighten-5" :to="{ name: 'LendModifyView', params: { lendNo } }">수정</v-btn>

      <v-btn v-if="nicknameValue == lend.writer" @click="onDelete" type="submit" class="writeBtn2" color="grey darken-1" dark>삭제</v-btn>
    </v-row>

    <br/><br/><br/>

    <FooterForm/>
  </nav>
</template>

<script>
import LendRead from "@/components/boards/lendBoards/LendRead";
import {mapActions, mapState} from "vuex";
import FooterForm from "@/components/common/FooterForm";
import HeaderViewPractice from "@/views/main/HeaderViewPractice";

export default {
  name: "LendReadView",
  components:{
    HeaderViewPractice,
    FooterForm,
    LendRead,
  },
  props: {
    lend: {
      type: Object,
      required: true,
    },
    lendNo: {
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
        'lend', 'loginUserNickname' ])
  },
  methods: {
    ...mapActions([
      'requestLendFromSpring',
      'requestDeleteLendToSpring',
      'requestLoginUserNickNameFromSpring'
    ]),
    async onDelete () {
      await this.requestDeleteLendToSpring(this.lendNo);
      await this.$router.push({ name: 'LendListView' })
    },
    async onModify () {
      await this.$router.push({ name: 'LendModifyView' })
    }
  },
  created() {
    this.requestLendFromSpring(this.lendNo)
  },

  /*mounted(){
    if(window.localStorage.getItem('userInfo') != null) {
      this.$store.commit('USER_LOGIN_CHECK', true)
      let userToken = window.localStorage.getItem('userInfo')
      this.requestLoginUserFromSpring(userToken)
    }
  },*/
}
</script>

<style scoped>
</style>