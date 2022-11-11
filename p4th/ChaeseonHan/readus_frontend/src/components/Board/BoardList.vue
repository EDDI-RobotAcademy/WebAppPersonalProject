<template>
  <v-data-table :headers="headerTitle"
                :items="contents"
                class="elevation-1">
  </v-data-table>

  <!-- 게시판별 검색 텍스트필드 추가 -->
</template>

<script>
export default {
  name: "BoardList",
  data() {
    return {
      headerTitle: [
        { text: '번호', value: 'boardNo', width: "70px" },
        { text: '제목', value: 'title', width: "200px" },
        { text: '작성자', value: 'writer', width: "60px" },
        { text: '등록시간', value: '', width: "100px"}
      ],
      contents: [
        { boardNo: 1, title: '야호', writer: 'jelly', content: '안녕하세요' },
        { boardNo: 2, title: '야호', writer: 'jelly', content: '안녕하세요' },
        { boardNo: 3, title: '야호', writer: 'jelly', content: '안녕하세요' },
        { boardNo: 4, title: '야호', writer: 'jelly', content: '안녕하세요' },
        { boardNo: 5, title: '야호', writer: 'jelly', content: '안녕하세요' },
        { boardNo: 6, title: '야호야호', writer: '헐랭', content: 'ㅇㅋ' },
        { boardNo: 7, title: 'ㅇㅋ', writer: 'ㄷㅋ', content: 'ㅇㅋㄷㅋ' },
        { boardNo: 8, title: '준비', writer: '냠', content: 'ㅁㄴㅇㄻㄴㅇㅁㅍㅎㅁㄴㅇㄹ' },
        { boardNo: 9, title: '으잉', writer: 'dopfdnc@gmail.com', content: 'ㅁㄴㅇㄻㄴㅇㅁㅍㅎㅁㄴㅇㄹ' },
        { boardNo: 10, title: '힘들어', writer: 'ㄷㅋ', content: '자고싶다' },
        { boardNo: 11, title: '아이고피곤해', writer: 'ㄷㅋ', content: '10시간쯤...' },
        { boardNo: 12, title: '찾아요', writer: '미식', content: '어디가맛집' },
        { boardNo: 13, title: '야호', writer: '호이', content: '으아아앜' },
        { boardNo: 14, title: '야호', writer: '호이', content: '으아아앜' },
        { boardNo: 15, title: '야호', writer: '구미젤리', content: '으아아앜' },
      ],
    }
  }
}
</script>

<style scoped>

</style>