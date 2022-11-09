<template>
  <div>
    <table>
      <tr>
        <td>게시물 번호</td>
        <td>
          <input type="text" :value="gradeUpBoard.boardNo" readonly>
        </td>
      </tr>
      <tr>
        <td>제목</td>
        <td>
          <input type="text" :value="gradeUpBoard.title" readonly>
        </td>
      </tr>
      <tr>
        <td>작성자</td>
        <td>
          <input type="text" :value="gradeUpBoard.writer" readonly>
        </td>
      </tr>
      <tr>
        <td>등록일자</td>
        <td>
          <input type="text" :value="gradeUpBoard.regDate" readonly>
        </td>
      </tr>
      <tr>
        <td>본문</td>
        <td>
          <textarea cols="50" rows="20" :value="gradeUpBoard.content" readonly>
          </textarea>
        </td>
      </tr>
    </table>
  </div>
</template>

<script>
export default {
  name: "GradeUpBoardRead",
  props: {
    gradeUpBoard: {
      type: Object,
      required: true,
    }
  }
}
</script>

<style scoped>

</style>