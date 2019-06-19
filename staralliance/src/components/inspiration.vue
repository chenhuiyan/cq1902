<template>
    <div><!--容器-->
        <headed></headed>
        <div id="demo" class="carousel" data-ride="carousel">
            <!--轮播图片-->
            <div class="carousel-inner">
                <div class="carousel-item active" >
                    <img class="w-100" src="../assets/img/inspiration/carousel1-big.jpg" alt=""/>
                </div>
                <div class="carousel-item">
                    <img class="w-100" src="../assets/img/inspiration/carousel2-big.jpg" alt=""/>
                </div>
                <div class="carousel-item">
                    <img class="w-100" src="../assets/img/inspiration/carousel3-big.jpg" alt=""/>
                </div>
                <div class="carousel-item">
                    <img class="w-100" src="../assets/img/inspiration/carousel4-big.jpg" alt=""/>
                </div>
            </div>
            <!--2.左右箭头-->
            <a data-slide="next" href="#demo" class="carousel-control-next">
                <span class="carousel-control-next-icon"></span>
            </a>
            <a data-slide="prev" href="#demo"     class="carousel-control-prev">
                <span class="carousel-control-prev-icon"></span>
            </a>
            <!--3.轮播指示符-->
            <ul class="carousel-indicators">
                <li data-target="#demo" data-slide-to="0"  class="active"></li>
                <li data-target="#demo" data-slide-to="1"></li>
                <li data-target="#demo" data-slide-to="2"></li>
                <li data-target="#demo" data-slide-to="3"></li>
            </ul>
        </div>
        <div>
            <pushdown></pushdown>
        </div>
        <div class="container">
            <h4>Select your travel theme</h4>      
              <ul class="list-unstyled row my-5">
                <travel class="col-lg-3 col-md-6 col-sm-12 tt" :img="require('../assets/img/inspiration/travel1.jpg')" :history="`History and Culture`"></travel>
                <travel class="col-lg-3 col-md-6 col-sm-12 tt" :img="require('../assets/img/inspiration/travel2.jpg')" :history="`Leisure and Lifestyle`"></travel>
                <travel class="col-lg-3 col-md-6 col-sm-12 tt" :img="require('../assets/img/inspiration/travel3.jpg')" :history="`Outdoor and Adventure`"></travel>
                <travel class="col-lg-3 col-md-6 col-sm-12 tt" :img="require('../assets/img/inspiration/travel4.jpg')" :history="`Memorable Journeys`"></travel>
              </ul>
        </div>
        <h4>Our Themed Round the World Itineraries</h4>
        <div class="container cards w-100">
            <card class="m-2"  :img="require('../assets/img/inspiration/theme1.jpg')" 
                   :href="`/#/introduce`" :where="`Romantic Journey`"
                   :buy="`Relax and soak up the romance`"></card>
            <card class="m-2" :img="require('../assets/img/inspiration/theme2.jpg')" 
                  :href="`/#/introduce`" :where="`World Food`" 
                  :buy="`Savour the world's many flavours`"></card>
            <card class="m-2" :img="require('../assets/img/inspiration/theme3.jpg')" 
                  :href="`/#/introduce`" :where="`Metropolitan Lifestyle`" 
                  :buy="`A journey to our branded lounges`"></card>
            <card class="m-2" :img="require('../assets/img/inspiration/theme4.jpg')" 
                  :href="`/#/introduce`" :where="`Architecture Hotspots`" 
                  :buy="`See the various architectural styles of world cities`"></card>
            <card class="m-2" :img="require('../assets/img/inspiration/theme5.jpg')" 
                  :href="`/#/introduce`" :where="`Connecting Cultures`" 
                  :buy="`A cultural journey inspired by Robert Reid`"></card>
            <card class="m-2" :img="require('../assets/img/inspiration/theme6.jpg')" 
                  :href="`/#/introduce`" :where="`Ocean Escapes`" 
                  :buy="`Warm sands and long coastlines around the world`"></card>
            <card class="m-2" :img="require('../assets/img/inspiration/theme7.jpg')" 
                  :href="`#`" :where="`Wine Tasting`" 
                  :buy="`Discover some of the world’s wine-growing regions`"></card>
            <card class="m-2" :img="require('../assets/img/inspiration/theme8.jpg')" 
                  :href="`#`" :where="`Natural Wonders`" 
                  :buy="`See what the natural world has to offer`"></card>
            <card class="m-2" :img="require('../assets/img/inspiration/theme9.jpg')" 
                  :href="`#`" :where="`Sailing Experiences`" 
                  :buy="`Explore some of the most beautiful coastal regions`"></card>
            <card class="m-2" :img="require('../assets/img/inspiration/theme10.jpg')" 
                  :href="`#`" :where="`World Wonders`" 
                  :buy="`Explore the 7 wonders of the world`"></card>
            <card class="m-2" :img="require('../assets/img/inspiration/theme11.jpg')" 
                  :href="`#`" :where="`Great Hotels`" 
                  :buy="`Visit these cities and their splendid hotels`"></card>
            <card class="m-2" :img="require('../assets/img/inspiration/theme12.jpg')" 
                  :href="`#`" :where="`Luxury Lifestyle`" 
                  :buy="`Enjoy the best experiences money can buy`"></card>
            <card class="m-2" :img="require('../assets/img/inspiration/theme13.jpg')" 
                  :href="`#`" :where="`Sports Hotspots`" 
                  :buy="`Visit the home grounds of your favourite teams`"></card>
            <card class="m-2" :img="require('../assets/img/inspiration/theme14.jpg')" 
                  :href="`#`" :where="`Nature Trail`" 
                  :buy="`Experience the diversity of our world's flora and fauna`"></card>
            <card class="m-2" :img="require('../assets/img/inspiration/theme15.jpg')" 
                  :href="`#`" :where="`Aquatic Wonders`" 
                  :buy="`Discover the power and beauty of water`"></card>
            <card class="m-2" :img="require('../assets/img/inspiration/theme16.jpg')" 
                  :href="`#`" :where="`Unique Experiences`" 
                  :buy="`Escape your daily routine and go on an exploration`"></card>
            <card class="m-2" :img="require('../assets/img/inspiration/theme17.jpg')" 
                  :href="`#`" :where="`Surfing Experiences`" 
                  :buy="`Indulge in this unforgettable surfing experience`"></card>
            <card class="m-2" :img="require('../assets/img/inspiration/theme18.jpg')" 
                  :href="`#`" :where="`Winter Wonderland Experience`" 
                  :buy="`Have an unforgettable winter on this exhilarating trip`"></card>
            <card class="m-2" :img="require('../assets/img/inspiration/theme19.jpg')" 
                  :href="`#`" :where="`Most Popular Round the World Destinations`" 
                  :buy="`Discover the beauty of the most popular Round the World destinations`"></card>
            <card class="m-2" :img="require('../assets/img/inspiration/theme20.jpg')" 
                  :href="`#`" :where="`Best Places to Photograph Around the World`" 
                  :buy="`Discover the beauty of the most popular Round the World destinations`"></card>
        </div>
        <foot></foot>
        
    </div>
