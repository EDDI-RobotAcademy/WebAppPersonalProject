<template>
  <v-container>
    <header-component/>
    <v-layout justify-center>
      <h3>건강</h3>
    </v-layout>
  </v-container>
</template>

<script>
import HeaderComponent from "@/components/header/HeaderComponent";

export default {
  name: "HealthBucketList",
  components: {HeaderComponent}
}
</script>

<style scoped>

</style>