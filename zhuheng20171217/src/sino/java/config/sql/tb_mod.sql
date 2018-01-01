/*
Navicat MySQL Data Transfer

Source Server         : zhuheng_test
Source Server Version : 50717
Source Host           : 192.168.1.6:3306
Source Database       : database_zh

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2017-12-31 20:34:03
*/

SET FOREIGN_KEY_CHECKS=0;

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
INSERT INTO `tb_mod` VALUES ('14', '账号管理', null, 'WEB/imgs/icos/zhgl.jpg', null, null, '1', '8');
