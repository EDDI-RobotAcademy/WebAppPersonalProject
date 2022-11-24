<template>
  <div>
    <form @submit.prevent="onSubmit">
      <table class="boards">
        <thead>
        <tr>
          <th scope="cols">
            제목
          </th>
          <th scope="cols">
            <input type="text" size="40" v-model="title"
                   placeholder="제목을 입력해 주세요."
                   onfocus="this.placeholder=''"
                   onblur="this.placeholder='제목을 입력해 주세요.'">
          </th>
        </tr>
        </thead>
        <tbody>
        <tr>
          <th scope="row">
            작성자
          </th>
          <td>
            <input type="text" :value="buyDiabloBoard.writer" disabled>
          </td>
        </tr>
        <tr>
          <th scope="row">
            등록일자
          </th>
          <td>
            <input type="text" :value="buyDiabloBoard.regDate" disabled>
          </td>
        </tr>
        <tr>
          <th scope="row">내용</th>
          <td>
          <textarea cols="50" rows="20" v-model="content"
                    placeholder="내용을 입력해 주세요."
                    onfocus="this.placeholder=''"
                    onblur="this.placeholder='내용을 입력해 주세요.'">
          </textarea>
          </td>
        </tr>
        </tbody>
      </table>

      <div>
        <v-btn class="grey white--text" rounded depressed small type="submit">수정 완료</v-btn>&nbsp;
        <router-link :to="{ name: 'BuyDiabloReadView',
                            params: { buyDiabloNo: buyDiabloBoard.buyDiabloNo.toString() } }">
          <v-btn class="grey white--text" rounded depressed small>취소</v-btn>
        </router-link>
      </div>

    </form>
  </div>
</template>

<script>
export default {
  name: "BuyDiabloModify",
  props: {
    buyDiabloBoard: {
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
    this.title = this.buyDiabloBoard.title
    this.writer = this.buyDiabloBoard.writer
    this.content = this.buyDiabloBoard.content
    this.regDate = this.buyDiabloBoard.regDate
  },
  methods: {
    onSubmit () {
      if( this.title && this.content != '') {
        const { title, content, writer, regDate } = this
        this.$emit('submit', { title, content, writer, regDate })
      }
      else {
        alert("빈칸 없이 작성해주세요.")
      }
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