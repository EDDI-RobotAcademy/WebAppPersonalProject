<template>

  <div>

    <div style="float: right">
      <v-btn class="Normal" rounded>
        <v-icon>mdi-account-outline</v-icon>
        <router-link to="/login-view"> 로그인</router-link>
      </v-btn>

      <v-btn class="Normal" rounded>
        <v-icon>mdi-account-plus-outline</v-icon>
        <router-link to="/signup-view"> 회원가입</router-link>
      </v-btn>
    </div>
    <br><br><br><br>
    <CarouselTestView/>

    <ToolbarButton/>

    <br><br><br><br>
    <CalendarView/>

    <br><br><br><br><br><br><br><br>
    <FooterView/>

  </div>
</template>

<script>
import CalendarView from "@/views/mainpage/CalendarView";
import CarouselTestView from "@/views/mainpage/CarouselView";

import FooterView from "@/views/mainpage/FooterView";
import ToolbarButton from "@/components/common/button/ToolbarButton";


export default {
  name: "MainPage",
  components: {


    CalendarView,

    CarouselTestView,

    FooterView,

    ToolbarButton

  }
}
</script>

<style scoped>


</style>