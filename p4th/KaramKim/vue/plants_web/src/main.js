import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import vuetify from './plugins/vuetify'
import CommonMenuBar from "@/components/common/CommonMenuBar";
import cookies from "vue-cookies";
import CommonButton from "@/components/common/CommonButton";
import CommonTextField from "@/components/common/CommonTextField";

Vue.component('CommonMenuBar', CommonMenuBar)
Vue.component('CommonButton', CommonButton)
Vue.component('CommonTextField', CommonTextField)
Vue.use(cookies)

Vue.config.productionTip = false

new Vue({
  router,
  store,
  vuetify,
  render: h => h(App)
}).$mount('#app')
