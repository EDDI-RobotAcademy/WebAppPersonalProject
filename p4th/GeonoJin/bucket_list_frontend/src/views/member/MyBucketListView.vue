<template>
  <div>
    <my-bucket-list-form :buckets="bucketListByNickname"/>
  </div>
</template>

<script>

import MyBucketListForm from "@/components/myBucketList/MyBucketListForm";
import {mapActions, mapState} from "vuex";

export default {
  name: "MyBucketListView",
  components: {
    MyBucketListForm
  },
  computed:{
    ...mapState([
        'currentUserNickname',
        'bucketListByNickname'
    ])
  },
  props:{
    userNickname:{
      type: String,
      required: true
    }
  },
  methods:{
    ...mapActions([
        'requestMyBucketListToSpring'
    ])
  },
  async mounted() {
    await this.requestMyBucketListToSpring(this.userNickname)
  }
}
</script>

<style scoped>

</style>