<template>
  <form @submit.prevent="onSubmit">
    <table>
      <tr>
        <div style="border: 1px">
        <td>
          <input type="text" v-model="memberName"/>
          <button type="submit"><v-btn class="teal" rounded>검색</v-btn></button>
        </td>
        </div><br/>



      </tr>
    </table>
  </form>
</template>

<script>
export default {
  name: "NoticeBoardSearchForm2",
  data () {
    return {
      memberName: '게시판 내 검색',
    }
  },
  methods: {
    onSubmit () {
      const { memberName } = this
      this.$emit('submit', { memberName })
    }
  }
}
</script>

<style scoped>
.right box {
  float: right;
}
</style>