<template>
  <v-container>
    <div>
      <top-menu-form/>
      <toolbar-form/>
    </div>
    <div align="center">
      <h2>게시물 수정</h2>
      <buy-baram-modify-form v-if="buyBaramBoard" :buyBaramBoard="buyBaramBoard" @submit="onSubmit"/>
      <p v-else>Loading .........</p>
    </div>
  </v-container>
</template>

<script>
import BuyBaramModifyForm from "@/components/boards/buyBoard/baram/BuyBaramModifyForm";
import {mapActions, mapState} from "vuex";
import TopMenuForm from "@/components/topMenubar/TopMenuForm";
import ToolbarForm from "@/components/toolbar/ToolbarForm";

export default {
  name: "BuyBaramModifyView",
  components: {
    BuyBaramModifyForm,
    TopMenuForm,
    ToolbarForm
  },
  props: {
    buyBaramNo: {
      type: String,
      required: true,
    }
  },
  computed: {
    ...mapState(['buyBaramBoard'])
  },
  methods: {
    ...mapActions([
      'requestBuyBaramFromSpring',
      'requestBuyBaramModifyToSpring'
    ]),
    async onSubmit (payload) {
      const { title, content, writer, regDate } = payload
      const buyBaramNo = this.buyBaramNo
      await this.requestBuyBaramModifyToSpring({ buyBaramNo, title, content, writer, regDate })
      await this.$router.push({
        name: 'BuyBaramReadView',
        params: { buyBaramNo: this.buyBaramNo }
      })
    }
  },
  created () {
    this.requestBuyBaramFromSpring(this.buyBaramNo)
  }
}
</script>

<style scoped>

</style>