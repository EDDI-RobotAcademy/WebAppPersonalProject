<template>
  <v-container>
    <div>
      <top-menu-form/>
      <toolbar-form/>
    </div>
    <div align="center">
      <h2>게시물 작성</h2>
      <buy-diablo-register-form @submit="onSubmit"/>
    </div>
  </v-container>
</template>

<script>
import BuyDiabloRegisterForm from "@/components/boards/buyBoard/diablo/BuyDiabloRegisterForm";
import {mapActions} from "vuex";
import TopMenuForm from "@/components/topMenubar/TopMenuForm";
import ToolbarForm from "@/components/toolbar/ToolbarForm";
export default {
  name: "BuyDiabloRegisterView",
  components: {
    BuyDiabloRegisterForm,
    TopMenuForm,
    ToolbarForm
  },
  methods: {
    ...mapActions([
      'requestCreateBuyDiabloContentsToSpring'
    ]),
    async onSubmit (payload) {
      await this.requestCreateBuyDiabloContentsToSpring(payload)
      await this.$router.push({
        name: 'BuyDiabloListView'
      })
    }
  }
}
</script>

<style scoped>

</style>