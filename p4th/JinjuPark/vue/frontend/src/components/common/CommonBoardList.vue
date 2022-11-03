<template>
  <div v-on="$listeners"
       v-bind="$attrs">
<!--  게시판 타이틀 카드-->
  <v-card width="850px" height="300px" class="mb-5">
    <v-img
        class="white--text align-sm-center"
        max-width="850"
        height="200px"
        v-bind:src= "imgSrc"
    >
    </v-img>
    <v-card-title>{{boardTitle}}</v-card-title>
    <v-card-subtitle class="mt-1">
      {{boardSubText}}
    </v-card-subtitle>
  </v-card>

  <!--        게시판-->
  <v-card width="850px">
    <v-card-title>
      <v-icon>{{iconName}}</v-icon>
      {{boardSubTitle}}
      <v-spacer></v-spacer>
      <v-text-field
          v-model="searchText"
          append-icon="mdi-magnify"
          @click:append="search"
          label="Search"
          single-line
          hide-details
      ></v-text-field>
    </v-card-title>
    <v-data-table :headers="headerTitle"
                  :items="contents"
                  :items-per-page="10"
                  :mobile="false"
                  class="elevation-1">
    </v-data-table>
  </v-card>
  </div>
</template>

<script>
export default {
  name: "CommonBoardList",
  props: {
    imgSrc:String,
    iconName: String,
    boardTitle: String,
    boardSubText: String,
    boardSubTitle : String,

  },
  data(){
    return{
      searchText: "",
      headerTitle: [
        { text: '번호', value: 'boardNo', width: "10%", align: "center" },
        { text: '제목', value: 'title', width: "30%", align: "center"  },
        { text: '작성자', value: 'writer', width: "20%" , align: "center" },
        { text: '내용', value: 'content', width: "20%" , align: "center" },
        { text: '조회수', value: 'views', width: "10%" , align: "center" },
        { text: '추천수', value: 'like', width: "10%" , align: "center" },
      ],
      contents: [
        { boardNo: 1, title: '야호', writer: '으마으마', content: '으아아앜' ,views: '1' , like : '1' },
        { boardNo: 2, title: '야호', writer: '으마으마', content: '으아아앜' ,views: '9' , like : '2' },
        { boardNo: 3, title: '야호', writer: '으마으마', content: '으아아앜' ,views: '4' , like : '3'},
        { boardNo: 4, title: '야호', writer: '으마으마', content: '으아아앜' ,views: '8' , like : '1'},
        { boardNo: 5, title: '야호', writer: '으마으마', content: '으아아앜' ,views: '7' , like : '1'},
        { boardNo: 6, title: '야호야호', writer: '으아아앜', content: 'ㅇㅋ' ,views: '5' , like : '1'},
        { boardNo: 7, title: 'ㅇㅋ', writer: 'ㄷㅋ', content: 'ㅇㅋㄷㅋ' ,views: '1' , like : '1'},
        { boardNo: 8, title: '가즈아', writer: '주식폭망', content: '손잡고한강' ,views: '4' , like : '1'},
        { boardNo: 9, title: '간드앗', writer: '폭등', content: '다같이손잡고' ,views: '5' , like : '1'},
        { boardNo: 10, title: '끝까지버틴다', writer: '존버는승리', content: '나락감' ,views: '12' , like : '1'},
        { boardNo: 11, title: '마포대교줄서라', writer: '한강어디', content: '주식 조짐' ,views: '11' , like : '1'},
        { boardNo: 12, title: '한강도만원', writer: '지금작살남', content: '어디가맛집' ,views: '7' , like : '1'},
        { boardNo: 13, title: '야호', writer: '으마으마', content: '으아아앜' ,views: '8' , like : '1'},
        { boardNo: 14, title: '야호', writer: '으마으마', content: '으아아앜' ,views: '10' , like : '1'},
        { boardNo: 15, title: '야호', writer: '으마으마', content: '으아아앜' ,views: '1' , like : '1'},
      ],
    }
  },
  methods:{
    search() {
      alert("검색을 실행합니다")
    }
  }
}
</script>

<style scoped>

</style>