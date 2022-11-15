<template>
  <v-container>
    <div>
      <top-menu-form/>
      <toolbar-form/>
    </div>
    <div align="center">
      <h2>게시물 작성</h2>
      <buy-baram-register-form @submit="onSubmit"/>
    </div>
  </v-container>
</template>

<script>
import BuyBaramRegisterForm from "@/components/boards/buyBoard/baram/BuyBaramRegisterForm";
import {mapActions} from "vuex";
import TopMenuForm from "@/components/topMenubar/TopMenuForm";
import ToolbarForm from "@/components/toolbar/ToolbarForm";
export default {
  name: "BuyBaramRegisterView",
  components: {
    BuyBaramRegisterForm,
    TopMenuForm,
    ToolbarForm
  },
  methods: {
    ...mapActions([
      'requestCreateBuyBaramContentsToSpring'
    ]),
    async onSubmit (payload) {
      await this.requestCreateBuyBaramContentsToSpring(payload)
      await this.$router.push({
        name: 'BuyBaramListView'
      })
    }
  }
}
</script>

<style scoped>

</style>