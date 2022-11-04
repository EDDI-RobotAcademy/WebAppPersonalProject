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
            :v-model= "keyword"
            label="검색어를 입력해주세요"
            outlined
            type="text"
            append-icon="mdi-magnify"
            @click:append="search"/>

<!--          검색 받아오기 초안
1. 메인검색템플릿 actions에 totalSearchText payload로 메소드 쏘기
2. 스프링에서 find해서 다시 리턴
3. 리턴 값 states 데이터로 commit  (totalSearchBoardslist)
4. 해당 값 commonBoardList에서 if totalSearchBoardslist가 존재하면 보여지는 테이블로 보여주기
-->
        </v-col>
        <v-spacer></v-spacer>

        <v-col cols="auto">
<!--          로그인되어 있는 경우 Home , My, 로그아웃으로 변경 -->
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
              :v-model= "keyword"
              label="검색어를 입력해주세요"
              outlined
              type="text"
              append-icon="mdi-magnify"
              @click:append="search"/>
        </v-col>
        <v-col cols="auto">
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

export default {
  name: "CommonMainMenuTemplate",
  mixins: [commonMixins],
  components:{
    CommonMenuBar,
  },
  props:{
     keyword: String
  },
  methods: {
    search() {
      const keyword = this.keyword
      this.requestDiaryBoardListFromSpring( keyword )
    }
  }
}
</script>

<style scoped>
a {
  text-decoration: none;
}
</style>