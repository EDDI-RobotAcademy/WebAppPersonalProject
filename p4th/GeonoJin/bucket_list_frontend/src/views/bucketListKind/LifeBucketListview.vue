<template>
  <life-bucket-list :categoryName="categoryName" :currentCategoryBucketList="currentCategoryBucketList"/>
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
      'currentCategoryBucketList'
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