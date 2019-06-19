<template>
    <div><!--容器-->
        <headed></headed>
        <div class="swiper-container">
            <!--轮播图片-->
            <div class="swiper-wrapper">
                <div class="swiper-slide" >
                    <img class="w-100" src="../assets/img/index/carousel1-big.jpg" alt=""/>
                </div>
                <div class="swiper-slide">
                    <img class="w-100" src="../assets/img/index/carousel2-big.jpg" alt=""/>
                </div>
                <div class="swiper-slide">
                    <img class="w-100" src="../assets/img/index/carousel3-big.jpg" alt=""/>
                </div>
                <div class="swiper-slide">
                    <img class="w-100" src="../assets/img/index/carousel4-big.jpg" alt=""/>
                </div>
            </div>
            <!-- <div class="swiper-button-prev"></div> -->
            <!-- <div class="swiper-button-next"></div> -->
        </div>
        <!-- 固定搜索栏 -->
        <div class="fixed text-center">
            <h4 class="text-center text-white">Scan more than 18800 daily flights</h4>
            <div class="w-100">
                <div class="text-white">From</div>
                <input class="place text-white text-center" type="text" @change="From" v-model="from">
                <div class="text-white">To</div>
                <input class="place text-white text-center" type="text" @change="To" v-model="to">
                <div class="text-white">Depart</div>
                <input class="date" type="date" v-model="depart">
                <div class="text-white">Return</div>
                <input class="date" type="date" v-model="turn">
            </div>
            <mt-button class="mybutton mt-3" @click="find">Find Flights</mt-button>
        </div>
        <div class="container cards w-100">
            <card  :img="require('../assets/img/index/cart1.jpg')" :href="`/#/inspiration`" :where="`Where will your miles take you?`" :buy="`Earning and Redeeming`"></card>
            <card :img="require('../assets/img/index/cart2.jpg')" :href="`/#/inspiration`" :where="`Let us inspire you!`" :buy="`Round the World with Star Alliance`"></card>
        </div>
        <div class="container news p-0">
            <h3 class="pb-5">News & Updates</h3>
            <div class="row">
                <div class="col-md-4 col-sm-12" >
                    <news :img="require('../assets/img/index/news1.jpg')" :about="`About Star Alliance`" :trend="`Star Alliance Leads the way`" :href="`#`"></news>
                </div>
                <div class="col-md-4 col-sm-12" >
                    <news :img="require('../assets/img/index/news2.jpg')" :about="`About Star Alliance`" :trend="`Star Alliance Leads the way`" :href="`#`"></news>
                </div>
                <div class="col-md-4 col-sm-12" >
                    <news :img="require('../assets/img/index/news3.jpg')" :about="`About Star Alliance`" :trend="`Star Alliance Leads the way`" :href="`#`"></news>
                </div>
            </div>
        </div> 
        <div class="container p-0 team">
            <hr>
            <div class="intr">
                <h4 class="my-5">Star Alliance Member Airlines</h4>
                <p class="mb-3">Our member airlines include many of the world’s top aviation companies as well as smaller regional airlines. Together, they offer easy connections to almost any destination in the world. Each airline maintains its own individual style and cultural identity, bringing the richness of diversity and multiculturalism to the alliance. At the same time each airline shares a common dedication to the highest standards of safety and customer service.</p>
                <p class="mb-3">Click on a logo to learn more about them:</p>
            </div>
            <ul class="list-unstyled my-5">
                <li v-for="(img,index) of imgs" :key="index">
                    <img :src="img">
                </li>
            </ul>
        </div>
        <foot></foot>    
    </div>
