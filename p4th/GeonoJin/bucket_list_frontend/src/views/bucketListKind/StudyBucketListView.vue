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
      categoryName:'자기 개발',
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