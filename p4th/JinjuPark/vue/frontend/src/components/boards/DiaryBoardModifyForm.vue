<template>
  <v-container>
    <v-row>
      <form @submit.prevent="onSubmit">
      <v-col>
        <div class="justify-center">
          <v-card width="850px" height="auto" class="justify-center" style="border-bottom: 4px solid gray; border-top: 4px solid gray" tile>
            <v-card-title class="justify-center">운동 일기</v-card-title>

            <div class="justify-center">
              <table class="readTable" style="margin-left: auto; margin-right: auto;">
                <tr>
                  <th width="100px">제목</th>
                  <td colspan="3" width="400"><input type="text" name="title" v-model="title" style="width:400px;" /></td>
                  <th width="100px">작성자</th>
                  <td><input type="text" name="writer" :value="diaryBoard.member.nickname" disabled></td>
                </tr>
                <tr>
                  <th width="100px">카테고리</th>
                  <td>
                    <input type="text" name="category" :value="diaryBoard.category.categoryName" disabled/>
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
                <tr v-show="this.$store.state.diaryImages.length > 0" style="border-bottom: none">
                  <td class="imageTd" colspan="6">
                    <v-img v-for="(image, idx) in this.$store.state.diaryImages" :key="idx" :src="require(`@/assets/uploadImgs/${image}`)"
                           max-width="750px" contain style="margin-left: auto; margin-right: auto; display: block;" />
                  </td>
                </tr>
                <tr>
                  <td colspan="6"><textarea class="autosize" v-model="content" name="content" style="width:840px; "></textarea></td>
                </tr>
              </table>
            </div>
<!--              <v-card class="mt-3" width="850px" elevation="0">-->
              <div class="mt-5 mr-3 mb-5" align ="right">
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
import {mapState} from "vuex";

export default {
  name: "DiaryBoardModifyForm",
  props: {
    diaryBoard: {
      type: Object,
      required: true,
    }
  },
  computed: {
    ...mapState(['diaryImages'])
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
    this.writer = this.diaryBoard.member.nickname
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
      const {title, content } = this
      this.$emit('submit', {title, content})
    },
    // onSubmit() {
    //   const {title, category, authority, regDate, views, likes, noLikes, content } = this
    //   this.$emit('submit', {title, member, category, authority, regDate, views, likes, noLikes, content})
    // },
    cancel() {
      this.$router.push({
        name: 'DiaryBoardReadView',
        params: {boardNo: this.diaryBoard.boardNo.toString()}
      })
    },
    resize(obj) {
      obj.style.height = "1px";
      obj.style.height = (12+obj.scrollHeight)+"px";
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
  background-color: #ECEFF1;
}

td {
  border : none;
  text-align: left;
  border-bottom:  2px solid gray;
  border-collapse : collapse;
  border-radius: 5px;
}
td.imageTd{
  border-bottom:none;
  text-align: center;
}

textarea.autosize { min-height: 200px; }
</style>