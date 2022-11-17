<template>
  <v-card elevation="0" class="pb-3 pt-2">
    <v-card-text style="font-size: small">
      <div class="d-flex justify-space-between" style="font-size: small">
        <div>
          <table>
            <tr>
            </tr>
            <tr>
              <td class="pr-4">
                <v-icon small class="pr-1">
                  mdi-comment-account
                </v-icon>
                {{ item.writer }} ( {{ item.member_id.email }} )
                <v-icon v-if="item.member_id.id === this.$store.state.loginUserProfile.id" small class="pr-1">
                  mdi-check
                </v-icon>
              </td>
            </tr>
          </table>
        </div>

        <div>
          <v-icon small class="pl-3 pr-1">
            mdi-clock-edit
          </v-icon>
          {{ item.createdDate }}
        </div>
      </div>
    </v-card-text>

    <!-- 읽기 -->

    <v-card-text v-if="isModify == false" class="py-1">
      <div class="pl-6">
        {{ item.comment }}
      </div>
      <div v-if="item.member_id.id === this.$store.state.loginUserProfile.id" class="d-flex justify-end">
        <v-btn class="mr-1" x-small outlined color="#356859" @click="toModifyComment"> 수정 </v-btn>
        <v-btn class="mr-1" x-small outlined color="#356859" @click="deleteComment"> 삭제 </v-btn>
      </div>
    </v-card-text>

    <!-- 수정 -->
    <v-card-text v-if="isModify == true" class="py-1">
      <v-form v-if="isModify == true" @submit="submitModifiedComment" ref="form">
        <div class="d-flex" style="font-size: small">
          <v-textarea style="font-size: small" outlined v-model="modifiedComment" :disabled="false"/>
          <div class="d-flex flex-column">
            <v-btn type="submit" class="ml-2" outlined small color="#356859"> 등록 </v-btn>
            <v-btn class="ml-2 mt-1" outlined small color="#356859" @click="toModifyComment"> 취소 </v-btn>
          </div>
        </div>
      </v-form>
    </v-card-text>

  </v-card>

</template>

<script>
import {mapActions} from "vuex";

export default {
  name: "CommentDetailForm",
  props: {
   item: {
     type: Object,
    },
  },
  data() {
    return {
      isModify: false,
      modifiedComment: "",
      commentNo: "",
    }
  },
  methods: {
    ...mapActions(['requestDeleteCommentAtBoardToSpring']),
    toModifyComment() {
      if(this.isModify == true){
        this.isModify = false
      } else {
        this.isModify = true
      }
    },

    submitModifiedComment() {
      this.commentNo = this.item.commentNo
      const { commentNo, modifiedComment } = this
      this.$emit("submit", { commentNo, modifiedComment })
      this.isModify = false
    },

    async deleteComment() {
      await this.requestDeleteCommentAtBoardToSpring( this.item.commentNo )
      await this.$router.go()
    }

  }, // methods
  created() {
    this.modifiedComment = this.item.comment
  }
}
</script>

<style scoped>

</style>