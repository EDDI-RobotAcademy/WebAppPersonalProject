<template>
  <nav>
    <header-view-practice/>

    <br/><br/><br/><br/><br/>

    <v-row justify="center">
      <lend-modify v-if="lend" :lend="lend" @submit="onSubmit"/>
      <p v-else>Loading .........</p>
    </v-row>

    <br/><br/><br/>

    <FooterForm/>
  </nav>
</template>


<script>
import { mapActions, mapState } from 'vuex'
import LendModify from "@/components/boards/lendBoards/LendModify";
import HeaderViewPractice from "@/views/main/HeaderViewPractice";
import FooterForm from "@/components/common/FooterForm";

export default {
  name:'LendModifyView',
  components:{
    FooterForm,
    HeaderViewPractice,
    LendModify,
  },
  props: {
    lendNo: {
      type: String,
      required: true,
    }
  },
  computed: {
    ...mapState(['lend'])
  },
  methods: {
    ...mapActions([
      'requestLendFromSpring',
      'requestModifyLendToSpring'
    ]),
    async onSubmit (payload) {
      const { title, writer, price, content, regDate } = payload
      const lendNo = this.lendNo
      await this.requestModifyLendToSpring({ lendNo, title, writer, price, content, regDate })
      await this.$router.push({
        name: 'LendReadView',
        params: { lendNo: this.lendNo }
      })
    }
  },
  created () {
    this.requestLendFromSpring(this.lendNo)
  }
}
</script>

<style scoped>
</style>