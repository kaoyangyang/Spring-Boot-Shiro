/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50722
Source Host           : localhost:3306
Source Database       : circle

Target Server Type    : MYSQL
Target Server Version : 50722
File Encoding         : 65001

Date: 2019-03-14 09:33:41
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for circle
-- ----------------------------
DROP TABLE IF EXISTS `circle`;
CREATE TABLE `circle` (
  `id` varchar(32) NOT NULL COMMENT '圈子ID',
  `name` varchar(255) DEFAULT NULL COMMENT '圈子名称',
  `type` varchar(255) DEFAULT NULL COMMENT '圈子类型',
  `sm_pic` varchar(255) DEFAULT NULL COMMENT '圈子头像小图',
  `mid_pic` varchar(255) DEFAULT NULL COMMENT '圈子头像中图',
  `lg_pic` varchar(255) DEFAULT NULL COMMENT '圈子头像大图',
  `introduction` text COMMENT '圈子描述',
  `cotent_status` tinyint(1) DEFAULT NULL COMMENT '内容权限:1公开,0仅圈内可见',
  `join_status` tinyint(1) DEFAULT NULL COMMENT '加入方式:0,任何人,1需审批,3邀请加入',
  `topic_status` tinyint(1) DEFAULT NULL COMMENT '圈子话题:1开启,0关闭',
  `upload_status` tinyint(1) DEFAULT NULL COMMENT '上传权限:0圈内成员,1管理员',
  `download_status` tinyint(1) DEFAULT NULL COMMENT '下载权限:0,圈内成员,2仅管理员,3任何人',
  `creat_user_id` varchar(255) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL COMMENT '圈子状态:0未审核,1什么通过,2未通过',
  `member_nums` int(11) DEFAULT NULL COMMENT '成员数量',
  `creat_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of circle
-- ----------------------------
INSERT INTO `circle` VALUES ('111', '1', '1', '2', '3', '3', '2', '1', '1', null, null, null, null, null, null, null);
INSERT INTO `circle` VALUES ('2', '2', '2', '2', '2', null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for circle_member
-- ----------------------------
DROP TABLE IF EXISTS `circle_member`;
CREATE TABLE `circle_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `circle_id` varchar(32) DEFAULT NULL,
  `user_id` varchar(32) DEFAULT NULL,
  `join_time` datetime DEFAULT NULL,
  `join_status` varchar(255) DEFAULT NULL,
  `user_type` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of circle_member
-- ----------------------------

-- ----------------------------
-- Table structure for circle_type
-- ----------------------------
DROP TABLE IF EXISTS `circle_type`;
CREATE TABLE `circle_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of circle_type
-- ----------------------------

-- ----------------------------
-- Table structure for sys_authority
-- ----------------------------
DROP TABLE IF EXISTS `sys_authority`;
CREATE TABLE `sys_authority` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(100) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  `value` text,
  `perms` varchar(100) DEFAULT NULL,
  `sort` varchar(10) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_authority
-- ----------------------------
INSERT INTO `sys_authority` VALUES ('1', '1', '/login/**', '/login/** = authc\r\n/front/** = anon\r\n/front/course/manage/** = authc\r\n/admin/user/** = user\r\n/admin/user = user\r\n/ladmin/authority = user\r\n/admin/** = user\r\n/static/** = anon  \r\n/register/** = anon\r\n/upload/** = anon \r\n/error/** = anon\r\n/** = user  ', 'authc', '0');

-- ----------------------------
-- Table structure for sys_parameter
-- ----------------------------
DROP TABLE IF EXISTS `sys_parameter`;
CREATE TABLE `sys_parameter` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(100) DEFAULT NULL COMMENT 'uuid',
  `name` varchar(100) DEFAULT NULL COMMENT '参数名称',
  `value` varchar(100) DEFAULT NULL COMMENT '参数值',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `sort` int(10) DEFAULT '0' COMMENT '排序号',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父节点id',
  `category` varchar(100) DEFAULT NULL COMMENT '父参数类型',
  `subcategory` varchar(100) DEFAULT NULL COMMENT '参数类型',
  `type` varchar(20) DEFAULT 'other' COMMENT '类别；course：课程参数；other：其他参数；',
  `is_menu_node` varchar(10) DEFAULT '0',
  `is_list_node` varchar(10) DEFAULT NULL,
  `menu_sort` int(11) DEFAULT NULL,
  `shorthand` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8 COMMENT='参数表';

-- ----------------------------
-- Records of sys_parameter
-- ----------------------------
INSERT INTO `sys_parameter` VALUES ('12', 'aad8a3fd-0fe2-497f-be98-b8e18da39319', '1', 'aad8a3fd-0fe2-497f-be98-b8e18da39319', '1', '0', '2', 'information-class-1', '1', 'information', '0', null, null, null);
INSERT INTO `sys_parameter` VALUES ('13', '0ab6df62-87f3-4a0f-8c2e-55c7321d1abf', '学科分类', '0ab6df62-87f3-4a0f-8c2e-55c7321d1abf', '包括语数外史地生政等', '0', '0', 'subjects', 'subject', 'other', '0', null, null, null);
INSERT INTO `sys_parameter` VALUES ('14', '31be2d36-f7dc-43ef-8d3f-32775d6f00d3', '小学语文', '31be2d36-f7dc-43ef-8d3f-32775d6f00d3', '', '1', '13', 'subject', 'xiaoxueyuwen', 'other', '0', null, null, null);
INSERT INTO `sys_parameter` VALUES ('15', 'ce68ae02-3c1f-4bfb-8955-630b27a1eef8', '小学数学', 'ce68ae02-3c1f-4bfb-8955-630b27a1eef8', '', '2', '13', 'subject', 'xiaoxueshuxue', 'other', '0', null, null, null);
INSERT INTO `sys_parameter` VALUES ('16', '34e1155e-1a41-40b3-a8e9-28e8ccd63c25', '小学英语', '34e1155e-1a41-40b3-a8e9-28e8ccd63c25', '3', '3', '13', 'subject', 'xiaoxueyingyu', 'other', '0', null, null, null);
INSERT INTO `sys_parameter` VALUES ('17', '2d73f2e1-d819-4a55-b613-cd359577e7c5', '初中物理', '2d73f2e1-d819-4a55-b613-cd359577e7c5', '', '7', '13', 'subject', 'wuli', 'other', '0', null, null, null);
INSERT INTO `sys_parameter` VALUES ('18', 'a48805f0-38ce-4505-b408-3f0c54283748', '初中化学', 'a48805f0-38ce-4505-b408-3f0c54283748', '', '8', '13', 'subject', 'huaxue', 'other', '0', null, null, null);
INSERT INTO `sys_parameter` VALUES ('19', '29906195-f22b-484b-8678-0db4169e6c6a', '临沂市县区', '29906195-f22b-484b-8678-0db4169e6c6a', '', '2', '0', 'counties', 'county', 'other', '0', null, null, null);
INSERT INTO `sys_parameter` VALUES ('20', '3b5ccfac-e6ec-48bc-8938-b16ce66494db', '兰山区', '3b5ccfac-e6ec-48bc-8938-b16ce66494db', '', '1', '19', 'county', 'lanshanqu', 'other', '0', null, null, null);
INSERT INTO `sys_parameter` VALUES ('21', 'c7c1954a-0a7d-4857-bd8e-180dd6785537', '河东区', 'c7c1954a-0a7d-4857-bd8e-180dd6785537', '', '2', '19', 'county', 'hedongqu', 'other', '0', null, null, null);
INSERT INTO `sys_parameter` VALUES ('22', '90d2d810-dbe9-4892-9001-955154f699f9', '罗庄区', '90d2d810-dbe9-4892-9001-955154f699f9', '', '3', '19', 'county', 'luozhuangqu', 'other', '0', null, null, null);
INSERT INTO `sys_parameter` VALUES ('23', '39472222-fe28-4a67-853e-c2685c789f90', '经开区', '39472222-fe28-4a67-853e-c2685c789f90', '', '4', '19', 'county', 'jingjijishukaifaqu', 'other', '0', null, null, null);
INSERT INTO `sys_parameter` VALUES ('24', '7f57e5ca-9c48-44d3-bfc4-2341f2da48be', '郯城县', '7f57e5ca-9c48-44d3-bfc4-2341f2da48be', '', '5', '19', 'county', 'tanchengxian', 'other', '0', null, null, null);
INSERT INTO `sys_parameter` VALUES ('25', 'faf900f2-b323-40e9-bf9b-98762c20970c', '莒南县', 'faf900f2-b323-40e9-bf9b-98762c20970c', '', '6', '19', 'county', 'junanxian', 'other', '0', null, null, null);
INSERT INTO `sys_parameter` VALUES ('26', 'e5b66afa-e689-49c4-8f2d-302cf1806bce', '费县', 'e5b66afa-e689-49c4-8f2d-302cf1806bce', '', '7', '19', 'county', 'feixian', 'other', '0', null, null, null);
INSERT INTO `sys_parameter` VALUES ('27', '8d1f96dd-f92c-4e10-8257-970e2d39ec99', '平邑县', '8d1f96dd-f92c-4e10-8257-970e2d39ec99', '', '8', '19', 'county', 'pingyixian', 'other', '0', null, null, null);
INSERT INTO `sys_parameter` VALUES ('28', '5b840b11-7d79-4ac3-990d-1b34f84fed80', '作品分类', '5b840b11-7d79-4ac3-990d-1b34f84fed80', '', '0', '0', 'entry_categories', 'entry_category', 'other', '0', null, null, null);
INSERT INTO `sys_parameter` VALUES ('29', '87a9191d-39d7-4d47-909f-84cca6f763c7', '精品微课', '87a9191d-39d7-4d47-909f-84cca6f763c7', '', '1', '28', 'entry_category', 'jpwk', 'other', '0', null, null, null);
INSERT INTO `sys_parameter` VALUES ('30', '8fb7c113-4a51-4bba-9006-b39005f510ea', '优质微课', '8fb7c113-4a51-4bba-9006-b39005f510ea', '', '2', '28', 'entry_category', 'yzwk', 'other', '0', null, null, null);
INSERT INTO `sys_parameter` VALUES ('31', 'ee546ebe-0e8b-485d-ac2b-0634241b64eb', '初中生物', 'ee546ebe-0e8b-485d-ac2b-0634241b64eb', '', '11', '13', 'subject', 'shengwu', 'other', '0', null, null, null);
INSERT INTO `sys_parameter` VALUES ('32', 'c1b7328c-74ed-4e78-80fb-2d359d791189', '初中历史', 'c1b7328c-74ed-4e78-80fb-2d359d791189', '', '9', '13', 'subject', 'lishi', 'other', '0', null, null, null);
INSERT INTO `sys_parameter` VALUES ('33', 'e75a7804-4b6b-40a5-aa91-1f56eaa55039', '初中地理', 'e75a7804-4b6b-40a5-aa91-1f56eaa55039', '', '10', '13', 'subject', 'dili', 'other', '0', null, null, null);
INSERT INTO `sys_parameter` VALUES ('34', 'b8104a45-e1a2-4f7c-a08e-d54c47dd12ef', '初中语文', 'b8104a45-e1a2-4f7c-a08e-d54c47dd12ef', '', '4', '13', 'subject', 'chuzhongyuwen', 'other', '0', null, null, null);
INSERT INTO `sys_parameter` VALUES ('35', 'aeeee683-d111-4537-97d6-2bfcea0ad967', '初中数学', 'aeeee683-d111-4537-97d6-2bfcea0ad967', '', '5', '13', 'subject', 'chuzhongshuxue', 'other', '0', null, null, null);
INSERT INTO `sys_parameter` VALUES ('36', '6d9d7c1e-f95c-43df-96da-caadfaf58c8e', '初中英语', '6d9d7c1e-f95c-43df-96da-caadfaf58c8e', '', '6', '13', 'subject', 'chuzhongyingyu', 'other', '0', null, null, null);
INSERT INTO `sys_parameter` VALUES ('37', '3b2fe0b5-983b-4bba-bb79-7ec07bd47244', '富文本的类型', '3b2fe0b5-983b-4bba-bb79-7ec07bd47244', '富文本属于哪个类型', '0', '0', 'RichText-types', 'RichText-type', 'other', '0', null, null, null);
INSERT INTO `sys_parameter` VALUES ('38', '3590c148-98dc-46d3-9f08-80681927d66d', '活动开始的公告', '3590c148-98dc-46d3-9f08-80681927d66d', '', '1', '37', 'RichText-type', 'announcement', 'other', '0', null, null, null);
INSERT INTO `sys_parameter` VALUES ('39', '0b5ebcd5-6636-42cd-8771-6fb19064410b', '活动结束时的表彰', '0b5ebcd5-6636-42cd-8771-6fb19064410b', '', '2', '37', 'RichText-type', 'commendation', 'other', '0', null, null, null);
INSERT INTO `sys_parameter` VALUES ('40', 'bf958611-293f-493f-94c1-fff42d34cf19', '维度分类', 'bf958611-293f-493f-94c1-fff42d34cf19', '', '0', '0', 'dimensions', 'dimension', '', '0', null, null, null);
INSERT INTO `sys_parameter` VALUES ('41', '7a2ec2f5-a340-4d9b-ad99-d0a060501638', '知识维度', '7a2ec2f5-a340-4d9b-ad99-d0a060501638', '', '1', '40', 'dimension', 'sub_dimension1', '', '0', null, null, null);
INSERT INTO `sys_parameter` VALUES ('42', 'b3b4bea7-918a-4004-8a28-6abc14a88ba8', '思想方法', 'b3b4bea7-918a-4004-8a28-6abc14a88ba8', '', '4', '40', 'dimension', 'sub_dimension4', '', '0', null, null, null);
INSERT INTO `sys_parameter` VALUES ('43', '22c480b4-4b9b-44bc-826d-2a51aa86a62e', '技能维度', '22c480b4-4b9b-44bc-826d-2a51aa86a62e', '', '2', '40', 'dimension', 'sub_dimension2', '', '0', null, null, null);
INSERT INTO `sys_parameter` VALUES ('44', '23155d5f-59e6-4c63-b88c-5dc9583fc540', '能力维度', '23155d5f-59e6-4c63-b88c-5dc9583fc540', '', '3', '40', 'dimension', 'sub_dimension3', '', '0', null, null, null);
INSERT INTO `sys_parameter` VALUES ('45', '49d6f34b-4472-4b3d-b2d2-20d83c34479e', '测试分类', '49d6f34b-4472-4b3d-b2d2-20d83c34479e', '', '0', '0', 'ceshi', 'cs2', '', '0', null, null, null);
INSERT INTO `sys_parameter` VALUES ('46', '9201e55e-aaec-4955-a266-baf93305dfb7', '测试', '9201e55e-aaec-4955-a266-baf93305dfb7', '', '0', '45', 'cs2', 'cs3', '', '0', null, null, null);
INSERT INTO `sys_parameter` VALUES ('47', 'd797ccef-7de9-462b-b900-d3e25d0b426c', '学段分类', 'd797ccef-7de9-462b-b900-d3e25d0b426c', '', '0', '0', 'periodTitle', 'period', '', '0', null, null, null);
INSERT INTO `sys_parameter` VALUES ('48', '03', '小学', '03', '', '0', '47', 'period', 'grade1', '', '0', null, null, null);
INSERT INTO `sys_parameter` VALUES ('49', '04', '初中', '04', '', '0', '47', 'period', 'grade2', '', '0', null, null, null);
INSERT INTO `sys_parameter` VALUES ('50', '05', '高中', '05', '', '0', '47', 'period', 'grade3', '', '0', null, null, null);
INSERT INTO `sys_parameter` VALUES ('51', 'd6fe12ab-8089-4b91-a0d1-6327c1e1e35b', '一年级', '01', '', '0', '48', 'grade1', 'classroom', '', '0', null, null, null);
INSERT INTO `sys_parameter` VALUES ('52', '8fd3ee10-7201-493e-8464-52bfdb9d0287', '二年级', '02', '', '0', '48', 'grade1', 'classroom2', '', '0', null, null, null);
INSERT INTO `sys_parameter` VALUES ('53', 'd9590c77-9a43-4be2-b8ed-c11039236f93', '七年级', '07', '', '0', '49', 'grade2', 'classroom7', '', '0', null, null, null);
INSERT INTO `sys_parameter` VALUES ('54', '350d9fe1-e19d-4575-bbfa-d1f510d61af6', '八年级', '08', '', '0', '49', 'grade2', 'classroom8', '', '0', null, null, null);
INSERT INTO `sys_parameter` VALUES ('55', 'a4e1b009-e28a-433a-b089-25323c54f4b6', '高一', '10', '', '0', '50', 'grade3', 'classroom10', '', '0', null, null, null);
INSERT INTO `sys_parameter` VALUES ('56', 'c1da6dcc-08e8-4d45-932b-b85009a50af2', '高二', '11', '', '0', '50', 'grade3', 'classroom11', '', '0', null, null, null);
INSERT INTO `sys_parameter` VALUES ('57', '39c3591e-7fe4-44e8-b5d5-96372869a919', '系统公告', '', '', '0', '0', 'information_class', 'notice', 'information', '0', null, null, null);
INSERT INTO `sys_parameter` VALUES ('58', 'a77c76b4-97e9-4c71-ba6b-febe722d8c56', '帮助中心', '', '', '0', '0', 'information_class', 'help', 'information', '0', null, null, null);
INSERT INTO `sys_parameter` VALUES ('60', '03989815-a1d7-4f6c-9cbb-33ecdc40a0d8', '注册与登录', '3', '', '0', '58', 'help', 'reglogin', 'information', '0', null, null, null);
INSERT INTO `sys_parameter` VALUES ('61', '31c184e1-6629-485c-8176-850bdd616d7b', '账号与安全', '2', '', '0', '58', 'help', 'security', 'information', '0', null, null, null);
INSERT INTO `sys_parameter` VALUES ('62', 'ed398c74-6dc8-4ae7-a75e-e7b40d08ddb2', '注册', null, null, '0', '60', 'login', 'reg', 'information', '0', null, null, null);
INSERT INTO `sys_parameter` VALUES ('63', '1f26d1e5-f244-4b53-ae47-e7ee6e9f8721', '登录', null, null, '0', '60', 'login', 'login', 'information', '0', null, null, null);
INSERT INTO `sys_parameter` VALUES ('64', 'e39d4335-6bd7-4f21-a321-4a1f7ca491d8', '登录验证', null, null, '0', '60', 'reglogin', 'islogin', 'information', '0', null, null, null);
INSERT INTO `sys_parameter` VALUES ('65', '7532c985-bfd0-4e23-8c4c-97beda4344b8', '找回密码', null, null, '0', '61', 'security', 'pwd', 'information', '0', null, null, null);
INSERT INTO `sys_parameter` VALUES ('66', '24759eec-953c-43bb-81c3-fc5387bc30e9', '解绑手机', null, null, '0', '61', 'security', 'phone', 'information', '0', null, null, null);
INSERT INTO `sys_parameter` VALUES ('67', 'eeff1d00-6cef-40db-9175-f955f483b66d', '增值服务', '13', null, '0', '58', 'help', 'valueadded', 'information', '0', null, null, null);
INSERT INTO `sys_parameter` VALUES ('68', 'd4e634ad-c406-443d-a23b-afd9c7ad27f9', '增值服务类型', null, null, '0', '67', 'valueadded', 'addedtype', 'information', '0', null, null, null);

-- ----------------------------
-- Table structure for sys_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_permission`;
CREATE TABLE `sys_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(100) DEFAULT NULL COMMENT 'uuid',
  `name` varchar(100) DEFAULT NULL COMMENT '权限名称',
  `value` varchar(100) DEFAULT NULL COMMENT '权限值',
  `pid` int(11) DEFAULT '0' COMMENT '父节点id',
  `puuid` varchar(100) DEFAULT NULL COMMENT '父节点uuid，备用',
  `permission_type` varchar(100) DEFAULT NULL COMMENT '权限类型',
  `sort` int(10) DEFAULT '0' COMMENT '排序号，默认数字越小排名越前',
  `remark` text COMMENT '备注',
  `createdid` varchar(20) DEFAULT NULL COMMENT '创建人id',
  `createdtime` varchar(20) DEFAULT NULL COMMENT '创建时间',
  `createdip` varchar(20) DEFAULT NULL COMMENT '创建人ip',
  `updatedid` varchar(20) DEFAULT NULL COMMENT '修改人id',
  `updatedtime` varchar(20) DEFAULT NULL COMMENT '修改时间',
  `updatedip` varchar(20) DEFAULT NULL COMMENT '修改人IP',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=151 DEFAULT CHARSET=utf8 COMMENT='权限表';

-- ----------------------------
-- Records of sys_permission
-- ----------------------------
INSERT INTO `sys_permission` VALUES ('12', '3ea3ea3f-f560-4eaf-ad33-075e0391aff7', '题目管理', 'system:itemManage', '0', null, '1', '0', '题目管理权限', '0:0:0:0:0:0:0:1', '2016-12-20 09:35:22', null, 'jiabaochina', '2017-09-12 09:08:43', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_permission` VALUES ('13', '550b8934-7847-451a-a169-6250c0536850', '公共题库管理', 'menu:itemManage', '12', null, '2', '0', '', '0:0:0:0:0:0:0:1', '2016-12-20 09:36:08', null, 'jiabaochina', '2017-09-15 09:09:33', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_permission` VALUES ('23', '675b1f9e-8f42-4e83-94d4-8ee8709e7fb0', '用户管理', 'system:userManage', '0', null, '1', '0', '', '0:0:0:0:0:0:0:1', '2016-12-20 09:50:35', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('24', '2c33fac2-e611-4fa1-b847-21a528e9242c', '参数管理', 'system:parameterManage', '0', null, '1', '0', '', '0:0:0:0:0:0:0:1', '2016-12-20 09:50:49', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('25', '5392f39b-7595-4752-b2c8-b5f63cd64564', '用户管理', 'menu:userManage', '23', null, '2', '0', '', '0:0:0:0:0:0:0:1', '2016-12-20 10:31:12', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('27', '8d5def42-55d4-4441-81e3-af90bdc7c0bd', '角色管理', 'menu:roleManage', '23', null, '2', '0', '', '0:0:0:0:0:0:0:1', '2016-12-20 10:32:18', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('28', '737224c3-59ff-47b9-aba7-dc7b4aaf7cf2', '权限管理', 'menu:permissionManage', '23', null, '2', '0', '', '0:0:0:0:0:0:0:1', '2016-12-20 10:32:44', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('31', 'c4632f32-51bf-43d1-9e85-34633c311d02', '系统参数', 'menu:systemParameterManage', '24', null, '2', '0', '', '0:0:0:0:0:0:0:1', '2016-12-20 10:35:08', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('32', 'a02e12ef-8376-4703-a54c-3bdbdb2e333a', '系统设置', 'system:systemSetting', '0', null, '1', '0', '', '0:0:0:0:0:0:0:1', '2016-12-20 10:35:27', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('33', '001315da-d8e7-4f31-bd09-cb747f4a1a72', '系统日志', 'menu:logManage', '32', null, '2', '0', '', '0:0:0:0:0:0:0:1', '2016-12-20 10:36:07', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('36', '6ba83b57-8611-4051-b88b-f7ba71445316', 'URL权限管理', 'menu:authorityManage', '23', null, '2', '0', '', '0:0:0:0:0:0:0:1', '2016-12-20 11:05:20', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('49', 'bc41d721-450c-4196-9413-5b0837b6719b', '添加', 'fun:item:create', '13', null, '3', '1', '添加权限', '0:0:0:0:0:0:0:1', '2017-04-18 08:47:49', null, 'jiabaochina', '2017-09-12 09:09:57', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_permission` VALUES ('50', '1e98f72c-98b1-4646-89f3-c7816d41fe24', '修改', 'fun:item:update', '13', null, '3', '2', '', '0:0:0:0:0:0:0:1', '2017-04-18 08:48:11', null, 'jiabaochina', '2017-09-12 09:10:08', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_permission` VALUES ('51', '12bb57ea-2953-46bd-8f3d-5fd839eae659', '查看', 'fun:item:view', '13', null, '3', '3', '', '0:0:0:0:0:0:0:1', '2017-04-18 08:48:43', null, 'jiabaochina', '2017-09-12 09:10:15', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_permission` VALUES ('52', '7d104b0b-aed5-42d6-bf3b-568242965ab4', '删除', 'fun:item:delete', '13', null, '3', '4', '', '0:0:0:0:0:0:0:1', '2017-04-18 08:49:10', null, 'jiabaochina', '2017-09-12 09:10:21', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_permission` VALUES ('63', '4fd4821f-1a33-4eec-ad9a-8dd3d8bc8a90', '审核', 'fun:item:audit', '13', null, '3', '5', '审核功能', '0:0:0:0:0:0:0:1', '2017-04-22 09:25:58', null, 'jiabaochina', '2017-09-12 09:10:41', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_permission` VALUES ('64', 'cb72da35-2fa0-4960-86dc-bb45a7b77ede', '标签管理', 'fun:item:dimensionManage', '13', null, '3', '6', '标签管理', '0:0:0:0:0:0:0:1', '2017-09-20 10:18:32', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('65', '493b6b84-7d0a-4021-8109-7a5d22481ea8', '标签录入', 'fun:item:dimensionAdd', '64', null, '3', '1', '标签录入', '0:0:0:0:0:0:0:1', '2017-09-20 16:20:49', null, 'jiabaochina', '2017-09-20 16:23:28', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_permission` VALUES ('66', '44052688-51ce-41e9-9548-14a163af68b5', '标签审核', 'fun:item:dimensionAudit', '64', null, '3', '2', '标签审核', '0:0:0:0:0:0:0:1', '2017-09-20 16:23:19', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('67', '4a32c4a6-9f34-11e7-ad2e-286ed478c634', '试卷试题', 'menu:paperItemManage', '0', null, '2', '0', '试卷试题管理', null, null, null, null, null, null);
INSERT INTO `sys_permission` VALUES ('68', '18586e6f-9f34-11e7-ad2e-286ed478c634', '试卷库', 'menu:paperManage', '67', null, '2', '0', '试卷库', null, null, null, null, null, null);
INSERT INTO `sys_permission` VALUES ('69', '6a76d199-9f34-11e7-ad2e-286ed478c634', '试题库', 'menu:itemManage-----', '67', null, '2', '0', '试题库', null, null, null, null, null, null);
INSERT INTO `sys_permission` VALUES ('70', 'c0b9404d-9f34-11e7-ad2e-286ed478c634', '添加', 'fun:paper:create', '68', null, '3', '0', null, null, null, null, null, null, null);
INSERT INTO `sys_permission` VALUES ('71', '0760d36f-9f35-11e7-ad2e-286ed478c634', '修改', 'fun:paper:update', '68', null, '3', '0', null, null, null, null, null, null, null);
INSERT INTO `sys_permission` VALUES ('72', '0760d36f-9f35-11e7-ad2e-286ed478c634', '查看', 'fun:paper:view', '68', null, '3', '0', null, null, null, null, null, null, null);
INSERT INTO `sys_permission` VALUES ('73', '250959b3-9f35-11e7-ad2e-286ed478c634', '删除', 'fun:paper:delete', '68', null, '3', '0', null, null, null, null, null, null, null);
INSERT INTO `sys_permission` VALUES ('74', '31a5842f-9f35-11e7-ad2e-286ed478c634', '收藏', 'fun:paper:collect', '68', null, '3', '0', null, null, null, null, null, null, null);
INSERT INTO `sys_permission` VALUES ('75', '41866beb-9f35-11e7-ad2e-286ed478c634', '下载', 'fun:paper:download', '68', null, '3', '0', null, null, null, null, null, null, null);
INSERT INTO `sys_permission` VALUES ('76', '55b7d3a0-9f35-11e7-ad2e-286ed478c634', '审核', 'fun:paper:audit', '68', null, '3', '0', null, null, null, null, null, null, null);
INSERT INTO `sys_permission` VALUES ('77', '6010df73-9f35-11e7-ad2e-286ed478c634', '发布', 'fun:paper:publish', '68', null, '3', '0', null, null, null, null, null, null, null);
INSERT INTO `sys_permission` VALUES ('78', 'd75b879a-9f35-11e7-ad2e-286ed478c634', '在线群体测', 'menu:onlineTest', '0', null, '2', '0', null, null, null, null, null, null, null);
INSERT INTO `sys_permission` VALUES ('79', 'fcf267f4-9f35-11e7-ad2e-286ed478c634', '在线组卷', 'menu:paperBuild', '78', null, '2', '0', null, null, null, null, null, null, null);
INSERT INTO `sys_permission` VALUES ('80', '01147c82-9f36-11e7-ad2e-286ed478c634', '考试中心', 'menu:exam', '78', null, '2', '0', null, null, null, null, null, null, null);
INSERT INTO `sys_permission` VALUES ('81', '283fa137-9f36-11e7-ad2e-286ed478c634', '智能组卷', 'fun:paperBuild:smart', '79', null, '3', '0', null, null, null, null, null, null, null);
INSERT INTO `sys_permission` VALUES ('82', '4c3c930a-9f36-11e7-ad2e-286ed478c634', '手动组卷', 'fun:paperBuild:manual', '79', null, '3', '0', null, null, null, null, null, null, null);
INSERT INTO `sys_permission` VALUES ('83', '5d5d4e68-9f36-11e7-ad2e-286ed478c634', '细目表组卷', 'fun:paperBuild:checkList', '79', null, '3', '0', null, null, null, null, null, null, null);
INSERT INTO `sys_permission` VALUES ('84', 'beb2d841-9f36-11e7-ad2e-286ed478c634', '修改', 'fun:paperBuild:update', '79', null, '3', '0', null, null, null, null, null, null, null);
INSERT INTO `sys_permission` VALUES ('85', 'd2181945-9f36-11e7-ad2e-286ed478c634', '删除', 'fun:paperBuild:delete', '79', null, '3', '0', null, null, null, null, null, null, null);
INSERT INTO `sys_permission` VALUES ('86', 'dfc12c33-9f36-11e7-ad2e-286ed478c634', '下载', 'fun:paperBuild:download', '79', null, '3', '0', null, null, null, null, null, null, null);
INSERT INTO `sys_permission` VALUES ('87', '104305d5-9f37-11e7-ad2e-286ed478c634', '添加', 'fun:exam:create', '80', null, '3', '0', null, null, null, null, null, null, null);
INSERT INTO `sys_permission` VALUES ('88', '23835ecd-9f37-11e7-ad2e-286ed478c634', '修改', 'fun:exam:update', '80', null, '3', '0', null, null, null, null, null, null, null);
INSERT INTO `sys_permission` VALUES ('89', '3efe6b5b-9f37-11e7-ad2e-286ed478c634', '查看', 'fun:exam:view', '80', null, '3', '0', null, null, null, null, null, null, null);
INSERT INTO `sys_permission` VALUES ('90', '49af1137-9f37-11e7-ad2e-286ed478c634', '删除', 'fun:exam:delete', '80', null, '3', '0', null, null, null, null, null, null, null);
INSERT INTO `sys_permission` VALUES ('91', '53ae206a-9f37-11e7-ad2e-286ed478c634', '查看', 'fun:paperBuild:view', '79', null, '3', '0', null, null, null, null, null, null, null);
INSERT INTO `sys_permission` VALUES ('92', '834fa3c8-9f37-11e7-ad2e-286ed478c634', '阅卷', 'fun:exam:making', '80', null, '3', '0', null, null, null, null, null, null, null);
INSERT INTO `sys_permission` VALUES ('93', 'f2ecf2a5-9f37-11e7-ad2e-286ed478c634', '查看报告', 'fun:exam:viewReport', '80', null, '3', '0', null, null, null, null, null, null, null);
INSERT INTO `sys_permission` VALUES ('94', '0e28086f-9f38-11e7-ad2e-286ed478c634', '线下群体测', 'menu:offline', '0', null, '2', '0', null, null, null, null, null, null, null);
INSERT INTO `sys_permission` VALUES ('95', '32be5a38-9f38-11e7-ad2e-286ed478c634', '添加', 'fun:offline:create', '125', null, '3', '0', null, null, null, null, null, null, null);
INSERT INTO `sys_permission` VALUES ('96', '3b153886-9f38-11e7-ad2e-286ed478c634', '修改', 'fun:offline:update', '125', null, '3', '0', null, null, null, null, null, null, null);
INSERT INTO `sys_permission` VALUES ('97', '40e10d61-9f38-11e7-ad2e-286ed478c634', '查看', 'fun:offline:view', '125', null, '3', '0', null, null, null, null, null, null, null);
INSERT INTO `sys_permission` VALUES ('98', '469a0ecf-9f38-11e7-ad2e-286ed478c634', '删除', 'fun:offline:delete', '125', null, '3', '0', null, null, null, null, null, null, null);
INSERT INTO `sys_permission` VALUES ('99', '541eb10c-9f38-11e7-ad2e-286ed478c634', '审核', 'fun:offline:audit', '125', null, '3', '0', null, null, null, null, null, null, null);
INSERT INTO `sys_permission` VALUES ('100', '596f0971-9f38-11e7-ad2e-286ed478c634', '收藏', 'fun:offline:collect', '125', null, '3', '0', null, null, null, null, null, null, null);
INSERT INTO `sys_permission` VALUES ('101', '5eed29df-9f38-11e7-ad2e-286ed478c634', '上传', 'fun:offline:upload', '125', null, '3', '0', null, null, null, null, null, null, null);
INSERT INTO `sys_permission` VALUES ('102', '6360c5c9-9f38-11e7-ad2e-286ed478c634', '下载', 'fun:offline:download', '125', null, '3', '0', null, null, null, null, null, null, null);
INSERT INTO `sys_permission` VALUES ('103', 'af03944d-9f38-11e7-ad2e-286ed478c634', '测评报告', 'menu:report', '0', null, '2', '0', null, null, null, null, null, null, null);
INSERT INTO `sys_permission` VALUES ('104', 'af03944d-9f38-11e7-ad2e-286ed478c634', '报告列表', 'menu:reprot:list', '103', null, '2', '0', null, null, null, null, null, null, null);
INSERT INTO `sys_permission` VALUES ('105', 'c2e0a666-9f38-11e7-ad2e-286ed478c634', '我的报告', 'menu:reprot:mine', '103', null, '2', '0', null, null, null, null, null, null, null);
INSERT INTO `sys_permission` VALUES ('106', 'f270a030-9f38-11e7-ad2e-286ed478c634', '查看', 'fun:report:list:view', '104', null, '3', '0', null, null, null, null, null, null, null);
INSERT INTO `sys_permission` VALUES ('107', '1a164649-9f39-11e7-ad2e-286ed478c634', '下载', 'fun:report:list:download', '104', null, '3', '0', null, null, null, null, null, null, null);
INSERT INTO `sys_permission` VALUES ('108', '33ddab2a-9f39-11e7-ad2e-286ed478c634', '查看', 'menu:reprot:mine:view', '105', null, '3', '0', null, null, null, null, null, null, null);
INSERT INTO `sys_permission` VALUES ('109', '37efbf2d-9f39-11e7-ad2e-286ed478c634', '下载', 'menu:reprot:mine:download', '105', null, '3', '0', null, null, null, null, null, null, null);
INSERT INTO `sys_permission` VALUES ('110', '5b284a1a-9f39-11e7-ad2e-286ed478c634', '群体测评', 'menu:focusExam', '78', null, '2', '0', null, null, null, null, null, null, null);
INSERT INTO `sys_permission` VALUES ('111', '827f63bf-9f39-11e7-ad2e-286ed478c634', '个人测评', 'menu:realTimeExam', '78', null, '2', '0', null, null, null, null, null, null, null);
INSERT INTO `sys_permission` VALUES ('112', 'a9a7ff3e-9f39-11e7-ad2e-286ed478c634', '参加考试', 'fun:focusExam:startExam', '110', null, '3', '0', null, null, null, null, null, null, null);
INSERT INTO `sys_permission` VALUES ('113', 'a9a7ff3e-9f39-11e7-ad2e-286ed478c634', '查看答案和解析', 'fun:focusExam:viewAnswer', '110', null, '3', '0', null, null, null, null, null, null, null);
INSERT INTO `sys_permission` VALUES ('114', '0630fee4-9f3a-11e7-ad2e-286ed478c634', '查看', 'fun:focusExam:view', '110', null, '3', '0', null, null, null, null, null, null, null);
INSERT INTO `sys_permission` VALUES ('115', '4d70eb7d-9f3a-11e7-ad2e-286ed478c634', '开始考试', 'fun:realTimeExam:startExam', '111', null, '3', '0', null, null, null, null, null, null, null);
INSERT INTO `sys_permission` VALUES ('116', '50e3a323-9f3a-11e7-ad2e-286ed478c634', '查看答案和解析', 'fun:realTimeExam:viewAnser', '111', null, '3', '0', null, null, null, null, null, null, null);
INSERT INTO `sys_permission` VALUES ('117', '53c5b588-9f3a-11e7-ad2e-286ed478c634', '查看', 'fun:realTimeExam:view', '111', null, '3', '0', null, null, null, null, null, null, null);
INSERT INTO `sys_permission` VALUES ('118', '9913b1ef-9f3a-11e7-ad2e-286ed478c634', '再做一遍', 'fun:realTimeExam:repeat', '111', null, '3', '0', null, null, null, null, null, null, null);
INSERT INTO `sys_permission` VALUES ('119', 'c216f0f1-9f3a-11e7-ad2e-286ed478c634', '练习', 'menu:practice', '0', null, '2', '0', null, null, null, null, null, null, null);
INSERT INTO `sys_permission` VALUES ('120', 'ef119997-9f3a-11e7-ad2e-286ed478c634', '我的练习', 'menu:practice:mine', '119', null, '2', '0', null, null, null, null, null, null, null);
INSERT INTO `sys_permission` VALUES ('121', '419fe851-9f3b-11e7-ad2e-286ed478c634', '错题本', 'fun:mine:itemWrong', '138', null, '2', '0', null, null, null, null, null, null, null);
INSERT INTO `sys_permission` VALUES ('122', '53fa32dc-9f3b-11e7-ad2e-286ed478c634', '我的错题本', 'menu:itemWrong:mine', '121', null, '2', '0', null, null, null, null, null, null, null);
INSERT INTO `sys_permission` VALUES ('124', '6bd391d9-9f3b-11e7-ad2e-286ed478c634', '试卷收藏', 'fun:mine:paperCollect', '138', null, '2', '0', null, null, null, null, null, null, null);
INSERT INTO `sys_permission` VALUES ('125', '5e54s5e8-9f38-11e7-ad2e-286ed478c634', '线下群体测', 'menu:offline:test', '94', null, '2', '0', null, null, null, null, null, null, null);
INSERT INTO `sys_permission` VALUES ('126', '54we564d-9f3b-11e7-ad2e-286ed478c634', '试题收藏', 'fun:mine:itemCollect', '138', null, '2', '0', null, null, null, null, null, null, null);
INSERT INTO `sys_permission` VALUES ('127', '331076b9-b899-11e7-b8a0-286ed498c64b', '首页', 'menu:home', '0', null, '2', '0', null, null, null, null, null, null, null);
INSERT INTO `sys_permission` VALUES ('128', '4d0ccc43-b899-11e7-b8a0-286ed498c64b', '提分计划', 'menu:improvement', '0', null, '2', '0', null, null, null, null, null, null, null);
INSERT INTO `sys_permission` VALUES ('129', '894725e8-b899-11e7-b8a0-286ed498c64b', '学习圈', 'menu:learningCircle', '0', null, '2', '0', null, null, null, null, null, null, null);
INSERT INTO `sys_permission` VALUES ('130', 'aaeac593-b899-11e7-b8a0-286ed498c64b', '学习群', 'menu:studyGroup', '0', null, '2', '0', null, null, null, null, null, null, null);
INSERT INTO `sys_permission` VALUES ('131', 'd913cf21-b899-11e7-b8a0-286ed498c64b', '作业', 'menu:homework', '0', null, '2', '0', null, null, null, null, null, null, null);
INSERT INTO `sys_permission` VALUES ('132', 'acd584cc-615c-4e9a-9ed8-ab212256b1ee', '解锁', 'fun:item:unlock', '13', null, '3', '7', '解锁题目', '0:0:0:0:0:0:0:1', '2017-10-25 17:28:20', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('133', '3a89401d-bd4f-11e7-b8a0-286ed498c64b', '试题数量统计', 'fun:item:count', '13', null, '3', '0', null, null, null, null, null, null, null);
INSERT INTO `sys_permission` VALUES ('134', 'b163bd87-bd63-11e7-b8a0-286ed498c64b', '试卷数量统计', 'fun:paper:count', '68', null, '3', '0', null, null, null, null, null, null, null);
INSERT INTO `sys_permission` VALUES ('135', '6b3ffd98-be14-11e7-b8a0-286ed498c64b', '查看标签', 'fun:item:tag', '13', null, '3', '0', null, null, null, null, null, null, null);
INSERT INTO `sys_permission` VALUES ('136', '94be7a68-be14-11e7-b8a0-286ed498c64b', '查看原图', 'fun:item:pic', '13', null, '3', '0', null, null, null, null, null, null, null);
INSERT INTO `sys_permission` VALUES ('137', 'e825a39c-be14-11e7-b8a0-286ed498c64b', '查看解析', 'fun:item:analysis', '13', null, '3', '0', null, null, null, null, null, null, null);
INSERT INTO `sys_permission` VALUES ('138', '55b4edbe-be15-11e7-b8a0-286ed498c64b', '我的', 'menu:mine', '0', null, '2', '0', null, null, null, null, null, null, null);
INSERT INTO `sys_permission` VALUES ('139', 'bea4df1c-be16-11e7-b8a0-286ed498c64b', '纠错', 'fun:item:errorReport', '13', null, '3', '0', null, null, null, null, null, null, null);
INSERT INTO `sys_permission` VALUES ('140', '22be3b3e-be17-11e7-b8a0-286ed498c64b', '收藏', 'fun:item:collect', '13', null, '3', '0', null, null, null, null, null, null, null);
INSERT INTO `sys_permission` VALUES ('141', '99a41743-12c1-4bb4-bf6b-3e515c825ab2', '系统公告管理', 'system:noticeManage', '0', null, '1', '0', '', '60.213.47.147', '2017-12-30 11:33:44', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('142', '85d16a47-4c04-4d57-a121-4653780ef372', '系统公告管理', 'menu:noticeManage', '141', null, '2', '0', '', '60.213.47.147', '2017-12-30 11:34:12', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('143', 'fa4ee3b9-5b73-4320-ba44-a1d1c7ea1a12', '帮助中心管理', 'system:helpManage', '0', null, '1', '0', '', '60.213.47.147', '2017-12-30 11:34:28', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('144', 'c119fd13-ca3c-45fb-9410-3fefed4b895b', '帮助中心', 'menu:helpManage', '143', null, '2', '0', '', '60.213.47.147', '2017-12-30 11:34:54', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('145', '611cf512-8774-489b-b9ed-ddde22da6a2f', '查看审核内容', 'fun:item:viewAuditCotent', '13', null, '3', '1', '查看审核内容', '60.213.47.147', '2018-01-25 19:26:22', null, 'macl', '2018-01-25 19:58:19', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_permission` VALUES ('146', '1be134ce-17fe-49b0-8c4b-1ad27d2a30e7', '组织结构管理', 'system:orgManage', '0', null, '1', '0', '', '60.213.47.147', '2018-01-31 16:15:50', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('147', '589e115f-8449-434e-a91e-b177151e6afd', '行政组织机构管理', 'menu:orgManage', '146', null, '2', '0', '', '60.213.47.147', '2018-01-31 16:16:21', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('148', 'f10dc4ca-8141-46ee-9a9e-2589bc1781c5', '学校管理', 'menu:schoolManage', '146', null, '2', '0', '', '60.213.47.147', '2018-01-31 16:16:35', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('149', 'ffc183db-5b9b-43c3-af8d-202fa33db134', '班级管理', 'menu:classroomManage', '146', null, '2', '0', '', '60.213.47.147', '2018-01-31 16:16:49', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('150', '2762f9ee-bd7f-4c4b-9dfa-a2030922a402', '行政区域管理', 'system:districtManage', '0', null, '1', '0', '', '60.213.47.147', '2018-01-31 16:17:09', null, null, null, null);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id《=10不要随便动 请联系刘甲宝',
  `uuid` varchar(100) DEFAULT NULL COMMENT 'uuid',
  `ename` varchar(30) DEFAULT '' COMMENT '角色英文名称',
  `name` varchar(100) DEFAULT NULL COMMENT '角色名称',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `createdid` varchar(30) DEFAULT NULL COMMENT '创建人id',
  `createdtime` varchar(30) DEFAULT NULL COMMENT '创建时间',
  `createdip` varchar(30) DEFAULT NULL COMMENT '创建人IP',
  `updatedid` varchar(30) DEFAULT NULL COMMENT '修改人id',
  `updatedtime` varchar(30) DEFAULT NULL COMMENT '修改时间',
  `updatedip` varchar(30) DEFAULT NULL COMMENT '修改人ip',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', 'teacher', 'teacher', '教师', '在教育云平台中除学生和家长之外的其他角色都是对应这个教师角色。此角色的id=1，不能删除，在java硬编码使用了id=1。', '1', '2016-12-20 10:37:37', '0:0:0:0:0:0:0:1', 'jiabaochina', '2017-09-12 11:22:45', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_role` VALUES ('2', 'student', 'student', '学生', '在教育云平台中学生和家长对应这个学生角色。此角色的id=2，不能删除，在java硬编码使用了id=2。', '1', '2017-05-01 16:34:08', '60.213.47.147', 'jiabaochina', '2017-09-12 11:22:55', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_role` VALUES ('3', '67746f3b-4dfe-4dff-b4db-1c390ecc1fe9', 'topicAuditor', '题目审核员', '题目审核角色', '1', '2017-05-01 16:34:45', '60.213.47.147', 'jiabaochina', '2017-09-12 09:04:15', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_role` VALUES ('4', 'b25570bd-ed3a-4bec-bdd1-dbe0cc3c057e', 'admin', '超级管理员', '此角色为开发人员和运维人员持有', 'jiabaochina', '2017-09-12 09:05:30', '0:0:0:0:0:0:0:1', null, null, null);
INSERT INTO `sys_role` VALUES ('5', 'd4e473fc-71e3-425f-a56f-edbec0eaa7e9', 'bdAnalysis', '大数据分析', '大数据分析使用', 'jiabaochina', '2017-09-15 09:10:52', '192.168.8.215', null, null, null);
INSERT INTO `sys_role` VALUES ('6', '6060c66b-7d95-4efe-bac1-67b1a4cdf271', 'dimensionAdder', '标签录入员', '', 'jiabaochina', '2017-09-22 09:37:29', '0:0:0:0:0:0:0:1', null, null, null);
INSERT INTO `sys_role` VALUES ('7', '59f4d35b-6b26-4ee1-8cb7-e2e1ee8b8796', 'dimensionAuditor', '标签审核员', '', 'jiabaochina', '2017-09-22 09:37:46', '0:0:0:0:0:0:0:1', null, null, null);
INSERT INTO `sys_role` VALUES ('8', '17238134-ed70-4cae-a6bc-f18ad7f2e572', 'itemUnlock', '题目解锁', '', 'macl', '2017-12-07 15:35:11', '192.168.8.215', null, null, null);

-- ----------------------------
-- Table structure for sys_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_permission`;
CREATE TABLE `sys_role_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) NOT NULL COMMENT '角色id',
  `permission_id` bigint(20) NOT NULL COMMENT '权限表id',
  `permission_value` varchar(100) NOT NULL COMMENT '权限值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4091 DEFAULT CHARSET=utf8 COMMENT='角色权限关系表';

-- ----------------------------
-- Records of sys_role_permission
-- ----------------------------
INSERT INTO `sys_role_permission` VALUES ('595', '9', '13', 'menu:activityManage');
INSERT INTO `sys_role_permission` VALUES ('596', '9', '49', 'fun:activity:create');
INSERT INTO `sys_role_permission` VALUES ('597', '9', '50', 'fun:activity:update');
INSERT INTO `sys_role_permission` VALUES ('598', '9', '51', 'fun:activity:view');
INSERT INTO `sys_role_permission` VALUES ('599', '9', '52', 'fun:activity:delete');
INSERT INTO `sys_role_permission` VALUES ('600', '9', '63', 'fun:activity:preview');
INSERT INTO `sys_role_permission` VALUES ('601', '9', '53', 'menu:entryManage');
INSERT INTO `sys_role_permission` VALUES ('602', '9', '54', 'fun:entry:create');
INSERT INTO `sys_role_permission` VALUES ('603', '9', '55', 'fun:entry:update');
INSERT INTO `sys_role_permission` VALUES ('604', '9', '56', 'fun:entry:view');
INSERT INTO `sys_role_permission` VALUES ('605', '9', '57', 'fun:entry:delete');
INSERT INTO `sys_role_permission` VALUES ('606', '9', '58', 'menu:authorManage');
INSERT INTO `sys_role_permission` VALUES ('607', '9', '59', 'fun:author:create');
INSERT INTO `sys_role_permission` VALUES ('608', '9', '60', 'fun:author:update');
INSERT INTO `sys_role_permission` VALUES ('609', '9', '61', 'fun:author:view');
INSERT INTO `sys_role_permission` VALUES ('610', '9', '62', 'fun:author:delete');
INSERT INTO `sys_role_permission` VALUES ('611', '9', '47', 'system:homeManage');
INSERT INTO `sys_role_permission` VALUES ('612', '10', '12', 'system:activityManage');
INSERT INTO `sys_role_permission` VALUES ('613', '10', '13', 'menu:activityManage');
INSERT INTO `sys_role_permission` VALUES ('614', '10', '51', 'fun:activity:view');
INSERT INTO `sys_role_permission` VALUES ('615', '10', '53', 'menu:entryManage');
INSERT INTO `sys_role_permission` VALUES ('616', '10', '54', 'fun:entry:create');
INSERT INTO `sys_role_permission` VALUES ('617', '10', '55', 'fun:entry:update');
INSERT INTO `sys_role_permission` VALUES ('618', '10', '56', 'fun:entry:view');
INSERT INTO `sys_role_permission` VALUES ('619', '10', '57', 'fun:entry:delete');
INSERT INTO `sys_role_permission` VALUES ('620', '10', '58', 'menu:authorManage');
INSERT INTO `sys_role_permission` VALUES ('621', '10', '59', 'fun:author:create');
INSERT INTO `sys_role_permission` VALUES ('622', '10', '60', 'fun:author:update');
INSERT INTO `sys_role_permission` VALUES ('623', '10', '61', 'fun:author:view');
INSERT INTO `sys_role_permission` VALUES ('624', '10', '62', 'fun:author:delete');
INSERT INTO `sys_role_permission` VALUES ('625', '10', '47', 'system:homeManage');
INSERT INTO `sys_role_permission` VALUES ('626', '3', '12', 'system:itemManage');
INSERT INTO `sys_role_permission` VALUES ('627', '3', '13', 'menu:itemManage');
INSERT INTO `sys_role_permission` VALUES ('628', '3', '63', 'fun:item:audit');
INSERT INTO `sys_role_permission` VALUES ('700', '6', '12', 'system:itemManage');
INSERT INTO `sys_role_permission` VALUES ('701', '6', '13', 'menu:itemManage');
INSERT INTO `sys_role_permission` VALUES ('702', '6', '64', 'fun:item:dimensionManage');
INSERT INTO `sys_role_permission` VALUES ('703', '6', '65', 'fun:item:dimensionAdd');
INSERT INTO `sys_role_permission` VALUES ('704', '7', '12', 'system:itemManage');
INSERT INTO `sys_role_permission` VALUES ('705', '7', '13', 'menu:itemManage');
INSERT INTO `sys_role_permission` VALUES ('706', '7', '64', 'fun:item:dimensionManage');
INSERT INTO `sys_role_permission` VALUES ('707', '7', '66', 'fun:item:dimensionAudit');
INSERT INTO `sys_role_permission` VALUES ('3216', '8', '12', 'system:itemManage');
INSERT INTO `sys_role_permission` VALUES ('3217', '8', '13', 'menu:itemManage');
INSERT INTO `sys_role_permission` VALUES ('3218', '8', '49', 'fun:item:create');
INSERT INTO `sys_role_permission` VALUES ('3219', '8', '50', 'fun:item:update');
INSERT INTO `sys_role_permission` VALUES ('3220', '8', '51', 'fun:item:view');
INSERT INTO `sys_role_permission` VALUES ('3221', '8', '52', 'fun:item:delete');
INSERT INTO `sys_role_permission` VALUES ('3222', '8', '63', 'fun:item:audit');
INSERT INTO `sys_role_permission` VALUES ('3223', '8', '132', 'fun:item:unlock');
INSERT INTO `sys_role_permission` VALUES ('3500', '2', '78', 'menu:onlineTest');
INSERT INTO `sys_role_permission` VALUES ('3501', '2', '110', 'menu:focusExam');
INSERT INTO `sys_role_permission` VALUES ('3502', '2', '112', 'fun:focusExam:startExam');
INSERT INTO `sys_role_permission` VALUES ('3503', '2', '113', 'fun:focusExam:viewAnswer');
INSERT INTO `sys_role_permission` VALUES ('3504', '2', '114', 'fun:focusExam:view');
INSERT INTO `sys_role_permission` VALUES ('3505', '2', '111', 'menu:realTimeExam');
INSERT INTO `sys_role_permission` VALUES ('3506', '2', '115', 'fun:realTimeExam:startExam');
INSERT INTO `sys_role_permission` VALUES ('3507', '2', '116', 'fun:realTimeExam:viewAnser');
INSERT INTO `sys_role_permission` VALUES ('3508', '2', '117', 'fun:realTimeExam:view');
INSERT INTO `sys_role_permission` VALUES ('3509', '2', '118', 'fun:realTimeExam:repeat');
INSERT INTO `sys_role_permission` VALUES ('3510', '2', '103', 'menu:report');
INSERT INTO `sys_role_permission` VALUES ('3511', '2', '105', 'menu:reprot:mine');
INSERT INTO `sys_role_permission` VALUES ('3512', '2', '108', 'menu:reprot:mine:view');
INSERT INTO `sys_role_permission` VALUES ('3513', '2', '109', 'menu:reprot:mine:download');
INSERT INTO `sys_role_permission` VALUES ('3514', '2', '127', 'menu:home');
INSERT INTO `sys_role_permission` VALUES ('3515', '2', '128', 'menu:improvement');
INSERT INTO `sys_role_permission` VALUES ('3516', '2', '131', 'menu:homework');
INSERT INTO `sys_role_permission` VALUES ('3517', '2', '138', 'menu:mine');
INSERT INTO `sys_role_permission` VALUES ('3518', '2', '121', 'fun:mine:itemWrong');
INSERT INTO `sys_role_permission` VALUES ('3519', '2', '122', 'menu:itemWrong:mine');
INSERT INTO `sys_role_permission` VALUES ('3520', '2', '124', 'fun:mine:paperCollect');
INSERT INTO `sys_role_permission` VALUES ('3521', '2', '126', 'fun:mine:itemCollect');
INSERT INTO `sys_role_permission` VALUES ('3961', '1', '12', 'system:itemManage');
INSERT INTO `sys_role_permission` VALUES ('3962', '1', '13', 'menu:itemManage');
INSERT INTO `sys_role_permission` VALUES ('3963', '1', '51', 'fun:item:view');
INSERT INTO `sys_role_permission` VALUES ('3964', '1', '137', 'fun:item:analysis');
INSERT INTO `sys_role_permission` VALUES ('3965', '1', '139', 'fun:item:errorReport');
INSERT INTO `sys_role_permission` VALUES ('3966', '1', '140', 'fun:item:collect');
INSERT INTO `sys_role_permission` VALUES ('3967', '1', '67', 'menu:paperItemManage');
INSERT INTO `sys_role_permission` VALUES ('3968', '1', '68', 'menu:paperManage');
INSERT INTO `sys_role_permission` VALUES ('3969', '1', '70', 'fun:paper:create');
INSERT INTO `sys_role_permission` VALUES ('3970', '1', '71', 'fun:paper:update');
INSERT INTO `sys_role_permission` VALUES ('3971', '1', '72', 'fun:paper:view');
INSERT INTO `sys_role_permission` VALUES ('3972', '1', '73', 'fun:paper:delete');
INSERT INTO `sys_role_permission` VALUES ('3973', '1', '74', 'fun:paper:collect');
INSERT INTO `sys_role_permission` VALUES ('3974', '1', '75', 'fun:paper:download');
INSERT INTO `sys_role_permission` VALUES ('3975', '1', '76', 'fun:paper:audit');
INSERT INTO `sys_role_permission` VALUES ('3976', '1', '77', 'fun:paper:publish');
INSERT INTO `sys_role_permission` VALUES ('3977', '1', '69', 'menu:itemManage-----');
INSERT INTO `sys_role_permission` VALUES ('3978', '1', '78', 'menu:onlineTest');
INSERT INTO `sys_role_permission` VALUES ('3979', '1', '80', 'menu:exam');
INSERT INTO `sys_role_permission` VALUES ('3980', '1', '87', 'fun:exam:create');
INSERT INTO `sys_role_permission` VALUES ('3981', '1', '88', 'fun:exam:update');
INSERT INTO `sys_role_permission` VALUES ('3982', '1', '89', 'fun:exam:view');
INSERT INTO `sys_role_permission` VALUES ('3983', '1', '90', 'fun:exam:delete');
INSERT INTO `sys_role_permission` VALUES ('3984', '1', '92', 'fun:exam:making');
INSERT INTO `sys_role_permission` VALUES ('3985', '1', '93', 'fun:exam:viewReport');
INSERT INTO `sys_role_permission` VALUES ('3986', '1', '94', 'menu:offline');
INSERT INTO `sys_role_permission` VALUES ('3987', '1', '125', 'menu:offline:test');
INSERT INTO `sys_role_permission` VALUES ('3988', '1', '95', 'fun:offline:create');
INSERT INTO `sys_role_permission` VALUES ('3989', '1', '96', 'fun:offline:update');
INSERT INTO `sys_role_permission` VALUES ('3990', '1', '97', 'fun:offline:view');
INSERT INTO `sys_role_permission` VALUES ('3991', '1', '98', 'fun:offline:delete');
INSERT INTO `sys_role_permission` VALUES ('3992', '1', '99', 'fun:offline:audit');
INSERT INTO `sys_role_permission` VALUES ('3993', '1', '100', 'fun:offline:collect');
INSERT INTO `sys_role_permission` VALUES ('3994', '1', '101', 'fun:offline:upload');
INSERT INTO `sys_role_permission` VALUES ('3995', '1', '102', 'fun:offline:download');
INSERT INTO `sys_role_permission` VALUES ('3996', '1', '103', 'menu:report');
INSERT INTO `sys_role_permission` VALUES ('3997', '1', '104', 'menu:reprot:list');
INSERT INTO `sys_role_permission` VALUES ('3998', '1', '106', 'fun:report:list:view');
INSERT INTO `sys_role_permission` VALUES ('3999', '1', '107', 'fun:report:list:download');
INSERT INTO `sys_role_permission` VALUES ('4000', '1', '127', 'menu:home');
INSERT INTO `sys_role_permission` VALUES ('4001', '1', '131', 'menu:homework');
INSERT INTO `sys_role_permission` VALUES ('4002', '4', '12', 'system:itemManage');
INSERT INTO `sys_role_permission` VALUES ('4003', '4', '13', 'menu:itemManage');
INSERT INTO `sys_role_permission` VALUES ('4004', '4', '49', 'fun:item:create');
INSERT INTO `sys_role_permission` VALUES ('4005', '4', '50', 'fun:item:update');
INSERT INTO `sys_role_permission` VALUES ('4006', '4', '51', 'fun:item:view');
INSERT INTO `sys_role_permission` VALUES ('4007', '4', '52', 'fun:item:delete');
INSERT INTO `sys_role_permission` VALUES ('4008', '4', '63', 'fun:item:audit');
INSERT INTO `sys_role_permission` VALUES ('4009', '4', '64', 'fun:item:dimensionManage');
INSERT INTO `sys_role_permission` VALUES ('4010', '4', '65', 'fun:item:dimensionAdd');
INSERT INTO `sys_role_permission` VALUES ('4011', '4', '66', 'fun:item:dimensionAudit');
INSERT INTO `sys_role_permission` VALUES ('4012', '4', '133', 'fun:item:count');
INSERT INTO `sys_role_permission` VALUES ('4013', '4', '135', 'fun:item:tag');
INSERT INTO `sys_role_permission` VALUES ('4014', '4', '136', 'fun:item:pic');
INSERT INTO `sys_role_permission` VALUES ('4015', '4', '137', 'fun:item:analysis');
INSERT INTO `sys_role_permission` VALUES ('4016', '4', '139', 'fun:item:errorReport');
INSERT INTO `sys_role_permission` VALUES ('4017', '4', '140', 'fun:item:collect');
INSERT INTO `sys_role_permission` VALUES ('4018', '4', '145', 'fun:item:viewAuditCotent');
INSERT INTO `sys_role_permission` VALUES ('4019', '4', '23', 'system:userManage');
INSERT INTO `sys_role_permission` VALUES ('4020', '4', '25', 'menu:userManage');
INSERT INTO `sys_role_permission` VALUES ('4021', '4', '27', 'menu:roleManage');
INSERT INTO `sys_role_permission` VALUES ('4022', '4', '28', 'menu:permissionManage');
INSERT INTO `sys_role_permission` VALUES ('4023', '4', '36', 'menu:authorityManage');
INSERT INTO `sys_role_permission` VALUES ('4024', '4', '24', 'system:parameterManage');
INSERT INTO `sys_role_permission` VALUES ('4025', '4', '31', 'menu:systemParameterManage');
INSERT INTO `sys_role_permission` VALUES ('4026', '4', '32', 'system:systemSetting');
INSERT INTO `sys_role_permission` VALUES ('4027', '4', '33', 'menu:logManage');
INSERT INTO `sys_role_permission` VALUES ('4028', '4', '67', 'menu:paperItemManage');
INSERT INTO `sys_role_permission` VALUES ('4029', '4', '68', 'menu:paperManage');
INSERT INTO `sys_role_permission` VALUES ('4030', '4', '70', 'fun:paper:create');
INSERT INTO `sys_role_permission` VALUES ('4031', '4', '71', 'fun:paper:update');
INSERT INTO `sys_role_permission` VALUES ('4032', '4', '72', 'fun:paper:view');
INSERT INTO `sys_role_permission` VALUES ('4033', '4', '73', 'fun:paper:delete');
INSERT INTO `sys_role_permission` VALUES ('4034', '4', '74', 'fun:paper:collect');
INSERT INTO `sys_role_permission` VALUES ('4035', '4', '75', 'fun:paper:download');
INSERT INTO `sys_role_permission` VALUES ('4036', '4', '76', 'fun:paper:audit');
INSERT INTO `sys_role_permission` VALUES ('4037', '4', '77', 'fun:paper:publish');
INSERT INTO `sys_role_permission` VALUES ('4038', '4', '134', 'fun:paper:count');
INSERT INTO `sys_role_permission` VALUES ('4039', '4', '69', 'menu:itemManage-----');
INSERT INTO `sys_role_permission` VALUES ('4040', '4', '78', 'menu:onlineTest');
INSERT INTO `sys_role_permission` VALUES ('4041', '4', '79', 'menu:paperBuild');
INSERT INTO `sys_role_permission` VALUES ('4042', '4', '81', 'fun:paperBuild:smart');
INSERT INTO `sys_role_permission` VALUES ('4043', '4', '82', 'fun:paperBuild:manual');
INSERT INTO `sys_role_permission` VALUES ('4044', '4', '83', 'fun:paperBuild:checkList');
INSERT INTO `sys_role_permission` VALUES ('4045', '4', '84', 'fun:paperBuild:update');
INSERT INTO `sys_role_permission` VALUES ('4046', '4', '85', 'fun:paperBuild:delete');
INSERT INTO `sys_role_permission` VALUES ('4047', '4', '86', 'fun:paperBuild:download');
INSERT INTO `sys_role_permission` VALUES ('4048', '4', '91', 'fun:paperBuild:view');
INSERT INTO `sys_role_permission` VALUES ('4049', '4', '80', 'menu:exam');
INSERT INTO `sys_role_permission` VALUES ('4050', '4', '87', 'fun:exam:create');
INSERT INTO `sys_role_permission` VALUES ('4051', '4', '88', 'fun:exam:update');
INSERT INTO `sys_role_permission` VALUES ('4052', '4', '89', 'fun:exam:view');
INSERT INTO `sys_role_permission` VALUES ('4053', '4', '90', 'fun:exam:delete');
INSERT INTO `sys_role_permission` VALUES ('4054', '4', '92', 'fun:exam:making');
INSERT INTO `sys_role_permission` VALUES ('4055', '4', '93', 'fun:exam:viewReport');
INSERT INTO `sys_role_permission` VALUES ('4056', '4', '110', 'menu:focusExam');
INSERT INTO `sys_role_permission` VALUES ('4057', '4', '112', 'fun:focusExam:startExam');
INSERT INTO `sys_role_permission` VALUES ('4058', '4', '113', 'fun:focusExam:viewAnswer');
INSERT INTO `sys_role_permission` VALUES ('4059', '4', '114', 'fun:focusExam:view');
INSERT INTO `sys_role_permission` VALUES ('4060', '4', '111', 'menu:realTimeExam');
INSERT INTO `sys_role_permission` VALUES ('4061', '4', '115', 'fun:realTimeExam:startExam');
INSERT INTO `sys_role_permission` VALUES ('4062', '4', '116', 'fun:realTimeExam:viewAnser');
INSERT INTO `sys_role_permission` VALUES ('4063', '4', '117', 'fun:realTimeExam:view');
INSERT INTO `sys_role_permission` VALUES ('4064', '4', '118', 'fun:realTimeExam:repeat');
INSERT INTO `sys_role_permission` VALUES ('4065', '4', '94', 'menu:offline');
INSERT INTO `sys_role_permission` VALUES ('4066', '4', '125', 'menu:offline:test');
INSERT INTO `sys_role_permission` VALUES ('4067', '4', '95', 'fun:offline:create');
INSERT INTO `sys_role_permission` VALUES ('4068', '4', '96', 'fun:offline:update');
INSERT INTO `sys_role_permission` VALUES ('4069', '4', '97', 'fun:offline:view');
INSERT INTO `sys_role_permission` VALUES ('4070', '4', '98', 'fun:offline:delete');
INSERT INTO `sys_role_permission` VALUES ('4071', '4', '99', 'fun:offline:audit');
INSERT INTO `sys_role_permission` VALUES ('4072', '4', '100', 'fun:offline:collect');
INSERT INTO `sys_role_permission` VALUES ('4073', '4', '101', 'fun:offline:upload');
INSERT INTO `sys_role_permission` VALUES ('4074', '4', '102', 'fun:offline:download');
INSERT INTO `sys_role_permission` VALUES ('4075', '4', '103', 'menu:report');
INSERT INTO `sys_role_permission` VALUES ('4076', '4', '104', 'menu:reprot:list');
INSERT INTO `sys_role_permission` VALUES ('4077', '4', '106', 'fun:report:list:view');
INSERT INTO `sys_role_permission` VALUES ('4078', '4', '107', 'fun:report:list:download');
INSERT INTO `sys_role_permission` VALUES ('4079', '4', '127', 'menu:home');
INSERT INTO `sys_role_permission` VALUES ('4080', '4', '131', 'menu:homework');
INSERT INTO `sys_role_permission` VALUES ('4081', '4', '141', 'system:noticeManage');
INSERT INTO `sys_role_permission` VALUES ('4082', '4', '142', 'menu:noticeManage');
INSERT INTO `sys_role_permission` VALUES ('4083', '4', '143', 'system:helpManage');
INSERT INTO `sys_role_permission` VALUES ('4084', '4', '144', 'menu:helpManage');
INSERT INTO `sys_role_permission` VALUES ('4085', '4', '146', 'system:orgManage');
INSERT INTO `sys_role_permission` VALUES ('4086', '4', '147', 'menu:orgManage');
INSERT INTO `sys_role_permission` VALUES ('4087', '4', '148', 'menu:schoolManage');
INSERT INTO `sys_role_permission` VALUES ('4088', '4', '149', 'menu:classroomManage');
INSERT INTO `sys_role_permission` VALUES ('4089', '4', '150', 'system:districtManage');
INSERT INTO `sys_role_permission` VALUES ('4090', '9', '12', 'system:activityManage');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `uuid` varchar(100) DEFAULT NULL COMMENT 'uuid',
  `realname` varchar(30) DEFAULT NULL COMMENT '真实姓名',
  `nickname` varchar(100) DEFAULT NULL,
  `login_name` varchar(100) DEFAULT NULL COMMENT '登录账号',
  `password` varchar(100) DEFAULT NULL COMMENT '密码',
  `salt` varchar(64) DEFAULT NULL,
  `status` varchar(10) DEFAULT '0' COMMENT '状态；0：使用中；1：禁封；',
  `type` int(10) DEFAULT NULL COMMENT '用户类型,0游客，1学生，2家长，3教师，4管理员',
  `account_type` int(1) DEFAULT '0' COMMENT '用户创建类型0本地创建 1教育云创建',
  `change_left_times` int(2) DEFAULT '0' COMMENT '可以修改用户名剩余次数',
  `email` varchar(100) DEFAULT NULL COMMENT '电子邮箱',
  `phone` varchar(20) DEFAULT NULL COMMENT '联系电话',
  `large_avatar` text,
  `middle_avatar` text,
  `small_avatar` text,
  `created_time` varchar(30) DEFAULT NULL,
  `created_ip` varchar(30) DEFAULT NULL,
  `updated_time` varchar(30) DEFAULT NULL,
  `updated_ip` varchar(30) DEFAULT NULL,
  `sex` int(1) DEFAULT '2' COMMENT '性别 1男  0女  2保密',
  `theme` varchar(100) DEFAULT NULL COMMENT '主题',
  `pay_password` varchar(100) DEFAULT NULL COMMENT '付款密码',
  `pay_password_salt` varchar(100) DEFAULT NULL COMMENT '付款密码盐',
  `signature` text COMMENT '个人签名',
  `tags` varchar(100) DEFAULT NULL COMMENT '标签',
  `idnumber` varchar(20) DEFAULT NULL COMMENT '身份证号',
  `last_login_time` varchar(30) DEFAULT NULL COMMENT '最后登录时间',
  `last_login_ip` varchar(30) DEFAULT NULL COMMENT '最后登录IP',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_phone` (`phone`) USING BTREE,
  UNIQUE KEY `username` (`login_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=168 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('68', '7bccf820-0db8-4678-a426-f0203fd1da61', null, 'nickname', 'top0077', '393f7e1dea9206af92afcf75e742aa3cf72922d6', '180eebfc11469189', '0', '1', '0', '0', '1@1.com', '18763791624', null, null, null, '2018-01-02 10:39:14', '0:0:0:0:0:0:0:1', null, null, '2', null, null, null, null, null, null, null, null);
INSERT INTO `sys_user` VALUES ('78', 'f1347d60-d92b-405a-aec5-55f4efe41558', null, '张测试', 'zhtyuan79', '18b65c11df1699196edf44899faadd6ba72fe2e1', '9b7653d0caf28c32', '0', '1', null, null, null, null, null, null, null, '2018-01-08 09:45:16', '192.168.8.79', null, null, '2', null, null, null, null, null, null, null, null);
INSERT INTO `sys_user` VALUES ('79', '56515dea-c3f7-48cd-bdd2-98b6913d8b45', null, '张哈哈', 'zhang1', 'd93aebeee90c57d45b42082b8ae1051369ca163c', '380c4995847d8a00', '0', '1', null, null, null, null, null, null, null, '2018-01-08 09:47:56', '192.168.8.79', null, null, '2', null, null, null, null, null, null, null, null);
INSERT INTO `sys_user` VALUES ('82', 'eac56f42-c2a7-49ba-b00f-422950d18566', null, '张哈哈', 'zhang12', '44c85a72be61720269b4a553aa9111af1aac20ec', 'fd48a03606ecfdbd', '0', '1', null, null, null, null, null, null, null, '2018-01-08 09:48:51', '192.168.8.79', null, null, '2', null, null, null, null, null, null, null, null);
INSERT INTO `sys_user` VALUES ('83', '7efffc97-6683-41c9-a99f-5d0af4e9742b', null, '张哈哈', 'zhtyuan2', 'd3ce230628a19ae664a67d8d3fa1b3e28f958526', '5f6d06cbb1f2fd91', '0', '1', null, null, null, null, null, null, null, '2018-01-08 09:49:17', '192.168.8.79', null, null, '2', null, null, null, null, null, null, null, null);
INSERT INTO `sys_user` VALUES ('84', '4701d71b-5577-4693-a864-d0da26ec6128', null, '长哈哈', 'zhtyuan3', '395e1c3e9c3eb5471095116f2e1f30eb8bf571e2', 'aa34dcabbd220506', '0', '1', null, null, null, null, null, null, null, '2018-01-08 09:50:24', '192.168.8.79', null, null, '2', null, null, null, null, null, null, null, null);
INSERT INTO `sys_user` VALUES ('85', '3b5d0827-d173-413d-b5fd-6cb23d2b05d7', null, '张哈哈', 'zhang4', '5968c28d83b02e24c1efc57ebbee3e31b8dae891', '91fdab5ef3fd5d2a', '0', '1', null, null, null, null, null, null, null, '2018-01-08 10:15:24', '192.168.8.79', null, null, '2', null, null, null, null, null, null, null, null);
INSERT INTO `sys_user` VALUES ('89', '857be35f-98a1-491d-a37e-e7f3d97c8577', null, '张磊磊', 'zhtyuan1', '2212e914f044e86593deec25ce9c3116ae9ba99e', '2ea6c315372fb913', '0', '1', null, null, null, null, null, null, null, '2018-01-08 10:20:34', '192.168.8.79', null, null, '2', null, null, null, null, null, null, null, null);
INSERT INTO `sys_user` VALUES ('91', '61d88755-f2b5-40a4-985a-dcddbdbbafd8', null, 'zhtyuan60', 'zhanghello', '32543c0feee561877b83112209b651498f706aa8', 'd4bbf7cf15f88134', '0', '1', null, null, null, null, null, null, null, '2018-01-08 10:23:41', '192.168.8.79', null, null, '2', null, null, null, null, null, null, null, null);
INSERT INTO `sys_user` VALUES ('102', '9dbb5fb4-0faa-42ee-8fb0-b001216ec94e', null, null, 'a1234567891234', 'beac06950f0d7dd6bb37518be8c55998659a1fb8', 'd437c374c6362f4d', '0', '1', '0', '1', null, null, null, null, null, '2018-01-12 13:46:55', '0:0:0:0:0:0:0:1', null, null, '2', null, null, null, null, null, null, '2018-01-12 13:46:55', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_user` VALUES ('108', '630fcc8e-a29f-4ccd-8365-bf17740c02a7', '杨敬涛', '起航', 'yjt_xs', '10bc5a7b2655f8808cf3691b5696210a4fef23fe', '4be382c812fcd272', '0', '1', '1', '1', null, '18763791625', 'http://sxypj.linyi.net/xypc/upload/user/images/630fcc8e-a29f-4ccd-8365-bf17740c02a7/fa62977f-c9fe-4f5c-bee6-f20518c3c8ea_150_150.jpg', 'http://sxypj.linyi.net/xypc/upload/user/images/630fcc8e-a29f-4ccd-8365-bf17740c02a7/fa62977f-c9fe-4f5c-bee6-f20518c3c8ea_70_70.jpg', 'http://sxypj.linyi.net/xypc/upload/user/images/630fcc8e-a29f-4ccd-8365-bf17740c02a7/fa62977f-c9fe-4f5c-bee6-f20518c3c8ea_32_32.jpg', '2018-01-15 14:49:32', '0:0:0:0:0:0:0:1', '2018-01-31 11:22:53', '0:0:0:0:0:0:0:1', '1', null, null, null, '好好学习 天天向上', null, '371312198902285117', '2018-01-31 15:48:47', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_user` VALUES ('110', '433fa554-5e1d-43f9-97bb-09f8d59d5040', null, '鏉庤緣', 'top001', null, 'd70bf3c32e6b88d7', '0', '1', '1', '1', null, null, 'http://static.linyi.net/portal/upload/image/user/4637130095000358322_img400x400.jpeg', 'http://static.linyi.net/portal/upload/image/user/4637130095000358322_img200x200.jpeg', 'http://static.linyi.net/portal/upload/image/user/4637130095000358322_img96x96.jpeg', '2018-01-15 16:39:53', null, null, null, '2', null, null, null, null, null, null, '2018-01-27 10:58:43', '192.168.10.39');
INSERT INTO `sys_user` VALUES ('111', 'b6299edf-4a1e-4bc2-a352-32980e6092de', 'macl', '马成龙', 'macl', 'b268c2118c17dd7a5408ec5ae18a904fbd9c4441', '32630338edc811d4', '0', '3', '1', '1', null, null, 'http://static.linyi.net/portal/upload/image/user/4637130095000002695_img400x400.jpg', 'http://static.linyi.net/portal/upload/image/user/4637130095000002695_img200x200.jpg', 'http://static.linyi.net/portal/upload/image/user/4637130095000002695_img96x96.jpg', '2018-01-16 08:49:58', '0:0:0:0:0:0:0:1', '2018-01-29 11:11:24', '0:0:0:0:0:0:0:1', '2', null, null, null, '123', null, null, '2018-02-01 09:16:01', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_user` VALUES ('112', '994121d2-1b39-4107-af8f-050f0935b064', null, '浜庡畻鐐�', '3701200000000000037', '6f607ce8eadc51d9ef8e0d0e21c1f8271042d35e', '7f989d51ba0b9665', '0', '1', '1', '1', null, null, 'http://static.linyi.net/null', 'http://static.linyi.net/null', 'http://static.linyi.net/null', '2018-01-17 08:58:56', null, null, null, '2', null, null, null, null, null, null, '2018-01-27 11:01:41', '192.168.8.248');
INSERT INTO `sys_user` VALUES ('114', '8aae9e03-ce9f-4efd-b633-57831406f90d', '李明', '鏉庡己', 'lq', '65cb30bdfdc3047b11a911bb6b8d8bcdcc3ad173', '49a715c3e635d8e9', '0', '1', '1', '1', null, '15265956380', null, null, null, '2018-01-23 11:10:21', '192.168.8.175', '2018-01-23 16:15:36', '192.168.8.83', '1', null, null, null, null, null, '371326198703167028', '2018-01-26 09:09:42', '192.168.8.83');
INSERT INTO `sys_user` VALUES ('115', '4637130095000344818', null, '鑲栧鐢�', 'shaw', '7ab52265976333708ac2b855e9d745cef2b681d5', '0d254fede612c890', '0', '1', '1', '1', null, null, null, null, null, '2018-01-23 11:11:32', '192.168.8.108', null, null, '1', null, null, null, '', null, '1234567820090504101', '2018-01-23 11:26:45', '192.168.8.108');
INSERT INTO `sys_user` VALUES ('116', '4637130095000002835', null, '鍛ㄩ福娴�', 'zhoumh', 'f63b3f351119bfb76fc0840055a34249b97316c9', 'c4e922bdc47887bd', '0', '3', '1', '1', null, '18660925037', 'http://static.linyi.net/portal/upload/image/user/4637130095000002835_img400x400.jpg', 'http://static.linyi.net/portal/upload/image/user/4637130095000002835_img200x200.jpg', 'http://static.linyi.net/portal/upload/image/user/4637130095000002835_img96x96.jpg', '2018-01-23 11:11:37', '192.168.8.112', null, null, '1', null, null, null, '!@#$%^&amp;*()_+=-][\';/.,&lt;&gt;?&quot;:}{|\\`~娴嬭瘯鐗规畩瀛楃', null, '371302198512011812', '2018-01-31 11:36:13', '192.168.8.112');
INSERT INTO `sys_user` VALUES ('117', '4637130095000002875', null, '瀛欒�胯繙', 'noob', '380e3ccc3f8c1db9ada5ccbc35caed39f96c362c', 'a0027c5378e0012b', '0', '3', '1', '1', 'sgy@iamtop.net', null, 'http://static.linyi.net/portal/upload/image/user/4637130095000002875_img400x400.jpg', 'http://static.linyi.net/portal/upload/image/user/4637130095000002875_img200x200.jpg', 'http://static.linyi.net/portal/upload/image/user/4637130095000002875_img96x96.jpg', '2018-01-23 11:11:43', '192.168.8.114', null, null, '1', null, null, null, '娴嬭瘯鐗规畩瀛楃123', null, '671615198812035362', '2018-01-23 15:28:31', '192.168.10.89');
INSERT INTO `sys_user` VALUES ('126', '6c0bdf7d-fdb2-4df8-baee-5e73fe1b5bff', null, '小平', 'lyp', '08fb687a2d8e705da1d264737b898ea7776f6552', '741a974b783442bb', '0', '3', '1', '1', '417107912@qq.com', '15128001600', 'http://static.linyi.net/portal/upload/image/user/6c0bdf7dfdb24df8baee5e73fe1b5bff_img400x400.jpg', 'http://static.linyi.net/portal/upload/image/user/6c0bdf7dfdb24df8baee5e73fe1b5bff_img200x200.jpg', 'http://static.linyi.net/portal/upload/image/user/6c0bdf7dfdb24df8baee5e73fe1b5bff_img96x96.jpg', '2018-01-23 12:28:58', '192.168.8.83', null, null, '1', null, null, null, ' ', null, '110101194910014950', '2018-01-31 15:46:03', '192.168.8.83');
INSERT INTO `sys_user` VALUES ('127', '4637130095000330675', null, '韩爱荣', 'har', 'e4b7a5d2dd4c0773a54505946c31b309ad1de9b0', '3a8e033c19cc7e7d', '0', '3', '1', '1', 'har@iamtop.net', '15853848282', 'http://static.linyi.net/portal/upload/image/user/4637130095000330675_img400x400.jpg', 'http://static.linyi.net/portal/upload/image/user/4637130095000330675_img200x200.jpg', 'http://static.linyi.net/portal/upload/image/user/4637130095000330675_img96x96.jpg', '2018-01-23 13:42:07', '192.168.8.135', null, null, '1', null, null, null, '', null, '', '2018-01-23 13:42:07', '192.168.8.135');
INSERT INTO `sys_user` VALUES ('128', '4637130095000000098', null, '张洁', 'ouranle', '24765a34aa1ebb32759665bd24f5d8dde6ace7fe', 'de6277ccc06f2c92', '0', '3', '1', '1', null, '18953932277', 'http://static.linyi.net/portal/upload/image/user/4637130095000000098_img400x400.jpg', 'http://static.linyi.net/portal/upload/image/user/4637130095000000098_img200x200.jpg', 'http://static.linyi.net/portal/upload/image/user/4637130095000000098_img96x96.jpg', '2018-01-23 16:13:55', '0:0:0:0:0:0:0:1', null, null, '1', null, null, null, '越努力，越幸运', null, '370323198610132029', '2018-01-26 10:33:55', '192.168.8.175');
INSERT INTO `sys_user` VALUES ('129', '4637130095000388758', null, '刘晓祎', 'liu133', 'd57a8035d22dca94a3098326f2e69ad61a21f4b4', '52bb5b1d39dd5195', '0', '1', '1', '1', null, null, null, null, null, '2018-01-23 18:08:27', '192.168.8.135', null, null, '1', null, null, null, null, null, '3342356798127658765', '2018-01-31 16:15:35', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_user` VALUES ('135', 'af27c8816506bf1b6705b50866f9cde0a67401cb', null, '超级管理员', 'edu2018012608513585', '5c1266bf2d35ac4fa1072d32dfe0d1624a828239', '0d77a8437e7727fe', '0', '1', '1', '1', null, '753241231211', 'http://static.linyi.net/portal/upload/image/user/785f02ce-16af-4dd4-9d4a-56387f1ec837_img400x400.jpg', 'http://static.linyi.net/portal/upload/image/user/d28ed9f8-89ee-489e-82c8-1e674fde20d4_img200x200.jpg', 'http://static.linyi.net/portal/upload/image/user/60e0c635-d46a-45de-af23-ff3268967230_img96x96.jpg', '2018-01-26 08:51:35', '0:0:0:0:0:0:0:1', null, null, '1', null, null, null, '', null, '371312199107055124', '2018-01-26 08:51:35', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_user` VALUES ('140', 'd0e5e4a6-164c-4de7-a08c-f78a6d7b17a9', null, '果果', 'ting', 'bc7c3a0abd054d9472bf5b74b93a724450dbbd52', 'd23d2f913c2fc633', '0', '3', '1', '1', null, '15851985314', 'http://static.linyi.net/portal/upload/image/user/bb8c1a2d760b4e9da6a881b2f4fd13e2_img400x400.jpg', 'http://static.linyi.net/portal/upload/image/user/bb8c1a2d760b4e9da6a881b2f4fd13e2_img200x200.jpg', 'http://static.linyi.net/portal/upload/image/user/bb8c1a2d760b4e9da6a881b2f4fd13e2_img96x96.jpg', '2018-01-26 08:59:23', '192.168.8.175', null, null, '1', null, null, null, null, null, '371329199102160318', '2018-01-26 09:02:44', '192.168.8.175');
INSERT INTO `sys_user` VALUES ('143', '098dc01e-34cc-4bac-ad23-98cf27e97a96', null, '测试', 'p18100000045', '42e9f33b1eb733a7dff683978c11d6c6f3d93f65', '5ce735ffeddfd6b7', '0', '3', '1', '1', null, '18100000045', null, null, null, '2018-01-26 09:05:09', '192.168.8.83', null, null, '1', null, null, null, null, null, '371325199002167045', '2018-01-26 09:05:09', '192.168.8.83');
INSERT INTO `sys_user` VALUES ('154', '4637130095000003432', null, '刘淑霞', 'judy_lsx', 'd114519f321e12eef8ba40256de1cfc6d69da757', 'c2acad2b2c45a21d', '0', '3', '1', '1', null, null, 'http://static.linyi.net/http://static.0539.com/portal/upload/image/user/807ffed1-7b5d-411b-b018-19278ee31229_img400x400..jpeg', 'http://static.linyi.net/http://static.0539.com/portal/upload/image/user/807ffed1-7b5d-411b-b018-19278ee31229_img200x200..jpeg', 'http://static.linyi.net/http://static.0539.com/portal/upload/image/user/807ffed1-7b5d-411b-b018-19278ee31229_img96x96..jpeg', '2018-01-26 10:32:37', '192.168.8.154', null, null, '1', null, null, null, '好好学习天天向上', null, '37142419810208246x', '2018-01-26 10:32:37', '192.168.8.154');
INSERT INTO `sys_user` VALUES ('156', '4637130095000002940', null, '刘甲宝', 'jiabaochina', 'bf730dedd7d38bf3919be223299db6af9d391e83', 'c97d5caafdf60e11', '0', '3', '1', '1', 'liujb@iamtop.net', '18763791623', 'http://static.linyi.net/JYYSpace/upload/dynamic/upload/avatar/03/9a/d3/original_200_200.jpg', 'http://static.linyi.net/JYYSpace/upload/dynamic/upload/avatar/03/9a/d3/original_200_200.jpg', 'http://static.linyi.net/JYYSpace/upload/dynamic/upload/avatar/03/9a/d3/original_200_200.jpg', '2018-01-26 10:50:36', '0:0:0:0:0:0:0:1', '2018-01-29 14:24:11', '0:0:0:0:0:0:0:1', '1', null, null, null, '喜欢地理，喜欢历史，更喜欢基于地理的历史研读，有志同道合的朋友关注我吧', null, '', '2018-01-30 10:59:45', '192.168.8.215');
INSERT INTO `sys_user` VALUES ('166', 'c04f495c-1f15-4851-b098-137d134f83bc', null, 'sanzhang', 'test001', 'be5d2cf32a10742884afd23ea2079fc46de828ae', 'dc32b3d9497a5a5b', '0', '1', null, null, null, null, null, null, null, '2018-01-31 17:04:52', '192.168.8.79', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_user` VALUES ('167', '4637130095000002695', '张三', '超级管理员', 'admin', 'f2e152ff47fe4d02fd399c9f7788ac8cf09ce371', '88e73786c0f7bb2a', '0', '4', '0', '0', null, '15555555555', '', '', '', '2017-10-09 09:21:31', null, '2018-01-23 13:58:33', '192.168.8.215', '2', null, null, null, '123333', null, null, '2018-02-01 08:48:31', '0:0:0:0:0:0:0:1');

-- ----------------------------
-- Table structure for sys_user_login_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_login_log`;
CREATE TABLE `sys_user_login_log` (
  `log_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '登录日志ID',
  `login_time` int(11) DEFAULT NULL COMMENT '登录时间',
  `login_ip` varchar(20) DEFAULT NULL COMMENT '登录IP',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `operating_system` varchar(50) DEFAULT NULL COMMENT '操作系统',
  `browser` varchar(50) DEFAULT NULL COMMENT '浏览器',
  PRIMARY KEY (`log_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=416 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户登录表';

-- ----------------------------
-- Records of sys_user_login_log
-- ----------------------------
INSERT INTO `sys_user_login_log` VALUES ('144', '1498643487', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('145', '1498643522', '192.168.1.13', '1', 'WINDOWS_7', 'CHROME');
INSERT INTO `sys_user_login_log` VALUES ('146', '1498644136', '0:0:0:0:0:0:0:1', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('147', '1498696770', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('148', '1498696935', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('149', '1498697948', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('150', '1498698072', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('151', '1498698196', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('152', '1498699082', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('153', '1498699432', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('154', '1498699706', '0:0:0:0:0:0:0:1', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('155', '1498699646', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('156', '1498699799', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('157', '1498700536', '0:0:0:0:0:0:0:1', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('158', '1498703621', '0:0:0:0:0:0:0:1', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('159', '1498703553', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('160', '1498703797', '192.168.1.26', '1', 'WINDOWS_7', 'CHROME39');
INSERT INTO `sys_user_login_log` VALUES ('161', '1498703941', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME');
INSERT INTO `sys_user_login_log` VALUES ('162', '1498704012', '192.168.1.26', '1', 'WINDOWS_7', 'CHROME39');
INSERT INTO `sys_user_login_log` VALUES ('163', '1498704110', '0:0:0:0:0:0:0:1', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('164', '1498704322', '0:0:0:0:0:0:0:1', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('165', '1498704455', '0:0:0:0:0:0:0:1', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('166', '1498704533', '0:0:0:0:0:0:0:1', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('167', '1498704682', '0:0:0:0:0:0:0:1', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('168', '1498706068', '192.168.1.26', '1', 'WINDOWS_7', 'CHROME39');
INSERT INTO `sys_user_login_log` VALUES ('169', '1498707433', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('170', '1498707589', '0:0:0:0:0:0:0:1', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('171', '1498708225', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME');
INSERT INTO `sys_user_login_log` VALUES ('172', '1498714561', '192.168.1.13', '1', 'WINDOWS_7', 'CHROME');
INSERT INTO `sys_user_login_log` VALUES ('173', '1498714892', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('174', '1498714912', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('175', '1498717536', '0:0:0:0:0:0:0:1', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('176', '1498719628', '0:0:0:0:0:0:0:1', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('177', '1498719718', '0:0:0:0:0:0:0:1', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('178', '1498720250', '0:0:0:0:0:0:0:1', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('179', '1498721509', '0:0:0:0:0:0:0:1', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('180', '1498721472', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('181', '1498721707', '0:0:0:0:0:0:0:1', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('182', '1498722682', '0:0:0:0:0:0:0:1', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('183', '1498722697', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('184', '1498722774', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('185', '1498722797', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('186', '1498723998', '0:0:0:0:0:0:0:1', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('187', '1498724109', '0:0:0:0:0:0:0:1', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('188', '1498724427', '0:0:0:0:0:0:0:1', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('189', '1498724612', '0:0:0:0:0:0:0:1', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('190', '1498726269', '0:0:0:0:0:0:0:1', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('191', '1498726979', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('192', '1498727250', '0:0:0:0:0:0:0:1', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('193', '1498729214', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('194', '1498730522', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('195', '1498730704', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('196', '1498784021', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('197', '1498784093', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('198', '1498784793', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('199', '1498785172', '0:0:0:0:0:0:0:1', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('200', '1498786010', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('201', '1498786323', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('202', '1498786548', '0:0:0:0:0:0:0:1', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('203', '1498786548', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('204', '1498786716', '0:0:0:0:0:0:0:1', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('205', '1498786626', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('206', '1498786988', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('207', '1498787137', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('208', '1498787414', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('209', '1498787655', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('210', '1498787901', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('211', '1498788939', '0:0:0:0:0:0:0:1', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('212', '1498789243', '0:0:0:0:0:0:0:1', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('213', '1498792867', '0:0:0:0:0:0:0:1', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('214', '1498793558', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('215', '1498793866', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('216', '1498794052', '0:0:0:0:0:0:0:1', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('217', '1498794300', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('218', '1498801042', '0:0:0:0:0:0:0:1', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('219', '1498800942', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('220', '1498802396', '0:0:0:0:0:0:0:1', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('221', '1498802454', '0:0:0:0:0:0:0:1', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('222', '1498803515', '0:0:0:0:0:0:0:1', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('223', '1498804811', '0:0:0:0:0:0:0:1', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('224', '1498805228', '0:0:0:0:0:0:0:1', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('225', '1498805241', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('226', '1498805469', '0:0:0:0:0:0:0:1', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('227', '1498805899', '0:0:0:0:0:0:0:1', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('228', '1498806813', '0:0:0:0:0:0:0:1', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('229', '1498806800', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('230', '1498806995', '0:0:0:0:0:0:0:1', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('231', '1498807290', '0:0:0:0:0:0:0:1', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('232', '1498807203', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('233', '1498807725', '0:0:0:0:0:0:0:1', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('234', '1498808125', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('235', '1498809962', '0:0:0:0:0:0:0:1', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('236', '1498811173', '0:0:0:0:0:0:0:1', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('237', '1498811214', '0:0:0:0:0:0:0:1', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('238', '1498811582', '0:0:0:0:0:0:0:1', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('239', '1498811989', '0:0:0:0:0:0:0:1', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('240', '1498812194', '0:0:0:0:0:0:0:1', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('241', '1498812256', '0:0:0:0:0:0:0:1', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('242', '1498812373', '0:0:0:0:0:0:0:1', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('243', '1498812703', '0:0:0:0:0:0:0:1', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('244', '1498812751', '0:0:0:0:0:0:0:1', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('245', '1498814101', '0:0:0:0:0:0:0:1', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('246', '1498814281', '0:0:0:0:0:0:0:1', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('247', '1498814294', '0:0:0:0:0:0:0:1', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('248', '1498815015', '0:0:0:0:0:0:0:1', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('249', '1499042315', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('250', '1499043527', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('251', '1499049141', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('252', '1499051653', '192.168.1.88', '1', 'WINDOWS_7', 'IE9');
INSERT INTO `sys_user_login_log` VALUES ('253', '1499051758', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME51');
INSERT INTO `sys_user_login_log` VALUES ('254', '1499052573', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('255', '1499052849', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('256', '1499053115', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('257', '1499060576', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('258', '1499062246', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('259', '1499066402', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('260', '1499066583', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('261', '1499066779', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('262', '1499067338', '0:0:0:0:0:0:0:1', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('263', '1499069038', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('264', '1499069279', '192.168.1.88', '7', 'WINDOWS_7', 'IE9');
INSERT INTO `sys_user_login_log` VALUES ('265', '1499069518', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('266', '1499069582', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('267', '1499070803', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('268', '1499070825', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('269', '1499071525', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('270', '1499131270', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('271', '1499134326', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('272', '1499134791', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('273', '1499153429', '0:0:0:0:0:0:0:1', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('274', '1499155324', '0:0:0:0:0:0:0:1', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('275', '1499155573', '0:0:0:0:0:0:0:1', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('276', '1499157566', '0:0:0:0:0:0:0:1', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('277', '1499157784', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('278', '1499224438', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('279', '1499224558', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('280', '1499237804', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('281', '1499238665', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('282', '1499240768', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('283', '1499240844', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('284', '1499240927', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('285', '1499241009', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('286', '1499241689', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('287', '1499241852', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('288', '1499241940', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('289', '1499242070', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('290', '1499242204', '0:0:0:0:0:0:0:1', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('291', '1499242576', '0:0:0:0:0:0:0:1', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('292', '1499242686', '0:0:0:0:0:0:0:1', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('293', '1499242786', '0:0:0:0:0:0:0:1', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('294', '1499243019', '0:0:0:0:0:0:0:1', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('295', '1499243826', '0:0:0:0:0:0:0:1', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('296', '1499244330', '0:0:0:0:0:0:0:1', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('297', '1499244413', '0:0:0:0:0:0:0:1', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('298', '1499244893', '0:0:0:0:0:0:0:1', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('299', '1499245106', '0:0:0:0:0:0:0:1', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('300', '1499304924', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('301', '1499305120', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('302', '1499305230', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('303', '1499305433', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('304', '1499305555', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('305', '1499305754', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('306', '1499305988', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('307', '1499306086', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('308', '1499306206', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('309', '1499306272', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('310', '1499306446', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('311', '1499323795', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('312', '1499324004', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('313', '1499325387', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('314', '1499325470', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('315', '1499325657', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('316', '1499325738', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('317', '1499325800', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('318', '1499326940', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('319', '1499326972', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('320', '1499327095', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('321', '1499327157', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('322', '1499327897', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('323', '1499328094', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('324', '1499328214', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('325', '1499333844', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('326', '1499389330', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('327', '1499392633', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('328', '1499394310', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('329', '1499394750', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('330', '1499397025', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('331', '1499397556', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('332', '1499399214', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('333', '1499407108', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME51');
INSERT INTO `sys_user_login_log` VALUES ('334', '1499407181', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('335', '1499410304', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('336', '1499410387', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('337', '1499410642', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('338', '1499410906', '192.168.1.88', '8', 'WINDOWS_7', 'CHROME51');
INSERT INTO `sys_user_login_log` VALUES ('339', '1499410928', '192.168.1.88', '8', 'WINDOWS_7', 'CHROME51');
INSERT INTO `sys_user_login_log` VALUES ('340', '1499419066', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('341', '1499649774', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('342', '1499649874', '192.168.1.11', '1', 'WINDOWS_7', 'CHROME');
INSERT INTO `sys_user_login_log` VALUES ('343', '1499650352', '192.168.1.11', '1', 'WINDOWS_7', 'CHROME');
INSERT INTO `sys_user_login_log` VALUES ('344', '1499651147', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('345', '1499651546', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('346', '1499651696', '192.168.1.12', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('347', '1499652951', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('348', '1499653330', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('349', '1499656282', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('350', '1499657144', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('351', '1499665646', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('352', '1499665846', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('353', '1499666672', '192.168.1.12', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('354', '1499667521', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('355', '1499668376', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('356', '1499668738', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('357', '1499668939', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('358', '1499669915', '192.168.1.12', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('359', '1499670576', '192.168.1.88', '8', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('360', '1499675439', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('361', '1499675579', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('362', '1499675677', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('363', '1499675734', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('364', '1499676954', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('365', '1499678029', '192.168.1.12', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('366', '1499733831', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('367', '1499736644', '192.168.1.12', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('368', '1499740053', '192.168.1.12', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('369', '1499739950', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('370', '1499751595', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('371', '1499754490', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('372', '1499754532', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME51');
INSERT INTO `sys_user_login_log` VALUES ('373', '1499754626', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME');
INSERT INTO `sys_user_login_log` VALUES ('374', '1499754671', '192.168.1.88', '1', 'WINDOWS_7', 'IE9');
INSERT INTO `sys_user_login_log` VALUES ('375', '1499754889', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('376', '1499755582', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('377', '1499823697', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('378', '1499824314', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('379', '1499830448', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('380', '1499830781', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('381', '1499851241', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('382', '1499911630', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('383', '1499911942', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('384', '1499912210', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('385', '1499912417', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('386', '1499912551', '192.168.1.88', '1', 'WINDOWS_7', 'IE9');
INSERT INTO `sys_user_login_log` VALUES ('387', '1499913005', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('388', '1499914224', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('389', '1499914472', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('390', '1499915663', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('391', '1499918084', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('392', '1499925822', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('393', '1499936087', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('394', '1499938281', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('395', '1499938450', '192.168.1.88', '1', 'WINDOWS_7', 'IE9');
INSERT INTO `sys_user_login_log` VALUES ('396', '1500012618', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('397', '1500018058', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('398', '1500018358', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('399', '1500018527', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('400', '1500018635', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('401', '1500018856', '192.168.1.88', '1', 'WINDOWS_7', 'CHROME49');
INSERT INTO `sys_user_login_log` VALUES ('402', '1528708116', '0:0:0:0:0:0:0:1', '1', 'WINDOWS_81', 'CHROME');
INSERT INTO `sys_user_login_log` VALUES ('403', '1528960179', '0:0:0:0:0:0:0:1', '1', 'WINDOWS_81', 'CHROME');
INSERT INTO `sys_user_login_log` VALUES ('404', '1528961880', '0:0:0:0:0:0:0:1', '1', 'WINDOWS_81', 'CHROME');
INSERT INTO `sys_user_login_log` VALUES ('405', '1528964863', '0:0:0:0:0:0:0:1', '1', 'WINDOWS_81', 'CHROME');
INSERT INTO `sys_user_login_log` VALUES ('406', '1528965837', '0:0:0:0:0:0:0:1', '1', 'WINDOWS_81', 'CHROME');
INSERT INTO `sys_user_login_log` VALUES ('407', '1528967698', '0:0:0:0:0:0:0:1', '1', 'WINDOWS_81', 'CHROME');
INSERT INTO `sys_user_login_log` VALUES ('408', '1528967776', '0:0:0:0:0:0:0:1', '1', 'WINDOWS_81', 'CHROME');
INSERT INTO `sys_user_login_log` VALUES ('409', '1531213812', '0:0:0:0:0:0:0:1', '1', 'WINDOWS_10', 'CHROME');
INSERT INTO `sys_user_login_log` VALUES ('410', '1531214044', '0:0:0:0:0:0:0:1', '1', 'WINDOWS_10', 'CHROME');
INSERT INTO `sys_user_login_log` VALUES ('411', '1531214070', '0:0:0:0:0:0:0:1', '9', 'WINDOWS_10', 'CHROME');
INSERT INTO `sys_user_login_log` VALUES ('412', '1531214231', '0:0:0:0:0:0:0:1', '1', 'WINDOWS_10', 'CHROME');
INSERT INTO `sys_user_login_log` VALUES ('413', '1531214973', '0:0:0:0:0:0:0:1', '1', 'WINDOWS_10', 'CHROME');
INSERT INTO `sys_user_login_log` VALUES ('414', '1531272567', '0:0:0:0:0:0:0:1', '1', 'WINDOWS_10', 'CHROME');
INSERT INTO `sys_user_login_log` VALUES ('415', '1531280302', '0:0:0:0:0:0:0:1', '1', 'WINDOWS_10', 'CHROME');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_uuid` varchar(100) NOT NULL COMMENT '单点登录后  获取uuid',
  `role_id` int(11) NOT NULL COMMENT '角色表id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=172 DEFAULT CHARSET=utf8 COMMENT='角色用户关系表';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('8', '9c37b189-8af6-4e53-b362-ab9861322b5d', '3');
INSERT INTO `sys_user_role` VALUES ('9', '4637130095000000952', '3');
INSERT INTO `sys_user_role` VALUES ('10', '29de21d2-60c0-4496-8574-c6c5b00c362f', '3');
INSERT INTO `sys_user_role` VALUES ('11', '4637130095000000140', '3');
INSERT INTO `sys_user_role` VALUES ('12', '27cc59a4-8edd-4009-b38e-99fffc77013d', '3');
INSERT INTO `sys_user_role` VALUES ('13', '1dba9c79-e163-4753-aaab-96048f0f132b', '3');
INSERT INTO `sys_user_role` VALUES ('14', '778a9b37-cdc6-4c13-8870-7d9d9d547e2f', '3');
INSERT INTO `sys_user_role` VALUES ('15', '62e614ac-cbd3-4cf4-acb9-41b1ef72645a', '3');
INSERT INTO `sys_user_role` VALUES ('16', '77d8c703-34be-4544-8df3-968503cd337e', '3');
INSERT INTO `sys_user_role` VALUES ('17', 'a5a7dcd4-35d5-414d-8099-940125b92013', '3');
INSERT INTO `sys_user_role` VALUES ('18', '744ba74c-02b9-44fb-b42a-784f679cde18', '3');
INSERT INTO `sys_user_role` VALUES ('19', 'f9f13a6a-dd6e-48b6-b755-1adb36fd322d', '3');
INSERT INTO `sys_user_role` VALUES ('20', '4637130095000002875', '3');
INSERT INTO `sys_user_role` VALUES ('21', '4e0af24e-bb9e-4b03-802c-9d43d2e0ce79', '3');
INSERT INTO `sys_user_role` VALUES ('22', '645c45dd-84cb-46aa-be98-d778d870f229', '3');
INSERT INTO `sys_user_role` VALUES ('23', '4637130095000003432', '3');
INSERT INTO `sys_user_role` VALUES ('24', '4637130095000001021', '3');
INSERT INTO `sys_user_role` VALUES ('26', 'dc763844-4ed6-4583-92fa-544e4150f8cb', '4');
INSERT INTO `sys_user_role` VALUES ('27', '7bac923c-fe4c-46a2-a18a-d045772b2b50', '4');
INSERT INTO `sys_user_role` VALUES ('28', 'fb674a5a-e7b8-4f75-bcf0-2300299ae162', '2');
INSERT INTO `sys_user_role` VALUES ('34', '83e493ac-e31c-403c-873b-05359b05ba58', '2');
INSERT INTO `sys_user_role` VALUES ('35', '5d5c20d8-9c26-47d3-b260-de0becd9a0f9', '2');
INSERT INTO `sys_user_role` VALUES ('36', 'b9374fa4-bba8-423f-9410-982d1ec0ae22', '2');
INSERT INTO `sys_user_role` VALUES ('37', '52846cef-85d9-45a7-971e-d468cdd345b2', '1');
INSERT INTO `sys_user_role` VALUES ('38', '4c90b3b6-6b91-41ef-8be0-c7676b0d21a0', '2');
INSERT INTO `sys_user_role` VALUES ('39', '32e58f21-fb6f-475d-b48a-3f28522ce35a', '2');
INSERT INTO `sys_user_role` VALUES ('40', '145c3117-2ca5-455d-bf4d-3ff37591bc94', '2');
INSERT INTO `sys_user_role` VALUES ('42', '540e0ba5-2b68-4ca6-98e1-e7a447b5ffaa', '1');
INSERT INTO `sys_user_role` VALUES ('46', '4637130095000358322', '4');
INSERT INTO `sys_user_role` VALUES ('47', '15d417b0-82d0-4fc3-ae8f-d14709f44097', '4');
INSERT INTO `sys_user_role` VALUES ('48', '467699ea-a1dc-4393-aed6-753cef82bb55', '1');
INSERT INTO `sys_user_role` VALUES ('49', '7a9e1381-baa6-43cc-b903-829d35027cd6', '1');
INSERT INTO `sys_user_role` VALUES ('50', 'e6de62d2-fedc-400c-97a6-3cf637e4e10f', '1');
INSERT INTO `sys_user_role` VALUES ('51', 'bd81936d-c76c-4c73-a5bc-5e71a17d61e5', '1');
INSERT INTO `sys_user_role` VALUES ('52', '42b607dd-5697-4506-abb5-cd64bea661af', '1');
INSERT INTO `sys_user_role` VALUES ('53', 'dc0bbca4-95ec-4d5e-a52c-15635e963bd3', '1');
INSERT INTO `sys_user_role` VALUES ('54', '0e2c587d-3683-4e20-8162-3c2b30ebb3c0', '1');
INSERT INTO `sys_user_role` VALUES ('55', '2eeff5b4-a06f-45ed-ba2b-15d4cedb075a', '1');
INSERT INTO `sys_user_role` VALUES ('56', '474af39e-5b68-4cda-8fdd-2e9ef25ec3dc', '1');
INSERT INTO `sys_user_role` VALUES ('57', '80e18456-ce96-4c46-aadd-357fe443d79f', '1');
INSERT INTO `sys_user_role` VALUES ('58', '7ba1dc87-7c21-41ca-a8d6-00635a4348a0', '1');
INSERT INTO `sys_user_role` VALUES ('59', '89177ec3-1e8e-485c-8527-014f29cc89d0', '1');
INSERT INTO `sys_user_role` VALUES ('60', '12321a91-04ea-444a-8a78-4a71d140a394', '1');
INSERT INTO `sys_user_role` VALUES ('61', 'b0a4c50f-d9b8-4275-91d2-9e074da0f6b4', '1');
INSERT INTO `sys_user_role` VALUES ('66', '4637130095000002695', '4');
INSERT INTO `sys_user_role` VALUES ('68', 'eb82047c-ac10-4af3-aab0-578ee2596641', '4');
INSERT INTO `sys_user_role` VALUES ('70', '6407dcf5-a947-4923-a679-c4ebd2beb5af', '3');
INSERT INTO `sys_user_role` VALUES ('71', 'af27c8816506bf1b6705b50866f9cde0a67401cb', '3');
INSERT INTO `sys_user_role` VALUES ('72', 'af27c8816506bf1b6705b50866f9cde0a67401cb', '4');
INSERT INTO `sys_user_role` VALUES ('73', 'af27c8816506bf1b6705b50866f9cde0a67401cb', '5');
INSERT INTO `sys_user_role` VALUES ('74', 'af27c8816506bf1b6705b50866f9cde0a67401cb', '6');
INSERT INTO `sys_user_role` VALUES ('75', 'af27c8816506bf1b6705b50866f9cde0a67401cb', '7');
INSERT INTO `sys_user_role` VALUES ('76', '035390c1-15b8-4146-b1f2-42cba2ddf0e5', '1');
INSERT INTO `sys_user_role` VALUES ('77', '46795ec8-da62-46da-9cd5-1dc4e63ef074', '1');
INSERT INTO `sys_user_role` VALUES ('78', '17e64b09-0100-4a5a-a3b7-bc5f170f4a23', '1');
INSERT INTO `sys_user_role` VALUES ('80', 'b5d6f5bb-45cf-4ea9-aa64-a0fec80243cf', '4');
INSERT INTO `sys_user_role` VALUES ('81', '1f3292e6-a9ae-44db-960e-91d3520556b0', '2');
INSERT INTO `sys_user_role` VALUES ('82', 'bc1c63de-e17f-4a61-bcaf-95058e922081', '2');
INSERT INTO `sys_user_role` VALUES ('83', '4637130095000330675', '4');
INSERT INTO `sys_user_role` VALUES ('84', 'b5c0687f-6234-42e8-ae35-de3792452a69', '2');
INSERT INTO `sys_user_role` VALUES ('85', '7bccf820-0db8-4678-a426-f0203fd1da61', '2');
INSERT INTO `sys_user_role` VALUES ('86', '24cb0b99-c6d3-43e3-9534-43c5cb104e95', '2');
INSERT INTO `sys_user_role` VALUES ('87', '4d72b23c-3912-4bd2-af44-5033267dbd1f', '2');
INSERT INTO `sys_user_role` VALUES ('88', 'da62eed4-e3e5-4014-8e14-f4716fb51c65', '2');
INSERT INTO `sys_user_role` VALUES ('89', '521db4b8-299f-445a-8c94-d0a76dbb05a9', '2');
INSERT INTO `sys_user_role` VALUES ('90', 'ebafbc87-789f-4d6e-b770-8b54901241c6', '2');
INSERT INTO `sys_user_role` VALUES ('91', '9ac266a1-fc32-40c7-b6ae-2f486c5d1a65', '2');
INSERT INTO `sys_user_role` VALUES ('92', 'cd6d58eb-76fd-49f9-9a2f-559403d97ced', '2');
INSERT INTO `sys_user_role` VALUES ('93', '13266176-5491-4b18-aa1e-c490ff53d88d', '2');
INSERT INTO `sys_user_role` VALUES ('94', 'acd2e823-6a2d-4d4c-84ed-b4422d4e7e02', '2');
INSERT INTO `sys_user_role` VALUES ('95', 'acd2e823-6a2d-4d4c-84ed-b4422d4e7e02', '4');
INSERT INTO `sys_user_role` VALUES ('117', 'a82589dd-6464-4028-86d2-2e2471d16ee8', '1');
INSERT INTO `sys_user_role` VALUES ('119', '630fcc8e-a29f-4ccd-8365-bf17740c02a7', '2');
INSERT INTO `sys_user_role` VALUES ('120', '433fa554-5e1d-43f9-97bb-09f8d59d5040', '2');
INSERT INTO `sys_user_role` VALUES ('122', '994121d2-1b39-4107-af8f-050f0935b064', '2');
INSERT INTO `sys_user_role` VALUES ('124', '8aae9e03-ce9f-4efd-b633-57831406f90d', '2');
INSERT INTO `sys_user_role` VALUES ('125', '4637130095000344818', '2');
INSERT INTO `sys_user_role` VALUES ('126', '4637130095000002835', '1');
INSERT INTO `sys_user_role` VALUES ('127', '4637130095000002875', '1');
INSERT INTO `sys_user_role` VALUES ('128', '4637130095000290882', '1');
INSERT INTO `sys_user_role` VALUES ('136', '6c0bdf7d-fdb2-4df8-baee-5e73fe1b5bff', '1');
INSERT INTO `sys_user_role` VALUES ('137', '4637130095000330675', '1');
INSERT INTO `sys_user_role` VALUES ('139', '4637130095000002940', '1');
INSERT INTO `sys_user_role` VALUES ('140', '4637130095000002940', '3');
INSERT INTO `sys_user_role` VALUES ('144', '4637130095000388758', '2');
INSERT INTO `sys_user_role` VALUES ('146', 'b6299edf-4a1e-4bc2-a352-32980e6092de', '1');
INSERT INTO `sys_user_role` VALUES ('147', 'b6299edf-4a1e-4bc2-a352-32980e6092de', '4');
INSERT INTO `sys_user_role` VALUES ('148', 'af27c8816506bf1b6705b50866f9cde0a67401cb', '2');
INSERT INTO `sys_user_role` VALUES ('149', 'af27c8816506bf1b6705b50866f9cde0a67401cb', '2');
INSERT INTO `sys_user_role` VALUES ('150', 'af27c8816506bf1b6705b50866f9cde0a67401cb', '2');
INSERT INTO `sys_user_role` VALUES ('151', 'af27c8816506bf1b6705b50866f9cde0a67401cb', '2');
INSERT INTO `sys_user_role` VALUES ('152', 'af27c8816506bf1b6705b50866f9cde0a67401cb', '2');
INSERT INTO `sys_user_role` VALUES ('153', '4637130095000002940', '1');
INSERT INTO `sys_user_role` VALUES ('154', 'd0e5e4a6-164c-4de7-a08c-f78a6d7b17a9', '1');
INSERT INTO `sys_user_role` VALUES ('155', '098dc01e-34cc-4bac-ad23-98cf27e97a96', '1');
INSERT INTO `sys_user_role` VALUES ('156', '4a8682c4-f0d4-49e1-b704-9703b14d10d2', '2');
INSERT INTO `sys_user_role` VALUES ('157', '9cfc035e-199d-44d8-b0a7-9086cf094e25', '2');
INSERT INTO `sys_user_role` VALUES ('158', '6de60870-66f6-4221-945e-76593efdb065', '2');
INSERT INTO `sys_user_role` VALUES ('159', 'c0e44c56-e1f9-4c7a-9ee6-1eab4396dfdb', '2');
INSERT INTO `sys_user_role` VALUES ('160', '8c67d6a9-fe17-4e8d-b6f1-cbef9fa0fe99', '2');
INSERT INTO `sys_user_role` VALUES ('161', '09e4475f-09e9-4ae8-ade1-d637ba929a74', '2');
INSERT INTO `sys_user_role` VALUES ('162', 'c3d6394a-86dc-4ceb-a808-38f1cf4a6a2f', '2');
INSERT INTO `sys_user_role` VALUES ('163', 'dbbdff40-9011-47b6-be87-6c07a065e9ba', '2');
INSERT INTO `sys_user_role` VALUES ('164', '16af123a-08ab-4cee-9fe3-76ed889c90d4', '2');
INSERT INTO `sys_user_role` VALUES ('165', '4637130095000003432', '1');
INSERT INTO `sys_user_role` VALUES ('166', '4637130095000000098', '1');
INSERT INTO `sys_user_role` VALUES ('167', '4637130095000000098', '3');
INSERT INTO `sys_user_role` VALUES ('168', '4637130095000000098', '8');
INSERT INTO `sys_user_role` VALUES ('169', 'eb2a121e-a960-4432-ad14-5daf0d7e9b95', '2');
INSERT INTO `sys_user_role` VALUES ('170', '4637130095000002940', '1');
INSERT INTO `sys_user_role` VALUES ('171', 'c04f495c-1f15-4851-b098-137d134f83bc', '2');
