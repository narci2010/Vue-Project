// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from './App'
import router from './router'
import axios from 'axios'
Vue.prototype.$axios = axios
Vue.config.productionTip = false
// 添加请求拦截器
axios.interceptors.request.use(function (config) {
  // 在发送请求之前做些什么
  config.withCredentials = true
  // config.headers['host'] = '192.168.3.1:8080'
  // console.log('abc:' + config)
  // config.headers['Accept'] = 'application/json';
  /**
  if (config.method === 'get') { // 如果是get方法则用传统的form表单方式
    config.transformRequest = (data => {
      let ret = ''
      for (const it in data) {
        ret += encodeURIComponent(it) + '=' + encodeURIComponent(data[it]) + '&'
      }
      return ret
    })
  }
  */
  return config
}, function (error) {
  // 对请求错误做些什么
  return Promise.reject(error)
})
/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  template: '<App/>',
  components: {
    App
  }
})
