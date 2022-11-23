<template>
  <div>
    <form @submit.prevent="onSubmit">
      <v-container>
        <common-page-description
          page-name="게시물 수정"
        />
        <div class="mt-10 mb-10" style="width: 630px">
          <div>
            <common-text-field
                type="text"
                label="식물 종류"
                :value="board.plantName"
                disabled
            />
          </div>
          <div>
            <common-text-field
                type="text"
                label="제목"
                v-model="title"
            />
          </div>
          <div>
            <common-text-field
                type="text"
                label="작성자"
                :value="board.writer"
                disabled
            />
          </div>
          <div>
            <common-text-field
                type="text"
                label="등록 일자"
                :value="board.regDate"
                disabled
            />
          </div>

          <div>
            <v-textarea
                label="내용"
                v-model="content"
                height="600px"
                color="light-green darken-3"
                outlined
            />
          </div>
          <div>
            <common-button
                type="submit"
                btn-name="저장"
                class="mr-3 ml-3"
            />
            <router-link
                :to="{ name: 'BoardReadView', params: { boardNo: board.boardNo.toString() } }"
                style="text-decoration: none"
            >
              <common-button
                  btn-name="취소"
                  class="mr-3 ml-3"
              />
            </router-link>
          </div>
        </div>
      </v-container>
    </form>
  </div>
</template>

<script>
export default {
  name: "BoardModifyForm",
  props: {
    board: {
      type: Object,
      required: true
    }
  },
  data() {
    return {
      title: '',
      content: '',
      writer: '',
      regDate: '',
    }
  },
  created() {
    this.title = this.board.title
    this.writer = this.board.writer
    this.content = this.board.content
    this.regDate = this.board.regDate
  },
  methods: {
    onSubmit() {
      const { title, content, writer, regDate } = this
      this.$emit('submit', { title, content, writer, regDate })
    }
  }
}
</script>

<style scoped>

</style>