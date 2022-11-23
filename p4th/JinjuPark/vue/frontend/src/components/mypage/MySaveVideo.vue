<template>

  <v-container>
  <v-card class="mt-5">
    <v-card-title><b>{{ loginUser[0].nickname }}님의 MY SAVE VIDEO</b>&nbsp;&nbsp;<v-icon>mdi-youtube</v-icon></v-card-title>
    <v-row>
      <div v-for="(video, id) in this.$store.state.mySaveVideos" :key="id" class="ml-8">
        <v-col>
          <iframe width="320" height="240" :src="video" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe><br/>
        </v-col>
      </div>
    </v-row>
  </v-card>
  </v-container>
</template>

<script>
import {mapState} from "vuex";

export default {
  name: "MySaveVideo",
  computed: {
    ...mapState([
        'loginUser', 'mySaveVideos'
    ])
  },
  methods: {
  } ,


  data(){
   return{
   }
  },

}
</script>

<style scoped>

</style>