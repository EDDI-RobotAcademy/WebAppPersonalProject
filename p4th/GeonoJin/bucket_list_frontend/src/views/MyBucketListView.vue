<template>
  <div>
    <my-bucket-list-form @submit="onSubmit"/>
  </div>
</template>

<script>

import MyBucketListForm from "@/components/MyBucketListForm";
import {mapActions} from "vuex";

export default {
  name: "MyBucketListView",
  components:{
    MyBucketListForm
  },
  methods:{
    ...mapActions([
       'CreateBucketListFromSpring'
    ]),
    async onSubmit(payload){
      const {bucketTitle, bucketContent, bucketCategory, file, switchValue} = payload
      console.log({bucketTitle, bucketContent, bucketCategory, file, switchValue})

      await this.CreateBucketListFromSpring(
          {bucketTitle, bucketContent, bucketCategory, file, switchValue})
    }
  }
}
</script>

<style scoped>

</style>