<template>
  <v-container>
    <board-write-form @submit="onSubmit"/>
  </v-container>
</template>

<script>
import BoardWriteForm from "@/components/Board/BoardWriteForm";
import {mapActions} from "vuex";
export default {
  name: "BoardWriteView",
  components: {BoardWriteForm},
  data() {
    return {
      userToken: "",
    }
  },
  methods: {
    ...mapActions(["requestWriteBoardToSpring"]),
    async onSubmit(payload) {
      const { category, title, contents, memberEmail } = payload
      await this.requestWriteBoardToSpring( {category, title, contents, memberEmail})
    }
  },
  mounted() {
    if(this.$store.state.isAuthenticated === false) {
      alert("글 작성은 로그인 후에 가능합니다!")
      this.$router.push("/sign-in")
    }
  }
}
</script>

<style scoped>

</style>