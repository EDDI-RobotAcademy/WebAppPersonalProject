<template>
  <v-container>
    <div style="font-family: '210 M고딕 060'">
      <v-row justify="center">
        <v-col cols="12" style="padding-bottom: 90px">
          <v-card elevation="0" color="white">
            <!-- 제목 -->
            <v-card-text class="px-12 py-5">
              <div style="font-size: large" class="d-flex font-weight-bold">
                {{ board.title }}
              </div>
            </v-card-text>

            <!-- 작성자 및 날짜 데이터 -->
            <v-card elevation="0" color="#e1f0eb">
              <v-card-text class="px-12 py-2">
                <div class="d-flex justify-space-between" style="font-size: small">
                  <div>
                    <table>
                      <tr>
                        <td class="pr-4">
                          <v-icon small class="pr-1">
                            mdi-account-edit </v-icon>
                          {{ board.writer }} ( {{ board.member_id.email}} )
                        </td>
                        <td>
                          <v-icon small class="pr-1">
                            mdi-clock-edit
                          </v-icon>
                          {{ board.updatedDate }}
                        </td>
                      </tr>
                    </table>
                  </div>
                  <div>
                    <v-icon small class="pr-1">
                      mdi-chat-processing
                    </v-icon>
                    {{ board.comments.length }}
                  </div>
                </div>
              </v-card-text>
            </v-card>

            <!-- 본문 -->

            <v-card-text class="px-12 py-9">
              {{ board.contents }}
            </v-card-text>

            <!-- 작성자 버튼 -->

            <div class="d-flex justify-end px-12 py-5" v-if="board.member_id.id == this.$store.state.loginUserProfile.id">
              <v-btn color="#356859" class="mr-1" outlined small @click="toModify"> 수정 </v-btn>
              <v-btn color="#356859" outlined small @click="toDelete"> 삭제 </v-btn>
            </div>

          </v-card>

          <!-- 댓글 리스트 및 수정 -->
          <comment-list-form :comments="this.board.comments"/>

          <!-- 댓글 작성 -->
          <comment-write-form :board-no="this.board.boardNo"/>

        </v-col>
      </v-row>
    </div>
  </v-container>
</template>

<script>
import {mapActions} from "vuex";
import CommentListForm from "@/components/Board/CommentListForm";
import CommentWriteForm from "@/components/Board/CommentWriteForm";

export default {
  name: "BoardReadForm",
  components: {CommentWriteForm, CommentListForm},
  props: {
    board: {
      type: Object,
      required: true,
    },
  },
  data() {
    return {
      testBoard: {
        comment: []
      },
    }
  },
  methods: {
    ...mapActions(['requestDeleteBoardToSpring']),
    toModify() {
      this.$router.push( {
        name: "BoardModifyView",
        params: { boardNo : this.board.boardNo.toString() }
      })
    },

    async toDelete() {
      await this.requestDeleteBoardToSpring(this.board.boardNo)
      await this.$router.push("/community")
    }
  },
}
</script>

<style scoped>

.title text{
  font-weight: bold;
  font-size: x-large;
}

</style>