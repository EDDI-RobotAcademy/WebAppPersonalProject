<template>
  <v-container>
    <v-row>

      <v-col>
        <div class="justify-center">
          <v-card width="850px" height="auto" class="justify-center" style="border-bottom: 4px solid gray; border-top: 4px solid gray" tile>
            <v-card-title class="justify-center">게시판 등록</v-card-title>

            <div class="justify-center">
              <form @submit.prevent="onSubmit">
                <table class="registerTable" style="margin-left: auto; margin-right: auto;">
                  <tr>
                    <th width="100px">제목</th>
                    <td colspan="3"><input type="text" v-model="title" name="title" style="width:700px;" /></td>
                  </tr>
                  <tr>
                    <th width="100px">카테고리</th>
                    <td>
                      <label><input type="radio" v-model="category" name="category" value="1" required> 운동일기</label>&nbsp;&nbsp;&nbsp;
                      <label><input type="radio" v-model="category" name="category" value="2"> 자유게시판</label>&nbsp;&nbsp;&nbsp;
                      <label><input type="radio" v-model="category" name="category" value="3"> 질문게시판</label>
                    </td>
                    <th width="100px">공개/비공개</th>
                    <td>
                      <label><input type="radio" v-model="authority" name="authority" value="공개" required> 공개</label>&nbsp;&nbsp;
                      <label><input type="radio" v-model="authority" name="authority" value="비공개"> 비공개</label>
                    </td>
                  </tr>
                  <tr ><th colspan="4">본문</th></tr>
<!--                  사진 미리보기 기능-->
                  <tr v-show="this.uploadPreImageUrl.length > 0" style="border-bottom: none">
                    <td colspan="4" class="imageTd" >
                      <v-img v-for="(image, idx) in this.uploadPreImageUrl" :key="idx" :src="image.url"
                             max-width="750px" contain style="margin-left: auto; margin-right: auto; display: block;" />
                    </td>
                  </tr>
<!--            끝          -->
                  <tr>
                    <td colspan="4"><textarea v-model="content" name="content" style="width:840px; height:400px"></textarea></td>
                  </tr>
                </table>
<!--  이미지 파일첨부 추가-->
                <div class="mt-5 mb-5 ml-3">
                  <label>Files
                    <input type="file" id="files" ref="files"
                           multiple v-on:change="handleFileUpload"/>
                  </label>
                </div>
<!--          끝         -->
                <div class="mt-3" style="float:right;margin-right: 20px">
                  <common-button-white btn-name="취소" @click="cancel"/>
                  <common-button-blue type="submit" btn-name="등록"/>
                </div>

              </form>
            </div>

          </v-card>
          </div>
      </v-col>

        <v-col>
          <!--        마이페이지-->
          <common-my-text-field/>
          <!--      사이드 배너-->
          <common-side-banner/>
        </v-col>

    </v-row>

  </v-container>

</template>


<script>
import CommonMyTextField from "@/components/common/CommonMyTextField";
import CommonSideBanner from "@/components/common/CommonSideBanner";
import axios from "axios";

export default {
  name: "DiaryBoardRegisterForm",
  components:{
    CommonMyTextField,
    CommonSideBanner,
  },
  mounted() {
    },
  data(){
    return{
      boardTitle: '게시글 등록',
      boardSubText : '게시글을 작성해주세요',
      title: '',
      content: '',
      category: '',
      authority:'',
      writerToken: '',
      files: '',
      uploadPreImageUrl:[],
    }
  },
  methods:{
    handleFileUpload () {
      this.files = this.$refs.files.files
//사진 미리보기 기능
      if(!this.files.length == 0){
        for (let idx = 0; idx < this.files.length; idx++) {
          const reader = new FileReader()
          reader.onload = (e) => {
            this.uploadPreImageUrl.push({url: e.target.result})
          }
          reader.readAsDataURL(this.files[idx])
        }
      }
    },
    async onSubmit () {
      this.writerToken = localStorage.getItem('userInfo')
      console.log('운동일기 게시물 등록- registerform')

      //파일 업로드한 경우
      if(!this.files.length == 0){
        let formData = new FormData()

        for (let idx = 0; idx < this.files.length; idx++) {
            console.log("파일리스트 반복문:"+idx)
            formData.append('fileList', this.files[idx])
        }

        let boardContents = {
          title: this.title,
          category: this.category,
          authority: this.authority,
          content:this.content,
          writerToken: this.writerToken
        }

        formData.append(
            "info",
            new Blob([JSON.stringify(boardContents)], { type: "application/json" })
        )
        await axios.post('http://localhost:7777/hometwang/boards/diary/registerWithFiles', formData)
            .then (res => {
              alert(res.data)
            })
            .catch(res => {
              alert(res.message)
            })

     //파일 업로드 하지 않은 경우
      } else{
        const { title, category, authority, content, writerToken } = this
        await this.$emit('submit', { title, category, authority, content, writerToken})

      }

     // 글 등록완료 후-> 게시글 카테고리 선택에 따라 이동경로 적용
        if(this.category == 1){
          await this.$router.push({ name: 'DiaryBoardListView' })
        }else if (this.category == 2){
          await this.$router.push({ name: 'FreeBoardListView' })
        } else if (this.category == 3){
          await this.$router.push({ name: 'QNABoardListView' })
        } else{
          await this.$router.push({ name: 'AllBoardListView' })
        }

    },
    cancel(){
      this.$router.push({
        name: 'AllBoardListView'
      })
    },

  }
}
</script>

<style scoped>


table {
  border : 1px solid gray;
  text-align: center;
  border-collapse : separate;
  border-radius: 5px;
}
th {
  border : 1px solid gray;
  text-align: center;
  border-collapse : separate;
  border-radius: 5px;
  background-color: #ECEFF1;
}

td {
  border : 1px solid gray;
  text-align: center;
  border-collapse : separate;
  border-radius: 5px;
}
td.imageTd{
  border-bottom:none;
  text-align: center;
}
</style>