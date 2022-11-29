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
      <tr v-if="!archerBoards || (Array.isArray(archerBoards) && archerBoards.length === 0)">
        <td colspan="4">
          현재 등록된 게시물이 없습니다!
        </td>
      </tr>
      <tr v-else v-for="archerBoard in archerBoards" :key="archerBoard.boardNo">
        <td align="center">
          {{ archerBoard.boardNo }}
        </td>
        <td align="left">
          <router-link :to="{ name: 'ArcherBoardReadView',
                              params: { boardNo: archerBoard.boardNo.toString() }}">
            {{ archerBoard.title }}
          </router-link>
        </td>
        <td align="right">
          {{ archerBoard.writer }}
        </td>
        <td align="center">
          {{archerBoard.regDate }}
        </td>
      </tr>
    </table>
  </div>
</template>

<script>
export default {
  name: "ArcherBoardList",
  props: {
    archerBoards: {
      type: Array
    }
  }

}
</script>

<style scoped>

</style>