<template>
  <v-container>
    <board-write-form @submit="onSubmit"/>
  </v-container>
</template>

<script>
import BoardWriteForm from "@/components/Board/BoardWriteForm";
import {mapActions} from "vuex";
export default {
  name: "BoardWirteView",
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
  }
}
</script>

<style scoped>

</style>