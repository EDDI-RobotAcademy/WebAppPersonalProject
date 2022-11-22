<template>
  <health-bucket-list :categoryName="categoryName" :currentCategoryBucketList="currentCategoryBucketList"/>
</template>

<script>
import HealthBucketList from "@/components/bucketListKind/HealthBucketList";
import {mapActions, mapState} from "vuex";
export default {
  name: "CookBucketListView",
  components: {HealthBucketList},
  computed:{
    ...mapState([
      'currentCategoryBucketList'
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