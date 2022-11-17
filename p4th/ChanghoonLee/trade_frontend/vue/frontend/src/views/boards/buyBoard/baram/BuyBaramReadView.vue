<template>
  <v-container>
    <div>
      <top-menu-form/>
      <toolbar-form/>
    </div>
    <div align="center">
      <div>
        <buy-baram-read v-if="buyBaramBoard" :buyBaramBoard="buyBaramBoard"/>
        <p v-else>Loading .......</p>
      </div>
      <div v-if="this.$store.state.loginEmail == this.buyBaramBoard.writer">
        <router-link :to="{ name: 'BuyBaramModifyView', params: { buyBaramNo } }">
          <v-btn class="grey white--text" rounded depressed small>게시물 수정</v-btn>&nbsp;
        </router-link>
        <v-btn class="grey white--text" rounded depressed small @click="onDelete">삭제</v-btn>&nbsp;
        <router-link :to="{ name: 'BuyBaramListView' }">
          <v-btn class="grey white--text" rounded depressed small>돌아가기</v-btn>
        </router-link>
      </div>
      <div v-else>
        <router-link :to="{ name: 'BuyBaramListView' }">
          <v-btn class="grey white--text" rounded depressed small>돌아가기</v-btn>
        </router-link>
      </div>
    </div>
  </v-container>
</template>

<script>
import {mapActions, mapState} from "vuex";
import BuyBaramRead from "@/components/boards/buyBoard/baram/BuyBaramRead";
import TopMenuForm from "@/components/topMenubar/TopMenuForm";
import ToolbarForm from "@/components/toolbar/ToolbarForm";

export default {
  name: "BuyBaramReadView",
  components: {
    BuyBaramRead,
    TopMenuForm,
    ToolbarForm
  },
  props: {
    buyBaramNo: {
      type: String,
      required: true
    },
    buyBaramBoard: {
      type: Object,
      required: true,
    }
  },
  computed: {
    ...mapState(['buyBaramBoard'])
  },
  methods: {
    ...mapActions([
      'requestBuyBaramFromSpring',
      'requestDeleteBuyBaramToSpring',
    ]),
    async onDelete () {
      await this.requestDeleteBuyBaramToSpring(this.buyBaramNo);
      await this.$router.push({ name: 'BuyBaramListView' })
    }
  },
  created() {
    this.requestBuyBaramFromSpring(this.buyBaramNo)
  }
}
</script>

<style scoped>

a {
  text-decoration: none;
}

</style>