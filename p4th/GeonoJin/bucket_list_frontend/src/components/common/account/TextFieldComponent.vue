<template>
  <div>
    <v-text-field :placeholder="placeholderText" :value="textFieldValue" type="text">
    </v-text-field>
  </div>
</template>

<script>


export default {
  name: "TextFieldComponent",
  components: {
  },
  props:{
    placeholderText:{
      type: String
    },
    textFieldValue:{
      type: String
    }
  },
}
</script>

<style scoped>

</style>