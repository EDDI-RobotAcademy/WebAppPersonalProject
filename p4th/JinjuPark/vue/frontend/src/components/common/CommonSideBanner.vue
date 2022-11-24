<template>
  <v-card width="250px" max-height="400px">
    <v-img
        class="white--text align-end"
        max-width="250"
        height="200px"
        src="@/assets/exercise_banner.jpg"
    >
      <v-card-title>Best Dumbbells</v-card-title>
    </v-img>

    <v-card-subtitle class="pb-0">
      Number 1
    </v-card-subtitle>

    <v-card-text class="text--primary">
      <div>A product with a stable grip</div>
      <div> Various weights and colors</div>
    </v-card-text>

    <v-card-actions class="justify-center">
      <v-btn
          color="orange"
          text
      >
        View more
      </v-btn>
    </v-card-actions>
  </v-card>
</template>

<script>
export default {
  name: "CommonSideBanner"
}
</script>

<style scoped>

</style>