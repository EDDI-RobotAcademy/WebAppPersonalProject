<template>
  <nav>
    <header-view-practice/>

    <br/><br/><br/><br/><br/>

    <v-row justify="center">
      <lend-register @submit="onSubmit"/>
    </v-row>

    <br/><br/><br/>

    <FooterForm/>
  </nav>
</template>

<script>
import LendRegister from "@/components/boards/lendBoards/LendRegister";
import {mapActions} from "vuex";
import FooterForm from "@/components/common/FooterForm";
import HeaderViewPractice from "@/views/main/HeaderViewPractice";

export default {
  name: "LendRegisterView",
  components: {
    HeaderViewPractice,
    FooterForm,
    LendRegister
  },
  methods: {
    ...mapActions([
      'requestRegisterLendToSpring'
    ]),
    async onSubmit (payload) {
      await this.requestRegisterLendToSpring(payload)
      await this.$router.push({
        name: 'LendListView'
      })
    }
  }
}
</script>

<style scoped>

</style>