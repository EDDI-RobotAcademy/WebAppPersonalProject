<template>
  <cook-bucket-list :categoryName="categoryName" :currentCategoryBucketList="currentCategoryBucketList"/>
</template>

<script>
import CookBucketList from "@/components/bucketListKind/CookBucketList";
import {mapActions, mapState} from "vuex";
export default {
  name: "CookBucketListView",
  components: {CookBucketList},
  computed:{
    ...mapState([
        'currentCategoryBucketList'
    ])
  },
  data(){
    return {
      categoryName: '요리'
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