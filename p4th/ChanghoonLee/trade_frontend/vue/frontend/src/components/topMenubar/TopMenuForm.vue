<template>
  <nav>
    <v-toolbar flat app>
      <v-toolbar-title>
        <router-link to="/">
          <v-img :src="require('@/assets/img/로고.png')" :height=60 contain></v-img>
        </router-link>
      </v-toolbar-title>

      <v-spacer></v-spacer>
      <router-link to="/">
        <v-btn class="grey white--text" rounded depressed small>
          회원가입
        </v-btn>
      </router-link>&nbsp;
      <router-link to="/">
        <v-btn class="grey white--text" rounded depressed small>
          로그인
        </v-btn>
      </router-link>
    </v-toolbar>
  </nav>
</template>

<script>
export default {
  name: "TopMenuForm"
}
</script>

<style scoped>

a {
  text-decoration: none;
}

</style>