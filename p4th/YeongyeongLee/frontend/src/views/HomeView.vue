<template>
  <div>
    <MemberButtonView/>
    <br><br><br>
    <CarouselTestView/>
    <ToolbarView/>


    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

    <FooterView/>

  </div>


</template>

<script>
// @ is an alias to /src


import CarouselTestView from "@/views/main/CarouselView";
import ToolbarView from "@/views/main/ToolbarView";
import FooterView from "@/views/main/FooterView";
import MemberButtonView from "@/views/main/member/MemberButtonView";


export default {
  name: 'HomeView',
  components: {
    MemberButtonView,
    CarouselTestView,
    ToolbarView,
    FooterView,


  },


}
</script>

<style>


</style>
