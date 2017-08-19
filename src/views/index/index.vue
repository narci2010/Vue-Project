<template>
  <div>
    {{msg}}</div>
</template>

<script>
export default {
  name: 'index',
  data () {
    return {
      msg: 'Welcome to Your Vue.js App',
      superinfo: {},
      loginForm: {
        username: 'admin',
        password: '123456'
      },
      loading: false,
      registerUrl: 'http://localhost:8080/login'

    }
  },
  mounted: function () {
    this.$nextTick(function () {
      // this.logout()
      this.handleLogin()
    })
  },
  methods: {
    logout () {
      this.$axios({
        method: 'get',
        url: 'http://localhost:8080/logout',
        dataType: 'json',
        withCredentials: true
      }).then(response => {
        // this.$router.push({ path: '/hello' })
        console.log(response.data)
      }).catch(error => {
        console.log(error)
      })
    },
    // 登录
    handleLogin () {
      // axios.get('http://dev.xxxxxxxxxxxxxxx',{withCredentials:true}).then
      this.$axios({
        method: 'post',
        url: '/api/login',
        dataType: 'json',
        withCredentials: true,
        data: this.loginForm,
        // 把对象转换成传统form data形式
        transformRequest: [function (data) {
          let ret = ''
          for (let it in data) {
            ret += encodeURIComponent(it) + '=' + encodeURIComponent(data[it]) + '&'
          }
          return ret
        }]
      }).then(response => {
        // this.$router.push({ path: '/hello' })
        console.log(response.data)
      }).catch(error => {
        console.log(error)
      })
    },
    handleLogin2 () {
      console.log('h2')
      this.$axios.post(this.registerUrl, this.loginForm, {
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded'
        }
      })
        .then(function (response) {
          console.log(response)
        })
        .catch(function (error) {
          console.log(error)
        })
    }
  }
}
</script>