<template>
  <nav>
    <v-toolbar flat app v-if="$store.state.isAuthenticated == true">
      <v-toolbar-title>
        <router-link to="/">
          <v-img :src="require('@/assets/img/로고.png')" :height=60 contain></v-img>
        </router-link>
      </v-toolbar-title>

      <v-spacer></v-spacer>
      <v-dialog v-model="myPageDialog" persisten max-width="800">
        <template v-slot:activator="{on}">
          <v-btn class="grey white--text" rounded depressed small v-on="on">
            마이페이지
          </v-btn>
        </template>
        <v-card>
          <v-card-title class="headline">
            {{ myPageTitle }}
          </v-card-title><br/>
          <v-card-text>
            아이디 :
          </v-card-text>
          <v-card-text>
            거주지역 :
          </v-card-text>
          <v-card-actions>
            <v-spacer></v-spacer>
            <v-btn color="red" text @click="cancelBtn">
              나가기
            </v-btn>
          </v-card-actions>
        </v-card>
      </v-dialog>
      &nbsp;
      <v-dialog v-model="logoutDialog" persisten max-width="400">
        <template v-slot:activator="{on}">
          <v-btn class="grey white--text" rounded depressed small v-on="on">
            로그아웃
          </v-btn>
        </template>
        <v-card>
          <v-card-title class="headline">
            {{ logoutTitle }}
          </v-card-title>
          <v-card-text>
            로그아웃 하시겠습니까?
          </v-card-text>
          <v-card-actions>
            <v-spacer></v-spacer>
            <v-btn color="grey darken-2" text @click="cancelBtn">
              취소
            </v-btn>
            <v-btn color="red" text @click="logoutBtn">
              로그아웃
            </v-btn>
          </v-card-actions>
        </v-card>
      </v-dialog>
    </v-toolbar>
    <v-toolbar flat app v-else>
      <v-toolbar-title>
        <router-link to="/">
          <v-img :src="require('@/assets/img/로고.png')" :height=60 contain></v-img>
        </router-link>
      </v-toolbar-title>

      <v-spacer></v-spacer>
      <router-link to="/sign-up">
        <v-btn class="grey white--text" rounded depressed small>
          회원가입
        </v-btn>
      </router-link>&nbsp;
      <router-link to="/sign-in">
        <v-btn class="grey white--text" rounded depressed small>
          로그인
        </v-btn>
      </router-link>
    </v-toolbar>
  </nav>
</template>

<script>
export default {
  name: "TopMenuForm",
  data() {
    return {
      myPageTitle: "마이페이지",
      logoutTitle: "로그아웃",
      message: "로그아웃을 하시겠습니까?",
      myPageDialog: false,
      logoutDialog: false,
    }
  },
  methods: {
    cancelBtn() {
      this.myPageDialog = false
      this.logoutDialog = false
    },
    logoutBtn() {

    }
  }
}
</script>

<style scoped>

a {
  text-decoration: none;
}

</style>