<template>
  <div id="app">
    <TestComponent1/>
    <router-view/>
  </div>
</template>

<script>
import TestComponent1 from "@/components/TestComponent1";

export default {
  name: 'App',
  components: {
    TestComponent1},

  data: () => ({
    //
  }),
};
</script>
