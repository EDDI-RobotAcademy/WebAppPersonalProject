<template>
  <v-app>
    <header-view/>
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
