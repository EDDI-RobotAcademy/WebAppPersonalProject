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

</style>