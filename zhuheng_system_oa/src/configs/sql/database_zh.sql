/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : database_zh

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2018-01-21 20:25:00
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for jbpm_action
-- ----------------------------
DROP TABLE IF EXISTS `jbpm_action`;
CREATE TABLE `jbpm_action` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `class` char(1) NOT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `ISPROPAGATIONALLOWED_` bit(1) DEFAULT NULL,
  `ACTIONEXPRESSION_` varchar(255) DEFAULT NULL,
  `ISASYNC_` bit(1) DEFAULT NULL,
  `REFERENCEDACTION_` bigint(20) DEFAULT NULL,
  `ACTIONDELEGATION_` bigint(20) DEFAULT NULL,
  `EVENT_` bigint(20) DEFAULT NULL,
  `PROCESSDEFINITION_` bigint(20) DEFAULT NULL,
  `TIMERNAME_` varchar(255) DEFAULT NULL,
  `DUEDATE_` varchar(255) DEFAULT NULL,
  `REPEAT_` varchar(255) DEFAULT NULL,
  `TRANSITIONNAME_` varchar(255) DEFAULT NULL,
  `TIMERACTION_` bigint(20) DEFAULT NULL,
  `EXPRESSION_` text,
  `EVENTINDEX_` int(11) DEFAULT NULL,
  `EXCEPTIONHANDLER_` bigint(20) DEFAULT NULL,
  `EXCEPTIONHANDLERINDEX_` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `IDX_ACTION_EVENT` (`EVENT_`),
  KEY `IDX_ACTION_PROCDF` (`PROCESSDEFINITION_`),
  KEY `IDX_ACTION_ACTNDL` (`ACTIONDELEGATION_`),
  KEY `FK_ACTION_EVENT` (`EVENT_`),
  KEY `FK_CRTETIMERACT_TA` (`TIMERACTION_`),
  KEY `FK_ACTION_PROCDEF` (`PROCESSDEFINITION_`),
  KEY `FK_ACTION_EXPTHDL` (`EXCEPTIONHANDLER_`),
  KEY `FK_ACTION_REFACT` (`REFERENCEDACTION_`),
  KEY `FK_ACTION_ACTNDEL` (`ACTIONDELEGATION_`),
  CONSTRAINT `FK_ACTION_ACTNDEL` FOREIGN KEY (`ACTIONDELEGATION_`) REFERENCES `jbpm_delegation` (`ID_`),
  CONSTRAINT `FK_ACTION_EVENT` FOREIGN KEY (`EVENT_`) REFERENCES `jbpm_event` (`ID_`),
  CONSTRAINT `FK_ACTION_EXPTHDL` FOREIGN KEY (`EXCEPTIONHANDLER_`) REFERENCES `jbpm_exceptionhandler` (`ID_`),
  CONSTRAINT `FK_ACTION_PROCDEF` FOREIGN KEY (`PROCESSDEFINITION_`) REFERENCES `jbpm_processdefinition` (`ID_`),
  CONSTRAINT `FK_ACTION_REFACT` FOREIGN KEY (`REFERENCEDACTION_`) REFERENCES `jbpm_action` (`ID_`),
  CONSTRAINT `FK_CRTETIMERACT_TA` FOREIGN KEY (`TIMERACTION_`) REFERENCES `jbpm_action` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jbpm_action
-- ----------------------------

-- ----------------------------
-- Table structure for jbpm_bytearray
-- ----------------------------
DROP TABLE IF EXISTS `jbpm_bytearray`;
CREATE TABLE `jbpm_bytearray` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `NAME_` varchar(255) DEFAULT NULL,
  `FILEDEFINITION_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `FK_BYTEARR_FILDEF` (`FILEDEFINITION_`),
  CONSTRAINT `FK_BYTEARR_FILDEF` FOREIGN KEY (`FILEDEFINITION_`) REFERENCES `jbpm_moduledefinition` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jbpm_bytearray
-- ----------------------------

-- ----------------------------
-- Table structure for jbpm_byteblock
-- ----------------------------
DROP TABLE IF EXISTS `jbpm_byteblock`;
CREATE TABLE `jbpm_byteblock` (
  `PROCESSFILE_` bigint(20) NOT NULL,
  `BYTES_` blob,
  `INDEX_` int(11) NOT NULL,
  PRIMARY KEY (`PROCESSFILE_`,`INDEX_`),
  KEY `FK_BYTEBLOCK_FILE` (`PROCESSFILE_`),
  CONSTRAINT `FK_BYTEBLOCK_FILE` FOREIGN KEY (`PROCESSFILE_`) REFERENCES `jbpm_bytearray` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jbpm_byteblock
-- ----------------------------

-- ----------------------------
-- Table structure for jbpm_comment
-- ----------------------------
DROP TABLE IF EXISTS `jbpm_comment`;
CREATE TABLE `jbpm_comment` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION_` int(11) NOT NULL,
  `ACTORID_` varchar(255) DEFAULT NULL,
  `TIME_` datetime DEFAULT NULL,
  `MESSAGE_` text,
  `TOKEN_` bigint(20) DEFAULT NULL,
  `TASKINSTANCE_` bigint(20) DEFAULT NULL,
  `TOKENINDEX_` int(11) DEFAULT NULL,
  `TASKINSTANCEINDEX_` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `IDX_COMMENT_TSK` (`TASKINSTANCE_`),
  KEY `IDX_COMMENT_TOKEN` (`TOKEN_`),
  KEY `FK_COMMENT_TOKEN` (`TOKEN_`),
  KEY `FK_COMMENT_TSK` (`TASKINSTANCE_`),
  CONSTRAINT `FK_COMMENT_TOKEN` FOREIGN KEY (`TOKEN_`) REFERENCES `jbpm_token` (`ID_`),
  CONSTRAINT `FK_COMMENT_TSK` FOREIGN KEY (`TASKINSTANCE_`) REFERENCES `jbpm_taskinstance` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jbpm_comment
-- ----------------------------

