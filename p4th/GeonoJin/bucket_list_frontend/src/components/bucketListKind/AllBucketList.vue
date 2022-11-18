<template>
  <v-container>
    <header-component/>
    <br/>
    <div align="center">
      <h3>전체</h3>
    </div>
    <br/><br/>
    <hr>
    <br/>

    <v-layout justify-center>
      <div>
        <v-row class="ma-auto">
          <div v-if="!bucketList || (Array.isArray(bucketList) && bucketList.length === 0)">
            <h3>현재 등록된 버킷리스트가 없습니다.</h3>
          </div>
          <v-card
              v-else
              v-for="bucket in bucketList"
              :key="bucket.bucketId"
              max-width="250"
              class="ma-5"
          >
            <router-link to="">
              <v-img
                  :src="require(`@/assets/thumbnail/${bucket.changeFileName}`)"
                  class="white--text align-end"
                  gradient="to bottom, rgba(0,0,0,.1), rgba(0,0,0,.5)"
                  height="200px"
                  contain
              >
                <v-card-title v-text="bucket.title"></v-card-title>
              </v-img>
            </router-link>
          </v-card>
        </v-row>
      </div>
    </v-layout>
  </v-container>
</template>

<script>
import HeaderComponent from "@/components/header/HeaderComponent";
import {mapActions, mapState} from "vuex";
/*todo
* 스프링 컨트롤러 작업해주고
* 넘겨받는 데이터 신경쓸꺼는 변경된 파일 이름을
* 어떻게 가지고 올것인가 고민해봐야할 일이고
* 넘겨받은 버킷리스트를 눌렀을 경우 어떻게 화면에 띄워줄건지
* */

export default {
  name: "AllBucketList",
  components: {
    HeaderComponent,
  },
  computed:{
    ...mapState([
        'bucketList'
    ])
  },
  data(){
    return{
    }
  },
  mounted() {
    this.getBucketListToSpring()
  },
  methods:{
    ...mapActions([
        'getBucketListToSpring'
    ])
  }
}
</script>

<style scoped>

</style>