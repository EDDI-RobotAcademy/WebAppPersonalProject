<template>
  <div>
    <h3>게시물 목록</h3>
    <table class="boards" border="1">
      <tr>
        <th align="center" width="100">No</th>
        <th align="center" width="640">제목</th>
        <th align="center" width="150">작성자</th>
        <th align="center" width="240">등록일자</th>
      </tr>
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
        <td align="right">
          {{ buyBaramBoard.writer }}
        </td>
        <td align="center">
          {{ buyBaramBoard.regDate }}
        </td>
      </tr>
    </table>
  </div>
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

</style>