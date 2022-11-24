<template>
  <v-container>
    <table class="boards" v-if="!sellDiabloComments || (Array.isArray(sellDiabloComments) && sellDiabloComments.length === 0)">
      현재 등록된 댓글이 없습니다!
    </table>
    <table class="boards" v-else v-for="sellDiabloComment in sellDiabloComments" :key="sellDiabloComment.sellDiabloCommentNo"
        style="border: solid thin">
      <thead>
      <tr align="left">
        &nbsp;&nbsp;{{ sellDiabloComment.commentWriter }}
      </tr>
      </thead>
      <tbody>
      <tr align="left">
        &nbsp;&nbsp;{{ sellDiabloComment.comment }}
      </tr>
      </tbody>
    </table>
  </v-container>
</template>

<script>
export default {
  name: "SellDiabloCommentList",
  data() {
    return {
      commentWriter: this.$store.state.loginEmail,
    }
  },
  props: {
    sellDiabloComments: {
      type: Array
    },
    sellDiabloCommentNo: {
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