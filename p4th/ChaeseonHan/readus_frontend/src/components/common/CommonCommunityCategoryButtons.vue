<template>
  <v-row>
    <v-col>
      <v-btn class="mr-2 mb-2" color="#356859" outlined small v-for="item in category" :key="item.index" :to="item.route">
        {{ item.title }}
      </v-btn>
    </v-col>
  </v-row>
</template>

<script>
export default {
  name: "CommonCommunityCategoryButtons",
  data() {
    return {
      writeButton: "글쓰기",
      category: [ // 네임이랑 라우터 추가하기
/*        { index: 1, title: "통합", name: 'CommunityView', route: '/community'},*/
        { index: 2, title: "정보", name: 'InformationCategory', route: '/community/information'},
        { index: 3, title: "리뷰", name: 'ReviewCategory', route: '/community/review'},
        { index: 4, title: "일상", name: 'LifeCategory', route: '/community/life' },
      ]
    }
  }
}
</script>

<style scoped>

</style>