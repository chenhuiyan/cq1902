<template>
    <div><!--容器-->
        <headed></headed>
        <div class="swiper-container">
            <!--轮播图片-->
            <div class="swiper-wrapper">
                <div class="swiper-slide" data-swiper-autoplay="3000">
                    <img class="w-100" src="../assets/img/index/carousel1-big.jpg" alt=""/>
                </div>
                <div class="swiper-slide" data-swiper-autoplay="3000">
                    <img class="w-100" src="../assets/img/index/carousel2-big.jpg" alt=""/>
                </div>
                <div class="swiper-slide" data-swiper-autoplay="3000">
                    <img class="w-100" src="../assets/img/index/carousel3-big.jpg" alt=""/>
                </div>
                <div class="swiper-slide" data-swiper-autoplay="3000">
                    <img class="w-100" src="../assets/img/index/carousel4-big.jpg" alt=""/>
                </div>
            </div>
            <!-- 如果需要分页器 -->
            <div class="swiper-pagination"></div>
            
            <!-- 如果需要导航按钮 -->
            <div class="swiper-button-prev"></div>
            <div class="swiper-button-next"></div>
            
            <!-- 如果需要滚动条 -->
            <!-- <div class="swiper-scrollbar"></div> -->
        </div>
        <!-- 固定搜索栏 -->
        <div class="fixed text-center d-sm-none d-xl-block">
            <h4 class="text-center fixed-color">Scan more than 18800 daily flights</h4>
            <div class="w-100">
                <div class="fixed-color">From</div>
                <input class="place fixed-color text-center" type="text" @change="From" v-model="from" placeholder="城市(city)">
                <div class="fixed-color">To</div>
                <input class="place fixed-color text-center" type="text" @change="To" v-model="to" placeholder="城市(city)">
                <div class="fixed-color">Departure date</div>
                <!-- <input class="date" type="date" v-model="depart"> -->
                <el-date-picker class="date1"
                    v-model="depart"
                    align="right"
                    type="date"
                    :placeholder="time"
                    :picker-options="pickerOptions">
                </el-date-picker>
                <div class="fixed-color">Return date</div>
                <!-- <input class="date" type="date" v-model="turn"> -->
                <el-date-picker class="date1"
                    v-model="turn"
                    align="right"
                    type="date"
                    :placeholder="time"
                    :picker-options="pickerOptions">
                </el-date-picker>
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
import headed from "./common/header.vue";
import card from "./common/card.vue";
import news from "./common/news.vue";
export default {
  data() {
    return {
      imgs: [
        require("../assets/img/index/team/Adria Airways.png"),
        require("../assets/img/index/team/Aegean Airlines.png"),
        require("../assets/img/index/team/Air Canada.png"),
        require("../assets/img/index/team/Air China.png"),
        require("../assets/img/index/team/Air India.png"),
        require("../assets/img/index/team/Air New Zealand.png"),
        require("../assets/img/index/team/All Nippon Airways.png"),
        require("../assets/img/index/team/Asiana Airlines.png"),
        require("../assets/img/index/team/Austrian Airlines.png"),
        require("../assets/img/index/team/Avianca.png"),
        require("../assets/img/index/team/Brussels Airlines.png"),
        require("../assets/img/index/team/Croatia Airlines.png"),
        require("../assets/img/index/team/Adria Airways.png"),
        require("../assets/img/index/team/Egypt Air.png"),
        require("../assets/img/index/team/Ethiopian Airlines.png"),
        require("../assets/img/index/team/EVA_Airways.png"),
        require("../assets/img/index/team/LOT Polish Airlines.png"),
        require("../assets/img/index/team/Lufthansa.png"),
        require("../assets/img/index/team/SAS Scandanavian_2017.png"),
        require("../assets/img/index/team/Shenzen.png"),
        require("../assets/img/index/team/Singapore Airlines.png"),
        require("../assets/img/index/team/South African Airways.png"),
        require("../assets/img/index/team/Swiss.png"),
        require("../assets/img/index/team/Adria Airways.png"),
        require("../assets/img/index/team/TAP Portugal.png"),
        require("../assets/img/index/team/Thai.png"),
        require("../assets/img/index/team/Turkish Airlines.png"),
        require("../assets/img/index/team/united.png")
      ],
      from: "",
      to: "",
      depart: "",
      turn: "",
      time:"yyyy-mm-dd",
      pickerOptions: {
        disabledDate(time) {
          return time.getTime() < Date.now()- 3600 * 1000 * 24;
        },
        shortcuts: [
          {
            text: "Today",
            onClick(picker) {
              picker.$emit("pick", new Date());
            }
          },
          {
            text: "Tomorrow",
            onClick(picker) {
              const date = new Date();
              date.setTime(date.getTime() + 3600 * 1000 * 24);
              picker.$emit("pick", date);
            }
          },
          {
            text: "A week later",
            onClick(picker) {
              const date = new Date();
              date.setTime(date.getTime() + 3600 * 1000 * 24 * 7);
              picker.$emit("pick", date);
            }
          }
        ]
      }
    };
  },
  components: {
    foot: foot,
    headed,
    card,
    news
  },
  mounted() {
    var mySwiper = new Swiper(".swiper-container", {
      //direction: 'vertical',
      speed:2000,
      autoplay: true,
      loop: true,
      effect: "cube",
      cube: {
        slideShadows: true,
        shadow: true,
        shadowOffset: 20,
        shadowScale: 0.1
      },
      navigation: {
        nextEl: ".swiper-button-next",
        prevEl: ".swiper-button-prev"
      },
      pagination: ".swiper-pagination"
    });
  },
  methods: {
    From() {
      var from = this.from;
      this.axios.get("selectCity", { params: { city: from } }).then(result => {
        this.from = `${result.data.data[0].city}(${result.data.data[0].mid})`;
        //console.log(this.from)
      });
    },
    To() {
      var to = this.to;
      this.axios.get("selectCity", { params: { city: to } }).then(result => {
        this.to = `${result.data.data[0].city}(${result.data.data[0].mid})`;
      });
    },
    find() {
      // console.log(this.from);
      if (this.from == undefined || this.from == null || this.from == "") {
        this.$toast("from required");
        return;
      }
      if (this.to == undefined || this.to == null || this.to == "") {
        this.$toast("to required");
        return;
      }
      if (
        this.depart == undefined ||
        this.depart == null ||
        this.depart == ""
      ) {
        this.$toast("depart date required");
        return;
      }
      if (this.turn == undefined || this.turn == null || this.turn == "") {
        this.$toast("return date required");
        return;
      }
      if (
        (this.from !== undefined || this.from !== null || this.from !== "") &&
        (this.to !== undefined || this.to !== null || this.to !== "")
      ) {
        var from = this.from;
        var to = this.to;
        var depart = this.depart;
        var turn = this.turn;

        var departMonth = depart.getMonth()+1
        if(departMonth<10) departMonth="0"+departMonth
        var departDate = depart.getDate()
        if(departDate<10) departDate="0"+departDate
        depart = `${depart.getFullYear()}-${departMonth}-${departDate}`

        var turnMonth = turn.getMonth()+1
        if(turnMonth<10) turnMonth="0"+turnMonth
        var turnDate = turn.getDate()
        if(turnDate<10) turnDate="0"+turnDate
        turn = `${turn.getFullYear()}-${turnMonth}-${turnDate}`
        // console.log(depart)
        // console.log(turn)
        //this.$router.push(`/flights_to?from=${from}&to=${to}&depart=${depart}&turn=${turn}`)
        this.$router.push({
          path: "/flights_to",
          query: {
            from: from,
            to: to,
            depart: depart,
            turn: turn
          }
        });
      }
    }
  }
};
</script>
<style scoped>
.cards {
  display: flex;
  justify-content: space-between;
  padding: 6rem 0;
  margin: 0 auto;
}
.swiper-button-prev {
  background-image: url(../assets/img/index/left.png);
}
.swiper-button-next {
  background-image: url(../assets/img/index/right.png);
}
.fixed {
  width: 25%;
  background-color: rgba(0, 0, 0, 0.45);
  position: absolute;
  left: 0;
  top: 61px;
  z-index: 10;
  padding: 20px 0;
}
.fixed-color {
  color: rgba(255, 255, 255, 0.8);
}
.place {
  width: 90%;
  /* padding: 0 20px; */
  border-top: 0;
  border-left: 0;
  border-right: 0;
  border-bottom: 1px solid white;
  outline: 0;
  background-color: transparent;
}
.el-date-editor.el-input,
.el-date-editor.el-input__inner {
  width: 90%;
}
.date1 {
  width: 90%;
  background-color: transparent;
}
.mybutton {
  display: inline-block;
  background-color: #ebca7a;
  border-color: #ebca7a;
  color: #000;
  position: relative;
  overflow: hidden;
  font: 700 14px HelveticaNeueW01-BdExt !important;
  max-width: 30rem !important;
  padding: 12px 18px;
  line-height: 1.42857;
  border-radius: 4px;
  vertical-align: middle;
}
@media screen and (max-width: 600px) {
  .fixed {
    display: none;
  }
}
@media screen and (max-width: 1000px) {
  .cards {
    padding: 4rem 0;
    flex-direction: column;
    align-items: center;
  }
}
h3 {
  text-align: center;
  font: 20px HelveticaNeueW01-BdExt;
}
.intr {
  text-align: center;
  font: 700 14px HelveticaNeueW01-BdExt !important;
}
.team img {
  height: 100%;
  width: 100%;
  padding: 8px 0;
}
.team ul {
  display: flex;
  flex-wrap: wrap;
  justify-content: space-around;
}
.team ul li {
  width: 14%;
}
</style>