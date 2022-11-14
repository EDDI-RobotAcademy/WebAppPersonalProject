<template>
  <v-container>
    <board-read-form :board="this.$store.state.communityBoard"/>
  </v-container>
</template>

<script>
import BoardReadForm from "@/components/Board/BoardReadForm";
import {mapActions} from "vuex";
export default {
  name: "BoardReadView",
  components: {BoardReadForm},
  props: {
    boardNo: {
      type: String,
      required: true,
    }
  },
  methods: {
    ...mapActions(['requestReadBoardToSpring'])
  },
  mounted() {
    this.requestReadBoardToSpring(this.boardNo)
  }
}
</script>

<style scoped>

</style>