<template>
  <div align="center">
    <h2>자유게시글 작성</h2>
    <trade-board-register-form @submit="onSubmit"/>
  </div>
</template>

<script>
import TradeBoardRegisterForm from "@/views/insoya/Components/TradeBoard/TradeBoardRegisterForm";
import {mapActions} from "vuex";
export default {
  name: "TradeBoardRegisterView",
  components: {TradeBoardRegisterForm},
  data () {
    return {

    }
  },
  methods: {

    ...mapActions([
      'requestCreateTradeBoardContentsToSpring'
    ]),
    async onSubmit (payload) {
      await this.requestCreateTradeBoardContentsToSpring(payload)

      await this.$router.push({
        name: 'TradeBoardListView'
      })
    },

  }
}
</script>

<style scoped>

</style>