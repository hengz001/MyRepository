/*
Navicat MySQL Data Transfer

Source Server         : zhuheng_test
Source Server Version : 50717
Source Host           : 192.168.1.6:3306
Source Database       : database_zh

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2017-12-31 21:28:19
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for course_info
-- ----------------------------
DROP TABLE IF EXISTS `course_info`;
CREATE TABLE `course_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cname` varchar(20) DEFAULT NULL,
  `caddress` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course_info
-- ----------------------------
INSERT INTO `course_info` VALUES ('1', '物联网', '湖北鄂州');
INSERT INTO `course_info` VALUES ('2', '人工智能', '湖北武汉');

-- ----------------------------
-- Table structure for course_user_info
-- ----------------------------
DROP TABLE IF EXISTS `course_user_info`;
CREATE TABLE `course_user_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `cid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `cid` (`cid`),
  CONSTRAINT `course_user_info_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user_info` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `course_user_info_ibfk_2` FOREIGN KEY (`cid`) REFERENCES `course_info` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course_user_info
-- ----------------------------
INSERT INTO `course_user_info` VALUES ('1', '1', '1');
INSERT INTO `course_user_info` VALUES ('2', '2', '1');
INSERT INTO `course_user_info` VALUES ('3', '3', '1');
INSERT INTO `course_user_info` VALUES ('4', '4', '1');
INSERT INTO `course_user_info` VALUES ('5', '5', '1');
INSERT INTO `course_user_info` VALUES ('6', '1', '2');
INSERT INTO `course_user_info` VALUES ('7', '2', '2');
INSERT INTO `course_user_info` VALUES ('8', '3', '2');
INSERT INTO `course_user_info` VALUES ('9', '4', '2');
INSERT INTO `course_user_info` VALUES ('10', '5', '2');

-- ----------------------------
-- Table structure for tb_dep
-- ----------------------------
DROP TABLE IF EXISTS `tb_dep`;
CREATE TABLE `tb_dep` (
  `dep_id` int(11) NOT NULL AUTO_INCREMENT,
  `dep_sn` varchar(255) DEFAULT NULL,
  `dep_name` varchar(255) DEFAULT NULL,
  `dep_desc` varchar(255) DEFAULT NULL,
  `flag` int(11) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  PRIMARY KEY (`dep_id`),
  KEY `FKtenyp8vi90lwv0wrva6j1nu6c` (`pid`),
  CONSTRAINT `FKtenyp8vi90lwv0wrva6j1nu6c` FOREIGN KEY (`pid`) REFERENCES `tb_dep` (`dep_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_dep
-- ----------------------------
INSERT INTO `tb_dep` VALUES ('1', '1', 'BOOS', 'BOOS', '1', null);
INSERT INTO `tb_dep` VALUES ('2', '2', 'CEO', 'CEO', '1', '1');
INSERT INTO `tb_dep` VALUES ('3', '3', 'DBA', 'DBA', '1', '2');
INSERT INTO `tb_dep` VALUES ('4', '4', 'CFO', 'CFO', '1', '1');

-- ----------------------------
-- Table structure for tb_emp
-- ----------------------------
DROP TABLE IF EXISTS `tb_emp`;
CREATE TABLE `tb_emp` (
  `emp_id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_name` varchar(255) DEFAULT NULL,
  `emp_sn` varchar(255) DEFAULT NULL,
  `emp_sex` varchar(255) DEFAULT NULL,
  `emp_address` varchar(255) DEFAULT NULL,
  `emp_phone` varchar(255) DEFAULT NULL,
  `emp_job` varchar(255) DEFAULT NULL,
  `emp_img` varchar(255) DEFAULT NULL,
  `dep_id` int(11) DEFAULT NULL,
  `flag` int(11) DEFAULT NULL,
  PRIMARY KEY (`emp_id`),
  KEY `FKel9y0rycol03onpot4w6mugp8` (`dep_id`),
  CONSTRAINT `FKel9y0rycol03onpot4w6mugp8` FOREIGN KEY (`dep_id`) REFERENCES `tb_dep` (`dep_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_emp
-- ----------------------------
INSERT INTO `tb_emp` VALUES ('1', 'zhuheng', '001', '111', '111', '111', '111', '/WEB/imgs/empheng.jpg', '1', '1');
INSERT INTO `tb_emp` VALUES ('2', '2', '001', null, null, null, '111', null, '2', '1');
INSERT INTO `tb_emp` VALUES ('3', '3', null, null, null, null, '111', null, '3', '1');
INSERT INTO `tb_emp` VALUES ('4', '4', null, null, null, null, '111', null, '4', '1');
INSERT INTO `tb_emp` VALUES ('5', '5', null, null, null, null, '222', null, '1', '1');
INSERT INTO `tb_emp` VALUES ('6', '6', null, null, null, null, '333', null, '2', '1');
INSERT INTO `tb_emp` VALUES ('7', '7', null, null, null, null, '222', null, '3', '1');
INSERT INTO `tb_emp` VALUES ('8', '8', null, null, null, null, '333', null, '4', '1');
INSERT INTO `tb_emp` VALUES ('9', '9', null, null, null, null, '222', null, '1', '1');
INSERT INTO `tb_emp` VALUES ('10', '10', null, null, null, null, '333', null, '2', '1');
INSERT INTO `tb_emp` VALUES ('11', '11', null, null, null, null, '222', null, '3', '1');

-- ----------------------------
-- Table structure for tb_mod
-- ----------------------------
DROP TABLE IF EXISTS `tb_mod`;
CREATE TABLE `tb_mod` (
  `m_id` int(11) NOT NULL AUTO_INCREMENT,
  `m_name` varchar(255) DEFAULT NULL,
  `m_address` varchar(255) DEFAULT NULL,
  `m_path_c` varchar(255) DEFAULT NULL,
  `m_path_n` varchar(255) DEFAULT NULL,
  `m_sn` varchar(255) DEFAULT NULL,
  `flag` int(11) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  PRIMARY KEY (`m_id`),
  KEY `FKa7v6cim5ugintpofxnd2j5ump` (`pid`),
  CONSTRAINT `FKa7v6cim5ugintpofxnd2j5ump` FOREIGN KEY (`pid`) REFERENCES `tb_mod` (`m_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_mod
-- ----------------------------
INSERT INTO `tb_mod` VALUES ('7', '组织管理', 'mod/mod_showRightModule.action', 'WEB/imgs/zzgl_normal.jpg', 'WEB/imgs/zzgl_choose.jpg', null, '1', null);
INSERT INTO `tb_mod` VALUES ('8', '权限管理', 'mod/mod_showRightModule.action', 'WEB/imgs/qxgl_normal.jpg', 'WEB/imgs/qxgl_choose.jpg', null, '1', null);
INSERT INTO `tb_mod` VALUES ('9', '公文管理', 'mod/mod_showRightModule.action', 'WEB/imgs/gwgl_normal.jpg', 'WEB/imgs/gwgl_choose.jpg', null, '1', null);
INSERT INTO `tb_mod` VALUES ('10', '流程管理', 'mod/mod_showRightModule.action', 'WEB/imgs/lcgl_normal.jpg', 'WEB/imgs/lcgl_choose.jpg', null, '1', null);
INSERT INTO `tb_mod` VALUES ('11', '部门管理', 'dep/dep.action', 'WEB/imgs/icos/zzgl.jpg', null, null, '1', '7');
INSERT INTO `tb_mod` VALUES ('12', '员工管理', 'emp/emp_index.action', 'WEB/imgs/icos/yggl.jpg', null, null, '1', '7');
INSERT INTO `tb_mod` VALUES ('13', ' 模块管理', 'mod/mod.action', 'WEB/imgs/icos/mkgl.jpg', null, null, '1', '8');
INSERT INTO `tb_mod` VALUES ('14', '账号管理', null, 'WEB/imgs/icos/zhgl.jpg', null, null, '1', '8');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(16) NOT NULL,
  `password` varchar(16) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uname` varchar(20) DEFAULT NULL,
  `unumber` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES ('1', '赵小云', '89757');
INSERT INTO `user_info` VALUES ('2', '朱张飞', '89758');
INSERT INTO `user_info` VALUES ('3', '关子羽', '89759');
INSERT INTO `user_info` VALUES ('4', '马超云', '89760');
INSERT INTO `user_info` VALUES ('5', '黄忠国', '89761');
