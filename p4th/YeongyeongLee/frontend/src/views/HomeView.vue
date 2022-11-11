<template>
  <v-container>
 <div class="home">
<nav>
  <router-link to="/main-page">MainPage</router-link>   |
  <router-link to="/login-view">loginPage</router-link>   |
  <router-link to="/signup-view">signupPage</router-link>   |
  <router-link to="/post-list">Post</router-link>   |

  <router-link to="/board-list">게시판</router-link> |
  <router-link to="/member-button-view">멤버 버튼 </router-link> |




</nav>
   <router-view/>
</div>
  </v-container>
</template>

<script>
// @ is an alias to /src


export default {
  name: 'HomeView',
  components: {


  }
}
</script>