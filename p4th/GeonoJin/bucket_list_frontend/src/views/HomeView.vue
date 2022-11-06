<template>
  <all-bucket-list :nicknameValue="nicknameValue"/>
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
  data() {
    return {
      nicknameValue: ''
    }
  },
  mounted() {
    this.nicknameValue = this.$store.state.currentUserNickname
    console.log("닉네임: " + this.nicknameValue)
  },
  methods: {
    ...mapState([
      'currentUserNickname'
    ])
  }
}
</script>
<style scoped>

</style>
