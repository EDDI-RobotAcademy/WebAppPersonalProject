<template>
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
          <button-component
              :btnValues="btnValues"
          />
        </template>
      </v-toolbar-items>
    </v-toolbar>
  </v-layout>
</template>

<script>
import LogoComponent from "@/components/common/LogoComponent";
import ButtonComponent from "@/components/common/account/ButtonComponent";

export default {
  name: "ToolBarComponent",
  components: {
    ButtonComponent,
    LogoComponent,
  },
  data() {
    return {
      btnValues: [
        {name: '검색', iconName: 'mdi-magnify'},
        {name: '로그인', route: '/signIn'},
        {name: '회원가입', route: '/signUp'},
      ],
    }
  },
  methods: {
    btnClick() {
      this.$router.push({name: 'HomeView'}).catch(() => {
      })
    }
  }
}
</script>

<style scoped>
.logo {
  width: 100px;
}


</style>