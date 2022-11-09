<template>

  <div>
    <MemberButtonView/>

    <br><br><br><br>
    <CarouselTestView/>

    <ToolbarView/>
    <br><br><br><br><br><br><br><br>


    <CalendarView/>

    <br><br><br><br><br><br><br><br><br><br><br>
    <FooterView/>

  </div>
</template>

<script>
import CalendarView from "@/views/mainpage/CalendarView";
import MemberButtonView from "@/views/mainpage/MemberButtonView";
import CarouselTestView from "@/views/mainpage/CarouselView";
import ToolbarView from "@/views/mainpage/ToolbarView";
import FooterView from "@/views/mainpage/FooterView";

export default {
  name: "MainPage",
  components: {

    CalendarView,
    MemberButtonView,
    CarouselTestView,
    ToolbarView,
    FooterView,

  }
}
</script>

<style scoped>

</style>