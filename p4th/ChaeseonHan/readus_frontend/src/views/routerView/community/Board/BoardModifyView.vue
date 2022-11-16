<template>
  <v-container>
    <board-modify-form @submit="onSubmit" :board="this.$store.state.communityBoard"/>
  </v-container>
</template>

<script>
import BoardModifyForm from "@/components/Board/BoardModifyForm";
import {mapActions} from "vuex";
export default {
  name: "BoardModifyView",
  components: {BoardModifyForm},
  props: {
    boardNo: {
      type: String,
      required: true,
    }
  },

  methods: {
    ...mapActions(['requestModifyBoardToSpring']),
    async onSubmit(payload) {
      const { category, title, contents } = payload
      const boardNo = this.boardNo
      await this.requestModifyBoardToSpring( { boardNo, category, title, contents })
      await this.$router.push( {
        name: "BoardReadView",
        params: { boardNo: this.boardNo }
      })
    },
  },

  mounted() {
    if (this.$store.state.loginUserProfile.length == 0 || this.$store.state.loginUserProfile.id != this.$store.state.communityBoard.member_id.id) {
      alert("작성자만 수정 가능합니다!")
      this.$router.push( {
        name: "BoardReadView",
        params: { boardNo: this.boardNo.toString() }
      })
    }
  }
}
</script>

<style scoped>

</style>