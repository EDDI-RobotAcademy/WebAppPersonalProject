<template>
  <div style="width: 660px">
    <v-container>
        <v-card>
          <v-card-title style="font-size: 20px">
            댓글
          </v-card-title>
          <v-data-table
              :headers="headers"
              :items="items"
              :items-per-page="5"
          >
          </v-data-table>
        </v-card>
    </v-container>
  </div>
</template>

<script>
export default {
  name: "CommentListForm",
  props: {
    headers: Array,
    items: Array,
  }
}
</script>

<style scoped>

</style>