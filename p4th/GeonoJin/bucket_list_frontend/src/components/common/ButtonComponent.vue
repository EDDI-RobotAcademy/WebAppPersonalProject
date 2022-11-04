<template>
  <v-layout>
    <div v-for="(btnValue, i) in btnValues" :key="i"
    >
      <template>
        <div v-if="btnValue.iconName == 'mdi-account-circle-outline'">
          <v-menu offset-y>
            <template v-slot:activator="{ on, attrs }">
              <v-btn color="white" rounded elevation="0" :to="btnValue.route"
                     v-bind="attrs"
                     v-on="on">
                <div>
                  {{ btnValue.name }}
                  <v-icon>{{ btnValue.iconName }}</v-icon>
                </div>
              </v-btn>
            </template>
            <template>
              <v-list width="180px" height="180px" >
                <v-list-item>
                  <v-list-item-title>
                    <a href="/myPage"
                       style="text-decoration: none; color: black"
                    ><h5>{{ nickName }}</h5></a>
                  </v-list-item-title>
                </v-list-item>

                <v-list-item
                    v-for="(btnItem, index) in btnItems" :key="index"
                    style="background-color: darkgray"
                >
                  <v-list-item-title>
                    <h4>{{ btnItem.btnName }}</h4>
                  </v-list-item-title>
                </v-list-item>
              </v-list>
            </template>
          </v-menu>

        </div>
        <div v-else>
          <v-btn color="white" rounded elevation="0" :to="btnValue.route">
            <div>
              {{ btnValue.name }}
              <v-icon>{{ btnValue.iconName }}</v-icon>
            </div>
          </v-btn>
        </div>


      </template>
    </div>
  </v-layout>
</template>
<script>


export default {
  name: "ButtonComponent",
  components: {},
  props: {
    btnValues: {
      type: Array
    },
    nickName:{
      type: String
    }
  },
  data() {
    return {
      btnItems: [
        {btnName: "마이버킷"},
        {btnName: "로그아웃"},
      ],
    }
  },
}
</script>

<style scoped>

</style>