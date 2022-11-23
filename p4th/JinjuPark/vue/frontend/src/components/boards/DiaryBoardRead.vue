<template>
  <v-container>
    <v-row>
      <v-col>
        <div class="justify-center">
          <v-card style="border-bottom: 4px solid gray; border-top: 4px solid gray" tile>
            <v-card-title class="justify-center" >운동 일기<v-icon>mdi-pen</v-icon></v-card-title>
          </v-card>
          <v-card width="850px" height="auto" class="justify-center">
            <div class="justify-center">
                <table class="readTableTitle" style="margin-left: auto; margin-right: auto; border-bottom:4px solid gray ">
                  <tr>
                    <th width="100px">제목</th>
                    <td colspan="3" width="400"><input type="text" name="title" :value="diaryBoard.title" style="width:400px;" readonly /></td>
                    <th width="100px">조회</th>
                    <td>
                      <input type="text" name="views" :value="diaryBoard.views" style="text-align: center" readonly/>
                    </td>
                  </tr>
                  <tr>
                    <th width="100px">작성자</th>
                    <td><input type="text" name="writer" :value="diaryBoard.member.nickname" style="text-align: center" readonly></td>
                    <th width="100px">공개/비공개</th>
                    <td>
                      <input type="text" name="authority" :value="diaryBoard.authority" style="text-align: center" readonly/>
                    </td>
                    <th width="100px">등록일자</th>
                    <td><input type="text" name="regDate" :value="diaryBoard.regDate" readonly></td>
                  </tr>
                </table>
              <table class="readTableContent" style="margin-left: auto; margin-right: auto; border-bottom:4px solid gray">
                <tr v-show="this.$store.state.diaryImages.length > 0" style="border-bottom: none">
                  <td class="imageTd">
                    <v-img v-for="(image, idx) in this.$store.state.diaryImages" :key="idx" :src="require(`@/assets/uploadImgs/${image}`)"
                     max-width="750px" contain style="margin-left: auto; margin-right: auto; display: block;" />
                  </td>
                </tr>
                  <tr>
                    <td><textarea class="autosize" onkeydown="resize(this)" onkeyup="resize(this)" name="content" :value="diaryBoard.content" style="width:840px;" readonly></textarea></td>
                  </tr>
                </table>
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
import {mapState} from "vuex";

export default {
  name: "DiaryBoardRead",
  props:{
    diaryBoard:{
      type: Object,
      required: true,
    }
  },
  computed: {
    ...mapState(['diaryImages'])
  },
  methods:{
    resize(obj) {
      obj.style.height = "1px";
      obj.style.height = (12+obj.scrollHeight)+"px";
    }
  }
}
</script>

<style scoped>
table {
  border : 2px solid gray;
  text-align: center;
  border-collapse : separate;
}
th {
  border-bottom:  2px solid gray;
  border-right:  2px solid gray;
  text-align: center;
  border-collapse : separate;

}

td {
  border : none;
  border-right:  2px solid gray;
  border-bottom:  2px solid gray;
  border-collapse : collapse;

}

td.imageTd{
  border-bottom:none;
  text-align: center;
}

textarea.autosize { min-height: 400px; }
</style>