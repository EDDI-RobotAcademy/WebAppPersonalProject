<template>
  <v-container>

    <v-row justify="center" class="mt-15 mb-5">
      <v-col cols="12" >
        <!--        <search @search="doSearch" />-->
        <search-form @search="doSearch"/>
      </v-col>
    </v-row>

    <v-row justify="center">
      <v-data-table
          :headers="headerTitle"
          :items="communityBoards"
          :key="communityBoards.communityNo"
          :items-per-page="15"
          class="elevation-1 grey lighten-4"
      >
        <template v-slot:[`item.title`]="{ item }">
          <router-link :to="{ name: 'CommunityReadView',
                                    params: { communityNo: item.communityNo.toString() } }">
            {{ item.title }}
          </router-link>
        </template>
      </v-data-table>
    </v-row>


    <!--등록 버튼-->
    <v-row justify="end">

      <router-link style="text-decoration: none;" :to="{ name:'CommunityRegisterView' }">
        <v-btn class="grey darken-3" dark>
          <v-icon small>mdi-pencil</v-icon> 게시글 등록</v-btn>
      </router-link>

    </v-row>

  </v-container>
</template>

<script>
import SearchForm from "@/components/common/SearchForm";
export default {
  name: "CommunityList",
  components: {SearchForm},
  props: {
    communityBoards: {
      type: Array
    }
  },
  data () {
    return {
      headerTitle: [
        { text:'글 번호', value: 'communityNo', width:'70px'},
        { text:'말머리', value: 'type', width:'70px'},
        { text: '제목', value: 'title', width: "200px" },
        { text: '작성자', value: 'writer', width: "100px" },
        { text: 'date ', value: 'regDate', width: "100px" },
      ],
    }
  },
}
</script>

<style scoped>

.v-data-table {
  width:100%;
  font-family: 'Noto Sans KR', sans-serif;
}
.headerTitle{
  font-size: 20pt;
}
.v-data-table::v-deep th {
  font-size: 14px !important;
}
</style>