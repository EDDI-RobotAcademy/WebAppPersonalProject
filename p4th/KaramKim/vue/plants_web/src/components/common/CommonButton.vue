<template>
  <v-btn
      v-on="$listeners"
      v-bind="$attrs"
  >
    <v-icon small>
      {{ iconName }}
    </v-icon>
    <span style="width: 5px" v-if="btnName"></span>
    {{ btnName }}
  </v-btn>
</template>

<script>
export default {
  name: "CommonButton",
  props: {
    iconName: String,
    btnName: String,
  }
}
</script>

<style scoped>

</style>