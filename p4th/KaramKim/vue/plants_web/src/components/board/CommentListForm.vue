<template>
  <div style="width: 660px">
    <v-container>
      <v-card>
        <v-data-table
            :headers="headers"
            :items="items"
            :items-per-page="5"
        >
          <template v-slot:top>
            <v-toolbar
                flat
            >
              <v-toolbar-title>댓글</v-toolbar-title>
              <v-divider
                  class="mx-4"
                  inset
                  vertical
              ></v-divider>
              <v-spacer></v-spacer>
              <v-dialog
                  v-model="dialog"
                  max-width="500px"
              >
                <template v-slot:activator="{ on, attrs }">
                  <v-btn
                      color="light-green"
                      dark
                      class="mb-2"
                      v-bind="attrs"
                      v-on="on"
                  >
                    새 댓글
                  </v-btn>
                </template>
                <v-card>
                  <v-card-title>
                    <span class="text-h5">{{ formTitle }}</span>
                  </v-card-title>

                  <v-card-text>
                    <v-container>
                      <v-row>
                        <v-col
                            cols="12"
                            sm="6"
                            md="4"
                        >
                          <v-text-field
                              v-model="writer"
                              label="작성자"
                          ></v-text-field>
                        </v-col>
                        <v-col
                            cols="12"
                            sm="6"
                            md="4"
                        >
                        </v-col>
                        <v-col
                            cols="12"
                        >
                          <v-text-field
                              v-model="content"
                              label="내용"
                          ></v-text-field>
                        </v-col>
                      </v-row>
                    </v-container>
                  </v-card-text>

                  <v-card-actions>
                    <v-spacer></v-spacer>
                    <v-btn
                        color="blue darken-1"
                        text
                        @click="close"
                    >
                      취소
                    </v-btn>
                    <v-btn
                        color="blue darken-1"
                        text
                        @click="save"
                    >
                      등록
                    </v-btn>
                  </v-card-actions>
                </v-card>
              </v-dialog>
              <v-dialog v-model="dialogDelete" max-width="500px">
                <v-card>
                  <v-card-title class="text-h5">Are you sure you want to delete this item?</v-card-title>
                  <v-card-actions>
                    <v-spacer></v-spacer>
                    <v-btn color="blue darken-1" text @click="closeDelete">Cancel</v-btn>
                    <v-btn color="blue darken-1" text @click="deleteItemConfirm">OK</v-btn>
                    <v-spacer></v-spacer>
                  </v-card-actions>
                </v-card>
              </v-dialog>
            </v-toolbar>
          </template>

          <template v-slot:[`item.actions`]="{ item }">
            <v-icon
                small
                class="mr-2"
                @click="editItem(item)"
            >
              mdi-pencil
            </v-icon>
            <v-icon
                small
                @click="deleteItem(item)"
            >
              mdi-delete
            </v-icon>
          </template>



        </v-data-table>
      </v-card>
    </v-container>
  </div>
</template>

<script>
import {mapActions} from "vuex";

export default {
  name: "CommentListForm",
  data() {
    return {
      dialog: false,
      dialogDelete: false,
      editedIndex: -1,
      itemIndex: '',
      editedItem: {
        name: '',
        content: '',
      },
      writer: '',
      content: '',
    }
  },
  props: {
    headers: Array,
    items: Array,
  },
  computed: {
    formTitle() {
      return this.editedIndex === -1 ? '새 댓글' : '수정 댓글'
    },
  },
  methods: {
    ...mapActions([
        'requestDeleteCommentToSpring'
    ]),
    editItem(item) {
      this.itemIdx = this.items.indexOf(item)
      this.editedIndex = this.items[this.itemIdx].id
      this.dialog = true
    },

    deleteItem(item) {
      this.itemIdx = this.items.indexOf(item)
      this.editedIndex = this.items[this.itemIdx].id
      this.dialogDelete = true
    },

    deleteItemConfirm() {
      this.requestDeleteCommentToSpring(this.editedIndex)
      this.closeDelete()
    },

    close() {
      this.dialog = false
      this.$nextTick(() => {
        this.editedItem = Object.assign({}, this.defaultItem)
        this.editedIndex = -1
      })
    },

    closeDelete() {
      this.dialogDelete = false
      this.$nextTick(() => {
        this.editedItem = Object.assign({}, this.defaultItem)
        this.editedIndex = -1
      })
    },

    save() {
      if (this.editedIndex > -1) {
        const id = this.editedIndex.toString()
        const regDate = this.items[this.itemIdx].regDate

        console.log('저장 시 editedIndex: ' + id)
        const { writer, content } = this
        this.$emit('modify', { id, writer, content, regDate})
        // 수정 기능
      } else {
        const { writer, content } = this
        this.$emit('submit', { writer, content })
      }
      this.close()
    },
  },
}
</script>

<style scoped>

</style>