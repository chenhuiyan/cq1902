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
          <div>
            <mt-button size="large" class="mybutton border-0" @click="login">登录</mt-button>
          </div>
          <div class="reg">
            <h3>新用户&nbsp;<a href="/#/register">注册</a></h3>
          </div>
        </div>
      </div>	
    </div>
  </div>	
</div>	
</template>
<script>
export default {
  data(){
    return{
      accountPlaceholder:"请输入用户名",
      uname:"",
      upass:""
    }
  },
  methods: {
    login(){
      var n = this.uname;
      var p = this.upass;
      var nreg = /^[a-zA-Z0-9]{3,10}$/;
      var preg = /^[a-zA-Z0-9]{3,8}$/;
      if(!nreg.test(n)){
          this.$toast("用户名格式不正确");
          return;
      }
      if(!preg.test(p)){
          this.$toast("密码格式不正确");
          return;
      }
      var url = "login";
      var obj = {uname:n,upass:p};
      this.axios.get(url,{params:obj}).then(result=>{
        if(result.data.code == 1){
          console.log(result.data.uid)
          sessionStorage.setItem('uid',result.data.uid);
          sessionStorage.setItem('uname',this.uname);
          this.$router.push("/index");
        }else{
          this.$messagebox("消息",result.data.msg);
        }
      });
    }
  },
}
</script>
<style scoped>
.app{
  position: fixed;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  background:url(../assets/img/login/2.jpg) no-repeat center center; 
  background-size: 100% 100%;
  
} 
.login{
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
  font-family: 'Droid Serif', serif;
}
.login .login-inner{
  width: 350px;
  margin: 0 auto;
  border-radius: 25px !important; 
}
.login-inner h1 {
  background: #E1E1E1;
  text-align: center;
  font:500 27px;
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
  background: #CACACA;
  margin: 0px 0px 12px 0px ;
  width: 88%;
}
.login-inner .myinput[type="password"]{
	outline: none;
  font-size: 15px;
  font-weight: 500;
  color: #818181;
  background: #CACACA;
  border: 1px solid #ccc;
  border-radius:25px;
  margin: 0px 0px 12px 0px;
  width: 88%;
}
.mybutton{
  outline: 0;
  border: 0 !important;
}
.reg {
  background: #252525;
  padding: 30px 65px;
  border-radius: 0px 0px 25px 25px;
  -webkit-border-radius:  0px 0px 25px 25px;
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
	color:#696969;
	transition: 0.5s all;
}
</style>
