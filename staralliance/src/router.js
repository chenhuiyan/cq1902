import Vue from 'vue'
import Router from 'vue-router'
import index from "./components/index.vue"
import inspiration from "./components/inspiration.vue"
import our_products from "./components/our-products.vue"
import your_orders from "./components/your-orders.vue"
import login from "./components/Login.vue"
import register from "./components/reg.vue"
import introduce from "./components/introduce.vue"
import flights_to from "./components/flights_to.vue"
Vue.use(Router)

export default new Router({
  routes: [
    {path:"/",redirect:"/index"},
    {path:'/index',component:index},
    {path:'/inspiration',component:inspiration},
    {path:'/our-products',component:our_products},
    {path:'/your-orders',component:your_orders},
    {path:'/login',component:login},
    {path:'/register',component:register},
    {path:'/introduce',component:introduce},
    {path:'/flights_to',component:flights_to},
  ]
})
