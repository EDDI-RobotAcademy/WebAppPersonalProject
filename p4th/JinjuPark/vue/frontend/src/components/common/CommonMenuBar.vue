<template>
  <v-toolbar color="blue lighten-1" elevation="0" rounded dense>
    <v-toolbar-items v-if="!isMobile()">
      <v-btn
          class="blue lighten-1 white--text"
          elevation="0"
          v-for="link in links" :key="link.text" :to="link.route">
          <v-icon>{{link.icon}}</v-icon>
          <span style="width: 6px" v-if="link.text"></span>
          {{ link.text }}
      </v-btn>
    </v-toolbar-items>

    <v-toolbar-items v-else>>
      <v-btn
          class="blue lighten-1 white--text"
          elevation="0"
          v-for="link in links" :key="link.text" :to="link.route">
        <v-icon>{{link.icon}}</v-icon>
      </v-btn>
    </v-toolbar-items>
  </v-toolbar>
</template>

<script>
import commonMixins from "@/mixins/CommonMixins";

export default {
  name: "CommonMenuBar",
  mixins: [commonMixins],
  props: {
  },
  data(){
    return{
      links: [
          //home에 배너+ 운동영상
        // { icon: 'mdi-home', text: 'Home', name: 'home', route: '/' },
        { icon: 'mdi-headphones', text: '홈트영상', name: 'home', route: '/home' },
        { icon: 'mdi-calendar-check-outline', text: '운동일기', name: 'home', route: '/home' },
        { icon: 'mdi-comment-processing-outline', text: '자유게시판', name: 'home', route: '/home' },
        { icon: 'mdi-comment-question-outline', text: '질문게시판', name: 'home', route: '/home' },
      ],
    }
  }
}
</script>

<style scoped>

</style>