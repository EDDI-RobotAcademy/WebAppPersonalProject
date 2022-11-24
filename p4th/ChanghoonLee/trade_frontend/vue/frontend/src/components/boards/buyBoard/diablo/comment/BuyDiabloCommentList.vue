<template>
  <v-container>
    <table class="boards" v-if="!buyDiabloComments || (Array.isArray(buyDiabloComments) && buyDiabloComments.length === 0)">
      현재 등록된 댓글이 없습니다!
    </table>
    <table class="boards" v-else v-for="buyDiabloComment in buyDiabloComments" :key="buyDiabloComment.buyDiabloCommentNo"
        style="border: solid thin">
      <thead>
      <tr align="left">
        &nbsp;&nbsp;{{ buyDiabloComment.commentWriter }}
      </tr>
      </thead>
      <tbody>
      <tr align="left">
        &nbsp;&nbsp;{{ buyDiabloComment.comment }}
      </tr>
      </tbody>
    </table>
  </v-container>
</template>

<script>
export default {
  name: "BuyDiabloCommentList",
  data() {
    return {
      commentWriter: this.$store.state.loginEmail,
    }
  },
  props: {
    buyDiabloComments: {
      type: Array
    },
    buyDiabloCommentNo: {
      type: String,
      required: true
    }
  }
}
</script>

<style scoped>

table.boards {
  text-align: left;
  line-height: 1.5;
  border: 1px solid;
  width: 570px;
  table-layout: fixed;

}
table.boards thead {
  background: darkgrey;
  font-weight: bold;
}



</style>