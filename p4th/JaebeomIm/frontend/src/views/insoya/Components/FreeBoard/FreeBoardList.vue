<template>
  <div>
    <h3>게시물 목록</h3>
    <table border="1">
      <tr>
        <th align="center" width="100">No</th>
        <th align="center" width="640">제목</th>
        <th align="center" width="150">작성자</th>
        <th align="center" width="240">등록일자</th>
      </tr>
      <tr v-if="!freeBoards || (Array.isArray(freeBoards) && freeBoards.length === 0)">
        <td colspan="4">
          현재 등록된 게시물이 없습니다!
        </td>
      </tr>
      <tr v-else v-for="freeBoard in freeBoards" :key="freeBoard.boardNo">
        <td align="center">
          {{ freeBoard.boardNo }}
        </td>
        <td align="left">
          <router-link :to="{ name: 'FreeBoardReadView',
                              params: { boardNo: freeBoard.boardNo.toString() }}">
            {{ freeBoard.title }}
          </router-link>
        </td>
        <td align="right">
          {{ freeBoard.writer }}
        </td>
        <td align="center">
          {{freeBoard.regDate }}
        </td>
      </tr>
    </table>
  </div>
</template>

<script>
export default {
  name: "FreeBoardList",
  props: {
    freeBoards: {
      type: Array
    }
  }
}
</script>

<style scoped>

</style>