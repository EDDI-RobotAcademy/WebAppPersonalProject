<template>
  <v-container>
    <book-list/>
    <main-board-list/>
  </v-container>
</template>

<script>
// @ is an alias to /src

import BookList from "@/components/main/BookList";
import MainBoardList from "@/components/main/mainBoardList";
export default {
    name: 'HomeView',
    components: {
      MainBoardList,
      BookList,
    },
  }
</script>
