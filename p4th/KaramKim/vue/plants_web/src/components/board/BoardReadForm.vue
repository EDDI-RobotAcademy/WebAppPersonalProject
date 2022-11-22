<template>
  <div>
    <v-container>
      <common-page-description
        page-name="질문게시판"
      />
      <div class="mt-10" style="width: 630px">
        <div>
          <common-text-field
              type="text"
              label="식물 종류"
              :value="board.plantName"
              readonly
          />
        </div>
        <div>
          <common-text-field
              type="text"
              label="제목"
              :value="board.title"
              readonly
          />
        </div>
        <div>
          <common-text-field
              type="text"
              label="작성자"
              :value="board.writer"
              readonly
          />
        </div>
        <div>
          <common-text-field
              type="text"
              label="등록 일자"
              :value="board.regDate"
              readonly
          />
        </div>

        <div>
          <v-textarea
              label="내용"
              :value="board.content"
              height="600px"
              color="light-green darken-3"
              outlined
              readonly
          />
        </div>
      </div>
    </v-container>
  </div>
</template>

<script>
export default {
  name: "BoardReadForm",
  props: {
    board: {
      type: Object,
      required: true,
    }
  }
}
</script>

<style scoped>

</style>