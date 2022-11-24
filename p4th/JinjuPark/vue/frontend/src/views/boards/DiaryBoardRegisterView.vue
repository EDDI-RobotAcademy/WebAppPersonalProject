<template>
<v-container>

  <div>
    <common-main-menu-template/>
    <common-image-card
        imgName="re_winter_white_banner.png"/>
    <diary-board-register @submit="onSubmit"/>
    <common-footer-template/>
  </div>


</v-container>
</template>

<script>
import DiaryBoardRegister from "@/components/boards/DiaryBoardRegisterForm";
 import {mapActions} from "vuex";

export default {
  name: "DiaryBoardRegisterView",
  components:{
    DiaryBoardRegister
  },
  methods: {
    ...mapActions([
      'requestCreateDiaryBoardContentsToSpring'
    ]),
    async onSubmit (payload) {
      await this.requestCreateDiaryBoardContentsToSpring(payload)
    }
  }
}
</script>

<style scoped>

</style>