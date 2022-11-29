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
      <tr v-if="!thiefBoards || (Array.isArray(thiefBoards) && thiefBoards.length === 0)">
        <td colspan="4">
          현재 등록된 게시물이 없습니다!
        </td>
      </tr>
      <tr v-else v-for="thiefBoard in thiefBoards" :key="thiefBoard.boardNo">
        <td align="center">
          {{ thiefBoard.boardNo }}
        </td>
        <td align="left">
          <router-link :to="{ name: 'ThiefBoardReadView',
                              params: { boardNo: thiefBoard.boardNo.toString() }}">
            {{ thiefBoard.title }}
          </router-link>
        </td>
        <td align="right">
          {{ thiefBoard.writer }}
        </td>
        <td align="center">
          {{ thiefBoard.regDate }}
        </td>
      </tr>
    </table>
  </div>
</template>

<script>
export default {
  name: "ThiefBoardList",
  props: {
    thiefBoards: {
      type: Array
    }
  }
}
</script>

<style scoped>

</style>