import Vue from 'vue'
import VueRouter from 'vue-router'
import HomeView from '../views/HomeView.vue'
import MainPage from "@/views/MainPage";

import LoginView from "@/views/account/LoginView";
import SignUpView from "@/views/account/SignUpView";
import AfricaBoardView from "@/views/country/AfricaBoardView";
import AsiaBoardView from "@/views/country/AsiaBoardView";
import EuropeBoardView from "@/views/country/EuropeBoardView";
import KoreanBoardView from "@/views/country/KoreanBoardView";
import NorthAmericaBoardView from "@/views/country/NorthAmericaBoardView";
import SouthAmericaBoardView from "@/views/country/SouthAmericaBoardView";
import OceaniaBoardView from "@/views/country/OceaniaBoardView";

import JpaBoardListView from "@/views/boards/BoardListView";
import JpaBoardRegisterView from "@/views/boards/BoardRegisterView";
import JpaBoardReadView from "@/views/boards/BoardReadView";
import JpaBoardModifyView from "@/views/boards/BoardModifyView";
import ToolbarButton from "@/components/common/button/ToolbarButton";



Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'home',
    component: HomeView
  },
  {
    path: '/main-page',
    name: 'main-page',
    component: MainPage
  },
  {
    path: '/login-view',
    name: 'login-view',
    component: LoginView

  },
  {
    path: '/signup-view',
    name: 'signup-view',
    component: SignUpView

  },
  {
    path: '/africa-board-view',
    name: 'africa-board-view',
    component: AfricaBoardView

  },
  {
    path: '/asia-board-view',
    name: 'asia-board-view',
    component: AsiaBoardView

  },
  {
    path: '/europe-board-view',
    name: 'europe-board-view',
    component: EuropeBoardView

  },
  {
    path: '/korean-board-view',
    name: 'korean-board-view',
    component: KoreanBoardView

  },
  {
    path: '/north-america-bord-view',
    name: 'north-america-bord-view',
    component: NorthAmericaBoardView

  },
  {
    path: '/south-america-bord-view',
    name: 'south-america-bord-view',
    component: SouthAmericaBoardView

  },
  {
    path: '/oceania-bord-view',
    name: '/oceania-bord-view',
    component: OceaniaBoardView

  },
  {
    path: '/board-list',
    name: 'JpaBoardListView',
    component: JpaBoardListView
  },
  {
    path: '/board-register',
    name: 'JpaBoardRegisterView',
    component: JpaBoardRegisterView
  },
  {
    path: '/board-read/:boardNo',
    name: 'JpaBoardReadView',
    components: {
      default: JpaBoardReadView
    },
    props: {
      default: true
    }
  },
  {
    path: '/board-modify/:boardNo',
    name: 'JpaBoardModifyView',
    components: {
      default: JpaBoardModifyView
    },
    props: {
      default: true
    }
  },
  {
    path: '/toolbar-button',
    name: 'toolbar-button',
    component: ToolbarButton
  },









]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
