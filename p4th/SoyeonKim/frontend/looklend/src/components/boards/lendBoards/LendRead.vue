<template>
  <v-container>
    <form @submit.prevent="onSubmit">

      <table>
        <v-row>
          <v-text-field class="date" color="grey darken-3" rounded readonly :value="lend.regDate"/>
        </v-row>
        <v-divider/>
        <!--        <v-row>
                  &lt;!&ndash;v-if="communityBoard.writer == this.$store.state.loginUser.name"&ndash;&gt;
                  <v-menu
                      offset-y
                      bottom
                  >
                    <template v-slot:activator="{ attrs, on }">
                      <v-btn
                          class="extraBtn"
                          color="grey darken-1"
                          dark
                          fab
                          v-bind="attrs"
                          v-on="on"
                      >
                        <v-icon> mdi-dots-horizontal </v-icon>
                      </v-btn>
                    </template>
                    <v-list
                        class="black" dark>
                      <v-list-item
                          v-for="item in items"
                          :key="item"
                          link
                      >
                        <v-list-item-title>{{item.menu}}</v-list-item-title>
                      </v-list-item>
                    </v-list>
                  </v-menu>
                </v-row>-->
        <br/>
        <v-row justify="center">
          <v-col cols="1" class="label">Title</v-col>
          <!--          <v-col>
                      <v-text-field
                          class="titleFloat"
                          :value="lend.type"
                          style="width:100px; /*zoom:1.2;*/ cursor:default"
                          rounded
                          readonly
                          color="grey darken-3"
                      ></v-text-field>-->
          <v-text-field class="titleFloat"  rounded style="width:500px; zoom:1.2" color="grey darken-3" readonly :value="lend.title"/>
          <!--          </v-col>-->
        </v-row>

        <v-row>
          <v-col cols="1" class="label"> Writer</v-col>
          <v-col>
            <v-text-field filled style="width:150px" color="grey darken-1" readonly :value="lend.writer"/>
          </v-col>
        </v-row>

        <v-row>
          <v-col cols="1" class="label"> Price</v-col>
          <v-col>
            <v-text-field filled style="width:150px" color="grey darken-1" readonly :value="lend.price"/>
          </v-col>

          <v-col cols="1" class="label"> Type</v-col>
          <v-col>
            <v-text-field filled style="width:150px" color="grey darken-1" readonly :value="lend.type"/>
          </v-col>
        </v-row>

        <v-row justify="center">
          <v-col cols="3" class="label2" style="font-size:23pt">Content</v-col>
          <v-col cols="12">
            <v-textarea style="white-space:pre-line" cols="75"
                        outlined color="grey darken-3" readonly
                        :value="lend.content">
            </v-textarea>
          </v-col>

          <v-row></v-row>
        </v-row>
      </table>
    </form>
  </v-container>
</template>

<script>
export default {
  name: "LendRead",
  props: {
    lend: {
      type: Object,
      required: true,
    }
  },
  data () {
    return {
      items: [
        {menu: 'Modify', route:'/lend-modify'},
        {menu: 'Delete', route:'/lend-delete'}
      ],
      id:''
    }
  },
  methods: {
    goPage () {
      this.$router.push('/lend-list')
    }
  },
  created () {
    this.id = this.$store.state.lend.id
  }
}
</script>

<style scoped>
.label{
  margin-right:3%;
  text-align: center;
  padding-top: 10px;
  font-size:17pt;
  font-family: 'Noto Sans KR', sans-serif;
}
table{
  position: relative;
  background-color: rgb(245, 244, 244);
  padding-left: 10%;
  padding-right: 10%;
  padding-top: 5%;
  padding-bottom: 7%;
  margin-left:auto;
  margin-right:auto;
  zoom:90%;
}
</style>