<template>
  <div align="center">
    <h2>등업게시글 작성</h2>
    <grade-up-register-form @submit="onSubmit"/>
  </div>
</template>

<script>
import GradeUpRegisterForm from "@/views/insoya/Components/GradeUpBoard/GradeUpRegisterForm";
import {mapActions} from "vuex";
export default {
  name: "GradeUpBoardRegisterView",
  components: {GradeUpRegisterForm},
  data () {
    return {

    }
  },
  methods: {

    ...mapActions([
      'requestCreateGradeUpBoardContentsToSpring'
    ]),
    async onSubmit (payload) {
      await this.requestCreateGradeUpBoardContentsToSpring(payload)

      await this.$router.push({
        name: 'GradeUpBoardListView'
      })
    },

  }

}
</script>

<style scoped>

</style>