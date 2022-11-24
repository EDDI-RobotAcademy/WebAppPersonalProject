<template>
  <v-container>
    <div>
      <top-menu-form/>
      <toolbar-form/>
    </div>
    <div align="center">
      <h2>게시물 작성</h2>
      <sell-baram-register-form @submit="onSubmit"/>
    </div>
  </v-container>
</template>

<script>
import SellBaramRegisterForm from "@/components/boards/sellBoard/baram/SellBaramRegisterForm";
import {mapActions} from "vuex";
import TopMenuForm from "@/components/topMenubar/TopMenuForm";
import ToolbarForm from "@/components/toolbar/ToolbarForm";
export default {
  name: "SellBaramRegisterView",
  components: {
    SellBaramRegisterForm,
    TopMenuForm,
    ToolbarForm
  },
  methods: {
    ...mapActions([
      'requestCreateSellBaramContentsToSpring'
    ]),
    async onSubmit (payload) {
      await this.requestCreateSellBaramContentsToSpring(payload)
      await this.$router.push({
        name: 'SellBaramListView'
      })
    }
  }
}
</script>

<style scoped>

</style>