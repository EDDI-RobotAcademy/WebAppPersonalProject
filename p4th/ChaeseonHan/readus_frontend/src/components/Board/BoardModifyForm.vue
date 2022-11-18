<template>
  <v-container>
    <div style="font-family: Arial">
      <v-row justify="center">
        <v-col cols="12" style="padding-bottom: 90px">
          <v-card elevation="0" style="background-color: #e1f0eb">
            <v-card-text class="text-subtitle-2 text-center px-12 py-8">
              <v-form @submit.prevent="onSubmit" ref="form">

                <div class="d-flex justify-end text-sm-caption">
                  * 는 필수 입력 사항입니다.</div>

                <div class="d-flex">
                  <v-select
                      background-color="white"
                      v-model="category"
                      label="카테고리 *"
                      outlined
                      :items="selectCategory"/>
                  <v-text-field
                      class="col-9"
                      background-color="white"
                      v-model="title"
                      label="제목 *"
                      outlined
                      filled
                      :rules="this.title_rule"
                      :disabled="false"/>
                </div>

                <div class="d-flex">
                  <v-textarea
                      background-color="white"
                      v-model="contents"
                      label="본문"
                      outlined
                      filled
                      height="500px"
                      :disabled="false"/>
                </div>

                <div class="d-flex justify-center">
                  <v-btn class="mx-1" elevation="0" color="#356859" outlined small @click="goBack">
                    {{ "취소" }}
                  </v-btn>
                  <v-btn class="mx-1" type="submit" elevation="0" color="#356859" outlined small :disabled=false>
                    {{ "등록" }}
                  </v-btn>
                </div>

              </v-form>
            </v-card-text>
          </v-card>
        </v-col>

      </v-row>
    </div>
  </v-container>

</template>

<script>
export default {
  name: "BoardModifyForm",
  props: {
    board: {
      type: Object,
      required: true,
    }
  },
  data() {
    return {

      selectCategory: ["정보", "리뷰", "일상"],
      category: "",
      title: "",
      contents: "",

      title_pass: false,
      title_rule: [
        v => !!v || '제목을 입력해주세요.',
      ],
    }
  },
  methods: {
    onSubmit() {

      if(this.title.length == 0) {
        alert("제목은 비어있을 수 없습니다!")
      } else {
        const { category, title, contents } = this
        this.$emit("submit", { category, title, contents})
      }
    },

    goBack() {
      this.$router.push( { name: "BoardReadView", params: { boardNo: this.board.boardNo.toString() } })
    },
  },

  created() {
    this.category = this.board.category
    this.title = this.board.title
    this.contents = this.board.contents
  },
}
</script>

<style scoped>

</style>