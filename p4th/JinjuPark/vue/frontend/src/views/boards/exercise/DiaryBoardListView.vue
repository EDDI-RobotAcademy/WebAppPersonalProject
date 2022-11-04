<template>
  <v-container>
  <div>
    <common-main-menu-template :keyword="keyword"/>
    <diary-board-list :diaryBoards="diaryBoards"/>
    <common-footer-template/>
  </div>

  </v-container>
</template>
<!-- 공통 게시판 db 데이터 전달 흐름 정리

1) 상위 DiaryBoardListView
  ->  states의 diaryBoards 값 가져오고 하위 커스텀 태그<diary-board-list>에 :diaryBoards="diaryBoards" 로 값 넘겨줌
2) 하위 DiaryBoardList
  -> 하위에서 props에 diaryBoards: {type: Array}로 값 적어주고 다시 공통 컴포넌트 태그 <common-board-list>에 :contents= "diaryBoards"로 공통 쪽으로 값 넘겨줌
3) 글로벌 공통 CommonBoardList
 -> 실제 사용하는 컴포넌트에서 받는 값을  props에 contents: {type: Array}로 값 적어주고 <v-data table> 태그에 :items= "contents"로 적어서 값 적용

* 참고사항
1) 컴포넌트끼리 데이터 바인딩 (값 넘겨주기)하는 경우 -> :현재 컴포넌트에서 만든 속성명 = "받아오는 데이터명" 으로 써줌!
   (앞에 :땡땡 붙여주기-> 안붙이는 경우는 같은 컴포넌트 내 데이터 사용하는 경우 )
-->
<script>
import DiaryBoardList from "@/components/boards/exercise/DiaryBoardList";
import {mapActions, mapState} from "vuex";

export default {
  name: "DiaryBoardListView",
  components:{
    DiaryBoardList
  },
  computed: {
    ...mapState([
        'diaryBoards'
    ]),
  },
  mounted() {
    this.requestDiaryBoardListFromSpring()
  },
  data() {
    return{
      keyword: "",
    }
  },
  methods: {
    ...mapActions([
        'requestDiaryBoardListFromSpring'
    ])
  }
}
</script>

<style scoped>

</style>