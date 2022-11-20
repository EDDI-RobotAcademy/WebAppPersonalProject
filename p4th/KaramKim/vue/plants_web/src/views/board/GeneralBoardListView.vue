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
  name: "GeneralBoardListView",
  components: {BoardListForm},
  data() {
    return {
      boardName: '자유게시판',
      boardDescription: '식물에 대한 다양한 이야기를 나눠요.',
      headers: [
        {
          text: '식물 종류',
          align: 'start',
          value: 'plantName',
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