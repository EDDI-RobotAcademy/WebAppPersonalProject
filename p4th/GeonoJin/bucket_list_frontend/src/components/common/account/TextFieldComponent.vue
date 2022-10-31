<template>
  <div>
    <v-text-field
        :placeholder=placeholderText
        v-model="textFieldValue"
        type="text"
        outlined
        dense
    >

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
  },
  data(){
    return{
      textFieldValue: "",
    }
  }
}
</script>

<style scoped>

</style>