<template>
  <v-container>
    <v-row>
      <!-- 카테고리 메뉴 -->
<!--      <v-col>
        <v-app-bar elevation="0" color="#356859">
          <v-img class="mr-5" width="100px" src="@/assets/rdLogo/rEADuS2.png" @click="backToMain"/>
          <v-btn
              class="
              col-4
              white&#45;&#45;text
              justify-center"
              color="#356859"
              rounded
              elevation="0"
              v-for="link in links" :key="link.icon" :to="link.route">
            {{ link.text }}
          </v-btn>
        </v-app-bar>
      </v-col>

      &lt;!&ndash; 검색바 &ndash;&gt;
      <v-col>
        <v-text-field class="mx-4" placeholder="검색어를 입력하세요" color="#9ecdbe" append-icon="mdi-magnify">
        </v-text-field>
      </v-col>

      &lt;!&ndash; 로그인 여부에 따른 회원 정보 메뉴 bar &ndash;&gt;
     <v-col v-if="this.$store.state.isAuthenticated">
        <member-menu-component :nick-name="this.$store.state.nickName" :is-login="true" />
      </v-col>
      <v-col v-else>
        <member-menu-component :nick-name="this.nickName" :is-login="false" />
      </v-col>-->


      <!-- test -->

      <v-col>
        <div class="d-flex flex-row justify-space-between">

          <div class="item">
            <v-app-bar elevation="0" color="#356859">
              <v-img class="mr-9" width="100px" src="@/assets/rdLogo/rEADuS2.png" @click="backToMain"/>
              <v-btn
                  class="
                  col-4
                  white--text
                  justify-center"
                  color="#356859"
                  rounded
                  elevation="0"
                  v-for="link in links" :key="link.icon" :to="link.route">
                {{ link.text }}
              </v-btn>
            </v-app-bar>
          </div>


          <div class="item">
            <v-text-field class="mx-4" placeholder="검색어를 입력하세요" color="#9ecdbe" append-icon="mdi-magnify">
            </v-text-field>
          </div>


          <div class="item" v-if="this.$store.state.isAuthenticated">
            <member-menu-component :nick-name="this.$store.state.loginUserProfile.nickName" :is-login="true" />
          </div>
          <div class="item" v-else>
            <member-menu-component :nick-name="this.nickName" :is-login="false" />
          </div>

        </div>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>

import memberMenuComponent from "@/components/Header/MemberMenuComponent";

export default {
  name: "AppBarComponent",
  components: { memberMenuComponent },
  data() {
    return {
      nickName : "방문자",
      links: [
        { text: '서재', name: 'HomeView', route: '/' },
        { text: '커뮤니티', name: 'CommunityView', route: '/community' },
      ],
    }
  }, // data

  methods: {
    backToMain() {
      this.$router.push("/")
    }

  }
}
</script>

<style scoped>

</style>