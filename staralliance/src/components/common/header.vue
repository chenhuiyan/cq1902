<template>
  <div>
    <div class="bg-dark px-2">
      <div>
        <router-link to="index" class="">
          <img class="logo d-sm-none d-lg-block" src="../../assets/img/header/logo-a.png">
        </router-link>
        <router-link to="#" class="">  
          <img @click="menu" class="menuIcon d-sm-block d-lg-none"  src="../../assets/img/header/barMenuIcon.png">
        </router-link>
      </div>
      <div>
        <div class="d-lg-block d-sm-none">
          <ul class="nav">
            <li v-for="(item,list) of lists" :key="list" @click="changeColor(list)">
              <router-link class="link px-2" :to="href[list]" :class="{opacity1:i == list}">{{item}}</router-link>
            </li>
          </ul>
        </div>
        <router-link to="index" class="d-sm-block d-lg-none">
          <img class="center_logo logo" src="../../assets/img/header/logo-a.png">
        </router-link>
      </div>
      <div class="nav">
        <!-- <router-link to="#" class="earth d-sm-none d-lg-inline-block"></router-link> -->
        <ul class="text-white list-unstyled push d-sm-none d-lg-block">
          <li><router-link to="login" class="link mr-2" v-show="uname==undefined">login</router-link></li> 
          <li><router-link to="#" class="link mr-2" style="color:#ebca7a" v-show="uname!=undefined">{{uname}}</router-link></li>
          <li>|</li>
          <li><router-link to="register" class="link ml-2" v-show="uname==undefined">register</router-link></li>
          <li>&nbsp;<router-link to="login" class="link ml-2" v-show="uname!=undefined">logout</router-link></li>
        </ul>
        <router-link to="#" class="search"></router-link>
      </div>
    </div>
    <!-- 菜单点击后样式 -->
    <div class="fixed d-lg-none" :class="display">
      <span @click="back" class="back"></span>
      <ul class="list-unstyled">
        <li v-for="(item,index) of lists" :key="index"><router-link class="link mx-2" :to="href[index]">{{item}}</router-link></li>
      </ul>
    </div>
    <!-- 点击后遮盖层 -->
    <!-- <div class="saTint modal-backdrop fade in"></div>-->
  </div>
</template>
<script>
export default {
  data(){
    return {
      lists:["Flight Search","Introduce","Your Journey","Our Products","Your Orders"],
      href:["flights_to","introduce","inspiration","our-products","your-orders"],
      opacity:"opacity:0",
      display:{
        d_none:true,
        d_block:false
      },  
      uname:sessionStorage.getItem("uname"),
      i:null,
    }
  },
  methods:{
    menu(){
      if(this.display.d_none === true){
        this.display.d_none = false
        this.display.d_block = true
      }else{
        this.display.d_none = true
        this.display.d_block = false
      }
    },
    back(){
      this.menu()
    },
    changeColor(list){
      console.log(list)
      this.i = list
    }
  }
}
</script>
<style scoped>
  .bg-dark{
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 13px 0;
    width:100%;
    background-color:rgba(0,0,0);
    opacity: 0.85;
    position: fixed;
    z-index: 999;
  }
  img.logo{
    width: 227px;
    height: 35px;
  }
  .link{
    color: #fff;
  }
  .link:hover{
    color: #fff;
    text-decoration: none;
    opacity: 0.8;
  }
  .opacity1{
    opacity:0.6;
  }
  .search{
    display: inline-block;
    width: 20px;
    height: 20px;
    background: url("../../assets/img/header/Search.png") no-repeat center center;
    background-size: cover;
    margin-right: 15px;
  }
  .earth{
    display: inline-block;
    width: 20px;
    height: 20px;
    background: url("../../assets/img/header/globe.svg") no-repeat center center;
    background-size: cover;
    margin-right: 20px;
  }
  .push{
    position: fixed;
    top: 16px;
    right: 52px;
  }
  ul.push>li{
    float: left;
    line-height: 25px;
  }
  @media screen and (max-width:600px){
    .logo{
      display: none;
    }
    .center_logo{
      display: block;
    }
    ul{
      display: none;
    }
    .earth{
      display: none;
    }
    /* 菜单按钮点击后样式 */
    .fixed ul{
      display: block
    }
    .nav ul{
      display: none;
    }
  }
  /* 菜单按钮点击后样式 */
  .fixed{
    position: fixed;
    top: 0;left: 0;
    height: 100%;
    width: 90%;
    background-color: #fff;
    overflow-y: scroll;
    transition: all 0.5s linear;
    z-index: 999;
  }
  .d_none{
    /* display: none; */
    width: 0%;
    overflow: hidden;
    opacity: 0;
  }
  .d_block{
    /* display: block; */
    width: 90%;
    opacity: 1;
  }  
  .fixed .link{
    color: #000;
  }
  .fixed ul{
    margin: 25px 0;
    padding: 0 36px;
  }
  .fixed ul li{
    padding: 1.6rem 0;
    border-bottom: 1px solid #ddd;
  }
  .fixed .back{
    display: block;
    height: 51px;
    width: 51px;
    background:url("../../assets/img/header/back_arrow.png") center no-repeat;
  }
</style>


