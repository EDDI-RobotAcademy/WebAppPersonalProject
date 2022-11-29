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
      <tr v-if="!gradeUpBoards || (Array.isArray(gradeUpBoards) && gradeUpBoards.length === 0)">
        <td colspan="4">
          현재 등록된 게시물이 없습니다!
        </td>
      </tr>
      <tr v-else v-for="gradeUpBoard in gradeUpBoards" :key="gradeUpBoard.boardNo">
        <td align="center">
          {{ gradeUpBoard.boardNo }}
        </td>
        <td align="left">
          <router-link :to="{ name: 'GradeUpBoardReadView',
                              params: { boardNo: gradeUpBoard.boardNo.toString() }}">
            {{ gradeUpBoard.title }}
          </router-link>
        </td>
        <td align="right">
          {{ gradeUpBoard.writer }}
        </td>
        <td align="center">
          {{ gradeUpBoard.regDate }}
        </td>
      </tr>
    </table>
  </div>
</template>

<script>
export default {
  name: "GradeUpBoardList",
  props: {
    gradeUpBoards: {
      type: Array
    }
  }
}
</script>

<style scoped>

</style>