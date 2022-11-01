import Vue from 'vue'
import Vuex from 'vuex'
import App from './App.vue'
import router from './router'
import store from './store'
import vuetify from './plugins/vuetify'
import CommonButton from "@/components/common/CommonButton";
import VueCookies from 'vue-cookies'

Vue.component('CommonButton', CommonButton)

Vue.config.productionTip = false

new Vue({
  router,
  store,
  vuetify,
  Vuex,
  VueCookies,
  render: h => h(App)
}).$mount('#app')
