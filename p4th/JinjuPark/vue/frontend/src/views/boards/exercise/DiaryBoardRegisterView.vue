<template>
<v-container>

  <div>
    <common-main-menu-template/>
    <diary-board-register @submit="onSubmit"/>
    <common-footer-template/>
  </div>


</v-container>
</template>

<script>
import DiaryBoardRegister from "@/components/boards/exercise/DiaryBoardRegisterForm";
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
      console.log('운동일기 게시물 등록- registerview')
      await this.$router.push({
        name: 'DiaryBoardListView'
      })
    }
  }
}
</script>

<style scoped>

</style>