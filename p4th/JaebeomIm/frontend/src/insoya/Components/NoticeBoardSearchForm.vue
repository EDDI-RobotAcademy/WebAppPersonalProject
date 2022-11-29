<template xmlns:border="http://www.w3.org/1999/xhtml">
  <form @submit.prevent="onSubmit">
    <table>
      <tr>
        <div style="border: 1px">
        <td>
          <input type="text"  v-model="memberName"/>
          <button type="submit"><v-btn class="teal" rounded>검색</v-btn></button>
        </td>
        </div>
      </tr>
    </table>
  </form>
</template>

<script>
export default {
  name: "NoticeBoardSearchForm",
  data () {
    return {
      memberName: '인소야 닷컴 통합검색',
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

</style>