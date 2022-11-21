<template>
  <v-container>

  <div>
    <v-img src="@/assets/img/자유게시판.png" height="160" width="200"></v-img>




    <common-board-form/>


    <div id="board">
      <free-board-list :free-boards="freeBoards"/>
    </div>



  </div>

    <router-link :to="{ name: 'FreeBoardRegisterView' }">
      <v-btn>글쓰기</v-btn>
    </router-link><br/><br/>

    <form action="/insoya/jpa/board/free/search" method="GET">
      <div class="search">
        <input name="keyword" type="text" placeholder="게시판 내 검색">
      </div>

      <button>검색</button>

    </form>
    <div>
      <common-bottom-template/>
    </div>
  </v-container>
</template>

<script>
import CommonBoardForm from "@/insoya/Components/Common/CommonBoardForm";
import { mapState, mapActions } from "vuex";
import FreeBoardList from "@/insoya/Components/FreeBoard/FreeBoardList";
import CommonBottomTemplate from "@/insoya/Components/Common/CommonBottomTemplate";
export default {
  name: "FreeBoardView",
  props: {
    freeBoards: {
      type: Array
    }
  },
  components: {CommonBottomTemplate, FreeBoardList, CommonBoardForm},
  data () {
    return {
      headerTitle: [
        { text: '번호', value: 'boardNo', width: "70px" },
        { text: '제목', value: 'title', width: "200px" },
        { text: '작성자', value: 'writer', width: "100px" },
        { text: '내용', value: 'content', width: "100px" },
        { text: '작성일자', value: 'regDate', width: "100px" },
      ],
    }
  },
  computed: {
    ...mapState([
      'freeBoards'
    ]),
  },
  mounted() {
    this.requestFreeBoardListFromSpring()
  },
  methods: {
    ...mapActions([
      'requestFreeBoardListFromSpring'
    ])
  }
}

</script>

<style scoped>

</style>