<template>
  <v-container>
    <div>
      <app-bar-component/>
    </div>
  </v-container>
</template>

<script>
import AppBarComponent from "@/components/Header/AppBarComponent";
export default {
  name: "HeaderView",
  components: {AppBarComponent,}
}
</script>

<style scoped>

</style>