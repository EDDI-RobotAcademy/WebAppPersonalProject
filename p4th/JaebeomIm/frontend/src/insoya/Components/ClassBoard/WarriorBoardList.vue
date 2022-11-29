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
      <tr v-if="!warriorBoards || (Array.isArray(warriorBoards) && warriorBoards.length === 0)">
        <td colspan="4">
          현재 등록된 게시물이 없습니다!
        </td>
      </tr>
      <tr v-else v-for="warriorBoard in warriorBoards" :key="warriorBoard.boardNo">
        <td align="center">
          {{ warriorBoard.boardNo }}
        </td>
        <td align="left">
          <router-link :to="{ name: 'WarriorBoardReadView',
                              params: { boardNo: warriorBoard.boardNo.toString() }}">
            {{ warriorBoard.title }}
          </router-link>
        </td>
        <td align="right">
          {{ warriorBoard.writer }}
        </td>
        <td align="center">
          {{ warriorBoard.regDate }}
        </td>
      </tr>
    </table>
  </div>
</template>

<script>
export default {
  name: "WarriorBoardList",
  props: {
    warriorBoards: {
      type: Array
    }
  }
}
</script>

<style scoped>

</style>