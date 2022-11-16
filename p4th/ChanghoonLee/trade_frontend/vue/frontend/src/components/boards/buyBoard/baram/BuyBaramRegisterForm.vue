<template>
  <form @submit.prevent="onSubmit">
    <table class="boards">
      <thead>
      <tr>
        <th scope="cols">
          제목
        </th>
        <th scope="cols">
          <input type="text" v-model.lazy="title">
        </th>
      </tr>
      </thead>
      <tbody>
      <tr>
        <th scope="row">
          작성자
        </th>
        <td>
          <input type="text" v-model.trim="writer">
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
      <button type="submit">등록</button>
      <router-link :to="{ name: 'BuyBaramListView' }">
        취소
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

</style>