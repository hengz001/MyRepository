USE database_zh;

/*
DROP TABLE IF EXISTS user;
DROP TABLE IF EXISTS tb_dep;
DROP TABLE  IF EXISTS tb_emp;
*/

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `password` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `tb_dep` (
  `dep_id` int(11) NOT NULL AUTO_INCREMENT,
  `dep_sn` varchar(255) DEFAULT NULL,
  `dep_name` varchar(255) DEFAULT NULL,
  `dep_desc` varchar(255) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `flag` int(11) DEFAULT NULL,
  PRIMARY KEY (`dep_id`),
  KEY `FKtenyp8vi90lwv0wrva6j1nu6c` (`pid`),
  CONSTRAINT `FKtenyp8vi90lwv0wrva6j1nu6c` FOREIGN KEY (`pid`) REFERENCES `tb_dep` (`dep_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS `tb_emp` (
  `emp_id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_name` varchar(255) DEFAULT NULL,
  `emp_sn` varchar(255) DEFAULT NULL,
  `emp_sex` varchar(255) DEFAULT NULL,
  `emp_address` varchar(255) DEFAULT NULL,
  `emp_phone` varchar(255) DEFAULT NULL,
  `emp_job` varchar(255) DEFAULT NULL,
  `emp_img` varchar(255) DEFAULT NULL,
  `dep_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`emp_id`),
  KEY `dep_id` (`dep_id`),
  CONSTRAINT `tb_emp_ibfk_1` FOREIGN KEY (`dep_id`) REFERENCES `tb_dep` (`dep_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DESC user;
DESC tb_dep;
DESC tb_emp;