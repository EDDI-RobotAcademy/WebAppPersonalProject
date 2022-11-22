<template>
  <v-container>
    <header-component/>
    <br/>
    <div align="center">
      <h3>{{ categoryName }}</h3>
    </div>
    <br/><br/>
    <br/>

    <v-layout justify-center>
      <div>
        <v-row class="ma-auto">
          <div v-if="!currentCategoryBucketList || (Array.isArray(currentCategoryBucketList) && currentCategoryBucketList.length === 0)">
            <h3>현재 등록된 버킷리스트가 없습니다.</h3>
          </div>
          <v-card
              v-else
              v-for="bucket in currentCategoryBucketList" :key="bucket.bucketId"
              max-width="250"
              class="ma-5"
              v-show="bucket.switchValue === false"
          >
            <router-link :to="{name: 'BucketListReadView',
            params: { bucketId: bucket.bucketId.toString() }}"
                         style="text-decoration: none"
            >
              <v-img
                  src="@/assets/thumbnail/기본이미지.jpg"
                  class="white--text align-end"
                  gradient="to bottom, rgba(0,0,0,.1), rgba(0,0,0,.5)"
                  height="200px"
                  contain
              >
                <v-card-title v-text="bucket.bucketTitle"></v-card-title>
              </v-img>
            </router-link>
          </v-card>
        </v-row>
      </div>
    </v-layout>
    <template>
      <div class="text-center">
        <v-pagination
            v-model="pageValue"
            :length="6"
            @input="paging"
        ></v-pagination>
      </div>
    </template>
  </v-container>
</template>

<script>
import HeaderComponent from "@/components/header/HeaderComponent";
import {mapActions} from "vuex";
export default {
  name: "LifeBucketList",
  components: {HeaderComponent},
  props:{
    categoryName:{
      type: String
    },
    currentCategoryBucketList:{
      type: Array
    }
  },
  data(){
    return{
      pageValue: 1,
      category: "일상"
    }
  },
  methods:{
    ...mapActions([
      'getCurrentBucketListCategory'
    ]),
    async paging(){
      const {category, pageValue} = this
      await this.getCurrentBucketListCategory({category, pageValue});
    }
  }
}
</script>

<style scoped>

</style>