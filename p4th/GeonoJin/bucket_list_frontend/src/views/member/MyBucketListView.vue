<template>
  <div>
    <my-bucket-list-form :buckets="bucketListByNickname" :currentUserNickname="userNickname"/>
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
  data() {
    return{
      pageValue: 1
    }
  },
  methods:{
    ...mapActions([
        'requestMyBucketListToSpring'
    ])
  },
  async mounted() {
    const pageValue = this.pageValue
    const userNickname = this.userNickname
    await this.requestMyBucketListToSpring({userNickname, pageValue})
  }
}
</script>

<style scoped>

</style>