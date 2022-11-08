<template>
  <div>
      <v-app-bar app color="white" height="150px" class="elevation-0">
        <v-spacer></v-spacer>
        <v-toolbar-title align="center">
          <router-link style="text-decoration: none;" to="/">
            <v-img
                :src="require('@/assets/img/logo.png')"
                width="50px"
                class="mt-5 mr-3"
                style="float: left"
            ></v-img>
            <div class="light-green--text mt-1" style="width: 300px; height: 80px">
              <b style="font-size: 50px; font-weight: bold">PLANTS</b>
            </div>
          </router-link>
        </v-toolbar-title>
        <v-spacer></v-spacer>
        <div style="height: 120px;" v-if="checkUserInfo == null">
          <router-link style="text-decoration: none;" to="/sign-in">
            <span class="grey--text mr-3" style="font-size: 13px">로그인</span>
          </router-link>

          <router-link style="text-decoration: none;" to="/sign-up">
            <span class="grey--text" style="font-size: 13px">회원가입</span>
          </router-link>
        </div>
        <div style="height: 120px;" v-if="checkUserInfo != null">
          <router-link style="text-decoration: none;" to="/my-page">
            <span class="grey--text mr-3" style="font-size: 13px">나의 정보</span>
          </router-link>
          <router-link @click.native="logout" style="text-decoration: none;" to="/">
            <span class="grey--text" style="font-size: 13px" >로그아웃</span>
          </router-link>
        </div>
        <template v-slot:extension>
          <v-container>
            <v-row no-gutters>
              <v-col class="col-12 col-sm-4">
                <router-link style="text-decoration: none; font-weight: bold" to="/search">
                  <p class="light-green--text text--darken-3" align="center">식물 검색</p>
                </router-link>
              </v-col>
              <v-col class="col-12 col-sm-4">
                <router-link style="text-decoration: none; font-weight: bold" to="/my-plant">
                  <p class="light-green--text text--darken-3" align="center">나의 식물</p>
                </router-link>
              </v-col>
              <v-col class="col-12 col-sm-4">
                <router-link style="text-decoration: none; font-weight: bold" to="/question-board">
                  <p class="light-green--text text--darken-3" align="center">질문게시판</p>
                </router-link>
              </v-col>
            </v-row>
          </v-container>
        </template>
      </v-app-bar>
    <v-divider></v-divider>
  </div>
</template>

<script>
export default {
  name: "CommonMenuBar",
  data () {
    return {
      checkUserInfo: localStorage.getItem('userInfo')
    }
  },
  methods: {
    logout() {
      this.$cookies.remove('user')
      this.isLogin = false
      this.$store.state.userInfo = null
      localStorage.removeItem('userInfo')
      alert('로그아웃 되었습니다.')
    },
  },
}
</script>

<style scoped>

</style>