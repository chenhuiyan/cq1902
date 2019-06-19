<template>
    <div class="Content">
        <div class="little_title w-100 m-0">
          <div class="little_item" v-for="(item,index) of list" :key="index">{{item}}</div>
        </div>
        <div class="right">
          <div class="chb">
              <!-- <input class="mb-0" type="radio">Roundtrip&nbsp;&nbsp; -->
              <input class="mb-0" type="radio">One-way
          </div>
          <br>
          <input class="Input" type="text" placeholder="城市(City)" v-model="from" @change="From"><br>
          <input class="Input" type="text" placeholder="城市(City)" v-model="to" @change="To"><br> 
          <!-- <input class="Input" :placeholder="i" v-for="(i,n) of content" type="date" :key="n">   -->
          <input type="date" class="Input" placeholder="yyyy-mm-dd" v-model="depart"><br>
          <input type="date" class="Input" placeholder="yyyy-mm-dd" v-model="turn">
          <br>
          <div class="chb">
              <input type="checkbox">Seniors (65+) &nbsp;&nbsp;
              <input type="checkbox">Children (2-12)
           </div>
           <br>
           <button class="btn_search p-2" @click="search" v-on:child-say="sayHello">Search Flights</button>
        </div>
    </div>
</template>
<script>
export default {
    data(){
        return{
            list:["Type","From","To","Departure date","Return date"],
            /*content:["yyyy-mm-dd","yyyy-mm-dd"],*/
            from:"",
            to:"",
            depart:"",
            turn:"",
            res:""
        }
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
        search(){
            //console.log(this.from)
            if(this.from == undefined || this.from == null || this.from == ""){
                this.$toast("from required") 
                retuen;              
            }
            if(this.to == undefined || this.to == null || this.to == ""){
                this.$toast("to required")  
                retuen;             
            }
            if((this.from !== undefined || this.from !== null || this.from !== "") && (this.to !== undefined || this.to !== null || this.to !== "")){
                console.log(
                    this.depart,
                    this.turn,
                    this.from.split("(")[0],
                    this.to.split("(")[0]
                )
                this.axios.get("plane",{params:{
                    originating:this.from.split("(")[0],
                    destination:this.to.split("(")[0]
                }}).then(res=>{
                    this.res = res.data.data
                })
            }
        },
        sayHello(){
            this.$emit("child-say",this.res)
        }

    }
    
}
</script>
<style scoped>
    /* 图片上整个搜索div */
  .Content{
      background-color:rgba(32, 29, 29, 0.5);
      height:500px;
      margin:30px 50px;
      color:#fff;
      display: flex;
      justify-content: space-between;
      align-items: center;
      padding:0 250px;
  }
  @media screen and (max-width: 600px){
      .Content{
          margin: 0;
      }
  }
  /* 左边文字内容 */
  .little_title{   
      display: flex;
      flex-direction: column;
      align-items: flex-end; 
  }
  .little_item{     
      padding: 8px 0 25px 0;
      font-size:18px;
      width: 150px;
  }
  /* 右边输入栏 */
  .chb{
    width:250px;
  }
  .right{
      width:100px;
      padding-top:50px;
      position: relative;;
  }
  .Input{
     display: inline-block;
     width: 240px;
     margin:12px 0;
     padding: 5px;
     border:none;
     outline:none;
     box-shadow:1px 1px 1px 1px #ebca7a;
  }
  /* 航班搜索button */
  .btn_search{
      width: 115px;
      background-color: #ebca7a;
      border-radius:0.25rem;
      outline:none;
      border:none;
      box-shadow: #ebca7a;
      position: absolute;
      right:-140px;
  }
  @media screen and (min-width: 992px){
    
 }
  @media screen and (min-width: 768px) and (max-width: 991px){
  
  }
  @media screen and (max-width: 767px){
     .right{
      margin-left:-80px;
     }
     .little_item{     
      padding: 8px 0 25px 0;
      font-size:18px;
      width: 210px;
    }
    .content{
      background-color:rgba(0,0,0,0.3);
    }
  }
</style>

