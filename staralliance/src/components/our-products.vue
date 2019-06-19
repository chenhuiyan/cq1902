<template>
  <div> 
    <section>
      <div class="bg-img">
        <headed></headed>
      </div>    
      <div class="push">
        <pushdown></pushdown>     
      </div> 
      <div class="card-container">     
        <div class="row">
          <div class="col-md-4 col-sm-12">
            <card :img="require('../assets/img/our-products/Round the World.png')" :title="`Round the World`" :promise="`With this flexible fare that offers outstanding value for money you can visit 98% of the world’s countries.`" :href="`/#/introduce`"></card>
          </div>
          <div class="col-md-4 col-sm-12">
            <card :img="require('../assets/img/our-products/Circle Pacific.png')" :title="`Circle Pacific`" :promise="`Over 85 destinations in more than 25 countries.`" :href="`/#/introduce`"></card>
          </div>
          <div class="col-md-4 col-sm-12">
            <card :img="require('../assets/img/our-products/Corporate Plus.png')" :title="`Corporate Plus`" :promise="`Your all-in-one solution for global business travel.`" :href="`/#/introduce`"></card>
          </div>
        </div>
      </div> 
    </section>
    <foot></foot>
  </div>
</template>
<script>
import headed from "./common/header.vue"
import foot from "./common/footer.vue"
import card from "./card.vue"
import pushdown from "./common/pushdown.vue"
export default {
  data(){
    return {}
  },
  components:{
    headed,
    foot,
    card,
    pushdown,
  } 
}
</script>
<style scoped>
  .bg-img{
    width: 100%;
    min-height:800px;
    background:url(../assets/img/our-products/InspirationHero_R.jpg) center center;
    background-size: cover;
    background-attachment: fixed;
  }
  .push{
    position: relative;
  }
  .card-container{
    padding: 6rem 0;
    background-color: #f6f5f4;
    position: relative;
  }
  .row{
    max-width: 1280px;
    padding: 0 20px;
    box-sizing: border-box;
    margin: 0 auto;
  }
  @media screen and (max-width:600px){
    .bg-img{
      background:url('../assets/img/our-products/RTW Inspiration RedesignMobile.jpg') no-repeat center center;
      min-height:450px;
    }
  }
</style>
