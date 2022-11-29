<template>
  <div align="center">
    <h2>게시물 작성</h2>
    <free-board-register-form @submit="onSubmit"/>
  </div>
</template>

<script>
import FreeBoardRegisterForm from "@/views/insoya/Components/FreeBoard/FreeBoardRegisterForm";
import {mapActions} from "vuex";
export default {
  name: "FreeBoardRegisterView",
  components: {FreeBoardRegisterForm},
  data () {
    return {

    }
  },
  methods: {

    ...mapActions([
      'requestCreateFreeBoardContentsToSpring'
    ]),
    async onSubmit (payload) {
      await this.requestCreateFreeBoardContentsToSpring(payload)

      await this.$router.push({
        name: 'FreeBoardListView'
      })
    },

  }
}
</script>

<style scoped>

</style>