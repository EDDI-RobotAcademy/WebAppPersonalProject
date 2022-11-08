<template>
  <all-bucket-list/>
</template>
<script>

import cookies from 'vue-cookies';
import Vue from 'vue';
import AllBucketList from "@/components/bucketListKind/AllBucketList";
import {mapState} from "vuex";

Vue.use(cookies);

export default {
  name: 'HomeView',
  components: {AllBucketList},

  methods: {
    ...mapState([
      'currentUserNickname'
    ]),
  }
}
</script>
<style scoped>

</style>
