<template>
  <v-container>
    <div>
      <v-row justify="center">
        <v-col cols="auto">
          <router-link to="/">
            <v-img
                :src="require('@/assets/logo_blue_lighen1.png')" width="180" class="ma-2" />
          </router-link>

        </v-col>
        <v-spacer></v-spacer>
        <v-col cols="5" align-self="center">
          <v-text-field
            v-model= "message"
            label="검색어를 입력해주세요"
            outlined
            type="text"
            append-icon="mdi-magnify"
            @click:append="search"/>
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
      <common-menu-bar/>
    </div>
  </v-container>
</template>

<script>
import CommonMenuBar from "@/components/common/CommonMenuBar";

export default {
  name: "CommonMainMenuBar",
  components:{
    CommonMenuBar
  },
  data() {
    return{
      message: "",
    }
  },
  methods: {
    search(){
      alert('검색을 실행합니다')
    }
  }
}
</script>

<style scoped>
a {
  text-decoration: none;
}
</style>