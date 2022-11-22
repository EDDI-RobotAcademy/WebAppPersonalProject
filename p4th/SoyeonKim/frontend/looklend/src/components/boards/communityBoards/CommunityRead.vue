<template>
  <v-container>
    <form @submit.prevent="onSubmit">

      <table>
        <v-row>
          <v-text-field class="date" color="grey darken-3" rounded readonly :value="communityBoard.regDate"/>
        </v-row>
        <v-divider/>
        <br/>

        <v-row justify="center">
          <v-col cols="1" class="label">Title</v-col>
          <v-text-field class="titleFloat"  rounded style="width:500px; zoom:1.2" color="grey darken-3" readonly :value="communityBoard.title"/>
          <!--          </v-col>-->
        </v-row>

        <v-row>
          <v-col cols="1" class="label"> Writer</v-col>
          <v-col>
            <v-text-field filled style="width:150px" color="grey darken-1" readonly :value="communityBoard.writer"/>
          </v-col>
        </v-row>

        <v-row>
          <v-col cols="1" class="label"> Type</v-col>
          <v-col>
            <v-text-field filled style="width:150px" color="grey darken-1" readonly :value="communityBoard.type"/>
          </v-col>
        </v-row>

        <v-row justify="center">
          <v-col cols="3" class="label2" style="font-size:23pt">Content</v-col>
          <v-col cols="12">
            <v-textarea style="white-space:pre-line" cols="75"
                        outlined color="grey darken-3" readonly
                        :value="communityBoard.content">
            </v-textarea>
          </v-col>

        </v-row>
      </table>
    </form>
  </v-container>
</template>

<script>
export default {
  name: "CommunityRead",
  props: {
    communityBoard: {
      type: Object,
      required: true
    }
  },
  data () {
    return {
      items: [
        {menu: 'Modify', route:'/community-modify'},
        {menu: 'Delete', route:'/community-delete'}
      ],
      id:''
    }
  },
  methods: {
    goPage () {
      this.$router.push('/community-list')
    }
  },
  created () {
    this.id = this.$store.state.communityBoard.id
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