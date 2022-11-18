<template>
  <bucket-list-modify-form :bucket="bucket" @submit="onSubmit"/>
</template>

<script>
import BucketListModifyForm from "@/components/BucketListModifyForm";
import {mapActions, mapState} from "vuex";

export default {
  name: "BucketListModifyView",
  components: {BucketListModifyForm},
  props: {
    bucketId: {
      type: String,
      require: true
    }
  },
  computed: {
    ...mapState([
      'bucket'
    ])
  },
  methods: {
    ...mapActions([
      'requestBucketFromSpring',
      'requestBucketListModifyToSpring'
    ]),
    async onSubmit(payload) {
      const {bucketTitle, bucketContent, switchValue, bucketCategory, writer} = payload
      const bucketId = this.bucketId
      await this.requestBucketListModifyToSpring({bucketId, bucketTitle, bucketContent, switchValue, bucketCategory, writer})
      await this.$router.push({
        name: 'BucketListReadView',
        params: {bucketId: this.bucketId}
      })
    }
  },
  created() {
    this.requestBucketFromSpring(this.bucketId)
  }
}
</script>

<style scoped>

</style>