<template>
  <v-container>
    <v-card class="pa-2" elevation="0">
    <div>
      <h2 class="mb-2 pt-2">주간 베스트셀러</h2>
      <div class="d-flex">
        <v-row>
          <v-col class="text-sm-center text-sm-body-2" v-for="item in this.aladinBestSeller" :key="item">
            <v-card>
              <v-img width="136px" :src="item.cover"/>
              <v-card-text style="font-family: '210 M고딕 040'" class="font-weight-bold">
                {{ item.title }}
              </v-card-text>
            </v-card>
          </v-col>
        </v-row>
      </div>
    </div>
    </v-card>
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