<template>
  <v-container>
    <div style="font-family: '210 M고딕 060'">
      <v-row justify="center">
        <v-col cols="12" style="padding-bottom: 90px">
          <v-card elevation="0" color="white">
            <!-- 제목 -->
            <v-card-text class="px-12 py-5">
              <div style="font-size: large" class="d-flex font-weight-bold">
                {{ board.title}}
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
                          {{ board.writer }}
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
                    <v-icon class="pr-1">
                      mdi-chat-processing
                    </v-icon>
                    {{ testBoard.comment.length }}
                  </div>
                </div>
              </v-card-text>
            </v-card>

            <v-card-text class="px-12 py-9">
              {{ board.contents }}
            </v-card-text>
          </v-card>
        </v-col>
      </v-row>
    </div>
  </v-container>
</template>

<script>
export default {
  name: "BoardReadForm",
  props: {
    board: {
      type: Object,
      required: true,
    },
  },
  data() {
    return {
      testBoard: {
        boardNo: "1",
        title: "안녕하세요",
        contents: "흐아아아아압",
        writer: "젤리",
        updatedDate: "2022.10.23",
        comment: ["1", "2"]
      }
    }
  }
}
</script>

<style scoped>

.basic {
  font-family: "210 M고딕 060";
}
.title text{
  font-weight: bold;
  font-size: x-large;
}

</style>