//src/axios
//引入axios库并且配置
//1:引入Vue
import Vue from "vue"
//2:引入axios库
import axios from "axios"
import qs from "qs"
//3:设置跨域请求保存session
axios.defaults.withCredentials=true
//4:设置请求服务器基础路径
// axios.defaults.baseURL="http://127.0.0.1:3000/"
axios.defaults.baseURL="http://cq1902.applinzi.com/";
axios.defaults.headers.post["Content-Type"] = "application/x-www-form-urlencoded";
//5:将axios注册 Vue实例
Vue.prototype.axios = axios
Vue.prototype.$qs = qs;
//7:在main.js 引入axios.js即可