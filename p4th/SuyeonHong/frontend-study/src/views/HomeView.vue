<template>
  <div id="home">
      <nav>
        <router-link to="/menu">menu</router-link>
     </nav>
     <router-view/>
   </div>
</template>

<script>

  export default {
    name: 'HomeView',
    components: {
    },
  }
</script>
