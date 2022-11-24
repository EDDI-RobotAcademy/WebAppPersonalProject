import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import vuetify from './plugins/vuetify'


import CommonButton_White from "@/components/common/CommonButtonWhite";
import CommonButtonBlue from "@/components/common/CommonButtonBlue";
import CommonMainMenuTemplate from "@/components/common/CommonMainMenuTemplate";
import CommonFooterTemplate from "@/components/common/CommonFooterTemplate";
import CommonBoardList from "@/components/common/CommonBoardList";
import CommonMyTextField from "@/components/common/CommonMyTextField";
import CommonSideBanner from "@/components/common/CommonSideBanner";
import CommonImageCard from "@/components/common/CommonImageCard";
import CommonCommentTextField from "@/components/common/CommonCommentTextField";


Vue.component('CommonButtonBlue', CommonButtonBlue)
Vue.component('CommonButtonWhite', CommonButton_White)
Vue.component('CommonMainMenuTemplate', CommonMainMenuTemplate)
Vue.component('CommonFooterTemplate', CommonFooterTemplate)
Vue.component('CommonBoardList', CommonBoardList)
Vue.component('CommonMyTextField', CommonMyTextField)
Vue.component('CommonSideBanner', CommonSideBanner)
Vue.component('CommonImageCard', CommonImageCard)
Vue.component('CommonCommentTextField', CommonCommentTextField)


Vue.config.productionTip = false

new Vue({
  router,
  store,
  vuetify,
  render: h => h(App)
}).$mount('#app')
