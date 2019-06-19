#db.sql 数据库脚本文件
SET NAMES UTF8;
#丢弃数据库
DROP DATABASE IF EXISTS star;
#创建数据库
CREATE DATABASE star CHARSET UTF8;
USE star;

#用户表
CREATE TABLE star_user(
 user_id INT PRIMARY KEY AUTO_INCREMENT,
 uname VARCHAR(25),
 upass VARCHAR(32),
 phone char(11)
);
INSERT INTO star_user VALUES(null,'tom','123',"");
INSERT INTO star_user VALUES(null,'jerry','123',"");


#城市简写
CREATE TABLE star_cities(
  mid VARCHAR(3) PRIMARY KEY,
  city VARCHAR(20) DEFAULT NULL COMMENT '城市名称'
);
INSERT INTO star_cities(mid,city) VALUES 
('CKG','重庆'),('FCO','罗马'),
('SHA','上海'),('JFK','纽约'),
('LAX','洛杉矶'),('IST','伊斯坦布尔'),
('BJS','北京'),('DMK','曼谷'),
('ICN','首尔'),('SEA','西雅图'),
('CAE','哥伦比亚'),('DXB','迪拜'),
('HKG','香港'),('NRT','东京');

#购物车
CREATE TABLE star_cart (
  cid INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,
  pid INT,  
  count INT
); 
INSERT INTO star_cart VALUES
(1,1,5,1),
(2,1,7,1),
(3,2,10,1);

#机票信息
CREATE TABLE star_plane (
  pid INT PRIMARY KEY AUTO_INCREMENT,
  airlines VARCHAR(64),
  plane VARCHAR(32),
  originating VARCHAR(11) DEFAULT NULL COMMENT '始发地',
  destination VARCHAR(11) DEFAULT NULL COMMENT '目的地',
  start_time datetime DEFAULT NULL COMMENT '飞行开始时间',
  end_time datetime DEFAULT NULL COMMENT '飞行结束时间',
  price decimal DEFAULT NULL COMMENT '价格',
  count INT DEFAULT NULL COMMENT '数量'
); 
INSERT INTO star_plane VALUES
(null,"上海航空","FM557","重庆","纽约","2019/6/10 23:00","2019/6/11 13:24",4300,"1"),
(null,"上海航空","FM667","纽约","东京","2019/6-13 14:32","2019/6/14 03:00",4100,"1"),
(null,"上海航空","FM634","东京","重庆","2019/6/17 23:50","2019/6/18 07:24",2700,"1"),
(null,"香港航空","FM519","香港","曼谷","2019/6/10 23:00","2019/6/11 08:24",1900,"1"),
(null,"香港航空","FM597","曼谷","香港","2019/6/10 21:00","2019/6/11 06:00",1600,"1"),
(null,"上海航空","FM869","洛杉矶","纽约","2019/6/15 21:00","2019/6/16 06:00",1600,"1"),
(null,"上海航空","FM812","上海","东京","2019/6/15 21:00","2019/6/16 06:00",1600,"1"),
(null,"上海航空","FM817","上海","东京","2019/6/14 21:00","2019/6/14 06:00",1600,"1"),
(null,"上海航空","FM617","上海","东京","2019/6/13 21:00","2019/6/14 06:00",1600,"1"),
(null,"国泰航空","FM517","曼谷","首尔","2019/6/15 21:00","2019/6/16 06:00",1600,"1"),
(null,"香港航空","FM017","罗马","香港","2019/6/15 21:00","2019/6/16 06:00",1600,"1"),
(null,"上海航空","FM517","西雅图","伊斯坦布尔","2019/6/15 21:00","2019/6/16 06:00",1600,"1"),
(null,"中国国航","FM507","迪拜","北京","2019/6/15 21:00","2019/6/16 06:00",1600,"1"),
(null,"上海航空","FM567","首尔","香港","2019/6/15 21:00","2019/6/16 06:00",1600,"1"),
(null,"国泰航空","FM417","曼谷","伊斯坦布尔","2019/6/15 21:00","2019/6/16 06:00",1600,"1");

