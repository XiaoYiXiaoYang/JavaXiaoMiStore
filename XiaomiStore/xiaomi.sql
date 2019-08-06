/*
Navicat MySQL Data Transfer

Source Server         : 20190416
Source Server Version : 50712
Source Host           : localhost:3306
Source Database       : xiaomi

Target Server Type    : MYSQL
Target Server Version : 50712
File Encoding         : 65001

Date: 2019-07-26 11:27:16
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `cart`
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart` (
  `pre_id` int(50) NOT NULL AUTO_INCREMENT,
  `uid` int(50) NOT NULL,
  `good_id` int(50) NOT NULL,
  `good_num` int(50) NOT NULL,
  `status` int(1) NOT NULL,
  `price` double(50,0) DEFAULT NULL,
  PRIMARY KEY (`pre_id`),
  KEY `cart_user_id` (`uid`),
  KEY `cart_good_id` (`good_id`),
  CONSTRAINT `cart_good_id` FOREIGN KEY (`good_id`) REFERENCES `good` (`good_id`) ON UPDATE NO ACTION,
  CONSTRAINT `cart_user_id` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cart
-- ----------------------------
INSERT INTO `cart` VALUES ('27', '2', '17', '1', '0', '1199');
INSERT INTO `cart` VALUES ('28', '2', '20', '2', '0', '2998');

-- ----------------------------
-- Table structure for `good`
-- ----------------------------
DROP TABLE IF EXISTS `good`;
CREATE TABLE `good` (
  `good_id` int(50) NOT NULL AUTO_INCREMENT,
  `good_name` varchar(20) NOT NULL,
  `good_price` double(10,0) NOT NULL,
  `good_type` varchar(50) NOT NULL,
  `good_color` varchar(10) NOT NULL,
  `good_count` int(50) NOT NULL,
  `good_img` varchar(100) NOT NULL,
  `good_desc` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`good_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of good
-- ----------------------------
INSERT INTO `good` VALUES ('1', '小米6', '2499', '4+64', '黑色', '3', './image/liebiao_xiaomi6.jpg', '一款好手机，红色孕育着喜庆');
INSERT INTO `good` VALUES ('2', '小米5', '2599', '3+32', '白色', '50', './image/liebiao_xiaomi5.jpg', '白色小米5');
INSERT INTO `good` VALUES ('3', '红米4', '1599', '2+16', '白色', '3', './image/hm4-80.jpg', '红米手机');
INSERT INTO `good` VALUES ('4', '红米4A', '1299', '2+16', '粉红色', '10', './image/hm4A-80.jpg', '粉红色的红米4A手机');
INSERT INTO `good` VALUES ('5', '红米4X', '1699', '2+16', '浅黄色', '10', './image/hm4x_80.png', '浅黄色的');
INSERT INTO `good` VALUES ('6', '红米note4', '1899', '3+32', '白色', '10', './image/hmnote4-80.jpg', '白色的红米note');
INSERT INTO `good` VALUES ('7', '红米4x', '1699', '4+64', '黑色', '10', './image/hongmi4x.png', '黑色的红米4x');
INSERT INTO `good` VALUES ('8', '红米4', '1599', '4+64', '白色', '9', './image/hongmin4.png', '白色的红米5');
INSERT INTO `good` VALUES ('9', '红米4', '1699', '3+32', '黑色', '10', './image/liebiao_hongmin4.jpg', '黑色的红米4');
INSERT INTO `good` VALUES ('10', '红米4', '1599', '2+16', '黑色', '10', './image/liebiao_hongmin4_dd.jpg', '黑色的红米4dd');
INSERT INTO `good` VALUES ('11', '小米6', '1779', '6GB内存+64GB', '亮黑色', '3', './image/gwc_xiaomi6.jpg', '短板不一般');
INSERT INTO `good` VALUES ('12', '小米CC9e', '1399', '6GB+64GB', '蓝色', '50', './image/gwc_xiaomi6.jpg', '前置3200万自拍 / 索尼4800万超广角三摄 / 4030mAh大电量 / 3D全曲面玻璃机身，浪漫满分的全新配色 / 6.088英寸三星 AMOLED水滴屏 /第七代屏幕指纹 ');
INSERT INTO `good` VALUES ('13', '红米 Note7', '1199', '6G+64G', '亮黑色', '10', './image/pms_1547020900.2384643.jpg', '4800万拍照千元机 / “满血版”骁龙660处理器 / 品质“小金刚”，18个月超长质保 / 4000mAh 大电量 / 6.3\" 水滴全面屏 / USB-C 接口，方便耐用 / 支持快充 4 协议');
INSERT INTO `good` VALUES ('14', '红米 Note7', '1199', '6G+64G', '镜花水月', '10', './image/pms_1563325775.88248262.jpg', '4800万拍照千元机 / “满血版”骁龙660处理器 / 品质“小金刚”，18个月超长质保 / 4000mAh 大电量 / 6.3\" 水滴全面屏 / USB-C 接口，方便耐用 / 支持快充 4 协议');
INSERT INTO `good` VALUES ('15', '红米 Note7', '1199', '6G+64G', '梦幻蓝', '10', './image/pms_1547020972.223707.jpg', '4800万拍照千元机 / “满血版”骁龙660处理器 / 品质“小金刚”，18个月超长质保 / 4000mAh 大电量 / 6.3\" 水滴全面屏 / USB-C 接口，方便耐用 / 支持快充 4 协议');
INSERT INTO `good` VALUES ('16', '红米 Note7', '1199', '6G+64G', '暮光金', '10', './image/pms_1547020988.40043705.jpg', '4800万拍照千元机 / “满血版”骁龙660处理器 / 品质“小金刚”，18个月超长质保 / 4000mAh 大电量 / 6.3\" 水滴全面屏 / USB-C 接口，方便耐用 / 支持快充 4 协议');
INSERT INTO `good` VALUES ('17', '红米 Note7', '1199', '4G+64G', '梦幻蓝', '10', './image/pms_1547020972.223707.jpg', '4800万拍照千元机 / “满血版”骁龙660处理器 / 品质“小金刚”，18个月超长质保 / 4000mAh 大电量 / 6.3\" 水滴全面屏 / USB-C 接口，方便耐用 / 支持快充 4 协议');
INSERT INTO `good` VALUES ('18', '红米 Note7', '1199', '4G+64G', '亮黑色', '10', './image/pms_1547020900.2384643.jpg', '4800万拍照千元机 / “满血版”骁龙660处理器 / 品质“小金刚”，18个月超长质保 / 4000mAh 大电量 / 6.3\" 水滴全面屏 / USB-C 接口，方便耐用 / 支持快充 4 协议');
INSERT INTO `good` VALUES ('19', '红米 Note7', '1199', '4G+64G', '暮光金', '10', './image/pms_1547020988.40043705.jpg', '4800万拍照千元机 / “满血版”骁龙660处理器 / 品质“小金刚”，18个月超长质保 / 4000mAh 大电量 / 6.3\" 水滴全面屏 / USB-C 接口，方便耐用 / 支持快充 4 协议');
INSERT INTO `good` VALUES ('20', '红米 Note7', '1499', '4G+128G', '暮光金', '8', './image/pms_1553857517.69717235.jpg', '4800万拍照千元机 / “满血版”骁龙660处理器 / 品质“小金刚”，18个月超长质保 / 4000mAh 大电量 / 6.3\" 水滴全面屏 / USB-C 接口，方便耐用 / 支持快充 4 协议');
INSERT INTO `good` VALUES ('21', '小米Max 3', '1229', '4GB+64GB', '黑色', '10', './image/pms_1531878148.12071712.jpg', '大屏大电量 ，震撼视界 / 5500mAh 电量，支持给多个设备充电 / AI 双摄超大像素，双核对焦 / 单手可握纤薄全金属机身');
INSERT INTO `good` VALUES ('22', '小米Max 3', '1229', '4GB+64GB', '金色', '10', './image/pms_1531878001.22998509.jpg', '大屏大电量 ，震撼视界 / 5500mAh 电量，支持给多个设备充电 / AI 双摄超大像素，双核对焦 / 单手可握纤薄全金属机身');
INSERT INTO `good` VALUES ('23', '小米Max 3', '1599', '6GB+128GB', '黑色', '10', './image/pms_1531878231.4339834.jpg', '大屏大电量 ，震撼视界 / 5500mAh 电量，支持给多个设备充电 / AI 双摄超大像素，双核对焦 / 单手可握纤薄全金属机身');
INSERT INTO `good` VALUES ('24', '小米Max 3', '1599', '6GB+128GB', '金色', '10', './image/pms_1531878216.04982543.jpg', '大屏大电量 ，震撼视界 / 5500mAh 电量，支持给多个设备充电 / AI 双摄超大像素，双核对焦 / 单手可握纤薄全金属机身');
INSERT INTO `good` VALUES ('25', '小米Max 3', '1599', '6GB+128GB', '蓝色', '10', './image/pms_1531904124.43417445.jpg', '大屏大电量 ，震撼视界 / 5500mAh 电量，支持给多个设备充电 / AI 双摄超大像素，双核对焦 / 单手可握纤薄全金属机身');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `uid` int(50) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `phonenumber` varchar(11) NOT NULL,
  `address` varchar(50) DEFAULT NULL,
  `hobby` varchar(100) DEFAULT NULL,
  `sign` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'xiaowang', '123', '15022223333', '长安大学', '国漫', '我的天下');
INSERT INTO `user` VALUES ('2', 'xiaohong', '123456', '15222223333', '西安大学', '足球', '谁来主宰');
INSERT INTO `user` VALUES ('3', 'xiaozhang', '555', '16302010102', '西北大学', '足球', '天下我有');
INSERT INTO `user` VALUES ('4', '2016900324', '222222', '15222223333', '西交大学', '足球', '仨');
INSERT INTO `user` VALUES ('5', '111111', '111111', '15222223333', '西交大学', '足球', '仨');
INSERT INTO `user` VALUES ('6', '555666333', '222222', '15222223333', '西交大学', '使得', '仨');
INSERT INTO `user` VALUES ('7', 'a2016900324', '123456', '15222223333', '西交大学', '足球', '仨');
INSERT INTO `user` VALUES ('14', 'yteng1111', '456456', '15222223333', '西交大学', '足球', '仨');

-- ----------------------------
-- Table structure for `xmorder`
-- ----------------------------
DROP TABLE IF EXISTS `xmorder`;
CREATE TABLE `xmorder` (
  `order_id` int(50) NOT NULL AUTO_INCREMENT,
  `uid` int(50) NOT NULL,
  `cart_id` varchar(50) NOT NULL,
  `order_status` int(1) NOT NULL,
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xmorder
-- ----------------------------
INSERT INTO `xmorder` VALUES ('1', '2', '28#', '3', '2019-07-26 10:02:37');
