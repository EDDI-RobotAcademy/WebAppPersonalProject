<template>
  <div>

    <board-comment-form :bookingNo="bookingNo" :boardComments="boardComments" @submit="onSubmit"></board-comment-form>
  </div>
</template>

<script>
import BoardCommentForm from "@/components/boards/BoardCommentForm";
import {mapActions, mapState} from "vuex";
import axios from "axios";
export default {
  name: "BoardCommentView",
  components: {BoardCommentForm},
  data () {
    return {
      id: (window.localStorage.getItem('id')),
      comments: ''
    }
  },
  props: {
    bookingNo: {
      type: String,
      required: true
    }
  },
  computed: {
    ...mapState(['boardComments'])
  },
  mounted() {
    this.fetchBoardComments()
  },
  methods: {
    ...mapActions(['fetchBoardComments']),
    onSubmit (payload) {
      const { id, comments, files1 } = payload

      let formData = new FormData()
      let fileInfo = {
        id : id,
        comments: comments
      }
      formData.append(
          "info", new Blob([JSON.stringify(fileInfo)], {type:"application/json"})
      )
      if(files1 != null) {
        for(let idx = 0; idx <1; idx++) {
          formData.append('fileList', files1[idx])
        }
      }
      console.log(fileInfo)
      const bookingNo = this.bookingNo
      axios.post(`http://localhost:7777/boardComment/register/${bookingNo}`, formData)
          .then(res => {
            alert('처리결과 :' +res.data)
            this.$router.go()
          })
          .catch(() => {
            alert('문제발생')
          })
    }
  }
}
</script>

<style scoped>

</style>