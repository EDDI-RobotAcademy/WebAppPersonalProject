<template>
  <div style="background-color: #356859" >
    <v-container>
      <app-bar-component/>
    </v-container>
  </div>
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