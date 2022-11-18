<template>
  <v-container>
    <div>
      <h2 class="mb-2">주간 베스트셀러</h2>
      <div class="d-flex">
        <v-row>
          <v-col class="text-sm-center text-sm-body-2" v-for="item in this.aladinBestSeller" :key="item">
            <v-img width="136px" :src="item.cover"/>
            {{ item.title }}
          </v-col>
        </v-row>
      </div>
    </div>
  </v-container>
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