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
    </div>
  </v-container>
</template>

<script>
import {mapActions, mapState} from "vuex";
import BuyBaramRead from "@/components/boards/buyBoard/baram/BuyBaramRead";
import TopMenuForm from "@/components/topMenubar/TopMenuForm";
import ToolbarForm from "@/components/toolbar/ToolbarForm";

export default {
  name: "BuyBaramReadView",
  data() {
    return {
      deleteDialog: false,
      deleteTitle:"게시글 삭제"
    }
  },
  components: {
    BuyBaramRead,
    TopMenuForm,
    ToolbarForm
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
  computed: {
    ...mapState(['buyBaramBoard'])
  },
  methods: {
    ...mapActions([
      'requestBuyBaramFromSpring',
      'requestDeleteBuyBaramToSpring',
    ]),
    async onDelete () {
      await this.requestDeleteBuyBaramToSpring(this.buyBaramNo);
      await this.$router.push({ name: 'BuyBaramListView' })
    }
  },
  created() {
    this.requestBuyBaramFromSpring(this.buyBaramNo)
  },
  cancelBtn() {
    this.deleteDialog = false
  },
}
</script>

<style scoped>

a {
  text-decoration: none;
}

</style>