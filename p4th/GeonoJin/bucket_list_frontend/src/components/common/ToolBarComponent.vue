<template>
  <v-container>
    <v-layout justify-center>
      <v-toolbar dense flat>
        <v-toolbar-title>
          <a href="/">
            <logo-component
                class="logo"
            />
          </a>
        </v-toolbar-title>
        <v-spacer></v-spacer>
        <v-toolbar-items class="btnItems"
        >
          <template>
            <div>
              <div v-if="loginStateCheckVal">
                <button-component
                    :btnValues="loginBtnValues"
                    :nickName="nicknameValue"
                />
              </div>
              <div v-else>
                <button-component :btnValues="btnValues"
                />
              </div>
            </div>
          </template>
        </v-toolbar-items>
      </v-toolbar>
    </v-layout>
  </v-container>

</template>

<script>
import LogoComponent from "@/components/common/LogoComponent";
import ButtonComponent from "@/components/common/ButtonComponent";
import {mapState} from "vuex";

export default {
  name: "ToolBarComponent",
  components: {
    ButtonComponent,
    LogoComponent,
  },
  props: {
    nicknameValue: {
      type: String
    }
  },
  data() {
    return {
      btnValues: [
        {iconName: 'mdi-magnify'},
        {name: '로그인', route: '/signIn'},
        {name: '회원가입', route: '/signUp'},
      ],
      loginBtnValues: [
        {iconName: 'mdi-magnify', route: '/search'},
        {iconName: 'mdi-account-circle-outline'},
      ],
      loginStateCheckVal: false
    }
  },
  mounted() {
    this.loginStateCheckVal = this.$store.state.currentLoginUserCheck
    console.log("로그인 상태: " + this.loginStateCheckVal)
  },
  methods: {
    ...mapState([
      'isAuthenticated',
      'currentLoginUserCheck'
    ]),
  },

}
</script>

<style scoped>
.logo {
  width: 100px;
}


</style>