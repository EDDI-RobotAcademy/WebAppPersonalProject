<template>
  <div v-on="$listeners"
       v-bind="$attrs">
  <!--        게시판-->
  <v-card width="850px">
    <v-card-title>
      <v-icon>{{iconName}}</v-icon>
      {{boardSubTitle}}
      <v-spacer></v-spacer>
      <v-text-field v-show ="!myPageShow"
          v-model= "keyword"
          ref="keyword"
          append-icon="mdi-magnify"
          hide-details
          single-line
          :label="searchLabel"
          @click:append="search"
      ></v-text-field>&nbsp;
      <common-button-white btn-name="글쓰기" icon-name="mdi-pencil" @click="register"/>
    </v-card-title>

<!--     게시판 -->
<!--<div v-if="contents.category === '운동일기'">-->
    <v-data-table v-if="!contents || (Array.isArray(contents) && contents.length === 0)"
                       :headers="headerTitle">
    </v-data-table>
    <v-data-table v-else
                  :headers="headerTitle"
                  :items="contents"
                  :items-per-page="10"
                  :mobile="false"
                  class="elevation-1">
<!--공통 게시판 컴포넌트를 활용한 <v-data-table> 게시글 read 부분
전체 흐름:  DiaryBoardListView -> DiaryBoardList -> CommonBoardList 로 라우터 이름 전달 (공통으로 사용할 수 있는 틀로 구성 -> 세부 컴포넌트에서 router이름만 변경하면 적용되도록)
1) DiaryBoardListView의 data()에 routerName : "DiaryBoardReadView" 작성 + 커스텀태그에  :router-name="routerName" 작성
2) DiaryBoardList에서 props로 routerName : String  받음  + 커스텀 태그에  :router-name="routerName" 작성
3) CommonBoardList에서 props로 routerName : String  받음 ->  <router-link :to {name: routerName}>  적용
-->
      <template v-slot:[`item.title`]="{item}">
        <router-link style=text-decoration:none;
                     :to="{ name: routerName, params: { boardNo: item.boardNo.toString(), pageNo: pageNo} }">
          {{item.title}}
        </router-link>
      </template>

    </v-data-table>
<!--</div>-->
  </v-card>
  </div>
</template>

<script>
import {mapActions} from "vuex";

export default {
  name: "CommonBoardList",
  props: {
    imgName: String,
    iconName: String,
    boardSubTitle: String,
    searchLabel: String,
    contents: {
      type: Array
    },
    routerName: String,
    pageNo: Number,
    myPageShow: Boolean
  },

  data() {
    return {
      keyword: "",
      headerTitle: [
        {text: '번호', value: 'boardNo', width: "10%", align: "center"},
        //카테고리는 diaryBoards에 객체 형식으로 category:{id: 3, categoryName:'운동일기'} 식으로 저장 되어있으므로 value에 따로 'category.categoryName' 지정해줌
        {text: '카테고리', value: 'category.categoryName', width: "15%", align: "center"},
        {text: '제목', value: 'title', width: "30%", align: "center"},
        {text: '작성자', value: 'member.nickname', width: "15%", align: "center"},
        {text: '조회수', value: 'views', width: "15%", align: "center"},
        {text: '추천수', value: 'likes', width: "15%", align: "center"},
      ],
    }
  },
  methods: {
    ...mapActions([
      'requestDiaryBoardListFromSpring',
    ]),
    search() {
      //게시판별 검색(운동게시판)
      const pageNo= this.pageNo
      const keyword = this.$refs.keyword.value
      console.log("페이지 넘버1: "+ pageNo)
      console.log("페이지 넘버2: "+ this.pageNo)
      console.log("키워드가 있습니까?: "+ this.keyword)
      this.requestDiaryBoardListFromSpring( {pageNo, keyword})
    },
    register() {
      if(window.localStorage.getItem('userInfo') != null){
        this.$router.push({name: 'DiaryBoardRegisterView'})
      } else {
       alert("게시글 작성을 위해 로그인해주세요.")
        this.$router.push({name: 'SignInView'})
      }
    },
  },
}
</script>

<style scoped>

</style>