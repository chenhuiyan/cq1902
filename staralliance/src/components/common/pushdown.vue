<template>
  <div class="pushDown" @click="pushdown" v-show="display==true"></div>
</template>
<script>
export default {
  data(){
    return {
      display:true,
    }
  },
  methods:{
    pushdown(){
      $('html,body').animate({scrollTop:800-61},500)

      //window.location.hash = "headed"; 
      //$("body,html").scrollTop(800-61);
      this.display=false
    },
  }
}
</script>
<style scoped>
  .pushDown {
    width: 50px;
    height: 50px;
    display: block;
    opacity: 100;
    position: absolute;
    /* top: 100%; */
    left: 50%;
    border-radius: 50%;
    background: url(../../assets/img/pushdown/Down_Arrow_Gold.png) center no-repeat rgba(255,255,255,.7);
    cursor: pointer;
    transform: translate(-50%,-50%);
    z-index: 2;
    box-shadow: 0 0 10px 0 rgba(0,0,0,.2);
  }
  @keyframes upDown{
    0% {background-position: center;}
    100% {background-position: center 60%;}
  }
  .pushDown:hover{
    animation-name: upDown;
    animation-duration: .5s;
    animation-iteration-count: infinite;
    animation-direction: alternate;
  }
  @media screen and (max-width:600px){
    .pushDown{
      display: none !important;
    }
  }
</style>
