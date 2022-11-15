<template>
  <div align="center">
    <h2>도적게시글 작성</h2>
    <thief-board-register-form @submit="onSubmit"/>
  </div>
</template>

<script>

import {mapActions} from "vuex";
import ThiefBoardRegisterForm from "@/insoya/Components/ClassBoard/ThiefBoardRegisterForm";
export default {
  name: "ThiefBoardRegisterView",
  components: {ThiefBoardRegisterForm},
  data () {
    return {

    }
  },
  methods: {
    ...mapActions([
      'requestCreateThiefBoardContentsToSpring'
    ]),
    async onSubmit (payload) {
      await this.requestCreateThiefBoardContentsToSpring(payload)

      await this.$router.push({
        name: 'ThiefBoardListView'
      })
    },

  }
}
</script>

<style scoped>

</style>