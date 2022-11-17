<template>
  <v-card elevation="0">
    <v-card elevation="0" color="#e1f0eb">
      <v-card-text class="px-12 py-4" style="font-size: small">
        <v-icon small class="pr-1">
          mdi-chat-processing
        </v-icon>
        {{ comments.length }} 개의 댓글이 달렸습니다.
      </v-card-text>
    </v-card>

    <!-- 각각 게시글 -->
      <comment-detail-form
          class="px-8"
          v-for="item in comments"
          :key="item.commentNo"
          :item="item"
          @submit="submitModifiedComment"/>

  </v-card>
</template>

<script>
import CommentDetailForm from "@/components/Board/CommentDetailForm";
import {mapActions} from "vuex";
export default {
  name: "CommentListForm",
  components: {CommentDetailForm},
  props: {
    comments: {
      type: Array,
      required: true,
    }
  },
  methods: {
    ...mapActions(['requestModifyCommentAtBoardToSpring']),
    async submitModifiedComment(payload) {
      const { commentNo, modifiedComment } = payload
      await this.requestModifyCommentAtBoardToSpring( { commentNo, modifiedComment })
    }
  }
}
</script>

<style scoped>

</style>