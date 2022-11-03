import Vue from 'vue'
import VueRouter from 'vue-router'
import HomeView from '../views/HomeView.vue'

import SignUpView from "@/views/account/SignUpView";
import SignInView from "@/views/account/SignInView";

import VuetifyTasteView from "@/views/main/VuetifyTasteView";
import MainView from "@/views/main/MainView";
import HeaderView from "@/views/main/HeaderView";

Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'home',
    component: HomeView
  },
  {
    path: '/vuetify-taste',
    name: 'VuetifyTasteView',
    component: VuetifyTasteView
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
    path: '/main-view',
    name: 'MainView',
    component: MainView
  },
  {
    path: '/header-view',
    name: 'HeaderView',
    component: HeaderView
  }
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
