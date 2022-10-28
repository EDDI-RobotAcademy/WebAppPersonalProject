import Vue from 'vue'
import VueRouter from 'vue-router'
import HomeView from '../views/HomeView.vue'
import LifeBucketListView from "@/views/bucketListKind/LifeBucketListView";
import HealthBucketList from "@/views/bucketListKind/HealthBucketList";
import StudyBucketList from "@/views/bucketListKind/StudyBucketList";
import TravelBucketList from "@/views/bucketListKind/TravelBucketList";
import CookBucketList from "@/views/bucketListKind/CookBucketList";

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
    component: LifeBucketListView
  },
  {
    path: '/health',
    name: 'HealthBucketList',
    component: HealthBucketList
  },
  {
    path: '/study',
    name: 'StudyBucketList',
    component: StudyBucketList
  },
  {
    path: '/travel',
    name: 'TravelBucketList',
    component: TravelBucketList
  },
  {
    path: '/cook',
    name: 'CookBucketList',
    component: CookBucketList
  },

]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
