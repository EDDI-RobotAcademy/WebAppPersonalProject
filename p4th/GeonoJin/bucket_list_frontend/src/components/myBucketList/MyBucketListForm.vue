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
      <v-layout>
        <h2 style="margin-left: 20px">마이버킷</h2>
      </v-layout>
      <div align="end" style="margin-top: 50px">
        <v-dialog
            v-model="dialog"
            persistent
            max-width="800px"
        >
          <template v-slot:activator="{on, attrs}">
            <v-btn rounded color="green lighten-2" elevation="0"
                   v-bind="attrs"
                   v-on="on"
            >
              <h4>버킷 작성</h4>
            </v-btn>
          </template>

          <v-card>
            <v-card-title style="padding-bottom: 30px; padding-top: 30px">
              <span class="text-h5 font-weight-bold">버킷리스트를 작성해보세요!</span>
            </v-card-title>

            <v-divider style="padding-bottom: 10px"></v-divider>

            <v-card-text>
              <v-row justify="center">
                <v-col>
                  <v-form @submit="onSubmit">

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
                          placeholder="카테고리를 선택해주세요"
                      />
                    </div>

                    <div class="d-flex">
                      <v-text-field v-model="bucketTitle" color="teal"
                                    outlined
                                    placeholder="제목을 입력하세요"/>
                    </div>

                    <div class="d-flex">
                      <v-textarea v-model="bucketContent" outlined :placeholder="this.placeholderText"
                                  auto-grow
                      />
                    </div>

                    <div class="d-flex">
                      <div>
                        <input type="file"
                               id="file"
                               ref="file"
                               accept="image/png, image/jpeg, image/jpg"
                               @change="fileUpload"
                        >
                        <input/>
                      </div>
                    </div>
                    <div>
                      <h5 class="font-weight-bold">커버이미지를 선택해주세요</h5>
                    </div>

                    <v-layout justify-end>
                      <div style="padding-right: 10px">
                        <v-btn
                            @click="dialog = false"
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
                            @click="dialog = false"
                            rounded
                            elevation="0"
                            color="green lighten-2"
                        >
                          저장
                        </v-btn>
                      </div>
                    </v-layout>
                  </v-form>
                </v-col>
              </v-row>
            </v-card-text>
          </v-card>
        </v-dialog>
      </div>
      <v-layout justify-center style="margin-top: 100px">
        <div>
          <v-row class="ma-auto">
            <div v-if="!buckets || (Array.isArray(buckets) && buckets.length === 0)"
                 style="margin-top: 200px"
            >
              <h3>현재 등록된 버킷리스트가 없습니다.</h3>
            </div>
            <v-card
                v-else
                v-for="bucket in buckets" :key="bucket.bucketId"
                max-width="250"
                class="ma-5"
                v-show="bucket.switchValue === false"
            >
              <router-link :to="{name: 'BucketListReadView',
            params: { bucketId: bucket.bucketId.toString() }}"
                           style="text-decoration: none"
              >
                <v-img
                    src="@/assets/thumbnail/기본이미지.jpg"
                    class="white--text align-end"
                    gradient="to bottom, rgba(0,0,0,.1), rgba(0,0,0,.5)"
                    height="200px"
                    contain
                >
                  <v-card-title v-text="bucket.bucketTitle"></v-card-title>
                </v-img>
              </router-link>
            </v-card>
          </v-row>
        </div>
      </v-layout>
    </v-container>
  </div>

</template>

<script>
import ToolBarComponent from "@/components/common/ToolBarComponent";
import axios from "axios";

export default {
  name: "MyBucketList",
  components: {
    ToolBarComponent,
  },
  props:{
    buckets:{
      type: Array
    }
  },
  data() {
    return {
      dialog: false,
      bucketTitle: '',
      bucketContent: '',
      placeholderText: '버킷리스트 내용을 입력해주세요',
      fileInputPlaceholderText: '커버사진을 선택하세요',
      categoryItems: ['일상', '요리', '여행', '자기 개발', '헬스'],
      bucketCategory: '',
      files: '',
      switchValue: false,
      switchValueTrue: "비공개",
      switchValueFalse: "공개",
      currentWriter: ''
    }
  },
  methods: {
    fileUpload() {
      this.files = this.$refs.file.files
    },
    async onSubmit() {
      let formData = new FormData()
      let fileInfo = {
        bucketTitle: this.bucketTitle,
        bucketContent: this.bucketContent,
        bucketCategory: this.bucketCategory,
        switchValue: this.switchValue,
        currentWriter: this.$store.state.currentUserNickname
      }
      for (let idx = 0; idx < this.files.length; idx++) {
        formData.append('fileList', this.files[idx])
      }
      formData.append(
          "info",
          new Blob([JSON.stringify(fileInfo)], { type: "application/json" })
      )
      await axios.post('http://localhost:7777/bucket/register', formData)
          .then(() => {
            alert("버킷 등록 완료")
            this.$router.push({name: 'HomeView'})
          })
          .catch(() => {
            alert("버킷 등록 실패")
          });

    },
  }
}
</script>

<style scoped>
.myBucketHeader {
  padding-top: 50px;
}

</style>