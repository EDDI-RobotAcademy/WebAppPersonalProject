<template>
  <v-container>
    <!-- v-slot 기본 사용법(네임드 슬롯)
하위컴포넌트)  <slot name="슬롯네임"> 포함 내용</slot> -> 여기 하위에서 보낼 데이터는 하위컴포넌트 data() 등에서 가지고 있는 값
상위컴포넌트)  <template v-slot:슬롯네임> </template>  -> 여기서 template 태그 외에 커스텀 태그도 적용 가능
-->
  <div>
    <common-main-menu-template/>
    <common-image-card
        imgName="re_home_winter_banner.png"/>
    <free-board-list :diaryBoards="diaryBoards"
                      :router-name="routerName"
                      :page-no="pageNo"/>
     <common-footer-template/>
  </div>
  </v-container>
</template>
<script>
import {mapActions, mapState} from "vuex";
import CommonImageCard from "@/components/common/CommonImageCard";
import FreeBoardList from "@/components/boards/FreeBoardList";

export default {
  name: "DiaryBoardListView",
  components:{
    CommonImageCard,
    FreeBoardList
  },
  computed: {
    ...mapState([
        'diaryBoards',
    ]),
  },
  data(){
    return{
      pageNo : 2,
      keyword:"",
      routerName : "DiaryBoardReadView",
    }
  },
  mounted() {
    const pageNo = this.pageNo
    const keyword = this.keyword
    this.requestDiaryBoardListFromSpring({pageNo, keyword})
  },
  methods: {
    ...mapActions([
        'requestDiaryBoardListFromSpring',
    ]),
  }
}
</script>

<style scoped>

</style>