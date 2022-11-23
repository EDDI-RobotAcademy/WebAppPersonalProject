<template>
  <v-container>
    <div>
      <top-menu-form/>
      <toolbar-form/>
    </div>
    <div align="center">
      <div>
        <buy-baram-read v-if="buyBaramBoard" :buyBaramBoard="buyBaramBoard"/>
        <p v-else>Loading .......</p>
      </div>
      <div v-if="this.$store.state.loginEmail == this.buyBaramBoard.writer">
        <router-link :to="{ name: 'BuyBaramModifyView', params: { buyBaramNo } }">
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
        <router-link :to="{ name: 'BuyBaramListView' }">
          <v-btn class="grey white--text" rounded depressed small>돌아가기</v-btn>
        </router-link>
      </div>
      <div v-else>
        <router-link :to="{ name: 'BuyBaramListView' }">
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
            <buy-baram-comment-list :buyBaramComments="buyBaramComments"/>
          </div>
        </tr>
      </table>
    </div>
  </v-container>
</template>

<script>
import {mapActions, mapState} from "vuex";
import BuyBaramRead from "@/components/boards/buyBoard/baram/BuyBaramRead";
import TopMenuForm from "@/components/topMenubar/TopMenuForm";
import ToolbarForm from "@/components/toolbar/ToolbarForm";
import BuyBaramCommentList from "@/components/boards/buyBoard/baram/comment/BuyBaramCommentList";

export default {
  name: "BuyBaramReadView",
  components: {
    BuyBaramCommentList,
    BuyBaramRead,
    TopMenuForm,
    ToolbarForm,
  },
  props: {
    buyBaramNo: {
      type: String,
      required: true
    },
    buyBaramBoard: {
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
    ...mapState(['buyBaramBoard', 'buyBaramComments'])
  },
  methods: {
    cancelBtn() {
      this.deleteDialog = false
    },
    ...mapActions([
      'requestBuyBaramFromSpring',
      'requestDeleteBuyBaramToSpring',
      'requestBuyBaramCommentListFromSpring'
    ]),
    async onDelete () {
      await this.requestDeleteBuyBaramToSpring(this.buyBaramNo);
      await this.$router.push({ name: 'BuyBaramListView' })
    }
  },
  created() {
    this.requestBuyBaramFromSpring(this.buyBaramNo)
    this.requestBuyBaramCommentListFromSpring(this.buyBaramCommentNo)
  },
  mounted() {
    this.requestBuyBaramCommentListFromSpring()
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