<template>
  <div class="app">
    <div class="login">
      <div>
        <h2>STARALIANCE</h2>
        <div class="login-inner">
          <h1 class="m-0">STARALIANCE</h1>
          <div>
            <mt-field :placeholder="accountPlaceholder" v-model="uname" class="myinput"></mt-field>
            <mt-field placeholder="请输入密码" v-model="upass" class="myinput" type="password"></mt-field>
            <mt-field v-model="phone" placeholder="请输入手机号码" class="myinput" type="text"></mt-field>

            <div>
              <mt-button size="large" class="mybutton border-0" @click="reg">注册</mt-button>
            </div>
            <div class="reg">
              <h3>
                注册完成请&nbsp;
                <a href="/#/login">登录</a>
              </h3>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      accountPlaceholder: "请输入账号",
      uname: "",
      upass: "",
      phone: ""
    };
  },
  methods: {
    reg() {
      //  账号验证
      var n = this.uname;
      var nreg = /^[a-zA-Z0-9]{3,10}$/;

      if (!nreg.test(n)) {
        this.$toast("用户名格式不正确");
        return;
      }

      //密码验证
      var p = this.upass;
      var preg = /^[a-zA-Z0-9]{3,8}$/;
      if (!preg.test(p)) {
        this.$toast("密码格式不正确");
        return;
      }

      //手机号码验证
      var s = this.phone;
      var re = /^1\d{10}$/;
      if (!re.test(s)) {
        this.$toast("手机格式化错误");
        return;
      }

      var url = "reg";
      var obj = { uname: n, upass: p, phone: s };
      obj = this.$qs.stringify(obj);
      this.axios({
        method: "post",
        url: url,
        data: obj
      }).then(result => {
        console.log(result);
        if (result.data.code == 200) {
          console.log(result.data);
          sessionStorage.setItem("user_id", result.data.uid);

          setTimeout(this.$toast("注册成功"), 3000);

          this.$router.push("/login");
        } else {
          this.$messagebox("消息", result.data.msg);
        }
      });
    }
  }
};
</script>

<style scoped>
.app {
  height: 100%;
  background: url(../assets/img/login/2.jpg) no-repeat center center;
  background-size: 100% 100%;
}
.login {
  padding: 288px 250px;

  height: 100%;
  width: 100%;
  display: flex;
  justify-content: center;
  align-items: center;
}
.login h2 {
  font-size: 30px;
  font-weight: 700;
  color: #fff;
  text-align: center;
  margin: -60px 0px 50px 0px;
  font-family: "Droid Serif", serif;
}
.login .login-inner {
  width: 350px;
  margin: 0 auto;
  border-radius: 25px !important;
}
.login-inner h1 {
  background: #e1e1e1;
  text-align: center;
  font: 500 27px;
  color: #818181;
  padding: 20px 0px;
  border-radius: 25px 25px 0 0;
}
.login-inner .myinput[type="text"] {
  outline: none;
  font-size: 15px;
  font-weight: 500;
  color: #818181;
  padding: 15px 20px;
  background: #cacaca;
  margin: 0px 0px 12px 0px;
  width: 88%;
}
.login-inner .myinput[type="password"] {
  outline: none;
  font-size: 15px;
  font-weight: 500;
  color: #818181;
  background: #cacaca;
  border: 1px solid #ccc;
  border-radius: 25px;
  margin: 0px 0px 12px 0px;
  width: 88%;
}
.mybutton {
  outline: 0;
  border: 0 !important;
}
.reg {
  background: #252525;
  padding: 30px 65px;
  border-radius: 0px 0px 25px 25px;
  -webkit-border-radius: 0px 0px 25px 25px;
  -moz-border-radius: 0px 0px 25px 25px;
  -o-border-radius: 0px 0px 25px 25px;
  text-align: right;
  border-top: 2px solid #252525;
}
.reg h3 {
  font-size: 14px;
  font-weight: 500;
  color: #fff;
}
.reg h3 a {
  font-size: 25px;
  font-weight: 500;
  color: #fff;
}
.reg h3 a:hover {
  text-decoration: none;
  color: #696969;
  transition: 0.5s all;
}
</style>
