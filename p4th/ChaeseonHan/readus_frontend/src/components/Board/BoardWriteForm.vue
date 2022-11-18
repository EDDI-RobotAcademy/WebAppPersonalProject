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
                      :rules="this.category_rule"
                      @change="this.categoryValidation"
                      :items="selectCategory"/>
                  <v-text-field
                      class="col-9"
                      background-color="white"
                      v-model="title"
                      label="제목 *"
                      outlined
                      filled
                      :rules="this.title_rule"
                      @change="this.titleValidation"
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
                  <v-btn class="mx-1" type="submit" elevation="0" color="#356859" outlined small :disabled="this.title_pass == false || this.category_pass == false">
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
  name: "BoardWriteForm",
  data() {
    return{
      memberEmail: "",

      selectCategory: ["정보", "리뷰", "일상"],
      category: "",
      title: "",
      contents: "",

      category_pass: false,
      category_rule: [
        v => !!v || '분류를 선택하세요.',
      ],

      title_pass: false,
      title_rule: [
        v => !!v || '제목을 입력해주세요.',
      ],
    }
  }, // data
  methods: {

    onSubmit() {
      console.log("onSubmit - write board")
      this.memberEmail = this.$store.state.loginUserProfile.email

      const { category, title, contents, memberEmail } = this
      this.$emit("submit", { category, title, contents, memberEmail })

    },

    goBack() {
      this.$router.go(-1)
    },

    categoryValidation() {
      if(this.category.length != 0){
        this.category_pass = true
      }
    },

    titleValidation() {
      if(this.title.length != 0){
        this.title_pass = true
      }
    },

  }, //methods
}
</script>

<style>

</style>