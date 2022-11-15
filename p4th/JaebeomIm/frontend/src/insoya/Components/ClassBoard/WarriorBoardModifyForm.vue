<template>
  <div>
    <form @submit.prevent="onSubmit">
      <table>
        <tr>
          <td>게시물 번호</td>
          <td>
            <input type="text" :value="warriorBoard.boardNo" disabled>
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
            <input type="text" :value="warriorBoard.writer" disabled>
          </td>
        </tr>
        <tr>
          <td>등록일자</td>
          <td>
            <input type="text" :value="warriorBoard.regDate" disabled>
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
        <router-link :to="{ name: 'WarriorBoardReadView',
                            params: { boardNo: warriorBoard.boardNo.toString() } }">
          취소
        </router-link>
      </div>

    </form>
  </div>
</template>

<script>
export default {
  name: "WarriorBoardModifyForm",
  props: {
    warriorBoard: {
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
    this.title = this.warriorBoard.title
    this.writer = this.warriorBoard.writer
    this.content = this.warriorBoard.content
    this.regDate = this.warriorBoard.regDate
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