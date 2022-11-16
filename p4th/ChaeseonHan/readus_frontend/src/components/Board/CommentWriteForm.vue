<template>
  <v-card elevation="0" class="px-10 py-1" color="#e1f0eb">
    <v-card-text>
      <div style="font-size: small">
        <v-icon small class="mr-1">
          mdi-check
        </v-icon>
        댓글 작성
      </div>
    </v-card-text>

    <!-- 작성창 -->
    <!-- v-if="this.$store.state.isAuthenticated == true" -->

    <div v-if="this.$store.state.isAuthenticated == true" class="d-flex">
      <v-textarea outlined/>
      <v-btn class="ml-2" outlined small color="#356859">
          등록
      </v-btn>
    </div>


    <!-- 로그인 안되어있을 시 로그인 화면으로 안내내 -->

    <div v-else class="d-flex justify-center pb-5" style="font-size: medium">
      댓글 작성은&nbsp; <router-link to="/sign-in"> 로그인 </router-link> &nbsp;후에 가능합니다
    </div>

  </v-card>
</template>

<script>
export default {
  name: "CommentWriteForm",
  props: {
    boardNo: {
      type: String,
      required: true,
    },
  }
}
</script>

<style scoped>

</style>