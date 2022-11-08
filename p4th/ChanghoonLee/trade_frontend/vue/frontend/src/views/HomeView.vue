<template>
  <v-container>
      <TopMenubarForm/>
      <toolbar-form/>
  </v-container>
</template>

<script>

import ToolbarForm from "@/components/toolbar/ToolbarForm";
export default {
  name: 'HomeView',

  components: {
    ToolbarForm
  },
  data() {
    return {

    }
  },
  methods: {

  }
}
</script>
