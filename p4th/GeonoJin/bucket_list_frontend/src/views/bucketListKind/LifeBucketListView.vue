<template>
  <v-container>
    <header-component/>
    <v-layout justify-center>
      <h3>일상</h3>
    </v-layout>
  </v-container>
</template>

<script>
import HeaderComponent from "@/components/header/HeaderComponent";
export default {
  name: "LifeBucketListView",
  components: {HeaderComponent}
}
</script>

<style scoped>

</style>