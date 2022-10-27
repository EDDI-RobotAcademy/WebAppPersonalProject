<template>
  <v-container class="headerFrom">
    <tool-bar-component/>
    <v-divider></v-divider>
    <category-component/>
  </v-container>
</template>

<script>

import ToolBarComponent from "@/components/common/ToolBarComponent";
import CategoryComponent from "@/components/common/CategoryComponent";

export default {
  name: "HeaderComponent",
  components: {
    ToolBarComponent,
    CategoryComponent
  },
}
</script>

<style scoped>
.headerFrom {
  padding-top: 50px;
}
</style>