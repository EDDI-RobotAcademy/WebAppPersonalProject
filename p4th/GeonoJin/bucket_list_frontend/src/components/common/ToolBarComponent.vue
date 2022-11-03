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
          <v-layout style="height: 20px">
            <text-field-component
                :placeholderText=placeholderText
                @update="toValue"
            />
          </v-layout>
          <button-component
              :btnValues=btnValues
          />
        </template>
      </v-toolbar-items>
    </v-toolbar>
  </v-layout>
</template>

<script>
import LogoComponent from "@/components/common/LogoComponent";
import ButtonComponent from "@/components/common/account/ButtonComponent";
import TextFieldComponent from "@/components/common/account/TextFieldComponent";

export default {
  name: "ToolBarComponent",
  components: {
    ButtonComponent,
    LogoComponent,
    TextFieldComponent,
  },
  data() {
    return {
      btnValues: [
        {name: '로그인', route: '/signIn'},
        {name: '회원가입', route: '/signUp'},
      ],
      searchValue:'',
      placeholderText: "검색"
    }
  },
  methods:{
    toValue(textFieldValue){
      this.searchValue = textFieldValue
    }
  }
}
</script>

<style scoped>
.logo {
  width: 100px;
}


</style>