<template>
  <all-bucket-list :nicknameValue="nicknameValue"/>
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
  data() {
    return {
      nicknameValue: ''
    }
  },
  async mounted() {
    let replacedUserValue

    const currentUserValue = localStorage.getItem('userInfo');


    if (currentUserValue != null) {
      replacedUserValue = currentUserValue.replaceAll("\"", "")
      await this.requestCurrentUserNickNameFromSpring({replacedUserValue});
      this.nicknameValue = this.$store.state.currentUserNickname
    }
  },
  methods: {
    ...mapState([
      'currentUserNickname'
    ]),
    ...mapActions([
      'requestCurrentUserNickNameFromSpring'
    ]),
  }
}
</script>
<style scoped>

</style>
