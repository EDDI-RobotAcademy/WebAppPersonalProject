<template>
  <div>
    <form @submit.prevent="onSubmit">
      <table>
        <tr>
          <td>게시물 번호</td>
          <td>
            <input type="text" :value="archerBoard.boardNo" disabled>
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
            <input type="text" :value="archerBoard.writer" disabled>
          </td>
        </tr>
        <tr>
          <td>등록일자</td>
          <td>
            <input type="text" :value="archerBoard.regDate" disabled>
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
        <button type="submit">수정 완료</button>
        <router-link :to="{ name: 'ArcherBoardReadView',
                            params: { boardNo: archerBoard.boardNo.toString() } }">
          취소
        </router-link>
      </div>

    </form>
  </div>
</template>

<script>
export default {
  name: "ArcherBoardModifyForm",
  props: {
    archerBoard: {
      type: Object,
      required: true,
    }
  },
  data () {
    return {
      title: '',
      content: '',
      writer: '',
      regDate: '',
    }
  },
  created () {
    this.title = this.archerBoard.title
    this.writer = this.archerBoard.writer
    this.content = this.archerBoard.content
    this.regDate = this.archerBoard.regDate
  },
  methods: {
    onSubmit () {
      const { title, content, writer, regDate } = this
      this.$emit('submit', { title, content, writer, regDate })
    }
  }
}
</script>

<style scoped>

</style>