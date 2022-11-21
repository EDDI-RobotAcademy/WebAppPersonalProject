<template>
  <div>
    <div class="textbox" v-for="(comment, index) in boardComments" :key="index">
      <div v-if="comment.bookingNo == bookingNo">
        <strong> {{ comment.id }} </strong> <br>
        <span class="comments">
                    {{ comment.comments }}
                </span>

        <span class="date"> <br>
                    {{ comment.regDate }} <hr>
                </span>
      </div>
    </div>
    <div style="float: left">
      <form @submit.prevent="onSubmit">
        <br><br>
        <h3 style="color: burlywood">Comment <strong>{{ this.id }}</strong></h3>

        <textarea type="text" v-model="comments" placeholder="comment" class="commentcheck"/>


        <input type="file" id="files1" ref="files1"
               multiple v-on:change="handleFileUpload()"/>
        <v-btn class="commentRegister" type="submit" color="white">
          <strong>Upload</strong>
        </v-btn>
      </form>

    </div>
  </div>
</template>

<script>
export default {
  name: "BoardCommentForm",

  props: {
    boardComments: {
      type: Array,
      required: true
    },
    bookingNo: {
      type: String,
      required: true
    }
  },
  data() {
    return {
      id: (window.localStorage.getItem('id')),
      comments: ''
    }
  },
  methods: {
    handleFileUpload() {
      this.files1 = this.$refs.files1.files
    },
    onSubmit() {
      const {id, comments, files1} = this
      this.$emit('submit', {id, comments, files1})
    }
  }
}
</script>

<style scoped>
.commentcheck {
  border: 2px solid rgb(37, 26, 26);
  width: 1100px;
  height: 80px;
  color: burlywood;
}

.commentRegister {
  margin-left: 52%;
  margin-top: 5px;
  color: burlywood;
}

form {
  padding: 0 0 0 13%;
  color: burlywood;


}

.textbox {
  width: 800px;
  color: burlywood;
  padding: 0 0 0 13%;
}

.textbox .date {
  text-align: right;
  color: burlywood;
}


</style>