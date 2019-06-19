<template>
  <div>
    <div class="item row  m-0 w-100 text-center" v-for="(item,index) of list" :key="index" >
      <!-- <input type="checkbox" name="" id=""> -->
      <div class="col airlines">
        <span>{{item.airlines}}</span>
      </div>
      <div class="col plane">
        <span>{{item.plane}}</span>
      </div>
      <div class="col product" >
        <span>{{item.originating}} — {{item.destination}}</span><br>
        <span>{{`${new Date(item.start_time).getFullYear()}/${new Date(item.start_time).getMonth()+1}/${new Date(item.start_time).getDate()} ${new Date(item.start_time).getHours()}:${new Date(item.start_time).getMinutes()==0?"00":new Date(item.start_time).getMinutes()}`}} — {{`${new Date(item.end_time).getFullYear()}/${new Date(item.end_time).getMonth()+1}/${new Date(item.end_time).getDate()} ${new Date(item.end_time).getHours()}:${new Date(item.end_time).getMinutes()==0?"00":new Date(item.end_time).getMinutes()}`}}</span><br>
      </div>
      <div class="col price">￥{{(item.price).toFixed(2)}}</div>
      <!-- <div class="col sum">{{item.count}}</div>
      <div class="col total">￥{{parseInt(item.count*item.price).toFixed(2)}}</div> -->
      <div class="col">
        <mt-button class="mybutton font-weight-bold " @click="remove" :data-cid="item.cid">cancal</mt-button>
        <mt-button class="info" @click.prevent="info" :data-cid="item.cid">details</mt-button>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  data(){
    return {
      list:[],
    }
  },
  created(){
    this.loadMore()
  },
  methods:{
    loadMore(){
      this.axios.get("cart").then(result=>{    
        //console.log(result.data.data)
        for(let i=0;i<result.data.data.length;i++){
          var pid = result.data.data[i].pid;
          // var cid = result.data.data[i].cid;
          // console.log(pid,cid)
          var this1 = this;
          !function(cid){ //使用闭包形成作用域  调用两次不同的cid
            this1.axios.get("query",{
              params:{pid:pid}
            }).then(result=>{
              var arr = result.data.data
              //console.log(arr)
              //this1.list = this1.list.concat(result.data.data)  
              for(let item of arr){
                item.cid = cid
                console.log(i)
              }
              this1.list = this1.list.concat(arr)
              //console.log(this1.list)
            })
          }(result.data.data[i].cid)
        } 
      }) 
    },
    remove(e){
      this.$messagebox({
        title:"消息",
        message:"是否取消行程",
        showConfirmButton:true,
        showCancelButton:true
      }).then(result=>{
        //console.log(result)
        //如果用户选中取消按钮，停止执行    
        if(result == "cancel"){
          return ;
        }else{
          //1.获取当前商品cid
          var cid = e.target.dataset.cid
          //console.log(cid)
          var uid = sessionStorage.getItem("uid")
          //console.log(uid)
          //2.发送ajax删除商品
          this.axios.get("del",{
            params:{cid,user_id:uid} //cid:cid
          }).then(result=>{
            this.$toast(result.data.msg)
            //3.刷新
            window.location.reload()
          })
        }
      })    
    },
    info(e){
      var cid = e.target.dataset.cid
      for(var i =0;i<this.list.length;i++){
        if(this.list[i].cid == cid){
          console.log(this.list[i])
          var item = this.list[i]
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
            title:"Ticket Details",
            message:`${item.airlines} ${item.plane}<br>${item.destination}-${item.originating}<br>${start_year}/${start_month}/${start_date} ${start_hour}:${start_minute} - ${end_year}/${end_month}/${end_date} ${end_hour}:${end_minute}<br>Passenger : ${sessionStorage.getItem("uname")}`,
            showConfirmButton:true
          })  
        }
      } 
    }
  }
}
</script>
<style scoped>
  .item{
    background-color: rgb(255,255,255);
    padding: 5px;
    border: 1px solid rgba(0,0,0,0.03);
    display: flex;
    justify-content: space-between;
    align-items: center
  }
  .product{
    font: 12px HelveticaNeueW01-BdExt;
  }
  .col{
    padding: 2rem 0;
  }
  .mybutton{
    outline: 0;
    background-color:#EBCA7A;
    font: 16px HelveticaNeueW01-BdExt;
  }
  .info{
    outline: 0;
    background: transparent;
    font: 12px HelveticaNeueW01-BdExt;
    border: 0 !important;
  }
  .info:active{
    background-color: transparent !important;
  }
</style>
