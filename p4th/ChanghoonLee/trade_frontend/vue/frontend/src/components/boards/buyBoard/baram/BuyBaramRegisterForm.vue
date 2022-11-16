<template>
  <form @submit.prevent="onSubmit">
    <table class="boards">
      <thead>
      <tr>
        <th scope="cols">
          제목
        </th>
        <th scope="cols">
          <input type="text" v-model="title">
        </th>
      </tr>
      </thead>
      <tbody>
      <tr>
        <th scope="row">
          작성자
        </th>
        <td>
          <input type="text" v-model="writer">
        </td>
      </tr>
      <tr>
        <th scope="row">내용</th>
        <td>
          <textarea cols="50" rows="20" v-model="content">
          </textarea>
        </td>
      </tr>
      </tbody>
    </table>
    <div>
      <v-btn class="grey white--text" rounded depressed small type="submit">등록</v-btn>&nbsp;
      <router-link :to="{ name: 'BuyBaramListView' }">
        <v-btn class="grey white--text" rounded depressed small>취소</v-btn>
      </router-link>
    </div>
  </form>
</template>

<script>
export default {
  name: "BuyBaramRegisterForm",
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

table.boards {
  border-collapse: collapse;
  text-align: left;
  line-height: 1.5;
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
  vertical-align: top;
  border-right: 1px solid #ccc;
  color: #fff;
}
table.boards tbody th {
  width: 150px;
  padding: 10px;
  font-weight: bold;
  vertical-align: top;

  border-bottom: 1px solid #ccc;
  background: #ececec;
}
table.boards td {
  width: 350px;
  padding: 10px;
  vertical-align: top;
  border-bottom: 1px solid #ccc;
}

a {
  text-decoration: none;
}

</style>