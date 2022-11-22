<template>
  <v-container>
    <form @submit.prevent="onSubmit">
      <div class="app">
        <h3 style="padding:50px 0px 30px 0px; font-weight:bold" align="center">게시글 수정</h3>

        <div class="a">
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
              <v-col cols="1" class="label" >가격</v-col>

              <v-col cols="4">
                <v-text-field outlined color="grey darken-1" placeholder="0"
                              v-model="price">
                </v-text-field>
              </v-col>

              <v-col cols="2" class="label" >작성자</v-col>
              <v-col cols="4">
                <v-text-field outlined color="grey darken-1" placeholder="닉네임"
                              v-model="writer" disabled>
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

            <v-row>
              <br>
            </v-row>
          </table>
        </div>

      </div>
    </form>
  </v-container>
</template>

<script>

export default {
  name:'LendModify',
  props: {
    lend: {
      type: Object,
      required: true,
    }
  },
  /*data () {
    return {
      title: '',
      content: '',
      price: 0,
      writer: '',
      regDate: '',
    }
  },
  created () {
    this.title = this.lend.title
    this.writer = this.lend.writer
    this.price = this.lend.price
    this.content = this.lend.content
    this.regDate = this.lend.regDate
  },
  methods: {
    onSubmit () {
      const { title, content, price, writer, regDate } = this
      this.$emit('submit', { title, content, price, writer, regDate })
    }
  }*/
  data() {
    return {
      image :'',
      title:'',
      content:'',
      price: 0,
      writer:'',
      type: [],
      items: [
        'Top',
        'Pants',
        'Acc',
      ],
    }
  },
  methods: {
    handleFileUpload () {
      console.log('이미지 첨부')
      var image = this.$refs['files'].files[0]
      const url = URL.createObjectURL(image)
      this.image = url
      this.files = this.$refs.files.files
    },
    onSubmit () {
      const { title, content, price, writer, regDate } = this
      this.$emit('submit', { title, content, price, writer, regDate })
    },
    goPage() {
      this.$router.push('/lend-list')
    }
  },
  created () {
    this.title = this.lend.title
    this.writer = this.lend.writer
    this.price = this.lend.price
    this.content = this.lend.content
    this.regDate = this.lend.regDate
  }
}
</script>

<style scoped>
.app{
  background: whitesmoke;
  margin-left: auto;
  margin-right: auto;
  border: solid 3px lightgray;
}
.a{
  margin-left: 20%;
  margin-right: auto;}
</style>