<template>
  <v-app style="background-color: #FFFBE6">
    <v-container>
      <v-layout>
        <header-view/>
      </v-layout>
    </v-container>
    <v-main>
      <v-container>
        <router-view/>
      </v-container>
    </v-main>
  </v-app>
</template>

<script>

import HeaderView from "@/views/HeaderView";
export default {
  name: 'App',
  components: { HeaderView },
  data: () => ({
    //
  }),
};
</script>
