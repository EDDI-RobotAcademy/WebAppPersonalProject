import Vue from 'vue'
import VueRouter from 'vue-router'
import HomeView from '../views/HomeView.vue'

import BoardListView from "@/views/board/BoardListView";

import FooterView from "@/views/main/FooterView";
import FootersTestView from "@/ex/FootersTestView";
import LoginForm from "@/components/account/LoginForm";
import SignUpForm from "@/components/account/SignUpForm";


Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'home',
    component: HomeView
  },
  {
    path: '/board-list-view',
    name: 'board-list-view',
    component: BoardListView
  },

  {
    path: '/footer-view',
    name: 'footer-view',
    component: FooterView
  },
  {
    path: '/footer-view',
    name: 'footer-view',
    component: FootersTestView
  },
  {
    path: '/login-form',
    name: 'login-form',
    component: LoginForm
  },
  {
    path: '/signup-form',
    name: 'signup-form',
    component: SignUpForm
  },



]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
