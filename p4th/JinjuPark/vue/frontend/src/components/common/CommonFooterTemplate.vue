<template>
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
      <v-btn
          v-for="icon in icons"
          :key="icon"
          class="mx-4 white--text"
          icon
      >
        <v-icon size="24px">
        {{ icon }}
        </v-icon>
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
</template>

<script>
export default {
  name: "CommonFooterTemplate",
  data() {
    return{
      icons: [
        'mdi-home',
        'mdi-account',
        'mdi-youtube',
        'mdi-heart',
      ],
    }
  },
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
