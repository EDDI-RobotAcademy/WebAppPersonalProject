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
  data(){
    return{
      nicknameValue: ''
    }
  },
  async mounted() {
    this.nicknameValue = await this.$store.state.currentUserNickname
  },
  methods:{
    ...mapState([
        'currentUserNickname'
    ])
  }
}
</script>
<style scoped>

</style>
