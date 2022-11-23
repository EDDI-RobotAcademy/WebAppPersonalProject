<template>
  <div>
    <v-container>
      <v-row>
        <v-col>
          <div class="mt-10 mb-10">
            <div
                style="
                font-size: 30px;
                text-align: center;
                font-weight: bold;
                margin-bottom: 10px;
              "
                class="light-green--text text--darken-1"
            >
              <p>{{ boardName }}</p>
            </div>
            <div
                style="
                font-size: 20px;
                text-align: center;
                font-weight: bold;
                color: grey;
              "
            >
              {{ boardDescription }}
            </div>
          </div>
          <v-divider></v-divider>
        </v-col>
      </v-row>

      <v-row>
        <v-col>
          <v-data-table
              :headers="headers"
              :items="items"
              :items-per-page="10"
              @click:row="rowClick"
              class="elevation-1"
              :search="search"
          >
            <template v-slot:top>
              <v-text-field
                  v-model="search"
                  append-icon="mdi-magnify"
                  label="Search"
                  class="mx-4"
                  single-line
              ></v-text-field>
            </template>
          </v-data-table>
        </v-col>
      </v-row>
    </v-container>
  </div>
</template>

<script>

export default {
  name: "BoardListForm",
  data() {
    return {
      search: '',
    }
  },
  props: {
    boardName: String,
    boardDescription: String,
    headers: Array,
    items: Array,
    boards: Array,
  },
  methods: {
    rowClick(row) {
      console.log(row.boardNo)
      this.$router.push({ name: 'BoardReadView',
      params: {boardNo: row.boardNo.toString()}})
    },
  }
}
</script>

<style scoped>

</style>