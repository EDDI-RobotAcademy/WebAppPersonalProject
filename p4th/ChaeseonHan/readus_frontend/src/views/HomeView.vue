<template>
  <v-container>
    <book-list/>
  </v-container>
</template>

<script>
// @ is an alias to /src

import BookList from "@/components/main/BookList";
export default {
    name: 'HomeView',
    components: {
      BookList,
    },
  }
</script>
