<template>
  <v-container>
    <common-community-category-buttons/>
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

        <tr v-else v-for="board in boardList" :key="board.boardNo">
          <td align="center">
            {{ board.boardNo }}
          </td>

          <td align="center">
            {{ board.category }}
          </td>

          <td align="left">
            <router-link class="a" :to="{ name: 'BoardReadView',
                                params: { boardNo : board.boardNo.toString() }}">
              {{ board.title }}
            </router-link>
          </td>

          <td align="center">
            {{ board.writer }}
          </td>

          <td align="center">
            {{ board.createdDate }}
          </td>
        </tr>

      </table>
    </div>
    

<!-- 밑 버튼 -->

    <div class="d-flex justify-end">
<!--      <v-pagination
          class="mt-1"
          color="#356859"
          total-visible="6"
          :value="1"
          :length="9"/>-->
      <v-btn small outlined class="mt-3" color="#356859" @click="toWrite"> 글쓰기 </v-btn>
    </div>
  </v-container>
</template>

<script>
import CommonCommunityCategoryButtons from "@/components/common/CommonCommunityCategoryButtons";
export default {
  name: "CommonBoardList",
  components: {CommonCommunityCategoryButtons},
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



a:link {
  color : #000000;
  text-decoration: none;
}
a:visited {
  color : #53a48e;
  text-decoration: none;
}
a:hover {
  color : #356859;
  text-decoration: underline;
  font-weight: bold;
}
a:active {
  color : #356859;
  text-decoration: none;
}


</style>