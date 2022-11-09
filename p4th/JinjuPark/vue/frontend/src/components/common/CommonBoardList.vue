<template>
  <div v-on="$listeners"
       v-bind="$attrs">
<!--  게시판 타이틀 카드-->
  <v-card width="850px" height="300px" class="mb-5">
    <v-img
        class="white--text align-sm-center"
        max-width="850"
        height="200px"
        :src="require(`@/assets/${imgName}`)"
    >
    </v-img>
    <v-card-title>{{boardTitle}}</v-card-title>
    <v-card-subtitle class="mt-1">
      {{boardSubText}}
    </v-card-subtitle>
  </v-card>

  <!--        게시판-->
  <v-card width="850px">
    <v-card-title>
      <v-icon>{{iconName}}</v-icon>
      {{boardSubTitle}}
      <v-spacer></v-spacer>
      <v-text-field
          v-model= "keyword"
          ref="keyword"
          append-icon="mdi-magnify"
          hide-details
          single-line
          :label="searchLabel"
          @click:append="search"
      ></v-text-field>&nbsp;
      <common-button-white btn-name="글쓰기" icon-name="mdi-pencil" @click="register"/>
    </v-card-title>

<!--     게시판 -->
    <v-data-table v-if="!contents || (Array.isArray(contents) && contents.length === 0)"
                       :headers="headerTitle">
    </v-data-table>
    <v-data-table v-else
                  :headers="headerTitle"
                  :items="contents"
                  :items-per-page="10"
                  :mobile="false"
                  class="elevation-1">
    </v-data-table>
  </v-card>
  </div>
</template>

<script>
import {mapActions} from "vuex";

export default {
  name: "CommonBoardList",
  props: {
    imgName: String,
    iconName: String,
    boardTitle: String,
    boardSubText: String,
    boardSubTitle: String,
    searchLabel: String,
    contents: {
      type: Array
    }
  },

  data() {
    return {
      keyword: "",
      headerTitle: [
        {text: '번호', value: 'boardNo', width: "10%", align: "center"},
        {text: '카테고리', value: 'category', width: "15%", align: "center"},
        {text: '제목', value: 'title', width: "30%", align: "center"},
        {text: '작성자', value: 'writer', width: "15%", align: "center"},
        {text: '조회수', value: 'views', width: "15%", align: "center"},
        {text: '추천수', value: 'likes', width: "15%", align: "center"},
      ],
    }
  },
  methods: {
    ...mapActions([
      'requestDiaryBoardListFromSpring'
    ]),
    search() {
      const keyword = this.$refs.keyword.value
      this.requestDiaryBoardListFromSpring(keyword)
    },
    register() {
      if(window.localStorage.getItem('userInfo') != null){
        this.$router.push({name: 'DiaryBoardRegisterView'})
      } else {
       alert("게시글 작성을 위해 로그인해주세요.")
        this.$router.push({name: 'SignInView'})
      }
    }
  }
}
</script>

<style scoped>

</style>