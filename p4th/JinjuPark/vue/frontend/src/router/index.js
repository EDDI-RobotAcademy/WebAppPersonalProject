import Vue from 'vue'
import VueRouter from 'vue-router'
import CommonComponentsTestView from "@/views/board/CommonComponentsTestView";
import SignInView from "@/views/account/SignInView";
import SignUpView from "@/views/account/SignUpView";
import MainHomeBoardView from "@/components/common/CommonMainMenuTemplate";
import BoardTestView from "@/views/board/BoardTestView";
import HomeView from "@/views/HomeView";
import DiaryBoardListView from "@/views/boards/exercise/DiaryBoardListView";

Vue.use(VueRouter)

const routes = [
  {
    path: '/home',
    name: 'home',
    component: HomeView
  },
  {
    path: '/common-components',
    name: 'CommonComponentsTestView',
    component: CommonComponentsTestView
  },
  {
    path: '/sign-up',
    name: 'SignUpView',
    component: SignUpView
  },
  {
    path: '/sign-in',
    name: 'SignInView',
    component: SignInView
  },
  {
    path: '/main-home-board',
    name: 'MainHomeBoardView',
    component: MainHomeBoardView
  },
  {
    path: '/',
    name: 'BoardTest',
    component: BoardTestView
  },
  {
    path: '/diary-board-list',
    name: 'DiaryBoardListView',
    component: DiaryBoardListView
  },

]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
