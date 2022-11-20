<template>
  <div>
    <form @submit.prevent="onSubmit">
      <table>
        <tr>
          <td>게시물 번호</td>
          <td>
            <input type="text" :value="board.boardNo" disabled>
          </td>
        </tr>
        <tr>
          <td>제목</td>
          <td>
            <input type="text" v-model="title">
          </td>
        </tr>
        <tr>
          <td>작성자</td>
          <td>
            <input type="text" :value="board.writer" disabled>
          </td>
        </tr>
        <tr>
          <td>등록일자</td>
          <td>
            <input type="text" :value="board.regDate" disabled>
          </td>
        </tr>
        <tr>
          <td>본문</td>
          <td>
            <textarea cols="50" rows="20" v-model="content">
            </textarea>
          </td>
        </tr>
      </table>
      <div>
        <common-button
            type="submit"
            btn-name="저장"
        />
        <router-link
            :to="{ name: 'BoardReadView', params: { boardNo: board.boardNo.toString() } }"
            style="text-decoration: none"
        >
          <common-button
              btn-name="취소"
          />
        </router-link>
      </div>
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
  }
}
</script>

<style scoped>

</style>