<template>
  <div align="center">
    <jpa-board-register-form @submit="onSubmit"/>
  </div>
</template>

<script>
import JpaBoardRegisterForm from "@/components/boards/JpaBoardRegisterForm";
import {mapActions} from "vuex";
export default {
  name: "JpaBoardRegisterView",
  components: {
    JpaBoardRegisterForm
  },
  methods: {
    ...mapActions([
      'requestCreateBoardContentsToSpring'
    ]),
    async onSubmit (payload) {
      await this.requestCreateBoardContentsToSpring(payload)
      await this.$router.push({
        name: 'korean-board-view'
      })
    }
  }
}
</script>

<style scoped>

</style>