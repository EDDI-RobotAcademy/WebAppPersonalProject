<template>
  <v-row>
    <v-col v-for="item in this.aladinBestSeller" :key="item">
      {{ item.title }}
    </v-col>
  </v-row>
</template>

<script>

import {mapActions, mapState} from "vuex";

export default {
  name: "BookList",
  data() {
    return {
      bookList: [],
    }
  },
  computed: {
    ...mapState(['aladinBestSeller'])
  },
  methods: {
    ...mapActions(['requestBestSellerListToAladin']),

  },
  async created() {
    await this.requestBestSellerListToAladin()

  },
}
</script>

<style scoped>

</style>