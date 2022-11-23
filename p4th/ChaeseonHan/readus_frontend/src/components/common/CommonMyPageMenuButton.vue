<template>
  <v-app-bar class="appBar" elevation="0" rounded style="background-color: #e1f0eb">
    <v-btn style="font-weight: bold" elevation="0" color="#e1f0eb" v-for="menu in menuList"
           :key="menu.text"
           :to="menu.route">
      {{ menu.text }}
    </v-btn>
  </v-app-bar>
</template>

<script>
export default {
  name: "CommonMyPageMenuButton",
  data() {
    return {
      menuList: [
        { text: "회원정보", name: "MyPageView", route: "/my-page"},
        { text: "작성글 보기", name: "MyBoardListView", route: "/my-board"},
      ]
    }
  }
}
</script>

<style scoped>
.appBar {
  font-family: "210 M고딕 040";
}

</style>