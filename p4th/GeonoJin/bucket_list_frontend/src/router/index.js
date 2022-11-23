import Vue from 'vue'
import VueRouter from 'vue-router'
import HomeView from '../views/HomeView.vue'

import LifeBucketListview from "@/views/bucketListKind/LifeBucketListview";
import HealthBucketListView from "@/views/bucketListKind/HealthBucketListView";
import StudyBucketListView from "@/views/bucketListKind/StudyBucketListView";
import TravelBucketListView from "@/views/bucketListKind/TravelBucketListView";
import CookBucketListView from "@/views/bucketListKind/CookBucketListView";
import MyPageView from "@/views/member/MyPageView";
import MyBucketListView from "@/views/member/MyBucketListView";

//bucketList
import BucketListReadView from "@/views/aboutBucketList/BucketListReadView";
import BucketListModifyView from "@/views/aboutBucketList/BucketListModifyView";

//member
import SignInView from "@/views/member/SignInView";
import SignUpView from "@/views/member/SignUpView";

//search
import SearchView from "@/views/search/SearchView";

Vue.use(VueRouter)

const routes = [
  {
    path: '/home',
    name: 'HomeView',
    component: HomeView
  },
  {
    path: '/life',
    name: 'LifeBucketListView',
    component: LifeBucketListview
  },
  {
    path: '/health',
    name: 'HealthBucketListView',
    component: HealthBucketListView
  },
  {
    path: '/study',
    name: 'StudyBucketListView',
    component: StudyBucketListView
  },
  {
    path: '/travel',
    name: 'TravelBucketListView',
    component: TravelBucketListView
  },
  {
    path: '/cook',
    name: 'CookBucketListView',
    component: CookBucketListView
  },
  {
    path: '/signIn',
    name: 'SignInView',
    component: SignInView
  },
  {
    path: '/signUp',
    name: 'SignUpView',
    component: SignUpView
  },
  {
    path: '/myPage/:nickName',
    name: 'MyPageView',
    components: {
      default: MyPageView
    },
    props:{
      default: true
    }
  },
  {
    path: '/myBucket/:userNickname',
    name: 'MyBucketListView',
    components: {
      default: MyBucketListView
    },
    props:{
      default: true
    }
  },
  {
    path: '/readBucketList/:bucketId',
    name: 'BucketListReadView',
    components: {
      default: BucketListReadView
    },
    props:{
      default: true
    }
  },
  {
    path: '/modifyBucketList/:bucketId',
    name: 'BucketListModifyView',
    components: {
      default: BucketListModifyView
    },
    props:{
      default: true
    }
  },
  {
    path: '/search',
    name: 'SearchView',
    component: SearchView
  },

]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
