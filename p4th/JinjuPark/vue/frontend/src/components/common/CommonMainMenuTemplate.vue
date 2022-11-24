<template>
  <v-container>
    <div>
      <v-row justify="center" v-if="!isMobile()">
        <v-col cols="auto">
          <router-link to="/">
            <v-img
                :src="require('@/assets/logo_blue_lighen1.png')" width="180" class="ma-2" />
          </router-link>

        </v-col>
        <v-spacer></v-spacer>
        <v-col cols="5" align-self="center">
          <v-text-field v-show="!mainPageShow"
              v-model= "keyword"
              ref="keyword"
              label="검색어를 입력해주세요"
              outlined
              type="text"
              append-icon="mdi-magnify"
              @click:append="search"/>
        </v-col>

        <v-spacer></v-spacer>

        <!--          로그인되어 있는 경우 Home , My, 로그아웃으로 변경 -->
        <v-col cols="auto" v-if="this.$store.state.isAuthenticated">
          <v-btn small text @click="goHome">Home</v-btn>
          <v-btn small text @click="logout">로그아웃</v-btn>
          <v-btn small text @click="goMyPage">My</v-btn>
        </v-col>
        <v-col cols="auto" v-else>
          <v-btn small text @click="goHome">Home</v-btn>
          <v-btn small text @click="goSignUp">회원가입</v-btn>
          <v-btn small text @click="goSignIn">로그인</v-btn>
          <v-btn small text @click="goSignIn">My</v-btn>
        </v-col>
      </v-row>

      <v-row justify="center" v-else>
        <v-col cols="auto">
          <router-link to="/">
            <v-img
                :src="require('@/assets/logo_blue_lighen1.png')" width="180" class="ma-2" />
          </router-link>
        </v-col>
        <v-spacer></v-spacer>
        <v-col cols="auto" align-self="center">
          <v-text-field v-show="!mainPageShow"
              v-model= "keyword"
              ref="keyword"
              label="검색어를 입력해주세요"
              outlined
              type="text"
              append-icon="mdi-magnify"
              @click:append="search"
          />
        </v-col>
        <v-col cols="auto" v-if="this.$store.state.isAuthenticated">
          <v-btn small text @click="goHome">Home</v-btn>
          <v-btn small text @click="logout">로그아웃</v-btn>
          <v-btn small text @click="goMyPage">My</v-btn>
        </v-col>
        <v-col cols="auto" v-else>
        <!--          로그인되어 있는 경우 Home , My, 로그아웃으로 변경 -->
          <v-btn small text @click="goHome">Home</v-btn>
          <v-btn small text @click="goSignUp">회원가입</v-btn>
          <v-btn small text @click="goSignIn">로그인</v-btn>
          <v-btn small text @click="goSignIn">My</v-btn>
        </v-col>


      </v-row>
      <common-menu-bar/>
    </div>
  </v-container>
</template>

<script>
import CommonMenuBar from "@/components/common/CommonMenuBar";
import commonMixins from "@/mixins/CommonMixins";
import cookies from 'vue-cookies';
import {mapActions, mapState} from "vuex";
import Vue from "vue";

Vue.use(cookies);

export default {
  name: "CommonMainMenuTemplate",
  mixins: [commonMixins],
  components:{
    CommonMenuBar,
  },
  computed: {
    ...mapState([
      'diaryBoards',
      'isAuthenticated'
    ]),
  },
  props:{
      mainPageShow: Boolean
  },
  data(){
    return{
      keyword : "",
      pageNo: 0
    }
  },
  methods: {
    ...mapActions([
      'requestDiaryBoardListFromSpring'
    ]),
    search() {
        const pageNo = this.pageNo
        const keyword = this.$refs.keyword.value
        this.requestDiaryBoardListFromSpring({pageNo, keyword})
    },
     async logout() {
      console.log("로그아웃합니다")
      this.$store.commit('IS_AUTHENTICATED', false)
      this.isLogin = false
      this.$store.commit('USER_LOGIN_CHECK', false)
      localStorage.removeItem("userInfo")
      this.$cookies.remove('user')
       alert('로그아웃 되었습니다.')
      await this.$router.push({name:'HomeMainView'})
    },
    goHome() {
      this.$router.push({name:'HomeMainView'})
      },
    goMyPage() {
      this.$router.push({name:'MyPageView'})
    },
    goSignIn(){
      this.$router.push({name:'SignInView'})
    },
    goSignUp(){
      this.$router.push({name:'SignUpView'})
    },
  }
}

</script>

<style scoped>
a {
  text-decoration: none;
}
v-btn{
  padding-right: 0;
}
</style>
