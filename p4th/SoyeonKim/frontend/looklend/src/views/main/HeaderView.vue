<template>
  <div class="header">
    <Header>
      <!--로그아웃화면-->
      <v-container v-if="checkuserInfo == null">
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


      <!--검색-->
      <v-spacer></v-spacer>
      <v-card-title>
        <v-spacer></v-spacer><v-spacer></v-spacer>
        <v-btn icon type="submit" color="basil">
          <v-icon>mdi-magnify</v-icon>
          <span></span>
          <v-input size="sm" class="mr-sm-2" placeholder="Search"></v-input>
        </v-btn>


        <!-- 게시판 -->
      </v-card-title>
      <v-tabs v-model="tab" background-color="transparent" color="basil" grow>
        <v-tab v-for="menu in menus" :key="menu">
          {{ menu }}
        </v-tab>
      </v-tabs>
    </v-card>

  </div>

</template>

<script>
export default {
  name: "HeaderView",
  data () {
    return {
      tab: null,
      menus: [
        'HOME', '요청하기', '빌려주기', '후기'
      ],
      LogoutLinks: [
        { icon: 'mdi-login-variant', text: 'LOGIN', name: 'login', route: '/sign-in' },
        { icon: 'mdi-account-plus', text: 'SIGNUP', name: 'signup', route: '/sign-up' },
      ]
    }
  },
  methods: {
    HomeViewLink() {
      this.$router.push({path: '/'})
    },
  }
}
</script>

<style scoped>

</style>