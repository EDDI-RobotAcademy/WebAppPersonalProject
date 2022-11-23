<template>
  <study-bucket-list :categoryName="categoryName"
                     :currentCategoryBucketList="currentCategoryBucketList"
                     :totalPage="bucketListToTalPageByCategory"
  />
</template>

<script>
import StudyBucketList from "@/components/bucketListKind/StudyBucketList";
import {mapActions, mapState} from "vuex";
export default {
  name: "CookBucketListView",
  components: {StudyBucketList},
  computed:{
    ...mapState([
      'currentCategoryBucketList',
      'bucketListToTalPageByCategory'
    ])
  },
  data(){
    return{
      categoryName:'자기 개발',
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