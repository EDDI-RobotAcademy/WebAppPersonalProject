<template>
  <v-container>
    <div>
      <top-menu-form/>
      <toolbar-form/>
    </div>
    <div>

    </div>
    <div id="buy-diablo-board">
      <h1>디아블로 아이템 구매게시판</h1>
      <br/>
      <buy-diablo-list :buyDiabloBoards="buyDiabloBoards"/>
    </div>
    <br/>
    <div style="float: right">
      <router-link :to="{ name: 'BuyDiabloRegisterView' }">
        <v-btn class="grey white--text" rounded depressed small
        v-if="isLogin == false" @click.prevent="registerAccess">
          게시물 작성
        </v-btn>
        <v-btn class="grey white--text" rounded depressed small v-else>
          게시물 작성
        </v-btn>
      </router-link>
    </div>
  </v-container>
</template>

<script>
import { mapState, mapActions } from "vuex";
import BuyDiabloList from "@/components/boards/buyBoard/diablo/BuyDiabloList";
import TopMenuForm from "@/components/topMenubar/TopMenuForm";
import ToolbarForm from "@/components/toolbar/ToolbarForm";

export default {
  name: "BuyDiabloListView",
  components: {
    BuyDiabloList,
    TopMenuForm,
    ToolbarForm
  },
  computed: {
    ...mapState([
      'buyDiabloBoards'
    ]),
  },
  data() {
    return {
      isLogin: false
    }
  },
  mounted() {
    this.requestBuyDiabloListFromSpring()
    if (this.$store.state.isAuthenticated != false) {
      this.isLogin = true
    } else {
      this.isLogin = false
    }
  },
  methods: {
    registerAccess() {
      if(this.isLogin == false) {
        alert("로그인이 필요한 기능입니다.")
        this.$router.push("/sign-in")
      }
    },
    ...mapActions([
      'requestBuyDiabloListFromSpring'
    ])
  }
}
</script>

<style scoped>
a {
  text-decoration: none;
}
</style>