<template>
  <v-container>
    <div id="home">
      <nav>
        <router-link to="/vuetify-taste">Vuetify 예시들</router-link> |
        <router-link to="/sign-up">회원 가입</router-link> |
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
