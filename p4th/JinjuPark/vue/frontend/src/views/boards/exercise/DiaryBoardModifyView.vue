<template>
  <v-container>
    <common-main-menu-template/>
    <common-image-card
        board-title="운동 일기"
        board-sub-text="오늘의 운동은 어떠셨나요? 당신의 근성장을 응원합니다."
        imgName="diary_camera.jpg"/>
    <diary-board-modify-form
        v-if ="diaryBoard"
        :diary-board = "diaryBoard"
        @submit="onSubmit"/>
    <p v-else> Loading......</p>
    <common-footer-template/>
  </v-container>
</template>

<script>
import diaryBoardModifyForm from "@/components/boards/exercise/DiaryBoardModifyForm";
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
      'requestDiaryBoardModifyToSpring'
    ]),
    async onSubmit (payload) {
      const { title, writer, category, authority, regDate, views, likes, noLikes, content  } = payload
      const boardNo = this.boardNo
      await this.requestDiaryBoardModifyToSpring({ boardNo, title, writer, category, authority, regDate, views, likes, noLikes, content })
      await this.$router.push({
        name: 'DiaryBoardReadView',
        params: { boardNo: this.boardNo }
      })
    }
  },
  created () {                                      // 화면 첫 로드될때 해당 boardNo 게시글의  read메소드 실행
    this.requestDiaryBoardFromSpring(this.boardNo)
  }

}
</script>

<style scoped>

</style>