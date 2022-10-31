<template>
  <div>
    <v-row class="ma-auto">
      <v-card
          v-for="card in cards"
          :key="card.title"
          :cols="card.flex"
          max-width="250"
          class="ma-5"
      >
        <v-img
            :src="card.src"
            class="white--text align-end"
            gradient="to bottom, rgba(0,0,0,.1), rgba(0,0,0,.5)"
            height="200px"
        >
          <v-card-title v-text="card.title"></v-card-title>
        </v-img>

        <v-card-actions>
          <v-spacer></v-spacer>

          <v-btn icon>
            <v-icon>mdi-heart</v-icon>
            {{ card.count }}
          </v-btn>

          <v-btn icon>
            <v-icon>mdi-bookmark</v-icon>
          </v-btn>

          <v-btn icon>
            <v-icon>mdi-share-variant</v-icon>
          </v-btn>
        </v-card-actions>
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