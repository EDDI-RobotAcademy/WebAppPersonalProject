<template>
  <v-container>
    <v-btn class="yellow" rounded>
      <router-link :to="{ name: 'SignInView' }">로그인</router-link></v-btn>

    <v-btn class="yellow" rounded>
    <router-link :to="{ name: 'SignUpView' }">회원가입</router-link>
    </v-btn>

<center>
  <v-img src="@/assets/img/maple.jpg" height="100" width="200"></v-img><br/>
  <h2>인소야 닷컴</h2>
</center>
    <div>
      <notice-board-search-form @submit="onSubmit"/>
    </div>

    <br/><br/><br/><v-btn class="indigo white--text" color="orange darken-1"><router-link :to="{ name: 'FreeBoardView' }">자유게시판</router-link></v-btn><br/><br/>

    <div>
      <v-menu offset-y>
        <template v-slot:activator="{ on }">
          <v-btn color="orange darken-1" class="white--text ma-5" v-on="on">
          직업게시판
          </v-btn>
        </template>
        <v-list>
          <v-list-item v-for="(dropItem, index) in classes" :key="index" link>
            <v-list-item-title>
              {{ dropItem.title }}
            </v-list-item-title>
          </v-list-item>
        </v-list>
      </v-menu>
    </div><br/>

    <v-btn class="indigo white--text" color="orange darken-1"><router-link :to="{ name: 'QuestionBoardView' }">질문게시판</router-link></v-btn><br/><br/>

    <v-btn class="indigo white--text" color="orange darken-1"><router-link :to="{ name: 'TradeBoardView' }">사고팔고게시판</router-link></v-btn><br/><br/>

    <v-btn class="indigo white--text" color="orange darken-1"><router-link :to="{ name: 'GradeUpBoardView' }">등업게시판</router-link></v-btn><br/><br/>

  </v-container>
</template>

<script>
import NoticeBoardSearchForm from "@/views/insoya/Components/NoticeBoardSearchForm";
import axios from "axios";

export default {
  name: "InsoyaMainView",
  components: {
    NoticeBoardSearchForm
  },
  data () {
    return {

      headerTitle: [
        { text: '번호', value: 'boardNo', width: "70px" },
        { text: '제목', value: 'title', width: "200px" },
        { text: '작성자', value: 'writer', width: "100px" },
        { text: '내용', value: 'content', width: "100px" },
      ],
      contents: [
      ],

      classes: [
        { title: '전사' },
        { title: '마법사' },
        { title: '궁수' },
        { title: '도적' },
        { title: '해적' },
      ]
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