import Vue from 'vue'
import VueRouter from 'vue-router'
import HomeView from '../views/HomeView.vue'
import SignUpView from "@/views/account/SignUpView";
import SignInView from "@/views/account/SignInView";
import BuyBaramListView from "@/views/boards/buyBoard/baram/BuyBaramListView";
import BuyBaramModifyView from "@/views/boards/buyBoard/baram/BuyBaramModifyView";
import BuyBaramReadView from "@/views/boards/buyBoard/baram/BuyBaramReadView";
import BuyBaramRegisterView from "@/views/boards/buyBoard/baram/BuyBaramRegisterView";
import SellBaramListView from "@/views/boards/sellBoard/baram/SellBaramListView";
import SellBaramRegisterView from "@/views/boards/sellBoard/baram/SellBaramRegisterView";
import SellBaramReadView from "@/views/boards/sellBoard/baram/SellBaramReadView";
import SellBaramModifyView from "@/views/boards/sellBoard/baram/SellBaramModifyView";
import BuyDiabloListView from "@/views/boards/buyBoard/diablo/BuyDiabloListView";
import BuyDiabloRegisterView from "@/views/boards/buyBoard/diablo/BuyDiabloRegisterView";
import BuyDiabloReadView from "@/views/boards/buyBoard/diablo/BuyDiabloReadView";
import BuyDiabloModifyView from "@/views/boards/buyBoard/diablo/BuyDiabloModifyView";
import SellDiabloListView from "@/views/boards/sellBoard/diablo/SellDiabloListView";
import SellDiabloRegisterView from "@/views/boards/sellBoard/diablo/SellDiabloRegisterView";
import SellDiabloReadView from "@/views/boards/sellBoard/diablo/SellDiabloReadView";
import SellDiabloModifyView from "@/views/boards/sellBoard/diablo/SellDiabloModifyView";

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

  {
    path: '/sell-baram-list',
    name: 'SellBaramListView',
    component: SellBaramListView
  },
  {
    path: '/sell-baram-register',
    name: 'SellBaramRegisterView',
    component: SellBaramRegisterView
  },
  {
    path: '/sell-baram-read/:sellBaramNo',
    name: 'SellBaramReadView',
    components: {
      default: SellBaramReadView
    },
    props: {
      default: true
    }
  },
  {
    path: '/sell-baram-modify/:sellBaramNo',
    name: 'SellBaramModifyView',
    components: {
      default: SellBaramModifyView
    },
    props: {
      default: true
    }
  },


  {
    path: '/buy-diablo-list',
    name: 'BuyDiabloListView',
    component: BuyDiabloListView
  },
  {
    path: '/buy-diablo-register',
    name: 'BuyDiabloRegisterView',
    component: BuyDiabloRegisterView
  },
  {
    path: '/buy-diablo-read/:buyDiabloNo',
    name: 'BuyDiabloReadView',
    components: {
      default: BuyDiabloReadView
    },
    props: {
      default: true
    }
  },
  {
    path: '/buy-diablo-modify/:buyDiabloNo',
    name: 'BuyDiabloModifyView',
    components: {
      default: BuyDiabloModifyView
    },
    props: {
      default: true
    }
  },

  {
    path: '/sell-diablo-list',
    name: 'SellDiabloListView',
    component: SellDiabloListView
  },
  {
    path: '/sell-diablo-register',
    name: 'SellDiabloRegisterView',
    component: SellDiabloRegisterView
  },
  {
    path: '/sell-diablo-read/:sellDiabloNo',
    name: 'SellDiabloReadView',
    components: {
      default: SellDiabloReadView
    },
    props: {
      default: true
    }
  },
  {
    path: '/sell-diablo-modify/:sellDiabloNo',
    name: 'SellDiabloModifyView',
    components: {
      default: SellDiabloModifyView
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
