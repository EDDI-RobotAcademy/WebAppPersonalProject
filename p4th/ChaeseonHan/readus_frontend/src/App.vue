<template>
  <v-app>
    <header-view/>
    <v-main>
      <v-container>
        <router-view/>
      </v-container>
    </v-main>
    <footer-view/>
  </v-app>
</template>

<script>

import HeaderView from "@/views/HeaderView";
import FooterView from "@/views/FooterView";
export default {
  name: 'App',
  components: {FooterView, HeaderView },
  data: () => ({
    //
  }),
};
</script>
