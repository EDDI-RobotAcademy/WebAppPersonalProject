<template>
  <v-layout
      justify-center
      class="category_menu"
  >
    <v-btn
        v-for="(btnKind, index) in btnKinds" :key="index" :to="btnKind.route"
        class="mx-2"
        depressed
        rounded
        color="white"
    >
      {{ btnKind.name }}
    </v-btn>
  </v-layout>
</template>

<script>

export default {
  name: "CategoryComponent",
  data() {
    return {
      btnKinds: [
        {name: '전체', route: "/home"},
        {name: '일상', route: "/life"},
        {name: '요리', route: "/cook"},
        {name: '여행', route: "/travel"},
        {name: '자기개발', route: "/study"},
        {name: '건강', route: "/health"},
      ]
    }
  },
}
</script>

<style scoped>

.category_menu {
  margin-top: 60px;
}
</style>