<template>
  <v-container>
    <CommonCommunityCategoryButtons/>
    <board-list/>
    <div class="d-flex justify-end">
      <v-btn class="mt-3" @click="toWrite"> 글쓰기 </v-btn>
    </div>
  </v-container>
</template>

<script>
import BoardList from "@/components/Board/BoardList";
import CommonCommunityCategoryButtons from "@/components/common/CommonCommunityCategoryButtons";
export default {
  name: "CommunityView",
  components: {CommonCommunityCategoryButtons, BoardList},
  methods: {
    toWrite() {
      this.$router.push("/community/write")
    }
  }
}
</script>

<style scoped>

</style>