</template>

<script>
import foot from "./common/footer.vue";
import headed from "./common/header.vue"
import travel from "./common/travel.vue"
import card from "./common/card.vue"
import pushdown from "./common/pushdown.vue"
export default {
    data(){
        return{

        }
    },
    methods:{

    },
    components:{
        foot:foot,
        headed,
        travel,
        card,
        pushdown,
    },
}
</script>
<style scoped>
    .carousel-inner{
        width:100%;
        height:100%;
    }
    .carousel-item{
        position: relative;
        float: left;
    } 
    /* .carousel-item img{ */
    /* height: 600px; 
    
    }*/
    /*指示符的样式*/
    .carousel-indicators li{
        width:6px;height:6px;
        background-color:#fff;
        margin-left:6px;
        margin-right:6px;
        border-radius: 50%;
        border:4px solid #fff;
    }
    .carousel-indicators .active{
        background-color:#000;
    }
    /*左右箭头的样式*/
    .carousel-control-prev,
    .carousel-control-next{
        width:4%;height:20%;
        background-color:rgba(199, 191, 191,0);
        top:40%;
        border-radius:0.25rem;
    }
    
    h4{
        text-align: center;
        margin: 50px 0;
    }
    
    .list-unstyled{
        display: flex;
        justify-content: space-between;
        /* align-items: center; */
    }
    
    .cards{
        display: flex;
        justify-content:space-around;
        flex-wrap: wrap;
        padding: 6rem 0;
        margin:0 auto;
    }
    @media screen and (max-width: 991px){
        .cards{
            padding: 4rem 0;
            flex-direction: column;
            align-items: center;
        }
    }



    @media screen and (min-width: 1200px){
        .travel-item{
            height:235px;
        }
    }
    @media screen and (min-width: 992px) and (max-width: 1200px){
        .travel-item{
            width: 90%;
            height: 215px;
            margin: 10px 12px 30px;
        }
    }   
    @media screen and (min-width: 768px) and (max-width: 991px){
        .travel-item{
            width: 66%;
            margin: 10px 64px 30px;
        }
        .travel-list{
            margin-bottom: 10px;
            
        }
    /* .carousel-item img{ */
    /* height: 600px; 
    
    }*/
    } 
    @media screen and (max-width: 767px){
        .travel-item{
            height:250px;
            width: 48%;
            margin: 10px 140px 30px;
        }
        .travel-list{
            margin-bottom: 10px;
            height: 425px;
        }
        /* .carousel-item img{ */
         /* height: 400px; 
    
    }*/
    }
</style>
