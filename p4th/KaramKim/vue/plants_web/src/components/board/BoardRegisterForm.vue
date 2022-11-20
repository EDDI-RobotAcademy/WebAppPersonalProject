<template>
  <form @submit.prevent="onSubmit">
    <!-- 이미지 넣기 !!!!!!!!!!!!! -->
    <!-- 식물 종류 dropdown -->

    <table width="460" height="500">
      <tr>
        <td>식물 종류</td>
        <td>
          <v-select
              v-model="select"
              :items="items"
              item-text="plantName"
              item-value="abbr"
              label="식물 종류"
              persistent-hint
              single-line
              return-object
          />
        </td>
      </tr>
      <tr>
        <td>
          <common-text-field
              v-model="title"
              label="제목"
          />
        </td>
      </tr>
      <tr>
        <td>
          <common-text-field
              :value="writer"
              label="작성자"
              readonly
          />
        </td>
      </tr>
      <tr>
        <td>
          <v-textarea outlined v-model="content"/>
        </td>
      </tr>
    </table>

    <div>
      <common-button
          type="submit"
          btn-name="등록"
      />
      <common-button
          btn-name="취소"
          @click="cancel"
      />
    </div>
  </form>
</template>

<script>
export default {
  name: "BoardRegisterForm",
  data() {
    return {
      title: '',
      writer: '',
      content: '',
      dropItems: [
        {title: '종류1'},
        {title: '종류2'},
        {title: '종류3'},
      ],
      select: {
        plantName: '몬스테라', abbr: 'ML'
      },
      items: [
        {plantName: '몬스테라'},
        {plantName: '스투키'},
        {plantName: '아이비'},
        {plantName: '호프셀렘'},
        {plantName: '보스톤 고라시'},
      ],
    }
  },
  methods: {
    onSubmit() {
      const {title, writer, content} = this
      this.$emit('submit', {title, writer, content})
    },
    cancel() {
      this.$router.push({name: 'QuestionBoardListView'})
    },
  }
}
</script>

<style scoped>

</style>