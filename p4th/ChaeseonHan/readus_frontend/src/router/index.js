import Vue from 'vue'
import VueRouter from 'vue-router'
import HomeView from '../views/HomeView.vue'
import SignInView from "@/views/account/SignInView";
import SignUpView from "@/views/account/SignUpView";

Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'home',
    component: HomeView
  },
  {
    path: '/sign-in',
    name: 'SignIn',
    component: SignInView
  },
  {
    path: '/sign-up',
    name: 'SignUp',
    component: SignUpView
  },
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
