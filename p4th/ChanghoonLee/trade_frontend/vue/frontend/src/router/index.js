import Vue from 'vue'
import VueRouter from 'vue-router'
import HomeView from '../views/HomeView.vue'
import SignUpView from "@/views/account/SignUpView";
import SignInView from "@/views/account/SignInView";
import BuyBaramListView from "@/views/boards/buyBoard/baram/BuyBaramListView";
import BuyBaramModifyView from "@/views/boards/buyBoard/baram/BuyBaramModifyView";
import BuyBaramReadView from "@/views/boards/buyBoard/baram/BuyBaramReadView";
import BuyBaramRegisterView from "@/views/boards/buyBoard/baram/BuyBaramRegisterView";

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

  {
    path: '/buy-baram-list',
    name: 'BuyBaramListView',
    component: BuyBaramListView
  },
  {
    path: '/buy-baram-register',
    name: 'BuyBaramRegisterView',
    component: BuyBaramRegisterView
  },
  {
    path: '/buy-baram-read/:buyBaramNo',
    name: 'BuyBaramReadView',
    components: {
      default: BuyBaramReadView
    },
    props: {
      default: true
    }
  },
  {
    path: '/buy-baram-modify/:buyBaramNo',
    name: 'BuyBaramModifyView',
    components: {
      default: BuyBaramModifyView
    },
    props: {
      default: true
    }
  },
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
