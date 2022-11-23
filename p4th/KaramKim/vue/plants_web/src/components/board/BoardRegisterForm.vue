<template>
  <form @submit.prevent="onSubmit">
    <v-container>
      <common-page-description
        page-name="게시물 작성"
      />
      <div class="mt-10 mb-10" style="width: 630px">
        <v-row>
          <v-col>
            <div>
              <v-select
                  v-model="select"
                  :items="items"
                  item-text="plantName"
                  item-value="abbr"
                  label="식물 종류"
                  color="light-green darken-3"
                  persistent-hint
                  single-line
                  return-object
              />
            </div>
          </v-col>
        </v-row>
        <v-row>
          <v-col>
            <common-text-field
                v-model="title"
                label="제목"
                style="text-align: center"
            />
          </v-col>
        </v-row>

        <v-row>
          <v-col>
            <common-text-field
                :value="writer"
                label="작성자"
                disabled="false"
            />
          </v-col>
        </v-row>
        <v-row>
          <v-col>
            <v-textarea
                label="내용"
                v-model="content"
                height="600px"
                color="light-green darken-3"
                outlined>
            </v-textarea>
          </v-col>
        </v-row>
        <v-row>
          <v-col>
            <common-button
                type="submit"
                btn-name="등록"
                class="mr-3 ml-3"
            />
            <common-button
                btn-name="취소"
                @click="cancel"
                class="mr-3 ml-3"
            />
          </v-col>
        </v-row>
      </div>

    </v-container>
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
      select: '',
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