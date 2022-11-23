import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import vuetify from './plugins/vuetify'
import cookies from "vue-cookies";
import CommonButton from "@/components/common/CommonButton";
import CommonTextField from "@/components/common/CommonTextField";
import commonPageDescription from "@/components/common/CommonPageDescription";

Vue.component('CommonButton', CommonButton)
Vue.component('CommonTextField', CommonTextField)
Vue.component('CommonPageDescription', commonPageDescription)
Vue.use(cookies)

Vue.config.productionTip = false

new Vue({
  router,
  store,
  vuetify,
  render: h => h(App)
}).$mount('#app')
