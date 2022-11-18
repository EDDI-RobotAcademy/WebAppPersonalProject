<template>
  <div>
    <v-container>
      <v-row>
        <v-col v-for="image in images" :key="image" class="d-flex child-flex" cols="3">
          <v-img :src="image" aspect-ratio="1" class="grey lighten-2">\
          <template v-slot:placeholder>
            <v-row class="fill-height ma-0" align="center" justify="center">
              <v-progress-circular indeterminate color="grey ligten-5">
              </v-progress-circular>
            </v-row>
          </template>
          </v-img>
        </v-col>
      </v-row>
    </v-container>
  </div>
</template>

<script>
export default {
  name: "ImageGalleryView",
  data: () => ({
    images: [
      require('@/assets/logo.png'),
      require('@/assets/logo.svg'),
      require('@/assets/logo.png'),
      require('@/assets/logo.svg'),
      require('@/assets/logo.png'),
      require('@/assets/logo.svg'),
      require('@/assets/logo.png'),
      require('@/assets/logo.svg'),
      require('@/assets/logo.png'),
      require('@/assets/logo.svg'),
      require('@/assets/logo.png'),
      require('@/assets/logo.svg'),
      require('@/assets/logo.png'),
      require('@/assets/logo.svg'),
      require('@/assets/logo.png'),
      require('@/assets/logo.svg'),
      /*require('@/assets/logo.png'),
      require('@/assets/logo.svg'),
      require('@/assets/logo.png'),
      require('@/assets/logo.svg'),
      require('@/assets/logo.png'),
      require('@/assets/logo.svg'),
      require('@/assets/logo.png'),
      require('@/assets/logo.svg'),
      require('@/assets/logo.png'),
      require('@/assets/logo.svg'),
      require('@/assets/logo.png'),
      require('@/assets/logo.svg'),
      require('@/assets/logo.png'),
      require('@/assets/logo.svg'),
      require('@/assets/logo.png'),
      require('@/assets/logo.svg'),*/
    ]
  })

}
</script>

<style scoped>

</style>