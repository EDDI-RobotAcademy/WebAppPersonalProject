<template>
  <div>
    <v-layout justify-center>
      <v-dialog v-model="loginDialog" persistent max-width="500px">
        <template v-slot:activator="{ on }">
          <v-spacer></v-spacer>
          <v-btn color="primary" dark v-on="on">로그인</v-btn>
        </template>
        <v-card>
          <v-card-title class="headline">
            <span>
              로그인
            </span>
          </v-card-title>

          <v-card-text>
            <v-text-field label="Email" v-model="email" required></v-text-field>
          </v-card-text>
          <v-card-text>
            <v-text-field label="Password" v-model="password" required></v-text-field>
          </v-card-text>
          <v-card-actions>
            <v-spacer></v-spacer>
            <v-btn color="teal darken-1" text @click="btnClick">
              취소
            </v-btn>
            <v-btn color="teal darken-1" text @click="btnClick">
              로그인
            </v-btn>
          </v-card-actions>
        </v-card>
      </v-dialog>
    </v-layout>



  </div>
</template>

<script>
export default {
  name: "MemberButtonTestView",
  data(){
    return{

      email: '',
      password: '',
      loginDialog: false,
      dialog: false,
    }
  },
  methods: {
    btnClick () {
      alert('Vuetify 테스트 버튼')
    }
  }


}



</script>

<style scoped>

</style>