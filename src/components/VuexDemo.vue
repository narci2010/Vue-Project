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
import { demo } from '../../api/index'
export default {
  name: 'vuexDemo',
  data () {
    return {
      msg: 'Welcome to Your Vue.js App',
      superinfo: {},
      loading: false,
      registerUrl: 'http://localhost:8080/getCurrentUser',
      loginUrl: 'http://localhost:8080/login',
      logoutUrl: 'http://localhost:8080/logout',
      createUserURL: 'http://localhost:8080/zsuSysUser/create',
      registerUrlP: '/api/getCurrentUser',
      loginUrlP: '/api/login',
      logoutUrlP: '/api/logout',
      createUserURLP: '/api/zsuSysUser/create',
      petUrl: '/mock/v2/pet/{petId}',
      ipetUrl: '/mock/v2/pet',
      example: {
        'id': 67,
        'category': {
          'id': 75,
          'name': '6PN$d'
        },
        'name': 'UiBw&',
        'photoUrls': [
          'IQIe'
        ],
        'tags': [
          {
            'id': 97,
            'name': 'Km0H8v'
          }
        ],
        'status': 'available'
      },
      opts: {
        path: { 'petId': 'abc' }
      },
      user: {
        username: 'narci',
        password: '123456',
        roleIds: '1',
        locked: 0
      },
      cors: '',
      loginURL: 'http://localhost:8080/oauth/token',
      loginForm: { 'grant_type': 'password', 'username': 'admin', 'password': 'admin', 'client_id': 'dfqy-group-inc' }

    }
  },
  mounted: function () {
    this.$nextTick(function () {
      // this.cors = this.getCookie('XSRF-TOKEN')
      // this.logout()
      // this.handleLogin()
      // this.test()
      // this.createUser()
      // this.createUser2()
      // this.login()
      // this.getDataFromEasyMock()
      // this.insertDataFromEasyMock()
      this.testEasyMockCli()
    })
  },
  computed: {
    count () {
      return this.$store.state.count
    }
  },
  methods: {
    increment () {
      this.$store.commit('increment')
    },
    decrement () {
      this.$store.commit('decrement')
    },
    logout () {
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
    },
    login: function () {
      this.$axios({
        url: this.loginURL,
        method: 'post',
        data: this.loginForm,
        transformRequest: [function (data) {
          // Do whatever you want to transform the data
          let ret = ''
          for (let it in data) {
            ret += encodeURIComponent(it) + '=' + encodeURIComponent(data[it]) + '&'
          }
          return ret
        }],
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
          'Authorization': 'Basic ZGZxeS1ncm91cC1pbmM6UmZXSTFtR21oV0dpckJiZGtJaVV2VTlpZExzdGlWSk9Jc250R1labDJ6Z1JhOCs3Q0YyOVB2aDFBb0dCQU5PeA==='
        }
      })
        .then(function (response) {
          console.log(response)
        })
        .catch(function (error) {
          console.log(error)
        })
    },
    getUser: function () {
      this.$axios.get(this.registerUrl, this.newUserInfo, {
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
    },
    getDataFromEasyMock: function () {
      this.$axios.get(this.petUrl, this.newUserInfo, {
        headers: {
          'Content-Type': 'application/json'
        }
      })
        .then(function (response) {
          console.log(response)
        })
        .catch(function (error) {
          console.log(error)
        })
    },
    insertDataFromEasyMock: function () {
      this.$axios.post(this.ipetUrl, this.example, {
        headers: {
          'Content-Type': 'application/json'
        }
      })
        .then(function (response) {
          console.log(response)
        })
        .catch(function (error) {
          console.log(error)
        })
    },
    testEasyMockCli: function () {
      console.log('abc')
      demo.v2_pet_petId_get(this.opts).then(function (response) {
        console.log(response)
      })
        .catch(function (error) {
          console.log(error)
        })
    }
  }
}
</script>