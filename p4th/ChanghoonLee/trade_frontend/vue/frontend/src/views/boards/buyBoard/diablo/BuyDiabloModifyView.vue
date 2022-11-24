<template>
  <v-container>
    <div>
      <top-menu-form/>
      <toolbar-form/>
    </div>
    <div align="center">
      <h2>게시물 수정</h2>
      <buy-diablo-modify-form v-if="buyDiabloBoard" :buyDiabloBoard="buyDiabloBoard" @submit="onSubmit"/>
      <p v-else>Loading .........</p>
    </div>
  </v-container>
</template>

<script>
import BuyDiabloModifyForm from "@/components/boards/buyBoard/diablo/BuyDiabloModifyForm";
import {mapActions, mapState} from "vuex";
import TopMenuForm from "@/components/topMenubar/TopMenuForm";
import ToolbarForm from "@/components/toolbar/ToolbarForm";

export default {
  name: "BuyDiabloModifyView",
  components: {
    BuyDiabloModifyForm,
    TopMenuForm,
    ToolbarForm
  },
  props: {
    buyDiabloNo: {
      type: String,
      required: true,
    }
  },
  computed: {
    ...mapState(['buyDiabloBoard'])
  },
  methods: {
    ...mapActions([
      'requestBuyDiabloFromSpring',
      'requestBuyDiabloModifyToSpring'
    ]),
    async onSubmit (payload) {
      const { title, content, writer, regDate } = payload
      const buyDiabloNo = this.buyDiabloNo
      await this.requestBuyDiabloModifyToSpring({ buyDiabloNo, title, content, writer, regDate })
      await this.$router.push({
        name: 'BuyDiabloReadView',
        params: { buyDiabloNo: this.buyDiabloNo }
      })
    }
  },
  created () {
    this.requestBuyDiabloFromSpring(this.buyDiabloNo)
  }
}
</script>

<style scoped>

</style>