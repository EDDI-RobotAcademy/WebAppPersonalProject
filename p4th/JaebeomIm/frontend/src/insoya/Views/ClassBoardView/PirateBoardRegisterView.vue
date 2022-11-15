<template>
  <div align="center">
    <h2>해적게시글 작성</h2>
    <pirate-board-register-form @submit="onSubmit"/>
  </div>
</template>

<script>
import PirateBoardRegisterForm from "@/insoya/Components/ClassBoard/PirateBoardRegisterForm";
import {mapActions} from "vuex";
export default {
  name: "PirateBoardRegisterView",
  components: {PirateBoardRegisterForm},
  data () {
    return {

    }
  },
  methods: {

    ...mapActions([
      'requestCreatePirateBoardContentsToSpring'
    ]),
    async onSubmit (payload) {
      await this.requestCreatePirateBoardContentsToSpring(payload)

      await this.$router.push({
        name: 'PirateBoardListView'
      })
    },

  }
}
</script>

<style scoped>

</style>