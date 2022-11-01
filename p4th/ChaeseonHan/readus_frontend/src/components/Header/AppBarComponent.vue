<template>
  <v-container style="font-family: -윤고딕310">
      <v-app-bar elevation="0" color="#FFFBE6">

        <v-btn class="col-2
         font-weight-bold
         justify-center
         basil--text
         basil" elevation="0" rounded v-for="link in links" :key="link.icon" :to="link.route">
          {{ link.text }}
        </v-btn>
        <v-spacer class="col-1"></v-spacer>

        <v-text-field placeholder="search" color="#356859" append-icon="mdi-magnify">
        </v-text-field>

        <h2>
          &nbsp; &nbsp; &nbsp; &nbsp;
        </h2>
        <h4 class="basil--text">
          안녕하세요, {{nickName}} 님!  &nbsp;
        </h4>

        <v-menu open-on-hover offset-y>
          <template v-slot:activator="{ on }">
            <v-btn elevation="0" class="basil" rounded v-on="on">
              <v-icon class="basil--text">
                mdi-dots-vertical
              </v-icon>
            </v-btn>
          </template>

          <v-list class="basil basil--text">
            <v-list-item v-for="(dropItem, index) in dropItems" :key="index" :to="dropItem.route">
              <v-list-item-title class="text-center">
                {{ dropItem.text }}
              </v-list-item-title>
            </v-list-item>
          </v-list>
        </v-menu>

      </v-app-bar>
  </v-container>
</template>

<script>
export default {
  name: "AppBarComponent",
  data() {
    return {
      links: [
        { icon: 'mdi-home', text: '모두의 서재', name: 'HomeView', route: '/' },
        { icon: 'mdi-ev-station', text: '커뮤니티', name: 'SignIn', route: '/sign-in' },
      ],
      dropItems: [
        { text: '로그인', name: 'SignIn', route: '/sign-in' },
        { text: '회원가입', name: 'SignUp', route: 'sign-up'}
      ],
      nickName: "",
    }
  },

  mounted() {
    if (this.nickName.length == 0) {
      this.nickName = "방문자"
    }
  }
}
</script>

<style scoped>

.basil {
  background-color: #FFFBE6 !important;
}
.basil--text {
  color: #356859 !important;
}

</style>