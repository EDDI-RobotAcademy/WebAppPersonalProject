import Vue from 'vue'
import VueRouter from 'vue-router'
import SignInView from "@/views/account/SignInView";
import SignUpView from "@/views/account/SignUpView";
import DiaryBoardListView from "@/views/boards/DiaryBoardListView";
import DiaryBoardRegisterView from "@/views/boards/DiaryBoardRegisterView";
import DiaryBoardReadView from "@/views/boards/DiaryBoardReadView";
import DiaryBoardModifyView from "@/views/boards/DiaryBoardModifyView";
import AllBoardListView from "@/views/boards/AllBoardListView";


Vue.use(VueRouter)

let routes;
routes = [

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
    path: '/diary-board-list',
    name: 'DiaryBoardListView',
    component:  DiaryBoardListView
  },

  {
    path: '/all-board-list',
    name: 'AllBoardListView',
    component: AllBoardListView
  },
  {
    path: '/diary-board-register',
    name: 'DiaryBoardRegisterView',
    component: DiaryBoardRegisterView
  },

  {
    path: '/diary-board-read/:boardNo',
    name: 'DiaryBoardReadView',
    components: {
      default: DiaryBoardReadView
    },
    props: {
      default: true
    }
  },
  {
    path: '/diary-board-modify/:boardNo',
    name: 'DiaryBoardModifyView',
    components: {
      default: DiaryBoardModifyView
    },
    props: {
      default: true
    }
  },

];

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
