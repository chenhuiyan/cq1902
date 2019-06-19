-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- 主机： 127.0.0.1
-- 生成日期： 2019-06-19 04:14:33
-- 服务器版本： 10.1.37-MariaDB
-- PHP 版本： 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `star`
--

-- --------------------------------------------------------

--
-- 表的结构 `star_cart`
--

CREATE TABLE `star_cart` (
  `cid` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `count` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `star_cart`
--

INSERT INTO `star_cart` (`cid`, `user_id`, `pid`, `count`) VALUES
(1, 1, 5, 1),
(2, 1, 7, 1),
(3, 2, 10, 1),
(4, 3, 4, 1);

-- --------------------------------------------------------

--
-- 表的结构 `star_cities`
--

CREATE TABLE `star_cities` (
  `mid` varchar(3) NOT NULL,
  `city` varchar(20) DEFAULT NULL COMMENT '城市名称'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `star_cities`
--

INSERT INTO `star_cities` (`mid`, `city`) VALUES
('BJS', '北京'),
('CAE', '哥伦比亚'),
('CKG', '重庆'),
('DMK', '曼谷'),
('DXB', '迪拜'),
('FCO', '罗马'),
('HKG', '香港'),
('ICN', '首尔'),
('IST', '伊斯坦布尔'),
('JFK', '纽约'),
('LAX', '洛杉矶'),
('NRT', '东京'),
('SEA', '西雅图'),
('SHA', '上海');

-- --------------------------------------------------------

--
-- 表的结构 `star_plane`
--

CREATE TABLE `star_plane` (
  `pid` int(11) NOT NULL,
  `airlines` varchar(64) DEFAULT NULL,
  `plane` varchar(32) DEFAULT NULL,
  `originating` varchar(11) DEFAULT NULL COMMENT '始发地',
  `destination` varchar(11) DEFAULT NULL COMMENT '目的地',
  `start_time` datetime DEFAULT NULL COMMENT '飞行开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '飞行结束时间',
  `price` decimal(10,0) DEFAULT NULL COMMENT '价格',
  `count` int(11) DEFAULT NULL COMMENT '数量'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `star_plane`
--

INSERT INTO `star_plane` (`pid`, `airlines`, `plane`, `originating`, `destination`, `start_time`, `end_time`, `price`, `count`) VALUES
(1, '上海航空', 'FM557', '重庆', '纽约', '2019-06-10 23:00:00', '2019-06-11 13:24:00', '4300', 1),
(2, '上海航空', 'FM667', '纽约', '东京', '2019-06-13 14:32:00', '2019-06-14 03:00:00', '4100', 1),
(3, '上海航空', 'FM634', '东京', '重庆', '2019-06-17 23:50:00', '2019-06-18 07:24:00', '2700', 1),
(4, '香港航空', 'FM519', '香港', '曼谷', '2019-06-10 23:00:00', '2019-06-11 08:24:00', '1900', 1),
(5, '香港航空', 'FM597', '曼谷', '香港', '2019-06-10 21:00:00', '2019-06-11 06:00:00', '1600', 1),
(6, '上海航空', 'FM869', '洛杉矶', '纽约', '2019-06-15 21:00:00', '2019-06-16 06:00:00', '1600', 1),
(7, '上海航空', 'FM812', '上海', '东京', '2019-06-15 21:00:00', '2019-06-16 06:00:00', '1600', 1),
(8, '上海航空', 'FM817', '上海', '东京', '2019-06-14 21:00:00', '2019-06-14 06:00:00', '1600', 1),
(9, '上海航空', 'FM617', '上海', '东京', '2019-06-13 21:00:00', '2019-06-14 06:00:00', '1600', 1),
(10, '国泰航空', 'FM517', '曼谷', '首尔', '2019-06-15 21:00:00', '2019-06-16 06:00:00', '1600', 1),
(11, '香港航空', 'FM017', '罗马', '香港', '2019-06-15 21:00:00', '2019-06-16 06:00:00', '1600', 1),
(12, '上海航空', 'FM517', '西雅图', '伊斯坦布尔', '2019-06-15 21:00:00', '2019-06-16 06:00:00', '1600', 1),
(13, '中国国航', 'FM507', '迪拜', '北京', '2019-06-15 21:00:00', '2019-06-16 06:00:00', '1600', 1),
(14, '上海航空', 'FM567', '首尔', '香港', '2019-06-15 21:00:00', '2019-06-16 06:00:00', '1600', 1),
(15, '国泰航空', 'FM417', '曼谷', '伊斯坦布尔', '2019-06-15 21:00:00', '2019-06-16 06:00:00', '1600', 1);

-- --------------------------------------------------------

--
-- 表的结构 `star_user`
--

CREATE TABLE `star_user` (
  `user_id` int(11) NOT NULL,
  `uname` varchar(25) DEFAULT NULL,
  `upass` varchar(32) DEFAULT NULL,
  `phone` char(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `star_user`
--

INSERT INTO `star_user` (`user_id`, `uname`, `upass`, `phone`) VALUES
(1, 'tom', '123', ''),
(2, 'jerry', '123', ''),
(3, '123', '123', '12345678900');

--
-- 转储表的索引
--

--
-- 表的索引 `star_cart`
--
ALTER TABLE `star_cart`
  ADD PRIMARY KEY (`cid`);

--
-- 表的索引 `star_cities`
--
ALTER TABLE `star_cities`
  ADD PRIMARY KEY (`mid`);

--
-- 表的索引 `star_plane`
--
ALTER TABLE `star_plane`
  ADD PRIMARY KEY (`pid`);

--
-- 表的索引 `star_user`
--
ALTER TABLE `star_user`
  ADD PRIMARY KEY (`user_id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `star_cart`
--
ALTER TABLE `star_cart`
  MODIFY `cid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- 使用表AUTO_INCREMENT `star_plane`
--
ALTER TABLE `star_plane`
  MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- 使用表AUTO_INCREMENT `star_user`
--
ALTER TABLE `star_user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
