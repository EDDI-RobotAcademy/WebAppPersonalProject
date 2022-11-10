import Vue from 'vue'
import VueRouter from 'vue-router'
import HomeView from '../views/HomeView.vue'
import SignInView from "@/views/routerView/account/SignInView";
import SignUpView from "@/views/routerView/account/SignUpView";
import CommunityView from "@/views/routerView/community/CommunityView";
import BoardWriteView from "@/views/routerView/community/BoardWriteView";

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

  { path: '/community',
    name: 'CommunityView',
    component: CommunityView
  },

  { path: '/community/write',
    name: 'BoardWriteView',
    component: BoardWriteView
  },

]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
