<template>
  <v-container>
    <board-read-form :board="this.$store.state.communityBoard"/>
  </v-container>
</template>

<script>
import BoardReadForm from "@/components/Board/BoardReadForm";
export default {
  name: "BoardReadView",
  components: {BoardReadForm},
  props: {
    boardNo: {
      type: String,
      required: true,
    }
  }
}
</script>

<style scoped>

</style>