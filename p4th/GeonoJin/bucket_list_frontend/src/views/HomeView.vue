<template>
  <v-container>
    <header-component/>
    <br/><br/>
    <div align="center">
      <h3>전체</h3>
    </div>
    <br/><br/><br/>

    <v-layout justify-center>
      <bucket-content-component
          :cards="cards"
      />
    </v-layout>
  </v-container>
</template>

<script>

import HeaderComponent from "@/components/header/HeaderComponent";
import BucketContentComponent from "@/components/common/account/BucketContentComponent";

export default {
  name: 'HomeView',
  components: {
    BucketContentComponent,
    HeaderComponent,
  },
  data(){
    return{
      cards: [
        { title: 'Pre-fab homes', src: 'https://cdn.vuetifyjs.com/images/cards/house.jpg', flex: 12, route:'/signIn' ,count:0},
        { title: 'Favorite road trips', src: 'https://cdn.vuetifyjs.com/images/cards/road.jpg', flex: 6, count:0 },
        { title: 'Best airlines', src: 'https://cdn.vuetifyjs.com/images/cards/plane.jpg', flex: 6, count:0 },

      ],
    }
  }
}
</script>
<style scoped>

</style>
