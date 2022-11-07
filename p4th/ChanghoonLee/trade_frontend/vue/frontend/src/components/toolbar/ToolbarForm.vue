<template>
  <v-container justify-center>
    <div>
      <v-toolbar dense dark>
        <v-toolbar-title>
          <router-link to="/">
            <v-img :src="require('@/assets/img/로고.png')" :height=40 contain></v-img>
          </router-link>
        </v-toolbar-title>
        <v-toolbar-items>
          <v-btn text v-for="category in menuCategory" :key="category.text" :to="category.route">
            {{ category.text }}
          </v-btn>
        </v-toolbar-items>
      </v-toolbar>
    </div>
  </v-container>
</template>

<script>
export default {
  name: "toolbarForm",
  components: {

  },
  data() {
    return {
      menuCategory: [
        { text: '아이템 구매', name: 'buy-item-boards', route: '/' },
        { text: '아이템 판매', name: 'sell-item-boards', route: '/' }, // 루트 알맞게 설정
        { text: '자유게시판', name: 'free-boards', route: '/' },
        { text: '신고게시판', name: 'report-boards', route: '/' },
        { text: '공지사항', name: 'notice-boards', route: '/' },
        { text: '회원가입', name: 'sign-in', route: '/' },
        { text: '로그인', name: 'login', route: '/' },
      ],
    }
  },
  methods: {

  }
}
</script>

<style scoped>

</style>