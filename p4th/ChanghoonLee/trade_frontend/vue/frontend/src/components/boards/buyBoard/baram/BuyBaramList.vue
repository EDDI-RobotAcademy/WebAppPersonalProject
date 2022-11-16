<template>
  <v-container>
    <div>
      <h3>게시물 목록</h3>
      <table class="boards" border="1">
        <thead>
        <tr>
          <th align="center" width="80">No</th>
          <th align="center" width="600">제목</th>
          <th align="center" width="200">작성자</th>
          <th align="center" width="240">등록일자</th>
        </tr>
        </thead>
        <tbody>
        <tr v-if="!buyBaramBoards || (Array.isArray(buyBaramBoards) && buyBaramBoards.length === 0)">
          <td colspan="4">
            현재 등록된 게시물이 없습니다!
          </td>
        </tr>
        <tr v-else v-for="buyBaramBoard in buyBaramBoards" :key="buyBaramBoard.buyBaramNo">
          <td align="center">
            {{ buyBaramBoard.buyBaramNo }}
          </td>
          <td align="left">
            <router-link :to="{ name: 'BuyBaramReadView',
                                params: { buyBaramNo: buyBaramBoard.buyBaramNo.toString() }}">
              {{ buyBaramBoard.title }}
            </router-link>
          </td>
          <td align="left">
            {{ buyBaramBoard.writer }}
          </td>
          <td align="center">
            {{ buyBaramBoard.regDate }}
          </td>
        </tr>
        </tbody>
      </table>
    </div>
  </v-container>
</template>

<script>
export default {
  name: "BuyBaramList",
  props: {
    buyBaramBoards: {
      type: Array
    }
  }
}
</script>

<style scoped>

table.boards {
  border-collapse: collapse;
  text-align: center;
  line-height: 1;
  border: 1px solid #ccc;
  margin: 20px 10px;
}
table.boards thead {
  border-right: 1px solid #ccc;
  border-left: 1px solid #ccc;
  background: darkgrey;
}
table.boards thead th {
  padding: 10px;
  font-weight: bold;
  vertical-align: center;
  border-right: 1px solid #ccc;
  color: #fff;
}
table.boards tbody th {
  padding: 10px;
  font-weight: bold;
  border-bottom: 1px solid #ccc;
  background: #ececec;
}
table.boards td {
  padding: 10px;
  vertical-align: center;
  border-bottom: 1px solid #ccc;
}

a {
  text-decoration: none;
}

</style>