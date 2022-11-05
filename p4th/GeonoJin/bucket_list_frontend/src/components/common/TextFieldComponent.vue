<template>
  <div>
    <v-text-field
        :placeholder=placeholderText
        v-model="textFieldValue"
        type="text"
        outlined
        dense
        @keyup.enter="toValue"
    >
    </v-text-field>
  </div>
</template>

<script>


export default {
  name: "TextFieldComponent",
  components: {},
  props: {
    placeholderText: {
      type: String
    },
  },
  data() {
    return {
      textFieldValue: "",
    }
  },
  methods: {
    toValue() {
      this.$emit('update', this.textFieldValue)
    }
  }
}
</script>

<style scoped>

</style>