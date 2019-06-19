<template>
  <div>
    <section>
      <div class="bg-img">
        <headed></headed>
      </div>
      <div class="push">
        <pushdown></pushdown>
      </div>
      <div class="card container">
        <div class="card-header">
          <div class="row p-0 m-0 w-100 text-center">
            <div class="col font-weight-bold " v-for="(item,index) of lists" :key="index">{{item}}</div>
          </div>
        </div>
        <div class="card-body">
          <cardItem></cardItem>
        </div>
      </div>
    </section>
    <foot></foot>
  </div>
</template>
<script>
import headed from "./common/header.vue"
import foot from "./common/footer.vue"
import cardItem from "./card-item.vue"
import pushdown from "./common/pushdown.vue"
export default {
  data(){
    return {
      lists:["airlines","plane","products","peice","cancel"]
    }
  },
  components:{
    headed,foot,cardItem,pushdown
  },
  methods:{
  }
}
</script>
<style scoped>
  .bg-img{
    width: 100%;
    min-height:700px;
    background:url(../assets/img/your-orders/BookFlyHero_R.jpg) center center;
    background-size: cover;
    background-attachment: fixed;
  }
  .push{
    position: relative;
  }
  .card{
    padding: 6rem 0;
    border: 0;
  }
  @media screen and (max-width: 600px){
    .card{
      padding:  0;
    }
  }
  .card-header{
    border:0;
    padding: 10px 5px;
  }
  .card-body{
    padding: 0;
  }
  .card-footer{
    border: 0;
    padding: 10px 5px;
    display: flex;
    justify-content: space-between;
    align-items: center;
  }
  .buttonSelect{
    margin-right: 20px;
    padding:5px 10px;
  }
  .buttonAll{
    padding: 5px 10px;
  }
</style>

