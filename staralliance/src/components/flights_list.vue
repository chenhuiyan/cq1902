<template>
    <div>
        <div class="row  w-100" v-for="(item,index) of res" :key="index">
           <div class="col text p-0">
             <span class="text_title">{{item.originating}}-{{item.destination}}</span><br>
             <img src="../assets/image/flights_to/a3-large-fc.png" alt=""><br>
             <!-- <span>.|cmp-travel-class--ECONOMY</span> -->
           </div>
           <div class="Takeoff_Time col p-0">
              <span>{{new Date(item.start_time).toLocaleString()}}</span>
              <br>
              <!-- <span>CLT</span> -->
           </div>
           <!-- <div class="col-2 Arrow"> -->
           <!-- </div> -->
           <div class="col Arrival_Time m-0 p-0">
              <span>{{new Date(item.end_time).toLocaleString()}}</span>
              <br>
              <!-- <span>IST</span> -->
           </div>
           <div class="col price p-0">
               <span>￥{{(item.price).toFixed(2)}}</span>&nbsp;&nbsp;
           </div>
           <div class="col book p-0">
               <mt-button @click="book" :data-pid="item.pid">Book</mt-button>
           </div>
          </div>
        </div>
</template>
<script>
export default {
    data(){
        return{

        }
    },
    props:{
        res:"",
    },
    updated(){
        for(var i =0;i<this.res.length;i++){
            console.log(this.res[i])
        }
    },
    methods:{
        book(e){
            var pid = e.target.dataset.pid
            var user_id = parseInt(sessionStorage.getItem("uid"))
            console.log(pid,user_id)
            this.axios.get("add",{
                params:{
                    user_id:user_id,
                    pid:pid,
                    count:1
                }
            }).then(result=>{
                this.axios.get("query",{params:{pid:pid}}).then(result=>{
                    console.log(result)
                    var item = result.data.data[0]
                  
                    var start_year = new Date(item.start_time).getFullYear()
                    var start_month = new Date(item.start_time).getMonth()+1
                    var start_date = new Date(item.start_time).getDate()
                    var start_hour = new Date(item.start_time).getHours()
                    var start_minute = new Date(item.start_time).getMinutes()
                    if(start_minute == 0) start_minute="00"

                    var end_year = new Date(item.end_time).getFullYear()
                    var end_month = new Date(item.end_time).getMonth()+1
                    var end_date = new Date(item.end_time).getDate()
                    var end_hour = new Date(item.end_time).getHours()
                    var end_minute = new Date(item.end_time).getMinutes()
                    if(end_minute == 0) end_minute="00"

                    this.$messagebox({
                        title:"预订成功",
                        message:`${item.airlines} ${item.plane}<br>${item.destination}-${item.originating}<br>${start_year}年${start_month}月${start_date}日 ${start_hour}:${start_minute}-${end_year}年${end_month}月${end_date}日 ${end_hour}:${end_minute}<br>登机人：${sessionStorage.getItem("uname")}`,
                        showConfirmButton:true
                    })
                })
               
            })
        }
    }
}
</script>
<style scoped>
.row{
    /* max-width: 1000px; */
    /* display: flex;
    justify-content: space-between;
    align-items: center; */
    padding: 20px 0;
    border: 1px solid rgba(32, 29, 29, 0.1);
    
}
.text_title{
    font:bold 14px HelveticaNeueW01-BdExt;

}
  .text{
      font:12px  HelveticaNeueW01-BdExt;
  }
  /* 航空公司小图标 */
  .text img{
       width:100px;
  }
  /* 箭头 */
  /* .Arrow{
      width:50px;
      height: 50px;
      background:url("../assets/image/flights_to/flight_arrow.png") no-repeat center right;
  } */
  /* 时间 */
  /* .Takeoff_Time{
      text-align: right;
      padding:0 15px;
  } */
  /* .Arrival_Time{
      text-align: left;
      padding:0 15px;
  } */
  /* 价格 */
  /* .price{
      padding-left: 90px;
  } */
  /* 订票按钮 */
  button{
      background-color: #ebca7a;
      border-radius:0.15rem;
      outline:none;
      border:none;
      box-shadow: #ebca7a;
  }
</style>

