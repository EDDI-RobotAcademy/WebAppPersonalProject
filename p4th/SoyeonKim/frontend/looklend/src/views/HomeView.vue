<template>
    <div id="home">
      <nav>

        <HeaderViewPractice/>
        <CarouselView/>
        <v-content><v-container></v-container></v-content>
        <v-content><v-container></v-container></v-content>

        <div class="card">
          <div class="card-body">
            <p class="text-center">Lend</p>
          </div>
        </div>

        <MainLendListView/>

        <FooterForm/>

      </nav>
      <router-view/>
    </div>
</template>

<script>
// @ is an alias to /src


import CarouselView from "@/views/main/CarouselView";
import FooterForm from "@/components/common/FooterForm";
import HeaderViewPractice from "@/views/main/HeaderViewPractice";
import MainLendListView from "@/views/main/MainLendListView";

export default {
    name: 'HomeView',

    components: {
      MainLendListView,
      HeaderViewPractice,
      FooterForm,
      CarouselView,
    },
  }
</script>

<style>
</style>