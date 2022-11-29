<template>
  <div align="center">
    <h2>전사게시글 작성</h2>
    <warrior-board-register-form @submit="onSubmit"/>
  </div>
</template>

<script>
import WarriorBoardRegisterForm from "@/insoya/Components/ClassBoard/WarriorBoardRegisterForm";
import {mapActions} from "vuex";
export default {
  name: "WarriorBoardRegisterView",
  components: {WarriorBoardRegisterForm},
  data () {
    return {

    }
  },
  methods: {
    ...mapActions([
      'requestCreateWarriorBoardContentsToSpring'
    ]),
    async onSubmit (payload) {
      await this.requestCreateWarriorBoardContentsToSpring(payload)

      await this.$router.push({
        name: 'WarriorBoardListView'
      })
    },

  }
}
</script>

<style scoped>

</style>