</template>
<script>
import foot from "./common/footer.vue";
import headed from "./common/header.vue"
import card from "./common/card.vue"
import news from "./common/news.vue"
export default {
    data() {
        return {  
            imgs:[
                require('../assets/img/index/team/Adria Airways.png'),
                require('../assets/img/index/team/Aegean Airlines.png'),
                require('../assets/img/index/team/Air Canada.png'),
                require('../assets/img/index/team/Air China.png'),
                require('../assets/img/index/team/Air India.png'),
                require('../assets/img/index/team/Air New Zealand.png'),
                require('../assets/img/index/team/All Nippon Airways.png'),
                require('../assets/img/index/team/Asiana Airlines.png'),
                require('../assets/img/index/team/Austrian Airlines.png'),
                require('../assets/img/index/team/Avianca.png'),
                require('../assets/img/index/team/Brussels Airlines.png'),
                require('../assets/img/index/team/Croatia Airlines.png'),
                require('../assets/img/index/team/Adria Airways.png'),
                require('../assets/img/index/team/Egypt Air.png'),
                require('../assets/img/index/team/Ethiopian Airlines.png'),
                require('../assets/img/index/team/EVA_Airways.png'),
                require('../assets/img/index/team/LOT Polish Airlines.png'),
                require('../assets/img/index/team/Lufthansa.png'),
                require('../assets/img/index/team/SAS Scandanavian_2017.png'),
                require('../assets/img/index/team/Shenzen.png'),
                require('../assets/img/index/team/Singapore Airlines.png'),
                require('../assets/img/index/team/South African Airways.png'),
                require('../assets/img/index/team/Swiss.png'),
                require('../assets/img/index/team/Adria Airways.png'),
                require('../assets/img/index/team/TAP Portugal.png'),
                require('../assets/img/index/team/Thai.png'),
                require('../assets/img/index/team/Turkish Airlines.png'),
                require('../assets/img/index/team/united.png'),
            ],
            from:"",
            to:"",
            depart:"",
            turn:""
        }
    },
    components:{
        foot:foot,
        headed,
        card,
        news,
    },
    mounted() {
        var mySwiper = new Swiper ('.swiper-container', {
            //direction: 'vertical',
            loop: true, 
            effect : 'cube',
            cube: {
                slideShadows: true,
                shadow: true,
                shadowOffset: 20,
                shadowScale: 0.1
                },
            navigation: {
            nextEl: '.swiper-button-next',
            prevEl: '.swiper-button-prev',
        },
        // pagination: '.swiper-pagination',
      })        
    },
    methods:{
        From(){
            var from = this.from
            this.axios.get("selectCity",{params:{city:from}})
            .then(result=>{
                this.from = `${result.data.data[0].city}(${result.data.data[0].mid})`
                //console.log(this.from)
            })
        },
        To(){
            var to = this.to
            this.axios.get("selectCity",{params:{city:to}})
            .then(result=>{
                this.to = `${result.data.data[0].city}(${result.data.data[0].mid})`
            })
        },
        find(){
            console.log(this.from)
            if(this.from == undefined || this.from == null || this.from == ""){
                this.$toast("from required") 
                retuen;              
            }
            if(this.to == undefined || this.to == null || this.to == ""){
                this.$toast("to required")  
                retuen;             
            }
            if((this.from !== undefined || this.from !== null || this.from !== "") && (this.to !== undefined || this.to !== null || this.to !== "")){
                var from = this.from
                var to = this.to
                var depart = this.depart
                var turn = this.turn
                //this.$router.push(`/flights_to?from=${from}&to=${to}&depart=${depart}&turn=${turn}`)
                this.$router.push({
                    path:'/flights_to',
                    query:{
                        from:from,
                        to:to,
                        depart:depart,
                        turn:turn
                    }
                })
            }
        },
    }
}
</script>
<style scoped>
    .cards{
        display: flex;
        justify-content:space-between;
        padding: 6rem 0;
        margin: 0 auto;
    }
    .fixed{
        width: 30%;
        background-color: rgba(0,0,0,0.7);
        position: absolute;
        left: 0;
        top: 61px;
        z-index: 10;
        padding: 20px 0;
    }
    .place{
        width: 90%;
        border-top: 0;
        border-left: 0;
        border-right: 0;
        border-bottom: 1px solid white;
        outline: 0;
        background-color:transparent;
    }
    .date{
        width: 90%;
        border: 1px solid white;
        background-color: transparent;
    }
    input[type=date]::-webkit-inner-spin-button { visibility: hidden; }
    input[type="date"]::-webkit-calendar-picker-indicator {
        display: inline-block;
        width: 15px;
        height: 15px;
        border: 0;
        border-radius: 2px;
        background-color: transparent;
        color: white; 
    } 
    /* 这是控制年月日之间的斜线或短横线的 */
    input[type="date"]::-webkit-datetime-edit-text {
        color: white; 
        padding: 0 .3em; 
    } 
    /* 控制年字 */
    input[type="date"]::-webkit-datetime-edit-year-field { 
    color: white; 
    } 
    /* 控制月字 */
    input[type="date"]::-webkit-datetime-edit-month-field { 
        color: white; 
    } 
    /* 控制日字 */
    input[type="date"]::-webkit-datetime-edit-day-field  { 
        color: white; 
    } 
    .mybutton{
        color: #000;
    }
    @media screen and (max-width:910px){
        .fixed{width: 50%;}
    }
    @media screen and (max-width:600px){
        .fixed{width: 80%;}
    }
    @media screen and (max-width: 1000px){
        .cards{
            padding: 4rem 0;
            flex-direction: column;
            align-items: center;
        }
    }
    h3{
        text-align: center;
        font: 20px  HelveticaNeueW01-BdExt;
    }
    .intr{
        text-align: center;
        font: 700 14px HelveticaNeueW01-BdExt !important;

    }
    .team img{
        height: 100%;
        width: 100%;
        padding: 8px 0;
    }
    .team ul{
        display: flex;
        flex-wrap: wrap;
        justify-content: space-around;
    }
    .team ul li{
        width: 14%;
    }
</style>

