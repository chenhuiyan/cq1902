<template>
  <div class="bg-dark clearfix">
    <div class="container footerTop d-sm-none d-lg-block">
      <ul class="navbar text-white list-unstyled">
        <li v-for="(item,list) of lists" :key="list" class="nav-item ">
          <a class="font">{{item[0]}}</a>
          <ul class="list-unstyled">
            <li v-for="(it,i) of item[1]" :key="i"><router-link class="link" to="#">{{it}}</router-link></li>
          </ul>
        </li>
      </ul>
    </div>
    <div class="footerBottom clearfix">
      <div class="row">
        <div class="col-md-6 col-sm-12">
          <div class="left float-md-right float-sm-none text-center">
            <h4 class="font">Connect Us On Social Media</h4>
            <ul class="list-inline form-group social">
              <li>
                <a href="#" target="_blank" aria-label="Opens in a new window"></a>
              </li>
            </ul>
          </div>
        </div>
        <div class="col-md-6 col-sm-12">
          <div class="right float-md-left float-sm-none text-center">
            <h4 class="font">Download The Navigator App</h4>
            <ul class="list-inline form-group">
              <li>
                <a id="ios" href="#" target="_blank" class="mr-2"><img src="../../assets/img/footer/appStore.svg" alt="App Store"></a>
              </li>
              <li>
                <a id="android" href="#" target="_blank" class="ml-2"><img src="../../assets/img/footer/googlePlay.svg" alt="Google Play"></a>
              </li>
            </ul>
        </div>
        </div>
      </div>
    </div>
    <p class="container text-center">Selected images from www.unsplash.com<br> © 1997-2019 Star Alliance</p>
  </div>
</template>
<script>
export default {
  data(){
    return{
      lists:[
        ["Frequent Flyers",["Earn","Redeem","Benefits and Privileges","Our Global Travellers"]],
        ["Your Journey",["Lounges","Gold Track","Airport Information","Baggage Tracing","Booking Contacts","Customer Relations","Connection Service"]],
        ["Our Products",["Let us inspire you","Round the World","Book and Fly","Circle Pacific","Corporate Plus"]],
        ["About Star Alliance",["Background Information","Latest News","Career Opportunities","FAQ"]],
        ["Legal",["Privacy Policy","Impressum"]]
      ],
    }
  },
  
}
</script>
<style scoped>
  .bg-dark{
    width: 100%;
    padding: 40px 0;
    background-color: #171717;
  }
  /* 上半部分 */
  .footerTop:after{
    content: "";
    display: block;
    clear: both;
    width: 100%;
    height: 1px;
    background-color: #353535;
    margin: 2rem 0;
  }
  .bg-dark .navbar{
    align-items: flex-start;
  }
  .font{
    color: #f1f1f1;
    font: 18px  HelveticaNeueW01-BdExt;
    display: block;
    margin-bottom: 12px;
  }
  .link{
    color: #b6b6b6;
    font: 16px  HelveticaNeueW01-BdExt;
    display: block;
    margin-bottom: 12px;
  }
  .link:hover{
    color: #fff;
    text-decoration: none;
  }
  /* 下半部分 */
  .footerBottom{
    margin-bottom: 48px;
  }
  .left{
    padding: 0 15px;
  } 
  .left a{ 
    background: url(../../assets/img/footer/sprite-social-redesign.png) no-repeat 50% 79%;
    background-size: 3rem auto;
    display: inline-block;
    width: 2.4rem;
    height: 2rem;
    transform: scale(1);
  }
  .left a:hover{
    transform: scale(1.1);
  }
  .right{
    padding: 0 15px;
  }
  .right ul{
    display: flex;
    justify-content: center;
  }
  .col-md-6,.col-sm-12{
    position:static;
  }
  h4{
    color: #f1f1f1;
  }
  p{
    color: #b6b6b6;
  }
  /* 超小屏 */
  @media screen and (max-width:600px){
    .footerTop{
      display: none;
    }
  }
</style>
