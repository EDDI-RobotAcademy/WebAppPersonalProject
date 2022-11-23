<template>
  <v-layout>
    <div v-for="(btnValue, i) in btnValues" :key="i"
    >
      <template>
        <div v-if="btnValue.iconName == 'mdi-account-circle-outline'">
          <v-menu offset-y>
            <template v-slot:activator="{ on, attrs }">
              <v-btn color="white" rounded elevation="0" :to="btnValue.route"
                     v-bind="attrs"
                     v-on="on">
                <div>
                  {{ btnValue.name }}
                  <v-icon>{{ btnValue.iconName }}</v-icon>
                </div>
              </v-btn>
            </template>
            <template>
              <v-list width="180px" height="180px">
                <v-list-item>
                  <v-list-item-title>
                    <v-btn  color="white" rounded elevation="0" :to="{name: 'MyPageView', params: {nickName: nickName}}">
                      <h4>{{ nickName }}</h4>
                      <v-icon style="margin-bottom: 5px">mdi-home</v-icon>
                    </v-btn>
                  </v-list-item-title>
                </v-list-item>
                <hr color="black">
                <v-list-item>
                  <v-list-item-title align="center">
                    <div style="margin-bottom: 10px; margin-top: 5px"
                    >
                      <v-btn color="white" rounded elevation="0" :to="{name: 'MyBucketListView', params: {userNickname: nickName}}">
                        <h4>My Bucket</h4>
                      </v-btn>
                    </div>
                    <div>
                      <v-btn color="white" rounded elevation="0"
                             @click="signOut"
                      >
                        <h4>로그아웃</h4>
                      </v-btn>
                    </div>
                  </v-list-item-title>
                </v-list-item>
              </v-list>
            </template>
          </v-menu>
        </div>

        <div v-else-if="btnValue.iconName == 'mdi-menu'">
          <v-menu offset-y>
            <template v-slot:activator="{ on, attrs }">
              <v-btn color="white" rounded elevation="0" :to="btnValue.route"
                     v-bind="attrs"
                     v-on="on">
                <div>
                  {{ btnValue.name }}
                  <v-icon>{{ btnValue.iconName }}</v-icon>
                </div>
              </v-btn>
            </template>
            <template>
              <v-list width="auto" height="auto">
                <v-list-item>
                  <v-list-item-title align="center">
                    <div style="margin-bottom: 10px; margin-top: 5px">
                      <v-btn color="white" rounded elevation="0" to="/signIn">
                        <h4>로그인</h4>
                      </v-btn>
                    </div>
                    <div>
                      <v-btn color="white" rounded elevation="0" to="/signUp">
                        <h4>회원가입</h4>
                      </v-btn>
                    </div>
                  </v-list-item-title>
                </v-list-item>
              </v-list>
            </template>
          </v-menu>
        </div>

        <div v-else>
          <v-btn color="white" rounded elevation="0" :to="btnValue.route">
            <div>
              {{ btnValue.name }}
              <v-icon>{{ btnValue.iconName }}</v-icon>
            </div>
          </v-btn>
        </div>


      </template>
    </div>
  </v-layout>
</template>
<script>


export default {
  name: "ButtonComponent",
  components: {},
  props: {
    btnValues: {
      type: Array
    },
    nickName: {
      type: String
    }
  },
  methods: {
    signOut() {
      if (localStorage.getItem('userInfo') == null) {
        alert("이미 로그아웃 되었습니다.");
        this.$router.push({name: 'HomeView'})
      } else {
        localStorage.removeItem("userInfo");
        alert("로그아웃 되었습니다.")
        history.go(0)
      }
    }
  },
}
</script>

<style scoped>

</style>