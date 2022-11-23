import Vue from 'vue'
import VueRouter from 'vue-router'
import HomeView from '../views/HomeView.vue'
import SignInView from "@/views/routerView/account/SignInView";
import SignUpView from "@/views/routerView/account/SignUpView";
import CommunityView from "@/views/routerView/community/CommunityView";
import BoardWriteView from "@/views/routerView/community/Board/BoardWriteView";
import BoardReadView from "@/views/routerView/community/Board/BoardReadView";
import InformationCategoryView from "@/views/routerView/community/CommunitiCategory/InformationCategoryView";
import LifeCategoryView from "@/views/routerView/community/CommunitiCategory/LifeCategoryView";
import ReviewCategoryView from "@/views/routerView/community/CommunitiCategory/ReviewCategoryView";
import BoardModifyView from "@/views/routerView/community/Board/BoardModifyView";
import CommunitySearchView from "@/views/routerView/community/CommunitySearchView";
import MyPageView from "@/views/routerView/account/MyPageView";
import MyBoardListView from "@/views/routerView/account/MyBoardListView";

Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'home',
    component: HomeView
  },


    // 회원관리
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

    //회원 정보
  {
    path: '/my-page',
    name: 'MyPageView',
    component: MyPageView,
  },
  {
    path: '/my-board',
    name: 'MyBoardListView',
    component: MyBoardListView,
  },



    //커뮤니티
  { path: '/community',
    name: 'CommunityView',
    component: CommunityView
  },
  { path: '/community/information',
    name: 'InformationCategory',
    component: InformationCategoryView
  },
  { path: '/community/life',
    name: 'LifeCategory',
    component: LifeCategoryView
  },
  { path: '/community/review',
    name: 'ReviewCategory',
    component: ReviewCategoryView
  },

  // 커뮤니티 - 검색
  {
    path: '/community/search/:keyword',
    name: 'CommunitySearchView',
    components: {
      default: CommunitySearchView,
    },
    props: {
      default: true
    }
  },


    //게시글 개별 기능
  { path: '/community/write',
    name: 'BoardWriteView',
    component: BoardWriteView
  },
  {
    path: '/community/read/:boardNo',
    name: 'BoardReadView',
    components:{
      default: BoardReadView
    },
    props: {
      default: true
    }
  },
  {
    path: '/community/modify/:boardNo',
    name: 'BoardModifyView',
    components:{
      default: BoardModifyView
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
