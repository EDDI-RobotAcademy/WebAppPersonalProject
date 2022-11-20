<template v-for="board in boards">
  <div>
        <board-list-form
            :board-name="boardName"
            :board-description="boardDescription"
            :headers="headers"
            :items="boards"
            :boards="boards"
        />
    <div align="center" class="mb-10 mt-3">
        <common-button
            icon-name="mdi-pencil"
            btn-name="글쓰기"
            @click="registerBoardContent"
        />
    </div>
  </div>
</template>

<script>
import BoardListForm from "@/components/board/BoardListForm";
import {mapActions, mapState} from "vuex";
export default {
  name: "QuestionBoardListView",
  components: {BoardListForm},
  data() {
    return {
      boardName: '질문게시판',
      boardDescription: '식물과 관련하여 궁금한 것을 물어보고 답해요.',
      headers: [
        {
          text: '식물 종류',
          align: 'start',
          value: 'plantName',
          sortable: true
        },
        {text: '제목', value: 'title', sortable: false},
        {text: '작성자', value: 'writer', sortable: false},
        {text: '등록일자', value: 'regDate', sortable: true},
      ],
    }
  },
  computed: {
    ...mapState([
        'boards'
    ])
  },
  mounted() {
    this.requestQuestionBoardListFromSpring()
  },
  methods: {
    ...mapActions([
        'requestQuestionBoardListFromSpring'
    ]),
    registerBoardContent() {
      this.$router.push({ name: 'BoardRegisterView' })
    }
  }
}
</script>

<style scoped>


</style>