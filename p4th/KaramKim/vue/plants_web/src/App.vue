<template>
  <v-app>
    <v-main>
        <common-menu-bar/>
      <router-view/>
    </v-main>
  </v-app>
</template>

<script>


export default {
  name: 'App',
  components: {
  },
  data: () => ({
    //
  }),
};
</script>
