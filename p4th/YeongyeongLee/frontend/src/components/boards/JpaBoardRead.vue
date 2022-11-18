<template>
  <div>
    <table>
      <tr>
        <td> NO. </td>
        <td>
          <input type="text" :value="board.boardNo" readonly  size="20" style="width:100%; border: 0;">
        </td>
      </tr>
      <tr>
        <td> TITLE </td>
        <td>
          <input type="text" :value="board.title" readonly  size="20" style="width:100%; border: 0;">
        </td>
      </tr>
      <tr>
        <td> WRITER </td>
        <td>
          <input type="text" :value="board.writer" readonly  size="10" style="width:100%; border: 0;">
        </td>
      </tr>
      <tr>
        <td> DATE </td>
        <td>
          <input type="text" :value="board.regDate" readonly  size="100" style="width:100%; border: 0;">
        </td>
      </tr>
      <tr>
        <td>CONTENTS </td>
        <td>
          <textarea cols="100" rows="20" :value="board.content" readonly  >
          </textarea>
        </td>
      </tr>
    </table>
  </div>
</template>

<script>
export default {
  name: "JpaBoardRead",
  props: {
    board: {
      type: Object,
      required: true,
    }
  }
}
</script>

<style scoped>


table, th, td {
  border: 1px solid #bcbcbc;
  color: #FFECB3;

}

table {

  margin-left: auto;
  margin-right: auto;
  table-layout: fixed;

}

table, td {
  text-align: center;

}
</style>