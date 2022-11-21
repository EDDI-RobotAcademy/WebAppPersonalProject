<template>

  <div class="text">
    <h1>List</h1>
    <br>
    <table border="1">
      <tr>
        <th align="center" width="100">No.</th>
        <th align="center" width="640">TITLE</th>
        <th align="center" width="150">WRITER</th>
        <th align="center" width="150">DATE</th>
      </tr>
      <tr v-if="!boards || (Array.isArray(boards) && boards.length === 0)">
        <td colspan="4">
          No CONTENTS.
        </td>
      </tr>
      <tr v-else v-for="board in boards" :key="board.boardNo">
        <td align="center">
          {{ board.boardNo }}
        </td>
        <td align="left">
          <router-link :to="{ name: 'JpaBoardReadView',
                              params: { boardNo: board.boardNo.toString() }}">
            {{ board.title }}
          </router-link>
        </td>
        <td align="right">
          {{ board.writer }}
        </td>
        <td align="center">
          {{ board.regDate }}
        </td>
      </tr>
    </table>
  </div>
</template>
<script>
export default {
  name: "JpaBoardList",
  props: {
    boards: {
      type: Array
    }
  }
}
</script>

<style scoped>
.text {

  text-align: center;
  color: #FFECB3;
}

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