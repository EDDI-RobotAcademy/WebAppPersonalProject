<template>
  <form @submit.prevent="onSubmit">
    <table>
      <tr>
        <td>
          <input type="text" v-model="memberName"/>
        </td>
        <div>
          <button type="submit"><v-btn class="teal" rounded>검색</v-btn></button>
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