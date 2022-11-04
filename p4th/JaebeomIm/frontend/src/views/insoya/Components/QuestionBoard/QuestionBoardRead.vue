<template>
  <div>
    <table>
      <tr>
        <td>게시물 번호</td>
        <td>
          <input type="text" :value="questionBoard.boardNo" readonly>
        </td>
      </tr>
      <tr>
        <td>제목</td>
        <td>
          <input type="text" :value="questionBoard.title" readonly>
        </td>
      </tr>
      <tr>
        <td>작성자</td>
        <td>
          <input type="text" :value="questionBoard.writer" readonly>
        </td>
      </tr>
      <tr>
        <td>등록일자</td>
        <td>
          <input type="text" :value="questionBoard.regDate" readonly>
        </td>
      </tr>
      <tr>
        <td>본문</td>
        <td>
          <textarea cols="50" rows="20" :value="questionBoard.content" readonly>
          </textarea>
        </td>
      </tr>
    </table>
  </div>
</template>

<script>
export default {
  name: "QuestionBoardRead",
  props: {
    questionBoard: {
      type: Object,
      required: true,
    }
  }
}
</script>

<style scoped>

</style>