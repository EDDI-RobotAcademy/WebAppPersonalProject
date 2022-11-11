<template>
  <v-container>
    <div>
      <table style="height: min-content" class="greentop">

        <tr>
          <th align="center" width="90">No</th>
          <th align="center" width="80">분류</th>
          <th align="center" width="660">제목</th>
          <th align="center" width="140">작성자</th>
          <th align="center" width="130">날짜</th>
        </tr>

        <tr v-if="!boardList || (Array.isArray(boardList) && boardList.length === 0)">
          <td align="center" colspan="12">
            현재 등록된 게시글이  없습니다!
          </td>
        </tr>

        <tr v-else v-for="community_board in boardList" :key="community_board.boardNo">
          <td align="center">
            {{ community_board.boardNo }}
          </td>

          <td align="center">
            {{ community_board.title }}
          </td>

          <td align="left">
<!--            <router-link :to="{ name: 'ProductBoardReadView',
            params: { boardNo : board.boardNo.toString() }}">-->
              {{ community_board.title }}
<!--            </router-link>-->
          </td>

          <td align="center">
            {{ community_board.writer }}
          </td>

          <td align="center">
            {{ community_board.createdDate }}
          </td>
        </tr>

      </table>
    </div>
    

<!--    <v-pagination
        class="elevation-0"
        color="#356859"
        total-visible="6"
        v-model="pageNumber"
        :value="currentPageNumber"
        :length="numOfPages"/>-->
    <div class="d-flex justify-end">
      <v-btn small outlined class="mt-3" @click="toWrite"> 글쓰기 </v-btn>
    </div>
  </v-container>
</template>

<script>
export default {
  name: "BoardList",
  props: {
    boardList: {
      type: Array,
    }
  }, // props
  data() {
    return{

    }
  },
  methods: {
    toWrite() {
      this.$router.push("/community/write")
    }
  }
}
</script>

<style scoped>

.greentop {
  border-collapse: collapse;
  border-top: 3px solid #356859;
  font-size: small;
}
.greentop th {
  color: #356859;
  background: #e1f0eb;
}
.greentop th, .greentop td {
  padding: 10px;
  border: 1px solid #ddd;
}
.greentop th:first-child, .greentop td:first-child {
  border-left: 0;
}
.greentop th:last-child, .greentop td:last-child {
  border-right: 0;
}
.greentop tr:hover td{
  color: #23463b
}


</style>