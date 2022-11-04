<template>
  <v-container>
    <v-row>
      <v-col>
        <!--        게시판-->
        <common-board-list
            board-title= "운동 일기"
            icon-name="mdi-headphones"
            imgName="diary_camera.jpg"
            board-sub-title="오.운.완"
            board-sub-text="오늘의 운동은 어떠셨나요? 당신의 근성장을 응원합니다."
            search-label="운동일기 게시판에서 검색"
            :contents= "diaryBoards"
        />
      </v-col>
        <!--      사이드 배치-->
      <v-col>
        <!--        마이페이지-->
        <common-my-text-field/>
        <!--      사이드 배너-->
        <common-side-banner/>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
import CommonMyTextField from "@/components/common/CommonMyTextField";
import CommonSideBanner from "@/components/common/CommonSideBanner";

export default {
  name: "DiaryBoardList",
  components:{
    CommonMyTextField,
    CommonSideBanner,
  },
  props: {
    diaryBoards: {
      type: Array
    }
  },
  data(){
    return{
    }
  },
  methods:{
  search(){
// 여기서 emit?
  }
  }

}
</script>

<style scoped>
/*v-card {*/
/*  white-space: nowrap;*/
/*}*/
</style>