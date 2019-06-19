import Vue from 'vue'
import App from './App.vue'
import router from './router'

//引入mint-ui
import MintUI from "mint-ui"
import "mint-ui/lib/style.css"
Vue.use(MintUI)

//引入element-ui
import ElementUI from 'element-ui';
import 'element-ui/lib/theme-chalk/index.css';
import locale from 'element-ui/lib/locale/lang/en'
Vue.use(ElementUI, { locale })

//引入axios
import axios from "./axios"

Vue.config.productionTip = false

new Vue({
  router,
  render: h => h(App)
}).$mount('#app')
