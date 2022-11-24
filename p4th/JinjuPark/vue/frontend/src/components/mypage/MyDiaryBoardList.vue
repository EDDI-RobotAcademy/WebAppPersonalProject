<template>
  <v-container>
    <v-row>
      <v-col>
        <!--        게시판
        1) boardListview는 각각 운동일기, 자유, 질문게시판 3개 구성 -> 각각 page = "diary" 등 정보 전달
        if page = diary명 <common-board-list> 쓰는데 : contents = "diaryBoards"

        -->
        <common-board-list
            icon-name="mdi-headphones"
            board-sub-title="마이 다이어리"
            search-label="게시판에서 검색"
            :contents= "diaryBoards"
            :router-name="routerName"
            :page-no="pageNo"
            :my-page-show="myPageShow"
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

export default {
  name: "MyDiaryBoardList",
  components:{
  },
  props: {
    diaryBoards: {
      type: Array
    },
    routerName: String,
    pageNo: Number
  },
  data(){
    return{
      myPageShow: true
    }
  },
  methods:{
  }

}
</script>

<style scoped>
</style>