-- ----------------------------
-- Table structure for jbpm_decisionconditions
-- ----------------------------
DROP TABLE IF EXISTS `jbpm_decisionconditions`;
CREATE TABLE `jbpm_decisionconditions` (
  `DECISION_` bigint(20) NOT NULL,
  `TRANSITIONNAME_` varchar(255) DEFAULT NULL,
  `EXPRESSION_` varchar(255) DEFAULT NULL,
  `INDEX_` int(11) NOT NULL,
  PRIMARY KEY (`DECISION_`,`INDEX_`),
  KEY `FK_DECCOND_DEC` (`DECISION_`),
  CONSTRAINT `FK_DECCOND_DEC` FOREIGN KEY (`DECISION_`) REFERENCES `jbpm_node` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jbpm_decisionconditions
-- ----------------------------

-- ----------------------------
-- Table structure for jbpm_delegation
-- ----------------------------
DROP TABLE IF EXISTS `jbpm_delegation`;
CREATE TABLE `jbpm_delegation` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `CLASSNAME_` text,
  `CONFIGURATION_` text,
  `CONFIGTYPE_` varchar(255) DEFAULT NULL,
  `PROCESSDEFINITION_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `IDX_DELEG_PRCD` (`PROCESSDEFINITION_`),
  KEY `FK_DELEGATION_PRCD` (`PROCESSDEFINITION_`),
  CONSTRAINT `FK_DELEGATION_PRCD` FOREIGN KEY (`PROCESSDEFINITION_`) REFERENCES `jbpm_processdefinition` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jbpm_delegation
-- ----------------------------

-- ----------------------------
-- Table structure for jbpm_event
-- ----------------------------
DROP TABLE IF EXISTS `jbpm_event`;
CREATE TABLE `jbpm_event` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `EVENTTYPE_` varchar(255) DEFAULT NULL,
  `TYPE_` char(1) DEFAULT NULL,
  `GRAPHELEMENT_` bigint(20) DEFAULT NULL,
  `PROCESSDEFINITION_` bigint(20) DEFAULT NULL,
  `NODE_` bigint(20) DEFAULT NULL,
  `TRANSITION_` bigint(20) DEFAULT NULL,
  `TASK_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `FK_EVENT_PROCDEF` (`PROCESSDEFINITION_`),
  KEY `FK_EVENT_TRANS` (`TRANSITION_`),
  KEY `FK_EVENT_TASK` (`TASK_`),
  KEY `FK_EVENT_NODE` (`NODE_`),
  CONSTRAINT `FK_EVENT_NODE` FOREIGN KEY (`NODE_`) REFERENCES `jbpm_node` (`ID_`),
  CONSTRAINT `FK_EVENT_PROCDEF` FOREIGN KEY (`PROCESSDEFINITION_`) REFERENCES `jbpm_processdefinition` (`ID_`),
  CONSTRAINT `FK_EVENT_TASK` FOREIGN KEY (`TASK_`) REFERENCES `jbpm_task` (`ID_`),
  CONSTRAINT `FK_EVENT_TRANS` FOREIGN KEY (`TRANSITION_`) REFERENCES `jbpm_transition` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jbpm_event
-- ----------------------------

-- ----------------------------
-- Table structure for jbpm_exceptionhandler
-- ----------------------------
DROP TABLE IF EXISTS `jbpm_exceptionhandler`;
CREATE TABLE `jbpm_exceptionhandler` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `EXCEPTIONCLASSNAME_` text,
  `TYPE_` char(1) DEFAULT NULL,
  `GRAPHELEMENT_` bigint(20) DEFAULT NULL,
  `PROCESSDEFINITION_` bigint(20) DEFAULT NULL,
  `GRAPHELEMENTINDEX_` int(11) DEFAULT NULL,
  `NODE_` bigint(20) DEFAULT NULL,
  `TRANSITION_` bigint(20) DEFAULT NULL,
  `TASK_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jbpm_exceptionhandler
-- ----------------------------

-- ----------------------------
-- Table structure for jbpm_id_group
-- ----------------------------
DROP TABLE IF EXISTS `jbpm_id_group`;
CREATE TABLE `jbpm_id_group` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `CLASS_` char(1) NOT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `TYPE_` varchar(255) DEFAULT NULL,
  `PARENT_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `FK_ID_GRP_PARENT` (`PARENT_`),
  CONSTRAINT `FK_ID_GRP_PARENT` FOREIGN KEY (`PARENT_`) REFERENCES `jbpm_id_group` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jbpm_id_group
-- ----------------------------

-- ----------------------------
-- Table structure for jbpm_id_membership
-- ----------------------------
DROP TABLE IF EXISTS `jbpm_id_membership`;
CREATE TABLE `jbpm_id_membership` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `CLASS_` char(1) NOT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `ROLE_` varchar(255) DEFAULT NULL,
  `USER_` bigint(20) DEFAULT NULL,
  `GROUP_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `FK_ID_MEMSHIP_USR` (`USER_`),
  KEY `FK_ID_MEMSHIP_GRP` (`GROUP_`),
  CONSTRAINT `FK_ID_MEMSHIP_GRP` FOREIGN KEY (`GROUP_`) REFERENCES `jbpm_id_group` (`ID_`),
  CONSTRAINT `FK_ID_MEMSHIP_USR` FOREIGN KEY (`USER_`) REFERENCES `jbpm_id_user` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jbpm_id_membership
-- ----------------------------

-- ----------------------------
-- Table structure for jbpm_id_permissions
-- ----------------------------
DROP TABLE IF EXISTS `jbpm_id_permissions`;
CREATE TABLE `jbpm_id_permissions` (
  `ENTITY_` bigint(20) NOT NULL,
  `CLASS_` varchar(255) DEFAULT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `ACTION_` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jbpm_id_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for jbpm_id_user
-- ----------------------------
DROP TABLE IF EXISTS `jbpm_id_user`;
CREATE TABLE `jbpm_id_user` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `CLASS_` char(1) NOT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `EMAIL_` varchar(255) DEFAULT NULL,
  `PASSWORD_` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jbpm_id_user
-- ----------------------------

-- ----------------------------
-- Table structure for jbpm_job
-- ----------------------------
DROP TABLE IF EXISTS `jbpm_job`;
CREATE TABLE `jbpm_job` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `CLASS_` char(1) NOT NULL,
  `VERSION_` int(11) NOT NULL,
  `DUEDATE_` datetime DEFAULT NULL,
  `PROCESSINSTANCE_` bigint(20) DEFAULT NULL,
  `TOKEN_` bigint(20) DEFAULT NULL,
  `TASKINSTANCE_` bigint(20) DEFAULT NULL,
  `ISSUSPENDED_` bit(1) DEFAULT NULL,
  `ISEXCLUSIVE_` bit(1) DEFAULT NULL,
  `LOCKOWNER_` varchar(255) DEFAULT NULL,
  `LOCKTIME_` datetime DEFAULT NULL,
  `EXCEPTION_` text,
  `RETRIES_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `REPEAT_` varchar(255) DEFAULT NULL,
  `TRANSITIONNAME_` varchar(255) DEFAULT NULL,
  `ACTION_` bigint(20) DEFAULT NULL,
  `GRAPHELEMENTTYPE_` varchar(255) DEFAULT NULL,
  `GRAPHELEMENT_` bigint(20) DEFAULT NULL,
  `NODE_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `IDX_JOB_TSKINST` (`TASKINSTANCE_`),
  KEY `IDX_JOB_PRINST` (`PROCESSINSTANCE_`),
  KEY `IDX_JOB_TOKEN` (`TOKEN_`),
  KEY `FK_JOB_PRINST` (`PROCESSINSTANCE_`),
  KEY `FK_JOB_TOKEN` (`TOKEN_`),
  KEY `FK_JOB_ACTION` (`ACTION_`),
  KEY `FK_JOB_TSKINST` (`TASKINSTANCE_`),
  KEY `FK_JOB_NODE` (`NODE_`),
  CONSTRAINT `FK_JOB_ACTION` FOREIGN KEY (`ACTION_`) REFERENCES `jbpm_action` (`ID_`),
  CONSTRAINT `FK_JOB_NODE` FOREIGN KEY (`NODE_`) REFERENCES `jbpm_node` (`ID_`),
  CONSTRAINT `FK_JOB_PRINST` FOREIGN KEY (`PROCESSINSTANCE_`) REFERENCES `jbpm_processinstance` (`ID_`),
  CONSTRAINT `FK_JOB_TOKEN` FOREIGN KEY (`TOKEN_`) REFERENCES `jbpm_token` (`ID_`),
  CONSTRAINT `FK_JOB_TSKINST` FOREIGN KEY (`TASKINSTANCE_`) REFERENCES `jbpm_taskinstance` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jbpm_job
-- ----------------------------

-- ----------------------------
-- Table structure for jbpm_log
-- ----------------------------
DROP TABLE IF EXISTS `jbpm_log`;
CREATE TABLE `jbpm_log` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `CLASS_` char(1) NOT NULL,
  `INDEX_` int(11) DEFAULT NULL,
  `DATE_` datetime DEFAULT NULL,
  `TOKEN_` bigint(20) DEFAULT NULL,
  `PARENT_` bigint(20) DEFAULT NULL,
  `MESSAGE_` text,
  `EXCEPTION_` text,
  `ACTION_` bigint(20) DEFAULT NULL,
  `NODE_` bigint(20) DEFAULT NULL,
  `ENTER_` datetime DEFAULT NULL,
  `LEAVE_` datetime DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `NEWLONGVALUE_` bigint(20) DEFAULT NULL,
  `TRANSITION_` bigint(20) DEFAULT NULL,
  `CHILD_` bigint(20) DEFAULT NULL,
  `SOURCENODE_` bigint(20) DEFAULT NULL,
  `DESTINATIONNODE_` bigint(20) DEFAULT NULL,
  `VARIABLEINSTANCE_` bigint(20) DEFAULT NULL,
  `OLDBYTEARRAY_` bigint(20) DEFAULT NULL,
  `NEWBYTEARRAY_` bigint(20) DEFAULT NULL,
  `OLDDATEVALUE_` datetime DEFAULT NULL,
  `NEWDATEVALUE_` datetime DEFAULT NULL,
  `OLDDOUBLEVALUE_` double DEFAULT NULL,
  `NEWDOUBLEVALUE_` double DEFAULT NULL,
  `OLDLONGIDCLASS_` varchar(255) DEFAULT NULL,
  `OLDLONGIDVALUE_` bigint(20) DEFAULT NULL,
  `NEWLONGIDCLASS_` varchar(255) DEFAULT NULL,
  `NEWLONGIDVALUE_` bigint(20) DEFAULT NULL,
  `OLDSTRINGIDCLASS_` varchar(255) DEFAULT NULL,
  `OLDSTRINGIDVALUE_` varchar(255) DEFAULT NULL,
  `NEWSTRINGIDCLASS_` varchar(255) DEFAULT NULL,
  `NEWSTRINGIDVALUE_` varchar(255) DEFAULT NULL,
  `OLDLONGVALUE_` bigint(20) DEFAULT NULL,
  `OLDSTRINGVALUE_` text,
  `NEWSTRINGVALUE_` text,
  `TASKINSTANCE_` bigint(20) DEFAULT NULL,
  `TASKACTORID_` varchar(255) DEFAULT NULL,
  `TASKOLDACTORID_` varchar(255) DEFAULT NULL,
  `SWIMLANEINSTANCE_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `FK_LOG_PARENT` (`PARENT_`),
  KEY `FK_LOG_DESTNODE` (`DESTINATIONNODE_`),
  KEY `FK_LOG_TOKEN` (`TOKEN_`),
  KEY `FK_LOG_SOURCENODE` (`SOURCENODE_`),
  KEY `FK_LOG_ACTION` (`ACTION_`),
  KEY `FK_LOG_NEWBYTES` (`NEWBYTEARRAY_`),
  KEY `FK_LOG_SWIMINST` (`SWIMLANEINSTANCE_`),
  KEY `FK_LOG_TRANSITION` (`TRANSITION_`),
  KEY `FK_LOG_VARINST` (`VARIABLEINSTANCE_`),
  KEY `FK_LOG_CHILDTOKEN` (`CHILD_`),
  KEY `FK_LOG_OLDBYTES` (`OLDBYTEARRAY_`),
  KEY `FK_LOG_TASKINST` (`TASKINSTANCE_`),
  KEY `FK_LOG_NODE` (`NODE_`),
  CONSTRAINT `FK_LOG_ACTION` FOREIGN KEY (`ACTION_`) REFERENCES `jbpm_action` (`ID_`),
  CONSTRAINT `FK_LOG_CHILDTOKEN` FOREIGN KEY (`CHILD_`) REFERENCES `jbpm_token` (`ID_`),
  CONSTRAINT `FK_LOG_DESTNODE` FOREIGN KEY (`DESTINATIONNODE_`) REFERENCES `jbpm_node` (`ID_`),
  CONSTRAINT `FK_LOG_NEWBYTES` FOREIGN KEY (`NEWBYTEARRAY_`) REFERENCES `jbpm_bytearray` (`ID_`),
  CONSTRAINT `FK_LOG_NODE` FOREIGN KEY (`NODE_`) REFERENCES `jbpm_node` (`ID_`),
  CONSTRAINT `FK_LOG_OLDBYTES` FOREIGN KEY (`OLDBYTEARRAY_`) REFERENCES `jbpm_bytearray` (`ID_`),
  CONSTRAINT `FK_LOG_PARENT` FOREIGN KEY (`PARENT_`) REFERENCES `jbpm_log` (`ID_`),
  CONSTRAINT `FK_LOG_SOURCENODE` FOREIGN KEY (`SOURCENODE_`) REFERENCES `jbpm_node` (`ID_`),
  CONSTRAINT `FK_LOG_SWIMINST` FOREIGN KEY (`SWIMLANEINSTANCE_`) REFERENCES `jbpm_swimlaneinstance` (`ID_`),
  CONSTRAINT `FK_LOG_TASKINST` FOREIGN KEY (`TASKINSTANCE_`) REFERENCES `jbpm_taskinstance` (`ID_`),
  CONSTRAINT `FK_LOG_TOKEN` FOREIGN KEY (`TOKEN_`) REFERENCES `jbpm_token` (`ID_`),
  CONSTRAINT `FK_LOG_TRANSITION` FOREIGN KEY (`TRANSITION_`) REFERENCES `jbpm_transition` (`ID_`),
  CONSTRAINT `FK_LOG_VARINST` FOREIGN KEY (`VARIABLEINSTANCE_`) REFERENCES `jbpm_variableinstance` (`ID_`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jbpm_log
-- ----------------------------
INSERT INTO `jbpm_log` VALUES ('1', 'I', '0', '2018-01-21 19:51:50', '1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jbpm_log` VALUES ('2', 'R', '1', '2018-01-21 19:51:50', '1', null, null, null, null, null, null, null, null, null, null, null, null, null, '1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jbpm_log` VALUES ('3', 'G', '2', '2018-01-21 19:51:50', '1', null, null, null, null, null, null, null, null, '1', null, null, null, null, '1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for jbpm_moduledefinition
-- ----------------------------
DROP TABLE IF EXISTS `jbpm_moduledefinition`;
CREATE TABLE `jbpm_moduledefinition` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `CLASS_` char(1) NOT NULL,
  `NAME_` text,
  `PROCESSDEFINITION_` bigint(20) DEFAULT NULL,
  `STARTTASK_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `IDX_MODDEF_PROCDF` (`PROCESSDEFINITION_`),
  KEY `FK_TSKDEF_START` (`STARTTASK_`),
  KEY `FK_MODDEF_PROCDEF` (`PROCESSDEFINITION_`),
  CONSTRAINT `FK_MODDEF_PROCDEF` FOREIGN KEY (`PROCESSDEFINITION_`) REFERENCES `jbpm_processdefinition` (`ID_`),
  CONSTRAINT `FK_TSKDEF_START` FOREIGN KEY (`STARTTASK_`) REFERENCES `jbpm_task` (`ID_`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jbpm_moduledefinition
-- ----------------------------
INSERT INTO `jbpm_moduledefinition` VALUES ('1', 'C', 'org.jbpm.context.def.ContextDefinition', '1', null);
INSERT INTO `jbpm_moduledefinition` VALUES ('2', 'T', 'org.jbpm.taskmgmt.def.TaskMgmtDefinition', '1', null);

-- ----------------------------
-- Table structure for jbpm_moduleinstance
-- ----------------------------
DROP TABLE IF EXISTS `jbpm_moduleinstance`;
CREATE TABLE `jbpm_moduleinstance` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `CLASS_` char(1) NOT NULL,
  `VERSION_` int(11) NOT NULL,
  `PROCESSINSTANCE_` bigint(20) DEFAULT NULL,
  `TASKMGMTDEFINITION_` bigint(20) DEFAULT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `IDX_MODINST_PRINST` (`PROCESSINSTANCE_`),
  KEY `FK_MODINST_PRCINST` (`PROCESSINSTANCE_`),
  KEY `FK_TASKMGTINST_TMD` (`TASKMGMTDEFINITION_`),
  CONSTRAINT `FK_MODINST_PRCINST` FOREIGN KEY (`PROCESSINSTANCE_`) REFERENCES `jbpm_processinstance` (`ID_`),
  CONSTRAINT `FK_TASKMGTINST_TMD` FOREIGN KEY (`TASKMGMTDEFINITION_`) REFERENCES `jbpm_moduledefinition` (`ID_`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jbpm_moduleinstance
-- ----------------------------
INSERT INTO `jbpm_moduleinstance` VALUES ('1', 'T', '0', '1', '2', 'org.jbpm.taskmgmt.exe.TaskMgmtInstance');
INSERT INTO `jbpm_moduleinstance` VALUES ('2', 'C', '0', '1', null, 'org.jbpm.context.exe.ContextInstance');

-- ----------------------------
-- Table structure for jbpm_node
-- ----------------------------
DROP TABLE IF EXISTS `jbpm_node`;
CREATE TABLE `jbpm_node` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `CLASS_` char(1) NOT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `DESCRIPTION_` text,
  `PROCESSDEFINITION_` bigint(20) DEFAULT NULL,
  `ISASYNC_` bit(1) DEFAULT NULL,
  `ISASYNCEXCL_` bit(1) DEFAULT NULL,
  `ACTION_` bigint(20) DEFAULT NULL,
  `SUPERSTATE_` bigint(20) DEFAULT NULL,
  `SUBPROCNAME_` varchar(255) DEFAULT NULL,
  `SUBPROCESSDEFINITION_` bigint(20) DEFAULT NULL,
  `DECISIONEXPRESSION_` varchar(255) DEFAULT NULL,
  `DECISIONDELEGATION` bigint(20) DEFAULT NULL,
  `SCRIPT_` bigint(20) DEFAULT NULL,
  `SIGNAL_` int(11) DEFAULT NULL,
  `CREATETASKS_` bit(1) DEFAULT NULL,
  `ENDTASKS_` bit(1) DEFAULT NULL,
  `NODECOLLECTIONINDEX_` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `IDX_PSTATE_SBPRCDEF` (`SUBPROCESSDEFINITION_`),
  KEY `IDX_NODE_PROCDEF` (`PROCESSDEFINITION_`),
  KEY `IDX_NODE_ACTION` (`ACTION_`),
  KEY `IDX_NODE_SUPRSTATE` (`SUPERSTATE_`),
  KEY `FK_NODE_SCRIPT` (`SCRIPT_`),
  KEY `FK_NODE_SUPERSTATE` (`SUPERSTATE_`),
  KEY `FK_PROCST_SBPRCDEF` (`SUBPROCESSDEFINITION_`),
  KEY `FK_DECISION_DELEG` (`DECISIONDELEGATION`),
  KEY `FK_NODE_PROCDEF` (`PROCESSDEFINITION_`),
  KEY `FK_NODE_ACTION` (`ACTION_`),
  CONSTRAINT `FK_DECISION_DELEG` FOREIGN KEY (`DECISIONDELEGATION`) REFERENCES `jbpm_delegation` (`ID_`),
  CONSTRAINT `FK_NODE_ACTION` FOREIGN KEY (`ACTION_`) REFERENCES `jbpm_action` (`ID_`),
  CONSTRAINT `FK_NODE_PROCDEF` FOREIGN KEY (`PROCESSDEFINITION_`) REFERENCES `jbpm_processdefinition` (`ID_`),
  CONSTRAINT `FK_NODE_SCRIPT` FOREIGN KEY (`SCRIPT_`) REFERENCES `jbpm_action` (`ID_`),
  CONSTRAINT `FK_NODE_SUPERSTATE` FOREIGN KEY (`SUPERSTATE_`) REFERENCES `jbpm_node` (`ID_`),
  CONSTRAINT `FK_PROCST_SBPRCDEF` FOREIGN KEY (`SUBPROCESSDEFINITION_`) REFERENCES `jbpm_processdefinition` (`ID_`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jbpm_node
-- ----------------------------
INSERT INTO `jbpm_node` VALUES ('1', 'R', '开始', null, '1', '\0', '\0', null, null, null, null, null, null, null, null, null, null, '0');
INSERT INTO `jbpm_node` VALUES ('2', 'K', '班长审批', null, '1', '\0', '\0', null, null, null, null, null, null, null, '4', '', '\0', '1');
INSERT INTO `jbpm_node` VALUES ('3', 'K', '班主任审批', null, '1', '\0', '\0', null, null, null, null, null, null, null, '4', '', '\0', '2');
INSERT INTO `jbpm_node` VALUES ('4', 'E', '结束流程', null, '1', '\0', '\0', null, null, null, null, null, null, null, null, null, null, '3');

-- ----------------------------
-- Table structure for jbpm_pooledactor
-- ----------------------------
DROP TABLE IF EXISTS `jbpm_pooledactor`;
CREATE TABLE `jbpm_pooledactor` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION_` int(11) NOT NULL,
  `ACTORID_` varchar(255) DEFAULT NULL,
  `SWIMLANEINSTANCE_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `IDX_TSKINST_SWLANE` (`SWIMLANEINSTANCE_`),
  KEY `IDX_PLDACTR_ACTID` (`ACTORID_`),
  KEY `FK_POOLEDACTOR_SLI` (`SWIMLANEINSTANCE_`),
  CONSTRAINT `FK_POOLEDACTOR_SLI` FOREIGN KEY (`SWIMLANEINSTANCE_`) REFERENCES `jbpm_swimlaneinstance` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jbpm_pooledactor
-- ----------------------------

-- ----------------------------
-- Table structure for jbpm_processdefinition
-- ----------------------------
DROP TABLE IF EXISTS `jbpm_processdefinition`;
CREATE TABLE `jbpm_processdefinition` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `CLASS_` char(1) NOT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `DESCRIPTION_` text,
  `VERSION_` int(11) DEFAULT NULL,
  `ISTERMINATIONIMPLICIT_` bit(1) DEFAULT NULL,
  `STARTSTATE_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `IDX_PROCDEF_STRTST` (`STARTSTATE_`),
  KEY `FK_PROCDEF_STRTSTA` (`STARTSTATE_`),
  CONSTRAINT `FK_PROCDEF_STRTSTA` FOREIGN KEY (`STARTSTATE_`) REFERENCES `jbpm_node` (`ID_`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jbpm_processdefinition
-- ----------------------------
INSERT INTO `jbpm_processdefinition` VALUES ('1', 'P', '请假', null, '1', '\0', '1');

-- ----------------------------
-- Table structure for jbpm_processinstance
-- ----------------------------
DROP TABLE IF EXISTS `jbpm_processinstance`;
CREATE TABLE `jbpm_processinstance` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION_` int(11) NOT NULL,
  `KEY_` varchar(255) DEFAULT NULL,
  `START_` datetime DEFAULT NULL,
  `END_` datetime DEFAULT NULL,
  `ISSUSPENDED_` bit(1) DEFAULT NULL,
  `PROCESSDEFINITION_` bigint(20) DEFAULT NULL,
  `ROOTTOKEN_` bigint(20) DEFAULT NULL,
  `SUPERPROCESSTOKEN_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `KEY_` (`KEY_`,`PROCESSDEFINITION_`),
  KEY `IDX_PROCIN_ROOTTK` (`ROOTTOKEN_`),
  KEY `IDX_PROCIN_SPROCTK` (`SUPERPROCESSTOKEN_`),
  KEY `IDX_PROCIN_PROCDEF` (`PROCESSDEFINITION_`),
  KEY `FK_PROCIN_PROCDEF` (`PROCESSDEFINITION_`),
  KEY `FK_PROCIN_SPROCTKN` (`SUPERPROCESSTOKEN_`),
  KEY `FK_PROCIN_ROOTTKN` (`ROOTTOKEN_`),
  CONSTRAINT `FK_PROCIN_PROCDEF` FOREIGN KEY (`PROCESSDEFINITION_`) REFERENCES `jbpm_processdefinition` (`ID_`),
  CONSTRAINT `FK_PROCIN_ROOTTKN` FOREIGN KEY (`ROOTTOKEN_`) REFERENCES `jbpm_token` (`ID_`),
  CONSTRAINT `FK_PROCIN_SPROCTKN` FOREIGN KEY (`SUPERPROCESSTOKEN_`) REFERENCES `jbpm_token` (`ID_`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jbpm_processinstance
-- ----------------------------
INSERT INTO `jbpm_processinstance` VALUES ('1', '1', null, '2018-01-21 19:51:50', null, '\0', '1', '1', null);

-- ----------------------------
-- Table structure for jbpm_runtimeaction
-- ----------------------------
DROP TABLE IF EXISTS `jbpm_runtimeaction`;
CREATE TABLE `jbpm_runtimeaction` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION_` int(11) NOT NULL,
  `EVENTTYPE_` varchar(255) DEFAULT NULL,
  `TYPE_` char(1) DEFAULT NULL,
  `GRAPHELEMENT_` bigint(20) DEFAULT NULL,
  `PROCESSINSTANCE_` bigint(20) DEFAULT NULL,
  `ACTION_` bigint(20) DEFAULT NULL,
  `PROCESSINSTANCEINDEX_` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `IDX_RTACTN_PRCINST` (`PROCESSINSTANCE_`),
  KEY `IDX_RTACTN_ACTION` (`ACTION_`),
  KEY `FK_RTACTN_PROCINST` (`PROCESSINSTANCE_`),
  KEY `FK_RTACTN_ACTION` (`ACTION_`),
  CONSTRAINT `FK_RTACTN_ACTION` FOREIGN KEY (`ACTION_`) REFERENCES `jbpm_action` (`ID_`),
  CONSTRAINT `FK_RTACTN_PROCINST` FOREIGN KEY (`PROCESSINSTANCE_`) REFERENCES `jbpm_processinstance` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jbpm_runtimeaction
-- ----------------------------

-- ----------------------------
-- Table structure for jbpm_swimlane
-- ----------------------------
DROP TABLE IF EXISTS `jbpm_swimlane`;
CREATE TABLE `jbpm_swimlane` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `NAME_` varchar(255) DEFAULT NULL,
  `ACTORIDEXPRESSION_` varchar(255) DEFAULT NULL,
  `POOLEDACTORSEXPRESSION_` varchar(255) DEFAULT NULL,
  `ASSIGNMENTDELEGATION_` bigint(20) DEFAULT NULL,
  `TASKMGMTDEFINITION_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `FK_SWL_TSKMGMTDEF` (`TASKMGMTDEFINITION_`),
  KEY `FK_SWL_ASSDEL` (`ASSIGNMENTDELEGATION_`),
  CONSTRAINT `FK_SWL_ASSDEL` FOREIGN KEY (`ASSIGNMENTDELEGATION_`) REFERENCES `jbpm_delegation` (`ID_`),
  CONSTRAINT `FK_SWL_TSKMGMTDEF` FOREIGN KEY (`TASKMGMTDEFINITION_`) REFERENCES `jbpm_moduledefinition` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jbpm_swimlane
-- ----------------------------

-- ----------------------------
-- Table structure for jbpm_swimlaneinstance
-- ----------------------------
DROP TABLE IF EXISTS `jbpm_swimlaneinstance`;
CREATE TABLE `jbpm_swimlaneinstance` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION_` int(11) NOT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `ACTORID_` varchar(255) DEFAULT NULL,
  `SWIMLANE_` bigint(20) DEFAULT NULL,
  `TASKMGMTINSTANCE_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `IDX_SWIMLINST_SL` (`SWIMLANE_`),
  KEY `FK_SWIMLANEINST_SL` (`SWIMLANE_`),
  KEY `FK_SWIMLANEINST_TM` (`TASKMGMTINSTANCE_`),
  CONSTRAINT `FK_SWIMLANEINST_SL` FOREIGN KEY (`SWIMLANE_`) REFERENCES `jbpm_swimlane` (`ID_`),
  CONSTRAINT `FK_SWIMLANEINST_TM` FOREIGN KEY (`TASKMGMTINSTANCE_`) REFERENCES `jbpm_moduleinstance` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jbpm_swimlaneinstance
-- ----------------------------

-- ----------------------------
-- Table structure for jbpm_task
-- ----------------------------
DROP TABLE IF EXISTS `jbpm_task`;
CREATE TABLE `jbpm_task` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `NAME_` varchar(255) DEFAULT NULL,
  `DESCRIPTION_` text,
  `PROCESSDEFINITION_` bigint(20) DEFAULT NULL,
  `ISBLOCKING_` bit(1) DEFAULT NULL,
  `ISSIGNALLING_` bit(1) DEFAULT NULL,
  `CONDITION_` varchar(255) DEFAULT NULL,
  `DUEDATE_` varchar(255) DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `ACTORIDEXPRESSION_` varchar(255) DEFAULT NULL,
  `POOLEDACTORSEXPRESSION_` varchar(255) DEFAULT NULL,
  `TASKMGMTDEFINITION_` bigint(20) DEFAULT NULL,
  `TASKNODE_` bigint(20) DEFAULT NULL,
  `STARTSTATE_` bigint(20) DEFAULT NULL,
  `ASSIGNMENTDELEGATION_` bigint(20) DEFAULT NULL,
  `SWIMLANE_` bigint(20) DEFAULT NULL,
  `TASKCONTROLLER_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `IDX_TASK_TASKMGTDF` (`TASKMGMTDEFINITION_`),
  KEY `IDX_TASK_TSKNODE` (`TASKNODE_`),
  KEY `IDX_TASK_PROCDEF` (`PROCESSDEFINITION_`),
  KEY `FK_TASK_TASKNODE` (`TASKNODE_`),
  KEY `FK_TSK_TSKCTRL` (`TASKCONTROLLER_`),
  KEY `FK_TASK_PROCDEF` (`PROCESSDEFINITION_`),
  KEY `FK_TASK_STARTST` (`STARTSTATE_`),
  KEY `FK_TASK_TASKMGTDEF` (`TASKMGMTDEFINITION_`),
  KEY `FK_TASK_SWIMLANE` (`SWIMLANE_`),
  KEY `FK_TASK_ASSDEL` (`ASSIGNMENTDELEGATION_`),
  CONSTRAINT `FK_TASK_ASSDEL` FOREIGN KEY (`ASSIGNMENTDELEGATION_`) REFERENCES `jbpm_delegation` (`ID_`),
  CONSTRAINT `FK_TASK_PROCDEF` FOREIGN KEY (`PROCESSDEFINITION_`) REFERENCES `jbpm_processdefinition` (`ID_`),
  CONSTRAINT `FK_TASK_STARTST` FOREIGN KEY (`STARTSTATE_`) REFERENCES `jbpm_node` (`ID_`),
  CONSTRAINT `FK_TASK_SWIMLANE` FOREIGN KEY (`SWIMLANE_`) REFERENCES `jbpm_swimlane` (`ID_`),
  CONSTRAINT `FK_TASK_TASKMGTDEF` FOREIGN KEY (`TASKMGMTDEFINITION_`) REFERENCES `jbpm_moduledefinition` (`ID_`),
  CONSTRAINT `FK_TASK_TASKNODE` FOREIGN KEY (`TASKNODE_`) REFERENCES `jbpm_node` (`ID_`),
  CONSTRAINT `FK_TSK_TSKCTRL` FOREIGN KEY (`TASKCONTROLLER_`) REFERENCES `jbpm_taskcontroller` (`ID_`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jbpm_task
-- ----------------------------
INSERT INTO `jbpm_task` VALUES ('1', '班长审批', null, '1', '\0', '', null, null, '3', 'bz', null, '2', '2', null, null, null, null);
INSERT INTO `jbpm_task` VALUES ('2', '班主任审批', null, '1', '\0', '', null, null, '3', 'bzr', null, '2', '3', null, null, null, null);

-- ----------------------------
-- Table structure for jbpm_taskactorpool
-- ----------------------------
DROP TABLE IF EXISTS `jbpm_taskactorpool`;
CREATE TABLE `jbpm_taskactorpool` (
  `TASKINSTANCE_` bigint(20) NOT NULL,
  `POOLEDACTOR_` bigint(20) NOT NULL,
  PRIMARY KEY (`TASKINSTANCE_`,`POOLEDACTOR_`),
  KEY `FK_TSKACTPOL_PLACT` (`POOLEDACTOR_`),
  KEY `FK_TASKACTPL_TSKI` (`TASKINSTANCE_`),
  CONSTRAINT `FK_TASKACTPL_TSKI` FOREIGN KEY (`TASKINSTANCE_`) REFERENCES `jbpm_taskinstance` (`ID_`),
  CONSTRAINT `FK_TSKACTPOL_PLACT` FOREIGN KEY (`POOLEDACTOR_`) REFERENCES `jbpm_pooledactor` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jbpm_taskactorpool
-- ----------------------------

-- ----------------------------
-- Table structure for jbpm_taskcontroller
-- ----------------------------
DROP TABLE IF EXISTS `jbpm_taskcontroller`;
CREATE TABLE `jbpm_taskcontroller` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `TASKCONTROLLERDELEGATION_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `FK_TSKCTRL_DELEG` (`TASKCONTROLLERDELEGATION_`),
  CONSTRAINT `FK_TSKCTRL_DELEG` FOREIGN KEY (`TASKCONTROLLERDELEGATION_`) REFERENCES `jbpm_delegation` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jbpm_taskcontroller
-- ----------------------------

-- ----------------------------
-- Table structure for jbpm_taskinstance
-- ----------------------------
DROP TABLE IF EXISTS `jbpm_taskinstance`;
CREATE TABLE `jbpm_taskinstance` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `CLASS_` char(1) NOT NULL,
  `VERSION_` int(11) NOT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `DESCRIPTION_` text,
  `ACTORID_` varchar(255) DEFAULT NULL,
  `CREATE_` datetime DEFAULT NULL,
  `START_` datetime DEFAULT NULL,
  `END_` datetime DEFAULT NULL,
  `DUEDATE_` datetime DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `ISCANCELLED_` bit(1) DEFAULT NULL,
  `ISSUSPENDED_` bit(1) DEFAULT NULL,
  `ISOPEN_` bit(1) DEFAULT NULL,
  `ISSIGNALLING_` bit(1) DEFAULT NULL,
  `ISBLOCKING_` bit(1) DEFAULT NULL,
  `TASK_` bigint(20) DEFAULT NULL,
  `TOKEN_` bigint(20) DEFAULT NULL,
  `PROCINST_` bigint(20) DEFAULT NULL,
  `SWIMLANINSTANCE_` bigint(20) DEFAULT NULL,
  `TASKMGMTINSTANCE_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `IDX_TASKINST_TSK` (`TASK_`,`PROCINST_`),
  KEY `IDX_TSKINST_TMINST` (`TASKMGMTINSTANCE_`),
  KEY `IDX_TASKINST_TOKN` (`TOKEN_`),
  KEY `IDX_TASK_ACTORID` (`ACTORID_`),
  KEY `IDX_TSKINST_SLINST` (`SWIMLANINSTANCE_`),
  KEY `FK_TASKINST_SLINST` (`SWIMLANINSTANCE_`),
  KEY `FK_TASKINST_TOKEN` (`TOKEN_`),
  KEY `FK_TSKINS_PRCINS` (`PROCINST_`),
  KEY `FK_TASKINST_TASK` (`TASK_`),
  KEY `FK_TASKINST_TMINST` (`TASKMGMTINSTANCE_`),
  CONSTRAINT `FK_TASKINST_SLINST` FOREIGN KEY (`SWIMLANINSTANCE_`) REFERENCES `jbpm_swimlaneinstance` (`ID_`),
  CONSTRAINT `FK_TASKINST_TASK` FOREIGN KEY (`TASK_`) REFERENCES `jbpm_task` (`ID_`),
  CONSTRAINT `FK_TASKINST_TMINST` FOREIGN KEY (`TASKMGMTINSTANCE_`) REFERENCES `jbpm_moduleinstance` (`ID_`),
  CONSTRAINT `FK_TASKINST_TOKEN` FOREIGN KEY (`TOKEN_`) REFERENCES `jbpm_token` (`ID_`),
  CONSTRAINT `FK_TSKINS_PRCINS` FOREIGN KEY (`PROCINST_`) REFERENCES `jbpm_processinstance` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jbpm_taskinstance
-- ----------------------------

-- ----------------------------
-- Table structure for jbpm_token
-- ----------------------------
DROP TABLE IF EXISTS `jbpm_token`;
CREATE TABLE `jbpm_token` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION_` int(11) NOT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `START_` datetime DEFAULT NULL,
  `END_` datetime DEFAULT NULL,
  `NODEENTER_` datetime DEFAULT NULL,
  `NEXTLOGINDEX_` int(11) DEFAULT NULL,
  `ISABLETOREACTIVATEPARENT_` bit(1) DEFAULT NULL,
  `ISTERMINATIONIMPLICIT_` bit(1) DEFAULT NULL,
  `ISSUSPENDED_` bit(1) DEFAULT NULL,
  `LOCK_` varchar(255) DEFAULT NULL,
  `NODE_` bigint(20) DEFAULT NULL,
  `PROCESSINSTANCE_` bigint(20) DEFAULT NULL,
  `PARENT_` bigint(20) DEFAULT NULL,
  `SUBPROCESSINSTANCE_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `IDX_TOKEN_NODE` (`NODE_`),
  KEY `IDX_TOKEN_PARENT` (`PARENT_`),
  KEY `IDX_TOKEN_PROCIN` (`PROCESSINSTANCE_`),
  KEY `IDX_TOKEN_SUBPI` (`SUBPROCESSINSTANCE_`),
  KEY `FK_TOKEN_PROCINST` (`PROCESSINSTANCE_`),
  KEY `FK_TOKEN_PARENT` (`PARENT_`),
  KEY `FK_TOKEN_SUBPI` (`SUBPROCESSINSTANCE_`),
  KEY `FK_TOKEN_NODE` (`NODE_`),
  CONSTRAINT `FK_TOKEN_NODE` FOREIGN KEY (`NODE_`) REFERENCES `jbpm_node` (`ID_`),
  CONSTRAINT `FK_TOKEN_PARENT` FOREIGN KEY (`PARENT_`) REFERENCES `jbpm_token` (`ID_`),
  CONSTRAINT `FK_TOKEN_PROCINST` FOREIGN KEY (`PROCESSINSTANCE_`) REFERENCES `jbpm_processinstance` (`ID_`),
  CONSTRAINT `FK_TOKEN_SUBPI` FOREIGN KEY (`SUBPROCESSINSTANCE_`) REFERENCES `jbpm_processinstance` (`ID_`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jbpm_token
-- ----------------------------
INSERT INTO `jbpm_token` VALUES ('1', '1', null, '2018-01-21 19:51:50', null, null, '3', '', '\0', '\0', null, '1', '1', null, null);

-- ----------------------------
-- Table structure for jbpm_tokenvariablemap
-- ----------------------------
DROP TABLE IF EXISTS `jbpm_tokenvariablemap`;
CREATE TABLE `jbpm_tokenvariablemap` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION_` int(11) NOT NULL,
  `TOKEN_` bigint(20) DEFAULT NULL,
  `CONTEXTINSTANCE_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `IDX_TKVVARMP_TOKEN` (`TOKEN_`),
  KEY `IDX_TKVARMAP_CTXT` (`CONTEXTINSTANCE_`),
  KEY `FK_TKVARMAP_TOKEN` (`TOKEN_`),
  KEY `FK_TKVARMAP_CTXT` (`CONTEXTINSTANCE_`),
  CONSTRAINT `FK_TKVARMAP_CTXT` FOREIGN KEY (`CONTEXTINSTANCE_`) REFERENCES `jbpm_moduleinstance` (`ID_`),
  CONSTRAINT `FK_TKVARMAP_TOKEN` FOREIGN KEY (`TOKEN_`) REFERENCES `jbpm_token` (`ID_`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jbpm_tokenvariablemap
-- ----------------------------
INSERT INTO `jbpm_tokenvariablemap` VALUES ('1', '0', '1', '2');

-- ----------------------------
-- Table structure for jbpm_transition
-- ----------------------------
DROP TABLE IF EXISTS `jbpm_transition`;
CREATE TABLE `jbpm_transition` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `NAME_` varchar(255) DEFAULT NULL,
  `DESCRIPTION_` text,
  `PROCESSDEFINITION_` bigint(20) DEFAULT NULL,
  `FROM_` bigint(20) DEFAULT NULL,
  `TO_` bigint(20) DEFAULT NULL,
  `CONDITION_` varchar(255) DEFAULT NULL,
  `FROMINDEX_` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `IDX_TRANSIT_TO` (`TO_`),
  KEY `IDX_TRANSIT_FROM` (`FROM_`),
  KEY `IDX_TRANS_PROCDEF` (`PROCESSDEFINITION_`),
  KEY `FK_TRANS_PROCDEF` (`PROCESSDEFINITION_`),
  KEY `FK_TRANSITION_TO` (`TO_`),
  KEY `FK_TRANSITION_FROM` (`FROM_`),
  CONSTRAINT `FK_TRANSITION_FROM` FOREIGN KEY (`FROM_`) REFERENCES `jbpm_node` (`ID_`),
  CONSTRAINT `FK_TRANSITION_TO` FOREIGN KEY (`TO_`) REFERENCES `jbpm_node` (`ID_`),
  CONSTRAINT `FK_TRANS_PROCDEF` FOREIGN KEY (`PROCESSDEFINITION_`) REFERENCES `jbpm_processdefinition` (`ID_`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jbpm_transition
-- ----------------------------
INSERT INTO `jbpm_transition` VALUES ('1', '班长审批', null, '1', '1', '2', null, '0');
INSERT INTO `jbpm_transition` VALUES ('2', '班主任审批', null, '1', '2', '3', null, '0');
INSERT INTO `jbpm_transition` VALUES ('3', '结束流程', null, '1', '3', '4', null, '0');

-- ----------------------------
-- Table structure for jbpm_variableaccess
-- ----------------------------
DROP TABLE IF EXISTS `jbpm_variableaccess`;
CREATE TABLE `jbpm_variableaccess` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `VARIABLENAME_` varchar(255) DEFAULT NULL,
  `ACCESS_` varchar(255) DEFAULT NULL,
  `MAPPEDNAME_` varchar(255) DEFAULT NULL,
  `PROCESSSTATE_` bigint(20) DEFAULT NULL,
  `TASKCONTROLLER_` bigint(20) DEFAULT NULL,
  `INDEX_` int(11) DEFAULT NULL,
  `SCRIPT_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `FK_VARACC_SCRIPT` (`SCRIPT_`),
  KEY `FK_VARACC_TSKCTRL` (`TASKCONTROLLER_`),
  KEY `FK_VARACC_PROCST` (`PROCESSSTATE_`),
  CONSTRAINT `FK_VARACC_PROCST` FOREIGN KEY (`PROCESSSTATE_`) REFERENCES `jbpm_node` (`ID_`),
  CONSTRAINT `FK_VARACC_SCRIPT` FOREIGN KEY (`SCRIPT_`) REFERENCES `jbpm_action` (`ID_`),
  CONSTRAINT `FK_VARACC_TSKCTRL` FOREIGN KEY (`TASKCONTROLLER_`) REFERENCES `jbpm_taskcontroller` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jbpm_variableaccess
-- ----------------------------

-- ----------------------------
-- Table structure for jbpm_variableinstance
-- ----------------------------
DROP TABLE IF EXISTS `jbpm_variableinstance`;
CREATE TABLE `jbpm_variableinstance` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `CLASS_` char(1) NOT NULL,
  `VERSION_` int(11) NOT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `CONVERTER_` char(1) DEFAULT NULL,
  `TOKEN_` bigint(20) DEFAULT NULL,
  `TOKENVARIABLEMAP_` bigint(20) DEFAULT NULL,
  `PROCESSINSTANCE_` bigint(20) DEFAULT NULL,
  `BYTEARRAYVALUE_` bigint(20) DEFAULT NULL,
  `DATEVALUE_` datetime DEFAULT NULL,
  `DOUBLEVALUE_` double DEFAULT NULL,
  `LONGIDCLASS_` varchar(255) DEFAULT NULL,
  `LONGVALUE_` bigint(20) DEFAULT NULL,
  `STRINGIDCLASS_` varchar(255) DEFAULT NULL,
  `STRINGVALUE_` varchar(255) DEFAULT NULL,
  `TASKINSTANCE_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `IDX_VARINST_PRCINS` (`PROCESSINSTANCE_`),
  KEY `IDX_VARINST_TK` (`TOKEN_`),
  KEY `IDX_VARINST_TKVARMP` (`TOKENVARIABLEMAP_`),
  KEY `FK_VARINST_PRCINST` (`PROCESSINSTANCE_`),
  KEY `FK_VARINST_TKVARMP` (`TOKENVARIABLEMAP_`),
  KEY `FK_VARINST_TK` (`TOKEN_`),
  KEY `FK_BYTEINST_ARRAY` (`BYTEARRAYVALUE_`),
  KEY `FK_VAR_TSKINST` (`TASKINSTANCE_`),
  CONSTRAINT `FK_BYTEINST_ARRAY` FOREIGN KEY (`BYTEARRAYVALUE_`) REFERENCES `jbpm_bytearray` (`ID_`),
  CONSTRAINT `FK_VARINST_PRCINST` FOREIGN KEY (`PROCESSINSTANCE_`) REFERENCES `jbpm_processinstance` (`ID_`),
  CONSTRAINT `FK_VARINST_TK` FOREIGN KEY (`TOKEN_`) REFERENCES `jbpm_token` (`ID_`),
  CONSTRAINT `FK_VARINST_TKVARMP` FOREIGN KEY (`TOKENVARIABLEMAP_`) REFERENCES `jbpm_tokenvariablemap` (`ID_`),
  CONSTRAINT `FK_VAR_TSKINST` FOREIGN KEY (`TASKINSTANCE_`) REFERENCES `jbpm_taskinstance` (`ID_`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jbpm_variableinstance
-- ----------------------------
INSERT INTO `jbpm_variableinstance` VALUES ('1', 'L', '1', 'document', 'I', '1', '1', '1', null, null, null, null, '1', null, null, null);

-- ----------------------------
-- Table structure for tb_approveinfo
-- ----------------------------
DROP TABLE IF EXISTS `tb_approveinfo`;
CREATE TABLE `tb_approveinfo` (
  `ao_id` int(11) NOT NULL AUTO_INCREMENT,
  `comment` varchar(255) DEFAULT NULL,
  `approveTime` datetime DEFAULT NULL,
  `document` int(11) DEFAULT NULL,
  `approver` int(11) DEFAULT NULL,
  PRIMARY KEY (`ao_id`),
  KEY `FKAB75A54A83F91A79` (`approver`),
  KEY `FKAB75A54AF409FD06` (`document`),
  CONSTRAINT `FKAB75A54A83F91A79` FOREIGN KEY (`approver`) REFERENCES `tb_user` (`u_id`),
  CONSTRAINT `FKAB75A54AF409FD06` FOREIGN KEY (`document`) REFERENCES `tb_doc` (`dom_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_approveinfo
-- ----------------------------

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
  KEY `FKCB83DABEC01C0076` (`pid`),
  CONSTRAINT `FKCB83DABEC01C0076` FOREIGN KEY (`pid`) REFERENCES `tb_dep` (`dep_id`),
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
-- Table structure for tb_doc
-- ----------------------------
DROP TABLE IF EXISTS `tb_doc`;
CREATE TABLE `tb_doc` (
  `dom_id` int(11) NOT NULL AUTO_INCREMENT,
  `doc_title` varchar(255) DEFAULT NULL,
  `doc_desc` varchar(255) DEFAULT NULL,
  `content` mediumblob,
  `creator` int(11) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `workFLow` int(11) DEFAULT NULL,
  `processInstanceId` bigint(20) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `loadName` varchar(255) DEFAULT NULL,
  `flag` int(11) DEFAULT NULL,
  PRIMARY KEY (`dom_id`),
  KEY `FKCB83DBE77AA233E0` (`creator`),
  KEY `FKCB83DBE75EDA9273` (`workFLow`),
  CONSTRAINT `FKCB83DBE75EDA9273` FOREIGN KEY (`workFLow`) REFERENCES `tb_workflow` (`wf_id`),
  CONSTRAINT `FKCB83DBE77AA233E0` FOREIGN KEY (`creator`) REFERENCES `tb_user` (`u_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_doc
-- ----------------------------
INSERT INTO `tb_doc` VALUES ('1', '001', '0001', 0xFFD8FFE000104A46494600010100000100010000FFDB004300080605080C141A1F0606070A0D1D1E1C0707080C141D231C07090B0F1A2C281F090B131C223734270C121C202934392E1920272C343D3C33242E303138323432FFDB00430109090C1832323232090B0D21323232320C0D1C323232323218213232323232323232323232323232323232323232323232323232323232323232323232323232FFC000110801C802B803012200021101031101FFC4001F0000010501010101010100000000000000000102030405060708090A0BFFC4001F0100030101010101010101010000000000000102030405060708090A0BFFC400B5100002010303020403050504040000017D01020300041105122131410613516107227114328191A1082342B1C11552D1F02433627282090A161718191A25262728292A3435363738393A434445464748494A535455565758595A636465666768696A737475767778797A838485868788898A92939495969798999AA2A3A4A5A6A7A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6D7D8D9DAE1E2E3E4E5E6E7E8E9EAF1F2F3F4F5F6F7F8F9FAFFC400B51100020102040403040705040400010277000102031104052131061241510761711322328108144291A1B1C109233352F0156272D10A162434E125F11718191A262728292A35363738393A434445464748494A535455565758595A636465666768696A737475767778797A82838485868788898A92939495969798999AA2A3A4A5A6A7A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6D7D8D9DAE2E3E4E5E6E7E8E9EAF2F3F4F5F6F7F8F9FAFFDA000C03010002110311003F00F43F05F807C352D85AB5D784FC3F2C8D04334F3496D1969A57B7524C8E5792C6B73FE15C7857FE84DF0D7FE02C5FFC451E04FF0090759FFD7B41FF00A4C95D050073FF00F0AE3C2BFF00426F86BFF0162FFE228FF8571E15FF00A137C35FF80B17FF00115D051401CFFF00C2B8F0AFFD09BE1AFF00C058BFF88A3FE15C7857FE84DF0D7FE02C5FFC45741450073FFF000AE3C2BFF426F86BFF000162FF00E228FF008571E15FFA137C35FF0080B17FF115D051401CFF00FC2B8F0AFF00D09BE1AFFC058BFF0088A3FE15C7857FE84DF0D7FE02C5FF00C45741450073FF00F0AE3C2BFF00426F86BFF0162FFE228FF8571E15FF00A137C35FF80B17FF00115D051401CFFF00C2B8F0AFFD09BE1AFF00C058BFF88A3FE15C7857FE84DF0D7FE02C5FFC45741450073FFF000AE3C2BFF426F86BFF000162FF00E228FF008571E15FFA137C35FF0080B17FF115D051401CFF00FC2B8F0AFF00D09BE1AFFC058BFF0088A3FE15C7857FE84DF0D7FE02C5FF00C45741450073FF00F0AE3C2BFF00426F86BFF0162FFE228FF8571E15FF00A137C35FF80B17FF00115D051401CFFF00C2B8F0AFFD09BE1AFF00C058BFF88A3FE15C7857FE84DF0D7FE02C5FFC45741450073FFF000AE3C2BFF426F86BFF000162FF00E228FF008571E15FFA137C35FF0080B17FF115D051401CFF00FC2B8F0AFF00D09BE1AFFC058BFF0088A3FE15C7857FE84DF0D7FE02C5FF00C45741450073FF00F0AE3C2BFF00426F86BFF0162FFE228FF8571E15FF00A137C35FF80B17FF00115D051401CFFF00C2B8F0AFFD09BE1AFF00C058BFF88A3FE15C7857FE84DF0D7FE02C5FFC45741450073FFF000AE3C2BFF426F86BFF000162FF00E228FF008571E15FFA137C35FF0080B17FF115D051401CFF00FC2B8F0AFF00D09BE1AFFC058BFF0088A3FE15C7857FE84DF0D7FE02C5FF00C45741450073FF00F0AE3C2BFF00426F86BFF0162FFE228FF8571E15FF00A137C35FF80B17FF00115D051401CFFF00C2B8F0AFFD09BE1AFF00C058BFF88A3FE15C7857FE84DF0D7FE02C5FFC45741450073FFF000AE3C2BFF426F86BFF000162FF00E228FF008571E15FFA137C35FF0080B17FF115D051401CFF00FC2B8F0AFF00D09BE1AFFC058BFF0088A3FE15C7857FE84DF0D7FE02C5FF00C45741450073FF00F0AE3C2BFF00426F86BFF0162FFE228FF8571E15FF00A137C35FF80B17FF00115D051401CFFF00C2B8F0AFFD09BE1AFF00C058BFF88A3FE15C7857FE84DF0D7FE02C5FFC45741450073FFF000AE3C2BFF426F86BFF000162FF00E228FF008571E15FFA137C35FF0080B17FF115D051401CFF00FC2B8F0AFF00D09BE1AFFC058BFF0088A3FE15C7857FE84DF0D7FE02C5FF00C45741450073FF00F0AE3C2BFF00426F86BFF0162FFE228FF8571E15FF00A137C35FF80B17FF00115D051401CFFF00C2B8F0AFFD09BE1AFF00C058BFF88A3FE15C7857FE84DF0D7FE02C5FFC45741450073FFF000AE3C2BFF426F86BFF000162FF00E228FF008571E15FFA137C35FF0080B17FF115D051401CFF00FC2B8F0AFF00D09BE1AFFC058BFF0088A3FE15C7857FE84DF0D7FE02C5FF00C45741450073FF00F0AE3C2BFF00426F86BFF0162FFE228FF8571E15FF00A137C35FF80B17FF00115D051401CFFF00C2B8F0AFFD09BE1AFF00C058BFF88A3FE15C7857FE84DF0D7FE02C5FFC45741450073FFF000AE3C2BFF426F86BFF000162FF00E228FF008571E15FFA137C35FF0080B17FF115D051401CFF00FC2B8F0AFF00D09BE1AFFC058BFF0088A3FE15C7857FE84DF0D7FE02C5FF00C45741450073FF00F0AE3C2BFF00426F86BFF0162FFE228FF8571E15FF00A137C35FF80B17FF00115D051401CFFF00C2B8F0AFFD09BE1AFF00C058BFF88A3FE15C7857FE84DF0D7FE02C5FFC45741450073FFF000AE3C2BFF426F86BFF000162FF00E228FF008571E15FFA137C35FF0080B17FF115D051401CFF00FC2B8F0AFF00D09BE1AFFC058BFF0088A3FE15C7857FE84DF0D7FE02C5FF00C45741450073FF00F0AE3C2BFF00426F86BFF0162FFE228FF8571E15FF00A137C35FF80B17FF00115D051401CFFF00C2B8F0AFFD09BE1AFF00C058BFF88A3FE15C7857FE84DF0D7FE02C5FFC45741450073FFF000AE3C2BFF426F86BFF000162FF00E228FF008571E15FFA137C35FF0080B17FF115D051401CFF00FC2B8F0AFF00D09BE1AFFC058BFF0088A3FE15C7857FE84DF0D7FE02C5FF00C45741450073FF00F0AE3C2BFF00426F86BFF0162FFE228FF8571E15FF00A137C35FF80B17FF00115D051401CFFF00C2B8F0AFFD09BE1AFF00C058BFF88A3FE15C7857FE84DF0D7FE02C5FFC457414500707E34F00F86A2B0BA6B5F09F87E291609A68268EDA30D0CA96EC418DC2F050F4AF8F2BEDFF001DFF00C83AF3FEBDA7FF00D267AF882803EDFF00027FC83ACFFEBDA0FF00D264AE82B9FF00027FC83ACFFEBDA0FF00D264AE82800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A28039FF001DFF00C83AF3FEBDA7FF00D267AF882BEDFF001DFF00C83AF3FEBDA7FF00D267AF882803EDFF00027FC83ACFFEBDA0FF00D264AE82B9FF00027FC83ACFFEBDA0FF00D264AE82800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800ACABF2E64E259946D560AAC47259BB03DF15AB59974B990FF00BABFFA13D0055DAFFF003F173FF7DB7F8D1B5FFE7E2E7FEFB6FF001AB1E5FB54179751408CD7048450647C7703B28F563409BEFEA26D7FF9F8B9FF00BEDBFC68DAFF00F3F173FF007DB7F8D73CFAF6ACD1F996F6F6296F9F28A306631918FF00592AB2E3767FBA7078F4CEB689ACA5E212B188DD4F953C40E76923828DC70C3D87A76ACA1513F85B22335D2FDD7996F6BFFCFC5CFF00DF6DFE346D7FF9F8B9FF00BEDBFC6B2B55F0E5C4CFB835B5DC780A74BBA2E12423D4A315C29F9BE6B791B3D180DBB493C3971E76F91ADAF63DC258E0B92E3EC1823E6B75DCC9BA0030310C6D8EAF9C96D4D09BFB76D77EDFB65FE73F67F3B12F97E76EC6DFB5E36E77FCB8DF9DDF2F5E2AD5BDCACA336F7772CA0B5B93BDF892090A91827F85D48FE5589A7C659D041637F1866377ACE9D711B18EC6E0EE62F69752A00596E8281B1CA1E5957F88613D93476C9E4F87A104A36A7F629ACA575B8D56762593EC91EDD9F66202AB3AB7CA708701B201DC5D5CAC28CD73777291A837133EF7F9238D724ED07B01E94DBCBE48066E2EAF0027CB8D10C8CD3390788A14C924282780700127806B96D47C365924FED2B6B9BC2AB6FE1FF35A3666B98576EF9EDE11BB2E8B33E0ED72A54F272456EEB16D6E8230F65791C2B992D2E6C95C9D36E634014476D0AB70D1B3F5529C6181C81401343AC5BC9B7CBBDBC0598D9C71B99032CEB196C4B13E083E5A93C8191823A8CD8BAB958519AE6EEE523506E267DEFF002471AE49DA0F603D2B9C96CE591A16BAD13ED128F3F53B590C4035DDD5B8558BEDD36DC29BA830C72130CAB8036EDACA7D2647597365BEDCA47697662B1991EFDAF2E9433C89317677D3E252C1B0C416C9EF900EF76BFF00CFC5CFFDF6DFE346D7FF009F8B9FFBEDBFC6B92B6D12E5A601E38627590BC52ADA366CB4CB79B2A96DA9798142CD0055DA8A4FCC772E779AD2B4F0C5C216262B08632AD10D12167313975C6D959FE5DB29E4EDB546CF5246EDC01B7B5FFE7E2E7FEFB6FF001A36BFFCFC5CFF00DF6DFE359FA3683716E499AE51508C4761097296633D2332BB7108E06C48971D57EE85D8F2FDA80208DA4574C4F390582302EC432E0F504D6E56332E193FDE1FFA09AD9A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A00E7FC77FF0020EBCFFAF69FFF00499EBE20AFB7FC77FF0020EBCFFAF69FFF00499EBE20A00FB7FC09FF0020EB3FFAF683FF004992BA0AE7FC09FF0020EB3FFAF683FF004992BA0A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A002A84CB990FFBABFF00A13D5FAA8573237FBA9FFA13D0033656378AF4B9EE6D645B407CCC09630072C62707083D580C0AE83651B2935FE44C977F43CCF49F172D8D8848D56E6E58BC7E5B0C88118F5B91FD33CD687C3CD3EE0248F7072AE56384E00F30445C931A8E304BE0638E38AEC27F0FE9D2B6EB9D2EC2593AF9CF1A93C7FB6476AB82303A0007400761ED59461DDAFE54630A6EEB9E6B4D22883651B2A7D946CAD8E820D94C95E38D499E448D00324B239C08914725D8F65156B6545750CE54FD8A6822938F2E4950B2AF23EF44ACBD47FB42803125F1A6808A4BF88B482003230495492147F046A4927D8024F6A97FE126D33CB89D6F91A29596CB4F95413E7DC4D9C290070720839030783835E66905FB2AB25E59346FAA79B693085B6DD4CC48F3207F3798C9046064FF00B7537C5ED32EDBECE65B7826982C82E2EE040BF698D7E6C476E5DDB1688AC4939519CE4670003D3EDF54B5964912DE7DD347B7EDB160FEE7ED0B95F988C1DCBE84FBD5BD95E39A4DC69B0CB0AE9D3BBC51DE7F66D804B987CC98CAE0195963B60C63B84C03FBEC1E17A018F6AD940106CA3654FB28D940106CA3654FB28D94014665C327FBE3FF00416AD5ACFBB5C18FFDF1FF00A0356850014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450073FE3BFF9075E7FD7B4FF00FA4CF5F1057DBFE3BFF9075E7FD7B4FF00FA4CF5F105007DBFE04FF90759FF00D7B41FFA4C95D0573FE04FF90759FF00D7B41FFA4C95D05001451450014514500145145001451450014514500145145001451450014514500154DAE21491BCF9A34F9576EE206EC33F4CFA55CA6B468DF7D15BD323A7D28020FED0B4FF009FCB6FFBEC7F8D1FDA169FF3F96DFF007D8FF1A97ECD17FCF18BF2147D9A2FF9E317E428022FED0B4FF9FCB6FF00BEC7F8D1FDA169FF003F96DFF7D8FF001A97ECD17FCF18BF2147D9A2FF009E317E428022FED0B4FF009FCB6FFBEC7F8D1FDA169FF3F96DFF007D8FF1A97ECD17FCF18BF2147D9A2FF9E317E428022FED0B4FF9FCB6FF00BEC7F8D4574FA64EA56F5F4F9E338F32094A95936907E646CFDD201E956BECD17FCF18BF2147D9A2FF009E317E428029347A432A075D31910ACB6511D98B4784706DD7B18C74C631DA9FBF4CDFBF7E9FE76DFB37DA72BBBC8DD9DBE675C6EE719C53ED208CA9DD121F99D4123A012B7F2153FD9A2FF9E317E428033FECBA2FFCF0D23EFF00F69F44FF008FEFF9E9FEF7BF5F7AB7FDA169FF003F96DFF7D8FF001A97ECD17FCF18BF2147D9A2FF009E317E428022FED0B4FF009FCB6FFBEC7F8D1FDA169FF3F96DFF007D8FF1A97ECD17FCF18BF2147D9A2FF9E317E428022FED0B4FF9FCB6FF00BEC7F8D1FDA169FF003F96DFF7D8FF001A97ECD17FCF18BF2147D9A2FF009E317E4280295D5D40E63F26E2173BC12AAC0E06C6EC2B46982DE21D218C1EA080383ED4FA0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A00E7FC77FF0020EBCFFAF69FFF00499EBE20AFB7FC77FF0020EBCFFAF69FFF00499EBE20A00FB7FC09FF0020EB3FFAF683FF004992BA0AE7FC09FF0020EB3FFAF683FF004992BA0A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A00AF65F74FFBCFFF00A35AAC563EA1AD2585B4B2CD6B733C71F9979710C1B77182295892824651FBB4C9FBC0F1C64E0565DDFC4078188B9F0C6AE180B726D95E13224BAB5DCD1A8957CD0B8F3225E44CDF78640C1C007594563CDE2548A48D6FADFECA8D0CBAD5D4D3BA8FECD4B168015B82A48F944C7244854638241C81BC413AC2643A16A520DCB15858C4079B7704CEAA1A682428172CC5886705539936B6E5500D8A2B974F19EA26465FF841B5BE152E36ACF67BD7CE671FBEB7FB4F0A7670771DC723036F34F53F8A305BF4D13570FF00659BC4AD0DC4322792D67046E239A53195CB2B90C43908C369CB102803B4A2B2EC3C4114F34D1B08A39237FB2C51971BAF225B5B772E91E071119D54F5C7193C815A940051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451401CFF8EFFE41D79FF5ED3FFE933D7C415F6FF8EFFE41D79FF5ED3FFE933D7C41401F6FF813FE41D67FF5ED07FE93257415CFF813FE41D67FF5ED07FE932574140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451401CDF897466BEB19E28AD22B879049656E92636C33CB2B05793776B4721F805863280B601F3FBCD0E20858E89ABDBA4AF6463B7D3A0BB560BA5EA4ECE5D6350C16CED65089BD622766618D156303D72CBEE9FF0079FF00F46B558A00F33F13F852D2E2681A3B1F195CC6F04B1C06DA79C3DA5DC4F68632CD7322AA346A8CFF00BC2BB9D72E1A4005681F0C3BC371011ABADFBC12E9F1DCDC5C5D496D769711E03C2F3BC8AA5988CA92655E40DC9876EF28A00F08B9F831ABCD24E91693A24598638E0B96F202472CAD38FDCC89A52FCD1F04EC113818CB9CAECEAFC6FA5DC5D4F3FD94F882E4AD8DEC10DB085C4505DDD436E152CE748D7CC374371DA64970C380A40C7A651401C1F839A586EEE11FC252E9C1C8BC4B858C84B6B1B3B2B348A2172A8149F9A5F95646119560BB81DC7BCA28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A00E7FC77FF20EBCFF00AF69FF00F499EBE20AFB7FC77FF20EBCFF00AF69FF00F499EBE20A00FB7FC09FF20EB3FF00AF683FF4992BA0AE7FC09FF20EB3FF00AF683FF4992BA0A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A2AADE47D0B3CA141DB30562308FDC9523EE1C77C019A007597DD3FEF3FFE8D6AB15456D10381034EA07FA44C37B60EE2700A93FC6D93F873D6AF5001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450073FE3BFF9075E7FD7B4FF00FA4CF5F1057DBFE3BFF9075E7FD7B4FF00FA4CF5F105007DBFE04FF90759FF00D7B41FFA4C95D0573FE04FF90759FF00D7B41FFA4C95D050014514500145145001451450014514500145145001451450014514500145145001552F2F9A220242AE4E5B96C6D098F63D7356EB3B511975FA37F34A006FF6BCDFF3E917FDF67FF89A3FB5E6FF009F48BFEFB3FF00C4D45E5D4171750438FB4CC91EE22DE007ACD3303858D7B9600F1D6802E7F6BCDFF3E917FDF67FF89A3FB5E6FF009F48BFEFB3FF00C4D62EADE24B4B303ED2B72D23110DAD9A21DF77239E9046D8CE3EB81F956A2A923952BDCA9FE13EF8F4FAD3B75B7945F72535D1FAF9137F6BCDFF003E917FDF67FF0089A3FB5E6FF9F48BFEFB3FFC4D73B26B93F9DB254B6B24DC228E7B90E7EDE491F2DB36D54DD3839189A46C754CE42B2DB579AE24D976B0D8A9DD0ADAC9E6096FD769CFD96622300DB8192636987A30E09451D2FF006BCDFF003E917FDF67FF0089A46D56523E6B2848FBACA5FEF03EA3677AE534EB58A149256B9BF6C4925BD95BCD73332A181CC614A966C9B895491FBB6605B0A0903296DE24BC71208224B99D4A436CC6178BCD9E704945B6B97196B5847998F31770207CBD6803A7B6BE9A31CC0AE73B9A467397C0C0DDF2F65007BF5A9BFB5E6FF9F48BFEFB3FFC4D71B3789DC984A9797974916159143DE99C448350575CA24CED212194E1970A58AFCDB1ACB4E9060CF8918C5A74D711654C7F6B9D10B5B0C9C150C4AF270719CD006D7F6BCDFF003E917FDF67FF0089A3FB5E6FF9F48BFEFB3FFC4D71B69AEDC641B8779248D174DBA8C1C2EA1A9DE5E98B736070B14D0B73B09DADC282306EB6AF7D149E54ED672DC36CFB25CA232A47F68598FEFA12EC7F72B031E1C6E242FCBCB50074BFDAF37FCFA45FF7D9FF00E268FED79BFE7D22FF00BECFFF00135C5B6BF7B1CAEB70DFBFCFD8E368629648E2B7B486262E2CE2E775C34E01F982818058951BE73E26BB5553E55B3C84157D31A39964648E57025112248C1260A300C3C6705C9C0201D6FF006BCDFF003E917FDF67FF0089A3FB5E6FF9F48BFEFB3FFC4D73571AFDCC72010C10DC93B7CED3E30DE6E945D47174F1091732E4E37342BC7DE232C3A0F2E80246D6A45FBF691E3214E1FA6E3D86DED5A958372985FC57FF004315BD400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451401CFF008EFF00E41D79FF005ED3FF00E933D7C415F6FF008EFF00E41D79FF005ED3FF00E933D7C41401F6FF00813FE41D67FF005ED07FE93257415CFF00813FE41D67FF005ED07FE93257414005145140051451400514514005145140051451400514514005145140051451400551BC1975FF0075BFF424ABD552E17322FF00BAFF00FA1250043B3DAB23C47A4DB5D4612F9014249DDC6617485C868D891828C33D47BF15BFE5FB557BAB012E3F7D2C641F351D31907691C8607A827B534DFD96FBA1497F325D99C3E93A42DAB19359BD5D46E33F645B8B9287CBB255520405E5501A446E4E5F9E071D7A8D2F20604DE626D4B9849C65126DDC165241DB8EC48F4E29AFA2DD82DB584AA4F9A9234CC8C7F76A3E711201C15AB76163708C4DCAC4A36A411AAB963888B72EEEA3AEEF7F7AAAB2BEB2DF6F97622946DA4579FCC9F67B51B3DAAC797ED4797ED5068660D1AD444231062150B04318273124206DF2E4CE731100839C83C839AAE9E17B0552AB1DC905BED8D319A42E27081729745F703E58DBC30E38E84D71BE35F136A96F732C76F73AEA43F6737D02DA4711F267E46F79769611AE0E4EE0C0FDDC0C53FC0DE26BC9A461A8EADAD4F1C71433C30FD9F3E734D6659BED52AC3BB861F27CE0BF62F9E403B21E1BB00AEA2D7E574FB05D0DCD99E0CB9F9DF39CBB48E49CEE24E4926ADCD6314854CB1EE643F68B7393FBB90C6CB9C0FF006188E6BCCEC3C65752C92C2D79ABC0B25C4E5350F2A56786C22DBFBAD2E10AC4385E4E5408C738C918E97C43E204B78E17B6D535AB3B6DFF00D9134460024BB9648B2A649F510B8116D3962181EE7824006F8D02C40709688AB237DB6E82646FB9C2FCC841E18150723073F30E79A67FC23965B36F953633F68F3BCC7F33CEDB8DDF6CDDBB3B3E5CEFCEDF97EEF15E77A7F8C5A42C969E22F105BCCF71FD9D692CAF6930F325751B9A001485619FB84C63F849E95178EFC4BA8C73CC2C3C45945840D967BF16728D4146D99924215D1782C42E47CBB4122803D18785B4E08AB05B3C08A59E016EEE86113BE582491329DAEFCE33B781C7031A315B471802089234004714683023451C0451D94572BE04D4F52B87BA17B6F3792B712A4334F2E5ADDF70FDD24237002DD7B87DBCE141E48ED3CBF6A00AFB3DA8D9ED563CBF6A3CBF6A00A178B85E9DD7FF00460AD8ACCD41309F8AFF00E8C15A7400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451401CFF8EFFE41D79FF5ED3FFE933D7C415F6FF8EFFE41D79FF5ED3FFE933D7C41401F6FF813FE41D67FF5ED07FE93257415CFF813FE41D67FF5ED07FE93257414005145140051451400514514005145140051451400514514005145140051451400556906645FF75FFF00424AB3505C5AB39062B878986503000E55F1D430F5028025D946CAABF63B9FFA09CBFF007C2FF851F63B9FFA09CBFF007C2FF85005AD946CAABF63B9FF00A09CBFF7C2FF00851F63B9FF00A09CBFF7C2FF0085005AD946CAABF63B9FFA09CBFF007C2FF851F63B9FFA09CBFF007C2FF8500735E24F8676FA8CBBE7BCC315166FE64618DADAAE722C39500C819B9749482414DB8153787BC13756133BAEA762F1BAC76D35A240C3CA8AC602AA2DE5699B1818CE4367DAB7FEC773FF0041397FEF85FF000A3EC773FF0041397FEF85FF000A00E5E1F8640B4DF6CD72E9E09256D6EDADA14453A7DECA4E1E3BA219B743F2E08641C72082456BB785CDCC48BE25B98EF9D196EEDEE600F1159A24C063E5C87E60493C151E8062AEC70DCB161FDA328C1F2F3B57E6CA03E9EF527D8EE7FE8272FF00DF0BFE1401CEE95F0CB4F8198DDCD75767CF3AED90792402D2524637C7E610CD1E3EF1193DEAB7883E1B5C6A324AD75AD411EF88693024701FF47823BC590190994E4FCB83C28EF81D2BABFB1DCFFD04E5FF00BE17FC28FB1DCFFD04E5FF00BE17FC28039AF0AFC3CB8D32691BFE124BDBB85F73FD8A50789E5753BE6937905B6AE09D809F6E95D7ECAABF63B9FF00A09CBFF7C2FF00851F63B9FF00A09CBFF7C2FF0085005AD946CAABF63B9FFA09CBFF007C2FF851F63B9FFA09CBFF007C2FF850037534C467EABFFA316AF551934E99C625D42465E18A955E4A9CF240F5157A800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A28039FF001DFF00C83AF3FEBDA7FF00D267AF882BEDFF001DFF00C83AF3FEBDA7FF00D267AF882803EDFF00027FC83ACFFEBDA0FF00D264AE82B9FF00027FC83ACFFEBDA0FF00D264AE82800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2802BC1C3383C1C8980F5468C0FD594D58AAE9FEB1BFDD4FF00D09EA492E6242A269A24663E4DBA3100CF284271103D484563C7604F6A00928A2A3B7B98A550D6B3452C6C04D04D19056689C6418DC750C3A500494546B731162AB34464004D2C208DD1C529600BA7A485580F5C1C74A92800A2A386E629066DE68A45CB42CE8410B2C2E41048EF1B820FA1E0D47FDA569BB6FDB6DB7EEFB1795BC67ED3E4EFDBB33F7BC9F9B1D76F3D2802C5151DBDCC52A86B59A296360268268C82B344E320C6E3A861D2A4A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A00E7FC77FF20EBCFF00AF69FF00F499EBE20AFB7FC77FF20EBCFF00AF69FF00F499EBE20A00FB7FC09FF20EB3FF00AF683FF4992BA0AE7FC09FF20EB3FF00AF683FF4992BA0A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A00AE9FEB1BFDD4FFD09EBC6FC3FA52ABC696FA7F85A602F2F2CEFE086DCC62FA7FB3EA4162BF93F7802C318381FBC608EA0A800197D91B8906DE32A77FF00B5E5B2E3FEF9DC6B3DBC1FA61CF9705CC3955B28FC89A54FB05B43B70BA6F96E3CB57D8BB847B03606FCE28038BF0A684ABA65A93E1ABE0C5239D60D0AECC4D7AB3DAC799752224B605A42A0105A423B31C9C47E08D0ADE52A6E7C39E2E4297375756D7D35F131D94F15EDC0FDE5BADE312C149463E530724EE2CA4B1EC21F00E971C6A96D26B70C29C5B4515F5C8F290AA8DA1966076A2A8C0CED5E76819392C7C03A5DB106CE4D6D30C6F0466FAE4ABCEF21626581A620F9B2124E5486C9DD9C9A00F3BF12E9FACDC45A935F5958C8C81E29AE21BEB88FEC900D2616F2D2D638C8916D4BB11BD91598B1D89B88AD0F19DADBD95BDB9D4FC25E0DB72257D26CED98249058DA5D40EECD14570D6681A69A203961819DA496C1EE352F0469577BFED915F6D90997508E1B99916F9A48110FDA638645041863518208EBC7273A1A6E9105A295B592F9D49F349B99E49183103EECB3BB1C6074CE3DB93401E21E0AD474DBBB9B749B43F06B334F2B2CD696D6C92DA0B0699D1A096D2F246011A241CC1B19782EF90CFB7A746F6F7259E3B9D3625BF5799B54B9695ADE083C35217FB5666751988E43F9EC791BC61029F58B2D3ADEDD48B38BCB42CF78CB92733DD4CCCC72C4FDF9189F41D060565DBF81B478F6E6CA59CACA35E8DEEA59246FED28E0D81DA49DD8931440019240C0200201A00CFF0086ACDFD9F6E25D4A2B971142AF1A00069CAD671154280939111563B98924E4614AA8EB2B2F41F0BE9DA6214D1ADE58A3244ACAF23B92C91228C492B31C47122A819C003815A9400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451401CFF008EFF00E41D79FF005ED3FF00E933D7C415F6FF008EFF00E41D79FF005ED3FF00E933D7C41401F6FF00813FE41D67FF005ED07FE93257415CFF00813FE41D67FF005ED07FE932574140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051452312070A5BB851FC58F4CFAD0040FFEB17FDD7FFD092AC5505B991D95A3B2B829B480729F3090A9181BBD055B82712282A8CA0F40D8E80F6209EBF5A00928A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A00E7FC77FF0020EBCFFAF69FFF00499EBE20AFB7FC77FF0020EBCFFAF69FFF00499EBE20A00FB7FC09FF0020EB3FFAF683FF004992BA0AE7FC09FF0020EB3FFAF683FF004992BA0A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028AE6E0B488A8CC31938049C0E491DEA4FB1C3FF003C22FC85007414573FF6387FE7845F90A3EC70FF00CF08BF21401D0515CFFD8E1FF9E117E42A28059CB9FB335ACBB49B79BCBC1F2664EAB263A15F4EB401D2D15C45DEB56B1AAB5A69925F40C5628EF2D4C255A59A5DA14169179F3081D303B9EB8B42F2C9427DBE3B7B291C98EDED2E1A30D2B86C6230AC412723A13D477A00DF9F7A6562DC03E440E3FE58CAE4EECB7B03B873EA3D2AEAA803E45007DD551FC207A0F6AE6F167BF6EEB5F371F68FB3F1BBC9CE37797D71BB8CE315159DC59CE018A3886EDCD6E8C066E21864C6F840EAAF90411C1041EF401D5515C925ED8B4C635894CA17ED2485F9480464071FC51064241C1C3023AD360D4F4C7489A492D20F342CD630CC5434FE6AA901109E48DC3A66803AFA2B92BEBDD3EDC379BF676902FDA859A6DDF3A16C0F2612464CB26147A9E3AD3DAEF4C56657BAD3D6441F68BA84B2E6DA1001DD326780011C9C0A00EAA8AE5E4974F44DF2CD649060482E98A8529263044A78C3E4639E6AC7D8E1FF009E117E42803A0A2B9FFB1C3FF3C22FC855CD1D154BEC50064600EDF20ED401A94514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450073FE3BFF9075E7FD7B4FF00FA4CF5F1057DBFE3BFF9075E7FD7B4FF00FA4CF5F105007DBFE04FF90759FF00D7B41FFA4C95D0573FE04FF90759FF00D7B41FFA4C95D050014514500145145001451450014514500145145001451450014514500145145001451450062DAA7C8BC761FF00A08A9BCBF6A2CD3E45FF00747FE822A7F2E80383BEF19DCDA49226A56974F2927FE11F168148D450C84059030243230E7D7A803BDFD0FED5165F5CD4A39E490E1A3864CC5A4940308918E3201193939FA726ECBC11E6C730224FDD068DF08CF767E6497EEFCF1B11D33838CF6A662E5448675B80BE5BA82EC48DD8EC0CEFDBFD81F5EC756F4FDD452764E6F7BF9797998462EFFBC937FC8BB7F997B55D121BB4DB70CEAB91265429C95FEFC522B291ECC8C01E46080450B8F07A4F1AA5FDCA32A1DB6663863C2DB850009ADA55742CA07511A63A2850483D27974C959514970E40064608A492147F046A0927D8024F6AC8DCC5934EBC7783ED4D0BEC2F7D717512ED0D2794CAAAB033B1F9D64273B8FDDF718CAD7B48D4E7775852F16293658C935B08369D319807FB63CC0BEE40D2E3682A3231CEEA9E4F89BA1831EC935092270F24778B049B112D172C49650484C1CED56C7F16056A47E2CD21915A4D4E0B78DB9B57BBCC7F6A50AA7302CE17230C39008F7A00C4B9D37545919AC34EC4C0C97ACCCCA62D4996DDD63F251DCB2BAA940C408811BB248DB5A1A0F87DEC8BAEF9A78B11AD9DE4A5772C314657CA2100E2DB6EE07001DC7BE4986D7E25F87A45065D560B762FF6068256198E507AB18CB0DAC39DC18A7AB55ED57C5DA6594D1C7A8DD244F20691646650B6A912F5BA66618129C81C1C9E28031755F0C5F4EAE61892392495E2B852C330E9B716BE5655C7518549B692B9C63EF006AD5FE937921B84166EE271F678B51DCBB6C2D1ADD5712A96DD989FCC60021524FDE19622F47E35D1DA16956EE716AB8F32EDA1902B6F7DBFB92C83387E0E338EF8A3FE12EB6DFB7FB33C41B36F9BF6AFB1CDB77EEFBBB766738E7EE6DF7CF140198FA2DE39093E988CBF68FED797546653B55272E8608FA92B0AAC473B4A8236EE515168DE1CD45760BCB8BF568834C924FE498EE351923652F1470A876572EEC77C88C78CE49245FB8F88BA1469132EA29224AC2DEDF04031233B0DF3C7215212375209C53F42F1CD86A0EAB6505EA33447568CCAAA02C11DC14C31563C971F4C77ED4005A785DE02ED697708B97F9A595A1509E633E4936F0EC273CE37C8ECBD9B96DD6346F0DDBD9022D5DD813BDB2A8A0607F0C30222E7DF66E3C0248000DAF2E8F2E8020F2FDA9FA60C349F55FF00D00549E5D374F18793EABFFA2C5005FA28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A28039FF001DFF00C83AF3FEBDA7FF00D267AF882BEDFF001DFF00C83AF3FEBDA7FF00D267AF882803EDFF00027FC83ACFFEBDA0FF00D264AE82B9FF00027FC83ACFFEBDA0FF00D264AE82800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A280295927EED38FE15FFD0454FB3DAAA5AEA50222894CAAC008DD4A37CACAA3AF1D8D4BFDAF6BFDF93FEF86FF00E26801F2DAC720C4F1248A7EF238C86C1EEA7D0D57FEC2D3FF00E81965FF007ED7FC2A5FED7B5FEFC9FF007C37FF001347F6BDAFF7E4FF00BE1BFF0089A009B67B5437689B1BCE13ECDA7CCF2B76ED9B4E7C9F2F9CE3A6DF9BD39A3FB5ED7FBF27FDF0DFFC4D1FDAF6BFDF93FEF86FFE26803E7AB6D3EE23451777935BF9715CADCC6F70856CDEE6D9F6A25BB2E11AEDF2A53734A704ED4C035EA9A06B36D0D8C1E578BF4889CAA217BE2845B98EDD331C491BC5CC04AF566619F9B3918EC7FB5ED7FBF27FDF0DFF00C4D1FDAF6BFDF93FEF86FF00E26803CDFC19AFC7135C79FE2BF0D4086EA5B89525001BE8D8AE5ACDCCE30B28E9F2BE3D4D4DA8430DB6ACC6F7C5375641EDBCF5B995E10222D75811DBF9D190142AE718DD9C924F35E85FDAF6BFDF93FEF86FFE268FED7B5FEFC9FF007C37FF0013401E6FE042D269C534BD7DE4BCF2A75B6D211E206CA6695F6B2614302588E4C9819FA639FF00EC6F10FDA76F97AA7DBFEC99DDE69DDBFCDC67ED1F6CE9E67FB5B7BF935ED1FDAF6BFDF93FEF86FF00E268FED7B5FEFC9FF7C37FF13401E75E27176134F8EFB55823B9F36D4DD5B70D3C772158193CD666042BE47313027A93D2B8BF046A1A6C7756BFDA9A75ECA4A7D8EC59C6546A135FBED7815DB1B62524703860481BB9AF79FED7B5FEFC9FF7C37FF1347F6BDAFF007E4FFBE1BFF89A009B67B51B3DAA1FED7B5FEFC9FF007C37FF001347F6BDAFF7E4FF00BE1BFF0089A009B67B5416630F27D57FF458A5FED7B5FEFC9FF7C37FF134DB0955DE431EEDA4A9524119010763EE2802F514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451401CFF008EFF00E41D79FF005ED3FF00E933D7C415F6FF008EFF00E41D79FF005ED3FF00E933D7C41401F6FF00813FE41D67FF005ED07FE93257415CFF00813FE41D67FF005ED07FE9325741400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514015EFFF00D5BFFBADFF00A09AB14D923560438CA91B187AA91EBEE2A3B4919914B9C92A1D8FAB151DBDE8026A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A28039FF001DFF00C83AF3FEBDA7FF00D267AF882BEDFF001DFF00C83AF3FEBDA7FF00D267AF882803EDFF00027FC83ACFFEBDA0FF00D264AE82B9FF00027FC83ACFFEBDA0FF00D264AE82800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800AAF61FEAD3FDD5FFD04558ACFFED0B7B68775ECBB1140B676009324AADB408235049334980A002CC480064E2803428AE3E5F8996D11805DE97A909A46FB16A315BC3348BA6DCA5AC8CCB05DC1132C8D6D2C650846C8E49C6D602BF89FE2DD9E981BCED2EE59BCBFED2B349A6B788DEC6D19231693CCB20F98153FE8E5B2080A4F0403B8A2B8FD3FE25C57892B68FA35CDCF94BF6BB848A7B690C881BEEC09673CC77C9186280AAAB1182CBD6A4BFF001F5C413F967C25ABC8A0177B912DB004C93AA47B55EE0605F3960BB8A39230AAD86DA01D6515C1EB3F16A3B499A31A544254825D76EA0B8BA84386B4B55711C36F0B4A77386E7704180590B815A9E15F1BFF0068C92A63447F2D62B9FB4E9B77E7249F6B6946D793CA8F0D1F959C60F04500751451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450073FE3BFF009075E7FD7B4FFF00A4CF5F1057DBFE3BFF009075E7FD7B4FFF00A4CF5F105007DBFE04FF0090759FFD7B41FF00A4C95D0573FE04FF0090759FFD7B41FF00A4C95D05001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450015CDF892D166B2955FCA00968C33DA1B81131B9E08D3101DC633C8E0807E6604022BA4AAF65F74FF00BCFF00FA35A803C6F57D1B50B75511587882378A05BBD26D5A3BE7F33518C4E9E5DAB6997852311C0A8A32CEFB5B323336E27A0F1D787AF664B85F0BDD78823985AFF65EA4AD1EE8EFED2D6294AA452DC44CD24977E6B2E526F9793236E0AAFE99450079BDCE99A95BC377F6D8F52D6B55F255A16B88F6C57D169AEEC8DA64F650AED71248CC137F9C1C615B68594F3FA9F82D1553CCF0BFDAAC8AA5AC72C962AD709A3DA4DA6C43ED724716F0F2DB7DA5C00448AA7A2B2ED4F68A2803CBF50B1D52EE78EE3563ADD844F68E91D8D9ACEDFD98F21B3212FA2B7557DE6E9E42DE5BC6CC88A090038373E1AC572AD27F6ADEF88269F328B75BB86F9163B35BB6DA775F4AE84CB17965400245190C58EE35E8945001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450073FE3BFF9075E7FD7B4FF00FA4CF5F1057DBFE3BFF9075E7FD7B4FF00FA4CF5F105007DBFE04FF90759FF00D7B41FFA4C95D0573FE04FF90759FF00D7B41FFA4C95D050014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500155EDBEF3FF00BC3FF452558AAF6DF79FFDE1FF00A292802C51451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451401CFF8EFFE41D79FF5ED3FFE933D7C415F6FF8EFFE41D79FF5ED3FFE933D7C41401F6FF813FE41D67FF5ED07FE93257415CFF813FE41D67FF5ED07FE932574140051451400514514005145140051451400514514005145140051451400514514005145140051515C5C2C4B975661C2ED5EA4B301C671DCD55FED94FF009F4B9FFC77FF008AA00BF4550FED94FF009F4B9FFC77FF008AA3FB653FE7D2E7FF001DFF00E2A802FD1543FB653FE7D2E7FF001DFF00E2A8FED94FF9F4B9FF00C77FF8AA00BF4550FED94FF9F4B9FF00C77FF8AA3FB653FE7D2E7FF1DFFE2A802C5D8936FEE1DD48F9C84009740790A083C91D3DEAB3C0EA336F7D39672361C261D8A8E7EEFF000A0CF519A5FED94FF9F4B9FF00C77FF8AAAD1DF05624DBDC14E5E04F97F76F275DDF37AF4FA91D2803628AA1FDB29FF3E973FF008EFF00F1547F6CA7FCFA5CFF00E3BFFC55005FA2A87F6CA7FCFA5CFF00E3BFFC551FDB29FF003E973FF8EFFF00154017E8AA1FDB29FF003E973FF8EFFF001547F6CA7FCFA5CFFE3BFF00C55005FA2A87F6CA7FCFA5CFFE3BFF00C551FDB29FF3E973FF008EFF00F154017E8A8EDEE16450630C01F9941EC3DEA4A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A00E7FC77FF20EBCFF00AF69FF00F499EBE20AFB7FC77FF20EBCFF00AF69FF00F499EBE20A00FB7FC09FF20EB3FF00AF683FF4992BA0AE7FC09FF20EB3FF00AF683FF4992BA0A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A00A9A90F93F15FF00D1AB547655FD447C9FF024FF00D1AB55F650041B28D953ECAE47C71AB496BB3CB9A44055DCAAB32EF747880DC5083F2863DEA672B6E8DB0F49C9A50EBA23A7D955EFAED2DD19A6572AA37B05F4F7270001DC92140E588009AF3BD17C593CD2A0FB44C3E68D71E6C877079D010C8EE47CCA4F6AF53D9534E77D91B6330D28BB546BB9CD8F14A088CB35AA0B7244768C92C64C87241FB44A18228561C1F3C83D386214C5A86B571E54670F6A25758ADE7B5FDEB47686267C889518169510AF01D573B833015D2476102333456D0A48D8FB4CCAA01B8F2C6079AE3AEC1D33D3B567DD785E17656B3B89AC5817B9636CB1E27B8B8001799248D86EDA319C06C1233826B438CA03519A048FC8FB7EA0F2B9B580DDA88DA122173FBC4F2930AA63E7E42D8395DDC02F83C412CDC5969DE6CAB96D420DE00816299D0FD9E461F319648DF6E4202065CA700EA45A38050DCDE5CDCBA0658DE5DBF3BCC47CCE88AA374480A8200E0907393549BC1D06D020BFD4A03B059DCCF0B80F7BB0B10D34C173B9657662415DC49DFB871401561BBD425B457B45796770B78889B03416D752024425C852D6B036013C1232C39C5529B50D4113FE2597DF6C2648AD625BB1B258E46972EB2C0B08C0F236B7FABDC14B3E480B5D25D6890C8A82177B5D844963240147D8CAA15FDD46CA463CB62B82A460F183822BAF86231B49BDBC69564FED492E8ECCDDCC212989942630613B7E5553DF39C9A00CB93C610AC850BE959CBC1129B95DD14B6D1B926FE1553B530879DCC471B941C819F0F8E8C112FF006A9B05B848D67D6219A6092191A20D8B4B52809764209184504ED0C7071B9FF0855BE0ABDFDFB45E53E8B6D6E7662C6CEE42E440C10125151402CCE7D7356E3F0F057DCBA95F804ACF79102A05FDC448A034ECA8082CA8B90ACA87182B824100A4FE20114C23BDB6457639B530C8ADBE0248064B7255B24839C46EAA392D80482CFC401E5F2AEED923B8037C8B0C8AEA8300F2010C015239685173C0272B9DA82C208B3F66B6862DC4DC4FE5A81E74CFD5A4C752DEBD68B6B082150B676D0C118FF570C4A004DC73F2A2FA93400DD946CA9F651B28026D2BFD527D2AE553D2BFD527D2AE500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450073FE3BFF9075E7FD7B4FF00FA4CF5F1057DBFE3BFF9075E7FD7B4FF00FA4CF5F105007DBFE04FF90759FF00D7B41FFA4C95D0573FE04FF90759FF00D7B41FFA4C95D050014514500145145001451450014514500145145001451450014514500145145001451450056BF1F2FF00C093FF0046AD2797ED4EBD1F28FF00793FF46AD4BB28020F2FDAB03C49E103A814DB750C5B4344C9221612ACCC87A23A1CA941DEBA6D946CA4D774694AA34EF4A567D1F6382B1F85E61756FB7D900AC970C2385C17104AAD85779D80DC547F09E2BB6F2FDAA7D946CA518A5F0A2EBD79CBF8F36FA220F2FDAB8BF1B78BAEAC1E25B58A689372DC4F76CA365EE588102DC38C29988CB3165D8A32371E2BBBD95CB789BC18DA84B19363A5C8A9F37DA2EDE5610E32711E991B229DEC1724C9C8E08381546061689E3ABA9AEE649EFBC3CD0EE861B28C5D0C2F9C9F37F67482205CB375076E0F00D51D53C6DAEEE51A74A8C05D0F0F5C4A96C805C5C213944125D3121F8ED1FF00BEB5B3E1FF0007F88EDE480EA7AB79A89E67F6ABFDAE67FED5F394ECFF004591401F672477E7AF5AA3AFFC28BAD4A40F751E8F627CC533DBD9FF00CB4B37C991E6BB3102D24AF8C654281EA49A007DC78C2F8DB4B21D4E0B49229869ADE65B30549E161B96FBCA7B8F9640D8054A1CF19E4551B8F1D6AD149BE4BC93FB3B6A46B7C74E9446EF70DFEB143480ED8D4804F9BCE46C8DBEF56E5DF82B577B2920B46D1ECA52404BAB3F917568F7618DFDBA45F29962032159B278C85E0F2F77F04F5959524D1EFF0047866046A132FCC12D2FFCD271630846F9211B40C9C9C7200E2802FF008C7C57ADDA5C471C3A9410028F207458144F32C036977B995F0A670472B19C642973CD5BF08F88EFE7B855BFD6A09E330FEF21796D4B49AB2B027EC896A49DA230C4647D7B54D7FF000DF5096E209E6B882FAE153C8D5A0B899913CF5B70A0E98F1C44AED94B3F404372B83D2F7847C23A9E9F2486EA1B56492492F19D6EE66FB34736300DB49180CCACA32C48623F2201D5F97ED4797ED53ECA3650041E5FB51E5FB54FB28D94015B4AFF00549F4AB954F4AFF549F4AB94005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451401CFF8EFFE41D79FF5ED3FFE933D7C415F6FF8EFFE41D79FF5ED3FFE933D7C41401F6FF813FE41D67FF5ED07FE93257415CFF813FE41D67FF5ED07FE932574140051451400514514005145140051451400514514005145140051451400514514005145140115CC2CEB88D955B22442471BA3607E603D71506DBFFF009E963FF7CB7FF155728A00A7B6FF00FE7A58FF00DF2DFF00C551B6FF00FE7A58FF00DF2DFF00C555CA28029EDBFF00F9E963FF007CB7FF001546DBFF00F9E963FF007CB7FF00155728A00A7B6FFF00E7A58FFDF2DFFC551B6FFF00E7A58FFDF2DFFC555CA28029EDBFFF009E963FF7CB7FF1546DBFFF009E963FF7CB7FF155728A00A7B6FF00FE7A58FF00DF2DFF00C551B6FF00FE7A58FF00DF2DFF00C555CA28029EDBFF00F9E963FF007CB7FF001546DBFF00F9E963FF007CB7FF00155728A00A7B6FFF00E7A58FFDF2DFFC551B6FFF00E7A58FFDF2DFFC555CA28029EDBFFF009E963FF7CB7FF1546DBFFF009E963FF7CB7FF155728A0082CEDCC480330240DA48EFF4A9E8A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A28039FF001DFF00C83AF3FEBDA7FF00D267AF882BEDFF001DFF00C83AF3FEBDA7FF00D267AF882803EDFF00027FC83ACFFEBDA0FF00D264AE82B9FF00027FC83ACFFEBDA0FF00D264AE82800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A28039FF001DFF00C83AF3FEBDA7FF00D267AF882BEDFF001DFF00C83AF3FEBDA7FF00D267AF882803EDFF00027FC83ACFFEBDA0FF00D264AE82B9FF00027FC83ACFFEBDA0FF00D264AE82800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A28039FF001DFF00C83AF3FEBDA7FF00D267AF882BEDFF001DFF00C83AF3FEBDA7FF00D267AF882803EDFF00027FC83ACFFEBDA0FF00D264AE82B9FF00027FC83ACFFEBDA0FF00D264AE82800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A28039FF001DFF00C83AF3FEBDA7FF00D267AF882BEDFF001DFF00C83AF3FEBDA7FF00D267AF882803EC3F05F8FBC351585AADD78B3C3F148B0430CF0C9731868654B75044885B82878E95B9FF000B1FC2BFF439786BFF0002A2FF00E2EBE20A2803EDFF00F858FE15FF00A1CBC35FF81517FF001747FC2C7F0AFF00D0E5E1AFFC0A8BFF008BAF8828A00FB7FF00E163F857FE872F0D7FE0545FFC5D1FF0B1FC2BFF00439786BFF02A2FFE2EBE20A2803EDFFF00858FE15FFA1CBC35FF0081517FF1747FC2C7F0AFFD0E5E1AFF00C0A8BFF8BAF8828A00FB7FFE163F857FE872F0D7FE0545FF00C5D1FF000B1FC2BFF439786BFF0002A2FF00E2EBE20A2803EDFF00F858FE15FF00A1CBC35FF81517FF001747FC2C7F0AFF00D0E5E1AFFC0A8BFF008BAF8828A00FB7FF00E163F857FE872F0D7FE0545FFC5D1FF0B1FC2BFF00439786BFF02A2FFE2EBE20A2803EDFFF00858FE15FFA1CBC35FF0081517FF1747FC2C7F0AFFD0E5E1AFF00C0A8BFF8BAF8828A00FB7FFE163F857FE872F0D7FE0545FF00C5D1FF000B1FC2BFF439786BFF0002A2FF00E2EBE20A2803EDFF00F858FE15FF00A1CBC35FF81517FF001747FC2C7F0AFF00D0E5E1AFFC0A8BFF008BAF8828A00FB7FF00E163F857FE872F0D7FE0545FFC5D1FF0B1FC2BFF00439786BFF02A2FFE2EBE20A2803EDFFF00858FE15FFA1CBC35FF0081517FF1747FC2C7F0AFFD0E5E1AFF00C0A8BFF8BAF8828A00FB7FFE163F857FE872F0D7FE0545FF00C5D1FF000B1FC2BFF439786BFF0002A2FF00E2EBE20A2803EDFF00F858FE15FF00A1CBC35FF81517FF001747FC2C7F0AFF00D0E5E1AFFC0A8BFF008BAF8828A00FB7FF00E163F857FE872F0D7FE0545FFC5D1FF0B1FC2BFF00439786BFF02A2FFE2EBE20A2803EDFFF00858FE15FFA1CBC35FF0081517FF1747FC2C7F0AFFD0E5E1AFF00C0A8BFF8BAF8828A00FB7FFE163F857FE872F0D7FE0545FF00C5D1FF000B1FC2BFF439786BFF0002A2FF00E2EBE20A2803EDFF00F858FE15FF00A1CBC35FF81517FF001747FC2C7F0AFF00D0E5E1AFFC0A8BFF008BAF8828A00FB7FF00E163F857FE872F0D7FE0545FFC5D1FF0B1FC2BFF00439786BFF02A2FFE2EBE20A2803EDFFF00858FE15FFA1CBC35FF0081517FF1747FC2C7F0AFFD0E5E1AFF00C0A8BFF8BAF8828A00FB7FFE163F857FE872F0D7FE0545FF00C5D1FF000B1FC2BFF439786BFF0002A2FF00E2EBE20A2803EDFF00F858FE15FF00A1CBC35FF81517FF001747FC2C7F0AFF00D0E5E1AFFC0A8BFF008BAF8828A00FB7FF00E163F857FE872F0D7FE0545FFC5D1FF0B1FC2BFF00439786BFF02A2FFE2EBE20A2803EDFFF00858FE15FFA1CBC35FF0081517FF1747FC2C7F0AFFD0E5E1AFF00C0A8BFF8BAF8828A00FB7FFE163F857FE872F0D7FE0545FF00C5D1FF000B1FC2BFF439786BFF0002A2FF00E2EBE20A2803EDFF00F858FE15FF00A1CBC35FF81517FF001747FC2C7F0AFF00D0E5E1AFFC0A8BFF008BAF8828A00FB7FF00E163F857FE872F0D7FE0545FFC5D1FF0B1FC2BFF00439786BFF02A2FFE2EBE20A2803EDFFF00858FE15FFA1CBC35FF0081517FF1747FC2C7F0AFFD0E5E1AFF00C0A8BFF8BAF8828A00FB7FFE163F857FE872F0D7FE0545FF00C5D1FF000B1FC2BFF439786BFF0002A2FF00E2EBE20A2803EDFF00F858FE15FF00A1CBC35FF81517FF001747FC2C7F0AFF00D0E5E1AFFC0A8BFF008BAF8828A00FB7FF00E163F857FE872F0D7FE0545FFC5D1FF0B1FC2BFF00439786BFF02A2FFE2EBE20A2803EDFFF00858FE15FFA1CBC35FF0081517FF1747FC2C7F0AFFD0E5E1AFF00C0A8BFF8BAF8828A00FB7FFE163F857FE872F0D7FE0545FF00C5D1FF000B1FC2BFF439786BFF0002A2FF00E2EBE20A2803EDFF00F858FE15FF00A1CBC35FF81517FF001747FC2C7F0AFF00D0E5E1AFFC0A8BFF008BAF8828A00FB7FF00E163F857FE872F0D7FE0545FFC5D1FF0B1FC2BFF00439786BFF02A2FFE2EBE20A2803EDFFF00858FE15FFA1CBC35FF0081517FF1747FC2C7F0AFFD0E5E1AFF00C0A8BFF8BAF8828A00FB7FFE163F857FE872F0D7FE0545FF00C5D1FF000B1FC2BFF439786BFF0002A2FF00E2EBE20A2803EDFF00F858FE15FF00A1CBC35FF81517FF001747FC2C7F0AFF00D0E5E1AFFC0A8BFF008BAF8828A00FB7FF00E163F857FE872F0D7FE0545FFC5D1FF0B1FC2BFF00439786BFF02A2FFE2EBE20A2803EDFFF00858FE15FFA1CBC35FF0081517FF1747FC2C7F0AFFD0E5E1AFF00C0A8BFF8BAF8828A00FB7FFE163F857FE872F0D7FE0545FF00C5D1FF000B1FC2BFF439786BFF0002A2FF00E2EBE20A2803EDFF00F858FE15FF00A1CBC35FF81517FF001747FC2C7F0AFF00D0E5E1AFFC0A8BFF008BAF8828A00FB7FF00E163F857FE872F0D7FE0545FFC5D1FF0B1FC2BFF00439786BFF02A2FFE2EBE20A2803EC3F1A78FBC352D85D2DAF8B3C3F2C8D04D0C10C7731969A57B76004681B92C781C57C794514000FFD9, '19', '2018-01-21 19:51:38', '1', '1', '新建', 'processimage.jpg', '1');

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
  KEY `FKCB83DF7770828E36` (`dep_id`),
  CONSTRAINT `FKCB83DF7770828E36` FOREIGN KEY (`dep_id`) REFERENCES `tb_dep` (`dep_id`),
  CONSTRAINT `FKel9y0rycol03onpot4w6mugp8` FOREIGN KEY (`dep_id`) REFERENCES `tb_dep` (`dep_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_emp
-- ----------------------------
INSERT INTO `tb_emp` VALUES ('15', 'zhuheng', '001', '男', 'beijing', '18771882193', 'CEO', '/WEB/imgs/empzhgl.jpg', null, '1');
INSERT INTO `tb_emp` VALUES ('16', 'zhuheng002', '002', '男', 'beijing', '1111111', 'CFO', '/WEB/imgs/empyggl.jpg', null, '1');
INSERT INTO `tb_emp` VALUES ('17', 'zhuheng003', '003', '男', '000000000', '0000000', 'DBA', '/WEB/imgs/empwdgw.jpg', null, '1');
INSERT INTO `tb_emp` VALUES ('18', '11111111', '1111111', '1111111', '11111111', '11111111', '11111', '/WEB/imgs/empbase.gif', '2', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_gorup
-- ----------------------------
INSERT INTO `tb_gorup` VALUES ('5', '公共组', '000', '1');
INSERT INTO `tb_gorup` VALUES ('9', '测试组', '001', '1');

-- ----------------------------
-- Table structure for tb_impower
-- ----------------------------
DROP TABLE IF EXISTS `tb_impower`;
CREATE TABLE `tb_impower` (
  `im_id` int(11) NOT NULL AUTO_INCREMENT,
  `mainBody_id` int(11) DEFAULT NULL,
  `mainBody_type` varchar(255) DEFAULT NULL,
  `module_id` int(11) DEFAULT NULL,
  `saveOption` int(11) DEFAULT NULL,
  `queryOption` int(11) DEFAULT NULL,
  `updateOption` int(11) DEFAULT NULL,
  `deleteOption` int(11) DEFAULT NULL,
  `extOption` int(11) DEFAULT NULL,
  PRIMARY KEY (`im_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_impower
-- ----------------------------
INSERT INTO `tb_impower` VALUES ('7', '5', 'group', '7', '1', '1', '1', '1', '0');
INSERT INTO `tb_impower` VALUES ('8', '5', 'group', '8', '1', '1', '1', '1', '0');
INSERT INTO `tb_impower` VALUES ('9', '5', 'group', '9', '1', '1', '1', '1', '0');
INSERT INTO `tb_impower` VALUES ('10', '5', 'group', '10', '1', '1', '1', '1', '0');
INSERT INTO `tb_impower` VALUES ('11', '5', 'group', '12', '1', '1', '1', '1', '0');
INSERT INTO `tb_impower` VALUES ('12', '5', 'group', '11', '1', '1', '1', '1', '0');
INSERT INTO `tb_impower` VALUES ('13', '5', 'group', '13', '1', '1', '1', '1', '0');
INSERT INTO `tb_impower` VALUES ('14', '5', 'group', '14', '1', '1', '1', '1', '0');
INSERT INTO `tb_impower` VALUES ('15', '9', 'group', '7', '1', '1', '1', '1', '0');
INSERT INTO `tb_impower` VALUES ('16', '9', 'group', '12', '0', '0', '0', '0', '0');
INSERT INTO `tb_impower` VALUES ('17', '20', 'user', '13', '0', '0', '0', '0', '0');
INSERT INTO `tb_impower` VALUES ('18', '20', 'user', '8', '1', '1', '1', '1', '0');
INSERT INTO `tb_impower` VALUES ('19', '20', 'user', '14', '1', '1', '1', '1', '0');
INSERT INTO `tb_impower` VALUES ('20', '20', 'user', '12', '0', '0', '0', '0', '0');
INSERT INTO `tb_impower` VALUES ('21', '20', 'user', '11', '0', '0', '0', '0', '0');
INSERT INTO `tb_impower` VALUES ('22', '9', 'group', '11', '0', '0', '0', '0', '0');
INSERT INTO `tb_impower` VALUES ('23', '5', 'group', '15', '1', '1', '1', '1', '0');
INSERT INTO `tb_impower` VALUES ('24', '5', 'group', '16', '1', '1', '1', '1', '0');
INSERT INTO `tb_impower` VALUES ('25', '5', 'group', '18', '1', '1', '1', '1', '0');
INSERT INTO `tb_impower` VALUES ('26', '5', 'group', '19', '1', '1', '1', '1', '0');
INSERT INTO `tb_impower` VALUES ('27', '5', 'group', '17', '1', '1', '1', '1', '0');

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
  KEY `FKCB83FDB1F0ED9E5F` (`pid`),
  CONSTRAINT `FKCB83FDB1F0ED9E5F` FOREIGN KEY (`pid`) REFERENCES `tb_mod` (`m_id`),
  CONSTRAINT `FKa7v6cim5ugintpofxnd2j5ump` FOREIGN KEY (`pid`) REFERENCES `tb_mod` (`m_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

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
INSERT INTO `tb_mod` VALUES ('15', '发布流程', 'workFlow/workFlow_showwf.action', 'WEB/imgs/mod/fblc.jpg', 'WEB/imgs/mod/fblc.jpg', '041', '1', '10');
INSERT INTO `tb_mod` VALUES ('16', '查看流程', 'workFlow/workFlow_swf.action', 'WEB/imgs/mod/cklcdy.jpg', 'WEB/imgs/mod/cklcdy.jpg', '042', '1', '10');
INSERT INTO `tb_mod` VALUES ('17', '添加公文', 'doc/doc_addDoc.action', 'WEB/imgs/mod/tjgw.jpg', 'WEB/imgs/mod/tjgw.jpg', '031', '1', '9');
INSERT INTO `tb_mod` VALUES ('18', '我的公文', 'doc/doc_myDoc.action', 'WEB/imgs/mod/wdgw.jpg', 'WEB/imgs/mod/wdgw.jpg', '032', '1', '9');
INSERT INTO `tb_mod` VALUES ('19', '公文审批', '#', 'WEB/imgs/mod/gwsp.jpg', 'WEB/imgs/mod/gwsp.jpg', '033', '1', '9');

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
  `e_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`u_id`),
  UNIQUE KEY `UK_mrwea7a27xda3rdws81opvb47` (`emp`),
  KEY `FKiykge2nim99gomxw878qgvbu0` (`g_id`),
  KEY `FKA4FF6AFC7F52A829` (`g_id`),
  KEY `FKA4FF6AFC1A17C8B6` (`emp`),
  KEY `FKA4FF6AFC1A459B23` (`e_id`),
  CONSTRAINT `FKA4FF6AFC1A17C8B6` FOREIGN KEY (`emp`) REFERENCES `tb_emp` (`emp_id`),
  CONSTRAINT `FKA4FF6AFC1A459B23` FOREIGN KEY (`e_id`) REFERENCES `tb_emp` (`emp_id`),
  CONSTRAINT `FKA4FF6AFC7F52A829` FOREIGN KEY (`g_id`) REFERENCES `tb_gorup` (`g_id`),
  CONSTRAINT `FKiykge2nim99gomxw878qgvbu0` FOREIGN KEY (`g_id`) REFERENCES `tb_gorup` (`g_id`),
  CONSTRAINT `FKqy7jfc8vtkudr63dvwx1jilio` FOREIGN KEY (`emp`) REFERENCES `tb_emp` (`emp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES ('19', 'admin', 'admin', '1', '5', '15', null);
INSERT INTO `tb_user` VALUES ('20', 'admin001', 'admin', '1', '9', '16', null);
INSERT INTO `tb_user` VALUES ('21', 'admin003', 'admin', '1', '5', '17', null);
INSERT INTO `tb_user` VALUES ('24', '1111', '1111', '1', '5', '18', null);

-- ----------------------------
-- Table structure for tb_workflow
-- ----------------------------
DROP TABLE IF EXISTS `tb_workflow`;
CREATE TABLE `tb_workflow` (
  `wf_id` int(11) NOT NULL AUTO_INCREMENT,
  `wf_name` varchar(255) DEFAULT NULL,
  `processFile` mediumblob,
  `processImg` mediumblob,
  `flag` int(11) DEFAULT NULL,
  PRIMARY KEY (`wf_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_workflow
-- ----------------------------
INSERT INTO `tb_workflow` VALUES ('1', '请假', 0x3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554462D38223F3E0D0A0D0A3C70726F636573732D646566696E6974696F6E0D0A2020786D6C6E733D2275726E3A6A62706D2E6F72673A6A70646C2D332E322220206E616D653D22E8AFB7E58187223E0D0A2020203C73746172742D7374617465206E616D653D22E5BC80E5A78B223E0D0A2020202020203C7472616E736974696F6E206E616D653D22E78FADE995BFE5AEA1E689B92220746F3D22E78FADE995BFE5AEA1E689B9223E3C2F7472616E736974696F6E3E0D0A2020203C2F73746172742D73746174653E0D0A2020200D0A2020203C7461736B2D6E6F6465206E616D653D22E78FADE995BFE5AEA1E689B9223E0D0A20202020203C7461736B206E616D653D22E78FADE995BFE5AEA1E689B9223E0D0A202020202020203C61737369676E6D656E74206163746F722D69643D22627A223E3C2F61737369676E6D656E743E0D0A20202020203C2F7461736B3E0D0A2020202020203C7472616E736974696F6E206E616D653D22E78FADE4B8BBE4BBBBE5AEA1E689B92220746F3D22E78FADE4B8BBE4BBBBE5AEA1E689B9223E3C2F7472616E736974696F6E3E0D0A2020203C2F7461736B2D6E6F64653E0D0A2020200D0A2020203C7461736B2D6E6F6465206E616D653D22E78FADE4B8BBE4BBBBE5AEA1E689B9223E0D0A20202020203C7461736B206E616D653D22E78FADE4B8BBE4BBBBE5AEA1E689B9223E0D0A202020202020203C61737369676E6D656E74206163746F722D69643D22627A72223E3C2F61737369676E6D656E743E0D0A20202020203C2F7461736B3E0D0A2020202020203C7472616E736974696F6E206E616D653D22E7BB93E69D9FE6B581E7A88B2220746F3D22E7BB93E69D9FE6B581E7A88B223E3C2F7472616E736974696F6E3E0D0A2020203C2F7461736B2D6E6F64653E0D0A2020200D0A2020203C656E642D7374617465206E616D653D22E7BB93E69D9FE6B581E7A88B223E3C2F656E642D73746174653E0D0A3C2F70726F636573732D646566696E6974696F6E3E, 0xFFD8FFE000104A46494600010100000100010000FFDB004300080605080C141A1F0606070A0D1D1E1C0707080C141D231C07090B0F1A2C281F090B131C223734270C121C202934392E1920272C343D3C33242E303138323432FFDB00430109090C1832323232090B0D21323232320C0D1C323232323218213232323232323232323232323232323232323232323232323232323232323232323232323232FFC000110801C802B803012200021101031101FFC4001F0000010501010101010100000000000000000102030405060708090A0BFFC4001F0100030101010101010101010000000000000102030405060708090A0BFFC400B5100002010303020403050504040000017D01020300041105122131410613516107227114328191A1082342B1C11552D1F02433627282090A161718191A25262728292A3435363738393A434445464748494A535455565758595A636465666768696A737475767778797A838485868788898A92939495969798999AA2A3A4A5A6A7A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6D7D8D9DAE1E2E3E4E5E6E7E8E9EAF1F2F3F4F5F6F7F8F9FAFFC400B51100020102040403040705040400010277000102031104052131061241510761711322328108144291A1B1C109233352F0156272D10A162434E125F11718191A262728292A35363738393A434445464748494A535455565758595A636465666768696A737475767778797A82838485868788898A92939495969798999AA2A3A4A5A6A7A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6D7D8D9DAE2E3E4E5E6E7E8E9EAF2F3F4F5F6F7F8F9FAFFDA000C03010002110311003F00F43F05F807C352D85AB5D784FC3F2C8D04334F3496D1969A57B7524C8E5792C6B73FE15C7857FE84DF0D7FE02C5FFC451E04FF0090759FFD7B41FF00A4C95D050073FF00F0AE3C2BFF00426F86BFF0162FFE228FF8571E15FF00A137C35FF80B17FF00115D051401CFFF00C2B8F0AFFD09BE1AFF00C058BFF88A3FE15C7857FE84DF0D7FE02C5FFC45741450073FFF000AE3C2BFF426F86BFF000162FF00E228FF008571E15FFA137C35FF0080B17FF115D051401CFF00FC2B8F0AFF00D09BE1AFFC058BFF0088A3FE15C7857FE84DF0D7FE02C5FF00C45741450073FF00F0AE3C2BFF00426F86BFF0162FFE228FF8571E15FF00A137C35FF80B17FF00115D051401CFFF00C2B8F0AFFD09BE1AFF00C058BFF88A3FE15C7857FE84DF0D7FE02C5FFC45741450073FFF000AE3C2BFF426F86BFF000162FF00E228FF008571E15FFA137C35FF0080B17FF115D051401CFF00FC2B8F0AFF00D09BE1AFFC058BFF0088A3FE15C7857FE84DF0D7FE02C5FF00C45741450073FF00F0AE3C2BFF00426F86BFF0162FFE228FF8571E15FF00A137C35FF80B17FF00115D051401CFFF00C2B8F0AFFD09BE1AFF00C058BFF88A3FE15C7857FE84DF0D7FE02C5FFC45741450073FFF000AE3C2BFF426F86BFF000162FF00E228FF008571E15FFA137C35FF0080B17FF115D051401CFF00FC2B8F0AFF00D09BE1AFFC058BFF0088A3FE15C7857FE84DF0D7FE02C5FF00C45741450073FF00F0AE3C2BFF00426F86BFF0162FFE228FF8571E15FF00A137C35FF80B17FF00115D051401CFFF00C2B8F0AFFD09BE1AFF00C058BFF88A3FE15C7857FE84DF0D7FE02C5FFC45741450073FFF000AE3C2BFF426F86BFF000162FF00E228FF008571E15FFA137C35FF0080B17FF115D051401CFF00FC2B8F0AFF00D09BE1AFFC058BFF0088A3FE15C7857FE84DF0D7FE02C5FF00C45741450073FF00F0AE3C2BFF00426F86BFF0162FFE228FF8571E15FF00A137C35FF80B17FF00115D051401CFFF00C2B8F0AFFD09BE1AFF00C058BFF88A3FE15C7857FE84DF0D7FE02C5FFC45741450073FFF000AE3C2BFF426F86BFF000162FF00E228FF008571E15FFA137C35FF0080B17FF115D051401CFF00FC2B8F0AFF00D09BE1AFFC058BFF0088A3FE15C7857FE84DF0D7FE02C5FF00C45741450073FF00F0AE3C2BFF00426F86BFF0162FFE228FF8571E15FF00A137C35FF80B17FF00115D051401CFFF00C2B8F0AFFD09BE1AFF00C058BFF88A3FE15C7857FE84DF0D7FE02C5FFC45741450073FFF000AE3C2BFF426F86BFF000162FF00E228FF008571E15FFA137C35FF0080B17FF115D051401CFF00FC2B8F0AFF00D09BE1AFFC058BFF0088A3FE15C7857FE84DF0D7FE02C5FF00C45741450073FF00F0AE3C2BFF00426F86BFF0162FFE228FF8571E15FF00A137C35FF80B17FF00115D051401CFFF00C2B8F0AFFD09BE1AFF00C058BFF88A3FE15C7857FE84DF0D7FE02C5FFC45741450073FFF000AE3C2BFF426F86BFF000162FF00E228FF008571E15FFA137C35FF0080B17FF115D051401CFF00FC2B8F0AFF00D09BE1AFFC058BFF0088A3FE15C7857FE84DF0D7FE02C5FF00C45741450073FF00F0AE3C2BFF00426F86BFF0162FFE228FF8571E15FF00A137C35FF80B17FF00115D051401CFFF00C2B8F0AFFD09BE1AFF00C058BFF88A3FE15C7857FE84DF0D7FE02C5FFC45741450073FFF000AE3C2BFF426F86BFF000162FF00E228FF008571E15FFA137C35FF0080B17FF115D051401CFF00FC2B8F0AFF00D09BE1AFFC058BFF0088A3FE15C7857FE84DF0D7FE02C5FF00C45741450073FF00F0AE3C2BFF00426F86BFF0162FFE228FF8571E15FF00A137C35FF80B17FF00115D051401CFFF00C2B8F0AFFD09BE1AFF00C058BFF88A3FE15C7857FE84DF0D7FE02C5FFC45741450073FFF000AE3C2BFF426F86BFF000162FF00E228FF008571E15FFA137C35FF0080B17FF115D051401CFF00FC2B8F0AFF00D09BE1AFFC058BFF0088A3FE15C7857FE84DF0D7FE02C5FF00C45741450073FF00F0AE3C2BFF00426F86BFF0162FFE228FF8571E15FF00A137C35FF80B17FF00115D051401CFFF00C2B8F0AFFD09BE1AFF00C058BFF88A3FE15C7857FE84DF0D7FE02C5FFC45741450073FFF000AE3C2BFF426F86BFF000162FF00E228FF008571E15FFA137C35FF0080B17FF115D051401CFF00FC2B8F0AFF00D09BE1AFFC058BFF0088A3FE15C7857FE84DF0D7FE02C5FF00C45741450073FF00F0AE3C2BFF00426F86BFF0162FFE228FF8571E15FF00A137C35FF80B17FF00115D051401CFFF00C2B8F0AFFD09BE1AFF00C058BFF88A3FE15C7857FE84DF0D7FE02C5FFC457414500707E34F00F86A2B0BA6B5F09F87E291609A68268EDA30D0CA96EC418DC2F050F4AF8F2BEDFF001DFF00C83AF3FEBDA7FF00D267AF882803EDFF00027FC83ACFFEBDA0FF00D264AE82B9FF00027FC83ACFFEBDA0FF00D264AE82800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A28039FF001DFF00C83AF3FEBDA7FF00D267AF882BEDFF001DFF00C83AF3FEBDA7FF00D267AF882803EDFF00027FC83ACFFEBDA0FF00D264AE82B9FF00027FC83ACFFEBDA0FF00D264AE82800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800ACABF2E64E259946D560AAC47259BB03DF15AB59974B990FF00BABFFA13D0055DAFFF003F173FF7DB7F8D1B5FFE7E2E7FEFB6FF001AB1E5FB54179751408CD7048450647C7703B28F563409BEFEA26D7FF9F8B9FF00BEDBFC68DAFF00F3F173FF007DB7F8D73CFAF6ACD1F996F6F6296F9F28A306631918FF00592AB2E3767FBA7078F4CEB689ACA5E212B188DD4F953C40E76923828DC70C3D87A76ACA1513F85B22335D2FDD7996F6BFFCFC5CFF00DF6DFE346D7FF9F8B9FF00BEDBFC6B2B55F0E5C4CFB835B5DC780A74BBA2E12423D4A315C29F9BE6B791B3D180DBB493C3971E76F91ADAF63DC258E0B92E3EC1823E6B75DCC9BA0030310C6D8EAF9C96D4D09BFB76D77EDFB65FE73F67F3B12F97E76EC6DFB5E36E77FCB8DF9DDF2F5E2AD5BDCACA336F7772CA0B5B93BDF892090A91827F85D48FE5589A7C659D041637F1866377ACE9D711B18EC6E0EE62F69752A00596E8281B1CA1E5957F88613D93476C9E4F87A104A36A7F629ACA575B8D56762593EC91EDD9F66202AB3AB7CA708701B201DC5D5CAC28CD73777291A837133EF7F9238D724ED07B01E94DBCBE48066E2EAF0027CB8D10C8CD3390788A14C924282780700127806B96D47C365924FED2B6B9BC2AB6FE1FF35A3666B98576EF9EDE11BB2E8B33E0ED72A54F272456EEB16D6E8230F65791C2B992D2E6C95C9D36E634014476D0AB70D1B3F5529C6181C81401343AC5BC9B7CBBDBC0598D9C71B99032CEB196C4B13E083E5A93C8191823A8CD8BAB958519AE6EEE523506E267DEFF002471AE49DA0F603D2B9C96CE591A16BAD13ED128F3F53B590C4035DDD5B8558BEDD36DC29BA830C72130CAB8036EDACA7D2647597365BEDCA47697662B1991EFDAF2E9433C89317677D3E252C1B0C416C9EF900EF76BFF00CFC5CFFDF6DFE346D7FF009F8B9FFBEDBFC6B92B6D12E5A601E38627590BC52ADA366CB4CB79B2A96DA9798142CD0055DA8A4FCC772E779AD2B4F0C5C216262B08632AD10D12167313975C6D959FE5DB29E4EDB546CF5246EDC01B7B5FFE7E2E7FEFB6FF001A36BFFCFC5CFF00DF6DFE359FA3683716E499AE51508C4761097296633D2332BB7108E06C48971D57EE85D8F2FDA80208DA4574C4F390582302EC432E0F504D6E56332E193FDE1FFA09AD9A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A00E7FC77FF0020EBCFFAF69FFF00499EBE20AFB7FC77FF0020EBCFFAF69FFF00499EBE20A00FB7FC09FF0020EB3FFAF683FF004992BA0AE7FC09FF0020EB3FFAF683FF004992BA0A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A002A84CB990FFBABFF00A13D5FAA8573237FBA9FFA13D0033656378AF4B9EE6D645B407CCC09630072C62707083D580C0AE83651B2935FE44C977F43CCF49F172D8D8848D56E6E58BC7E5B0C88118F5B91FD33CD687C3CD3EE0248F7072AE56384E00F30445C931A8E304BE0638E38AEC27F0FE9D2B6EB9D2EC2593AF9CF1A93C7FB6476AB82303A0007400761ED59461DDAFE54630A6EEB9E6B4D22883651B2A7D946CAD8E820D94C95E38D499E448D00324B239C08914725D8F65156B6545750CE54FD8A6822938F2E4950B2AF23EF44ACBD47FB42803125F1A6808A4BF88B482003230495492147F046A4927D8024F6A97FE126D33CB89D6F91A29596CB4F95413E7DC4D9C290070720839030783835E66905FB2AB25E59346FAA79B693085B6DD4CC48F3207F3798C9046064FF00B7537C5ED32EDBECE65B7826982C82E2EE040BF698D7E6C476E5DDB1688AC4939519CE4670003D3EDF54B5964912DE7DD347B7EDB160FEE7ED0B95F988C1DCBE84FBD5BD95E39A4DC69B0CB0AE9D3BBC51DE7F66D804B987CC98CAE0195963B60C63B84C03FBEC1E17A018F6AD940106CA3654FB28D940106CA3654FB28D94014665C327FBE3FF00416AD5ACFBB5C18FFDF1FF00A0356850014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450073FE3BFF9075E7FD7B4FF00FA4CF5F1057DBFE3BFF9075E7FD7B4FF00FA4CF5F105007DBFE04FF90759FF00D7B41FFA4C95D0573FE04FF90759FF00D7B41FFA4C95D05001451450014514500145145001451450014514500145145001451450014514500154DAE21491BCF9A34F9576EE206EC33F4CFA55CA6B468DF7D15BD323A7D28020FED0B4FF009FCB6FFBEC7F8D1FDA169FF3F96DFF007D8FF1A97ECD17FCF18BF2147D9A2FF9E317E428022FED0B4FF9FCB6FF00BEC7F8D1FDA169FF003F96DFF7D8FF001A97ECD17FCF18BF2147D9A2FF009E317E428022FED0B4FF009FCB6FFBEC7F8D1FDA169FF3F96DFF007D8FF1A97ECD17FCF18BF2147D9A2FF9E317E428022FED0B4FF9FCB6FF00BEC7F8D4574FA64EA56F5F4F9E338F32094A95936907E646CFDD201E956BECD17FCF18BF2147D9A2FF009E317E428029347A432A075D31910ACB6511D98B4784706DD7B18C74C631DA9FBF4CDFBF7E9FE76DFB37DA72BBBC8DD9DBE675C6EE719C53ED208CA9DD121F99D4123A012B7F2153FD9A2FF9E317E428033FECBA2FFCF0D23EFF00F69F44FF008FEFF9E9FEF7BF5F7AB7FDA169FF003F96DFF7D8FF001A97ECD17FCF18BF2147D9A2FF009E317E428022FED0B4FF009FCB6FFBEC7F8D1FDA169FF3F96DFF007D8FF1A97ECD17FCF18BF2147D9A2FF9E317E428022FED0B4FF9FCB6FF00BEC7F8D1FDA169FF003F96DFF7D8FF001A97ECD17FCF18BF2147D9A2FF009E317E4280295D5D40E63F26E2173BC12AAC0E06C6EC2B46982DE21D218C1EA080383ED4FA0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A00E7FC77FF0020EBCFFAF69FFF00499EBE20AFB7FC77FF0020EBCFFAF69FFF00499EBE20A00FB7FC09FF0020EB3FFAF683FF004992BA0AE7FC09FF0020EB3FFAF683FF004992BA0A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A00AF65F74FFBCFFF00A35AAC563EA1AD2585B4B2CD6B733C71F9979710C1B77182295892824651FBB4C9FBC0F1C64E0565DDFC4078188B9F0C6AE180B726D95E13224BAB5DCD1A8957CD0B8F3225E44CDF78640C1C007594563CDE2548A48D6FADFECA8D0CBAD5D4D3BA8FECD4B168015B82A48F944C7244854638241C81BC413AC2643A16A520DCB15858C4079B7704CEAA1A682428172CC5886705539936B6E5500D8A2B974F19EA26465FF841B5BE152E36ACF67BD7CE671FBEB7FB4F0A7670771DC723036F34F53F8A305BF4D13570FF00659BC4AD0DC4322792D67046E239A53195CB2B90C43908C369CB102803B4A2B2EC3C4114F34D1B08A39237FB2C51971BAF225B5B772E91E071119D54F5C7193C815A940051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451401CFF8EFFE41D79FF5ED3FFE933D7C415F6FF8EFFE41D79FF5ED3FFE933D7C41401F6FF813FE41D67FF5ED07FE93257415CFF813FE41D67FF5ED07FE932574140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451401CDF897466BEB19E28AD22B879049656E92636C33CB2B05793776B4721F805863280B601F3FBCD0E20858E89ABDBA4AF6463B7D3A0BB560BA5EA4ECE5D6350C16CED65089BD622766618D156303D72CBEE9FF0079FF00F46B558A00F33F13F852D2E2681A3B1F195CC6F04B1C06DA79C3DA5DC4F68632CD7322AA346A8CFF00BC2BB9D72E1A4005681F0C3BC371011ABADFBC12E9F1DCDC5C5D496D769711E03C2F3BC8AA5988CA92655E40DC9876EF28A00F08B9F831ABCD24E91693A24598638E0B96F202472CAD38FDCC89A52FCD1F04EC113818CB9CAECEAFC6FA5DC5D4F3FD94F882E4AD8DEC10DB085C4505DDD436E152CE748D7CC374371DA64970C380A40C7A651401C1F839A586EEE11FC252E9C1C8BC4B858C84B6B1B3B2B348A2172A8149F9A5F95646119560BB81DC7BCA28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A00E7FC77FF20EBCFF00AF69FF00F499EBE20AFB7FC77FF20EBCFF00AF69FF00F499EBE20A00FB7FC09FF20EB3FF00AF683FF4992BA0AE7FC09FF20EB3FF00AF683FF4992BA0A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A2AADE47D0B3CA141DB30562308FDC9523EE1C77C019A007597DD3FEF3FFE8D6AB15456D10381034EA07FA44C37B60EE2700A93FC6D93F873D6AF5001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450073FE3BFF9075E7FD7B4FF00FA4CF5F1057DBFE3BFF9075E7FD7B4FF00FA4CF5F105007DBFE04FF90759FF00D7B41FFA4C95D0573FE04FF90759FF00D7B41FFA4C95D050014514500145145001451450014514500145145001451450014514500145145001552F2F9A220242AE4E5B96C6D098F63D7356EB3B511975FA37F34A006FF6BCDFF3E917FDF67FF89A3FB5E6FF009F48BFEFB3FF00C4D45E5D4171750438FB4CC91EE22DE007ACD3303858D7B9600F1D6802E7F6BCDFF3E917FDF67FF89A3FB5E6FF009F48BFEFB3FF00C4D62EADE24B4B303ED2B72D23110DAD9A21DF77239E9046D8CE3EB81F956A2A923952BDCA9FE13EF8F4FAD3B75B7945F72535D1FAF9137F6BCDFF003E917FDF67FF0089A3FB5E6FF9F48BFEFB3FFC4D73B26B93F9DB254B6B24DC228E7B90E7EDE491F2DB36D54DD3839189A46C754CE42B2DB579AE24D976B0D8A9DD0ADAC9E6096FD769CFD96622300DB8192636987A30E09451D2FF006BCDFF003E917FDF67FF0089A46D56523E6B2848FBACA5FEF03EA3677AE534EB58A149256B9BF6C4925BD95BCD73332A181CC614A966C9B895491FBB6605B0A0903296DE24BC71208224B99D4A436CC6178BCD9E704945B6B97196B5847998F31770207CBD6803A7B6BE9A31CC0AE73B9A467397C0C0DDF2F65007BF5A9BFB5E6FF9F48BFEFB3FFC4D71B3789DC984A9797974916159143DE99C448350575CA24CED212194E1970A58AFCDB1ACB4E9060CF8918C5A74D711654C7F6B9D10B5B0C9C150C4AF270719CD006D7F6BCDFF003E917FDF67FF0089A3FB5E6FF9F48BFEFB3FFC4D71B69AEDC641B8779248D174DBA8C1C2EA1A9DE5E98B736070B14D0B73B09DADC282306EB6AF7D149E54ED672DC36CFB25CA232A47F68598FEFA12EC7F72B031E1C6E242FCBCB50074BFDAF37FCFA45FF7D9FF00E268FED79BFE7D22FF00BECFFF00135C5B6BF7B1CAEB70DFBFCFD8E368629648E2B7B486262E2CE2E775C34E01F982818058951BE73E26BB5553E55B3C84157D31A39964648E57025112248C1260A300C3C6705C9C0201D6FF006BCDFF003E917FDF67FF0089A3FB5E6FF9F48BFEFB3FFC4D73571AFDCC72010C10DC93B7CED3E30DE6E945D47174F1091732E4E37342BC7DE232C3A0F2E80246D6A45FBF691E3214E1FA6E3D86DED5A958372985FC57FF004315BD400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451401CFF008EFF00E41D79FF005ED3FF00E933D7C415F6FF008EFF00E41D79FF005ED3FF00E933D7C41401F6FF00813FE41D67FF005ED07FE93257415CFF00813FE41D67FF005ED07FE93257414005145140051451400514514005145140051451400514514005145140051451400551BC1975FF0075BFF424ABD552E17322FF00BAFF00FA1250043B3DAB23C47A4DB5D4612F9014249DDC6617485C868D891828C33D47BF15BFE5FB557BAB012E3F7D2C641F351D31907691C8607A827B534DFD96FBA1497F325D99C3E93A42DAB19359BD5D46E33F645B8B9287CBB255520405E5501A446E4E5F9E071D7A8D2F20604DE626D4B9849C65126DDC165241DB8EC48F4E29AFA2DD82DB584AA4F9A9234CC8C7F76A3E711201C15AB76163708C4DCAC4A36A411AAB963888B72EEEA3AEEF7F7AAAB2BEB2DF6F97622946DA4579FCC9F67B51B3DAAC797ED4797ED5068660D1AD444231062150B04318273124206DF2E4CE731100839C83C839AAE9E17B0552AB1DC905BED8D319A42E27081729745F703E58DBC30E38E84D71BE35F136A96F732C76F73AEA43F6737D02DA4711F267E46F79769611AE0E4EE0C0FDDC0C53FC0DE26BC9A461A8EADAD4F1C71433C30FD9F3E734D6659BED52AC3BB861F27CE0BF62F9E403B21E1BB00AEA2D7E574FB05D0DCD99E0CB9F9DF39CBB48E49CEE24E4926ADCD6314854CB1EE643F68B7393FBB90C6CB9C0FF006188E6BCCEC3C65752C92C2D79ABC0B25C4E5350F2A56786C22DBFBAD2E10AC4385E4E5408C738C918E97C43E204B78E17B6D535AB3B6DFF00D9134460024BB9648B2A649F510B8116D3962181EE7824006F8D02C40709688AB237DB6E82646FB9C2FCC841E18150723073F30E79A67FC23965B36F953633F68F3BCC7F33CEDB8DDF6CDDBB3B3E5CEFCEDF97EEF15E77A7F8C5A42C969E22F105BCCF71FD9D692CAF6930F325751B9A001485619FB84C63F849E95178EFC4BA8C73CC2C3C45945840D967BF16728D4146D99924215D1782C42E47CBB4122803D18785B4E08AB05B3C08A59E016EEE86113BE582491329DAEFCE33B781C7031A315B471802089234004714683023451C0451D94572BE04D4F52B87BA17B6F3792B712A4334F2E5ADDF70FDD24237002DD7B87DBCE141E48ED3CBF6A00AFB3DA8D9ED563CBF6A3CBF6A00A178B85E9DD7FF00460AD8ACCD41309F8AFF00E8C15A7400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451401CFF8EFFE41D79FF5ED3FFE933D7C415F6FF8EFFE41D79FF5ED3FFE933D7C41401F6FF813FE41D67FF5ED07FE93257415CFF813FE41D67FF5ED07FE93257414005145140051451400514514005145140051451400514514005145140051451400556906645FF75FFF00424AB3505C5AB39062B878986503000E55F1D430F5028025D946CAABF63B9FFA09CBFF007C2FF851F63B9FFA09CBFF007C2FF85005AD946CAABF63B9FF00A09CBFF7C2FF00851F63B9FF00A09CBFF7C2FF0085005AD946CAABF63B9FFA09CBFF007C2FF851F63B9FFA09CBFF007C2FF8500735E24F8676FA8CBBE7BCC315166FE64618DADAAE722C39500C819B9749482414DB8153787BC13756133BAEA762F1BAC76D35A240C3CA8AC602AA2DE5699B1818CE4367DAB7FEC773FF0041397FEF85FF000A3EC773FF0041397FEF85FF000A00E5E1F8640B4DF6CD72E9E09256D6EDADA14453A7DECA4E1E3BA219B743F2E08641C72082456BB785CDCC48BE25B98EF9D196EEDEE600F1159A24C063E5C87E60493C151E8062AEC70DCB161FDA328C1F2F3B57E6CA03E9EF527D8EE7FE8272FF00DF0BFE1401CEE95F0CB4F8198DDCD75767CF3AED90792402D2524637C7E610CD1E3EF1193DEAB7883E1B5C6A324AD75AD411EF88693024701FF47823BC590190994E4FCB83C28EF81D2BABFB1DCFFD04E5FF00BE17FC28FB1DCFFD04E5FF00BE17FC28039AF0AFC3CB8D32691BFE124BDBB85F73FD8A50789E5753BE6937905B6AE09D809F6E95D7ECAABF63B9FF00A09CBFF7C2FF00851F63B9FF00A09CBFF7C2FF0085005AD946CAABF63B9FFA09CBFF007C2FF851F63B9FFA09CBFF007C2FF850037534C467EABFFA316AF551934E99C625D42465E18A955E4A9CF240F5157A800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A28039FF001DFF00C83AF3FEBDA7FF00D267AF882BEDFF001DFF00C83AF3FEBDA7FF00D267AF882803EDFF00027FC83ACFFEBDA0FF00D264AE82B9FF00027FC83ACFFEBDA0FF00D264AE82800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2802BC1C3383C1C8980F5468C0FD594D58AAE9FEB1BFDD4FF00D09EA492E6242A269A24663E4DBA3100CF284271103D484563C7604F6A00928A2A3B7B98A550D6B3452C6C04D04D19056689C6418DC750C3A500494546B731162AB34464004D2C208DD1C529600BA7A485580F5C1C74A92800A2A386E629066DE68A45CB42CE8410B2C2E41048EF1B820FA1E0D47FDA569BB6FDB6DB7EEFB1795BC67ED3E4EFDBB33F7BC9F9B1D76F3D2802C5151DBDCC52A86B59A296360268268C82B344E320C6E3A861D2A4A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A00E7FC77FF20EBCFF00AF69FF00F499EBE20AFB7FC77FF20EBCFF00AF69FF00F499EBE20A00FB7FC09FF20EB3FF00AF683FF4992BA0AE7FC09FF20EB3FF00AF683FF4992BA0A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A00AE9FEB1BFDD4FFD09EBC6FC3FA52ABC696FA7F85A602F2F2CEFE086DCC62FA7FB3EA4162BF93F7802C318381FBC608EA0A800197D91B8906DE32A77FF00B5E5B2E3FEF9DC6B3DBC1FA61CF9705CC3955B28FC89A54FB05B43B70BA6F96E3CB57D8BB847B03606FCE28038BF0A684ABA65A93E1ABE0C5239D60D0AECC4D7AB3DAC799752224B605A42A0105A423B31C9C47E08D0ADE52A6E7C39E2E4297375756D7D35F131D94F15EDC0FDE5BADE312C149463E530724EE2CA4B1EC21F00E971C6A96D26B70C29C5B4515F5C8F290AA8DA1966076A2A8C0CED5E76819392C7C03A5DB106CE4D6D30C6F0466FAE4ABCEF21626581A620F9B2124E5486C9DD9C9A00F3BF12E9FACDC45A935F5958C8C81E29AE21BEB88FEC900D2616F2D2D638C8916D4BB11BD91598B1D89B88AD0F19DADBD95BDB9D4FC25E0DB72257D26CED98249058DA5D40EECD14570D6681A69A203961819DA496C1EE352F0469577BFED915F6D90997508E1B99916F9A48110FDA638645041863518208EBC7273A1A6E9105A295B592F9D49F349B99E49183103EECB3BB1C6074CE3DB93401E21E0AD474DBBB9B749B43F06B334F2B2CD696D6C92DA0B0699D1A096D2F246011A241CC1B19782EF90CFB7A746F6F7259E3B9D3625BF5799B54B9695ADE083C35217FB5666751988E43F9EC791BC61029F58B2D3ADEDD48B38BCB42CF78CB92733DD4CCCC72C4FDF9189F41D060565DBF81B478F6E6CA59CACA35E8DEEA59246FED28E0D81DA49DD8931440019240C0200201A00CFF0086ACDFD9F6E25D4A2B971142AF1A00069CAD671154280939111563B98924E4614AA8EB2B2F41F0BE9DA6214D1ADE58A3244ACAF23B92C91228C492B31C47122A819C003815A9400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451401CFF008EFF00E41D79FF005ED3FF00E933D7C415F6FF008EFF00E41D79FF005ED3FF00E933D7C41401F6FF00813FE41D67FF005ED07FE93257415CFF00813FE41D67FF005ED07FE932574140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051452312070A5BB851FC58F4CFAD0040FFEB17FDD7FFD092AC5505B991D95A3B2B829B480729F3090A9181BBD055B82712282A8CA0F40D8E80F6209EBF5A00928A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A00E7FC77FF0020EBCFFAF69FFF00499EBE20AFB7FC77FF0020EBCFFAF69FFF00499EBE20A00FB7FC09FF0020EB3FFAF683FF004992BA0AE7FC09FF0020EB3FFAF683FF004992BA0A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028AE6E0B488A8CC31938049C0E491DEA4FB1C3FF003C22FC85007414573FF6387FE7845F90A3EC70FF00CF08BF21401D0515CFFD8E1FF9E117E42A28059CB9FB335ACBB49B79BCBC1F2664EAB263A15F4EB401D2D15C45DEB56B1AAB5A69925F40C5628EF2D4C255A59A5DA14169179F3081D303B9EB8B42F2C9427DBE3B7B291C98EDED2E1A30D2B86C6230AC412723A13D477A00DF9F7A6562DC03E440E3FE58CAE4EECB7B03B873EA3D2AEAA803E45007DD551FC207A0F6AE6F167BF6EEB5F371F68FB3F1BBC9CE37797D71BB8CE315159DC59CE018A3886EDCD6E8C066E21864C6F840EAAF90411C1041EF401D5515C925ED8B4C635894CA17ED2485F9480464071FC51064241C1C3023AD360D4F4C7489A492D20F342CD630CC5434FE6AA901109E48DC3A66803AFA2B92BEBDD3EDC379BF676902FDA859A6DDF3A16C0F2612464CB26147A9E3AD3DAEF4C56657BAD3D6441F68BA84B2E6DA1001DD326780011C9C0A00EAA8AE5E4974F44DF2CD649060482E98A8529263044A78C3E4639E6AC7D8E1FF009E117E42803A0A2B9FFB1C3FF3C22FC855CD1D154BEC50064600EDF20ED401A94514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450073FE3BFF9075E7FD7B4FF00FA4CF5F1057DBFE3BFF9075E7FD7B4FF00FA4CF5F105007DBFE04FF90759FF00D7B41FFA4C95D0573FE04FF90759FF00D7B41FFA4C95D050014514500145145001451450014514500145145001451450014514500145145001451450062DAA7C8BC761FF00A08A9BCBF6A2CD3E45FF00747FE822A7F2E80383BEF19DCDA49226A56974F2927FE11F168148D450C84059030243230E7D7A803BDFD0FED5165F5CD4A39E490E1A3864CC5A4940308918E3201193939FA726ECBC11E6C730224FDD068DF08CF767E6497EEFCF1B11D33838CF6A662E5448675B80BE5BA82EC48DD8EC0CEFDBFD81F5EC756F4FDD452764E6F7BF9797998462EFFBC937FC8BB7F997B55D121BB4DB70CEAB91265429C95FEFC522B291ECC8C01E46080450B8F07A4F1AA5FDCA32A1DB6663863C2DB850009ADA55742CA07511A63A2850483D27974C959514970E40064608A492147F046A0927D8024F6AC8DCC5934EBC7783ED4D0BEC2F7D717512ED0D2794CAAAB033B1F9D64273B8FDDF718CAD7B48D4E7775852F16293658C935B08369D319807FB63CC0BEE40D2E3682A3231CEEA9E4F89BA1831EC935092270F24778B049B112D172C49650484C1CED56C7F16056A47E2CD21915A4D4E0B78DB9B57BBCC7F6A50AA7302CE17230C39008F7A00C4B9D37545919AC34EC4C0C97ACCCCA62D4996DDD63F251DCB2BAA940C408811BB248DB5A1A0F87DEC8BAEF9A78B11AD9DE4A5772C314657CA2100E2DB6EE07001DC7BE4986D7E25F87A45065D560B762FF6068256198E507AB18CB0DAC39DC18A7AB55ED57C5DA6594D1C7A8DD244F20691646650B6A912F5BA66618129C81C1C9E28031755F0C5F4EAE61892392495E2B852C330E9B716BE5655C7518549B692B9C63EF006AD5FE937921B84166EE271F678B51DCBB6C2D1ADD5712A96DD989FCC60021524FDE19622F47E35D1DA16956EE716AB8F32EDA1902B6F7DBFB92C83387E0E338EF8A3FE12EB6DFB7FB33C41B36F9BF6AFB1CDB77EEFBBB766738E7EE6DF7CF140198FA2DE39093E988CBF68FED797546653B55272E8608FA92B0AAC473B4A8236EE515168DE1CD45760BCB8BF568834C924FE498EE351923652F1470A876572EEC77C88C78CE49245FB8F88BA1469132EA29224AC2DEDF04031233B0DF3C7215212375209C53F42F1CD86A0EAB6505EA33447568CCAAA02C11DC14C31563C971F4C77ED4005A785DE02ED697708B97F9A595A1509E633E4936F0EC273CE37C8ECBD9B96DD6346F0DDBD9022D5DD813BDB2A8A0607F0C30222E7DF66E3C0248000DAF2E8F2E8020F2FDA9FA60C349F55FF00D00549E5D374F18793EABFFA2C5005FA28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A28039FF001DFF00C83AF3FEBDA7FF00D267AF882BEDFF001DFF00C83AF3FEBDA7FF00D267AF882803EDFF00027FC83ACFFEBDA0FF00D264AE82B9FF00027FC83ACFFEBDA0FF00D264AE82800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A280295927EED38FE15FFD0454FB3DAAA5AEA50222894CAAC008DD4A37CACAA3AF1D8D4BFDAF6BFDF93FEF86FF00E26801F2DAC720C4F1248A7EF238C86C1EEA7D0D57FEC2D3FF00E81965FF007ED7FC2A5FED7B5FEFC9FF007C37FF001347F6BDAFF7E4FF00BE1BFF0089A009B67B5437689B1BCE13ECDA7CCF2B76ED9B4E7C9F2F9CE3A6DF9BD39A3FB5ED7FBF27FDF0DFFC4D1FDAF6BFDF93FEF86FFE26803E7AB6D3EE23451777935BF9715CADCC6F70856CDEE6D9F6A25BB2E11AEDF2A53734A704ED4C035EA9A06B36D0D8C1E578BF4889CAA217BE2845B98EDD331C491BC5CC04AF566619F9B3918EC7FB5ED7FBF27FDF0DFF00C4D1FDAF6BFDF93FEF86FF00E26803CDFC19AFC7135C79FE2BF0D4086EA5B89525001BE8D8AE5ACDCCE30B28E9F2BE3D4D4DA8430DB6ACC6F7C5375641EDBCF5B995E10222D75811DBF9D190142AE718DD9C924F35E85FDAF6BFDF93FEF86FFE268FED7B5FEFC9FF007C37FF0013401E6FE042D269C534BD7DE4BCF2A75B6D211E206CA6695F6B2614302588E4C9819FA639FF00EC6F10FDA76F97AA7DBFEC99DDE69DDBFCDC67ED1F6CE9E67FB5B7BF935ED1FDAF6BFDF93FEF86FF00E268FED7B5FEFC9FF7C37FF13401E75E27176134F8EFB55823B9F36D4DD5B70D3C772158193CD666042BE47313027A93D2B8BF046A1A6C7756BFDA9A75ECA4A7D8EC59C6546A135FBED7815DB1B62524703860481BB9AF79FED7B5FEFC9FF7C37FF1347F6BDAFF007E4FFBE1BFF89A009B67B51B3DAA1FED7B5FEFC9FF007C37FF001347F6BDAFF7E4FF00BE1BFF0089A009B67B5416630F27D57FF458A5FED7B5FEFC9FF7C37FF134DB0955DE431EEDA4A9524119010763EE2802F514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451401CFF008EFF00E41D79FF005ED3FF00E933D7C415F6FF008EFF00E41D79FF005ED3FF00E933D7C41401F6FF00813FE41D67FF005ED07FE93257415CFF00813FE41D67FF005ED07FE9325741400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514015EFFF00D5BFFBADFF00A09AB14D923560438CA91B187AA91EBEE2A3B4919914B9C92A1D8FAB151DBDE8026A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A28039FF001DFF00C83AF3FEBDA7FF00D267AF882BEDFF001DFF00C83AF3FEBDA7FF00D267AF882803EDFF00027FC83ACFFEBDA0FF00D264AE82B9FF00027FC83ACFFEBDA0FF00D264AE82800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800AAF61FEAD3FDD5FFD04558ACFFED0B7B68775ECBB1140B676009324AADB408235049334980A002CC480064E2803428AE3E5F8996D11805DE97A909A46FB16A315BC3348BA6DCA5AC8CCB05DC1132C8D6D2C650846C8E49C6D602BF89FE2DD9E981BCED2EE59BCBFED2B349A6B788DEC6D19231693CCB20F98153FE8E5B2080A4F0403B8A2B8FD3FE25C57892B68FA35CDCF94BF6BB848A7B690C881BEEC09673CC77C9186280AAAB1182CBD6A4BFF001F5C413F967C25ABC8A0177B912DB004C93AA47B55EE0605F3960BB8A39230AAD86DA01D6515C1EB3F16A3B499A31A544254825D76EA0B8BA84386B4B55711C36F0B4A77386E7704180590B815A9E15F1BFF0068C92A63447F2D62B9FB4E9B77E7249F6B6946D793CA8F0D1F959C60F04500751451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450073FE3BFF009075E7FD7B4FFF00A4CF5F1057DBFE3BFF009075E7FD7B4FFF00A4CF5F105007DBFE04FF0090759FFD7B41FF00A4C95D0573FE04FF0090759FFD7B41FF00A4C95D05001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450015CDF892D166B2955FCA00968C33DA1B81131B9E08D3101DC633C8E0807E6604022BA4AAF65F74FF00BCFF00FA35A803C6F57D1B50B75511587882378A05BBD26D5A3BE7F33518C4E9E5DAB6997852311C0A8A32CEFB5B323336E27A0F1D787AF664B85F0BDD78823985AFF65EA4AD1EE8EFED2D6294AA452DC44CD24977E6B2E526F9793236E0AAFE99450079BDCE99A95BC377F6D8F52D6B55F255A16B88F6C57D169AEEC8DA64F650AED71248CC137F9C1C615B68594F3FA9F82D1553CCF0BFDAAC8AA5AC72C962AD709A3DA4DA6C43ED724716F0F2DB7DA5C00448AA7A2B2ED4F68A2803CBF50B1D52EE78EE3563ADD844F68E91D8D9ACEDFD98F21B3212FA2B7557DE6E9E42DE5BC6CC88A090038373E1AC572AD27F6ADEF88269F328B75BB86F9163B35BB6DA775F4AE84CB17965400245190C58EE35E8945001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450073FE3BFF9075E7FD7B4FF00FA4CF5F1057DBFE3BFF9075E7FD7B4FF00FA4CF5F105007DBFE04FF90759FF00D7B41FFA4C95D0573FE04FF90759FF00D7B41FFA4C95D050014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500155EDBEF3FF00BC3FF452558AAF6DF79FFDE1FF00A292802C51451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451401CFF8EFFE41D79FF5ED3FFE933D7C415F6FF8EFFE41D79FF5ED3FFE933D7C41401F6FF813FE41D67FF5ED07FE93257415CFF813FE41D67FF5ED07FE932574140051451400514514005145140051451400514514005145140051451400514514005145140051515C5C2C4B975661C2ED5EA4B301C671DCD55FED94FF009F4B9FFC77FF008AA00BF4550FED94FF009F4B9FFC77FF008AA3FB653FE7D2E7FF001DFF00E2A802FD1543FB653FE7D2E7FF001DFF00E2A8FED94FF9F4B9FF00C77FF8AA00BF4550FED94FF9F4B9FF00C77FF8AA3FB653FE7D2E7FF1DFFE2A802C5D8936FEE1DD48F9C84009740790A083C91D3DEAB3C0EA336F7D39672361C261D8A8E7EEFF000A0CF519A5FED94FF9F4B9FF00C77FF8AAAD1DF05624DBDC14E5E04F97F76F275DDF37AF4FA91D2803628AA1FDB29FF3E973FF008EFF00F1547F6CA7FCFA5CFF00E3BFFC55005FA2A87F6CA7FCFA5CFF00E3BFFC551FDB29FF003E973FF8EFFF00154017E8AA1FDB29FF003E973FF8EFFF001547F6CA7FCFA5CFFE3BFF00C55005FA2A87F6CA7FCFA5CFFE3BFF00C551FDB29FF3E973FF008EFF00F154017E8A8EDEE16450630C01F9941EC3DEA4A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A00E7FC77FF20EBCFF00AF69FF00F499EBE20AFB7FC77FF20EBCFF00AF69FF00F499EBE20A00FB7FC09FF20EB3FF00AF683FF4992BA0AE7FC09FF20EB3FF00AF683FF4992BA0A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A00A9A90F93F15FF00D1AB547655FD447C9FF024FF00D1AB55F650041B28D953ECAE47C71AB496BB3CB9A44055DCAAB32EF747880DC5083F2863DEA672B6E8DB0F49C9A50EBA23A7D955EFAED2DD19A6572AA37B05F4F7270001DC92140E588009AF3BD17C593CD2A0FB44C3E68D71E6C877079D010C8EE47CCA4F6AF53D9534E77D91B6330D28BB546BB9CD8F14A088CB35AA0B7244768C92C64C87241FB44A18228561C1F3C83D386214C5A86B571E54670F6A25758ADE7B5FDEB47686267C889518169510AF01D573B833015D2476102333456D0A48D8FB4CCAA01B8F2C6079AE3AEC1D33D3B567DD785E17656B3B89AC5817B9636CB1E27B8B8001799248D86EDA319C06C1233826B438CA03519A048FC8FB7EA0F2B9B580DDA88DA122173FBC4F2930AA63E7E42D8395DDC02F83C412CDC5969DE6CAB96D420DE00816299D0FD9E461F319648DF6E4202065CA700EA45A38050DCDE5CDCBA0658DE5DBF3BCC47CCE88AA374480A8200E0907393549BC1D06D020BFD4A03B059DCCF0B80F7BB0B10D34C173B9657662415DC49DFB871401561BBD425B457B45796770B78889B03416D752024425C852D6B036013C1232C39C5529B50D4113FE2597DF6C2648AD625BB1B258E46972EB2C0B08C0F236B7FABDC14B3E480B5D25D6890C8A82177B5D844963240147D8CAA15FDD46CA463CB62B82A460F183822BAF86231B49BDBC69564FED492E8ECCDDCC212989942630613B7E5553DF39C9A00CB93C610AC850BE959CBC1129B95DD14B6D1B926FE1553B530879DCC471B941C819F0F8E8C112FF006A9B05B848D67D6219A6092191A20D8B4B52809764209184504ED0C7071B9FF0855BE0ABDFDFB45E53E8B6D6E7662C6CEE42E440C10125151402CCE7D7356E3F0F057DCBA95F804ACF79102A05FDC448A034ECA8082CA8B90ACA87182B824100A4FE20114C23BDB6457639B530C8ADBE0248064B7255B24839C46EAA392D80482CFC401E5F2AEED923B8037C8B0C8AEA8300F2010C015239685173C0272B9DA82C208B3F66B6862DC4DC4FE5A81E74CFD5A4C752DEBD68B6B082150B676D0C118FF570C4A004DC73F2A2FA93400DD946CA9F651B28026D2BFD527D2AE553D2BFD527D2AE500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450073FE3BFF9075E7FD7B4FF00FA4CF5F1057DBFE3BFF9075E7FD7B4FF00FA4CF5F105007DBFE04FF90759FF00D7B41FFA4C95D0573FE04FF90759FF00D7B41FFA4C95D050014514500145145001451450014514500145145001451450014514500145145001451450056BF1F2FF00C093FF0046AD2797ED4EBD1F28FF00793FF46AD4BB28020F2FDAB03C49E103A814DB750C5B4344C9221612ACCC87A23A1CA941DEBA6D946CA4D774694AA34EF4A567D1F6382B1F85E61756FB7D900AC970C2385C17104AAD85779D80DC547F09E2BB6F2FDAA7D946CA518A5F0A2EBD79CBF8F36FA220F2FDAB8BF1B78BAEAC1E25B58A689372DC4F76CA365EE588102DC38C29988CB3165D8A32371E2BBBD95CB789BC18DA84B19363A5C8A9F37DA2EDE5610E32711E991B229DEC1724C9C8E08381546061689E3ABA9AEE649EFBC3CD0EE861B28C5D0C2F9C9F37F67482205CB375076E0F00D51D53C6DAEEE51A74A8C05D0F0F5C4A96C805C5C213944125D3121F8ED1FF00BEB5B3E1FF0007F88EDE480EA7AB79A89E67F6ABFDAE67FED5F394ECFF004591401F672477E7AF5AA3AFFC28BAD4A40F751E8F627CC533DBD9FF00CB4B37C991E6BB3102D24AF8C654281EA49A007DC78C2F8DB4B21D4E0B49229869ADE65B30549E161B96FBCA7B8F9640D8054A1CF19E4551B8F1D6AD149BE4BC93FB3B6A46B7C74E9446EF70DFEB143480ED8D4804F9BCE46C8DBEF56E5DF82B577B2920B46D1ECA52404BAB3F917568F7618DFDBA45F29962032159B278C85E0F2F77F04F5959524D1EFF0047866046A132FCC12D2FFCD271630846F9211B40C9C9C7200E2802FF008C7C57ADDA5C471C3A9410028F207458144F32C036977B995F0A670472B19C642973CD5BF08F88EFE7B855BFD6A09E330FEF21796D4B49AB2B027EC896A49DA230C4647D7B54D7FF000DF5096E209E6B882FAE153C8D5A0B899913CF5B70A0E98F1C44AED94B3F404372B83D2F7847C23A9E9F2486EA1B56492492F19D6EE66FB34736300DB49180CCACA32C48623F2201D5F97ED4797ED53ECA3650041E5FB51E5FB54FB28D94015B4AFF00549F4AB954F4AFF549F4AB94005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451401CFF8EFFE41D79FF5ED3FFE933D7C415F6FF8EFFE41D79FF5ED3FFE933D7C41401F6FF813FE41D67FF5ED07FE93257415CFF813FE41D67FF5ED07FE932574140051451400514514005145140051451400514514005145140051451400514514005145140115CC2CEB88D955B22442471BA3607E603D71506DBFFF009E963FF7CB7FF155728A00A7B6FF00FE7A58FF00DF2DFF00C551B6FF00FE7A58FF00DF2DFF00C555CA28029EDBFF00F9E963FF007CB7FF001546DBFF00F9E963FF007CB7FF00155728A00A7B6FFF00E7A58FFDF2DFFC551B6FFF00E7A58FFDF2DFFC555CA28029EDBFFF009E963FF7CB7FF1546DBFFF009E963FF7CB7FF155728A00A7B6FF00FE7A58FF00DF2DFF00C551B6FF00FE7A58FF00DF2DFF00C555CA28029EDBFF00F9E963FF007CB7FF001546DBFF00F9E963FF007CB7FF00155728A00A7B6FFF00E7A58FFDF2DFFC551B6FFF00E7A58FFDF2DFFC555CA28029EDBFFF009E963FF7CB7FF1546DBFFF009E963FF7CB7FF155728A0082CEDCC480330240DA48EFF4A9E8A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A28039FF001DFF00C83AF3FEBDA7FF00D267AF882BEDFF001DFF00C83AF3FEBDA7FF00D267AF882803EDFF00027FC83ACFFEBDA0FF00D264AE82B9FF00027FC83ACFFEBDA0FF00D264AE82800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A28039FF001DFF00C83AF3FEBDA7FF00D267AF882BEDFF001DFF00C83AF3FEBDA7FF00D267AF882803EDFF00027FC83ACFFEBDA0FF00D264AE82B9FF00027FC83ACFFEBDA0FF00D264AE82800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A28039FF001DFF00C83AF3FEBDA7FF00D267AF882BEDFF001DFF00C83AF3FEBDA7FF00D267AF882803EDFF00027FC83ACFFEBDA0FF00D264AE82B9FF00027FC83ACFFEBDA0FF00D264AE82800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A28039FF001DFF00C83AF3FEBDA7FF00D267AF882BEDFF001DFF00C83AF3FEBDA7FF00D267AF882803EC3F05F8FBC351585AADD78B3C3F148B0430CF0C9731868654B75044885B82878E95B9FF000B1FC2BFF439786BFF0002A2FF00E2EBE20A2803EDFF00F858FE15FF00A1CBC35FF81517FF001747FC2C7F0AFF00D0E5E1AFFC0A8BFF008BAF8828A00FB7FF00E163F857FE872F0D7FE0545FFC5D1FF0B1FC2BFF00439786BFF02A2FFE2EBE20A2803EDFFF00858FE15FFA1CBC35FF0081517FF1747FC2C7F0AFFD0E5E1AFF00C0A8BFF8BAF8828A00FB7FFE163F857FE872F0D7FE0545FF00C5D1FF000B1FC2BFF439786BFF0002A2FF00E2EBE20A2803EDFF00F858FE15FF00A1CBC35FF81517FF001747FC2C7F0AFF00D0E5E1AFFC0A8BFF008BAF8828A00FB7FF00E163F857FE872F0D7FE0545FFC5D1FF0B1FC2BFF00439786BFF02A2FFE2EBE20A2803EDFFF00858FE15FFA1CBC35FF0081517FF1747FC2C7F0AFFD0E5E1AFF00C0A8BFF8BAF8828A00FB7FFE163F857FE872F0D7FE0545FF00C5D1FF000B1FC2BFF439786BFF0002A2FF00E2EBE20A2803EDFF00F858FE15FF00A1CBC35FF81517FF001747FC2C7F0AFF00D0E5E1AFFC0A8BFF008BAF8828A00FB7FF00E163F857FE872F0D7FE0545FFC5D1FF0B1FC2BFF00439786BFF02A2FFE2EBE20A2803EDFFF00858FE15FFA1CBC35FF0081517FF1747FC2C7F0AFFD0E5E1AFF00C0A8BFF8BAF8828A00FB7FFE163F857FE872F0D7FE0545FF00C5D1FF000B1FC2BFF439786BFF0002A2FF00E2EBE20A2803EDFF00F858FE15FF00A1CBC35FF81517FF001747FC2C7F0AFF00D0E5E1AFFC0A8BFF008BAF8828A00FB7FF00E163F857FE872F0D7FE0545FFC5D1FF0B1FC2BFF00439786BFF02A2FFE2EBE20A2803EDFFF00858FE15FFA1CBC35FF0081517FF1747FC2C7F0AFFD0E5E1AFF00C0A8BFF8BAF8828A00FB7FFE163F857FE872F0D7FE0545FF00C5D1FF000B1FC2BFF439786BFF0002A2FF00E2EBE20A2803EDFF00F858FE15FF00A1CBC35FF81517FF001747FC2C7F0AFF00D0E5E1AFFC0A8BFF008BAF8828A00FB7FF00E163F857FE872F0D7FE0545FFC5D1FF0B1FC2BFF00439786BFF02A2FFE2EBE20A2803EDFFF00858FE15FFA1CBC35FF0081517FF1747FC2C7F0AFFD0E5E1AFF00C0A8BFF8BAF8828A00FB7FFE163F857FE872F0D7FE0545FF00C5D1FF000B1FC2BFF439786BFF0002A2FF00E2EBE20A2803EDFF00F858FE15FF00A1CBC35FF81517FF001747FC2C7F0AFF00D0E5E1AFFC0A8BFF008BAF8828A00FB7FF00E163F857FE872F0D7FE0545FFC5D1FF0B1FC2BFF00439786BFF02A2FFE2EBE20A2803EDFFF00858FE15FFA1CBC35FF0081517FF1747FC2C7F0AFFD0E5E1AFF00C0A8BFF8BAF8828A00FB7FFE163F857FE872F0D7FE0545FF00C5D1FF000B1FC2BFF439786BFF0002A2FF00E2EBE20A2803EDFF00F858FE15FF00A1CBC35FF81517FF001747FC2C7F0AFF00D0E5E1AFFC0A8BFF008BAF8828A00FB7FF00E163F857FE872F0D7FE0545FFC5D1FF0B1FC2BFF00439786BFF02A2FFE2EBE20A2803EDFFF00858FE15FFA1CBC35FF0081517FF1747FC2C7F0AFFD0E5E1AFF00C0A8BFF8BAF8828A00FB7FFE163F857FE872F0D7FE0545FF00C5D1FF000B1FC2BFF439786BFF0002A2FF00E2EBE20A2803EDFF00F858FE15FF00A1CBC35FF81517FF001747FC2C7F0AFF00D0E5E1AFFC0A8BFF008BAF8828A00FB7FF00E163F857FE872F0D7FE0545FFC5D1FF0B1FC2BFF00439786BFF02A2FFE2EBE20A2803EDFFF00858FE15FFA1CBC35FF0081517FF1747FC2C7F0AFFD0E5E1AFF00C0A8BFF8BAF8828A00FB7FFE163F857FE872F0D7FE0545FF00C5D1FF000B1FC2BFF439786BFF0002A2FF00E2EBE20A2803EDFF00F858FE15FF00A1CBC35FF81517FF001747FC2C7F0AFF00D0E5E1AFFC0A8BFF008BAF8828A00FB7FF00E163F857FE872F0D7FE0545FFC5D1FF0B1FC2BFF00439786BFF02A2FFE2EBE20A2803EDFFF00858FE15FFA1CBC35FF0081517FF1747FC2C7F0AFFD0E5E1AFF00C0A8BFF8BAF8828A00FB7FFE163F857FE872F0D7FE0545FF00C5D1FF000B1FC2BFF439786BFF0002A2FF00E2EBE20A2803EDFF00F858FE15FF00A1CBC35FF81517FF001747FC2C7F0AFF00D0E5E1AFFC0A8BFF008BAF8828A00FB7FF00E163F857FE872F0D7FE0545FFC5D1FF0B1FC2BFF00439786BFF02A2FFE2EBE20A2803EDFFF00858FE15FFA1CBC35FF0081517FF1747FC2C7F0AFFD0E5E1AFF00C0A8BFF8BAF8828A00FB7FFE163F857FE872F0D7FE0545FF00C5D1FF000B1FC2BFF439786BFF0002A2FF00E2EBE20A2803EDFF00F858FE15FF00A1CBC35FF81517FF001747FC2C7F0AFF00D0E5E1AFFC0A8BFF008BAF8828A00FB7FF00E163F857FE872F0D7FE0545FFC5D1FF0B1FC2BFF00439786BFF02A2FFE2EBE20A2803EC3F1A78FBC352D85D2DAF8B3C3F2C8D04D0C10C7731969A57B76004681B92C781C57C794514000FFD9, '1');
