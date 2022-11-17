<template>
  <v-app-bar elevation="0" color="#356859" class="white--text">
    <v-spacer></v-spacer>
    <h5 class="white--text px-2">
      {{nickName}} 님
    </h5>

    <v-menu  open-on-hover offset-y>
      <template v-slot:activator="{ on }">
        <v-btn class="px-2" elevation="0" color="#356859" rounded v-on="on">
          <v-icon color="white">
            mdi-dots-vertical
          </v-icon>
        </v-btn>
      </template>

      <!-- 로그인시 -->

      <v-list v-if="isLogin" style="background-color: #356859" class="text-center">
        <v-list-item class="white--text" :to="signInMyPage.route">
          <v-list-item-title class="text-center">
            {{ signInMyPage.text }}
          </v-list-item-title>
        </v-list-item>
        <v-list-item class="white--text" @click="logOut">
          <v-list-item-title class="text-center">
            로그아웃
          </v-list-item-title>
        </v-list-item>
      </v-list>

      <!-- 비로그인시 -->

      <v-list v-else style="background-color: #356859">
        <v-list-item class="white--text" v-for="(item, index) in nonSignInItems" :key="index" :to="item.route">
          <v-list-item-title class="text-center">
            {{ item.text }}
          </v-list-item-title>
        </v-list-item>
      </v-list>

    </v-menu>
  </v-app-bar>
</template>

<script>
export default {
  name: "MemberMenuComponent",
  props: {
    nickName: String,
    isLogin: Boolean,
  },

  data() {
    return {

      signInMyPage: {
        text: '마이페이지',
        name: 'SignIn',
        route: '/sign-in' },

      nonSignInItems: [
        { text: '로그인', name: 'SignIn', route: '/sign-in' },
        { text: '회원가입', name: 'SignUp', route: '/sign-up'}
      ],

    }
  },

  methods: {
    logOut() {
      this.$store.state.isAuthenticated = false
      this.$store.state.loginUserProfile = []
      this.$cookies.remove("user")
      localStorage.removeItem("userInfo")
      localStorage.removeItem("vuex")
      alert("로그아웃 되었습니다!")
      this.$router.push("/")
    }
  }
}
</script>

<style scoped>

</style>