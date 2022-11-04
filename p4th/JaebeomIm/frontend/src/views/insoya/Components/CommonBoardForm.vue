<template>
  <v-container>
  <v-layout wrap>
    <v-flex class="orange white--text">
      <div><router-link :to="{ name: 'FreeBoardListView' }"><v-btn color="purple darken-1" class="white--text ma-5">자유게시판 </v-btn></router-link></div>
    </v-flex>
    <v-flex class="red white--text">
      <v-menu offset-y>
        <template v-slot:activator="{ on }">
          <v-btn color="purple darken-1" class="white--text ma-5" v-on="on">
            직업게시판
          </v-btn>
        </template>
        <v-list>
          <v-list-item v-for="(dropItem, index) in classes" :key="index" :to="dropItem.route">
            <v-list-item-title>
              {{ dropItem.title }}
            </v-list-item-title>
          </v-list-item>
        </v-list>
      </v-menu> <!--아직 직업별 게시판버튼 구현 못함.-->
    </v-flex>
    <v-flex class="yellow white--text">
      <div><router-link :to="{ name: 'QuestionBoardListView' }"><v-btn color="purple darken-1" class="white--text ma-5">질문게시판</v-btn></router-link></div>
    </v-flex>
    <v-flex class="orange white--text">
      <div><router-link :to="{ name: 'TradeBoardView' }"><v-btn color="purple darken-1" class="white--text ma-5">사고팔고게시판</v-btn></router-link></div>
    </v-flex>
    <v-flex class="red white--text">
      <div><router-link :to="{ name: 'GradeUpBoardView' }"><v-btn color="purple darken-1" class="white--text ma-5">등업게시판</v-btn></router-link></div>
    </v-flex>
    <v-flex class="yellow white--text">
      <div><router-link :to="{ name: 'InsoyaMainView' }"><v-btn color="purple darken-1" class="white--text ma-5">인소야메인</v-btn></router-link></div>
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
      classes: [
        { title: '전사', name:'WarriorBoardListView', route:'/warrior-board' },
        { title: '마법사', name:'MageBoardListView', route:'/mage-board' },
        { title: '궁수', name:'ArcherBoardListView', route:'/archer-board'  },
        { title: '도적', name:'ThiefBoardListView', route:'/thief-board'  },
        { title: '해적', name:'PirateBoardListView', route:'/pirate-board' },
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