<template>
  <v-container>
    <header-component/>
    <v-layout justify-center>
      <h3>요리</h3>
    </v-layout>
  </v-container>
</template>

<script>
import HeaderComponent from "@/components/header/HeaderComponent";
export default {
  name: "CookBucketList",
  components: {HeaderComponent}
}
</script>

<style scoped>

</style>