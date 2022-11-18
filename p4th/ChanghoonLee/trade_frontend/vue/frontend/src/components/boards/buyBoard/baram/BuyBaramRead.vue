<template>
  <div>
    <table class="boards">
      <thead>
      <tr>
        <th scope="cols">
          제목
        </th>
        <th scope="cols">
          <input type="text" :value="buyBaramBoard.title" readonly>
        </th>
      </tr>
      </thead>
      <tbody>
      <tr>
        <th scope="row">
          작성자
        </th>
        <td>
          <input type="text" :value="buyBaramBoard.writer" readonly>
        </td>
      </tr>
      <tr>
        <th scope="row">
          등록일자
        </th>
        <td>
          <input type="text" :value="buyBaramBoard.regDate" readonly>
        </td>
      </tr>
      <tr>
        <th scope="row">내용</th>
        <td>
          <textarea cols="50" rows="20" :value="buyBaramBoard.content" readonly>
          </textarea>
        </td>
      </tr>
      </tbody>
    </table>
  </div>
</template>

<script>
export default {
  name: "BuyBaramRead",
  props: {
    buyBaramBoard: {
      type: Object,
      required: true,
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

</style>