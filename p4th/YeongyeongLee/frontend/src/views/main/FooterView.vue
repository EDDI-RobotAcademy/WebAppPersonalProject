

<template>
  <v-footer
      dark
      padless
  >
    <v-card
        flat
        tile
        class="amber lighten-4 black--text text-center"
    >
      <v-card-text>
        <v-btn :href="`https://ko-kr.facebook.com`" target="_blank"
            v-for="icon in icons"
            :key="icon"
            class="mx-5 white--text"
            icon
        >
          <v-icon size="24px">
            {{ icon }}
          </v-icon>
        </v-btn>
      </v-card-text>

      <v-card-text class="white--text pt-0">
        Hi! Have you all been on a trip at least once?
        This site is a place to share and remember travel information.
        Record and share your memories:D
        You can read all posts, but you must register as a member to write posts.
        Click the icon above if you have any questions <p></p>

        Tel : 000-000-0000 <p></p>
        Address : Republic of Korea Seoul


      </v-card-text>

      <v-divider></v-divider>

      <v-card-text class="white--text">
        {{ new Date().getFullYear() }} — <strong>
        triple </strong>
      </v-card-text>
    </v-card>
  </v-footer>
</template>


<script>
export default {
  name: "FooterView",
  data() {
    return {
      icons: [
        'mdi-facebook',
        'mdi-twitter',
        'mdi-instagram',
      ]
    }

  }
}

</script>

<style scoped>

</style>