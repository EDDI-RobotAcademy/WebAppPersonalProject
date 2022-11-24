<template>
  <v-container>
    <div>
      <top-menu-form/>
      <toolbar-form/>
    </div>
    <div>

    </div>
    <div id="sell-diablo-board">
      <h1>바람의나라 아이템 판매게시판</h1>
      <br/>
      <sell-diablo-list :sellDiabloBoards="sellDiabloBoards"/>
    </div>
    <br/>
    <div style="float: right">
      <router-link :to="{ name: 'SellDiabloRegisterView' }">
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
import SellDiabloList from "@/components/boards/sellBoard/diablo/SellDiabloList";
import TopMenuForm from "@/components/topMenubar/TopMenuForm";
import ToolbarForm from "@/components/toolbar/ToolbarForm";

export default {
  name: "SellDiabloListView",
  components: {
    SellDiabloList,
    TopMenuForm,
    ToolbarForm
  },
  computed: {
    ...mapState([
      'sellDiabloBoards'
    ]),
  },
  data() {
    return {
      isLogin: false
    }
  },
  mounted() {
    this.requestSellDiabloListFromSpring()
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
      'requestSellDiabloListFromSpring'
    ])
  }
}
</script>

<style scoped>
a {
  text-decoration: none;
}
</style>