<template>
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
          <p>{{ pageName }}</p>
        </div>
        <div
            style="
                font-size: 20px;
                text-align: center;
                font-weight: bold;
                color: grey;
              "
        >
          {{ pageDescription }}
        </div>
      </div>
      <v-divider></v-divider>
    </v-col>
  </v-row>
</template>

<script>
export default {
  name: "CommonPageDescription",
  props: {
    pageName: String,
    pageDescription: String
  }
}
</script>

<style scoped>

</style>