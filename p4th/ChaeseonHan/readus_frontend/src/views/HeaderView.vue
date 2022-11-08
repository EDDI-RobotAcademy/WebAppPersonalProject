<template>
  <div style="background-color: #356859" >
    <v-container>
      <app-bar-component/>
    </v-container>
  </div>
</template>

<script>
import AppBarComponent from "@/components/Header/AppBarComponent";
import {mapActions} from "vuex";
export default {
  name: "HeaderView",
  components: {AppBarComponent,},
  data() {
    return {
      nickName: "방문자",
      isLogin: false,
    }
  },

  created() {
    if(this.$cookies.isKey("user")) {
      let userToken = this.$cookies.get("user")
      this.requestLoggedInUserProfileToSpring({ userToken })
    }
  },

  methods: {
    ...mapActions(['requestLoggedInUserProfileToSpring'])
  }

}
</script>

<style scoped>

</style>