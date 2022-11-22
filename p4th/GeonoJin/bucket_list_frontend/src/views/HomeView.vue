<template>
  <all-bucket-list :buckets="bucketList" :totalPage="allBucketListTotalPageValue"/>
</template>
<script>

import cookies from 'vue-cookies';
import Vue from 'vue';
import AllBucketList from "@/components/bucketListKind/AllBucketList";
import {mapActions, mapState} from "vuex";

Vue.use(cookies);

export default {
  name: 'HomeView',
  components: {AllBucketList},
  computed: {
    ...mapState([
      'bucketList',
      'allBucketListTotalPageValue'
    ]),
  },
  async mounted() {
    await this.getBucketListToSpring(1)
    await this.requestAllBucketListTotalPageFromSpring()
  },
  methods: {
    ...mapActions([
      'getBucketListToSpring',
      'requestAllBucketListTotalPageFromSpring'
    ]),
  },
}
</script>
<style scoped>

</style>
