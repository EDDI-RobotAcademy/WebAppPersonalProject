<template>
  <v-container>
    <header-component/>
    <br/>
    <div align="center">
      <h3>전체</h3>
    </div>
    <br/><br/>
    <br/>

    <v-layout justify-center>
      <div>
        <v-row class="ma-auto">
          <div v-if="!buckets || (Array.isArray(buckets) && buckets.length === 0)">
            <h3>현재 등록된 버킷리스트가 없습니다.</h3>
          </div>
          <v-card
              v-else
              v-for="bucket in buckets" :key="bucket.bucketId"
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
                <v-card-subtitle align="end" v-text="bucket.writer"></v-card-subtitle>
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
            :length="totalPage"
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
  name: "AllBucketList",
  components: {
    HeaderComponent,
  },
  props: {
    buckets: {
      type: Array
    },
    totalPage:{
      type: Number
    }
  },
  data(){
    return{
      pageValue: 1
    }
  },
  methods:{
    ...mapActions([
        'getBucketListToSpring'
    ]),
    async paging(){
      await this.getBucketListToSpring(this.pageValue);
    }
  }
}
</script>

<style scoped>

</style>