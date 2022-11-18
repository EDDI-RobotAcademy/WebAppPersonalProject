<template>
  <study-bucket-list :categoryName="categoryName" :currentCategoryBucketList="currentCategoryBucketList"/>
</template>

<script>
import StudyBucketList from "@/components/bucketListKind/StudyBucketList";
import {mapActions, mapState} from "vuex";
export default {
  name: "CookBucketListView",
  components: {StudyBucketList},
  computed:{
    ...mapState([
      'currentCategoryBucketList'
    ])
  },
  data(){
    return{
      categoryName:'자기 개발'
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