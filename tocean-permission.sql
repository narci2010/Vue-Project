/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50715
Source Host           : localhost:3306
Source Database       : tocean-permission

Target Server Type    : MYSQL
Target Server Version : 50715
File Encoding         : 65001

Date: 2017-09-13 18:56:03
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sys_department
-- ----------------------------
DROP TABLE IF EXISTS `sys_department`;
CREATE TABLE `sys_department` (
  `department_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门主键',
  `department_name` varchar(30) NOT NULL COMMENT '部门名称',
  `department_description` varchar(200) DEFAULT NULL COMMENT '部门描述',
  `department_parent_id` bigint(20) DEFAULT NULL COMMENT '上级部门ID',
  `department_parent_ids` varchar(100) DEFAULT NULL COMMENT '所有父级部门ID，逗号分开，视图字段，所有操作必须保证该字段一致性，作用：减少查询连接操作',
  `department_create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '部门创建时间',
  `department_resource_ids` varchar(100) DEFAULT NULL COMMENT '部门拥有全部资源ID，用逗号分隔，视图字段，所有操作必须保证该字段一致性，作用：减少查询连接操作',
  PRIMARY KEY (`department_id`),
  UNIQUE KEY `department_name` (`department_name`),
  KEY `department_parent_id` (`department_parent_id`),
  CONSTRAINT `sys_department_ibfk_1` FOREIGN KEY (`department_parent_id`) REFERENCES `sys_department` (`department_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='部门表';

-- ----------------------------
-- Records of sys_department
-- ----------------------------

-- ----------------------------
-- Table structure for sys_department_resource
-- ----------------------------
DROP TABLE IF EXISTS `sys_department_resource`;
CREATE TABLE `sys_department_resource` (
  `resource_id` bigint(20) NOT NULL COMMENT '资源ID',
  `department_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`resource_id`,`department_id`),
  KEY `department_id` (`department_id`),
  CONSTRAINT `sys_department_resource_ibfk_1` FOREIGN KEY (`resource_id`) REFERENCES `sys_resource` (`resource_id`),
  CONSTRAINT `sys_department_resource_ibfk_2` FOREIGN KEY (`department_id`) REFERENCES `sys_department` (`department_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='部门资源表';

-- ----------------------------
-- Records of sys_department_resource
-- ----------------------------

-- ----------------------------
-- Table structure for sys_resource
-- ----------------------------
DROP TABLE IF EXISTS `sys_resource`;
CREATE TABLE `sys_resource` (
  `resource_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '资源主键',
  `resource_name` varchar(30) NOT NULL COMMENT '资源名称',
  `resource_url` varchar(200) DEFAULT NULL COMMENT '资源访问路径',
  `resource_type` tinyint(2) DEFAULT '1' COMMENT '资源类型(1：菜单 2：按钮 3：功能)',
  `resource_parent_id` bigint(20) DEFAULT NULL COMMENT '直接父级资源ID',
  `resource_parent_ids` varchar(100) DEFAULT NULL COMMENT '所有父级资源ID，逗号分开，视图字段，所有操作必须保证该字段一致性，作用：减少查询连接操作',
  `resource_permission` varchar(100) DEFAULT NULL COMMENT '资源权限标识',
  `resource_available` tinyint(1) DEFAULT '0' COMMENT '资源可用情况，0：不可用，1：可用',
  `resource_icon` varchar(32) DEFAULT NULL COMMENT '资源图标',
  `resource_sort_index` int(11) DEFAULT '-1' COMMENT '资源排序',
  `resource_system_type` tinyint(4) DEFAULT NULL COMMENT '资源系统类型，0001：后台系统资源，0010：前端系统资源，0100：app系统资源，1000：微信系统资源',
  `resource_create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '资源创建时间',
  PRIMARY KEY (`resource_id`),
  UNIQUE KEY `resource_name` (`resource_name`),
  KEY `resource_parent_id` (`resource_parent_id`),
  CONSTRAINT `sys_resource_ibfk_1` FOREIGN KEY (`resource_parent_id`) REFERENCES `sys_resource` (`resource_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='资源表';

-- ----------------------------
-- Records of sys_resource
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色主键',
  `role_name` varchar(30) NOT NULL COMMENT '角色名称',
  `role_create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '角色创建时间',
  `role_description` varchar(200) DEFAULT NULL COMMENT '角色描述',
  `role_available` tinyint(1) DEFAULT '0' COMMENT '角色状态，1:可用，0:不可用',
  `role_resource_ids` varchar(100) DEFAULT NULL COMMENT '角色拥有全部资源ID，用逗号分隔，视图字段，所有操作必须保证该字段一致性，作用：减少查询连接操作',
  `role_system_type` tinyint(4) DEFAULT NULL COMMENT '角色系统类型，0001：后台系统资源，0010：前端系统资源，0100：app系统资源，1000：微信系统资源',
  PRIMARY KEY (`role_id`),
  UNIQUE KEY `role_name` (`role_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role_department
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_department`;
CREATE TABLE `sys_role_department` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `department_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`department_id`),
  KEY `department_id` (`department_id`),
  CONSTRAINT `sys_role_department_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`role_id`),
  CONSTRAINT `sys_role_department_ibfk_2` FOREIGN KEY (`department_id`) REFERENCES `sys_department` (`department_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色部门表';

-- ----------------------------
-- Records of sys_role_department
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role_resource
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_resource`;
CREATE TABLE `sys_role_resource` (
  `resource_id` bigint(20) NOT NULL COMMENT '资源ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`role_id`,`resource_id`),
  KEY `RESOURCEID` (`resource_id`),
  CONSTRAINT `RESOURCEID` FOREIGN KEY (`resource_id`) REFERENCES `sys_resource` (`resource_id`),
  CONSTRAINT `ROLEID` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色资源表';

-- ----------------------------
-- Records of sys_role_resource
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户主键',
  `user_name` varchar(30) NOT NULL COMMENT '账号名称',
  `user_password` varchar(256) DEFAULT NULL COMMENT '用户密码',
  `user_salt` varchar(256) DEFAULT NULL COMMENT '密码用盐',
  `user_nick` varchar(30) DEFAULT NULL COMMENT '用户昵称（绰号）',
  `user_avatar` varchar(30) DEFAULT NULL COMMENT '用户头像',
  `user_create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '用户创建时间',
  `user_role_ids` varchar(100) DEFAULT NULL COMMENT '用户拥有全部角色ID，用逗号分隔，视图字段，所有操作必须保证该字段一致性，作用：减少查询连接操作',
  `user_department_id` bigint(20) DEFAULT NULL COMMENT '用户所在部门ID',
  `user_bussines_key` varchar(20) DEFAULT NULL COMMENT '与具体业务系统中用户表的关联字段：权限用户与业务用户表1:1关系',
  `user_status` tinyint(2) DEFAULT NULL COMMENT '用户状态，0:可用，1:锁定，2：待审核，3:功能受限',
  `user_system_type` tinyint(4) DEFAULT NULL COMMENT '用户系统类型，0001：后台系统资源，0010：前端系统资源，0100：app系统资源，1000：微信系统资源',
  `user_resource_ids` varchar(100) DEFAULT NULL COMMENT '用户拥有全部资源ID，用逗号分隔，视图字段，所有操作必须保证该字段一致性，作用：减少查询连接操作',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_name` (`user_name`),
  UNIQUE KEY `user_department_id` (`user_department_id`),
  UNIQUE KEY `user_bussines_key` (`user_bussines_key`),
  CONSTRAINT `sys_user_ibfk_1` FOREIGN KEY (`user_department_id`) REFERENCES `sys_department` (`department_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user_resource
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_resource`;
CREATE TABLE `sys_user_resource` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `resource_id` bigint(20) NOT NULL COMMENT '资源ID',
  PRIMARY KEY (`user_id`,`resource_id`),
  KEY `resource_id` (`resource_id`),
  CONSTRAINT `sys_user_resource_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `sys_user` (`user_id`),
  CONSTRAINT `sys_user_resource_ibfk_2` FOREIGN KEY (`resource_id`) REFERENCES `sys_resource` (`resource_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户资源表';

-- ----------------------------
-- Records of sys_user_resource
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `ROLEID_2` (`role_id`),
  CONSTRAINT `ROLEID_2` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`role_id`),
  CONSTRAINT `USERID` FOREIGN KEY (`user_id`) REFERENCES `sys_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户角色表';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
SET FOREIGN_KEY_CHECKS=1;
