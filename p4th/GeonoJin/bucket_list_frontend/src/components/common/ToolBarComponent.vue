<template>
  <v-layout justify-center>
    <v-toolbar
        dense
        flat
    >
      <v-toolbar-title>
        <a href="/">
          <logo-component
              class="logo"
          />
        </a>
      </v-toolbar-title>
      <v-spacer></v-spacer>
      <v-toolbar-items class="btnItems"
                       v-for="(btnName, i) in btnNames" :key="i" :to="btnName.route"
      >
        <template>
          <div class="text-xs-center"
               v-if="btnName.name == '검색'"
          >
            <v-menu
                :close-on-content-click="false"
                :nudge-width="200"
                offset-y
            >
              <template v-slot:activator="{ on }">
                <v-btn
                    color="white"
                    rounded-xl
                    elevation="0"
                    v-on="on"
                >
                  {{ btnName.name }}
                  <v-icon>mdi-magnify</v-icon>
                </v-btn>
              </template>

              <v-card>
                <v-card-actions>
                  <v-text-field v-model="value" placeholder="홈페이지 전체 검색"></v-text-field>
                  <v-btn
                      color="white"
                      rounded-xl
                      elevation="0"
                  >
                    <v-icon>mdi-magnify</v-icon>
                  </v-btn>
                </v-card-actions>
              </v-card>
            </v-menu>
          </div>
          <div v-else-if="btnName.name == '로그인'">
            <v-dialog v-model="loginDialog" persistent max-width="600px">
              <template v-slot:activator="{ on }">
                <v-btn
                    color="white"
                    rounded-xl
                    elevation="0"
                    v-on="on"
                >
                  {{ btnName.name }}
                </v-btn>
              </template>

              <v-card>
                <v-card-title class="signInTitle">
                  <span>
                    {{ btnName.name }}
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
                  <v-btn color="teal darken-1" text>
                    로그인
                  </v-btn>
                </v-card-actions>
              </v-card>
            </v-dialog>
          </div>
          <div v-else>
            <v-btn
                color="white"
                rounded-xl
                elevation="0"
            >
              {{ btnName.name }}
            </v-btn>
          </div>
        </template>
      </v-toolbar-items>
    </v-toolbar>
  </v-layout>
</template>

<script>
import LogoComponent from "@/components/common/LogoComponent";

export default {
  name: "ToolBarComponent",
  components: {
    LogoComponent,
  },
  data() {
    return {
      btnNames: [
        {name: '검색'},
        {name: '로그인', route: '/signIn'},
        {name: '회원가입', route: '/signUp'},
      ],
      value: "",
      email: '',
      password: '',
      loginDialog: false
    }
  },
  methods: {
    btnClick() {
      this.$router.push({name: 'HomeView'}).catch(()=>{})
    }
  }
}
</script>

<style scoped>
.logo {
  width: 100px;
}


</style>