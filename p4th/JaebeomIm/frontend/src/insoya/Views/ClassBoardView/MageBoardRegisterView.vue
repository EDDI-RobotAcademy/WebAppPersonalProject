<template>
  <div align="center">
    <h2>마법사게시글 작성</h2>
    <mage-board-register-form @submit="onSubmit"/>
  </div>
</template>

<script>
import MageBoardRegisterForm from "@/insoya/Components/ClassBoard/MageBoardRegisterForm";
import {mapActions} from "vuex";
export default {
  name: "MageBoardRegisterView",
  components: {MageBoardRegisterForm},
  data () {
    return {

    }
  },
  methods: {

    ...mapActions([
      'requestCreateMageBoardContentsToSpring'
    ]),
    async onSubmit (payload) {
      await this.requestCreateMageBoardContentsToSpring(payload)

      await this.$router.push({
        name: 'MageBoardListView'
      })
    },

  }
}
</script>

<style scoped>

</style>