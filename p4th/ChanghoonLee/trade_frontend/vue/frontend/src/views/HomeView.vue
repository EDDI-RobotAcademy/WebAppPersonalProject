<template>
  <v-container>
    <top-menu-form/>
    <toolbar-form/>
  </v-container>
</template>

<script>

import ToolbarForm from "@/components/toolbar/ToolbarForm";
import TopMenuForm from "@/components/topMenubar/TopMenuForm";
export default {
  name: 'HomeView',

  components: {
    TopMenuForm,
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
