<template>
  <v-container>
    <v-toolbar color="light-green darken-1" dense dark elevation="2">
      <v-toolbar-items>
        <v-spacer class="col-1"></v-spacer>
        <v-btn class="col-8 white--text text-subtitle-2" text v-for="link in links" :key="link.icon" :to="link.route">
          {{ link.text }}
        </v-btn>
        <v-menu open-on-hover offset-y>
          <template v-slot:activator="{ on }">
            <v-btn color="light-green darken-1" class="white--text ma-5" v-on="on">
              <v-icon color="white">
                mdi-dots-vertical
              </v-icon>
            </v-btn>
          </template>

          <v-list>
            <v-list-item v-for="(dropItem, index) in dropItems" :key="index" :to="dropItem.route">
              <v-list-item-title class="text-center">
                {{ dropItem.text }}
              </v-list-item-title>
            </v-list-item>
          </v-list>
        </v-menu>
      </v-toolbar-items>
    </v-toolbar>
  </v-container>

</template>

<script>
export default {
  name: "MenuBarComponent",
  data() {
    return {
      nav_drawer: false,
      links: [
        { icon: 'mdi-home', text: '모두의 서재', name: 'HomeView', route: '/' },
        { icon: 'mdi-ev-station', text: '커뮤니티', name: 'SignIn', route: '/sign-in' },
      ],
      dropItems: [
        { text: '로그인', name: 'SignIn', route: '/sign-in' },
        { text: '회원가입', name: 'SignUp', route: 'sign-up'}
      ]
    }
  }
}
</script>

<style scoped>

</style>