<template>
  <cook-bucket-list :categoryName="categoryName"
                    :currentCategoryBucketList="currentCategoryBucketList"
                    :totalPage="bucketListToTalPageByCategory"
  />
</template>

<script>
import CookBucketList from "@/components/bucketListKind/CookBucketList";
import {mapActions, mapState} from "vuex";

export default {
  name: "CookBucketListView",
  components: {CookBucketList},
  computed: {
    ...mapState([
      'currentCategoryBucketList',
      'bucketListToTalPageByCategory'
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
      'getCurrentBucketListCategory',
      'requestBucketListTotalPageByCategoryFromSpring'
    ])
  },
  async mounted() {
    const {categoryName, pageValue} = this
    await this.getCurrentBucketListCategory({categoryName, pageValue})
    await this.requestBucketListTotalPageByCategoryFromSpring(this.categoryName)
  }
}
</script>

<style scoped>

</style>