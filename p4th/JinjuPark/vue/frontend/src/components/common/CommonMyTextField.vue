<template>
  <v-card width="250px" max-height="150px" class="mb-5" v-show="this.$store.state.userLoginCheck">
    <v-card-subtitle> {{ loginUser[0].nickname }}님의 마이 페이지</v-card-subtitle>

    <!--    [ { "id": 1, "email": "wow@gmail.com", "username": "wow", "nickname": "와우굿" } ] -->

    <v-card-text class="text--primary">
      <div> {{loginUser[0].username}} 회원님, 안녕하세요</div>
    </v-card-text>

    <v-card-actions>
      <v-btn
          color="grey"
          text
          @click="myPage">
        <v-icon>mdi-account-outline</v-icon>
        My
      </v-btn>
      <v-btn
          color="grey"
          text
          @click="MySaveVideo">
        <v-icon>mdi-heart-outline</v-icon>
        Save
      </v-btn>
    </v-card-actions>
  </v-card>
</template>

<script>
import {mapActions, mapState} from "vuex";

export default {
  name: "CommonMyTextField",
  computed: {
    ...mapState([
      'userLoginCheck',
        'loginUser'
    ])
  },
  mounted(){
    if(window.localStorage.getItem('userInfo') != null) {
      this.$store.commit('USER_LOGIN_CHECK', true)
      let userToken = window.localStorage.getItem('userInfo')
      this.requestLoginUserFromSpring(userToken)
      }
  },
  methods:{
    ...mapActions([
      'requestLoginUserFromSpring'
    ]),
    myPage(){
      this.$router.push({ name: 'MyPageView'})
      },
    MySaveVideo(){
      this.$router.push({ name: 'MySaveVideoView'})
    }
  },

}
</script>

<style scoped>

</style>