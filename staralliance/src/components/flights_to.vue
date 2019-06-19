<template>
  <div>
    <headd></headd>
    <section>
      <div class="bgImg">
        <div class="content m-0">
          <div class="text_bg">
            <p>Book flights with Star Alliance member airlines</p>
          </div>
          <div class="Content">
            <div class="little_title w-100 m-0">
              <div class="little_item" v-for="(item,index) of lists" :key="index">{{item}}</div>
            </div>
            <div class="right">
              <div class="chb">
                <!-- <input class="mb-0" type="radio">Roundtrip&nbsp;&nbsp; -->
                <input class="mb-0" type="radio" checked>One-way
              </div>
              <br>
              <input class="Input" type="text" placeholder="城市(City)" v-model="from" @change="From">
              <br>
              <input class="Input" type="text" placeholder="城市(City)" v-model="to" @change="To">
              <br>
              <!-- <input class="Input" :placeholder="i" v-for="(i,n) of content" type="date" :key="n">   -->
              <!-- <input type="date" class="Input" placeholder="yyyy-mm-dd" v-model="depart"> -->
              <el-date-picker class="date1 my-2"
                v-model="depart"
                align="right"
                type="date"
                :placeholder="time"
                :picker-options="pickerOptions">
              </el-date-picker>
              <br>
              <!-- <input type="date" class="Input" placeholder="yyyy-mm-dd" v-model="turn"> -->
              <el-date-picker class="date1 my-2"
                v-model="turn"
                align="right"
                type="date"
                :placeholder="time"
                :picker-options="pickerOptions">
              </el-date-picker>
              <br>
              <div class="chb">
                <input type="checkbox">Seniors (65+) &nbsp;&nbsp;
                <input type="checkbox">Children (2-12)
              </div>
              <br>
              <button class="btn_search p-2" @click="search">Search Flights</button>
            </div>
          </div>
        </div>
      </div>
      <div class="list container p-0">
        <div class="title m-0">
          <div class="row w-100 text-center">
            <div class="col p-0" v-for="(item,index) of list" :key="index">{{item}}</div>
          </div>
          <div>
            <list :res="res"></list>
          </div>
        </div>
      </div>
    </section>
    <foott></foott>
  </div>
</template>
<script>
import headd from "./common/header.vue";
import foott from "./common/footer.vue";
// import search from './flights_search';
import list from "./flights_list";

