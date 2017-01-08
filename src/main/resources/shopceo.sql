/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50624
Source Host           : localhost:3306
Source Database       : shopceo

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2015-06-29 01:34:18
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for adtobiz
-- ----------------------------
DROP TABLE IF EXISTS `adtobiz`;
CREATE TABLE `adtobiz` (
  `pId` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增长主键',
  `adId` varchar(255) DEFAULT NULL COMMENT '广告ID',
  `bizId` varchar(255) DEFAULT NULL COMMENT '商家ID',
  `codeUrl` varchar(255) DEFAULT NULL COMMENT '二维码地址',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`pId`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for advertisement
-- ----------------------------
DROP TABLE IF EXISTS `advertisement`;
CREATE TABLE `advertisement` (
  `pId` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增长主键',
  `adId` varchar(255) DEFAULT NULL COMMENT '广告ID',
  `adName` varchar(255) DEFAULT NULL COMMENT '广告名称',
  `adUrl` varchar(255) DEFAULT NULL COMMENT '广告链接',
  `adDesc` varchar(1000) DEFAULT NULL COMMENT '广告描述',
  `adTDUrl` varchar(255) DEFAULT NULL COMMENT '二维码路径信息',
  `ownerId` varchar(255) DEFAULT NULL COMMENT '广告主',
  PRIMARY KEY (`pId`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for business
-- ----------------------------
DROP TABLE IF EXISTS `business`;
CREATE TABLE `business` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '自增长主键',
  `business_id` varchar(255) DEFAULT NULL COMMENT '商户ID',
  `name` varchar(255) DEFAULT NULL COMMENT '商户名',
  `branch_name` varchar(255) DEFAULT NULL COMMENT '分店名',
  `address` varchar(255) DEFAULT NULL COMMENT '地址',
  `email` varchar(255) DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(255) DEFAULT NULL COMMENT '手机号',
  `telephone` varchar(255) DEFAULT NULL COMMENT '带区号的电话',
  `city` varchar(255) DEFAULT NULL COMMENT '所在城市',
  `regions` varchar(255) DEFAULT NULL COMMENT '所在区域信息列表，如[徐汇区，徐家汇]',
  `categories` varchar(255) DEFAULT NULL COMMENT '所属分类信息列表，如[宁波菜，婚宴酒店]',
  `latitude` float DEFAULT NULL COMMENT '纬度坐标',
  `longitude` float DEFAULT NULL COMMENT '经度坐标',
  `avg_rating` float DEFAULT NULL COMMENT '星级评分，5.0代表五星，4.5代表四星半，依此类推',
  `rating_img_url` varchar(255) DEFAULT NULL COMMENT '星级图片链接',
  `rating_s_img_url` varchar(255) DEFAULT NULL COMMENT '小尺寸星级图片链接',
  `product_grade` int(1) DEFAULT NULL COMMENT '产品/食品口味评价，1:一般，2:尚可，3:好，4:很好，5:非常好',
  `decoration_grade` int(1) DEFAULT NULL COMMENT '环境评价，1:一般，2:尚可，3:好，4:很好，5:非常好',
  `service_grade` int(1) DEFAULT NULL COMMENT '服务评价，1:一般，2:尚可，3:好，4:很好，5:非常好',
  `product_score` float DEFAULT NULL COMMENT '产品/食品口味评价单项分，精确到小数点后一位（十分制）',
  `decoration_score` float DEFAULT NULL COMMENT '环境评价单项分，精确到小数点后一位（十分制）',
  `service_score` float DEFAULT NULL COMMENT '服务评价单项分，精确到小数点后一位（十分制）',
  `avg_price` int(11) DEFAULT NULL COMMENT '人均价格，单位:元，若没有人均，返回-1',
  `review_count` int(11) DEFAULT NULL COMMENT '点评数量',
  `review_list_url` varchar(255) DEFAULT NULL COMMENT '点评页面URL链接',
  `business_url` varchar(255) DEFAULT NULL COMMENT '商户页面链接',
  `photo_url` varchar(255) DEFAULT NULL COMMENT '照片链接，照片最大尺寸700×700',
  `s_photo_url` varchar(255) DEFAULT NULL COMMENT '小尺寸照片链接，照片最大尺寸278×200',
  `photo_count` int(11) DEFAULT NULL COMMENT '照片数量',
  `photo_list_url` varchar(255) DEFAULT NULL COMMENT '照片页面URL链接',
  `has_coupon` int(1) DEFAULT NULL COMMENT '是否有优惠券，0:没有，1:有',
  `coupon_id` int(11) DEFAULT NULL COMMENT '优惠券ID',
  `coupon_description` varchar(255) DEFAULT NULL COMMENT '优惠券描述',
  `coupon_url` varchar(255) DEFAULT NULL COMMENT '优惠券页面链接',
  `has_deal` int(1) DEFAULT NULL COMMENT '是否有团购，0:没有，1:有',
  `deal_count` int(11) DEFAULT NULL COMMENT '商户当前在线团购数量',
  `deals` varchar(255) DEFAULT NULL COMMENT '团购列表',
  `deals_id` varchar(255) DEFAULT NULL COMMENT '团购ID',
  `deals_description` varchar(255) DEFAULT NULL COMMENT '团购描述',
  `deals_url` varchar(255) DEFAULT NULL COMMENT '团购页面链接',
  `has_online_reservation` int(1) DEFAULT NULL COMMENT '是否有在线预订，0:没有，1:有',
  `online_reservation_url` varchar(255) DEFAULT NULL COMMENT '在线预订页面链接，目前仅返回HTML5站点链接',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of business
-- ----------------------------
INSERT INTO `business` VALUES ('1', '6162303', '70后饭吧', '中环百联店', '普陀区真光路1288号百联中环购物广场4楼', null, null, '021-61397933', '上海', null, null, '31.2458', '121.383', '4', 'http://i3.dpfile.com/s/i/app/api/32_4star.png', 'http://i2.dpfile.com/s/i/app/api/16_4star.png', '2', '3', '4', '7.6', '8.3', '7.8', '65', '2645', 'http://lite.m.dianping.com/BfCeRQiP-4', 'http://dpurl.cn/p/2qOiJEcgEu', 'http://i2.dpfile.com/pc/2cc774cdf2400e20521c6aebede4bf55(700x700)/th', 'http://i1.dpfile.com/pc/2cc774cdf2400e20521c6aebede4bf55(278x200)/', '3100', 'http://lite.m.dianping.com/sg3kCRyAHr', '0', '0', null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for business_login
-- ----------------------------
DROP TABLE IF EXISTS `business_login`;
CREATE TABLE `business_login` (
  `pid` int(11) NOT NULL AUTO_INCREMENT COMMENT '登陆表，自增长ID',
  `businessid` varchar(255) DEFAULT NULL COMMENT '商户ID',
  `email` varchar(255) DEFAULT NULL COMMENT '商户邮箱',
  `phone` varchar(255) DEFAULT NULL COMMENT '商户手机号',
  `password` varchar(255) DEFAULT NULL COMMENT '登录密码',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `modifytime` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of business_login
-- ----------------------------
INSERT INTO `business_login` VALUES ('1', null, null, 'admin', 'admin', '2015-06-28 21:40:35', null);
INSERT INTO `business_login` VALUES ('2', 'SH001', '123@123.com', '15651629979', '629979', '2015-06-28 23:36:50', null);
INSERT INTO `business_login` VALUES ('3', 'SH002', '123', '18519206602', '206602', '2015-06-29 01:13:03', null);
