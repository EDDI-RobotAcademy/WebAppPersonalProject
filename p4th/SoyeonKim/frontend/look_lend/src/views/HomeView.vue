<template>
  <v-container>
    <div id="home">
      <nav>
        <router-link to="/vuetify-taste">Vuetify 맛보기</router-link> |
      </nav>
      <router-view/>
    </div>
  </v-container>
</template>

<script>
// @ is an alias to /src

export default {
  name: 'HomeView',

  components: {
  },
}
</script>