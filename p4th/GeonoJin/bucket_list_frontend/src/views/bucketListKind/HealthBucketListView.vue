<template>
  <health-bucket-list :categoryName="categoryName"
                      :currentCategoryBucketList="currentCategoryBucketList"
                      :totalPage="bucketListToTalPageByCategory"
  />
</template>

<script>
import HealthBucketList from "@/components/bucketListKind/HealthBucketList";
import {mapActions, mapState} from "vuex";
export default {
  name: "CookBucketListView",
  components: {HealthBucketList},
  computed:{
    ...mapState([
      'currentCategoryBucketList',
      'bucketListToTalPageByCategory'
    ])
  },
  data(){
    return {
      categoryName: '헬스',
      pageValue: 1
    }
  },
  methods:{
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