<template>
  <v-btn
      class="blue lighten-1 white--text"
      v-on="$listeners"
      v-bind="$attrs"
      v-if="!isMobile()">
    <v-icon small>
      {{ iconName }}
    </v-icon>
    <span style="width: 5px" v-if="btnName"></span>
    {{ btnName }}
  </v-btn>
  <v-btn class="blue lighten-1 white--text"
         v-on="$listeners"
         v-bind="$attrs"
         v-else>
    <span style="width: 3px" v-if="btnName"></span>
    {{btnName}}
  </v-btn>
</template>

<script>
import CommonMixins from '@/mixins/CommonMixins'

export default {
  mixins: [CommonMixins],
  props: {
    iconName: String,
    btnName: String,
  },
}

</script>

<style scoped>

</style>