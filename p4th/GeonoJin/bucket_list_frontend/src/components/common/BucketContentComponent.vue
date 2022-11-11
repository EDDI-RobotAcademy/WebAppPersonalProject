<template>
  <div>
    <v-row class="ma-auto">
      <v-card
          v-for="card in cards"
          :key="card.title"
          max-width="250"
          class="ma-5"
      >
        <a :href="card.route" style="text-decoration: none; color: white">
          <v-img
              :src="card.src"
              class="white--text align-end"
              gradient="to bottom, rgba(0,0,0,.1), rgba(0,0,0,.5)"
              height="200px"
          >
            <v-card-title v-text="card.title"></v-card-title>
          </v-img>
        </a>
      </v-card>
    </v-row>
  </div>
</template>

<script>
export default {
  name: "BucketContentComponent",
  props: {
    cards: {
      type: Array
    }
  },
}
</script>

<style scoped>

</style>