<template>
  <v-row class="mb-3">
    <v-col>
      <v-btn class="mr-2" small v-for="item in category" :key="item.index">
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
        { index: 1, title: "정보" },
        { index: 2, title: "리뷰" },
        { index: 3, title: "일상" },
      ]
    }
  }
}
</script>

<style scoped>

</style>