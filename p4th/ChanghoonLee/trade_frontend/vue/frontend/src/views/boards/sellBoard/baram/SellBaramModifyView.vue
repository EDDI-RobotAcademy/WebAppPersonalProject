<template>
  <v-container>
    <div>
      <top-menu-form/>
      <toolbar-form/>
    </div>
    <div align="center">
      <h2>게시물 수정</h2>
      <sell-baram-modify-form v-if="sellBaramBoard" :sellBaramBoard="sellBaramBoard" @submit="onSubmit"/>
      <p v-else>Loading .........</p>
    </div>
  </v-container>
</template>

<script>
import SellBaramModifyForm from "@/components/boards/sellBoard/baram/SellBaramModifyForm";
import {mapActions, mapState} from "vuex";
import TopMenuForm from "@/components/topMenubar/TopMenuForm";
import ToolbarForm from "@/components/toolbar/ToolbarForm";

export default {
  name: "SellBaramModifyView",
  components: {
    SellBaramModifyForm,
    TopMenuForm,
    ToolbarForm
  },
  props: {
    sellBaramNo: {
      type: String,
      required: true,
    }
  },
  computed: {
    ...mapState(['sellBaramBoard'])
  },
  methods: {
    ...mapActions([
      'requestSellBaramFromSpring',
      'requestSellBaramModifyToSpring'
    ]),
    async onSubmit (payload) {
      const { title, content, writer, regDate } = payload
      const sellBaramNo = this.sellBaramNo
      await this.requestSellBaramModifyToSpring({ sellBaramNo, title, content, writer, regDate })
      await this.$router.push({
        name: 'SellBaramReadView',
        params: { sellBaramNo: this.sellBaramNo }
      })
    }
  },
  created () {
    this.requestSellBaramFromSpring(this.sellBaramNo)
  }
}
</script>

<style scoped>

</style>