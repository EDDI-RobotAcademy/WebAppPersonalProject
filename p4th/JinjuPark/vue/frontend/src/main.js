import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import vuetify from './plugins/vuetify'

import CommonButton_White from "@/components/common/CommonButtonWhite";
import CommonButtonBlue from "@/components/common/CommonButtonBlue";
import CommonMainMenuTemplate from "@/components/common/CommonMainMenuTemplate";

Vue.component('CommonButtonBlue', CommonButtonBlue) // 글로벌 컴포넌트로 만듦
Vue.component('CommonButtonWhite', CommonButton_White)
Vue.component('CommonMainMenuTemplate', CommonMainMenuTemplate)


Vue.config.productionTip = false

new Vue({
  router,
  store,
  vuetify,
  render: h => h(App)
}).$mount('#app')
