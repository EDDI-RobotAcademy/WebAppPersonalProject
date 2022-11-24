<template>
  <v-container>
    <div>
      <top-menu-form/>
      <toolbar-form/>
    </div>
    <div align="center">
      <div>
        <sell-diablo-read v-if="sellDiabloBoard" :sellDiabloBoard="sellDiabloBoard"/>
        <p v-else>Loading .......</p>
      </div>
      <div v-if="this.$store.state.loginEmail == this.sellDiabloBoard.writer">
        <router-link :to="{ name: 'SellDiabloModifyView', params: { sellDiabloNo } }">
          <v-btn class="grey white--text" rounded depressed small>게시물 수정</v-btn>&nbsp;
        </router-link>
        <v-dialog v-model="deleteDialog" persisten max-width="400">
          <template v-slot:activator="{on}">
            <v-btn class="grey white--text" rounded depressed small v-on="on">
              삭제
            </v-btn>
          </template>
          <v-card>
            <v-card-title class="headline">
              {{ deleteTitle }}
            </v-card-title>
            <v-card-text>
              삭제 하시겠습니까?
            </v-card-text>
            <v-card-actions>
              <v-spacer></v-spacer>
              <v-btn color="grey darken-2" text @click="cancelBtn">
                취소
              </v-btn>
              <v-btn color="red" text @click="onDelete">
                삭제
              </v-btn>
            </v-card-actions>
          </v-card>
        </v-dialog>
        &nbsp;
        <router-link :to="{ name: 'SellDiabloListView' }">
          <v-btn class="grey white--text" rounded depressed small>돌아가기</v-btn>
        </router-link>
      </div>
      <div v-else>
        <router-link :to="{ name: 'SellDiabloListView' }">
          <v-btn class="grey white--text" rounded depressed small>돌아가기</v-btn>
        </router-link>
      </div>
      <br/>
      <table class="boards">
        <tr>
          <div>
            <h1>댓글</h1>
          </div>
          <div class="comment">
            <sell-diablo-comment-list :sellDiabloComments="sellDiabloComments"/>
          </div>
        </tr>
      </table>
      <div>
        <sell-diablo-comment-register-form @submit="onSubmitRegister"/>
      </div>
    </div>
  </v-container>
</template>

<script>
import {mapActions, mapState} from "vuex";
import SellDiabloRead from "@/components/boards/sellBoard/diablo/SellDiabloRead";
import TopMenuForm from "@/components/topMenubar/TopMenuForm";
import ToolbarForm from "@/components/toolbar/ToolbarForm";
import SellDiabloCommentList from "@/components/boards/sellBoard/diablo/comment/SellDiabloCommentList";
import SellDiabloCommentRegisterForm from "@/components/boards/sellBoard/diablo/comment/SellDiabloCommentRegisterForm";

export default {
  name: "SellDiabloReadView",
  components: {
    SellDiabloCommentRegisterForm,
    SellDiabloCommentList,
    SellDiabloRead,
    TopMenuForm,
    ToolbarForm,
  },
  props: {
    sellDiabloNo: {
      type: String,
      required: true
    },
    sellDiabloBoard: {
      type: Object,
      required: true,
    }
  },
  data() {
    return {
      deleteDialog: false,
      deleteTitle:"게시글 삭제"
    }
  },
  computed: {
    ...mapState(['sellDiabloBoard', 'sellDiabloComments'])
  },
  methods: {
    cancelBtn() {
      this.deleteDialog = false
    },
    ...mapActions([
      'requestSellDiabloFromSpring',
      'requestDeleteSellDiabloToSpring',
      'requestSellDiabloCommentListFromSpring',
      'requestSellDiabloCommentRegisterToSpring'
    ]),
    async onSubmitRegister( payload ) {
      const { comment, commentWriter } = payload
      const sellDiabloNo = this.sellDiabloNo
      await this.requestSellDiabloCommentRegisterToSpring( {sellDiabloNo, comment, commentWriter} )
      await this.$router.push({
        name: 'SellDiabloReadView', params: { sellDiabloNo: this.sellDiabloNo }
      })
    },
    async onDelete () {
      await this.requestDeleteSellDiabloToSpring(this.sellDiabloNo);
      await this.$router.push({ name: 'SellDiabloListView' })
    }
  },
  created() {
    this.requestSellDiabloFromSpring(this.sellDiabloNo)
    this.requestSellDiabloCommentListFromSpring(this.sellDiabloCommentNo)
  },
  mounted() {
    this.requestSellDiabloCommentListFromSpring()
  }
}
</script>

<style scoped>

a {
  text-decoration: none;
}

table.boards {
  border-collapse: collapse;
  text-align: left;
  line-height: 1.5;
  border: 1px solid #ccc;
  margin: 20px 10px;
}
table.boards thead {
  border-right: 1px solid #ccc;
  border-left: 1px solid #ccc;
  background: darkgrey;

}
table.boards thead th {
  padding: 10px;
  font-weight: bold;
  vertical-align: top;
  border-right: 1px solid #ccc;
  color: #fff;

}
table.boards tbody th {
  width: 150px;
  padding: 10px;
  font-weight: bold;
  vertical-align: top;

  border-bottom: 1px solid #ccc;
  background: #ececec;

}
table.boards td {
  width: 350px;
  padding: 10px;
  vertical-align: top;
  border-bottom: 1px solid #ccc;
}


.comment {
  display: flex;
  flex-direction: column-reverse;
}

</style>