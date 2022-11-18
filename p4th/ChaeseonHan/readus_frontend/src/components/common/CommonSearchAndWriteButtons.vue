<template>
  <v-container>
    <div class="d-flex justify-space-between">

      <!-- 검색바 -->
        <table style="font-size: small">
          <div class="search">
            <tr>
              <td>
                <v-icon small class="px-1">
                  mdi-magnify
                </v-icon>
              </td>
              <td class="pr-1">
                <select class="text-center py-1" v-model="optionSelected">
                  <option v-for="item in optionList" :key="item.value" :value="item.value">
                    {{ item.text }}
                  </option>
                </select>
              </td>
              <td>
                <input type="text" v-model="keyword" placeholder="검색어 입력" class="py-1">
              </td>
              <td>
                <v-btn class="button" small outlined rounded color="#356859" @click="toSearch">검색</v-btn>
              </td>
            </tr>
          </div>
        </table>

      <v-btn small outlined class="mt-3" color="#356859" @click="toWrite"> 글쓰기 </v-btn>
    </div>
  </v-container>
</template>

<script>
import {mapActions} from "vuex";

export default {
  name: "CommonSearchAndWriteButtons",
  data() {
    return {
      optionSelected: "0",
      optionValue: "",
      optionList: [
        { text : "선택", value : "0" },
        { text : "제목+내용", value : "1"},
        { text : "제목", value : "2" },
        { text : "내용", value : "3" },
        { text : "작성자", value : "4" },
      ],
      keyword: "",
    }
  },
  methods: {
    ...mapActions(['requestSearchBoardAboutTitleAndContentsToSpring']),
    toWrite() {
      this.$router.push("/community/write")
    },
    async toSearch() {
      if(this.optionSelected == 1) {
        await this.requestSearchBoardAboutTitleAndContentsToSpring(this.keyword);
        await this.$router.push({
          name: 'CommunitySearchView',
          params: {
            keyword: this.keyword
          }
        })
      } else {
        alert("준비중!")
      }
    }

  }
}
</script>

<style scoped>

.search {
  border-radius: 25px;
  height: fit-content;
  width: fit-content;
  border: 1px solid #356859;
  background-color: white;
}
.button {
  border: none;
}

</style>