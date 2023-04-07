<template>
  <v-container>
  <div v-on="$listeners"
       v-bind="$attrs">
    <!--  게시판 타이틀 카드-->
    <v-card width="1200px" height="200px" class="mb-5">
      <v-img
          class="white--text align-sm-center"
          max-width="1200"
          height="200px"
          :src="require(`@/assets/${imgName}`)"
      >
      </v-img>
    </v-card>
  </div>
  </v-container>
</template>

<script>
export default {
  name: "CommonImageCard",
  props: {
    imgName: String,
  }
}
</script>

<style scoped>

</style>