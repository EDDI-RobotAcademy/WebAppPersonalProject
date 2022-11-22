<template>
  <v-container>
    <form @submit.prevent="onSubmit">
      <table>
        <v-row justify="center">
          <v-col cols="1" class="label" >Type</v-col>
          <v-col>
            <v-combobox
                class="titleFloat"
                v-model="type"
                :items="items"
                label="type"
                filled
                style="width:100px; zoom:1"
                outlined
                dense
                color="grey darken-1">
            </v-combobox>
          </v-col>
        </v-row>

        <v-row justify="center">
          <v-col cols="1" class="label" >Title</v-col>

          <v-text-field outlined color="grey darken-1" placeholder="제목을 입력하세요"
                        v-model="title">
          </v-text-field>
        </v-row>

        <v-row justify="center">
          <v-col cols="1" class="label" > Files </v-col>
          <v-col>
            <input type="file" dense clearable id="files" style="width:200px" ref="files"
                   multiple v-on:change="handleFileUpload()"/>
          </v-col>
          <v-col cols="12">
            <v-img :src="image" class="responsive-img" alt=""/>
          </v-col>
        </v-row>

        <v-row justify="left">
          <v-col cols="1" class="label" >Writer</v-col>
          <v-col cols="4">
            <v-text-field outlined color="grey darken-1" placeholder="닉네임" v-model="writer" disabled>
            </v-text-field>
          </v-col>
        </v-row>


        <v-row  justify="center">
          <v-col cols="3" class="label" style="font-weight:bold" align="center">Content</v-col>
          <v-col cols="12">
            <v-textarea style="white-space:pre-line" cols="75" rows="15"
                        outlined color="grey darken-1" placeholder="글 내용을 작성해주세요"
                        v-model="content">
            </v-textarea>
          </v-col>
        </v-row>

        <v-row justify="center">
          <v-btn @click="goPage" class="writeBtn" color="black" dark>취소</v-btn>
          <v-btn type="submit" class="writeBtn2" color="grey darken-3" dark>등록</v-btn>
        </v-row>

      </table>
    </form>
  </v-container>
</template>

<script>
import {mapActions, mapState} from "vuex";

export default {
  name: "CommunityRegister",
  data() {
    return {
      image :'',
      title:'',
      content:'',
      writer:'',
      type: [],
      items: [
        '요청',
        '질문',
        '잡담',
      ],
    }
  },
  /*created () {
    this.writer = this.$store.state.userInfo.nickname
  },*/
  async mounted() {
    let replacedUserValue
    const currentUserValue = localStorage.getItem('userInfo');
    if (currentUserValue != null) {
      replacedUserValue = currentUserValue.replaceAll("\"", "")
      await this.requestLoginUserNickNameFromSpring({replacedUserValue});
      this.writer = this.$store.state.loginUserNickname
    }
  },
  methods: {
    ...mapState([
      'loginUserNickname'
    ]),
    ...mapActions([
      'requestLoginUserNickNameFromSpring'
    ]),
    handleFileUpload() {
      console.log('이미지 첨부')
      var image = this.$refs['files'].files[0]
      const url = URL.createObjectURL(image)
      this.image = url
      this.files = this.$refs.files.files
    },
    onSubmit() {
      const {type, title, content, writer} = this
      this.$emit('submit', {type, title, content, writer})
      console.log(type, title, content, writer)
    },
    goPage (){
      this.$router.push('/community-list')
    }
  },
  computed: {
    ...mapState(['userInfo'])
  },
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
.writeBtn {
  position: relative;
  margin-top:1.5%;
  zoom:1.3;
  float:left;
}
.writeBtn2 {
  position: absolute;
  zoom:1.3;
  margin-top:1%;
  margin-left:20%;
  float:left;
}
</style>