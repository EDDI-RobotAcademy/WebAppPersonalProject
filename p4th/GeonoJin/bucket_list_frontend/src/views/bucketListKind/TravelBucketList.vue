<template>
  <v-container>
    <header-component/>
    <v-layout justify-center>
      <h3>여행</h3>
    </v-layout>
  </v-container>
</template>

<script>
import HeaderComponent from "@/components/header/HeaderComponent";
export default {
  name: "TravelBucketList",
  components: {HeaderComponent}
}
</script>

<style scoped>

</style>