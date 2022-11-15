<template>
  <div>
    <my-bucket-list-form/>
  </div>
</template>

<script>

import MyBucketListForm from "@/components/MyBucketListForm";

export default {
  name: "MyBucketListView",
  components: {
    MyBucketListForm
  },
  data(){
    return{
      file: ''
    }
  },
}
</script>

<style scoped>

</style>