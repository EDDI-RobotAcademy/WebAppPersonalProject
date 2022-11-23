<template>
  <v-container>
    <form @submit="onSubmitRegister()">
      <table>
        <tbody>
        <br>
        <tr>
          <th scope="row">
            {{ commentWriter }}
          </th>
          &nbsp;&nbsp;&nbsp;
          <td>
          <textarea style="border: solid thin"
                    cols="60" rows="3" v-model="comment"
                    placeholder="내용을 입력해 주세요."
                    onfocus="this.placeholder=''"
                    onblur="this.placeholder='내용을 입력해 주세요.'">>
          </textarea>
          </td> &nbsp;&nbsp;&nbsp;&nbsp;
          <td>
            <v-btn width="100" height="70" rounded type="submit">
              등록하기
            </v-btn>
          </td>
        </tr>
        </tbody>
      </table>
    </form>
  </v-container>
</template>

<script>

export default {
  name: "BuyBaramComment",
  data() {
    return {
      comment: '',
      commentWriter: this.$store.state.loginEmail
    }
  },
  methods: {
    onSubmitRegister() {
      this.commentWriter = this.$store.state.loginEmail
      if (this.comment != '') {
        const { comment, commentWriter } = this
        this.$emit('submit', { comment, commentWriter })
      } else {
        alert("빈칸 없이 작성해주세요.")
      }
    },

  }
}
</script>

<style scoped>

</style>