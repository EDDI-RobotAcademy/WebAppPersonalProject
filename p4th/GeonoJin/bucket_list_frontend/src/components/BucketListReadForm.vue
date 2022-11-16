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
      <h4>{{ bucket.writer }}</h4>
    </v-layout>
    <div style="margin-top: 50px; margin-bottom: 30px">
      <v-card>
        <v-card-text style="height: 500px">
          <v-img
              height="300px"
              contain
          >

          </v-img>

          <br/>
          <br/>
          <br/>
          <h2>{{ bucket.bucketContent }}</h2>
        </v-card-text>
      </v-card>
    </div>


    <v-divider></v-divider>
    <v-layout justify-end style="margin-top: 10px">
      <div v-if="bucket.writer === this.$store.state.currentUserNickname">
        <v-btn
            rounded elevation="0" color="green lighten-1"
            style="margin-right: 10px"
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

export default {
  name: "BucketListReadForm",
  components: {ToolBarComponent},
  props: {
    bucket: {
      type: Object,
      required: true,
    },
    imgFile:{
      type: Object,
      required: true,
    }
  },
  mounted() {
    console.log(this.imgFile.changeFileName)
  }
}
</script>

<style scoped>

</style>