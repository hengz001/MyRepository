/*
Navicat MySQL Data Transfer

Source Server         : mySql_z
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : database_zh

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2018-01-01 23:11:45
*/

SET FOREIGN_KEY_CHECKS=0;

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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_emp
-- ----------------------------
INSERT INTO `tb_emp` VALUES ('1', 'zhuheng', '001', '111', '111', '111', '111', '/WEB/imgs/empheng.jpg', '1', '1');
INSERT INTO `tb_emp` VALUES ('2', '2', '001', null, null, null, '111', null, '2', '1');
INSERT INTO `tb_emp` VALUES ('7', '7', 'zhuheng1', '1', '1111111', '111111111', '222', null, '3', '1');
INSERT INTO `tb_emp` VALUES ('8', '8', 'zhuheng', '2', '222222', '222222222', '333', null, '4', '1');
INSERT INTO `tb_emp` VALUES ('12', 'zzz', '123', '3123', '132', '12312', 'CEO', '/WEB/imgs/empzhgl.jpg', null, '1');

-- ----------------------------
-- Table structure for tb_gorup
-- ----------------------------
DROP TABLE IF EXISTS `tb_gorup`;
CREATE TABLE `tb_gorup` (
  `g_id` int(11) NOT NULL AUTO_INCREMENT,
  `g_name` varchar(255) DEFAULT NULL,
  `g_sn` varchar(255) DEFAULT NULL,
  `flag` int(11) DEFAULT NULL,
  PRIMARY KEY (`g_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_gorup
-- ----------------------------
INSERT INTO `tb_gorup` VALUES ('5', '公共组', '000', '1');
INSERT INTO `tb_gorup` VALUES ('6', '分组', '001', '0');
INSERT INTO `tb_gorup` VALUES ('7', '分组2', '1111', '1');
INSERT INTO `tb_gorup` VALUES ('8', '分组3', '3', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

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
INSERT INTO `tb_mod` VALUES ('14', '账号管理', 'group/group.action', 'WEB/imgs/icos/zhgl.jpg', null, null, '1', '8');

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `u_id` int(11) NOT NULL AUTO_INCREMENT,
  `u_name` varchar(255) DEFAULT NULL,
  `u_pwd` varchar(255) DEFAULT NULL,
  `flag` int(11) DEFAULT NULL,
  `g_id` int(11) DEFAULT NULL,
  `emp` int(11) DEFAULT NULL,
  PRIMARY KEY (`u_id`),
  UNIQUE KEY `UK_mrwea7a27xda3rdws81opvb47` (`emp`),
  KEY `FKiykge2nim99gomxw878qgvbu0` (`g_id`),
  CONSTRAINT `FKiykge2nim99gomxw878qgvbu0` FOREIGN KEY (`g_id`) REFERENCES `tb_gorup` (`g_id`),
  CONSTRAINT `FKqy7jfc8vtkudr63dvwx1jilio` FOREIGN KEY (`emp`) REFERENCES `tb_emp` (`emp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES ('13', '11111111', '111111111', '1', '7', '2');
INSERT INTO `tb_user` VALUES ('14', '2222', '22222', '1', '8', '7');
INSERT INTO `tb_user` VALUES ('17', 'aaa', 'aaa', '1', '5', '1');
