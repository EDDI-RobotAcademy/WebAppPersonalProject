<template>
  <v-text-field
    outlined
    clearable
    :label=label
    color="light-green darken-3"
    v-on="$listeners"
    v-bind="$attrs">
  </v-text-field>
</template>

<script>
export default {
  name: "CommonTextField",
  props: {
    label: String,
  }
}
</script>

<style scoped>

</style>