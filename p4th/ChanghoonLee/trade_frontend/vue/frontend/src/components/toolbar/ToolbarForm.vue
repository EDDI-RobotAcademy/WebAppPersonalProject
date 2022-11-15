<template>
  <v-container justify-center>
    <div>
      <v-toolbar dense dark color="grey">
        <v-toolbar-items>
          <v-menu offset-y>
            <template v-slot:activator="{ on }">
              <v-btn text v-on="on">
                아이템 구매
              </v-btn>
            </template>

            <v-list>
              <v-list-item v-for="(buyItemDrop, index) in buyItemDrop" :key="index" :to="buyItemDrop.route">
                <v-list-item-title>
                  {{ buyItemDrop.title }}
                </v-list-item-title>
              </v-list-item>
            </v-list>
          </v-menu>
          <v-menu offset-y>
            <template v-slot:activator="{ on }">
              <v-btn text v-on="on">
                아이템 판매
              </v-btn>
            </template>

            <v-list>
              <v-list-item v-for="(sellItemDrop, index) in sellItemDrop" :key="index" :to="sellItemDrop.route">
                <v-list-item-title>
                  {{ sellItemDrop.title }}
                </v-list-item-title>
              </v-list-item>
            </v-list>
          </v-menu>
          <v-btn text v-for="category in menuCategory" :key="category.text" :to="category.route">
            {{ category.text }}
          </v-btn>
        </v-toolbar-items>
      </v-toolbar>
    </div>
  </v-container>
</template>

<script>
export default {
  name: "toolbarForm",
  components: {

  },
  data() {
    return {
      menuCategory: [
        { text: '자유게시판', route: '/' },
        { text: '신고게시판', route: '/' },
        { text: '공지사항', route: '/' },
        { text: '포인트 충전', route: '/' },
      ],
      buyItemDrop: [
        { title: '디아블로2', route: '/'},
        { title: '바람의나라', route: '/buy-baram-list'},
        { title: '아이온', route: '/'},
        { title: '던전엔파이터', route: '/'},
      ],
      sellItemDrop: [
        { title: '디아블로2', route: '/'},
        { title: '바람의나라', route: '/'},
        { title: '아이온', route: '/'},
        { title: '던전엔파이터', route: '/'},
      ]

    }
  },
  methods: {

  }
}
</script>

<style scoped>

</style>