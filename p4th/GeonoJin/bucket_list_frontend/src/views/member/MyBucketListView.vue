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
  methods:{
    ...mapActions([
        'requestMyBucketListToSpring'
    ])
  },
  async mounted() {
    const userNickname = this.$store.state.currentUserNickname
    await this.requestMyBucketListToSpring(userNickname)
  }
}
</script>

<style scoped>

</style>