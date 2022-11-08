<template>
  <div>
    <div class="slide-3d">
      <v-row justify="center">
        <v-col cols="8">
          <v-carousel
              :cycle="cycle"
              :interval="interval"
              v-model="model"
              height="500"
              hide-delimiters
              :show-arrows="false">
            <v-carousel-item v-for="image in images" :key="image">
              <v-img :src="image" contain max-height="500"></v-img>
            </v-carousel-item>
          </v-carousel>
        </v-col>
      </v-row>
    </div>
    <div class="subsciption" align="center">
      <p>함께하는 식물을 등록해주세요.</p>
    </div>
    <div align="center" class="btn mt-10 mb-10">
      <v-btn @click="registerPlants" rounded x-large class="light-green--text text--darken-3" color="white" width="300px">
        <span>식물 등록하기</span>
      </v-btn>
    </div>
  </div>
</template>

<script>
export default {
  name: "MainPageForm",
  data: () => ({
    model: 0,
    images: [
      require('@/assets/img/mainPage/main1.jpg'),
      require('@/assets/img/mainPage/main2.jpg'),
      require('@/assets/img/mainPage/main3.jpg'),
      require('@/assets/img/mainPage/main4.jpg'),
    ],
    cycle: true,
    interval: 5000,
    height: 500,
  }),
  methods: {
    registerPlants () {
      this.$router.push('/register-plant')
    }
  },
}
</script>

<style scoped>
.btn {
  padding-bottom: 100px;
}
.subsciption {
  padding-top: 100px;
}


</style>