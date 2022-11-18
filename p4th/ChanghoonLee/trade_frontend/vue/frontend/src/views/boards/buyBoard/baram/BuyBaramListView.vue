<template>
  <v-container>
    <div>
      <top-menu-form/>
      <toolbar-form/>
    </div>
    <div>

    </div>
    <div id="buy-baram-board">
      <h1>바람의나라 아이템 구매게시판</h1>
      <br/>
      <buy-baram-list :buyBaramBoards="buyBaramBoards"/>
    </div>
    <br/>
    <div style="float: right">
      <router-link :to="{ name: 'BuyBaramRegisterView' }">
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
import BuyBaramList from "@/components/boards/buyBoard/baram/BuyBaramList";
import TopMenuForm from "@/components/topMenubar/TopMenuForm";
import ToolbarForm from "@/components/toolbar/ToolbarForm";

export default {
  name: "BuyBaramListView",
  components: {
    BuyBaramList,
    TopMenuForm,
    ToolbarForm
  },
  computed: {
    ...mapState([
      'buyBaramBoards'
    ]),
  },
  data() {
    return {
      isLogin: false
    }
  },
  mounted() {
    this.requestBuyBaramListFromSpring()
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
      'requestBuyBaramListFromSpring'
    ])
  }
}
</script>

<style scoped>
a {
  text-decoration: none;
}
</style>