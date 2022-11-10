<template>
  <v-app>
    <header-view/>
    <v-main>
      <v-container id="scroll-target" class="scroll-y">
        <router-view/>
      </v-container>
      <v-btn
          v-scroll="onScroll"
          v-show="fab"
          fab
          dark
          fixed
          bottom
          right
          color="#356859"
          @click="toTop"
      >
        <v-icon color="white">mdi-arrow-up</v-icon>
      </v-btn>
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
  data() {
    return {
      fab: false
    }
  },
  methods: {
    onScroll (e) {
      if (typeof window === 'undefined') return
      const top = window.pageYOffset ||   e.target.scrollTop || 0
      this.fab = top > 20
    },
    toTop () {
      this.$vuetify.goTo(0)
    }
  }
};
</script>
