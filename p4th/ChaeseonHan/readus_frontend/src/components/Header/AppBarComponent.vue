<template>
  <v-container>
    <v-row>

      <!-- 카테고리 메뉴 -->
      <v-col>
        <v-app-bar elevation="0" color="#356859">
          <v-btn
              class="
              px-2
              col-4
              white--text
              justify-center"
              color="#356859"
              rounded
              elevation="0"
              v-for="link in links" :key="link.icon" :to="link.route">
            {{ link.text }}
          </v-btn>
          <v-spacer class="col-1"></v-spacer>
        </v-app-bar>
      </v-col>

      <!-- 검색바 -->
      <v-col>
        <v-text-field placeholder="search" color="#9ecdbe" append-icon="mdi-magnify">
        </v-text-field>
      </v-col>

      <!-- 회원 메뉴 -->
     <v-col>
        <member-menu-component :nick-name="this.nickName"/>
      </v-col>
    </v-row>


  </v-container>
</template>

<script>
import MemberMenuComponent from "@/components/Header/MemberMenuComponent";
export default {
  name: "AppBarComponent",
  components: {MemberMenuComponent},
  data() {
    return {
      links: [
        { icon: 'mdi-home', text: '모두의 서재', name: 'HomeView', route: '/' },
        { icon: 'mdi-ev-station', text: '커뮤니티', name: 'SignIn', route: '/sign-in' },
      ],
      nickName: "",
    }
  },

  mounted() {
    if (this.nickName.length == 0) {
      this.nickName = "dfadfasdf@gmail.com"
    }
  }
}
</script>

<style scoped>

.green--app-bar {
  background-color: #356859;
  color: white;
  elevation: 0;
}


</style>