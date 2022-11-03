<template>
  <v-container>
  <v-layout wrap>
    <v-flex class="orange white--text">
      <div><router-link :to="{ name: 'FreeBoardListView' }">자유게시판</router-link></div>
    </v-flex>
    <v-flex class="red white--text">
      <div><router-link :to="{ name: '' }">직업별게시판</router-link></div> <!--아직 직업별 게시판버튼 구현 못함.-->
    </v-flex>
    <v-flex class="yellow white--text">
      <div><router-link :to="{ name: 'QuestionBoardListView' }">질문게시판</router-link></div>
    </v-flex>
    <v-flex class="grey white--text">
      <div><router-link :to="{ name: 'TradeBoardView' }">사고팔고게시판</router-link></div>
    </v-flex>
    <v-flex class="orange white--text">
      <div><router-link :to="{ name: 'GradeUpBoardView' }">등업게시판</router-link></div>
    </v-flex>
    <v-flex class="red  white--text">
      <div><router-link :to="{ name: 'InsoyaMainView' }">인소야 메인</router-link></div>
    </v-flex>
  </v-layout><br/><br/>




    <div>
      <notice-board-search-form2 @submit="onSubmit"/>
    </div>

  </v-container>
</template>





<script>


import NoticeBoardSearchForm2 from "@/views/insoya/Components/NoticeBoardSearchForm2";
import axios from "axios";

export default {
  name: "CommonBoardForm",
  props: {
    boards: {
      type: Array
    }
  },
  components: {
    NoticeBoardSearchForm2
  },

  data () {
    return {

    }
    },
  methods: {
    onSubmit (payload) {
      const { memberName, major } = payload
      axios.post('http://localhost:7777/32th/vue2spring/receive-test',
          { memberName, major })
          .then(() => {
            alert('전송 요청 완료')
          })
          .catch(() => {
            alert('문제 발생!')
          })
    }
  }
}


</script>

<style scoped>

</style>