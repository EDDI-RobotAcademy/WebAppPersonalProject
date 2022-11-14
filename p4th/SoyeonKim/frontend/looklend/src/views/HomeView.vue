<template>
    <div id="home">
      <nav>
        <router-link to="/vuetify-taste">Vuetify 예시들</router-link> |
        <router-link to="/sign-up">회원 가입</router-link> |
        <router-link to="/sign-in">로그인</router-link> |
        <router-link to="/main-view">메인</router-link> |
        <router-link to="/header-view">헤더</router-link> |
        <router-link to="/carousel-view">배너</router-link> |
        <router-link to="/my-page">마이페이지</router-link> |
        <router-link to="/main-page">연습 메인페이지</router-link> |
        <router-link to="/header-practice">연습페이지</router-link> |

        <HeaderView/>
        <CarouselView/>
        <v-content><v-container></v-container></v-content>
        <v-content><v-container></v-container></v-content>

        <div class="card">
          <div class="card-body">
            <p class="text-center">Lend</p>
          </div>
        </div>

        <v-content><v-container></v-container></v-content>
        <ImageGalleryView/>

      </nav>
      <router-view/>
    </div>
</template>

<script>
// @ is an alias to /src


import HeaderView from "@/views/main/HeaderView";
import CarouselView from "@/views/main/CarouselView";
import ImageGalleryView from "@/views/main/ImageGalleryView";

export default {
    name: 'HomeView',

    components: {
      CarouselView,
      HeaderView,
      ImageGalleryView
    },
  }
</script>

<style>
</style>