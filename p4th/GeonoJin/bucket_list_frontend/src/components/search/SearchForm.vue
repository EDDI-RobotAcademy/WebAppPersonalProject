<template>
  <v-container>
    <tool-bar-component style="margin-top: 50px"/>
    <v-divider style="margin-top: 30px"></v-divider>
    <v-container>
      <h2 style="margin-left: 50px; margin-top: 30px">검색</h2>
    </v-container>

    <v-layout justify-end style="margin-top: 20px">
      <v-form style="width: 400px" @submit.prevent="onSearch">
        <v-layout>
          <v-text-field outlined dense placeholder="버킷리스트 제목을 입력하세요!" v-model="searchWord"/>
          <v-btn rounded-xl elevation="0" color="green lighten-1" style="margin-top: 2px" type="submit">
            검색
          </v-btn>
        </v-layout>
      </v-form>
    </v-layout>

    <v-layout justify-center style="margin-top: 50px">
      <div>
        <v-row class="ma-auto">
          <div v-if="!buckets || (Array.isArray(buckets) && buckets.length === 0)">
            <h3>현재 검색된 버킷스트가 없습니다.</h3>
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
              </v-img>
            </router-link>
          </v-card>
        </v-row>
      </div>
    </v-layout>
  </v-container>
</template>

<script>
import ToolBarComponent from "@/components/common/ToolBarComponent";

export default {
  name: "SearchForm",
  components: {ToolBarComponent},
  props: {
    buckets: {
      type: Array
    }
  },
  data(){
    return{
      searchWord: ''
    }
  },
  methods:{
    onSearch(){
      this.$emit('search', this.searchWord)
    }
  }
}
</script>

<style scoped>

</style>