export default {
  data() {
    return {
      list: [
        "Flight information",
        "Take-off time",
        "Arrival time",
        "Price",
        "book"
      ],
      lists: ["Type", "From", "To", "Departure date", "Return date"],
      /*content:["yyyy-mm-dd","yyyy-mm-dd"],*/
      from: "",
      to: "",
      depart: "",
      turn: "",
      res: "",
      time:"yyyy-mm-dd",
      pickerOptions: {
                disabledDate(time) {
                    return time.getTime() < Date.now()- 3600 * 1000 * 24;
                },
                shortcuts: [{
                    text: 'Today',
                    onClick(picker) {
                    picker.$emit('pick', new Date());
                    }
                }, {
                    text: 'Tomorrow',
                    onClick(picker) {
                    const date = new Date();
                    date.setTime(date.getTime() + 3600 * 1000 * 24);
                    picker.$emit('pick', date);
                    }
                }, {
                    text: 'A week later',
                    onClick(picker) {
                    const date = new Date();
                    date.setTime(date.getTime() + 3600 * 1000 * 24 * 7);
                    picker.$emit('pick', date);
                    }
                }]
            },
    };
  },
  components: {
    headd,
    foott,
    // search,
    list
  },
  created(){
    var params = this.$router.history.current.query
    if(location.href == "http://127.0.0.1:8080/#/flights_to"){
      this.from = ""
      this.to = ""
      this.depart = ""
      this.turn = ""
    }else{   
      this.from = params.from
      this.to = params.to
      this.depart = params.depart
      this.turn = params.turn
      this.axios
      .get("plane", {
        params: {
          originating: this.from.split("(")[0],
          destination: this.to.split("(")[0],
          start_time:this.depart,
          end_time:this.turn
        }
      })
      .then(res => {
        this.res = res.data.data;
        // console.log(this.res);
      });
    }
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
    search() {
      //console.log(this.from)
      if (this.from == undefined || this.from == null || this.from == "") {
        this.$toast("from required");
        return;
      }
      if (this.to == undefined || this.to == null || this.to == "") {
        this.$toast("to required");
        return;
      }
      if(this.depart == undefined || this.depart == null || this.depart == ""){
        this.$toast("depart date required")  
        return;             
      }
      if(this.turn == undefined || this.turn == null || this.turn == ""){
        this.$toast("return date required")  
        return;             
      }
      if (
        (this.from !== undefined || this.from !== null || this.from !== "") &&
        (this.to !== undefined || this.to !== null || this.to !== "")
      ) {
        var depart = this.depart
        var turn = this.turn
        // console.log(depart)
        // console.log(turn)

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
        // console.log(
        //   depart,
        //   turn,
        //   this.from.split("(")[0],
        //   this.to.split("(")[0]
        // );
        this.axios
          .get("plane", {
            params: {
              originating: this.from.split("(")[0],
              destination: this.to.split("(")[0],
              start_time:depart,
              end_time:turn
            }
          })
          .then(res => {
            this.res = res.data.data;
            // console.log(this.res);
          });
      }
    }
  }
};
</script>
<style scoped>
/* 背景图 */
section >>> .bgImg {
  width: 100%;
  min-height: 700px;
  background: url("../assets/image/flights_to/STAR-BACKGROUND-BLUE-COLOR.jpg")
    no-repeat center center;
  opacity: 0.85;
  background-size: cover;
  background-attachment: fixed;
}
/*大标题 */
p {
  padding: 10px 0;
  font-size: 30px;
  color: #fff;
  font-weight: bold;
  font-family: HelveticaNeueW01-BdExt;
}
.text_bg {
  padding-top: 65px;
  background-color: rgba(54, 50, 50, 0.5);
}
.list {
  /* width: 1000xp; */
  padding: 6rem 0 !important;
}
/* 航班信息头部 */
.title {
  margin: 0 70xp;
  text-align: center;
  font-size: 20px;
  font-weight: bold;
  height: 100%;
}
.col {
  text-align: center;
  height: fit-content;
}
.row {
  /* max-width: 1000px; */
  /* margin-left: 16px; */
  background-color: rgba(31, 27, 27, 0.05);
}
.w-25 {
  text-align: center;
}

.Content {
  background-color: rgba(32, 29, 29, 0.5);
  height: 500px;
  margin: 30px 50px;
  color: #fff;
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 0 250px;
}
@media screen and (max-width: 500px) {
  .Content {
    margin: 0;
  }
}
/* 左边文字内容 */
.little_title {
  display: flex;
  flex-direction: column;
  align-items: flex-end;
}
.little_item {
  padding: 8px 0 25px 0;
  font-size: 18px;
  width: 150px;
}
/* 右边输入栏 */
.chb {
  width: 250px;
}
.right {
  width: 100px;
  padding-top: 50px;
  position: relative;
}
.el-date-editor.el-input, .el-date-editor.el-input__inner {
  width: 240px;
}
.Input {
  display: inline-block;
  width: 240px;
  height: 40px;
  margin: 12px 0;
  padding: 5px 10px;
  border: none;
  color: #606266;
  font-size: 14px;
  outline: none;
  /* box-shadow: 1px 1px 1px 1px #ebca7a; */
  border-radius: 3px;
}
/* 航班搜索button */
.btn_search {
  width: 115px;
  background-color: #ebca7a;
  border-radius: 0.25rem;
  outline: none;
  border: none;
  box-shadow: #ebca7a;
  position: absolute;
  right: -140px;
}
@media screen and (min-width: 992px) {
}
@media screen and (min-width: 768px) and (max-width: 991px) {
}
@media screen and (max-width: 767px) {
  .right {
    margin-left: -80px;
  }
  .little_item {
    padding: 8px 0 25px 0;
    font-size: 18px;
    width: 210px;
  }
  .content {
    background-color: rgba(0, 0, 0, 0.3);
  }
}
</style>
