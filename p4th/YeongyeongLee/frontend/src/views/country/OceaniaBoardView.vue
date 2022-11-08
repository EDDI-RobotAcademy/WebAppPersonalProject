<template>

  <div>
    <MemberButtonView/>
    <br>
    <p></p><br><br><br>
    <ToolbarButton/>
    <br>

    <br><br>

<PostWriteButton/>

  </div>

</template>

<script>
import ToolbarButton from "@/components/common/button/ToolbarButton";
import MemberButtonView from "@/views/mainpage/MemberButtonView";
import PostWriteButton from "@/components/common/button/PostWriteButton";

export default {
  name: "OceaniaBoardList",
  components: {
    PostWriteButton,
    MemberButtonView,
    ToolbarButton,

  }
}
</script>

<style scoped>

</style>