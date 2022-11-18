<template>
  <all-bucket-list :buckets="bucketList"/>
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
        'bucketList'
    ]),
  },
  async mounted() {
    await this.getBucketListToSpring()
  },
  methods: {
    ...mapActions([
      'getBucketListToSpring'
    ])
  },
}
</script>
<style scoped>

</style>
