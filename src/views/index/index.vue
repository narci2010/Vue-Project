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
      testUrl: 'http://localhost:8080/getCurrentUser',
      loginUrl: 'http://localhost:8080/login',
      isLoginUrl: 'http://localhost:8080/isLogin',
      logoutUrl: 'http://localhost:8080/logout',
      createUserURL: 'http://localhost:8080/zsuSysUser/create',
      testUrlP: '/api/zsuSysResource/list',
      loginUrlP: '/api/login',
      logoutUrlP: '/api/logout',
      createUserURLP: '/api/zsuSysUser/create',
      createResURLP: '/api/zsuSysResource/create',
      delResURLP: '/api/zsuSysResource/delete',
      delResAnyURLP: '/api/zsuSysResource/deleteAny',
      getRolesPageURLP: '/api/zsuSysRole/listRoles',
      getResourcePageURLP: '/api/zsuSysResource/listResources',
      user: {
        username: 'cool',
        password: '123456',
        roleIds: '1',
        locked: 0
      },
      res: {
        available: true,
        icon: '/icon/3.png',
        id: 114,
        name: '系统管理3',
        parentId: 101,
        permission: 'setting3:*',
        sortedIndex: 110,
        type: 'menu2',
        url: '/setting23'
      },
      role: {
        pageSize: 5,
        pageNum: 2
      },
      resource: {
        pageSize: 5,
        pageNum: 2
      },
      cors: ''
    }
  },
  mounted: function () {
    this.$nextTick(function () {
      // this.cors = this.getCookie('XSRF-TOKEN')
      // this.logout()
      // this.handleLogin()
      // this.test()
      // this.getRolesPage()
      // this.getRolesPagePost()
      this.getResourcePagePost()
      // this.delRes()
      // this.createRes()
      // this.delResAny()
      //  this.createUser()
      // this.createUser2()
    })
  },
  methods: {
    logout () {
      this.$axios({
        method: 'get',
        url: this.logoutUrlP,
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
        url: this.loginUrlP,
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
        // 将JSON对象转化为JSON字符
        // const last=obj.toJSONString()
        // const last=JSON.stringify(obj)
        // 将字符串转json对象
        // const result = JSON.parse(response.data)
        console.log(response.data)
      }).catch(error => {
        console.log(error)
      })
    },
    test () {
      this.$axios.get(this.testUrlP, this.loginForm, { withCredentials: true, headers: { 'X-XSRF-Token': this.cors } })
        .then(function (response) {
          console.log(response)
        })
        .catch(function (error) {
          console.log(error)
        })
    },
    test2 () {
      this.$axios({
        method: 'get',
        url: this.testUrlP,
        dataType: 'json',
        withCredentials: true
      }).then(response => {
        // this.$router.push({ path: '/hello' })
        console.log(response.data)
      }).catch(error => {
        console.log(error)
      })
    },
    createUser () {
      this.$axios.post(this.createUserURLP, this.user, {
        transformRequest: [function (data) {
          let ret = ''
          for (let it in data) {
            ret += encodeURIComponent(it) + '=' + encodeURIComponent(data[it]) + '&'
          }
          return ret
        }]
      })
        .then(function (response) {
          console.log(response)
        })
        .catch(function (error) {
          console.log(error)
        })
    },
    createUser2 () {
      this.$axios.post(this.createUserURLP, this.user)
        .then(function (response) {
          console.log(response)
        })
        .catch(function (error) {
          console.log(error)
        })
    },
    createRes () {
      this.$axios.post(this.createResURLP, this.res)
        .then(function (response) {
          console.log(response)
        })
        .catch(function (error) {
          console.log(error)
        })
    },
    delRes () {
      let options = {
        params: {
          resourceId: 114
        }
      }
      this.$axios.get(this.delResURLP, options, { withCredentials: true, headers: { 'X-XSRF-Token': this.cors } })
        .then(function (response) {
          console.log(response)
        })
        .catch(function (error) {
          console.log(error)
        })
    },
    delResAny () {
      let options = {
        params: {
          resourceIds: '115, 116, 117'
        }
      }
      this.$axios.get(this.delResAnyURLP, options, { withCredentials: true, headers: { 'X-XSRF-Token': this.cors } })
        .then(function (response) {
          console.log(response)
        })
        .catch(function (error) {
          console.log(error)
        })
    },
    getRolesPage () {
      let options = {
        params: {
          pageSize: 10,
          pageNum: 1,
          role: {
            role: 'admin'
          }
        }
      }
      this.$axios.get(this.getRolesPageURLP, options, { withCredentials: true, headers: { 'X-XSRF-Token': this.cors } })
        .then(function (response) {
          console.log(response)
        })
        .catch(function (error) {
          console.log(error)
        })
    },
    getRolesPagePost () {
      this.$axios.post(this.getRolesPageURLP, this.role)
        .then(function (response) {
          console.log(response)
        })
        .catch(function (error) {
          console.log(error)
        })
    },
    getResourcePagePost () {
      this.$axios.post(this.getResourcePageURLP, this.resource)
        .then(function (response) {
          console.log(response)
        })
        .catch(function (error) {
          console.log(error)
        })
    },
    getCookie (name) {
      const v = window.document.cookie.match('(^|;) ?' + name + '=([^;]*)(;|$)')
      return v ? v[2] : null
    }
  }
}
</script>