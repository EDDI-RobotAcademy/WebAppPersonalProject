<template>

  <div>
    <!-- 툴바 -->
    <v-toolbar dense>
      <v-app-bar-nav-icon @click="nav_drawer = !nav_drawer">
      </v-app-bar-nav-icon>
      <v-toolbar-title>
      </v-toolbar-title>
      <v-toolbar-items>
        <v-btn text v-for="link in links" :key="link.icon" :to="link.route">
          {{ link.text }}
        </v-btn>

      </v-toolbar-items>
      <v-spacer></v-spacer>
      <v-btn icon>
        <v-icon @click="clickButton">mdi-magnify</v-icon>
      </v-btn>

    </v-toolbar>


    <v-navigation-drawer app v-model="nav_drawer" temporary>
      <v-list nav dense>

        <v-list-item v-for="link in links" :key="link.name" router :to="link.route">

          <v-list-item-action>
            <v-icon left>

              {{ link.icon }}

            </v-icon>
          </v-list-item-action>
          <v-list-item-content>
            <v-list-item-title>

              {{ link.text }}

            </v-list-item-title>

          </v-list-item-content>
        </v-list-item>
      </v-list>


    </v-navigation-drawer>

    <v-spacer></v-spacer>




  </div>
</template>


<script>
export default {
  name: "ToolbarView",

  data() {
    return {


      nav_drawer: false,
      links: [
        {icon: 'mdi-home', text: 'Home', name: 'home', route: 'HomeView'},
        {icon: 'mdi-google-maps', text: '국내', name: 'board-list-view', route: '/board-list-view'},
        {icon: 'mdi-google-maps', text: '아시아', name: 'board-list-view', route: '/board-list-view'},
        {icon: 'mdi-google-maps', text: '아프리카', name: 'board-list-view', route: '/board-list-view'},
        {icon: 'mdi-google-maps', text: '유럽', name: 'board-list-view', route: '/board-list-view'},
        {icon: 'mdi-google-maps', text: '남아메리카', name: 'board-list-view', route: '/board-list-view'},
        {icon: 'mdi-google-maps', text: '북아메리카', name: 'board-list-view', route: '/board-list-view'},
        {icon: 'mdi-google-maps', text: '오세아니아', name: 'board-list-view', route: '/board-list-view'},


      ],
    }
  },
  methods: {
    clickButton(){

      alert('검색어를 입력하시오')

    }
  }

}



</script>

<style scoped>

</style>