<template>
  <v-container justify-center>
    <div>
      <v-toolbar dense dark>
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
      ],
    }
  },
  methods: {

  }
}
</script>

<style scoped>

</style>