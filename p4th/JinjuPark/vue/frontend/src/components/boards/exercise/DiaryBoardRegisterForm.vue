<template>
  <v-container>
    <v-row>

      <v-col>
        <div class="justify-center">
          <v-card width="850px" height="600px" class="justify-center">
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
                      <label><input type="radio" v-model="category" name="category" value="운동일기" required> 운동일기</label>&nbsp;&nbsp;&nbsp;
                      <label><input type="radio" v-model="category" name="category" value="자유게시판"> 자유게시판</label>&nbsp;&nbsp;&nbsp;
                      <label><input type="radio" v-model="category" name="category" value="질문게시판"> 질문게시판</label>
                    </td>
                    <th width="100px">공개/비공개</th>
                    <td>
                      <label><input type="radio" v-model="authority" name="authority" value="공개" required> 공개</label>&nbsp;&nbsp;
                      <label><input type="radio" v-model="authority" name="authority" value="비공개"> 비공개</label>
                    </td>
                  </tr>
                  <tr>
                    <th>내용</th>
                    <td colspan="3"><textarea v-model="content" name="content" style="width:700px; height:400px"></textarea></td>
                  </tr>
                </table>
                <div style="float:right;margin-right: 20px">
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
      // writer: "",
      content: '',
      category: '',
      authority:'',
      writerToken: ''
    }
  },
  methods:{
    async onSubmit () {
      this.writerToken = localStorage.getItem('userInfo')
      const { title, category, authority, content, writerToken } = this
      await this.$emit('submit', {  title, category, authority, content, writerToken })
      console.log('운동일기 게시물 등록- registerform')
    },
    cancel(){
      this.$router.push({
        name: 'DiaryBoardListView'
      })
    }
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
  background-color: aliceblue;
}

td {
  border : 1px solid gray;
  text-align: center;
  border-collapse : separate;
  border-radius: 5px;
}
</style>