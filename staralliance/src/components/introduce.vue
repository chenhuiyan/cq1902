<template>
    <div>     
        <headd></headd>
        <section>
            <div class="top_img ">
                <img class="w-100" src="../assets/image/introduce/NewRomanticJourneyHero.jpg" alt="">
            </div>
            <div><pushdown></pushdown></div>
            <div class="row">
                <div class="left_text col-md-7 col-sm-12">
                  <h3>Romantic Journey</h3>
                  <p class="text_l">See some of the world’s most beautiful sunsets, islands and beaches.  Enjoy a nonchalant gondola ride down a Venice canal. Pose for pictures in front of the Eiffel Tower before riding to the top and seeing the French capital city unfold before you. Appreciate the amazing views from Vancouver’s Sea to Sky Gondola.</p>                 
                  <p class="text_l">Whether you are travelling the world with the one you love – or rather journeying in search of a perfect partner – locations like these provide the perfect romantic backdrop for those special moments. Relax and soak up the romance. Turn your honeymoon into a lifetime experience.</p>
                  <p class="text_l">See how one travel blogging couple added more adventure to this itinerary.</p>
                </div>
                <div class="col-md-4 col-sm-12 pl-5">
                    <p class="right_text">Here’s our Romantic Round the World journey proposal:</p>
                    <router-link to="/flights_to">
                    <ul>
                        <li v-for="(item,index) of list" :key="index"><a class="little_text" href="javascript:;">{{item}}</a></li>
                    </ul>
                    </router-link>
                </div>
            </div>
            <!-- <div>
                <card :img="require('../assets/image/introduce/photo.jpg')" :details="`More Inspiration`" :href="`#`"></card>
                <card :img="require('../assets/image/introduce/BookFlyHero_R.jpg')" :details="`Book and Fly`" :href="`#`"></card>
            </div> -->
            <div class="container cards w-100">
            <card  :img="require('../assets/image/introduce/photo.jpg')" :href="`/#/inspiration`" :where="`More Inspiration`" :buy="``"></card>
            <card :img="require('../assets/image/introduce/BookFlyHero_R.jpg')" :href="`/#/inspiration`" :where="`Book and Fly`" :buy="``"></card>
        </div>
        </section>
        <foott></foott>
    </div>
</template>

<script>
import headd from "./common/header.vue"
import foott from "./common/footer.vue"
import card from "./common/card.vue"
import pushdown from "./common/pushdown.vue"
export default {
    data(){
        return{
            list:["Beijing (BJS)","Tianjin (TSN)","Shanghai (SHA)","Chongqing (CGK)","Chengdu (CTU)","Changsha (CSX)","Hangzhou (HGH)","Shenzhen (SZX)","Guangzhou (CAN)","Nanjing (NKG)"],
        }
    },
    components:{
        headd,
        foott,
        card,pushdown
    }
}
</script>
<style scoped>
    .top_img{
        min-height: auto;
    }
    /* Romantic Journey */
    h3{
        font-size:30px;
        margin-top:20px;
        font-family: HelveticaNeueW01-BdExt;
        font-weight: bold;
    } 
    /* 左侧文字 */
    .left_text{
        margin-left:20px ;
        font-family: HelveticaNeueW01-BdExt;
    }
    .text_l{
        padding:0 0 10px;
        font-family: HelveticaNeueW01-BdExt;
    }
    /* 右侧内容 */
    .right_text{
        margin: 30px 0 8px;
        font-family: HelveticaNeueW01-BdExt;
    }
    ul{
        list-style: none;
        position: relative;
        margin-bottom: 18px;
    }
    /* 地点 */
    ul li a.little_text{
        text-decoration:none;
        color:#C2A357;
        font-weight:bolder;
        font-family: Aharoni;
        margin-left: 10px;
        font-family: HelveticaNeueW01-BdExt;
    }
    /* 竖线 */
    ul::before{
        content: '';
        width: 1px;
        position: absolute;
        height: calc(100% - 20px);
        background: #B6B6B6;
        left: 16px;
        padding: 10px 0;
        top: 10px;
    }
  /* 小圆点 */
    ul li::before{
        content: "\2022";
        color: #B6B6B6;
        font-weight: 700;
        display: inline-block;
        width: 2rem;
        margin-left: -2rem;
        margin-top: -10px;
        position: absolute;
        font-size: 25px;
    }
    .cards{
        display: flex;
        justify-content:space-between;
        padding: 6rem 0;
        margin: 0 auto;
    }
    @media screen and (max-width: 1000px){
        .cards{
            padding: 4rem 0;
            flex-direction: column;
            align-items: center;
        }
    }
    @media screen and (max-width: 767px){
        .right_text{
        margin-left: -10px;
        }
    }
</style>
