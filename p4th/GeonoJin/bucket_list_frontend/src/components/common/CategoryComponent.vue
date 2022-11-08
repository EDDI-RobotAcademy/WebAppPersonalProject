<template>
  <v-container>
    <v-layout justify-center>
      <div class="category_menu">
        <button-component :btnValues="btnKinds" class="mx-2"/>
      </div>
    </v-layout>
  </v-container>
</template>

<script>

import ButtonComponent from "@/components/common/ButtonComponent";

export default {
  name: "CategoryComponent",

  components: {ButtonComponent},

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