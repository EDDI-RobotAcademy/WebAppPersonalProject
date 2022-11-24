<template>
  <v-container>
    <div>
      <top-menu-form/>
      <toolbar-form/>
    </div>
    <div align="center">
      <h2>게시물 작성</h2>
      <sell-diablo-register-form @submit="onSubmit"/>
    </div>
  </v-container>
</template>

<script>
import SellDiabloRegisterForm from "@/components/boards/sellBoard/diablo/SellDiabloRegisterForm";
import {mapActions} from "vuex";
import TopMenuForm from "@/components/topMenubar/TopMenuForm";
import ToolbarForm from "@/components/toolbar/ToolbarForm";
export default {
  name: "SellDiabloRegisterView",
  components: {
    SellDiabloRegisterForm,
    TopMenuForm,
    ToolbarForm
  },
  methods: {
    ...mapActions([
      'requestCreateSellDiabloContentsToSpring'
    ]),
    async onSubmit (payload) {
      await this.requestCreateSellDiabloContentsToSpring(payload)
      await this.$router.push({
        name: 'SellDiabloListView'
      })
    }
  }
}
</script>

<style scoped>

</style>