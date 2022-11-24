<template>
  <v-container>
    <div>
      <top-menu-form/>
      <toolbar-form/>
    </div>
    <div>

    </div>
    <div id="sell-baram-board">
      <h1>바람의나라 아이템 판매게시판</h1>
      <br/>
      <sell-baram-list :sellBaramBoards="sellBaramBoards"/>
    </div>
    <br/>
    <div style="float: right">
      <router-link :to="{ name: 'SellBaramRegisterView' }">
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
import SellBaramList from "@/components/boards/sellBoard/baram/SellBaramList";
import TopMenuForm from "@/components/topMenubar/TopMenuForm";
import ToolbarForm from "@/components/toolbar/ToolbarForm";

export default {
  name: "SellBaramListView",
  components: {
    SellBaramList,
    TopMenuForm,
    ToolbarForm
  },
  computed: {
    ...mapState([
      'sellBaramBoards'
    ]),
  },
  data() {
    return {
      isLogin: false
    }
  },
  mounted() {
    this.requestSellBaramListFromSpring()
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
      'requestSellBaramListFromSpring'
    ])
  }
}
</script>

<style scoped>
a {
  text-decoration: none;
}
</style>