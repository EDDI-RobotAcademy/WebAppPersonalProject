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
      <tr v-if="!mageBoards || (Array.isArray(mageBoards) && mageBoards.length === 0)">
        <td colspan="4">
          현재 등록된 게시물이 없습니다!
        </td>
      </tr>
      <tr v-else v-for="mageBoard in mageBoards" :key="mageBoard.boardNo">
        <td align="center">
          {{ mageBoard.boardNo }}
        </td>
        <td align="left">
          <router-link :to="{ name: 'MageBoardReadView',
                              params: { boardNo: mageBoard.boardNo.toString() }}">
            {{ mageBoard.title }}
          </router-link>
        </td>
        <td align="right">
          {{ mageBoard.writer }}
        </td>
        <td align="center">
          {{ mageBoard.regDate }}
        </td>
      </tr>
    </table>
  </div>
</template>

<script>
export default {
  name: "MageBoardList",
  props: {
    mageBoards: {
      type: Array
    }
  }
}
</script>

<style scoped>

</style>