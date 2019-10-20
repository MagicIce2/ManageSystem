/*
Navicat MySQL Data Transfer

Source Server         : 服务器
Source Server Version : 50605
Source Host           : 211.67.160.21:3306
Source Database       : student

Target Server Type    : MYSQL
Target Server Version : 50605
File Encoding         : 65001

Date: 2019-06-24 08:24:14
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `index_info`
-- ----------------------------
DROP TABLE IF EXISTS `index_info`;
CREATE TABLE `index_info` (
  `index_id` int(5) NOT NULL AUTO_INCREMENT,
  `index_title` varchar(10) DEFAULT NULL,
  `index_content` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`index_id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of index_info
-- ----------------------------
INSERT INTO `index_info` VALUES ('53', '义诊活动', '为传承中华助人为乐的精神，发扬雷锋精神，计算机社团面向全校学生提供一次义诊活动，可以维修一些常见的问题，并且可以安装一些学习的软件，同时还有还会讲解一些常见问题的解决方法。');
INSERT INTO `index_info` VALUES ('54', '硬件教程', '多一分了解，多一份收获，多了解一点硬件可以让你自己动手配置自己的电脑，告别理论，直接进行实践，不用担心学不会，就怕你没时间，而且还会有装机大赛，既能得到证书，还能可以体会其中的happyness。');
INSERT INTO `index_info` VALUES ('55', '软件教程', '看一个人熟悉软件的程度可以看出他是小白还是大神，首先社团会教大家如何安装几种办公软件，并简单让大家了解软件的·使用方法。还有就是安装系统教程，保证你轻轻的来，满载而归。');
INSERT INTO `index_info` VALUES ('56', '前沿科技', '大数据，云计算，区块链，人工智能，物联网最近几年很火，会有专门的人才向大家讲解现在技术的发展方向，将迷茫的你带回正轨，当然中间可以观看电影，让你看到未来的技术，说不定下一个工业革命就是你');

-- ----------------------------
-- Table structure for `resource`
-- ----------------------------
DROP TABLE IF EXISTS `resource`;
CREATE TABLE `resource` (
  `resource_id` int(10) NOT NULL AUTO_INCREMENT,
  `resource_title` varchar(30) NOT NULL,
  `resource_link` varchar(50) NOT NULL,
  `resource_pass` varchar(8) NOT NULL,
  `resource_date` datetime NOT NULL,
  `del` bit(1) DEFAULT b'0',
  PRIMARY KEY (`resource_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of resource
-- ----------------------------
INSERT INTO `resource` VALUES ('1', 'Java微服务', 'https://pan.baidu.com/s/1pjITDMRDiM_4MwcLjGwWYA', 'yei5', '2019-06-19 22:24:05', '');
INSERT INTO `resource` VALUES ('2', 'Git', 'https://pan.baidu.com/s/1QpnbDFTE0zuyIDb9NrlQog', 'lhaj', '2019-06-20 10:14:09', '');
INSERT INTO `resource` VALUES ('3', '渗透测试', 'https://pan.baidu.com/s/1DHV7T9G5Rqcvqdvihsz8iw', '834j', '2019-06-20 10:18:40', '');
INSERT INTO `resource` VALUES ('4', '树莓派教程', 'https://pan.baidu.com/s/1BMdDRZYzeP-tL_s-BxBbdw', '7y8m', '2019-06-20 10:22:40', '');
INSERT INTO `resource` VALUES ('5', '实用数据挖掘与人工智能', 'https://pan.baidu.com/s/1hiKuouSBqaE53dH0YTaKpg', '69kw', '2019-06-20 10:23:32', '');
INSERT INTO `resource` VALUES ('6', '金融相关', 'https://pan.baidu.com/s/1KCymgSPPoZpc5qYJPs_fAQ', '6jrq', '2019-06-22 16:20:36', '');
INSERT INTO `resource` VALUES ('7', '疯狂spring cloud', 'https://pan.baidu.com/s/1GF3PpzZZuApUhoGT6sP7Uw', 'y5zm', '2019-06-22 16:20:59', '');
INSERT INTO `resource` VALUES ('8', '设计模式', 'https://pan.baidu.com/s/1txm-9cP_UD9vLRoFUdEadg', '8180', '2019-06-22 16:21:21', '');
INSERT INTO `resource` VALUES ('9', '上海交大', 'https://pan.baidu.com/s/1_vbbEjRYXZfVw--WdfERLw', 'gkhl', '2019-06-22 16:21:35', '');
INSERT INTO `resource` VALUES ('10', '大数据', 'https://pan.baidu.com/s/1viqU_r04k3kJdizXPcU5eQ', 'nkcp', '2019-06-22 16:21:52', '');
INSERT INTO `resource` VALUES ('11', 'Flutter', 'https://pan.baidu.com/s/13tti8KWqiTL5WWdZrPfmBw', '3crh', '2019-06-22 16:22:09', '');

-- ----------------------------
-- Table structure for `signinfo`
-- ----------------------------
DROP TABLE IF EXISTS `signinfo`;
CREATE TABLE `signinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stuDepart` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `stuClass` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `stuName` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `del` bit(1) DEFAULT b'0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Table structure for `staff`
-- ----------------------------
DROP TABLE IF EXISTS `staff`;
CREATE TABLE `staff` (
  `staff_id` int(6) NOT NULL AUTO_INCREMENT,
  `staff_picture` varchar(30) NOT NULL,
  `staff_name` varchar(10) NOT NULL,
  `staff_depart` varchar(10) DEFAULT NULL,
  `staff_profession` varchar(20) NOT NULL,
  `staff_class` varchar(20) DEFAULT NULL,
  `staff_duty` varchar(20) NOT NULL,
  `staff_introduce` varchar(255) NOT NULL,
  `staff_motto` varchar(255) NOT NULL,
  `staff_sentiment` longtext,
  `del` bit(1) DEFAULT b'0',
  PRIMARY KEY (`staff_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Table structure for `stuinfo`
-- ----------------------------
DROP TABLE IF EXISTS `stuinfo`;
CREATE TABLE `stuinfo` (
  `id` tinyint(5) NOT NULL AUTO_INCREMENT COMMENT '成员id',
  `stuNo` varchar(30) NOT NULL COMMENT '成员学号',
  `stuDepart` varchar(30) NOT NULL COMMENT '成员学院',
  `stuClass` varchar(40) NOT NULL COMMENT '成员班级',
  `stuName` varchar(20) NOT NULL COMMENT '成员姓名',
  `stuPhone` varchar(20) NOT NULL COMMENT '成员手机号',
  `stuSex` varchar(2) NOT NULL COMMENT '成员性别',
  `stuQQ` varchar(20) NOT NULL COMMENT 'QQ',
  `stuPassword` varchar(40) NOT NULL COMMENT '成员密码',
  `stuBirthday` varchar(40) NOT NULL COMMENT '成员出生日期',
  `money` varchar(1) NOT NULL DEFAULT '0' COMMENT '是否已缴费',
  `stuMe` text COMMENT '成员自我介绍',
  `del` char(1) DEFAULT '0',
  `author` tinyint(10) DEFAULT '3' COMMENT '权限表0最高权限，1社团管理层权限，2社团成员权限，3游客权限',
  PRIMARY KEY (`id`,`stuNo`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=gbk ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for `s_class`
-- ----------------------------
DROP TABLE IF EXISTS `s_class`;
CREATE TABLE `s_class` (
  `class_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '班级id',
  `depart_id` int(11) NOT NULL COMMENT '学院id',
  `class_name` varchar(32) NOT NULL COMMENT '班级名称',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_by` int(11) DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`class_id`)
) ENGINE=InnoDB AUTO_INCREMENT=329 DEFAULT CHARSET=utf8 COMMENT='班级信息';

-- ----------------------------
-- Table structure for `s_department`
-- ----------------------------
DROP TABLE IF EXISTS `s_department`;
CREATE TABLE `s_department` (
  `depart_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '学院id',
  `depart_name` varchar(32) NOT NULL COMMENT '学院名称',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`depart_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='学院信息';

-- ----------------------------
-- Table structure for `s_duty`
-- ----------------------------
DROP TABLE IF EXISTS `s_duty`;
CREATE TABLE `s_duty` (
  `duty_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '职务id',
  `duty_name` varchar(32) NOT NULL COMMENT '职务名称',
  `created_by` int(11) DEFAULT NULL COMMENT '创建人',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_by` int(11) DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`duty_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='社团职务';

-- ----------------------------
-- Table structure for `s_file_course`
-- ----------------------------
DROP TABLE IF EXISTS `s_file_course`;
CREATE TABLE `s_file_course` (
  `file_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '文件id',
  `file_name` varchar(32) NOT NULL COMMENT '文件名称',
  `file_url` varchar(128) NOT NULL COMMENT '文件url',
  `is_del` bit(1) DEFAULT b'0' COMMENT '是否删除',
  `created_by` int(11) NOT NULL COMMENT '创建人',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` int(11) DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '更新时间',
  `updated_by` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`file_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='文件教程';