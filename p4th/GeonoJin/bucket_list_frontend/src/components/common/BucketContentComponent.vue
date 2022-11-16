<template>
<!--  <div>-->
<!--    <v-row class="ma-auto">-->
<!--      <div v-if="!bucketList || (Array.isArray(bucketList) && bucketList.length === 0)">-->
<!--        <h3>현재 등록된 버킷리스트가 없습니다.</h3>-->
<!--      </div>-->
<!--      <v-card-->
<!--          v-else-->
<!--          v-for="bucket in bucketList"-->
<!--          :key="bucket.bucketId"-->
<!--          max-width="250"-->
<!--          class="ma-5"-->
<!--      >-->
<!--        <router-link to="">-->
<!--          <v-img-->
<!--              :src="require(`@/assets/thumbnail/${bucket.changeFileName}`)"-->
<!--              class="white&#45;&#45;text align-end"-->
<!--              gradient="to bottom, rgba(0,0,0,.1), rgba(0,0,0,.5)"-->
<!--              height="200px"-->
<!--              contain-->
<!--          >-->
<!--            <v-card-title v-text="bucket.title"></v-card-title>-->
<!--          </v-img>-->
<!--        </router-link>-->
<!--      </v-card>-->
<!--    </v-row>-->
<!--  </div>-->
  <div>

  </div>
</template>

<script>
export default {
  name: "BucketContentComponent",
}
</script>

<style scoped>

</style>