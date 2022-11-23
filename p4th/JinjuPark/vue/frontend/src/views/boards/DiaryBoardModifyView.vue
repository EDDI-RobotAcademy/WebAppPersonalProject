<template>
  <v-container>
    <common-main-menu-template/>
    <common-image-card
        imgName="re_winter_white_banner.png"/>
    <diary-board-modify-form
        v-if ="diaryBoard"
        :diary-board = "diaryBoard"
        @submit="onSubmit"/>
    <p v-else> Loading......</p>
    <common-footer-template/>
  </v-container>
</template>

<script>
import diaryBoardModifyForm from "@/components/boards/DiaryBoardModifyForm";
import {mapActions, mapState} from "vuex";

export default {
  name: "DiaryBoardModifyView",
  components: {diaryBoardModifyForm},
  props: {
    boardNo: {
      type: String,
      required: true,
    }
  },
  computed: {
    ...mapState(['diaryBoard'])
  },
  methods: {
    ...mapActions([
      'requestDiaryBoardFromSpring',
      'requestDiaryBoardModifyToSpring',
        'requestImageReadFromSpring'
    ]),
    async onSubmit (payload) {
      const { title, content  } = payload
      const boardNo = this.boardNo
      await this.requestDiaryBoardModifyToSpring({ boardNo, title, content })
      await this.$router.push({
        name: 'DiaryBoardReadView',
        params: { boardNo: this.boardNo }
      })
    },
  },
  created () {                                      // 화면 첫 로드될때 해당 boardNo 게시글의  read메소드 실행
    this.requestImageReadFromSpring(this.boardNo)
    this.requestDiaryBoardFromSpring(this.boardNo)
  }

}
</script>

<style scoped>

</style>