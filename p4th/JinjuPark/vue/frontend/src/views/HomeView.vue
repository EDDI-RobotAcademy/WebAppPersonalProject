<template>
  <v-container>
    <div id="home">
      <nav>
        <router-link to="/home">Home</router-link> |
        <router-link to="/common-components">공통컴포넌트 테스트</router-link> |
        <router-link to="/sign-up">회원 가입</router-link> |
        <router-link to="/sign-in">로그인</router-link> |
        <router-link to="/main-home-board">메인홈 게시판</router-link> |
        <router-link to="/diary-board-list">운동일기</router-link> |
      </nav>
      <router-view/>
    </div>
  </v-container>
</template>

<script>


  export default {
    name: 'HomeView',

    components: {
    },
  }
</script>
