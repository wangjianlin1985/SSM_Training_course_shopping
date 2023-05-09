/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50051
Source Host           : localhost:3306
Source Database       : peixun_course_db

Target Server Type    : MYSQL
Target Server Version : 50051
File Encoding         : 65001

Date: 2020-03-25 00:04:23
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `username` varchar(20) NOT NULL default '',
  `password` varchar(32) default NULL,
  PRIMARY KEY  (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('a', 'a');

-- ----------------------------
-- Table structure for `t_comment`
-- ----------------------------
DROP TABLE IF EXISTS `t_comment`;
CREATE TABLE `t_comment` (
  `commentId` int(11) NOT NULL auto_increment COMMENT '评论id',
  `productObj` int(11) NOT NULL COMMENT '被评商品',
  `content` varchar(1000) NOT NULL COMMENT '评论内容',
  `userObj` varchar(30) NOT NULL COMMENT '评论用户',
  `commentTime` varchar(20) default NULL COMMENT '评论时间',
  PRIMARY KEY  (`commentId`),
  KEY `productObj` (`productObj`),
  KEY `userObj` (`userObj`),
  CONSTRAINT `t_comment_ibfk_1` FOREIGN KEY (`productObj`) REFERENCES `t_product` (`productId`),
  CONSTRAINT `t_comment_ibfk_2` FOREIGN KEY (`userObj`) REFERENCES `t_userinfo` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_comment
-- ----------------------------
INSERT INTO `t_comment` VALUES ('1', '1', '很流畅的课程！', 'user1', '2020-03-14 14:15:13');
INSERT INTO `t_comment` VALUES ('2', '1', '老师讲的非常不错！', 'user1', '2020-03-22 22:31:11');

-- ----------------------------
-- Table structure for `t_leaveword`
-- ----------------------------
DROP TABLE IF EXISTS `t_leaveword`;
CREATE TABLE `t_leaveword` (
  `leaveWordId` int(11) NOT NULL auto_increment COMMENT '留言id',
  `leaveTitle` varchar(80) NOT NULL COMMENT '留言标题',
  `leaveContent` varchar(2000) NOT NULL COMMENT '留言内容',
  `userObj` varchar(30) NOT NULL COMMENT '留言人',
  `leaveTime` varchar(20) default NULL COMMENT '留言时间',
  `replyContent` varchar(1000) default NULL COMMENT '管理回复',
  `replyTime` varchar(20) default NULL COMMENT '回复时间',
  PRIMARY KEY  (`leaveWordId`),
  KEY `userObj` (`userObj`),
  CONSTRAINT `t_leaveword_ibfk_1` FOREIGN KEY (`userObj`) REFERENCES `t_userinfo` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_leaveword
-- ----------------------------
INSERT INTO `t_leaveword` VALUES ('1', '111', '222', 'user1', '2020-03-14 23:46:29', '333', '2020-03-14 23:46:33');
INSERT INTO `t_leaveword` VALUES ('2', 'aa', 'bb', 'user1', '2020-03-13 23:08:02', '很好', '2020-03-13 23:28:01');

-- ----------------------------
-- Table structure for `t_notice`
-- ----------------------------
DROP TABLE IF EXISTS `t_notice`;
CREATE TABLE `t_notice` (
  `noticeId` int(11) NOT NULL auto_increment COMMENT '公告id',
  `title` varchar(80) NOT NULL COMMENT '标题',
  `content` varchar(5000) NOT NULL COMMENT '公告内容',
  `publishDate` varchar(20) default NULL COMMENT '发布时间',
  PRIMARY KEY  (`noticeId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_notice
-- ----------------------------
INSERT INTO `t_notice` VALUES ('1', '课程销售网站成立了', '<p>朋友们可以来这里挑选你们满意的课程！</p>', '2020-03-14 23:47:02');

-- ----------------------------
-- Table structure for `t_orderinfo`
-- ----------------------------
DROP TABLE IF EXISTS `t_orderinfo`;
CREATE TABLE `t_orderinfo` (
  `orderNo` varchar(30) NOT NULL COMMENT 'orderNo',
  `userObj` varchar(30) NOT NULL COMMENT '下单用户',
  `totalMoney` float NOT NULL COMMENT '订单总金额',
  `payWay` varchar(20) NOT NULL COMMENT '支付方式',
  `orderStateObj` varchar(20) NOT NULL COMMENT '订单状态',
  `orderTime` varchar(20) default NULL COMMENT '下单时间',
  `receiveName` varchar(20) NOT NULL COMMENT '收货人',
  `telephone` varchar(20) NOT NULL COMMENT '收货人电话',
  `address` varchar(80) NOT NULL COMMENT '收货人地址',
  `orderMemo` varchar(500) default NULL COMMENT '订单备注',
  PRIMARY KEY  (`orderNo`),
  KEY `userObj` (`userObj`),
  CONSTRAINT `t_orderinfo_ibfk_1` FOREIGN KEY (`userObj`) REFERENCES `t_userinfo` (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_orderinfo
-- ----------------------------
INSERT INTO `t_orderinfo` VALUES ('14433334433', 'user1', '4400', '支付宝', '已付款', '2020-03-09 15:13:14', '马云林', '13958398343', '四川成都万年场13号', 'test');
INSERT INTO `t_orderinfo` VALUES ('user120180122225749', 'user1', '5399', '支付宝', '已发货', '2020-03-12 22:57:49', '双鱼林', '13598308394', '四川成都红星路13号', '尽快发货哦！');
INSERT INTO `t_orderinfo` VALUES ('user120180123234311', 'user1', '4198', '支付宝', '已付款', '2020-03-13 23:43:11', '王忠强', '13598308394', '四川成都红星路13号', 'test333');
INSERT INTO `t_orderinfo` VALUES ('user120180124170109', 'user1', '11976', '支付宝', '已付款', '2020-03-14 17:01:09', '李明霞', '13598308394', '四川成都红星路13号', '测试订单');
INSERT INTO `t_orderinfo` VALUES ('user120180325000054', 'user1', '7866', '支付宝', '已付款', '2020-03-25 00:00:54', '双鱼林', '13598308394', '四川成都红星路13号', '我要预订课程！');

-- ----------------------------
-- Table structure for `t_orderitem`
-- ----------------------------
DROP TABLE IF EXISTS `t_orderitem`;
CREATE TABLE `t_orderitem` (
  `itemId` int(11) NOT NULL auto_increment COMMENT '条目id',
  `orderObj` varchar(30) NOT NULL COMMENT '所属订单',
  `productObj` int(11) NOT NULL COMMENT '订单商品',
  `price` float NOT NULL COMMENT '商品单价',
  `orderNumer` int(11) NOT NULL COMMENT '购买数量',
  PRIMARY KEY  (`itemId`),
  KEY `orderObj` (`orderObj`),
  KEY `productObj` (`productObj`),
  CONSTRAINT `t_orderitem_ibfk_1` FOREIGN KEY (`orderObj`) REFERENCES `t_orderinfo` (`orderNo`),
  CONSTRAINT `t_orderitem_ibfk_2` FOREIGN KEY (`productObj`) REFERENCES `t_product` (`productId`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_orderitem
-- ----------------------------
INSERT INTO `t_orderitem` VALUES ('1', '14433334433', '1', '2200', '2');
INSERT INTO `t_orderitem` VALUES ('2', 'user120180122225749', '1', '2200', '2');
INSERT INTO `t_orderitem` VALUES ('3', 'user120180122225749', '2', '999', '1');
INSERT INTO `t_orderitem` VALUES ('4', 'user120180123234311', '2', '999', '2');
INSERT INTO `t_orderitem` VALUES ('5', 'user120180123234311', '1', '2200', '1');
INSERT INTO `t_orderitem` VALUES ('6', 'user120180124170109', '5', '4888', '2');
INSERT INTO `t_orderitem` VALUES ('7', 'user120180124170109', '1', '2200', '1');
INSERT INTO `t_orderitem` VALUES ('8', 'user120180325000054', '3', '5666', '1');
INSERT INTO `t_orderitem` VALUES ('9', 'user120180325000054', '1', '2200', '1');

-- ----------------------------
-- Table structure for `t_product`
-- ----------------------------
DROP TABLE IF EXISTS `t_product`;
CREATE TABLE `t_product` (
  `productId` int(11) NOT NULL auto_increment COMMENT '商品id',
  `productClassObj` int(11) NOT NULL COMMENT '商品类别',
  `productName` varchar(50) NOT NULL COMMENT '商品名称',
  `mainPhoto` varchar(60) NOT NULL COMMENT '商品图片',
  `productNum` int(11) NOT NULL COMMENT '商品库存',
  `price` float NOT NULL COMMENT '商品价格',
  `recommandFlag` varchar(20) NOT NULL COMMENT '是否推荐',
  `recipeFlag` varchar(20) NOT NULL COMMENT '是否处方药',
  `sksp` varchar(60) NOT NULL COMMENT '试看视频',
  `productDesc` varchar(5000) NOT NULL COMMENT '商品描述',
  `addTime` varchar(20) default NULL COMMENT '发布时间',
  PRIMARY KEY  (`productId`),
  KEY `productClassObj` (`productClassObj`),
  CONSTRAINT `t_product_ibfk_1` FOREIGN KEY (`productClassObj`) REFERENCES `t_productclass` (`classId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_product
-- ----------------------------
INSERT INTO `t_product` VALUES ('1', '1', 'Java基础入门强化课程', 'upload/939600ed-f9c1-4b16-859c-aa3ce513ea33.jpg', '50', '2200', '是', '否', 'upload/e13feb1c-e728-4e1b-b787-74f036528d9a.mp4', '<p><span style=\"color: rgb(102, 102, 102); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);\">《Java&nbsp;Web从入门到精通》由明日科技编著，全书共5篇：&nbsp;</span><br/><span style=\"color: rgb(102, 102, 102); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);\">第1篇：Web开发基础。本篇通过讲解Java&nbsp;Web应用开发概述、HTML与CSS网页开发基础、JavaScript脚本语言和搭建开发环境等内容，并结合大量的图示、实例、视频等使读者快速掌握Web开发基础。&nbsp;</span><br/><span style=\"color: rgb(102, 102, 102); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);\">第2篇：JSP语言基础。本篇通过讲解JSP基本语法、JSP内置对象、JavaBean技术、Servlet技术、过滤器和监听器等内容，结合大量图示、实例、视频等使读者快速掌握JSP语言基础。学&nbsp;</span><br/><span style=\"color: rgb(102, 102, 102); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);\">第3篇：JSP*级内容。本篇通过讲解Java&nbsp;Web的数据库操作、EL（表达式语言）、JSTL标签和Ajax技术等内容，结合大量图示、实例、视频等使读者快速掌握JSP*级内容。&nbsp;</span><br/><span style=\"color: rgb(102, 102, 102); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);\">第4篇：流行框架与XML技术。本篇通过讲解Struts2基础、Struts2*级技术、Hibermate技术、Hibernate高级应用、Spring核心之loC、Spring核心之AOP和JSP操作XML等内容，结合大量图示、实例、视频等使读者快速掌握Java&nbsp;Web常用框架与XML技术。&nbsp;</span><br/><span style=\"color: rgb(102, 102, 102); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);\">第5篇：项目实战。本篇通过开发一个完整的清爽夏日九宫格日记网，运用软件工程的设计思想，让读者学习如何进行Web项目的实践开发。&nbsp;</span></p>', '2020-03-05 23:43:22');
INSERT INTO `t_product` VALUES ('2', '2', 'Android开发从零基础课程', 'upload/128f277e-1f90-4f4d-be7e-e503fd2c366a.jpg', '48', '999', '是', '否', 'upload/e13feb1c-e728-4e1b-b787-74f036528d9a.mp4', '<p>课程目标</p><p>希望通过Android开发找到一份合适的工作，或者想希望转入Android开发的行业的人们</p><p>适用人群</p><p>希望通过Android开发找到一份合适的工作，或者想希望转入Android开发的行业的人们</p><p>课程简介</p><p>课程目标：</p><p>【学习本课程可以掌握哪些技能】</p><p>&nbsp; &nbsp; 从零基础到可以Android开发，具体内容：</p><p>&nbsp; &nbsp; &nbsp; &nbsp; 1、Android基础知识</p><p>&nbsp; &nbsp; &nbsp; &nbsp;2、Android的四大组件：Activity，ContentProvider，Service，BroadcastReceiver。</p><p>&nbsp; &nbsp; &nbsp; &nbsp;3、Android中的消息传递者Intent的使用</p><p>&nbsp; &nbsp; &nbsp; &nbsp;4、Android中如何访问网络，获得数据，解析数据</p><p>&nbsp; &nbsp; &nbsp; &nbsp;5、Android中的数据持久化</p><p>&nbsp; &nbsp; &nbsp; &nbsp;6、Android中的多媒体应用的开发，声音的播放与录制，视频的播放与录制，传感器等</p><p>&nbsp; &nbsp; &nbsp; &nbsp;7、Android中的资源使用等.</p><p><br/></p>', '2020-03-05 22:57:14');
INSERT INTO `t_product` VALUES ('3', '1', 'SpringMVC+Mybatis由浅入深课程', 'upload/06f45595-f7ef-4a2c-96a5-6912da691fb3.jpg', '46', '5666', '是', '否', 'upload/e13feb1c-e728-4e1b-b787-74f036528d9a.mp4', '<p><span style=\"font-size: 18px;\"><span style=\"color: rgb(103, 106, 108); font-family: &quot;Open Sans&quot;, helvetica, arial, sans-serif; background-color: rgb(255, 255, 255);\">强调下越来越多的企业开始选择SpringMVC+Mybatis来构建系统架构，在电商热门的今天，SpringMVC+Mybatis已成为电商项目架构的最佳搭配。SpringMVC和Struts2都属于表现层的框架，SpringMVC是Spring框架的一部分，较于Struts2框架使用的更加广泛;Mybatis和Hibernate都属于持久层的框架，Mybatis是对JDBC操作数据库的的过程进行封装，使开发者只需要关注SQL本身，而不需要花费精力去处理例如注册驱动、创建connection、创建statement、手动设置参数、结果集检索等JDBC繁杂的过程代码。</span><br/><br/><span style=\"color: rgb(103, 106, 108); font-family: &quot;Open Sans&quot;, helvetica, arial, sans-serif; background-color: rgb(255, 255, 255);\">本视频首先由浅入深的讲解了SpringMVC与Mybatis的原理，然后分别结合实际案例教你如何使用这两个框架，最后将SpringMVC、Mybatis以及Spring框架进行整合完成实际项目的某些具体功能。视频内容丰富，讲解清晰易懂，对源码的剖析让你对框架的理解不仅知其然更知其所以然。</span></span></p>', '2020-03-04 16:47:30');
INSERT INTO `t_product` VALUES ('4', '3', ' PHP面向对象篇-MVC架构开发课程', 'upload/30d6c2d4-40d7-46f7-ab7e-9340878fa643.jpg', '55', '1199', '是', '否', 'upload/e13feb1c-e728-4e1b-b787-74f036528d9a.mp4', '<ul class=\" list-paddingleft-2\"><li><p>课程目标</p></li><li><p>通过项目使同学掌握PHP面向对象、理解MVC架构以及很多实用的知识点。</p></li><li><p>适用人群</p></li><li><p>学过PHP基础知识，想系统性的进阶学习PHP的同学，本课程是你的必修课</p></li><li><p>课程简介</p></li><li><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; word-break: break-all; word-wrap: break-word; overflow: hidden;\"><strong style=\"margin: 0px; padding: 0px; word-break: break-all; word-wrap: break-word; overflow: hidden;\">本课程在原理上细腻讲解很多常用知识点、比如：</strong></p><ul class=\" list-paddingleft-2\" style=\"padding: 0px; list-style-position: initial; list-style-image: initial; word-break: break-all; word-wrap: break-word; overflow: hidden;\"><li><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; word-break: break-all; word-wrap: break-word; overflow: hidden;\"><span style=\"margin: 0px; padding: 0px; word-break: break-all; word-wrap: break-word; overflow: hidden; text-decoration: underline;\">面向对象</span></p></li><li><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; word-break: break-all; word-wrap: break-word; overflow: hidden;\"><span style=\"margin: 0px; padding: 0px; word-break: break-all; word-wrap: break-word; overflow: hidden; text-decoration: underline;\">MVC架构</span></p></li><li><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; word-break: break-all; word-wrap: break-word; overflow: hidden;\"><span style=\"margin: 0px; padding: 0px; word-break: break-all; word-wrap: break-word; overflow: hidden; text-decoration: underline;\">命名空间</span></p></li><li><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; word-break: break-all; word-wrap: break-word; overflow: hidden;\"><span style=\"margin: 0px; padding: 0px; word-break: break-all; word-wrap: break-word; overflow: hidden; text-decoration: underline;\">PATHINFO的URL模式</span></p></li><li><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; word-break: break-all; word-wrap: break-word; overflow: hidden;\"><span style=\"margin: 0px; padding: 0px; word-break: break-all; word-wrap: break-word; overflow: hidden; text-decoration: underline;\">URL路由-实现更合理更适于seo优化且符合新闻的url地址</span></p></li><li><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; word-break: break-all; word-wrap: break-word; overflow: hidden;\"><span style=\"margin: 0px; padding: 0px; word-break: break-all; word-wrap: break-word; overflow: hidden; text-decoration: underline;\">预处理执行SQL语句、有效防止SQL注入</span></p></li><li><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; word-break: break-all; word-wrap: break-word; overflow: hidden;\"><span style=\"margin: 0px; padding: 0px; word-break: break-all; word-wrap: break-word; overflow: hidden; text-decoration: underline;\">无限级分类</span></p></li><li><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; word-break: break-all; word-wrap: break-word; overflow: hidden;\"><span style=\"margin: 0px; padding: 0px; word-break: break-all; word-wrap: break-word; overflow: hidden; text-decoration: underline;\">富文本web编辑器</span></p></li><li><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; word-break: break-all; word-wrap: break-word; overflow: hidden;\"><span style=\"margin: 0px; padding: 0px; word-break: break-all; word-wrap: break-word; overflow: hidden; text-decoration: underline;\">用户体验超棒的上传功能</span></p></li><li><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; word-break: break-all; word-wrap: break-word; overflow: hidden;\"><span style=\"margin: 0px; padding: 0px; word-break: break-all; word-wrap: break-word; overflow: hidden; text-decoration: underline;\">session入库</span></p></li><li><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; word-break: break-all; word-wrap: break-word; overflow: hidden;\"><span style=\"margin: 0px; padding: 0px; word-break: break-all; word-wrap: break-word; overflow: hidden; text-decoration: underline;\">位运算实现权限控制</span></p></li><li><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; word-break: break-all; word-wrap: break-word; overflow: hidden;\"><span style=\"margin: 0px; padding: 0px; word-break: break-all; word-wrap: break-word; overflow: hidden; text-decoration: underline;\">网易163式的盖楼新闻评论</span></p></li><li><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; word-break: break-all; word-wrap: break-word; overflow: hidden;\"><span style=\"margin: 0px; padding: 0px; word-break: break-all; word-wrap: break-word; overflow: hidden; text-decoration: underline;\">等等...等等...</span><br/></p></li></ul><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; word-break: break-all; word-wrap: break-word; overflow: hidden;\"><strong style=\"margin: 0px; padding: 0px; word-break: break-all; word-wrap: break-word; overflow: hidden;\">通过实战项目将其融会贯通、使大家更加深入的理解许多实用且常用的知识点。</strong></p></li></ul><p><br/></p>', '2020-03-05 16:52:54');
INSERT INTO `t_product` VALUES ('5', '4', 'Asp.NET Core2.0基础教学', 'upload/239b0e7d-7dba-443f-a099-1286acaf32d8.jpg', '28', '4888', '是', '是', 'upload/e13feb1c-e728-4e1b-b787-74f036528d9a.mp4', '<ul class=\" list-paddingleft-2\"><li><p>课程目标</p></li><li><p>通过本课程的学习，使学员对asp.net core有更深入的了解，可以实现跨平台的开发，提升对asp.net core知识的认识和理解。</p></li><li><p>适用人群</p></li><li><p>熟悉C#, .net , asp.net , asp.net mvc</p></li><li><p>课程简介</p></li><li><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; word-break: break-all; word-wrap: break-word; overflow: hidden;\">Asp.NET Core作为 .net 的跨平台开发Web框架，有意替代原先的asp.net mvc框架，也是.net 平台未来的主要推广方向，所以学会asp.net 是必要的。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; word-break: break-all; word-wrap: break-word; overflow: hidden;\">课程特色：<br/><span style=\"margin: 0px; padding: 0px; word-break: break-all; word-wrap: break-word; overflow: hidden;\">&nbsp;以asp.net core 2.0 版本为基础，手动构建实例、边敲边讲边调试、<span style=\"margin: 0px; padding: 0px; word-break: break-all; word-wrap: break-word; overflow: hidden;\">通俗易懂、</span>知识点划分合理、循序渐进学习asp.net core 的基本知识。</span>着重讲解asp.net core 2.0这样一个应用框架，对asp.net core 的知识得到全面的学习。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; word-break: break-all; word-wrap: break-word; overflow: hidden;\"><br/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; word-break: break-all; word-wrap: break-word; overflow: hidden;\">学习要点：</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; word-break: break-all; word-wrap: break-word; overflow: hidden;\">MVC开发模式，.Net Core基础结构，EntityFramework Core应用，DI依赖注入，过滤器，中间件等知识详解。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; word-break: break-all; word-wrap: break-word; overflow: hidden;\"><br/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; word-break: break-all; word-wrap: break-word; overflow: hidden;\">课程重要性：<br/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; word-break: break-all; word-wrap: break-word; overflow: hidden;\">.net 跨平台开发，拥抱开源。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; word-break: break-all; word-wrap: break-word; overflow: hidden;\"><br/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; word-break: break-all; word-wrap: break-word; overflow: hidden;\"><span style=\"margin: 0px; padding: 0px; word-break: break-all; word-wrap: break-word; overflow: hidden;\">学习建议：</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; word-break: break-all; word-wrap: break-word; overflow: hidden;\"><span style=\"margin: 0px; padding: 0px; word-break: break-all; word-wrap: break-word; overflow: hidden;\">&nbsp; &nbsp; 第一：认真看视频讲解，边听边记笔记；</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; word-break: break-all; word-wrap: break-word; overflow: hidden;\"><span style=\"margin: 0px; padding: 0px; word-break: break-all; word-wrap: break-word; overflow: hidden;\">&nbsp; &nbsp; 第二：学习完一个视频后，打开开发工具将视频里所讲的知识点、实例重现，不会的回到视频温习；</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; word-break: break-all; word-wrap: break-word; overflow: hidden;\"><span style=\"margin: 0px; padding: 0px; word-break: break-all; word-wrap: break-word; overflow: hidden;\">&nbsp; &nbsp; 第三：独立编写视频里所讲的实例，次数不限，直到熟练为止。</span></p></li></ul><p><br/></p>', '2020-03-05 16:55:19');

-- ----------------------------
-- Table structure for `t_productclass`
-- ----------------------------
DROP TABLE IF EXISTS `t_productclass`;
CREATE TABLE `t_productclass` (
  `classId` int(11) NOT NULL auto_increment COMMENT '类别id',
  `className` varchar(40) NOT NULL COMMENT '类别名称',
  `classDesc` varchar(500) NOT NULL COMMENT '类别描述',
  PRIMARY KEY  (`classId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_productclass
-- ----------------------------
INSERT INTO `t_productclass` VALUES ('1', 'Java课程', 'Java课程');
INSERT INTO `t_productclass` VALUES ('2', 'Android课程', '安卓Android');
INSERT INTO `t_productclass` VALUES ('3', 'PHP课程', 'PHP课程');
INSERT INTO `t_productclass` VALUES ('4', 'ASP.NET课程', 'ASP.NET课程');

-- ----------------------------
-- Table structure for `t_recharge`
-- ----------------------------
DROP TABLE IF EXISTS `t_recharge`;
CREATE TABLE `t_recharge` (
  `rechargeId` int(11) NOT NULL auto_increment COMMENT '充值id',
  `userObj` varchar(30) NOT NULL COMMENT '充值用户',
  `rechargeMoney` float NOT NULL COMMENT '充值金额',
  `rechargeMemo` varchar(500) default NULL COMMENT '充值备注',
  `rechargeTime` varchar(20) default NULL COMMENT '充值时间',
  PRIMARY KEY  (`rechargeId`),
  KEY `userObj` (`userObj`),
  CONSTRAINT `t_recharge_ibfk_1` FOREIGN KEY (`userObj`) REFERENCES `t_userinfo` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_recharge
-- ----------------------------
INSERT INTO `t_recharge` VALUES ('1', 'user1', '100', 'test', '2020-03-05 23:46:49');
INSERT INTO `t_recharge` VALUES ('2', 'user1', '500', 'test22', '2020-03-06 23:31:50');
INSERT INTO `t_recharge` VALUES ('3', 'user1', '500', '333', '2020-03-07 23:33:05');
INSERT INTO `t_recharge` VALUES ('4', 'user1', '10000', '充值了好预订课程', '2020-03-25 00:00:12');

-- ----------------------------
-- Table structure for `t_recipel`
-- ----------------------------
DROP TABLE IF EXISTS `t_recipel`;
CREATE TABLE `t_recipel` (
  `recipelId` int(11) NOT NULL auto_increment COMMENT '处方id',
  `recipelPhoto` varchar(60) NOT NULL COMMENT '处方照片',
  `userObj` varchar(30) NOT NULL COMMENT '上传用户',
  `recipelMemo` varchar(500) default NULL COMMENT '处方备注',
  `handState` varchar(20) NOT NULL COMMENT '处理状态',
  `addTime` varchar(20) default NULL COMMENT '上传时间',
  PRIMARY KEY  (`recipelId`),
  KEY `userObj` (`userObj`),
  CONSTRAINT `t_recipel_ibfk_1` FOREIGN KEY (`userObj`) REFERENCES `t_userinfo` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_recipel
-- ----------------------------
INSERT INTO `t_recipel` VALUES ('1', 'upload/NoImage.jpg', 'user1', 'test', '待处理', '2020-03-14 23:46:00');
INSERT INTO `t_recipel` VALUES ('2', 'upload/NoImage.jpg', 'user1', 'test', '已处理', '2020-03-23 22:51:44');

-- ----------------------------
-- Table structure for `t_shopcart`
-- ----------------------------
DROP TABLE IF EXISTS `t_shopcart`;
CREATE TABLE `t_shopcart` (
  `cartId` int(11) NOT NULL auto_increment COMMENT '购物车id',
  `productObj` int(11) NOT NULL COMMENT '商品',
  `userObj` varchar(30) NOT NULL COMMENT '用户',
  `price` float NOT NULL COMMENT '单价',
  `buyNum` int(11) NOT NULL COMMENT '购买数量',
  PRIMARY KEY  (`cartId`),
  KEY `productObj` (`productObj`),
  KEY `userObj` (`userObj`),
  CONSTRAINT `t_shopcart_ibfk_1` FOREIGN KEY (`productObj`) REFERENCES `t_product` (`productId`),
  CONSTRAINT `t_shopcart_ibfk_2` FOREIGN KEY (`userObj`) REFERENCES `t_userinfo` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_shopcart
-- ----------------------------

-- ----------------------------
-- Table structure for `t_userinfo`
-- ----------------------------
DROP TABLE IF EXISTS `t_userinfo`;
CREATE TABLE `t_userinfo` (
  `user_name` varchar(30) NOT NULL COMMENT 'user_name',
  `password` varchar(30) NOT NULL COMMENT '登录密码',
  `name` varchar(20) NOT NULL COMMENT '姓名',
  `gender` varchar(4) NOT NULL COMMENT '性别',
  `birthDate` varchar(20) default NULL COMMENT '出生日期',
  `userPhoto` varchar(60) NOT NULL COMMENT '用户照片',
  `telephone` varchar(20) NOT NULL COMMENT '联系电话',
  `email` varchar(50) NOT NULL COMMENT '邮箱',
  `address` varchar(80) default NULL COMMENT '家庭地址',
  `userMoney` float NOT NULL COMMENT '账户余额',
  `regTime` varchar(20) default NULL COMMENT '注册时间',
  PRIMARY KEY  (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_userinfo
-- ----------------------------
INSERT INTO `t_userinfo` VALUES ('user1', '123', '双鱼林', '男', '2020-01-02', 'upload/2a4f0e05-2407-44d0-b510-0b04a8cfa620.jpg', '13598308394', 'dashen@163.com', '四川成都红星路13号', '4134', '2020-03-04 23:41:53');
