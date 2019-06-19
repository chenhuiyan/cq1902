//1:引入二个模块  express mysql
const express = require("express");
const mysql = require("mysql");
const bodyParser = require("body-parser")
//2:创建连接池
var pool = mysql.createPool({
  host:"127.0.0.1",
  user:"root",
  password:"",
  port:3306,
  database:"star",
  connectionLimit:15
})
//3:创建express对象
var server = express();
//4:指定静态目录
server.use(express.static("public"))
//5:处理跨域请求
const cors = require("cors");
server.use(cors({
  origin:["http://127.0.0.1:8080",
  "http://localhost:8080"],
  credentials:true
}));
//中间件
server.use(bodyParser.urlencoded({
	extended:false
}))
//6:添加session功能
const session = require("express-session");
server.use(session({
  secret:"128位字符串",
  resave:true,
  saveUninitialized:true
}));
//9:绑定监听端口
server.listen(3000);

//10：接收用户登录请求
server.get("/login",(req,res)=>{
   //1:接收脚手架参数 uname upass
   var uname = req.query.uname;
   var upass = req.query.upass;
   //2:sql
   var sql =" SELECT user_id FROM star_user WHERE uname = ? AND upass = ?";
   //3:返回结果 
   pool.query(sql,[uname,upass],(err,result)=>{
     console.log(result)
     if(err) throw err;
     if(result.length==0){
       res.send({code:-1,msg:"用户名或密码有误"});
     }else{
       //result=[{id:1}]
       req.session.uid = result[0].user_id;
       //console.log("用户id"+req.session.uid)
       res.send({code:1,msg:"登录成功",uid:req.session.uid});
     }        
   });
});
//注册
server.post('/reg',function(req,res){
  //获取数据
  //console.log(req.body);
  //验证数据是否为空
  if(!req.body.uname){
  res.send({code:401,msg:'uname required'});
    //阻止往后执行
    return;
  }
  if(!req.body.upass){
  res.send({code:402,msg:'upass required'});
    return;
  }
  if(!req.body.phone){
  res.send({code:404,msg:'phone required'});
    return;
  }
  //把数据插入到数据库 
  //执行SQL语句
  pool.query('INSERT INTO star_user SET ?',[req.body],function(err,result){
  if(err) throw err;
  if(result.affectedRows>0){
     res.send({code:200,msg:'注册成功',data:result});
  
    }
  });
  });
//根据城市名查询简写
server.get("/selectCity",(req,res)=>{
  var city = req.query.city;
  var sql = "SELECT mid,city FROM star_cities WHERE city=?";
  pool.query(sql,[city],(err,result)=>{
    if(err) throw err
    res.send({code:1,msg:"查询成功",data:result})
  })
})
//添加购物车
server.get("/add",(req,res)=>{
  var {pid,count}=req.query;
  var uid=req.session.uid;
  var sql="select * from star_cart where user_id=? and pid=?";

  pool.query(sql,[uid,pid],(err,result)=>{
    console.log(result)
    if(err) throw err
    if(result.length==0){
      var sql="insert into star_cart values(null,?,?,?)";
      pool.query(sql,[uid,pid,count],(err,result)=>{
        res.send({code:1,msg:"添加成功",data:result});
      })
    }else{
      var sql="update star_cart set count=count+? where user_id=? and pid=?";
      pool.query(sql,[count,uid,pid],(err,result)=>{
        console.log(result)
        res.send({code:2,msg:"修改数量成功",data:result});
      })
    }
  })
})
//查询指定条件机票信息
server.get("/plane",(req,res)=>{
  //参数
  var originating = req.query.originating;
  var destination = req.query.destination;
  var start_time = req.query.start_time+"%";
  var end_time = req.query.end_time+"%";
  //sql
  var sql = "SELECT * FROM star_plane WHERE originating=? and  destination=? and start_time like ? and end_time like ? order by start_time ASC";
   pool.query(sql,[originating,destination,start_time,end_time],(err,result)=>{
     if(err)throw err;
     res.send({code:1,msg:"查询成功",data:result})
   });
 })

//查询指定用户购物车信息
server.get("/cart",(req,res)=>{
  //参数
  var uid = req.session.uid;
  //sql
  var sql = "SELECT cid,pid,count,user_id FROM star_cart WHERE user_id = ? ;"
  pool.query(sql,[uid],(err,result)=>{
    if(err)throw err;
    res.send({code:1,msg:"查询成功",data:result})
  });
})
//根据购物车查询出的pid查询机票信息
server.get("/query",(req,res)=>{
  //参数
  var pid = req.query.pid;
  //sql
  var sql = "SELECT * FROM star_plane WHERE pid = ? ;"
  pool.query(sql,[pid],(err,result)=>{
    if(err)throw err;
    res.send({code:1,msg:"查询成功",data:result})
  });
})
//删除指定购物车中一个商品
server.get("/del",(req,res)=>{
  //参数:id
  var cid = req.query.cid;
  var uid = req.query.user_id;
  //sql:
  var sql = "DELETE FROM star_cart WHERE cid = ? and user_id = ?";
  //json
  pool.query(sql,[cid,uid],(err,result)=>{
     if(err)throw err;
     console.log(result);
     res.send({code:1,msg:"取消成功"})
  })
})
