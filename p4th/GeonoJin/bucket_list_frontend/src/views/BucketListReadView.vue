<template>
  <div>
    <v-container>
      <bucket-list-read-form v-if="bucket" :bucket="bucket"
                             :imgFile="downLoadImgFile"
      />
      <v-layout justify-end>


      </v-layout>
    </v-container>
  </div>
</template>

<script>
import BucketListReadForm from "@/components/BucketListReadForm";
import {mapActions, mapState} from "vuex";

export default {
  name: "BucketListReadView",
  components: {
    BucketListReadForm
  },
  computed: {
    ...mapState([
        'bucket',
        'downLoadImgFile'
    ])
  },
  props: {
    bucketId: {
      type: String,
      required: true
    }
  },
  methods: {
    ...mapActions([
      'requestBucketFromSpring',
      'downLoadImgFileToSpring'
    ])
  },
  async mounted() {
    this.requestBucketFromSpring(this.bucketId)
    await this.downLoadImgFileToSpring(this.bucketId)
  }
}
</script>

<style scoped>

</style>