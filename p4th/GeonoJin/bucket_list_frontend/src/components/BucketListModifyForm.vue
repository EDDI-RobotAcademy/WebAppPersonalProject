<template>
  <div>
    <v-container class="myBucketHeader">
      <v-layout>
        <tool-bar-component/>
      </v-layout>
      <div style="padding-top: 40px">
        <v-divider></v-divider>
      </div>
    </v-container>

    <v-container>
      <div align="end">
        <v-card>
          <v-card-title style="padding-bottom: 30px; padding-top: 30px">
            <span class="text-h5 font-weight-bold">버킷리스트 수정</span>
          </v-card-title>

          <v-divider style="padding-bottom: 10px"></v-divider>

          <v-card-text>
            <v-row justify="center">
              <v-col>
                <v-form @submit.prevent="onSubmit">

                  <v-layout justify-end>
                    <v-switch
                        v-model="switchValue"
                        :label="switchValue ? switchValueTrue : switchValueFalse"
                    />
                  </v-layout>

                  <div style="padding-bottom: 10px">
                    <v-autocomplete
                        v-model="bucketCategory"
                        :items="categoryItems"
                        dense
                        outlined
                        filled
                        rounded-xl
                        style="width: 250px"
                    />
                  </div>

                  <div class="d-flex">
                    <v-text-field v-model="bucketTitle" color="teal"
                                  outlined
                                  placeholder="제목을 입력하세요"
                    />
                  </div>

                  <div class="d-flex">
                    <v-textarea v-model="bucketContent" outlined
                                auto-grow
                    />
                  </div>

                  <v-layout justify-end>
                    <div style="padding-right: 10px">
                      <v-btn
                          rounded
                          elevation="0"
                          color="green lighten-2"
                          style="padding-right: 10px"
                      >
                        취소
                      </v-btn>
                    </div>
                    <div>
                      <v-btn
                          type="submit"
                          rounded
                          elevation="0"
                          color="green lighten-2"
                      >
                        수정
                      </v-btn>
                    </div>
                  </v-layout>
                </v-form>
              </v-col>
            </v-row>
          </v-card-text>
        </v-card>
      </div>
    </v-container>
  </div>
</template>

<script>

import ToolBarComponent from "@/components/common/ToolBarComponent";
export default {
  name: "BucketListModifyForm",
  components:{
    ToolBarComponent
  },
  props:{
    bucket:{
      type: Object,
      required: true
    }
  },
  data(){
    return{
      bucketCategory: '',
      switchValue: false,
      switchValueTrue: "비공개",
      switchValueFalse: "공개",
      bucketTitle: '',
      bucketContent: '',
      categoryItems: ['일상', '요리', '여행', '자기개발', '건강'],
      writer: ''
    }
  },
  created() {
    this.bucketCategory = this.bucket.bucketCategory
    this.switchValue = this.bucket.switchValue
    this.bucketTitle = this.bucket.bucketTitle
    this.bucketContent = this.bucket.bucketContent
    this.writer = this.bucket.writer
  },
  methods:{
    onSubmit(){
      const {bucketTitle, bucketContent, switchValue, bucketCategory, writer} = this
      this.$emit('submit', {bucketTitle, bucketContent, switchValue, bucketCategory, writer})
    }
  }
}
</script>

<style scoped>
.myBucketHeader {
  padding-top: 50px;
}
</style>