<template>
  <v-container>
    <v-row>
      <form @submit.prevent="onSubmit">
      <v-col>
        <div class="justify-center">
          <v-card width="850px" height="620px" class="justify-center" style="border-bottom: 4px solid gray; border-top: 4px solid gray" tile>
            <v-card-title class="justify-center">운동 일기</v-card-title>

            <div class="justify-center">
              <table class="readTable" style="margin-left: auto; margin-right: auto;">
                <tr>
                  <th width="100px">제목</th>
                  <td colspan="3" width="400"><input type="text" name="title" v-model="title" style="width:400px;" /></td>
                  <th width="100px">작성자</th>
                  <td><input type="text" name="writer" :value="diaryBoard.writer" disabled></td>
                </tr>
                <tr>
                  <th width="100px">카테고리</th>
                  <td>
                    <input type="text" name="category" :value="diaryBoard.category" disabled/>
                  </td>

                  <th width="100px">공개/비공개</th>
                  <td colspan="3">
                    <input type="text" name="authority" :value="diaryBoard.authority" disabled/>
                  </td>
                </tr>
                <tr>
                  <th width="100px">등록일자</th>
                  <td><input type="text" name="regDate" :value="diaryBoard.regDate" disabled></td>
                  <th width="100px">조회</th>
                  <td>
                    <input type="text" name="views" :value="diaryBoard.views" disabled/>
                  </td>
                  <th width="100px">추천</th>
                  <td>
                    <input type="text" name="likes" :value="diaryBoard.likes" disabled/>
                  </td>

                </tr>
                <tr ><th colspan="6">본문</th></tr>
                <tr>
                  <td colspan="6"><textarea v-model="content" name="content" style="width:840px; height:420px"></textarea></td>
                </tr>
              </table>
            </div>
<!--              <v-card class="mt-3" width="850px" elevation="0">-->
              <div class="mt-5" align ="right">
                <common-button-white btn-name="완료" type="submit"/>
                <common-button-blue btn-name="취소" @click="cancel"/>
              </div>
<!--              </v-card>-->


          </v-card>
        </div>
      </v-col>
    </form>
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
export default {
  name: "DiaryBoardModifyForm",
  props: {
    diaryBoard: {
      type: Object,
      required: true,
    }
  },
  data() {
    return {
      title: '',
      writer: '',
      category: '',
      authority: '',
      regDate: '',
      views: '',
      likes: '',
      content: '',
      noLikes: ''

    }
  },
  created() {
    this.title = this.diaryBoard.title
    this.writer = this.diaryBoard.writer
    this.category = this.diaryBoard.category
    this.authority = this.diaryBoard.authority
    this.regDate = this.diaryBoard.regDate
    this.views = this.diaryBoard.views
    this.likes = this.diaryBoard.likes
    this.content = this.diaryBoard.content
    this.noLikes= this.diaryBoard.noLikes

  },
  methods: {
    onSubmit() {
      const {title, writer, category, authority, regDate, views, likes, noLikes, content } = this
      this.$emit('submit', {title, writer, category, authority, regDate, views, likes, noLikes, content})
    },
    cancel() {
      this.$router.push({
        name: 'DiaryBoardReadView',
        params: {boardNo: this.diaryBoard.boardNo.toString()}
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
  border : none;
  text-align: left;
  border-bottom:  2px solid gray;
  border-collapse : collapse;
  border-radius: 5px;
}
</style>