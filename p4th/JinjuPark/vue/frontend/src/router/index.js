import Vue from 'vue'
import VueRouter from 'vue-router'
import SignInView from "@/views/account/SignInView";
import SignUpView from "@/views/account/SignUpView";
import DiaryBoardListView from "@/views/boards/DiaryBoardListView";
import DiaryBoardRegisterView from "@/views/boards/DiaryBoardRegisterView";
import DiaryBoardReadView from "@/views/boards/DiaryBoardReadView";
import DiaryBoardModifyView from "@/views/boards/DiaryBoardModifyView";
import FreeBoardListView from "@/views/boards/FreeBoardListView";
import QNABoardListView from "@/views/boards/QNABoardListView";
import AllBoardListView from "@/views/boards/AllBoardListView";
import HomeMainView from "@/views/video/HomeMainView";

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
    path: '/free-board-list',
    name: 'FreeBoardListView',
    component: FreeBoardListView
  },

  {
    path: '/qna-board-list',
    name: 'QNABoardListView',
    component:QNABoardListView
  },

  {
    path: '/all-board-list',
    name: 'AllBoardListView',
    component: AllBoardListView
  },

  {
    path: '/',
    name: 'HomeMainView',
    component: HomeMainView
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
