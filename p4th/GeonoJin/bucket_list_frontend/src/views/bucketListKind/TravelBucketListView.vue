<template>
  <travel-bucket-list :categoryName="categoryName" :currentCategoryBucketList="currentCategoryBucketList"/>
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
      'currentCategoryBucketList'
    ])
  },
  data(){
    return{
      categoryName: '여행'
    }
  },
  methods:{
    ...mapActions([
      'getCurrentBucketListCategory'
    ])
  },
  async mounted() {
    const categoryName = this.categoryName
    await this.getCurrentBucketListCategory(categoryName)
  }
}
</script>

<style scoped>

</style>