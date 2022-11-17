<template>
  <v-container>
    <v-layout justify-center style="margin-top: 50px; margin-bottom: 30px">
      <tool-bar-component/>
    </v-layout>
    <v-divider></v-divider>

    <v-layout>
      <div style="margin-top: 20px; margin-left: 30px; margin-bottom: 20px">
        <h5>카테고리 > {{ bucket.bucketCategory }}</h5>
        <h1>{{ bucket.bucketTitle }}</h1>
      </div>
    </v-layout>

    <v-layout justify-end style="margin-top: 20px; margin-right: 20px">
      <div>
        <div v-if="bucket.switchValue === false">
          <h5>글 공개여부: {{ this.switchValueFalse }}</h5>
        </div>
        <div v-else>
          <h5>글 공개여부: {{ this.switchValueTrue }}</h5>
        </div>
      </div>
      <v-spacer></v-spacer>
      <div>
        <h4>
          작성자: {{ bucket.writer }}
        </h4>
      </div>
    </v-layout>
    <div style="margin-top: 50px; margin-bottom: 30px">
      <v-card>
        <v-card-text style="height: 500px">
          <v-img
              height="300px"
              contain
              :src="require(`@/assets/thumbnail/${imgFile.changeFileName}`)"
          >

          </v-img>
          <br/>
          <br/>
          <br/>
          <h2>{{ bucket.bucketContent }}</h2>
        </v-card-text>
      </v-card>
    </div>

    <v-layout justify-end style="margin-top: 10px">
      <div v-if="bucket.writer === this.$store.state.currentUserNickname">
        <v-btn
            rounded elevation="0" color="green lighten-1"
            style="margin-right: 10px"
            :to="{name: 'BucketListModifyView', params: { bucketId: bucket.bucketId.toString() }}"
        >
          수정
        </v-btn>
        <v-btn
            rounded elevation="0" color="green lighten-1">
          삭제
        </v-btn>
      </div>

      <div v-else>
        <v-btn
            rounded elevation="0" color="green lighten-1"
            :to="{name: 'HomeView'}">
          홈으로
        </v-btn>
      </div>
    </v-layout>
  </v-container>
</template>

<script>
import ToolBarComponent from "@/components/common/ToolBarComponent";
import {mapState} from "vuex";

export default {
  name: "BucketListReadForm",
  components: {ToolBarComponent},
  computed: {
    ...mapState([
      'downLoadImgFile'
    ])
  },
  props: {
    bucket: {
      type: Object,
      required: true,
    },
    imgFile: {
      type: Object,
      required: true,
    }
  },
  data(){
    return{
      switchValueTrue: "비공개",
      switchValueFalse: "공개",
    }
  }
}
</script>

<style scoped>

</style>