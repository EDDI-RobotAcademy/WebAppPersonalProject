<template>
  <v-container>
    <v-row>
      <v-col>
        <div class="slide-3d">
          <v-carousel :cycle="cycle" :interval="interval" :height="height" hide-delimiter-background show-arrows-on-hover>
            <v-carousel-item
                v-for="(item, i) in items"
                :key="i"
                :src="item.src"
              >
            </v-carousel-item>
          </v-carousel>
        </div>
      </v-col>
    </v-row>

    <v-card class="mt-5">
      <v-card-title><b>[홈트] ALL IN ONE</b>&nbsp;&nbsp;<v-icon>mdi-youtube</v-icon></v-card-title>
      <v-row>
        <div v-for="(video, id) in videos" :key="id" class="ml-8">
          <v-col>
          <iframe width="320" height="240" :src="video.src" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe><br/>
          <v-btn icon color="black" class="ml-5" @click="saveVideo(video.id)"><v-icon>mdi-heart</v-icon>save</v-btn>
          </v-col>
        </div>
      </v-row>
    </v-card>

    </v-container>

</template>

<script>

import {mapState} from "vuex";

export default {
  name: "DiaryBoardList",
  components:{
  },
  computed:{
    ...mapState([
      'videos',
    ]),
  },
  data(){
    return{
      items:[
        {
          src:require('@/assets/re_home_black2.png')
        },
        {
          src:require('@/assets/re_home_sky2.png')
        },
        {
          src:require('@/assets/re_home_white2.png')
        },
        {
          src:require('@/assets/re_home_winter2.png')
        },
      ],
      cycle: true,
      interval: 6000,
      height: 350,
    }
  },
  methods:{
    async saveVideo(id){
      await this.$emit('saveVideo', {id})
      console.log("홈메인뷰로 보낸 비디오 id: "+ id)
    },
  },
  mounted() {

  }

}
</script>

<style scoped>

</style>