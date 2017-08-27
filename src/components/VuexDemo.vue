<template>
  <div id="app">
    <p>{{ count }}</p>
    <p>
      <button @click="increment">+</button>
      <button @click="decrement">-</button>
    </p>
  </div>
</template>

<script>
export default {
  name: 'vuexDemo',
  data() {
    return {
      msg: 'Welcome to Your Vue.js App',
      superinfo: {},
      loginForm: {
        username: 'narci',
        password: '123456'
      },
      loading: false,
      registerUrl: 'http://localhost:8080/getCurrentUser',
      loginUrl: 'http://localhost:8080/login',
      logoutUrl: 'http://localhost:8080/logout',
      createUserURL: 'http://localhost:8080/zsuSysUser/create',
      registerUrlP: '/api/getCurrentUser',
      loginUrlP: '/api/login',
      logoutUrlP: '/api/logout',
      createUserURLP: '/api/zsuSysUser/create',
      user: {
        username: 'narci',
        password: '123456',
        roleIds: '1',
        locked: 0
      },
      cors: ''

    }
  },
  mounted: function() {
    this.$nextTick(function() {
      // this.cors = this.getCookie('XSRF-TOKEN')
      // this.logout()
      // this.handleLogin()
      // this.test()
      // this.createUser()
      // this.createUser2()
    })
  },
  computed: {
    count() {
      return this.$store.state.count
    }
  },
  methods: {
    increment() {
      this.$store.commit('increment')
    },
    decrement() {
      this.$store.commit('decrement')
    },
    logout() {
      this.$axios({
        method: 'get',
        url: this.logoutUrl,
        dataType: 'json',
        withCredentials: true
      }).then(response => {
        // this.$router.push({ path: '/hello' })
        console.log(response.data)
      }).catch(error => {
        console.log(error)
      })
    }
  }
}
</script>