<template>
  <div align="center">
    <h2>궁수게시글 작성</h2>
    <archer-board-register-form @submit="onSubmit"/>
  </div>
</template>

<script>
import ArcherBoardRegisterForm from "@/insoya/Components/ClassBoard/ArcherBoardRegisterForm";
import {mapActions} from "vuex";
export default {
  name: "ArcherBoardRegisterView",
  components: {ArcherBoardRegisterForm},
  data () {
    return {

    }
  },
  methods: {

    ...mapActions([
      'requestCreateArcherBoardContentsToSpring'
    ]),
    async onSubmit (payload) {
      await this.requestCreateArcherBoardContentsToSpring(payload)

      await this.$router.push({
        name: 'ArcherBoardListView'
      })
    },

  }
}
</script>

<style scoped>

</style>