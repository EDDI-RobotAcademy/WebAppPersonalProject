import Vue from 'vue'
import VueRouter from 'vue-router'
import HomeView from '../views/HomeView.vue'
import SignUpView from "@/views/account/SignUpView";
import SignInView from "@/views/account/SignInView";
import MyPlantView from "@/views/pages/MyPlantView";
import QuestionBoardListView from "@/views/board/QuestionBoardListView";
import BoardRegisterView from "@/views/board/BoardRegisterView";
import BoardReadView from "@/views/board/BoardReadView";
import GeneralBoardListView from "@/views/board/GeneralBoardListView";
import BoardModifyView from "@/views/board/BoardModifyView";


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
    path: '/my-plant',
    name: 'MyPlantView',
    component: MyPlantView
  },
  {
    path: '/question-board/list',
    name: 'QuestionBoardListView',
    component: QuestionBoardListView
  },
  {
    path: '/question-board/register',
    name: 'BoardRegisterView',
    component: BoardRegisterView
  },
  {
    path: '/question-board/read/:boardNo',
    name: 'BoardReadView',
    components: {
      default: BoardReadView
    },
    props: {
      default: true
    }
  },
  {
    path: '/question-board/modify/:boardNo',
    name: 'BoardModifyView',
    components: {
      default: BoardModifyView
    },
    props: {
      default: true
    }
  },
  {
    path: '/general-board/list',
    name: 'GeneralBoardListView',
    component: GeneralBoardListView
  },
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
