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
      <tr v-if="!tradeBoards || (Array.isArray(tradeBoards) && tradeBoards.length === 0)">
        <td colspan="4">
          현재 등록된 게시물이 없습니다!
        </td>
      </tr>
      <tr v-else v-for="tradeBoard in tradeBoards" :key="tradeBoard.boardNo">
        <td align="center">
          {{ tradeBoard.boardNo }}
        </td>
        <td align="left">
          <router-link :to="{ name: 'TradeBoardReadView',
                              params: { boardNo: tradeBoard.boardNo.toString() }}">
            {{ tradeBoard.title }}
          </router-link>
        </td>
        <td align="right">
          {{ tradeBoard.writer }}
        </td>
        <td align="center">
          {{tradeBoard.regDate }}
        </td>
      </tr>
    </table>
  </div>
</template>

<script>
export default {
  name: "TradeBoardList",
  props: {
    tradeBoards: {
      type: Array
    }
  }
}
</script>

<style scoped>

</style>