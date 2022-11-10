import Vue from 'vue'
import VueRouter from 'vue-router'
import HomeView from '../views/HomeView.vue'
import SignUpView from "@/views/account/SignUpView";
import SignInView from "@/views/account/SignInView";

Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'home',
    component: HomeView
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
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
