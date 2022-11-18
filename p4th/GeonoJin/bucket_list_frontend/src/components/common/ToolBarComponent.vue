<template>
  <v-container>
    <v-layout justify-center>
      <v-toolbar dense flat>
        <v-toolbar-title>
          <a href="/home">
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
import {mapActions, mapState} from "vuex";

export default {
  name: "ToolBarComponent",
  components: {
    ButtonComponent,
    LogoComponent,
  },
  data() {
    return {
      btnValues: [
        {iconName: 'mdi-magnify', route: '/search'},
        {iconName: 'mdi-menu'},
      ],
      loginBtnValues: [
        {iconName: 'mdi-magnify', route: '/search'},
        {iconName: 'mdi-account-circle-outline'},
      ],
      loginStateCheckVal: false,
      nicknameValue: ''
    }
  },
  async mounted() {

    let replacedUserValue
    const currentUserValue = localStorage.getItem('userInfo');

    if (currentUserValue != null) {
      replacedUserValue = currentUserValue.replaceAll("\"", "")
      await this.requestCurrentUserNickNameFromSpring({replacedUserValue});
      this.nicknameValue = this.$store.state.currentUserNickname

    } else {
      this.$store.state.currentLoginUserCheck = false
    }

    if (localStorage.getItem('userInfo') != null) {
      this.loginStateCheckVal = true
    }
  },
  methods: {
    ...mapState([
      'currentLoginUserCheck',
      'currentUserNickname'
    ]),
    ...mapActions([
      'requestCurrentUserNickNameFromSpring'
    ]),
  },


}
</script>

<style scoped>
.logo {
  width: 100px;
}


</style>