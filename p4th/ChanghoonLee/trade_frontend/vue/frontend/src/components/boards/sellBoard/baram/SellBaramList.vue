<template>
  <v-container>
    <div>
      <h3>게시물 목록</h3>
      <table class="boards" border="1">
        <thead>
        <tr>
          <th align="center" width="80">No</th>
          <th align="center" width="600">제목</th>
          <th align="center" width="200">작성자</th>
          <th align="center" width="240">등록일자</th>
        </tr>
        </thead>
        <tbody>
        <tr v-if="!sellBaramBoards || (Array.isArray(sellBaramBoards) && sellBaramBoards.length === 0)">
          <td colspan="4">
            현재 등록된 게시물이 없습니다!
          </td>
        </tr>
        <tr v-else v-for="sellBaramBoard in sellBaramBoards" :key="sellBaramBoard.sellBaramNo">
          <td align="center">
            {{ sellBaramBoard.sellBaramNo }}
          </td>
          <td align="left">
            <router-link :to="{ name: 'SellBaramReadView',
                                params: { sellBaramNo: sellBaramBoard.sellBaramNo.toString() }}">
              <div v-if="isLogin == false" @click.prevent="readAccess">
                {{ sellBaramBoard.title }}
              </div>
              <div v-else>
                {{ sellBaramBoard.title }}
              </div>
            </router-link>
          </td>
          <td align="left">
            {{ sellBaramBoard.writer }}
          </td>
          <td align="center">
            {{ sellBaramBoard.regDate }}
          </td>
        </tr>
        </tbody>
      </table>
    </div>
  </v-container>
</template>

<script>
export default {
  name: "SellBaramList",
  data() {
    return {
      isLogin: false
    }
  },
  mounted () {
    if (this.$store.state.isAuthenticated != false) {
      this.isLogin = true
    } else {
      this.isLogin = false
    }
  },
  methods: {
    readAccess() {
      if(this.isLogin == false) {
        alert("로그인이 필요한 기능입니다.")
        this.$router.push("/sign-in")
      }
    }
  },
  props: {
    sellBaramBoards: {
      type: Array
    }
  }
}
</script>

<style scoped>

table.boards {
  border-collapse: collapse;
  text-align: center;
  line-height: 1;
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
  vertical-align: center;
  border-right: 1px solid #ccc;
  color: #fff;
}
table.boards tbody th {
  padding: 10px;
  font-weight: bold;
  border-bottom: 1px solid #ccc;
  background: #ececec;
}
table.boards td {
  padding: 10px;
  vertical-align: center;
  border-bottom: 1px solid #ccc;
}

a {
  text-decoration: none;
}

</style>