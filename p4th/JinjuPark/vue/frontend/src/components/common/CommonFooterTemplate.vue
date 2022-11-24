<template>
  <v-container>
  <v-footer
      color="blue lighten-1"
      padless
      class ="mt-15"
      height="120px"
  >
    <v-row
        justify="center"
        no-gutters
    >
      <v-btn class="mx-4 white--text" icon @click="goHome">
        <v-icon size="24px">mdi-home</v-icon>
      </v-btn>

      <v-btn class="mx-4 white--text" icon @click="goMypage">
        <v-icon size="24px">mdi-account</v-icon>
      </v-btn>

      <v-btn class="mx-4 white--text" icon @click="goBoard">
        <v-icon size="24px">mdi-calendar-check-outline</v-icon>
      </v-btn>

      <v-btn class="mx-4 white--text" icon @click="goMyVideo">
        <v-icon size="24px">mdi-heart</v-icon>
      </v-btn>

      <v-col
          class="blue lighten-1 py-4 text-center white--text"
          cols="12"
      >
        Copyright
        {{ new Date().getFullYear() }} <strong>HOMETWANG</strong> All rights reserved.
      </v-col>
    </v-row>
  </v-footer>
  </v-container>
</template>

<script>
import {mapState} from "vuex";

export default {
  name: "CommonFooterTemplate",
  computed: {
    ...mapState([
      'isAuthenticated'
    ])
  },
  methods:{
    goHome(){
      this.$router.push({name:'HomeMainView'})
    },
    goMypage(){
      if(this.isAuthenticated){
        this.$router.push({name:'MyPageView'})
      } else {
        alert("로그인이 필요합니다.")
      }
    },
    goBoard(){
      this.$router.push({name:'AllBoardListView'})
    },
    goMyVideo(){
      if(this.isAuthenticated){
        this.$router.push({name:'MySaveVideoView'})
      } else {
        alert("로그인이 필요합니다.")
      }
    }
  }
}
</script>

<style scoped>

</style>
<!--
1. 객체 바깥 여백두기 ->  class ="상하좌우 설정"
(1) 위아래 여백두기 : " (m: 마진) + (t: (top, 위) 또는 b(bottom,아래)) - 숫자 "   ex) class = "mt-2" 또는 class = "mb-2"
(2) 좌우 여백두기: " (m: 마진) + (l: (left, 좌) 또는 r(right,아래)) - 숫자 "      ex) class = "ml-2" 또는  class = "mr-2"
2. 객체 안쪽 여백두기 -> class ="상하좌우 설정"
(1) 위아래 안쪽 여백두기 : " (p: 패딩) + (t: (top, 위) 또는 b(bottom,아래)) - 숫자 "  ex) class = "pt-2" 또는 class = "pb-2"
(2) 좌우 여백두기: " (p: 패딩) + (l: (left, 좌) 또는 r(right,아래)) - 숫자 "         ex) class = "pl-2" 또는  class = "pr-2"
3. 객체 밖/안 모두 여백두기 설정도 있음
-->
