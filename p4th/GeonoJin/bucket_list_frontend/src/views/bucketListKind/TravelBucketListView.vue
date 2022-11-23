<template>
  <travel-bucket-list :categoryName="categoryName"
                      :currentCategoryBucketList="currentCategoryBucketList"
                      :totalPage="bucketListToTalPageByCategory"
  />

</template>

<script>
import TravelBucketList from "@/components/bucketListKind/TravelBucketList";
import {mapActions, mapState} from "vuex";
export default {
  name: "TravelBucketListView",
  components:{
    TravelBucketList
  },
  computed:{
    ...mapState([
      'currentCategoryBucketList',
      'bucketListToTalPageByCategory'
    ])
  },
  data(){
    return{
      categoryName: '여행',
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