<template>
  <search-form :buckets="searchedBucketList" @search="searching"/>
</template>

<script>

import SearchForm from "@/components/search/SearchForm";
import {mapActions, mapState} from "vuex";
export default {
  name: "SearchView",
  components: {
    SearchForm
  },
  computed: {
    ...mapState([
      'searchedBucketList'
    ]),
  },
  methods:{
    ...mapActions([
        'requestSearchBucketListToSpring'
    ]),
    async searching(payload){
      const searchWord = payload
      await this.requestSearchBucketListToSpring(searchWord)
    }
  }

}
</script>

<style scoped>

</style>