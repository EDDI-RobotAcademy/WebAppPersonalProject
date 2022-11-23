<template>

  <div>
    <div class="text"> 게시글 작성</div>
    <br>
    <p></p><br>


    <form @submit.prevent="onSubmit">
      <table>
        <tr>

          <th> TITLE </th>
          <td>
            <input type="text" v-model="title" size="20" style="width:100%; border: 0;">

          </td>

        </tr>
        <tr>
          <th> WRITER </th>
          <td>
            <input type="text" v-model="writer" size="10" style="width:100%; border: 0;">
          </td>
        </tr>
        <tr>
          <th>  CONTENTS  </th>
          <td>
          <textarea cols="100" rows="20" v-model="content">
          </textarea>
          </td>
        </tr>
      </table>
<br><br>

      <FileUploadButton/>



      <br><br><br><br><br>

      <div style="float:right">
        <v-icon>mdi-arrow-left</v-icon>
        <router-link :to="{ name: 'JpaBoardListView' }" style="color: burlywood">
          Back
        </router-link>
      </div>


      <div style="float:right">
        <v-icon>mdi-note-edit</v-icon>
        <button type="submit" style="color: burlywood"> Upload </button>
      </div>

    </form>

  </div>
</template>

<script>
import FileUploadButton from "@/components/common/button/FileUploadButton";

export default {
  name: "JpaBoardRegisterForm",
  components: {
    FileUploadButton,



  },
  data () {
    return {
      title: '',
      writer: '',
      content: '',
    }
  },
  methods: {
    onSubmit () {
      const { title, writer, content } = this
      this.$emit('submit', { title, writer, content })
    }
  }
}
</script>


<style scoped>

.text {
  font-size: 45px;
  text-align: center;
  color: #FFECB3;
}

table, th, td {
  border: 1px solid #bcbcbc;
  color: #FFECB3;

}

table {

  margin-left: auto;
  margin-right: auto;
  table-layout: fixed;

}

table, td {
  text-align: center;

}


</style>