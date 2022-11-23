<template>
  <footer>
    <v-card flat tile class="basil lighten-4 basil--text text-center">
      <v-card-text>
        <v-btn v-for="icon in icons" :key="icon" class="mx-4 basil--text" icon>
          <v-icon size="24px">
            {{ icon }}
          </v-icon>
        </v-btn>
      </v-card-text>

      <v-card-text class="basil--text pt-0">
        상호: LOOKLEND  대표: 김소연  주소 : 서울특별시
        <br/>
        대표전화: 02-1234-5678 이메일: looklend@looklend.com
      </v-card-text>

      <v-divider></v-divider>

      <v-card-text class="basil--text">
        <strong>LOOKLEND</strong>
      </v-card-text>
    </v-card>
  </footer>
</template>

<script>
export default {
  name: "FooterForm",
  data() {
    return{
      icons: [
        'mdi-facebook',
        'mdi-twitter',
        'mdi-linkedin',
        'mdi-instagram',
      ]
    }
  }
}
</script>

<style scoped>
footer {
  margin-top: 100px;
  font-size: 10px;
}
</style>