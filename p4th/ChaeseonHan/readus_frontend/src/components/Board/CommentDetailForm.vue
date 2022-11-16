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



    <v-card-text v-if="isModify == false" class="py-1">
      <div class="pl-6">
        {{ item.comment }}
      </div>
      <div v-if="item.member_id.id === this.$store.state.loginUserProfile.id" class="d-flex justify-end">
        <v-btn class="mr-1" x-small outlined color="#356859" @click="toModifyComment"> 수정 </v-btn>
        <v-btn class="mr-1" x-small outlined color="#356859"> 삭제 </v-btn>
      </div>
    </v-card-text>

    <v-card-text v-if="isModify == true" class="py-1">
      <div class="d-flex">
        <v-textarea style="font-size: small" outlined v-model="modifiedComment"/>
        <v-btn class="ml-2" outlined small color="#356859"> 수정 </v-btn>
      </div>
    </v-card-text>

  </v-card>

</template>

<script>
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
    }
  },
  methods: {
    toModifyComment() {
      this.isModify = true
    }
  },
  created() {
    this.modifiedComment = this.item.comment
  }
}
</script>

<style scoped>

</style>