<template>
  <div>
    <form @submit.prevent="onSubmit">


      <table>
        <tr>
          <td> NO. </td>
          <td>
            <input type="text" :value="board.boardNo" disabled size="20" style="width: 100%">
          </td>
        </tr>
        <tr>
          <td> TITLE </td>
          <td>
            <input type="text" v-model="title" size="20" style="width: 100%">
          </td>
        </tr>
        <tr>
          <td> WRITER </td>
          <td>
            <input type="text" :value="board.writer" disabled>
          </td>
        </tr>
        <tr>
          <td> DATE </td>
          <td>
            <input type="text" :value="board.regDate" disabled>
          </td>
        </tr>
        <tr>
          <td> CONTENTS </td>
          <td>
            <textarea cols="50" rows="20" v-model="content">
            </textarea>
          </td>
        </tr>
      </table>

      <br><br><br>
      <div style="float: right" >
        <v-icon>mdi-note-edit</v-icon>
        <button type="submit"  style="color: burlywood" > Upload</button>


        <v-icon>mdi-arrow-left</v-icon>
        <router-link :to="{ name: 'JpaBoardReadView',
                            params: { boardNo: board.boardNo.toString() } } " style="color: burlywood">
          Back
        </router-link>
      </div>

    </form>
  </div>
</template>

<script>
export default {
  name: "JpaBoardModifyForm",
  props: {
    board: {
      type: Object,
      required: true,
    }
  },
  data () {
    return {
      title: '',
      content: '',
      writer: '',
      regDate: '',
    }
  },
  created () {
    this.title = this.board.title
    this.writer = this.board.writer
    this.content = this.board.content
    this.regDate = this.board.regDate
  },
  methods: {
    onSubmit () {
      const { title, content, writer, regDate } = this
      this.$emit('submit', { title, content, writer, regDate })
    }
  }
}
</script>
<style scoped>


table, th, td {
  border: 1px solid #bcbcbc;
  color: #FFECB3;

}

table {

  margin-left: auto;
  margin-right: auto;
  table-layout: fixed;

}

table, tr, td {
  text-align: center;

}


</style>