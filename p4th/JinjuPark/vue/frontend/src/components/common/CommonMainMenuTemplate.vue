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
          <v-text-field
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
          <router-link to="/main-home-board"> Home </router-link> &nbsp;
          <router-link @click.native="logout()" to= "/diary-board-list"> 로그아웃</router-link> &nbsp;
          <router-link to="/sign-in"> My </router-link>
        </v-col>
        <v-col cols="auto" v-else>

<!--          if (this.$store.state.isAuthenticated != false) {-->
<!--          this.isLogin = true-->
<!--          } else {-->
<!--          this.isLogin = false-->
<!--          }-->
            <router-link to="/main-home-board"> Home </router-link> &nbsp;
            <router-link to="/sign-up"> 회원가입</router-link> &nbsp;
            <router-link to="/sign-in"> 로그인</router-link> &nbsp;
            <router-link to="/sign-in"> My </router-link>
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
          <v-text-field
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
          <router-link to="/main-home-board"> Home </router-link> &nbsp;
          <router-link @click.native="logout()" to="/diary-board-list"  > 로그아웃</router-link> &nbsp;
          <router-link to="/sign-in"> My </router-link>
        </v-col>
        <v-col cols="auto" v-else>
        <!--          로그인되어 있는 경우 Home , My, 로그아웃으로 변경 -->
          <router-link to="/main-home-board"> Home </router-link> &nbsp;
          <router-link to="/sign-up"> 회원가입</router-link> &nbsp;
          <router-link to="/sign-in"> 로그인</router-link> &nbsp;
          <router-link to="/sign-in"> My </router-link>
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
      page: String
  },
  data(){
    return{
      keyword : "",
      // cookie : this.cookie.get("user")
      //userInfo: localStorage.getItem("userInfo")
    }
  },
  methods: {
    ...mapActions([
      'requestDiaryBoardListFromSpring'
    ]),
    search() {
      if( this.page === "diary"){
        const keyword = this.$refs.keyword.value
        this.requestDiaryBoardListFromSpring(keyword)
      } else{
        alert('다이어리 외 페이지 검색 실행')
      }
    },
    logout() {
      console.log("로그아웃합니다")
      this.$store.commit('IS_AUTHENTICATED', false)
      this.isLogin = false
      this.$store.commit('USER_LOGIN_CHECK', false)
      localStorage.removeItem("userInfo")
      this.$cookies.remove('user')
      alert('로그아웃 성공!')
    }
  }
}

</script>

<style scoped>
a {
  text-decoration: none;
}
</style>
