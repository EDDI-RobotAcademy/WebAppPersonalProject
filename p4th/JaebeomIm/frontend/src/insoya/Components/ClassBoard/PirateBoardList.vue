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
      <tr v-if="!pirateBoards || (Array.isArray(pirateBoards) && pirateBoards.length === 0)">
        <td colspan="4">
          현재 등록된 게시물이 없습니다!
        </td>
      </tr>
      <tr v-else v-for="pirateBoard in pirateBoards" :key="pirateBoard.boardNo">
        <td align="center">
          {{ pirateBoard.boardNo }}
        </td>
        <td align="left">
          <router-link :to="{ name: 'PirateBoardReadView',
                              params: { boardNo: pirateBoard.boardNo.toString() }}">
            {{ pirateBoard.title }}
          </router-link>
        </td>
        <td align="right">
          {{ pirateBoard.writer }}
        </td>
        <td align="center">
          {{ pirateBoard.regDate }}
        </td>
      </tr>
    </table>
  </div>
</template>

<script>
export default {
  name: "PirateBoardList",
  props: {
    pirateBoards: {
      type: Array
    }
  }
}
</script>

<style scoped>

</style>