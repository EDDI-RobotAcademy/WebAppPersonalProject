<template>
  <v-container class="headerFrom">
    <tool-bar-component :nicknameValue="nicknameValue"/>
    <br/>
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
  props:{
    nicknameValue: {
      type: String
    }
  }
}
</script>

<style scoped>
.headerFrom {
  padding-top: 50px;
}
</style>