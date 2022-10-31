import Vue from 'vue'
import VueRouter from 'vue-router'
import HomeView from '../views/HomeView.vue'

import SignUpView from "@/views/account/SignUpView";
import VuetifyTasteView from "@/views/main/VuetifyTasteView";

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
  }
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
