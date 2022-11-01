<template>
  <v-layout>
    <div v-for="(btnValue, i) in btnValues" :key="i">
      <template>
        <v-btn color="white" rounded elevation="0" :to="btnValue.route"
        >
          <div v-if="btnValue.name == '검색'">
            <v-icon>{{ btnValue.iconName }}</v-icon>
          </div>
          <div v-else>
            {{ btnValue.name }}
            <v-icon>{{ btnValue.iconName }}</v-icon>
          </div>
        </v-btn>
      </template>
    </div>
  </v-layout>
</template>
<script>

export default {
  name: "ButtonComponent",
  components: {},
  props: {
    btnValues: {
      type: Array
    }
  },
}
</script>

<style scoped>

</style>