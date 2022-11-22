<template>
  <cook-bucket-list :categoryName="categoryName" :currentCategoryBucketList="currentCategoryBucketList"/>
</template>

<script>
import CookBucketList from "@/components/bucketListKind/CookBucketList";
import {mapActions, mapState} from "vuex";

export default {
  name: "CookBucketListView",
  components: {CookBucketList},
  computed: {
    ...mapState([
      'currentCategoryBucketList'
    ])
  },
  data() {
    return {
      categoryName: '요리',
      pageValue: 1
    }
  },
  methods: {
    ...mapActions([
      'getCurrentBucketListCategory'
    ])
  },
  async mounted() {
    const {categoryName, pageValue} = this
    await this.getCurrentBucketListCategory({categoryName, pageValue})
  }
}
</script>

<style scoped>

</style>