import Vue from 'vue'
import VueRouter from 'vue-router'
import HomeView from '../views/HomeView.vue'

import SignUpView from "@/views/account/SignUpView";
import SignInView from "@/views/account/SignInView";

import HeaderView from "@/views/main/HeaderView";
import CarouselView from "@/views/main/CarouselView";

import CommonButtonView from "@/views/common/CommonButtonView";
import MyPageView from "@/views/account/MyPageView";


import MainPageView from "@/views/main/MainPageView";
import HeaderViewPractice from "@/views/main/HeaderViewPractice";
import BoardPractice from "@/views/boards/BoardPractice";


import LendListView from "@/views/boards/lendBoards/LendListView";
import LendRegisterView from "@/views/boards/lendBoards/LendRegisterView";
import LendReadView from "@/views/boards/lendBoards/LendReadView";
import LendModifyView from "@/views/boards/lendBoards/LendModifyView";

import CommunityListView from "@/views/boards/communityBoards/CommunityListView";
import CommunityRegisterView from "@/views/boards/communityBoards/CommunityRegisterView";
import CommunityReadView from "@/views/boards/communityBoards/CommunityReadView";
import CommunityModifyView from "@/views/boards/communityBoards/CommunityModifyView";

import ReviewListView from "@/views/boards/reviewBoards/ReviewListView";
import ReviewRegisterView from "@/views/boards/reviewBoards/ReviewRegisterView";
import ReviewReadView from "@/views/boards/reviewBoards/ReviewReadView";
import ReviewModifyView from "@/views/boards/reviewBoards/ReviewModifyView";





Vue.use(VueRouter)

const requireLogin = () => (to, from, next) => {
  if ((window.localStorage.getItem('userInfo') != null)) {
    return next()
  } else {
    alert('로그인이 필요한 서비스입니다.')
    this.$router.push('/')
  }
}

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
    path: '/header-view',
    name: 'HeaderView',
    component: HeaderView
  },
  {
    path: '/carousel-view',
    name: 'CarouselView',
    component: CarouselView
  },


  {
    path: '/common-button-view',
    name: 'CommonButtonView',
    component: CommonButtonView
  },
  {
    path: '/my-page',
    name: 'MyPageView',
    component: MyPageView
  },


    //연습
  {
    path: '/main-page',
    name: 'MainPageView',
    component: MainPageView
  },
  {
    path: '/header-practice',
    name: 'HeaderViewPractice',
    component: HeaderViewPractice
  },
  {
    path: '/board-practice',
    name: 'BoardPractice',
    component: BoardPractice
  },


  {
    path: '/lend-list',
    name: 'LendListView',
    component: LendListView
  },
  {
    path: '/lend-register',
    name: 'LendRegisterView',
    component: LendRegisterView,
    beforeEnter: requireLogin()
  },
  {
    path: '/lend-read/:lendNo',
    name: 'LendReadView',
    components: {
      default: LendReadView
    },
    props: {
      default: true
    }
  },
  {
    path: '/lend-modify/:lendNo',
    name: 'LendModifyView',
    components: {
      default: LendModifyView
    },
    props: {
      default: true
    }
  },


  {
    path: '/community-list',
    name: 'CommunityListView',
    component: CommunityListView
  },
  {
    path: '/community-register',
    name: 'CommunityRegisterView',
    component: CommunityRegisterView,
    beforeEnter: requireLogin()
  },
  {
    path: '/community-read/:boardNo',
    name: 'CommunityReadView',
    components: {
      default: CommunityReadView
    },
    props: {
      default: true
    }
  },
  {
    path: '/community-modify/:boardNo',
    name: 'CommunityModifyView',
    components: {
      default: CommunityModifyView
    },
    props: {
      default: true
    }
  },

    //review
  {
    path: '/review-list',
    name: 'ReviewListView',
    component: ReviewListView
  },
  {
    path: '/review-register',
    name: 'ReviewRegisterView',
    component: ReviewRegisterView,
    beforeEnter: requireLogin()
  },
  {
    path: '/review-read/:reviewNo',
    name: 'ReviewReadView',
    components: {
      default: ReviewReadView
    },
    props: {
      default: true
    }
  },
  {
    path: '/review-modify/:reviewNo',
    name: 'ReviewModifyView',
    components: {
      default: ReviewModifyView
    },
    props: {
      default: true
    },
  },

]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
