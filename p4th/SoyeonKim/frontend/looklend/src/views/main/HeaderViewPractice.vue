<template>
  <div class="header">
    <Header>

      <v-container v-if="loginStateCheckVal">
        <v-row>
          <v-spacer></v-spacer><v-spacer></v-spacer>
          <v-btn @click="logout()" type="submit" plain background-color="transparent" color="basil">LOGOUT</v-btn>

            <div>
              <router-link :to="{name: 'MyPageView', params:{id: this.id}}" >
                <v-btn plain background-color="transparent" color="basil">{{nicknameValue}} MyPAGE</v-btn>
              </router-link>
            </div>

        </v-row>
      </v-container>


      <v-container v-else>
        <v-row>
          <v-spacer></v-spacer><v-spacer></v-spacer>
          <v-btn plain background-color="transparent" color="basil" v-for="link in LogoutLinks" :key="link.icon" :to="link.route">
            <v-icon left>
              {{ link.icon }}
            </v-icon>
            <span> {{ link.text }}</span>
          </v-btn>
        </v-row>
      </v-container>

    </Header>


    <!--사이트 이름(로고)-->
  <v-card color="basil">
    <v-content><v-container></v-container></v-content>
    <v-card-title>
      <v-row justify="center">
        <h1 class="font-weight text-h2 basil-text"  @click="HomeViewLink">
          LOOKLEND
        </h1>
      </v-row>
    </v-card-title>

    <v-spacer></v-spacer>
    <v-card-title>
      <v-spacer></v-spacer><v-spacer></v-spacer>

      <v-btn icon type="submit" color="basil">
        <v-icon>mdi-magnify</v-icon>
        <span></span>
        <v-input size="sm" class="mr-sm-2" placeholder="Search"></v-input>
      </v-btn>


      <!-- 홈, 게시판 -->
      <v-btn plain background-color="transparent" color="basil" v-for="link in links" :key="link.icon" :to="link.route">
        <v-icon left>
          {{ link.icon }}
        </v-icon>
        <span> {{ link.text }}</span>
      </v-btn>
    </v-card-title>

    <v-tabs v-model="tab" background-color="transparent" color="basil" grow>
      <v-tab>
        <v-menu open-on-hover bottom offset-y>
          <template v-slot:activator="{ on, attrs }">
            <v-btn plain background-color="transparent" color="basil" v-bind="attrs" v-on="on" @click="HomeViewLink">
              HOME
            </v-btn>
          </template>
        </v-menu>
      </v-tab>

      <v-tab>
        <v-menu open-on-hover bottom offset-y>
          <template v-slot:activator="{ on, attrs }">
            <v-btn plain background-color="transparent" color="basil" v-bind="attrs" v-on="on" @click="CommunityListLink">
              COMMUNITY
            </v-btn>
          </template>
        </v-menu>
      </v-tab>

      <v-tab>
        <v-menu open-on-hover bottom offset-y>
          <template v-slot:activator="{ on, attrs }">
            <v-btn plain background-color="transparent" color="basil" v-bind="attrs" v-on="on" @click="LendListLink">
              LEND
            </v-btn>
          </template>
        </v-menu>
      </v-tab>

      <v-tab>
        <v-menu open-on-hover bottom offset-y>
          <template v-slot:activator="{ on, attrs }">
            <v-btn plain background-color="transparent" color="basil" v-bind="attrs" v-on="on" @click="ReviewLink">
              REVIEW
            </v-btn>
          </template>
        </v-menu>
      </v-tab>

    </v-tabs>
  </v-card>
  </div>
</template>

<script>
export default {
  name: "HeaderViewPractice",
  props: {
    nicknameValue: {
      type: String
    }
  },
  data () {
    return {
      tab: null,

      LogoutLinks: [
        { icon: 'mdi-login-variant', text: 'LOGIN', name: 'login', route: '/sign-in' },
        { icon: 'mdi-account-plus', text: 'SIGNUP', name: 'signup', route: '/sign-up' },
      ]
      ,
      LoginLinks: [
        { icon: 'mdi-login-variant', text: 'LOGOUT', name: 'logout', route: '/' },
        { icon: 'mdi-account-plus', text: 'MYPAGE', name: 'mypage', route: '/my-page' },
      ],

      loginStateCheckVal: false,

    }
  },
  mounted() {
    this.loginStateCheckVal = this.$store.state.userLoginCheck
    if (localStorage.getItem('userInfo') != null){
      this.loginStateCheckVal = true
    }
    console.log("로그인 상태: " + this.loginStateCheckVal)


    this.loginNickname = this.$store.state.userInfo.nickname
    console.log("로그인 사용자 닉네임: " + this.loginNickname)
  },

  methods: {
    HomeViewLink() {
      this.$router.push({path: '/'})
    },
    CommunityListLink() {
      this.$router.push({ path: '/community-list' })
    },
    LendListLink() {
      this.$router.push({ path: '/lend-list' })
    },
    ReviewLink() {
      this.$router.push({ path: '/review-list' })
    },

    logout() {
      console.log("로그아웃!")
      this.$store.commit('IS_AUTHENTICATED', false)
      this.isLogin = false
      this.$store.commit('USER_LOGIN_CHECK', false)

      localStorage.removeItem("userInfo")
      this.$cookies.remove('user')
      this.$router.push({name: 'HomeView'})

      alert('로그아웃 되었습니다!')

     /* localStorage.removeItem("loginInfo")
      this.$cookies.remove("user")
      this.$router.push({name: 'HomeView'})
      alert('로그아웃 되었습니다!')*/
    }
  }
}
</script>

<style scoped>

</style>