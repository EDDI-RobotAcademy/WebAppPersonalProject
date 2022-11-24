<template>
  <v-container>
    <div>
      <top-menu-form/>
      <toolbar-form/>
    </div>
    <div align="center">
      <h2>게시물 수정</h2>
      <sell-diablo-modify-form v-if="sellDiabloBoard" :sellDiabloBoard="sellDiabloBoard" @submit="onSubmit"/>
      <p v-else>Loading .........</p>
    </div>
  </v-container>
</template>

<script>
import SellDiabloModifyForm from "@/components/boards/sellBoard/diablo/SellDiabloModifyForm";
import {mapActions, mapState} from "vuex";
import TopMenuForm from "@/components/topMenubar/TopMenuForm";
import ToolbarForm from "@/components/toolbar/ToolbarForm";

export default {
  name: "SellDiabloModifyView",
  components: {
    SellDiabloModifyForm,
    TopMenuForm,
    ToolbarForm
  },
  props: {
    sellDiabloNo: {
      type: String,
      required: true,
    }
  },
  computed: {
    ...mapState(['sellDiabloBoard'])
  },
  methods: {
    ...mapActions([
      'requestSellDiabloFromSpring',
      'requestSellDiabloModifyToSpring'
    ]),
    async onSubmit (payload) {
      const { title, content, writer, regDate } = payload
      const sellDiabloNo = this.sellDiabloNo
      await this.requestSellDiabloModifyToSpring({ sellDiabloNo, title, content, writer, regDate })
      await this.$router.push({
        name: 'SellDiabloReadView',
        params: { sellDiabloNo: this.sellDiabloNo }
      })
    }
  },
  created () {
    this.requestSellDiabloFromSpring(this.sellDiabloNo)
  }
}
</script>

<style scoped>

</style>