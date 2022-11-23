<template>
  <div>
    <my-bucket-list-form :buckets="bucketListByNickname"
                         :currentUserNickname="userNickname"
                         :totalPage="myBucketListTotalPage"
    />
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
  computed: {
    ...mapState([
      'currentUserNickname',
      'bucketListByNickname',
      'myBucketListTotalPage'
    ])
  },
  props: {
    userNickname: {
      type: String,
      required: true
    }
  },
  data() {
    return {
      pageValue: 1
    }
  },
  methods: {
    ...mapActions([
      'requestMyBucketListToSpring',
      'requestBucketListByCurrentUserNicknamePerPageFromSpring'

    ])
  },
  async mounted() {
    const pageValue = this.pageValue
    const userNickname = this.userNickname
    await this.requestMyBucketListToSpring({userNickname, pageValue})
    await this.requestBucketListByCurrentUserNicknamePerPageFromSpring(userNickname)

  }
}
</script>

<style scoped>

</style>