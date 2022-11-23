<template>
  <life-bucket-list :categoryName="categoryName"
                    :currentCategoryBucketList="currentCategoryBucketList"
                    :totalPage="bucketListToTalPageByCategory"
  />
</template>

<script>
import LifeBucketList from "@/components/bucketListKind/LifeBucketList";
import {mapActions, mapState} from "vuex";
export default {
  name: "LifeBucketListView",
  components:{
    LifeBucketList
  },
  computed:{
    ...mapState([
      'currentCategoryBucketList',
      'bucketListToTalPageByCategory'
    ])
  },
  data(){
    return{
      categoryName: '일상',
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