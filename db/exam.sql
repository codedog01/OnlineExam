/*
 Navicat MySQL Data Transfer

 Source Server         : 冷澳的阿里云
 Source Server Type    : MySQL
 Source Server Version : 80016
 Source Host           : 121.43.163.177:3306
 Source Schema         : exam

 Target Server Type    : MySQL
 Target Server Version : 80016
 File Encoding         : 65001

 Date: 13/05/2021 19:42:30
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for classes
-- ----------------------------
DROP TABLE IF EXISTS `classes`;
CREATE TABLE `classes`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ins_id` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '学院id',
  `class_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '班级名',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '班级介绍',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '添加者',
  `status` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '状态：0表示正常,1表示弃用',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '添加时间',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `pri1`(`ins_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of classes
-- ----------------------------
INSERT INTO `classes` VALUES (10, 11, '通信工程1班', '2018级通信工程1班', 3, '冷澳澳', 0, '2021-04-26 08:34:18', '2021-04-26 08:34:18');
INSERT INTO `classes` VALUES (11, 9, '软件工程4班', '2018级软件工程4班', 4, '冷澳澳', 0, '2021-04-26 08:34:53', '2021-04-26 08:34:53');
INSERT INTO `classes` VALUES (12, 15, '自动化6班', '2018级自动化6班', 5, '冷澳澳', 0, '2021-04-26 08:35:34', '2021-04-26 08:35:34');
INSERT INTO `classes` VALUES (13, 8, '财务管理3班', '2018级财务管理3班', 6, '冷澳澳', 0, '2021-04-26 08:36:04', '2021-04-26 08:36:04');
INSERT INTO `classes` VALUES (14, 12, '动画8班', '2018级动画8班', 7, '冷澳澳', 0, '2021-04-26 08:36:53', '2021-04-26 08:36:53');
INSERT INTO `classes` VALUES (16, 10, '大数据管理2班', '2018级大数据管理2班', 9, '冷澳澳', 0, '2021-04-26 08:38:18', '2021-04-26 08:38:18');

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `sid` int(11) NULL DEFAULT NULL COMMENT '被评论的文章或者页面的ID(-1:留言板)',
  `user_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评论人的ID',
  `pid` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '父级评论的id',
  `username` varchar(13) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评论人的账号',
  `nickname` varchar(13) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评论人的昵称',
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评论人的头像地址',
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评论人的邮箱地址',
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评论人的网站地址',
  `status` tinyint(1) NULL DEFAULT 0 COMMENT '评论的状态',
  `ip` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评论时的ip',
  `lng` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '经度',
  `lat` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '纬度',
  `address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评论时的地址',
  `os` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评论时的系统类型',
  `os_short_name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评论时的系统的简称',
  `browser` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评论时的浏览器类型',
  `browser_short_name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评论时的浏览器的简称',
  `content` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评论的内容',
  `remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注（审核不通过时添加）',
  `support` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '支持（赞）',
  `oppose` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '反对（踩）',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '添加时间',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `pid`(`pid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES (2, -1, '1000000121366369', NULL, 'lanlan', '赵岚岚', '/img/user-default.png', '', NULL, 1, '183.64.128.82', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '<p>awsl</p>', NULL, 12, 0, '2021-04-27 02:57:21', '2021-04-27 02:57:21');
INSERT INTO `comment` VALUES (3, -1, '1000001949385290', 2, NULL, '冷 澳', 'http://cloudleng.oss-cn-beijing.aliyuncs.com/online_exam/user_photo/lengao.jpg?Expires=1619515340&OSSAccessKeyId=TMP.3Kdsqo2EEyHK726kcsC33jMRFokX1f62GU61yhNgciEfpT9xvohuQnU2kCJb37xwFVVQhSZAiDKLkyFHjeG81v7uhbLToB&Signature=Pk2t%2FVQWw4Jkcro2DfrGQwDxOjE%3D', '841423155@qq.com', NULL, 1, '183.64.128.82', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '<p>支棱起来</p>\r\n', NULL, 0, 0, '2021-04-27 03:00:17', '2021-04-27 03:00:17');
INSERT INTO `comment` VALUES (4, -1, '1000000104321715', NULL, 'taotao', '涛涛涛', '/img/user-default.png', '', NULL, 1, '183.64.128.82', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '<p>加油，当你痛苦的时候，就是成长的时候</p>', NULL, 0, 0, '2021-04-27 03:11:23', '2021-04-27 03:11:23');
INSERT INTO `comment` VALUES (5, -1, '1000000176946191', NULL, '2018211131', '张 波', NULL, '', NULL, 1, '223.104.249.243', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '<p>加油啊！</p>', NULL, 0, 0, '2021-04-28 16:22:31', '2021-04-28 16:22:31');
INSERT INTO `comment` VALUES (6, -1, '1000001949385290', 5, NULL, '冷 澳', 'https://img-blog.csdnimg.cn/20210428091150478.jpg?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80NDg4NDMwNQ==,size_16,color_FFFFFF,t_70#pic_center', '841423155@qq.com', NULL, 1, '223.104.249.243', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '<p>加油</p>\r\n', NULL, 0, 0, '2021-04-28 16:27:36', '2021-04-28 16:27:36');
INSERT INTO `comment` VALUES (9, -1, '1000000176946191', NULL, '2018211131', '张 波', '', '', NULL, 1, '183.64.128.82', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '<p>有人吗？</p>', NULL, 0, 0, '2021-04-29 08:48:07', '2021-04-29 08:48:07');
INSERT INTO `comment` VALUES (10, -1, '1000001949385290', 9, NULL, '冷 澳', 'https://img-blog.csdnimg.cn/20210428091150478.jpg?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80NDg4NDMwNQ==,size_16,color_FFFFFF,t_70#pic_center', '841423155@qq.com', NULL, 1, '183.64.128.82', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '<p>你好！</p>\r\n', NULL, 0, 0, '2021-04-29 08:49:08', '2021-04-29 08:49:08');
INSERT INTO `comment` VALUES (12, -1, '1000001949385290', NULL, 'aoaoao', '冷 澳', 'https://img-blog.csdnimg.cn/20210428091150478.jpg?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80NDg4NDMwNQ==,size_16,color_FFFFFF,t_70#pic_center', '841423155@qq.com', NULL, 2, '183.64.128.82', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '<p>Hello Quer考！</p>', NULL, 0, 0, '2021-04-29 11:55:46', '2021-04-29 11:55:46');

-- ----------------------------
-- Table structure for exam_question
-- ----------------------------
DROP TABLE IF EXISTS `exam_question`;
CREATE TABLE `exam_question`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `exam_id` int(10) UNSIGNED NOT NULL COMMENT '考试ID',
  `question_id` int(10) UNSIGNED NOT NULL COMMENT '考题ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 553 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of exam_question
-- ----------------------------
INSERT INTO `exam_question` VALUES (24, 4, 78);
INSERT INTO `exam_question` VALUES (25, 4, 79);
INSERT INTO `exam_question` VALUES (26, 4, 80);
INSERT INTO `exam_question` VALUES (27, 4, 81);
INSERT INTO `exam_question` VALUES (28, 4, 82);
INSERT INTO `exam_question` VALUES (29, 4, 83);
INSERT INTO `exam_question` VALUES (30, 4, 84);
INSERT INTO `exam_question` VALUES (31, 4, 85);
INSERT INTO `exam_question` VALUES (32, 4, 86);
INSERT INTO `exam_question` VALUES (33, 4, 87);
INSERT INTO `exam_question` VALUES (34, 4, 88);
INSERT INTO `exam_question` VALUES (35, 4, 89);
INSERT INTO `exam_question` VALUES (36, 4, 90);
INSERT INTO `exam_question` VALUES (37, 4, 91);
INSERT INTO `exam_question` VALUES (38, 4, 92);
INSERT INTO `exam_question` VALUES (39, 4, 93);
INSERT INTO `exam_question` VALUES (40, 4, 94);
INSERT INTO `exam_question` VALUES (41, 4, 95);
INSERT INTO `exam_question` VALUES (42, 4, 129);
INSERT INTO `exam_question` VALUES (43, 4, 130);
INSERT INTO `exam_question` VALUES (44, 4, 131);
INSERT INTO `exam_question` VALUES (45, 4, 132);
INSERT INTO `exam_question` VALUES (46, 4, 133);
INSERT INTO `exam_question` VALUES (138, 12, 78);
INSERT INTO `exam_question` VALUES (139, 12, 79);
INSERT INTO `exam_question` VALUES (140, 12, 80);
INSERT INTO `exam_question` VALUES (141, 12, 81);
INSERT INTO `exam_question` VALUES (142, 12, 82);
INSERT INTO `exam_question` VALUES (143, 12, 83);
INSERT INTO `exam_question` VALUES (144, 12, 84);
INSERT INTO `exam_question` VALUES (145, 12, 85);
INSERT INTO `exam_question` VALUES (146, 12, 86);
INSERT INTO `exam_question` VALUES (147, 12, 87);
INSERT INTO `exam_question` VALUES (148, 13, 79);
INSERT INTO `exam_question` VALUES (149, 13, 80);
INSERT INTO `exam_question` VALUES (150, 13, 81);
INSERT INTO `exam_question` VALUES (151, 13, 82);
INSERT INTO `exam_question` VALUES (152, 13, 83);
INSERT INTO `exam_question` VALUES (153, 13, 84);
INSERT INTO `exam_question` VALUES (154, 13, 85);
INSERT INTO `exam_question` VALUES (155, 13, 86);
INSERT INTO `exam_question` VALUES (156, 13, 87);
INSERT INTO `exam_question` VALUES (157, 13, 78);
INSERT INTO `exam_question` VALUES (158, 14, 78);
INSERT INTO `exam_question` VALUES (159, 14, 79);
INSERT INTO `exam_question` VALUES (160, 14, 80);
INSERT INTO `exam_question` VALUES (161, 14, 81);
INSERT INTO `exam_question` VALUES (162, 14, 82);
INSERT INTO `exam_question` VALUES (163, 14, 83);
INSERT INTO `exam_question` VALUES (164, 14, 84);
INSERT INTO `exam_question` VALUES (165, 14, 85);
INSERT INTO `exam_question` VALUES (166, 14, 86);
INSERT INTO `exam_question` VALUES (167, 14, 87);
INSERT INTO `exam_question` VALUES (168, 15, 78);
INSERT INTO `exam_question` VALUES (169, 15, 79);
INSERT INTO `exam_question` VALUES (170, 15, 80);
INSERT INTO `exam_question` VALUES (171, 15, 81);
INSERT INTO `exam_question` VALUES (172, 15, 82);
INSERT INTO `exam_question` VALUES (173, 15, 83);
INSERT INTO `exam_question` VALUES (174, 15, 84);
INSERT INTO `exam_question` VALUES (175, 15, 85);
INSERT INTO `exam_question` VALUES (176, 15, 86);
INSERT INTO `exam_question` VALUES (177, 15, 87);
INSERT INTO `exam_question` VALUES (205, 20, 78);
INSERT INTO `exam_question` VALUES (206, 20, 79);
INSERT INTO `exam_question` VALUES (207, 20, 80);
INSERT INTO `exam_question` VALUES (208, 20, 81);
INSERT INTO `exam_question` VALUES (209, 20, 82);
INSERT INTO `exam_question` VALUES (210, 20, 83);
INSERT INTO `exam_question` VALUES (211, 20, 84);
INSERT INTO `exam_question` VALUES (212, 20, 85);
INSERT INTO `exam_question` VALUES (213, 20, 86);
INSERT INTO `exam_question` VALUES (214, 20, 87);
INSERT INTO `exam_question` VALUES (298, 30, 78);
INSERT INTO `exam_question` VALUES (299, 30, 79);
INSERT INTO `exam_question` VALUES (300, 30, 80);
INSERT INTO `exam_question` VALUES (301, 30, 81);
INSERT INTO `exam_question` VALUES (302, 30, 82);
INSERT INTO `exam_question` VALUES (303, 30, 83);
INSERT INTO `exam_question` VALUES (304, 30, 91);
INSERT INTO `exam_question` VALUES (305, 30, 92);
INSERT INTO `exam_question` VALUES (306, 30, 93);
INSERT INTO `exam_question` VALUES (307, 30, 94);
INSERT INTO `exam_question` VALUES (309, 32, 84);
INSERT INTO `exam_question` VALUES (310, 32, 85);
INSERT INTO `exam_question` VALUES (311, 33, 87);
INSERT INTO `exam_question` VALUES (312, 33, 88);

-- ----------------------------
-- Table structure for examination
-- ----------------------------
DROP TABLE IF EXISTS `examination`;
CREATE TABLE `examination`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '考试标题',
  `user_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户ID',
  `author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '作者',
  `grade` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '年级',
  `total_score` int(11) NULL DEFAULT NULL COMMENT '考试总分',
  `class_id` int(11) NULL DEFAULT NULL COMMENT '班级id',
  `subject_id` int(11) NULL DEFAULT NULL COMMENT '学科ID',
  `create_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `start_time` timestamp(0) NULL DEFAULT NULL COMMENT '考试开始时间',
  `end_time` timestamp(0) NULL DEFAULT NULL COMMENT '考试结束时间',
  `status` int(11) NULL DEFAULT 0 COMMENT '进行状态:0表示未开始,1表示进行中,2表示考试已经结束,3表示该考试已经完成批卷',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 56 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of examination
-- ----------------------------
INSERT INTO `examination` VALUES (30, 'C语言程序设计', '1000001949385290', '冷 澳', '2018', 19, 11, 1, '2021-04-28 06:39:20', '2021-04-28 10:39:40', '2021-04-28 06:39:00', '2021-04-28 10:35:00', 2);
INSERT INTO `examination` VALUES (32, '数据库', '1000001949385290', '冷 澳', '2018', 4, 11, 3, '2021-04-28 11:51:56', '2021-05-02 07:58:42', '2021-04-30 12:55:00', '2021-04-30 14:50:00', 2);
INSERT INTO `examination` VALUES (33, 'Python程序设计', '1000001949385290', '冷 澳', '2018', 4, 11, 6, '2021-04-28 11:53:07', '2021-05-02 07:58:42', '2021-05-01 11:50:00', '2021-05-01 14:30:00', 2);

-- ----------------------------
-- Table structure for grade
-- ----------------------------
DROP TABLE IF EXISTS `grade`;
CREATE TABLE `grade`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `user_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '考生主键ID',
  `exam_id` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '考试主键ID',
  `result` int(11) NULL DEFAULT 0 COMMENT '最终分数',
  `auto_result` int(11) NULL DEFAULT 0 COMMENT '电脑自动评判选择题分数',
  `manul_result` int(11) NULL DEFAULT NULL COMMENT '人工手动评判分数',
  `auto_json` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '考生选择题答案json',
  `manul_json` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '考生问答题答案json',
  `answer_json` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '考生作答答案json',
  `create_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '考试交卷时间',
  `update_time` timestamp(0) NULL DEFAULT NULL COMMENT '改卷完成时间',
  `status` int(11) NULL DEFAULT 0 COMMENT '0未评卷,1及格2不及格3良好4优秀',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 64 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of grade
-- ----------------------------
INSERT INTO `grade` VALUES (1, '1', '4', 2, 2, 0, 'A~_~B~_~B~_~~_~null~_~B~_~null~_~null~_~null~_~null~_~null~_~~_~~_~~_~null~_~', '~_~~_~~_~~_~~_~null~_~null~_~erewrf~_~', 'A~_~B~_~B~_~~_~null~_~B~_~null~_~null~_~null~_~null~_~null~_~~_~~_~~_~~_~~_~~_~~_~~_~null~_~null~_~null~_~erewrf', '2019-06-12 21:22:35', '2019-06-12 21:22:35', 0);
INSERT INTO `grade` VALUES (2, '1000001016959144', '11', 0, 0, 0, '~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~', 'null~_~null~_~null~_~', '~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null', '2021-04-26 06:40:42', '2021-04-26 06:40:42', 0);
INSERT INTO `grade` VALUES (3, '1000001016959144', '10', 0, 0, 0, '~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~', 'null~_~null~_~null~_~', '~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null', '2021-04-26 06:48:32', '2021-04-26 06:48:32', 0);
INSERT INTO `grade` VALUES (4, '1000001016959144', '9', 0, 0, 0, '~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~', 'null~_~null~_~null~_~', '~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null', '2021-04-26 06:59:58', '2021-04-26 06:59:58', 0);
INSERT INTO `grade` VALUES (5, '1000001016959144', '8', 0, 0, 0, '~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~', 'null~_~null~_~null~_~', '~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null', '2021-04-26 13:51:45', '2021-04-26 13:51:45', 0);
INSERT INTO `grade` VALUES (6, '1000001016959144', '8', 0, 0, 0, '~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~', 'null~_~null~_~null~_~', '~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null', '2021-04-26 13:51:46', '2021-04-26 13:51:46', 0);
INSERT INTO `grade` VALUES (7, '1000001016959144', '7', 0, 0, 0, '~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~', 'null~_~null~_~null~_~', '~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null', '2021-04-26 14:01:09', '2021-04-26 14:01:09', 0);
INSERT INTO `grade` VALUES (8, '1000001016959144', '6', 0, 0, 0, '~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~', 'null~_~null~_~null~_~', '~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null', '2021-04-26 14:03:39', '2021-04-26 14:03:39', 0);
INSERT INTO `grade` VALUES (9, '1000001016959144', '6', 0, 0, 0, '~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~', 'null~_~null~_~null~_~', '~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null', '2021-04-26 14:04:28', '2021-04-26 14:04:28', 0);
INSERT INTO `grade` VALUES (10, '1000001016959144', '5', 0, 0, 0, '~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~', 'null~_~null~_~null~_~', '~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null', '2021-04-26 14:15:14', '2021-04-26 14:15:14', 0);
INSERT INTO `grade` VALUES (11, '1000001016959144', '5', 0, 0, 0, '~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~', 'null~_~null~_~null~_~', '~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null', '2021-04-26 14:19:59', '2021-04-26 14:19:59', 0);
INSERT INTO `grade` VALUES (12, '1000001016959144', '15', 0, 0, 0, '~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~', '', '~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null', '2021-04-26 14:33:58', '2021-04-26 14:33:58', 0);
INSERT INTO `grade` VALUES (13, '1000001949385290', '16', 0, 0, 0, '~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~', '', '~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null', '2021-04-27 01:06:27', '2021-04-27 01:06:27', 0);
INSERT INTO `grade` VALUES (14, '1000000176946191', '16', 0, 0, 0, '~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~', '', '~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null', '2021-04-27 02:37:51', '2021-04-27 02:37:51', 0);
INSERT INTO `grade` VALUES (15, '1000001949385290', '17', 1, 0, 0, '~_~null~_~null~_~null~_~null~_~', '', '~_~null~_~null~_~null~_~null', '2021-04-27 02:42:08', '2021-04-27 02:42:08', 0);
INSERT INTO `grade` VALUES (16, '1000001949385290', '18', 0, 0, 0, '~_~null~_~', '', '~_~null', '2021-04-27 02:45:33', '2021-04-27 02:45:33', 0);
INSERT INTO `grade` VALUES (17, '1000001949385290', '18', 0, 0, 0, '~_~null~_~', '', '~_~null', '2021-04-27 02:45:33', '2021-04-27 02:45:33', 0);
INSERT INTO `grade` VALUES (18, '1000000104321715', '17', 0, 0, 0, '~_~null~_~null~_~null~_~null~_~', '', '~_~null~_~null~_~null~_~null', '2021-04-27 02:46:01', '2021-04-27 02:46:01', 0);
INSERT INTO `grade` VALUES (19, '1000000104321715', '18', 0, 0, 0, '~_~null~_~', '', '~_~null', '2021-04-27 02:52:59', '2021-04-27 02:52:59', 0);
INSERT INTO `grade` VALUES (20, '1000000104321715', '18', 0, 0, 0, '~_~null~_~', '', '~_~null', '2021-04-27 02:53:00', '2021-04-27 02:53:00', 0);
INSERT INTO `grade` VALUES (21, '1000000121366369', '16', 0, 0, 0, '~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~', '', '~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null', '2021-04-27 02:55:41', '2021-04-27 02:55:41', 0);
INSERT INTO `grade` VALUES (22, '1000000121366369', '16', 0, 0, 0, '~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~', '', '~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null', '2021-04-27 02:55:41', '2021-04-27 02:55:41', 0);
INSERT INTO `grade` VALUES (23, '1000000121366369', '18', 0, 0, 0, 'A~_~null~_~', '', 'A~_~null', '2021-04-27 02:56:03', '2021-04-27 02:56:03', 0);
INSERT INTO `grade` VALUES (24, '1000000121366369', '18', 0, 0, 0, 'A~_~null~_~', '', 'A~_~null', '2021-04-27 02:56:03', '2021-04-27 02:56:03', 0);
INSERT INTO `grade` VALUES (25, '1000000121366369', '17', 0, 0, 0, '~_~null~_~null~_~null~_~null~_~', '', '~_~null~_~null~_~null~_~null', '2021-04-27 02:56:20', '2021-04-27 02:56:20', 0);
INSERT INTO `grade` VALUES (26, '1000000121366369', '17', 0, 0, 0, '~_~null~_~null~_~null~_~null~_~', '', '~_~null~_~null~_~null~_~null', '2021-04-27 02:56:21', '2021-04-27 02:56:21', 0);
INSERT INTO `grade` VALUES (27, '1000000104321715', '19', 0, 0, 0, '~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~', '', '~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null', '2021-04-27 03:09:31', '2021-04-27 03:09:31', 0);
INSERT INTO `grade` VALUES (28, '1000000104321715', '19', 0, 0, 0, '~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~', '', '~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null', '2021-04-27 03:09:31', '2021-04-27 03:09:31', 0);
INSERT INTO `grade` VALUES (29, '1000000176946191', '20', 0, 0, 0, '~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~', '', '~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null', '2021-04-27 09:20:47', '2021-04-27 09:20:47', 0);
INSERT INTO `grade` VALUES (30, '1000000176946191', '20', 0, 0, 0, '~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~', '', '~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null', '2021-04-27 09:20:48', '2021-04-27 09:20:48', 0);
INSERT INTO `grade` VALUES (31, '1000000104321715', '20', 0, 0, 0, '~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~', '', '~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null', '2021-04-27 09:26:43', '2021-04-27 09:26:43', 0);
INSERT INTO `grade` VALUES (32, '1000000104321715', '20', 0, 0, 0, '~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~', '', '~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null', '2021-04-27 09:26:43', '2021-04-27 09:26:43', 0);
INSERT INTO `grade` VALUES (33, '1000001949385290', '37', 2, 2, 0, 'C~_~A~_~B~_~B~_~C~_~null~_~null~_~null~_~', '~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~', 'C~_~A~_~B~_~B~_~C~_~null~_~~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null', '2021-04-28 15:11:39', '2021-04-28 15:11:39', 0);
INSERT INTO `grade` VALUES (34, '1000000176946191', '37', 0, 0, 0, 'A~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~', 'null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~', 'A~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null', '2021-04-28 15:13:52', '2021-04-28 15:13:52', 0);
INSERT INTO `grade` VALUES (35, '1000000176946191', '38', 0, 0, 0, '~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~', 'null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~', '~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null', '2021-04-28 15:14:13', '2021-04-28 15:14:13', 0);
INSERT INTO `grade` VALUES (36, '1000001949385290', '39', 0, 0, 0, '~_~', '', '', '2021-04-28 15:16:45', '2021-04-28 15:16:45', 0);
INSERT INTO `grade` VALUES (37, '1000000104321715', '40', 0, 0, 0, '~_~null~_~null~_~', '', '~_~null~_~null', '2021-04-29 07:07:30', '2021-04-29 07:07:30', 0);
INSERT INTO `grade` VALUES (38, '1000001949385290', '41', 0, 0, 0, '~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~', '', '~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null', '2021-04-29 09:14:20', '2021-04-29 09:14:20', 0);
INSERT INTO `grade` VALUES (39, '1000001949385290', '42', 0, 0, 0, '~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~', 'null~_~null~_~null~_~null~_~', '~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null', '2021-04-29 09:20:18', '2021-04-29 09:20:18', 0);
INSERT INTO `grade` VALUES (40, '1000001949385290', '43', 0, 0, 0, '~_~null~_~null~_~null~_~null~_~null~_~', 'null~_~null~_~null~_~null~_~', '~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null', '2021-04-29 09:51:02', '2021-04-29 09:51:02', 0);
INSERT INTO `grade` VALUES (41, '1000001949385290', '43', 0, 0, 0, '~_~null~_~null~_~null~_~null~_~null~_~', 'null~_~null~_~null~_~null~_~', '~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null', '2021-04-29 09:51:03', '2021-04-29 09:51:03', 0);
INSERT INTO `grade` VALUES (42, '1000001949385290', '40', 0, 0, 0, '~_~null~_~null~_~', '', '~_~null~_~null', '2021-04-29 09:55:58', '2021-04-29 09:55:58', 0);
INSERT INTO `grade` VALUES (43, '1000001949385290', '40', 0, 0, 0, '~_~null~_~null~_~', '', '~_~null~_~null', '2021-04-29 09:55:59', '2021-04-29 09:55:59', 0);
INSERT INTO `grade` VALUES (44, '1000001949385290', '45', 0, 0, 0, 'A~_~null~_~null~_~null~_~null~_~null~_~null~_~', 'null~_~null~_~null~_~null~_~', 'A~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null', '2021-04-29 11:48:37', '2021-04-29 11:48:37', 0);
INSERT INTO `grade` VALUES (45, '1000001949385290', '45', 0, 0, 0, '~_~null~_~null~_~null~_~null~_~null~_~null~_~', 'null~_~null~_~null~_~null~_~', '~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null', '2021-04-29 11:48:40', '2021-04-29 11:48:40', 0);
INSERT INTO `grade` VALUES (46, '1000001949385290', '46', 0, 0, 0, '~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~', 'null~_~null~_~', '~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null', '2021-04-29 11:51:46', '2021-04-29 11:51:46', 0);
INSERT INTO `grade` VALUES (47, '1000001949385290', '47', 0, 0, 0, '~_~null~_~null~_~null~_~null~_~null~_~', 'null~_~null~_~null~_~null~_~', '~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null', '2021-04-29 12:09:30', '2021-04-29 12:09:30', 0);
INSERT INTO `grade` VALUES (48, '1000001949385290', '48', 0, 0, 0, '~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~', 'null~_~null~_~null~_~null~_~', '~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null', '2021-04-29 12:21:01', '2021-04-29 12:21:01', 0);
INSERT INTO `grade` VALUES (49, '1000001949385290', '49', 0, 0, 0, 'null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~', '~_~null~_~null~_~null~_~', '~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null', '2021-04-29 12:26:11', '2021-04-29 12:26:11', 0);
INSERT INTO `grade` VALUES (50, '1000001949385290', '49', 0, 0, 0, 'null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~', '~_~null~_~null~_~null~_~', '~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null', '2021-04-29 12:26:12', '2021-04-29 12:26:12', 0);
INSERT INTO `grade` VALUES (51, '1000001949385290', '50', 0, 0, 0, '~_~null~_~null~_~null~_~null~_~null~_~', 'null~_~null~_~null~_~null~_~', '~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null', '2021-04-29 12:29:08', '2021-04-29 12:29:08', 0);
INSERT INTO `grade` VALUES (52, '1000001949385290', '50', 0, 0, 0, '~_~null~_~null~_~null~_~null~_~null~_~', 'null~_~null~_~null~_~null~_~', '~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null', '2021-04-29 12:29:10', '2021-04-29 12:29:10', 0);
INSERT INTO `grade` VALUES (53, '1000001949385290', '50', 0, 0, 0, '~_~null~_~null~_~null~_~null~_~null~_~', 'null~_~null~_~null~_~null~_~', '~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null', '2021-04-29 12:29:11', '2021-04-29 12:29:11', 0);
INSERT INTO `grade` VALUES (54, '1000001949385290', '51', 0, 0, 0, '~_~null~_~null~_~null~_~null~_~null~_~', 'null~_~null~_~null~_~null~_~', '~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null', '2021-04-29 12:34:53', '2021-04-29 12:34:53', 0);
INSERT INTO `grade` VALUES (55, '1000001949385290', '52', 0, 0, 0, '~_~null~_~null~_~null~_~null~_~null~_~', 'null~_~null~_~null~_~null~_~', '~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null', '2021-04-29 12:37:27', '2021-04-29 12:37:27', 0);
INSERT INTO `grade` VALUES (56, '1000001949385290', '53', 0, 0, 0, 'B~_~', '', 'B', '2021-04-29 13:20:38', '2021-04-29 13:20:38', 0);
INSERT INTO `grade` VALUES (57, '1000001949385290', '54', 0, 0, 0, '~_~null~_~null~_~null~_~null~_~null~_~', 'null~_~null~_~null~_~null~_~', '~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null', '2021-04-29 13:41:41', '2021-04-29 13:41:41', 0);
INSERT INTO `grade` VALUES (58, '1000000121366369', '55', 0, 0, 0, '~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~', 'null~_~null~_~', '~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null', '2021-05-05 06:07:54', '2021-05-05 06:07:54', 0);
INSERT INTO `grade` VALUES (59, '1000000121366369', '55', 0, 0, 0, '~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~', 'null~_~null~_~', '~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null', '2021-05-05 06:07:54', '2021-05-05 06:07:54', 0);
INSERT INTO `grade` VALUES (60, '1000000121366369', '55', 0, 0, 0, '~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~', 'null~_~null~_~', '~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null', '2021-05-05 06:09:19', '2021-05-05 06:09:19', 0);
INSERT INTO `grade` VALUES (61, '1000000121366369', '55', 0, 0, 0, '~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~', 'null~_~null~_~', '~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null', '2021-05-05 06:09:19', '2021-05-05 06:09:19', 0);
INSERT INTO `grade` VALUES (62, '1000000121366369', '55', 0, 0, 0, '~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~', 'null~_~null~_~', '~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null', '2021-05-05 06:10:16', '2021-05-05 06:10:16', 0);
INSERT INTO `grade` VALUES (63, '1000000121366369', '55', 0, 0, 0, '~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~', 'null~_~null~_~', '~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null~_~null', '2021-05-05 06:10:16', '2021-05-05 06:10:16', 0);

-- ----------------------------
-- Table structure for institute
-- ----------------------------
DROP TABLE IF EXISTS `institute`;
CREATE TABLE `institute`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `institute_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '学院名',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学院介绍',
  `institute_logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学院Logo图片地址',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '添加者',
  `status` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '状态：0正常1弃用',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '添加时间',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of institute
-- ----------------------------
INSERT INTO `institute` VALUES (8, '淬炼商学院', '淬炼商学院', 'https://img-blog.csdnimg.cn/20210425091705737.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80NTIzODc2MQ==,size_16,color_FFFFFF,t_70', 2, '冷澳澳', 0, '2021-04-26 07:13:20', '2021-04-26 07:13:20');
INSERT INTO `institute` VALUES (9, '大数据与软件学院', '大数据与软件学院', 'https://img-blog.csdnimg.cn/20210425091736796.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80NTIzODc2MQ==,size_16,color_FFFFFF,t_70', 3, '冷澳澳', 0, '2021-04-26 07:13:49', '2021-04-26 07:13:49');
INSERT INTO `institute` VALUES (10, '管理工程系', '管理工程系', 'https://img-blog.csdnimg.cn/20210425091737360.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80NTIzODc2MQ==,size_16,color_FFFFFF,t_70', 4, '冷澳澳', 0, '2021-04-26 07:14:13', '2021-04-26 07:14:13');
INSERT INTO `institute` VALUES (11, '通信与物联网工程学院', '通信与物联网工程学院', 'https://img-blog.csdnimg.cn/20210425091737683.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80NTIzODc2MQ==,size_16,color_FFFFFF,t_70', 5, '冷澳澳', 0, '2021-04-26 07:14:46', '2021-04-26 07:14:46');
INSERT INTO `institute` VALUES (12, '艺术传媒学院', '艺术传媒学院', 'https://img-blog.csdnimg.cn/20210425091737788.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80NTIzODc2MQ==,size_16,color_FFFFFF,t_70', 6, '冷澳澳', 0, '2021-04-26 07:15:35', '2021-04-26 07:15:35');
INSERT INTO `institute` VALUES (14, '中德应用技术学院', '中德应用技术学院', 'https://img-blog.csdnimg.cn/20210425091737958.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80NTIzODc2MQ==,size_16,color_FFFFFF,t_70', 8, '冷澳澳', 0, '2021-04-26 07:17:18', '2021-04-26 07:17:18');
INSERT INTO `institute` VALUES (15, '智能工程学院', '智能工程学院', 'https://img-blog.csdnimg.cn/20210425091738222.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80NTIzODc2MQ==,size_16,color_FFFFFF,t_70', 9, '冷澳澳', 0, '2021-04-26 07:18:05', '2021-04-26 07:18:05');
INSERT INTO `institute` VALUES (22, '外国语学院', '外国语学院', 'https://img-blog.csdnimg.cn/20210425091738222.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80NTIzODc2MQ==,size_16,color_FFFFFF,t_70', 1, '冷 澳', 0, '2021-04-29 01:32:24', '2021-04-29 01:32:24');

-- ----------------------------
-- Table structure for link
-- ----------------------------
DROP TABLE IF EXISTS `link`;
CREATE TABLE `link`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '链接名',
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '链接地址',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '链接介绍',
  `img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '友链图片地址',
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '友链站长邮箱',
  `qq` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '友链站长qq',
  `status` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '状态',
  `origin` int(11) NULL DEFAULT NULL COMMENT '1-管理员添加 2-自助申请',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '添加时间',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of link
-- ----------------------------
INSERT INTO `link` VALUES (1, '中国大学生计算机设计大赛官网', 'http://jsjds.ruc.edu.cn/', '中国大学生计算机设计大赛网址', '', '', '', 1, 1, '', '2018-09-13 23:24:25', '2021-04-26 07:21:48');
INSERT INTO `link` VALUES (3, 'GitHub开源项目托管平台', 'https://www.github.com/', 'GitHub是一个面向开源及私有软件项目的托管平台', '', '', '', 1, 1, '', '2019-05-14 20:23:57', '2019-05-15 18:22:14');
INSERT INTO `link` VALUES (4, 'HumbleTao的博客', 'https://humbletao.blog.csdn.net/', 'Humble涛的个人博客', '', '', '', 1, 1, '', '2021-04-26 07:20:30', '2021-04-26 09:37:07');

-- ----------------------------
-- Table structure for love
-- ----------------------------
DROP TABLE IF EXISTS `love`;
CREATE TABLE `love`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `sup_id` int(11) NULL DEFAULT NULL COMMENT '点赞的编号',
  `love_type` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '点赞的类型： 0评论1其他',
  `user_id` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户编号',
  `user_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户ip',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of love
-- ----------------------------

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permission_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '权限id',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '权限名称',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限描述',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限访问路径',
  `perms` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `parent_id` int(11) NULL DEFAULT NULL COMMENT '父级权限id',
  `type` int(11) NULL DEFAULT NULL COMMENT '类型   0：目录   1：菜单   2：按钮',
  `order_num` int(11) NULL DEFAULT 0 COMMENT '排序',
  `icon` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图标',
  `status` int(11) NOT NULL COMMENT '状态：1有效；2删除',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 135 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES (1, '1', '管理桌面', '工作台', '/workdest', 'workdest', 0, 1, 1, 'fa fa-windows', 1, '2017-09-27 21:22:02', '2019-04-15 18:58:46');
INSERT INTO `permission` VALUES (2, '2', '权限管理', '权限管理', NULL, NULL, 0, 0, 3, 'fa fa-sitemap', 1, '2017-07-13 15:04:42', '2019-04-11 20:41:58');
INSERT INTO `permission` VALUES (3, '201', '用户管理', '用户管理', '/users', 'users', 2, 1, 3, 'fa fa-circle-o', 1, '2017-07-13 15:05:47', '2019-04-13 15:38:06');
INSERT INTO `permission` VALUES (4, '20101', '列表查询', '用户列表查询', '/user/list', 'user:list', 3, 2, 0, NULL, 1, '2017-07-13 15:09:24', '2017-10-09 05:38:29');
INSERT INTO `permission` VALUES (5, '20102', '新增', '新增用户', '/user/add', 'user:add', 3, 2, 0, NULL, 1, '2017-07-13 15:06:50', '2018-02-28 17:58:46');
INSERT INTO `permission` VALUES (6, '20103', '编辑', '编辑用户', '/user/edit', 'user:edit', 3, 2, 0, NULL, 1, '2017-07-13 15:08:03', '2018-02-27 10:53:14');
INSERT INTO `permission` VALUES (7, '20104', '删除', '删除用户', '/user/delete', 'user:delete', 3, 2, 0, NULL, 1, '2017-07-13 15:08:42', '2018-02-27 10:53:14');
INSERT INTO `permission` VALUES (8, '20105', '批量删除', '批量删除用户', '/user/batch/delete', 'user:batchDelete', 3, 2, 0, '', 1, '2018-07-11 01:53:09', '2018-07-11 01:53:09');
INSERT INTO `permission` VALUES (9, '20106', '分配角色', '分配角色', '/user/assign/role', 'user:assignRole', 3, 2, 0, NULL, 1, '2017-07-13 15:09:24', '2017-10-09 05:38:29');
INSERT INTO `permission` VALUES (10, '202', '角色管理', '角色管理', '/roles', 'roles', 2, 1, 4, 'fa fa-circle-o', 1, '2017-07-17 14:39:09', '2019-04-13 15:37:53');
INSERT INTO `permission` VALUES (11, '20201', '列表查询', '角色列表查询', '/role/list', 'role:list', 10, 2, 0, NULL, 1, '2017-10-10 15:31:36', '2018-02-27 10:53:14');
INSERT INTO `permission` VALUES (12, '20202', '新增', '新增角色', '/role/add', 'role:add', 10, 2, 0, NULL, 1, '2017-07-17 14:39:46', '2018-02-27 10:53:14');
INSERT INTO `permission` VALUES (13, '20203', '编辑', '编辑角色', '/role/edit', 'role:edit', 10, 2, 0, NULL, 1, '2017-07-17 14:40:15', '2018-02-27 10:53:14');
INSERT INTO `permission` VALUES (14, '20204', '删除', '删除角色', '/role/delete', 'role:delete', 10, 2, 0, NULL, 1, '2017-07-17 14:40:57', '2018-02-27 10:53:14');
INSERT INTO `permission` VALUES (15, '20205', '批量删除', '批量删除角色', '/role/batch/delete', 'role:batchDelete', 10, 2, 0, '', 1, '2018-07-10 22:20:43', '2018-07-10 22:20:43');
INSERT INTO `permission` VALUES (16, '20206', '分配权限', '分配权限', '/role/assign/permission', 'role:assignPerms', 10, 2, 0, NULL, 1, '2017-09-26 07:33:05', '2018-02-27 10:53:14');
INSERT INTO `permission` VALUES (17, '203', '资源管理', '资源管理', '/permissions', 'permissions', 2, 1, 5, 'fa fa-circle-o', 1, '2017-09-26 07:33:51', '2019-04-13 15:37:46');
INSERT INTO `permission` VALUES (18, '20301', '列表查询', '资源列表', '/permission/list', 'permission:list', 17, 2, 0, NULL, 1, '2018-07-12 16:25:28', '2018-07-12 16:25:33');
INSERT INTO `permission` VALUES (19, '20302', '新增', '新增资源', '/permission/add', 'permission:add', 17, 2, 0, NULL, 1, '2017-09-26 08:06:58', '2018-02-27 10:53:14');
INSERT INTO `permission` VALUES (20, '20303', '编辑', '编辑资源', '/permission/edit', 'permission:edit', 17, 2, 0, NULL, 1, '2017-09-27 21:29:04', '2018-02-27 10:53:14');
INSERT INTO `permission` VALUES (21, '20304', '删除', '删除资源', '/permission/delete', 'permission:delete', 17, 2, 0, NULL, 1, '2017-09-27 21:29:50', '2018-02-27 10:53:14');
INSERT INTO `permission` VALUES (22, '3', '运维管理', '运维管理', NULL, NULL, 0, 0, 7, 'fa f fa-database', 1, '2018-07-06 15:19:26', '2019-02-01 01:32:49');
INSERT INTO `permission` VALUES (23, '301', '数据监控', '数据监控', '/database/monitoring', 'database', 22, 1, 1, 'fa fa-circle-o', 1, '2018-07-06 15:19:55', '2018-07-06 15:19:55');
INSERT INTO `permission` VALUES (24, '4', '系统管理', '系统管理', NULL, NULL, 0, 0, 5, 'fa fa-th-list', 1, '2018-07-06 15:20:38', '2018-07-24 15:42:28');
INSERT INTO `permission` VALUES (25, '401', '在线用户', '在线用户', '/online/users', 'onlineUsers', 24, 1, 1, 'fa fa-circle-o', 1, '2018-07-06 15:21:00', '2018-07-24 14:58:22');
INSERT INTO `permission` VALUES (32, '1000001992372345', '在线用户查询', '在线用户查询', '/online/user/list', 'onlineUser:list', 25, 2, 0, '', 1, '2018-07-24 15:02:23', '2018-07-24 15:02:23');
INSERT INTO `permission` VALUES (33, '1000002083579304', '踢出用户', '踢出用户', '/online/user/kickout', 'onlineUser:kickout', 25, 2, 0, '', 1, '2018-07-24 15:03:16', '2018-07-24 15:03:16');
INSERT INTO `permission` VALUES (34, '1000000171409776', '批量踢出', '批量踢出', '/online/user/batch/kickout', 'onlineUser:batchKickout', 25, 2, 0, '', 1, '2018-07-24 15:04:09', '2018-07-24 15:04:09');
INSERT INTO `permission` VALUES (35, '1000000863853891', '网站管理', '网站管理', NULL, NULL, 0, 0, 4, 'fa fa-users', 1, '2018-07-24 15:44:23', '2019-04-11 20:42:05');
INSERT INTO `permission` VALUES (36, '1000001264798222', '基础信息', '基础设置', '/siteinfo', 'siteinfo', 35, 1, 1, 'fa fa-circle-o', 1, '2018-07-24 15:48:13', '2018-07-24 17:43:39');
INSERT INTO `permission` VALUES (37, '1000000432183856', '保存', '基础设置-保存', '/siteinfo/save', 'siteinfo:save', 36, 2, 0, '', 1, '2018-07-24 15:49:12', '2018-07-24 15:49:12');
INSERT INTO `permission` VALUES (38, '1000001792841328', '系统公告', '系统公告', '/notifies', 'notifies', 35, 1, 2, 'fa fa-circle-o', 0, '2018-07-24 23:40:45', '2018-09-13 12:34:18');
INSERT INTO `permission` VALUES (39, '1000001351219537', '查询', '系统公告-查询', '/notify/list', 'notify:list', 38, 2, 0, '', 0, '2018-07-24 23:41:30', '2018-09-13 12:33:19');
INSERT INTO `permission` VALUES (40, '1000000791685519', '新增', '系统公告-新增', '/notify/add', 'notify:add', 38, 2, 0, '', 0, '2018-07-24 23:42:20', '2018-09-13 12:33:26');
INSERT INTO `permission` VALUES (42, '1000001531648485', '编辑', '系统公告-编辑', '/notify/edit', 'notify:edit', 38, 2, 0, '', 0, '2018-07-24 23:44:39', '2018-09-13 12:33:52');
INSERT INTO `permission` VALUES (43, '1000001548165826', '删除', '系统公告-删除', '/notify/delete', 'notify:delete', 38, 2, 0, '', 0, '2018-07-24 23:45:27', '2018-09-13 12:33:57');
INSERT INTO `permission` VALUES (44, '1000001530229707', '批量删除', '批量删除公告', '/notify/batch/delete', 'notify:batchDelete', 38, 2, 0, '', 0, '2018-07-24 23:46:25', '2018-09-13 12:34:02');
INSERT INTO `permission` VALUES (45, '1000000237721285', '友链管理', '友情链接', '/links', 'links', 35, 1, 3, 'fa fa-circle-o', 1, '2018-07-25 11:05:49', '2018-07-25 11:07:03');
INSERT INTO `permission` VALUES (46, '1000001238193773', '查询', '友链-查询', '/link/list', 'link:list', 45, 2, 0, '', 1, '2018-07-25 11:06:44', '2018-07-25 11:06:44');
INSERT INTO `permission` VALUES (47, '1000001305005793', '新增', '友链-新增', '/link/add', 'link:add', 45, 2, 0, '', 1, '2018-07-25 11:07:46', '2018-07-25 11:07:46');
INSERT INTO `permission` VALUES (48, '1000001679037501', '编辑', '友链-编辑', '/link/edit', 'link:edit', 45, 2, 0, '', 1, '2018-07-25 11:08:21', '2018-07-25 11:08:21');
INSERT INTO `permission` VALUES (49, '1000001011730177', '删除', '友链-删除', '/link/delete', 'link:delete', 45, 2, 0, '', 1, '2018-07-25 11:08:53', '2018-07-25 11:08:53');
INSERT INTO `permission` VALUES (50, '1000001312374743', '批量删除', '友链-批量删除', '/link/batch/delete', 'link:batchDelete', 45, 2, 0, '', 1, '2018-07-25 11:09:40', '2018-07-25 11:09:40');
INSERT INTO `permission` VALUES (51, '1000001507480127', '审核', '友链-审核', '/link/audit', 'link:audit', 45, 2, 0, '', 1, '2018-07-25 11:42:28', '2018-07-25 11:42:28');
INSERT INTO `permission` VALUES (52, '1000000602555213', '考试管理', '考试管理', NULL, NULL, 0, 0, 2, 'fa fa-institution', 1, '2018-07-25 17:43:12', '2019-02-01 01:33:39');
INSERT INTO `permission` VALUES (59, '1000000976625379', '标签管理', '标签管理', '/tags', 'tags', 35, 1, 5, 'fa fa-circle-o', 1, '2018-07-25 18:50:47', '2019-04-22 14:45:11');
INSERT INTO `permission` VALUES (60, '1000002127467055', '查询', '查询标签列表', '/tag/list', 'tag:list', 59, 2, 0, '', 1, '2018-07-25 18:51:20', '2018-07-25 18:51:20');
INSERT INTO `permission` VALUES (61, '1000001458372033', '新增', '新增标签', '/tag/add', 'tag:add', 59, 2, 0, '', 1, '2018-07-25 18:51:42', '2018-07-25 18:51:42');
INSERT INTO `permission` VALUES (62, '1000001832967209', '编辑', '编辑标签', '/tag/edit', 'tag:edit', 59, 2, 0, '', 1, '2018-07-25 18:52:17', '2018-07-25 18:52:17');
INSERT INTO `permission` VALUES (63, '1000000754923037', '删除', '删除标签', '/tag/delete', 'tag:delete', 59, 2, 0, '', 1, '2018-07-25 18:52:40', '2018-07-25 18:52:40');
INSERT INTO `permission` VALUES (64, '1000000759248744', '批量删除', '批量删除标签', '/tag/batch/delete', 'tag:batchDelete', 59, 2, 0, '', 1, '2018-07-25 18:53:14', '2018-07-25 18:53:14');
INSERT INTO `permission` VALUES (71, '1000000899091444', '发布考试', '发布考试', '/exam/add', 'exam:add', 52, 1, 1, 'fa fa-dot-circle-o', 1, '2018-07-29 20:39:49', '2019-02-20 20:10:03');
INSERT INTO `permission` VALUES (72, '1000000224901858', '评论管理', '评论管理', '/comments', 'comments', 35, 1, 4, 'fa fa-circle-o', 1, '2018-08-10 09:44:41', '2018-09-19 15:44:13');
INSERT INTO `permission` VALUES (73, '1000001579533936', '查询', '查询', '/comment/list', 'comment:list', 72, 2, 0, '', 1, '2018-08-10 09:46:54', '2018-08-10 09:46:54');
INSERT INTO `permission` VALUES (74, '1000000663968031', '审核', '审核评论', '/comment/audit', 'comment:audit', 72, 2, 0, '', 1, '2018-08-10 09:57:11', '2018-08-10 09:57:11');
INSERT INTO `permission` VALUES (75, '1000000322655547', '回复', '回复评论', '/comment/reply', 'comment:reply', 72, 2, 0, NULL, 1, '2018-08-10 10:04:28', '2019-04-18 10:27:24');
INSERT INTO `permission` VALUES (76, '1000001419287014', '删除', '删除评论', '/comment/delete', 'comment:delete', 72, 2, 0, '', 1, '2018-08-10 10:06:27', '2018-08-10 10:06:27');
INSERT INTO `permission` VALUES (77, '1000002075182223', '批量删除', '批量删除评论', '/comment/batch/delete', 'comment:batchDelete', 72, 2, 0, '', 1, '2018-08-10 10:07:57', '2018-08-10 10:07:57');
INSERT INTO `permission` VALUES (78, '1000000587822241', '上传管理', '上传管理', NULL, NULL, 0, 0, 6, 'fa fa-upload', 1, '2018-09-12 17:08:41', '2019-02-01 01:37:52');
INSERT INTO `permission` VALUES (79, '1000000493635111', '云存储配置', '云存储配置', '/upload/config', 'upload:config', 78, 1, 1, 'fa fa-circle-o', 1, '2018-09-12 17:10:09', '2018-09-12 17:10:09');
INSERT INTO `permission` VALUES (80, '1000000318760332', '保存', '保存云存储配置', '/upload/saveConfig', 'upload:saveConfig', 79, 2, 0, '', 1, '2018-09-12 17:10:42', '2018-09-12 17:10:42');
INSERT INTO `permission` VALUES (89, '1000002085828985', '课程管理', '课程管理菜单', '/subjects', 'subjects', 52, 1, 3, 'fa fa-circle-o', 1, '2019-01-18 19:14:08', '2019-02-20 21:23:00');
INSERT INTO `permission` VALUES (90, '1000000583815309', '新增', '新增按钮', '/subject/add', 'subject:add', 89, 2, 0, '', 1, '2019-01-18 19:15:39', '2019-01-18 19:15:39');
INSERT INTO `permission` VALUES (91, '1000000414556681', '编辑', '编辑按钮', '/subject/edit', 'subject:edit', 89, 2, 0, '', 1, '2019-01-18 19:16:26', '2019-01-18 19:16:26');
INSERT INTO `permission` VALUES (92, '1000001670195971', '删除', '删除按钮', '/subject/delete', 'subject:delete', 89, 2, 0, '', 1, '2019-01-18 19:17:06', '2019-01-18 19:17:06');
INSERT INTO `permission` VALUES (93, '1000000233644405', '题库管理', '题库管理菜单', '/questions', 'questions', 52, 1, 4, 'fa fa-circle-o', 1, '2019-01-18 19:18:48', '2019-02-20 21:23:17');
INSERT INTO `permission` VALUES (94, '1000000159347988', '新增', '新增按钮', '/question/add', 'question:add', 93, 2, 0, '', 1, '2019-01-18 19:20:08', '2019-01-18 19:20:08');
INSERT INTO `permission` VALUES (95, '1000001743618837', '查询', '查询按钮', '/question/list', 'question:list', 93, 2, 0, '', 1, '2019-01-18 19:22:12', '2019-01-18 19:22:12');
INSERT INTO `permission` VALUES (96, '1000000098066544', '删除', '删除按钮', '/question/delete', 'question:delete', 93, 2, 0, NULL, 1, '2019-01-22 22:39:34', '2019-01-22 22:40:28');
INSERT INTO `permission` VALUES (97, '1000001512619368', '批量删除', '批量删除按钮', '/question/batch/delete', 'question:batchDelete', 93, 2, 0, '', 1, '2019-01-22 22:47:20', '2019-01-22 22:47:20');
INSERT INTO `permission` VALUES (98, '1000000727959093', '编辑', '编辑按钮', '/question/edit', 'question:edit', 93, 2, 0, NULL, 1, '2019-01-23 23:30:36', '2019-01-23 23:34:06');
INSERT INTO `permission` VALUES (99, '1000001224543466', '考试列表', '考试列表菜单', '/exams', 'exams', 52, 1, 2, 'fa fa-circle-o', 1, '2019-01-26 21:13:34', '2019-02-20 21:22:45');
INSERT INTO `permission` VALUES (100, '1000001747915483', '查询', '查询按钮', '/exam/list', 'exam:list', 99, 2, 0, '', 1, '2019-01-26 21:16:16', '2019-01-26 21:16:16');
INSERT INTO `permission` VALUES (101, '1000000864155694', '发布考试', '发布考试按钮', '/exam/add', 'exam:add', 99, 2, 0, NULL, 1, '2019-01-26 21:16:51', '2019-02-18 20:41:41');
INSERT INTO `permission` VALUES (102, '1000000167185653', '编辑', '编辑按钮', '/exam/edit', 'exam:edit', 99, 2, 0, '', 1, '2019-02-18 20:41:27', '2019-02-18 20:41:27');
INSERT INTO `permission` VALUES (103, '1000000850255464', '删除', '删除按钮', '/exam/delete', 'exam:delete', 99, 2, 0, '', 1, '2019-02-18 21:56:38', '2019-02-18 21:56:38');
INSERT INTO `permission` VALUES (104, '1000000553415807', '批量删除', '批量删除按钮', '/exam/batch/delete', 'exam:batchDelete', 99, 2, 0, NULL, 1, '2019-02-18 21:57:57', '2019-02-20 20:33:27');
INSERT INTO `permission` VALUES (105, '1000000243343801', '成绩管理', '成绩管理菜单', '/grades', 'grades', 52, 1, 5, 'fa fa-circle-o', 1, '2019-03-14 10:55:35', '2019-03-14 10:55:35');
INSERT INTO `permission` VALUES (106, '1000000426716222', '查询', '查询按钮', '/grade/list', 'grade:list', 105, 2, 0, '', 1, '2019-03-14 10:56:42', '2019-03-14 10:56:42');
INSERT INTO `permission` VALUES (107, '1000000773560150', '批阅', '批阅按钮', '/grade/mark', 'grade:mark', 105, 2, 0, '', 1, '2019-03-15 18:23:51', '2019-03-15 18:23:51');
INSERT INTO `permission` VALUES (108, '1000000658745124', '详情', '详情按钮', '/grade/detail', 'grade:detail', 105, 2, 0, '', 1, '2019-03-16 16:10:16', '2019-03-16 16:10:16');
INSERT INTO `permission` VALUES (109, '1000000281400324', '删除', '删除按钮', '/grade/delete', 'grade:delete', 105, 2, 0, '', 1, '2019-03-16 16:10:53', '2019-03-16 16:10:53');
INSERT INTO `permission` VALUES (110, '1000000399266971', '批量删除', '批量删除按钮', '/grade/batch/delete', 'grade:batchDelete', 105, 2, 0, NULL, 1, '2019-03-16 16:12:10', '2019-03-16 16:13:13');
INSERT INTO `permission` VALUES (111, '1000000791531592', '批量导入题库', '批量导入题库按钮', '/question/importExcel', 'question:importExcel', 99, 2, 0, NULL, 0, '2019-03-22 14:53:45', '2019-03-22 14:57:37');
INSERT INTO `permission` VALUES (112, '1000000698074212', '批量导入题库', '批量导入题库按钮', '/question/importExcel', 'question:importExcel', 93, 2, 0, '', 1, '2019-03-22 14:58:22', '2019-03-22 14:58:22');
INSERT INTO `permission` VALUES (113, '1000000100079524', '批量删除', '批量删除课程按钮', '/subject/batch/delete', 'subject:batchDelete', 89, 2, 0, '', 1, '2019-03-26 19:03:34', '2019-03-26 19:03:34');
INSERT INTO `permission` VALUES (114, '1000001665814828', '学院管理', '学院信息管理', '/institutes', 'institutes', 2, 1, 1, 'fa fa-circle-o', 1, '2019-04-11 20:37:04', '2019-04-11 20:37:04');
INSERT INTO `permission` VALUES (115, '1000000075001179', '查询', '学院信息查询', '/institute/list', 'institute:list', 114, 2, 0, '', 1, '2019-04-11 20:43:59', '2019-04-11 20:43:59');
INSERT INTO `permission` VALUES (116, '1000000826591162', '新增', '新增按钮', '/institute/add', 'institute:add', 114, 2, 0, '', 1, '2019-04-11 20:45:06', '2019-04-11 20:45:06');
INSERT INTO `permission` VALUES (117, '1000002056106190', '编辑', '编辑按钮', '/institute/edit', 'institute:edit', 114, 2, 0, '', 1, '2019-04-11 20:46:01', '2019-04-11 20:46:01');
INSERT INTO `permission` VALUES (118, '1000000206952702', '删除', '删除按钮', '/institute/delete', 'institute:delete', 114, 2, 0, '', 1, '2019-04-11 20:46:43', '2019-04-11 20:46:43');
INSERT INTO `permission` VALUES (119, '1000001181531387', '批量删除', '批量删除按钮', '/institute/batch/delete', 'institute:batchDelete', 114, 2, 0, '', 1, '2019-04-11 20:47:52', '2019-04-11 20:47:52');
INSERT INTO `permission` VALUES (120, '1000001516188546', '班级管理', '班级管理', '/classes', 'classes', 2, 1, 2, 'fa fa-circle-o', 1, '2019-04-13 15:37:21', '2019-04-13 15:37:37');
INSERT INTO `permission` VALUES (121, '1000000790358121', '查询', '查询按钮', '/classes/list', 'classes:list', 120, 2, 0, '', 1, '2019-04-13 15:38:44', '2019-04-13 15:38:44');
INSERT INTO `permission` VALUES (122, '1000001707301213', '新增', '新增按钮', '/classes/add', 'classes:add', 120, 2, 0, '', 1, '2019-04-13 15:39:25', '2019-04-13 15:39:25');
INSERT INTO `permission` VALUES (123, '1000001537406462', '编辑', '编辑按钮', '/classes/edit', 'classes:edit', 120, 2, 0, '', 1, '2019-04-13 15:40:14', '2019-04-13 15:40:14');
INSERT INTO `permission` VALUES (124, '1000000382493709', '删除', '删除按钮', '/classes/delete', 'classes:delete', 120, 2, 0, '', 1, '2019-04-13 15:40:53', '2019-04-13 15:40:53');
INSERT INTO `permission` VALUES (125, '1000001943891212', '批量删除', '批量删除按钮', '/classes/batch/delete', 'classes:batchDelete', 120, 2, 0, '', 1, '2019-04-13 15:41:44', '2019-04-13 15:41:44');
INSERT INTO `permission` VALUES (126, '1000000812880328', '考试情况', '数据统计菜单', '/datas', 'datas', 52, 1, 6, 'fa fa-circle-o', 1, '2019-04-24 18:11:24', '2019-06-01 00:25:15');
INSERT INTO `permission` VALUES (127, '1000000666428532', '查询', '查询按钮', '/data/list', 'data:list', 126, 2, 0, '', 1, '2019-04-24 18:12:26', '2019-04-24 18:12:26');
INSERT INTO `permission` VALUES (128, '1000000408456990', '批量导入用户', '批量导入用户按钮', '/user/importUserExcel', 'user:importUserExcel', 3, 2, 0, '', 1, '2019-04-27 20:50:27', '2019-04-27 20:50:27');
INSERT INTO `permission` VALUES (129, '1000000067717336', '禁用', '禁用用户按钮', '/user/ban', 'user:ban', 3, 2, 0, '', 1, '2019-05-09 18:24:44', '2019-05-09 18:24:44');
INSERT INTO `permission` VALUES (130, '1000001960327190', '启用', '启用用户按钮', '/user/enable', 'user:enable', 3, 2, 0, '', 1, '2019-05-09 18:25:27', '2019-05-09 18:25:27');
INSERT INTO `permission` VALUES (131, '1000000048936375', '批量禁用', '批量禁用用户按钮', '/user/batch/ban', 'user:batchBan', 3, 2, 0, '', 1, '2019-05-09 18:26:29', '2019-05-09 18:26:29');
INSERT INTO `permission` VALUES (132, '1000002019782608', '批量启用', '批量启用用户按钮', '/user/batch/enbale', 'user:batchEnable', 3, 2, 0, '', 1, '2019-05-09 18:27:11', '2019-05-09 18:27:11');
INSERT INTO `permission` VALUES (133, '1000001282126651', '访问权限', '允许访问管理后台权限按钮', '/manager', 'manager', 1, 2, 0, NULL, 1, '2019-05-15 01:14:46', '2019-05-15 13:56:40');
INSERT INTO `permission` VALUES (134, '1000001851940032', '批量分配角色', '批量分配角色按钮', '/user/batch/assign/role', 'user:batchAssignRole', 3, 2, 0, '', 1, '2019-05-29 00:42:37', '2019-05-29 00:42:37');

-- ----------------------------
-- Table structure for question
-- ----------------------------
DROP TABLE IF EXISTS `question`;
CREATE TABLE `question`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '题目标题',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '题目内容',
  `question_type` int(11) NULL DEFAULT NULL COMMENT '题目类型,0表示单项选择题,1表示多项选择题,2表示问答题,3表示编程题',
  `option_a` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '选项A',
  `option_b` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '选项B',
  `option_c` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '选项C',
  `option_d` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '选项D',
  `answer` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '答案',
  `parse` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '答案解析',
  `score` int(11) NULL DEFAULT NULL COMMENT '题目分值',
  `difficulty` int(11) NULL DEFAULT 1 COMMENT '题目难度',
  `subject_id` int(11) NULL DEFAULT NULL COMMENT '学科ID',
  `create_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `status` int(11) NULL DEFAULT 1 COMMENT '0表示未考试题目,1表示已考试题目',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 139 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of question
-- ----------------------------
INSERT INTO `question` VALUES (78, 'C语言属于（    ）', '', 0, '机器语言', '低级语言', '中级语言', '高级语言', 'D', '无解析', 2, 1, 1, '2019-06-10 10:24:36', '2019-06-10 10:24:36', 0);
INSERT INTO `question` VALUES (79, 'C语言规定，在一个源程序中，main函数的位置（    ）', '', 0, '必须在最开始', '必须在系统调用的库函数的后面', '可以任意', '必须在最后', 'C', '无解析', 2, 1, 1, '2019-06-10 10:24:36', '2019-06-10 10:24:36', 0);
INSERT INTO `question` VALUES (80, 'C语言程序的块注释是（    ）', '', 0, '由“/*”开头，“*/”结尾', '由“/*”开头，“/*”结尾', '由“//”开头', '由“/*”或“//”开头，“*/”结尾', 'A', '无解析', 2, 1, 1, '2019-06-10 10:24:36', '2019-06-10 10:24:36', 0);
INSERT INTO `question` VALUES (81, 'C语言中用于结构化程序设计的3种基本结构是（    ）', '', 0, 'if、switch、break', '顺序结构、选择结构、循环结构', 'for、while、do-while', 'if、for、continue', 'B', '无解析', 2, 1, 1, '2019-06-10 10:24:36', '2019-06-10 10:24:36', 0);
INSERT INTO `question` VALUES (82, 'C语言提供的合法的数据类型的关键字是（      ）', '', 0, 'integer', 'long　', 'Double', 'Char', 'B', '无解析', 2, 1, 1, '2019-06-10 10:24:36', '2019-06-10 10:24:36', 0);
INSERT INTO `question` VALUES (83, '在C语言中，要求参加运算的数必须时整数的运算符是（     ）', '', 0, '/', '%', '*', '=', 'B', '无解析', 2, 1, 1, '2019-06-10 10:24:36', '2019-06-10 10:24:36', 0);
INSERT INTO `question` VALUES (84, '设x,i,j,k都是int型变量，表达式x=(i=4,j=16,k=32)计算后，x的值为（    ）', '', 0, '表达式不正确', '32', '16', '4', 'B', '无解析', 2, 3, 2, '2019-06-10 10:24:36', '2021-04-27 11:17:01', 0);
INSERT INTO `question` VALUES (85, '已知int x=1,y=2,z；执行（z=1.0/y*x）语句后z的值是（     ）', '', 0, '0', '0', '1', '2', 'C', '无解析', 2, 1, 3, '2019-06-10 10:24:36', '2021-04-27 11:17:03', 0);
INSERT INTO `question` VALUES (86, '若有说明语句：int a;float b;,以下输入语句正确的是（      ）', '', 0, 'scanf(“%f%f”,&a,&b)', 'scanf(“%f%d”,&a,&b)', 'scanf(“%d%f”,&a,&b)', 'scanf(“%6.2f%6.2f”,&a,&b)', 'C', '无解析', 2, 1, 4, '2019-06-10 10:24:36', '2021-04-27 11:17:04', 0);
INSERT INTO `question` VALUES (87, '设有: int a=1,b=2,c=3,d=4,m=2,n=2; 执行 (m=a>b)&&(n=c>d)后,n的值是（     ）', '', 0, '1', '2', '3', '4', 'B', '无解析', 2, 3, 6, '2019-06-10 10:24:36', '2021-04-27 11:19:52', 0);
INSERT INTO `question` VALUES (88, '以下选项中,当x为大于l的奇数时,值为0的表达式是（     ）', '', 0, 'x%2==1', 'x/2', 'x%2!=0', 'x%2==0', 'D', '无解析', 2, 2, 6, '2019-06-10 10:24:36', '2021-04-27 11:19:53', 0);
INSERT INTO `question` VALUES (89, 'C语言中while和do-while循环的主要区别是（     ）', '', 0, 'while的循环控制条件比do–while的循环控制条件严格', 'do-while的循环体至少无条件执行一次', 'do-while允许从外部转到循环体内', 'do-while的循环体不能是复合语句', 'B', '无解析', 2, 1, 7, '2019-06-10 10:24:36', '2021-04-27 11:19:56', 0);
INSERT INTO `question` VALUES (90, '若k为整型变量，则下面while循环执行的次数为：（      ）。\nk=10;\nwhile(k==0)  k=k-1;', '', 0, '0', '10', '1', '无数次', 'A', '无解析', 2, 2, 7, '2019-06-10 10:24:36', '2021-04-27 11:19:57', 0);
INSERT INTO `question` VALUES (91, '一个C源程序至少应包括一个_______。', '', 2, '', '', '', '', '函数', '无解析', 1, 2, 1, '2019-06-10 10:24:36', '2019-06-13 11:20:04', 0);
INSERT INTO `question` VALUES (92, 'C 语言中的标识符只能由 _________、__________ 和 _________ 三种字符组成，且第一个字符必须是 __________。', '', 2, '', '', '', '', '字母、数字、下划线', '无解析', 3, 2, 1, '2019-06-10 10:24:36', '2019-06-13 11:22:17', 0);
INSERT INTO `question` VALUES (93, 'C语言中的实型变量分为_________和__________两种类型。', '', 2, '', '', '', '', 'float、double', '无解析', 2, 2, 1, '2019-06-10 10:24:36', '2019-06-13 11:23:44', 0);
INSERT INTO `question` VALUES (94, 'C语言中，函数由函数首部和___________组成。', '', 2, '', '', '', '', '函数体', '无解析', 1, 2, 1, '2019-06-10 10:24:36', '2019-06-13 11:24:09', 0);
INSERT INTO `question` VALUES (95, '编写一个C程序，输入a,b两个值，输出这两个数的和。', '', 2, '', '', '', '', '# include <stdio.h>\nint main()\n{int a,b,c;\nscanf(\"%d,%d\",&a,&b);\nc=a+b;\nprintf(\"c=%d\",c);\nreturn 0;', '无解析', 10, 2, 1, '2019-06-10 10:24:36', '2019-06-10 10:24:36', 0);
INSERT INTO `question` VALUES (129, '程序输出结果为：', '<pre><code>\r\n<span class=\"hljs-meta\">#<span class=\"hljs-meta-keyword\">include</span><span class=\"hljs-meta-string\">&lt;stdio.h&gt;</span></span>\r\n<span class=\"hljs-function\"><span class=\"hljs-keyword\">int</span> <span class=\"hljs-title\">main</span><span class=\"hljs-params\">( )</span>\r\n</span>{ <span class=\"hljs-keyword\">int</span> x=<span class=\"hljs-number\">0</span>,y=<span class=\"hljs-number\">0</span>,z=<span class=\"hljs-number\">0</span>;\r\n<span class=\"hljs-keyword\">if</span> (x==y+z)  <span class=\"hljs-built_in\">printf</span>(“***”);\r\n<span class=\"hljs-keyword\">else</span>  <span class=\"hljs-built_in\">printf</span>(“###”);\r\n}<span class=\"hljs-string\">\"</span>\r\n</code></pre>', 0, '有语法错误，不能通过编译', '输出：***', '可以编译，但不能通过连接，所以不能运行', '输出：###', 'B', '无', 2, 1, 1, '2019-06-10 10:28:04', '2019-06-10 10:28:04', 0);
INSERT INTO `question` VALUES (130, '以下程序的运行结果是（     ）', '<pre><code><span class=\"hljs-keyword\">int</span>  main()\r\n { <span class=\"hljs-keyword\">int</span> <span class=\"hljs-keyword\">m</span>=<span class=\"hljs-number\">5</span>;\r\n<span class=\"hljs-keyword\">if</span>(<span class=\"hljs-keyword\">m</span>++&gt;<span class=\"hljs-number\">5</span>)  <span class=\"hljs-keyword\">printf</span>(“%d\\n”,<span class=\"hljs-keyword\">m</span>);\r\n<span class=\"hljs-keyword\">else</span>       <span class=\"hljs-keyword\">printf</span>(“%d\\n”,<span class=\"hljs-keyword\">m</span>--); }\r\n</code></pre>', 0, '4', '5', '6', '7', 'C', '无', 2, 2, 1, '2019-06-10 10:29:40', '2019-06-10 10:29:40', 0);
INSERT INTO `question` VALUES (131, '以下程序的运行结果是：             ', '<pre><code><span class=\"hljs-meta\"># <span class=\"hljs-meta-keyword\">include</span> <span class=\"hljs-meta-string\">&lt;stdio.h&gt;</span></span>\r\n<span class=\"hljs-function\"><span class=\"hljs-keyword\">int</span> <span class=\"hljs-title\">main</span><span class=\"hljs-params\">( )</span> \r\n</span>{<span class=\"hljs-keyword\">int</span> a,b,s; \r\na = <span class=\"hljs-number\">4</span>;b =<span class=\"hljs-number\">18</span>; \r\ns = (a + b)*<span class=\"hljs-number\">3</span>;\r\n<span class=\"hljs-built_in\">printf</span>(“(a+b)*<span class=\"hljs-number\">3</span>=%d\\n”,s); \r\n<span class=\"hljs-keyword\">return</span> <span class=\"hljs-number\">0</span>;     }\r\n</code></pre>', 2, '', '', '', '', '（a+b）=66', '无', 5, 1, 1, '2019-06-10 10:31:23', '2019-06-10 10:31:23', 0);
INSERT INTO `question` VALUES (132, '输入一个三位正整数，判断该数是否为水仙花数。（水仙花数的是指一个三位数，其各位数字的立方各等于该数本身。例如：153是一个水仙花数，因为153=1^3+5^3+3^3）\r\n', '', 2, '', '', '', '', '无', '无', 10, 2, 1, '2019-06-10 10:37:16', '2019-06-10 10:37:16', 0);
INSERT INTO `question` VALUES (133, '编写程序，输入一个数，输出该数的阶乘。输出数据格式为：5！=120', '', 2, '', '', '', '', '无', '无\r\n', 10, 2, 1, '2019-06-10 10:37:45', '2019-06-10 10:37:45', 0);
INSERT INTO `question` VALUES (134, '标题', '<p>内容</p>\r\n', 3, '', '', '', '', '1', '1', 2, 1, 9, '2021-04-28 07:05:40', '2021-04-28 07:05:40', 0);
INSERT INTO `question` VALUES (135, '123', '<p>123</p>\r\n', 3, '', '', '', '', '1', '1', 2, 5, 1, '2021-04-28 15:27:01', '2021-04-28 15:27:01', 0);
INSERT INTO `question` VALUES (136, '123', '<p>123</p>\r\n', 3, '', '', '', '', '1', '1', 2, 1, 1, '2021-04-28 15:29:07', '2021-04-28 15:29:07', 0);
INSERT INTO `question` VALUES (137, '123', '<p>123</p>\r\n', 3, '', '', '', '', '123', '123', 2, 1, 1, '2021-04-28 15:32:59', '2021-04-28 15:32:59', 0);
INSERT INTO `question` VALUES (138, '123', '<p>123</p>\r\n', 3, '', '', '', '', '2', '2', 2, 1, 3, '2021-04-28 15:37:09', '2021-04-28 15:37:09', 0);

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色id',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色描述',
  `status` int(11) NOT NULL COMMENT '状态：1有效；2删除',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `role_id`(`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, '1', '超级管理员', '超级管理员', 1, '2021-04-05 20:30:05', '2021-04-05 20:30:05');
INSERT INTO `role` VALUES (2, '2', '老师', '老师', 1, '2021-04-05 20:32:45', '2021-04-05 20:32:45');
INSERT INTO `role` VALUES (3, '3', '学生', '学生', 1, '2021-04-05 20:35:35', '2021-04-05 20:35:35');
INSERT INTO `role` VALUES (4, '4', '数据库管理员', '管理数据库', 1, '2021-04-26 07:35:52', '2021-04-26 07:35:52');
INSERT INTO `role` VALUES (7, '1000001673944386', 'admin', 'admin', 1, '2021-04-28 16:14:42', NULL);

-- ----------------------------
-- Table structure for role_permission
-- ----------------------------
DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE `role_permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色id',
  `permission_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '权限id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5241 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of role_permission
-- ----------------------------
INSERT INTO `role_permission` VALUES (4403, '4', '1');
INSERT INTO `role_permission` VALUES (4404, '4', '1000001282126651');
INSERT INTO `role_permission` VALUES (4405, '4', '4');
INSERT INTO `role_permission` VALUES (4406, '4', '401');
INSERT INTO `role_permission` VALUES (4407, '4', '1000001992372345');
INSERT INTO `role_permission` VALUES (4408, '4', '1000002083579304');
INSERT INTO `role_permission` VALUES (4409, '4', '1000000171409776');
INSERT INTO `role_permission` VALUES (4410, '4', '1000000587822241');
INSERT INTO `role_permission` VALUES (4411, '4', '1000000493635111');
INSERT INTO `role_permission` VALUES (4412, '4', '1000000318760332');
INSERT INTO `role_permission` VALUES (4413, '4', '3');
INSERT INTO `role_permission` VALUES (4414, '4', '301');
INSERT INTO `role_permission` VALUES (4415, '1000001556873666', '1');
INSERT INTO `role_permission` VALUES (4416, '1000001556873666', '1000001282126651');
INSERT INTO `role_permission` VALUES (4417, '1000001556873666', '1000000602555213');
INSERT INTO `role_permission` VALUES (4418, '1000001556873666', '1000000899091444');
INSERT INTO `role_permission` VALUES (4419, '1000001556873666', '1000001224543466');
INSERT INTO `role_permission` VALUES (4420, '1000001556873666', '1000000553415807');
INSERT INTO `role_permission` VALUES (4421, '1000001556873666', '1000000850255464');
INSERT INTO `role_permission` VALUES (4422, '1000001556873666', '1000000167185653');
INSERT INTO `role_permission` VALUES (4423, '1000001556873666', '1000000864155694');
INSERT INTO `role_permission` VALUES (4424, '1000001556873666', '1000001747915483');
INSERT INTO `role_permission` VALUES (4425, '1000001556873666', '1000002085828985');
INSERT INTO `role_permission` VALUES (4426, '1000001556873666', '1000001670195971');
INSERT INTO `role_permission` VALUES (4427, '1000001556873666', '1000000414556681');
INSERT INTO `role_permission` VALUES (4428, '1000001556873666', '1000000583815309');
INSERT INTO `role_permission` VALUES (4429, '1000001556873666', '1000000100079524');
INSERT INTO `role_permission` VALUES (4430, '1000001556873666', '1000000233644405');
INSERT INTO `role_permission` VALUES (4431, '1000001556873666', '1000000098066544');
INSERT INTO `role_permission` VALUES (4432, '1000001556873666', '1000000727959093');
INSERT INTO `role_permission` VALUES (4433, '1000001556873666', '1000001512619368');
INSERT INTO `role_permission` VALUES (4434, '1000001556873666', '1000001743618837');
INSERT INTO `role_permission` VALUES (4435, '1000001556873666', '1000000159347988');
INSERT INTO `role_permission` VALUES (4436, '1000001556873666', '1000000698074212');
INSERT INTO `role_permission` VALUES (4437, '1000001556873666', '1000000243343801');
INSERT INTO `role_permission` VALUES (4438, '1000001556873666', '1000000658745124');
INSERT INTO `role_permission` VALUES (4439, '1000001556873666', '1000000773560150');
INSERT INTO `role_permission` VALUES (4440, '1000001556873666', '1000000426716222');
INSERT INTO `role_permission` VALUES (4441, '1000001556873666', '1000000281400324');
INSERT INTO `role_permission` VALUES (4442, '1000001556873666', '1000000399266971');
INSERT INTO `role_permission` VALUES (4443, '1000001556873666', '1000000812880328');
INSERT INTO `role_permission` VALUES (4444, '1000001556873666', '1000000666428532');
INSERT INTO `role_permission` VALUES (4445, '1000001556873666', '2');
INSERT INTO `role_permission` VALUES (4446, '1000001556873666', '1000001665814828');
INSERT INTO `role_permission` VALUES (4447, '1000001556873666', '1000001181531387');
INSERT INTO `role_permission` VALUES (4448, '1000001556873666', '1000000206952702');
INSERT INTO `role_permission` VALUES (4449, '1000001556873666', '1000002056106190');
INSERT INTO `role_permission` VALUES (4450, '1000001556873666', '1000000826591162');
INSERT INTO `role_permission` VALUES (4451, '1000001556873666', '1000000075001179');
INSERT INTO `role_permission` VALUES (4452, '1000001556873666', '1000001516188546');
INSERT INTO `role_permission` VALUES (4453, '1000001556873666', '1000001537406462');
INSERT INTO `role_permission` VALUES (4454, '1000001556873666', '1000001943891212');
INSERT INTO `role_permission` VALUES (4455, '1000001556873666', '1000000382493709');
INSERT INTO `role_permission` VALUES (4456, '1000001556873666', '1000001707301213');
INSERT INTO `role_permission` VALUES (4457, '1000001556873666', '1000000790358121');
INSERT INTO `role_permission` VALUES (4458, '1000001556873666', '201');
INSERT INTO `role_permission` VALUES (4459, '1000001556873666', '1000001851940032');
INSERT INTO `role_permission` VALUES (4460, '1000001556873666', '1000002019782608');
INSERT INTO `role_permission` VALUES (4461, '1000001556873666', '1000000048936375');
INSERT INTO `role_permission` VALUES (4462, '1000001556873666', '1000001960327190');
INSERT INTO `role_permission` VALUES (4463, '1000001556873666', '1000000067717336');
INSERT INTO `role_permission` VALUES (4464, '1000001556873666', '1000000408456990');
INSERT INTO `role_permission` VALUES (4465, '1000001556873666', '20103');
INSERT INTO `role_permission` VALUES (4466, '1000001556873666', '20101');
INSERT INTO `role_permission` VALUES (4467, '1000001556873666', '20102');
INSERT INTO `role_permission` VALUES (4468, '1000001556873666', '20104');
INSERT INTO `role_permission` VALUES (4469, '1000001556873666', '20105');
INSERT INTO `role_permission` VALUES (4470, '1000001556873666', '20106');
INSERT INTO `role_permission` VALUES (4471, '1000001556873666', '202');
INSERT INTO `role_permission` VALUES (4472, '1000001556873666', '20206');
INSERT INTO `role_permission` VALUES (4473, '1000001556873666', '20205');
INSERT INTO `role_permission` VALUES (4474, '1000001556873666', '20204');
INSERT INTO `role_permission` VALUES (4475, '1000001556873666', '20203');
INSERT INTO `role_permission` VALUES (4476, '1000001556873666', '20201');
INSERT INTO `role_permission` VALUES (4477, '1000001556873666', '20202');
INSERT INTO `role_permission` VALUES (4478, '1000001556873666', '203');
INSERT INTO `role_permission` VALUES (4479, '1000001556873666', '20304');
INSERT INTO `role_permission` VALUES (4480, '1000001556873666', '20303');
INSERT INTO `role_permission` VALUES (4481, '1000001556873666', '20302');
INSERT INTO `role_permission` VALUES (4482, '1000001556873666', '20301');
INSERT INTO `role_permission` VALUES (4483, '1000001556873666', '1000000863853891');
INSERT INTO `role_permission` VALUES (4484, '1000001556873666', '1000001264798222');
INSERT INTO `role_permission` VALUES (4485, '1000001556873666', '1000000432183856');
INSERT INTO `role_permission` VALUES (4486, '1000001556873666', '1000000237721285');
INSERT INTO `role_permission` VALUES (4487, '1000001556873666', '1000001011730177');
INSERT INTO `role_permission` VALUES (4488, '1000001556873666', '1000001238193773');
INSERT INTO `role_permission` VALUES (4489, '1000001556873666', '1000001305005793');
INSERT INTO `role_permission` VALUES (4490, '1000001556873666', '1000001679037501');
INSERT INTO `role_permission` VALUES (4491, '1000001556873666', '1000001507480127');
INSERT INTO `role_permission` VALUES (4492, '1000001556873666', '1000001312374743');
INSERT INTO `role_permission` VALUES (4493, '1000001556873666', '1000000224901858');
INSERT INTO `role_permission` VALUES (4494, '1000001556873666', '1000002075182223');
INSERT INTO `role_permission` VALUES (4495, '1000001556873666', '1000000322655547');
INSERT INTO `role_permission` VALUES (4496, '1000001556873666', '1000000663968031');
INSERT INTO `role_permission` VALUES (4497, '1000001556873666', '1000001579533936');
INSERT INTO `role_permission` VALUES (4498, '1000001556873666', '1000001419287014');
INSERT INTO `role_permission` VALUES (4499, '1000001556873666', '1000000976625379');
INSERT INTO `role_permission` VALUES (4500, '1000001556873666', '1000000759248744');
INSERT INTO `role_permission` VALUES (4501, '1000001556873666', '1000000754923037');
INSERT INTO `role_permission` VALUES (4502, '1000001556873666', '1000001832967209');
INSERT INTO `role_permission` VALUES (4503, '1000001556873666', '1000001458372033');
INSERT INTO `role_permission` VALUES (4504, '1000001556873666', '1000002127467055');
INSERT INTO `role_permission` VALUES (4505, '1000001556873666', '4');
INSERT INTO `role_permission` VALUES (4506, '1000001556873666', '401');
INSERT INTO `role_permission` VALUES (4507, '1000001556873666', '1000001992372345');
INSERT INTO `role_permission` VALUES (4508, '1000001556873666', '1000002083579304');
INSERT INTO `role_permission` VALUES (4509, '1000001556873666', '1000000171409776');
INSERT INTO `role_permission` VALUES (4510, '1000001556873666', '1000000587822241');
INSERT INTO `role_permission` VALUES (4511, '1000001556873666', '1000000493635111');
INSERT INTO `role_permission` VALUES (4512, '1000001556873666', '1000000318760332');
INSERT INTO `role_permission` VALUES (4513, '1000001556873666', '3');
INSERT INTO `role_permission` VALUES (4514, '1000001556873666', '301');
INSERT INTO `role_permission` VALUES (4515, '1000001939869336', '1');
INSERT INTO `role_permission` VALUES (4516, '1000001939869336', '1000001282126651');
INSERT INTO `role_permission` VALUES (4517, '1000001939869336', '1000000602555213');
INSERT INTO `role_permission` VALUES (4518, '1000001939869336', '1000000899091444');
INSERT INTO `role_permission` VALUES (4519, '1000001939869336', '1000001224543466');
INSERT INTO `role_permission` VALUES (4520, '1000001939869336', '1000000553415807');
INSERT INTO `role_permission` VALUES (4521, '1000001939869336', '1000000850255464');
INSERT INTO `role_permission` VALUES (4522, '1000001939869336', '1000000167185653');
INSERT INTO `role_permission` VALUES (4523, '1000001939869336', '1000000864155694');
INSERT INTO `role_permission` VALUES (4524, '1000001939869336', '1000001747915483');
INSERT INTO `role_permission` VALUES (4525, '1000001939869336', '1000002085828985');
INSERT INTO `role_permission` VALUES (4526, '1000001939869336', '1000001670195971');
INSERT INTO `role_permission` VALUES (4527, '1000001939869336', '1000000414556681');
INSERT INTO `role_permission` VALUES (4528, '1000001939869336', '1000000583815309');
INSERT INTO `role_permission` VALUES (4529, '1000001939869336', '1000000100079524');
INSERT INTO `role_permission` VALUES (4530, '1000001939869336', '1000000233644405');
INSERT INTO `role_permission` VALUES (4531, '1000001939869336', '1000000098066544');
INSERT INTO `role_permission` VALUES (4532, '1000001939869336', '1000000727959093');
INSERT INTO `role_permission` VALUES (4533, '1000001939869336', '1000001512619368');
INSERT INTO `role_permission` VALUES (4534, '1000001939869336', '1000001743618837');
INSERT INTO `role_permission` VALUES (4535, '1000001939869336', '1000000159347988');
INSERT INTO `role_permission` VALUES (4536, '1000001939869336', '1000000698074212');
INSERT INTO `role_permission` VALUES (4537, '1000001939869336', '1000000243343801');
INSERT INTO `role_permission` VALUES (4538, '1000001939869336', '1000000658745124');
INSERT INTO `role_permission` VALUES (4539, '1000001939869336', '1000000773560150');
INSERT INTO `role_permission` VALUES (4540, '1000001939869336', '1000000426716222');
INSERT INTO `role_permission` VALUES (4541, '1000001939869336', '1000000281400324');
INSERT INTO `role_permission` VALUES (4542, '1000001939869336', '1000000399266971');
INSERT INTO `role_permission` VALUES (4543, '1000001939869336', '1000000812880328');
INSERT INTO `role_permission` VALUES (4544, '1000001939869336', '1000000666428532');
INSERT INTO `role_permission` VALUES (4545, '1000001939869336', '1000000863853891');
INSERT INTO `role_permission` VALUES (4546, '1000001939869336', '1000001264798222');
INSERT INTO `role_permission` VALUES (4547, '1000001939869336', '1000000432183856');
INSERT INTO `role_permission` VALUES (4548, '1000001939869336', '1000000237721285');
INSERT INTO `role_permission` VALUES (4549, '1000001939869336', '1000001011730177');
INSERT INTO `role_permission` VALUES (4550, '1000001939869336', '1000001238193773');
INSERT INTO `role_permission` VALUES (4551, '1000001939869336', '1000001305005793');
INSERT INTO `role_permission` VALUES (4552, '1000001939869336', '1000001679037501');
INSERT INTO `role_permission` VALUES (4553, '1000001939869336', '1000001507480127');
INSERT INTO `role_permission` VALUES (4554, '1000001939869336', '1000001312374743');
INSERT INTO `role_permission` VALUES (4555, '1000001939869336', '1000000224901858');
INSERT INTO `role_permission` VALUES (4556, '1000001939869336', '1000002075182223');
INSERT INTO `role_permission` VALUES (4557, '1000001939869336', '1000000322655547');
INSERT INTO `role_permission` VALUES (4558, '1000001939869336', '1000000663968031');
INSERT INTO `role_permission` VALUES (4559, '1000001939869336', '1000001579533936');
INSERT INTO `role_permission` VALUES (4560, '1000001939869336', '1000001419287014');
INSERT INTO `role_permission` VALUES (4561, '1000001939869336', '1000000976625379');
INSERT INTO `role_permission` VALUES (4562, '1000001939869336', '1000000759248744');
INSERT INTO `role_permission` VALUES (4563, '1000001939869336', '1000000754923037');
INSERT INTO `role_permission` VALUES (4564, '1000001939869336', '1000001832967209');
INSERT INTO `role_permission` VALUES (4565, '1000001939869336', '1000001458372033');
INSERT INTO `role_permission` VALUES (4566, '1000001939869336', '1000002127467055');
INSERT INTO `role_permission` VALUES (4567, '1000001939869336', '1000000587822241');
INSERT INTO `role_permission` VALUES (4568, '1000001939869336', '1000000493635111');
INSERT INTO `role_permission` VALUES (4569, '1000001939869336', '1000000318760332');
INSERT INTO `role_permission` VALUES (4570, '1000001939869336', '3');
INSERT INTO `role_permission` VALUES (4571, '1000001939869336', '301');
INSERT INTO `role_permission` VALUES (5008, '1', '1');
INSERT INTO `role_permission` VALUES (5009, '1', '1000001282126651');
INSERT INTO `role_permission` VALUES (5010, '1', '1000000602555213');
INSERT INTO `role_permission` VALUES (5011, '1', '1000000899091444');
INSERT INTO `role_permission` VALUES (5012, '1', '1000001224543466');
INSERT INTO `role_permission` VALUES (5013, '1', '1000000553415807');
INSERT INTO `role_permission` VALUES (5014, '1', '1000000850255464');
INSERT INTO `role_permission` VALUES (5015, '1', '1000000167185653');
INSERT INTO `role_permission` VALUES (5016, '1', '1000000864155694');
INSERT INTO `role_permission` VALUES (5017, '1', '1000001747915483');
INSERT INTO `role_permission` VALUES (5018, '1', '1000002085828985');
INSERT INTO `role_permission` VALUES (5019, '1', '1000001670195971');
INSERT INTO `role_permission` VALUES (5020, '1', '1000000414556681');
INSERT INTO `role_permission` VALUES (5021, '1', '1000000583815309');
INSERT INTO `role_permission` VALUES (5022, '1', '1000000100079524');
INSERT INTO `role_permission` VALUES (5023, '1', '1000000233644405');
INSERT INTO `role_permission` VALUES (5024, '1', '1000000098066544');
INSERT INTO `role_permission` VALUES (5025, '1', '1000000727959093');
INSERT INTO `role_permission` VALUES (5026, '1', '1000001512619368');
INSERT INTO `role_permission` VALUES (5027, '1', '1000001743618837');
INSERT INTO `role_permission` VALUES (5028, '1', '1000000159347988');
INSERT INTO `role_permission` VALUES (5029, '1', '1000000698074212');
INSERT INTO `role_permission` VALUES (5030, '1', '1000000243343801');
INSERT INTO `role_permission` VALUES (5031, '1', '1000000658745124');
INSERT INTO `role_permission` VALUES (5032, '1', '1000000773560150');
INSERT INTO `role_permission` VALUES (5033, '1', '1000000426716222');
INSERT INTO `role_permission` VALUES (5034, '1', '1000000281400324');
INSERT INTO `role_permission` VALUES (5035, '1', '1000000399266971');
INSERT INTO `role_permission` VALUES (5036, '1', '1000000812880328');
INSERT INTO `role_permission` VALUES (5037, '1', '1000000666428532');
INSERT INTO `role_permission` VALUES (5038, '1', '2');
INSERT INTO `role_permission` VALUES (5039, '1', '1000001665814828');
INSERT INTO `role_permission` VALUES (5040, '1', '1000001181531387');
INSERT INTO `role_permission` VALUES (5041, '1', '1000000206952702');
INSERT INTO `role_permission` VALUES (5042, '1', '1000002056106190');
INSERT INTO `role_permission` VALUES (5043, '1', '1000000826591162');
INSERT INTO `role_permission` VALUES (5044, '1', '1000000075001179');
INSERT INTO `role_permission` VALUES (5045, '1', '1000001516188546');
INSERT INTO `role_permission` VALUES (5046, '1', '1000001537406462');
INSERT INTO `role_permission` VALUES (5047, '1', '1000001943891212');
INSERT INTO `role_permission` VALUES (5048, '1', '1000000382493709');
INSERT INTO `role_permission` VALUES (5049, '1', '1000001707301213');
INSERT INTO `role_permission` VALUES (5050, '1', '1000000790358121');
INSERT INTO `role_permission` VALUES (5051, '1', '201');
INSERT INTO `role_permission` VALUES (5052, '1', '1000001851940032');
INSERT INTO `role_permission` VALUES (5053, '1', '1000002019782608');
INSERT INTO `role_permission` VALUES (5054, '1', '1000000048936375');
INSERT INTO `role_permission` VALUES (5055, '1', '1000001960327190');
INSERT INTO `role_permission` VALUES (5056, '1', '1000000067717336');
INSERT INTO `role_permission` VALUES (5057, '1', '1000000408456990');
INSERT INTO `role_permission` VALUES (5058, '1', '20103');
INSERT INTO `role_permission` VALUES (5059, '1', '20101');
INSERT INTO `role_permission` VALUES (5060, '1', '20102');
INSERT INTO `role_permission` VALUES (5061, '1', '20104');
INSERT INTO `role_permission` VALUES (5062, '1', '20105');
INSERT INTO `role_permission` VALUES (5063, '1', '20106');
INSERT INTO `role_permission` VALUES (5064, '1', '202');
INSERT INTO `role_permission` VALUES (5065, '1', '20206');
INSERT INTO `role_permission` VALUES (5066, '1', '20205');
INSERT INTO `role_permission` VALUES (5067, '1', '20204');
INSERT INTO `role_permission` VALUES (5068, '1', '20203');
INSERT INTO `role_permission` VALUES (5069, '1', '20201');
INSERT INTO `role_permission` VALUES (5070, '1', '20202');
INSERT INTO `role_permission` VALUES (5071, '1', '203');
INSERT INTO `role_permission` VALUES (5072, '1', '20304');
INSERT INTO `role_permission` VALUES (5073, '1', '20303');
INSERT INTO `role_permission` VALUES (5074, '1', '20302');
INSERT INTO `role_permission` VALUES (5075, '1', '20301');
INSERT INTO `role_permission` VALUES (5076, '1', '1000000863853891');
INSERT INTO `role_permission` VALUES (5077, '1', '1000001264798222');
INSERT INTO `role_permission` VALUES (5078, '1', '1000000432183856');
INSERT INTO `role_permission` VALUES (5079, '1', '1000000237721285');
INSERT INTO `role_permission` VALUES (5080, '1', '1000001011730177');
INSERT INTO `role_permission` VALUES (5081, '1', '1000001238193773');
INSERT INTO `role_permission` VALUES (5082, '1', '1000001305005793');
INSERT INTO `role_permission` VALUES (5083, '1', '1000001679037501');
INSERT INTO `role_permission` VALUES (5084, '1', '1000001507480127');
INSERT INTO `role_permission` VALUES (5085, '1', '1000001312374743');
INSERT INTO `role_permission` VALUES (5086, '1', '1000000224901858');
INSERT INTO `role_permission` VALUES (5087, '1', '1000002075182223');
INSERT INTO `role_permission` VALUES (5088, '1', '1000000322655547');
INSERT INTO `role_permission` VALUES (5089, '1', '1000000663968031');
INSERT INTO `role_permission` VALUES (5090, '1', '1000001579533936');
INSERT INTO `role_permission` VALUES (5091, '1', '1000001419287014');
INSERT INTO `role_permission` VALUES (5092, '1', '1000000976625379');
INSERT INTO `role_permission` VALUES (5093, '1', '1000000759248744');
INSERT INTO `role_permission` VALUES (5094, '1', '1000000754923037');
INSERT INTO `role_permission` VALUES (5095, '1', '1000001832967209');
INSERT INTO `role_permission` VALUES (5096, '1', '1000001458372033');
INSERT INTO `role_permission` VALUES (5097, '1', '1000002127467055');
INSERT INTO `role_permission` VALUES (5098, '1', '4');
INSERT INTO `role_permission` VALUES (5099, '1', '401');
INSERT INTO `role_permission` VALUES (5100, '1', '1000001992372345');
INSERT INTO `role_permission` VALUES (5101, '1', '1000002083579304');
INSERT INTO `role_permission` VALUES (5102, '1', '1000000171409776');
INSERT INTO `role_permission` VALUES (5103, '1', '1000000587822241');
INSERT INTO `role_permission` VALUES (5104, '1', '1000000493635111');
INSERT INTO `role_permission` VALUES (5105, '1', '1000000318760332');
INSERT INTO `role_permission` VALUES (5106, '1', '3');
INSERT INTO `role_permission` VALUES (5107, '1', '301');
INSERT INTO `role_permission` VALUES (5108, '2', '1');
INSERT INTO `role_permission` VALUES (5109, '2', '1000001282126651');
INSERT INTO `role_permission` VALUES (5110, '2', '1000000602555213');
INSERT INTO `role_permission` VALUES (5111, '2', '1000000899091444');
INSERT INTO `role_permission` VALUES (5112, '2', '1000001224543466');
INSERT INTO `role_permission` VALUES (5113, '2', '1000000553415807');
INSERT INTO `role_permission` VALUES (5114, '2', '1000000850255464');
INSERT INTO `role_permission` VALUES (5115, '2', '1000000167185653');
INSERT INTO `role_permission` VALUES (5116, '2', '1000000864155694');
INSERT INTO `role_permission` VALUES (5117, '2', '1000001747915483');
INSERT INTO `role_permission` VALUES (5118, '2', '1000002085828985');
INSERT INTO `role_permission` VALUES (5119, '2', '1000001670195971');
INSERT INTO `role_permission` VALUES (5120, '2', '1000000414556681');
INSERT INTO `role_permission` VALUES (5121, '2', '1000000583815309');
INSERT INTO `role_permission` VALUES (5122, '2', '1000000100079524');
INSERT INTO `role_permission` VALUES (5123, '2', '1000000233644405');
INSERT INTO `role_permission` VALUES (5124, '2', '1000000098066544');
INSERT INTO `role_permission` VALUES (5125, '2', '1000000727959093');
INSERT INTO `role_permission` VALUES (5126, '2', '1000001512619368');
INSERT INTO `role_permission` VALUES (5127, '2', '1000001743618837');
INSERT INTO `role_permission` VALUES (5128, '2', '1000000159347988');
INSERT INTO `role_permission` VALUES (5129, '2', '1000000698074212');
INSERT INTO `role_permission` VALUES (5130, '2', '1000000243343801');
INSERT INTO `role_permission` VALUES (5131, '2', '1000000658745124');
INSERT INTO `role_permission` VALUES (5132, '2', '1000000773560150');
INSERT INTO `role_permission` VALUES (5133, '2', '1000000426716222');
INSERT INTO `role_permission` VALUES (5134, '2', '1000000281400324');
INSERT INTO `role_permission` VALUES (5135, '2', '1000000399266971');
INSERT INTO `role_permission` VALUES (5136, '2', '1000000812880328');
INSERT INTO `role_permission` VALUES (5137, '2', '1000000666428532');
INSERT INTO `role_permission` VALUES (5138, '2', '2');
INSERT INTO `role_permission` VALUES (5139, '2', '1000001665814828');
INSERT INTO `role_permission` VALUES (5140, '2', '1000001181531387');
INSERT INTO `role_permission` VALUES (5141, '2', '1000000206952702');
INSERT INTO `role_permission` VALUES (5142, '2', '1000002056106190');
INSERT INTO `role_permission` VALUES (5143, '2', '1000000826591162');
INSERT INTO `role_permission` VALUES (5144, '2', '1000000075001179');
INSERT INTO `role_permission` VALUES (5145, '2', '1000001516188546');
INSERT INTO `role_permission` VALUES (5146, '2', '1000001537406462');
INSERT INTO `role_permission` VALUES (5147, '2', '1000001943891212');
INSERT INTO `role_permission` VALUES (5148, '2', '1000000382493709');
INSERT INTO `role_permission` VALUES (5149, '2', '1000001707301213');
INSERT INTO `role_permission` VALUES (5150, '2', '1000000790358121');
INSERT INTO `role_permission` VALUES (5151, '2', '201');
INSERT INTO `role_permission` VALUES (5152, '2', '1000001851940032');
INSERT INTO `role_permission` VALUES (5153, '2', '1000002019782608');
INSERT INTO `role_permission` VALUES (5154, '2', '1000000048936375');
INSERT INTO `role_permission` VALUES (5155, '2', '1000001960327190');
INSERT INTO `role_permission` VALUES (5156, '2', '1000000067717336');
INSERT INTO `role_permission` VALUES (5157, '2', '1000000408456990');
INSERT INTO `role_permission` VALUES (5158, '2', '20103');
INSERT INTO `role_permission` VALUES (5159, '2', '20101');
INSERT INTO `role_permission` VALUES (5160, '2', '20102');
INSERT INTO `role_permission` VALUES (5161, '2', '20104');
INSERT INTO `role_permission` VALUES (5162, '2', '20105');
INSERT INTO `role_permission` VALUES (5163, '2', '20106');
INSERT INTO `role_permission` VALUES (5205, '1000001673944386', '1');
INSERT INTO `role_permission` VALUES (5206, '1000001673944386', '1000001282126651');
INSERT INTO `role_permission` VALUES (5207, '1000001673944386', '1000000602555213');
INSERT INTO `role_permission` VALUES (5208, '1000001673944386', '1000001224543466');
INSERT INTO `role_permission` VALUES (5209, '1000001673944386', '1000001747915483');
INSERT INTO `role_permission` VALUES (5210, '1000001673944386', '1000002085828985');
INSERT INTO `role_permission` VALUES (5211, '1000001673944386', '1000001670195971');
INSERT INTO `role_permission` VALUES (5212, '1000001673944386', '1000000233644405');
INSERT INTO `role_permission` VALUES (5213, '1000001673944386', '1000001743618837');
INSERT INTO `role_permission` VALUES (5214, '1000001673944386', '1000000243343801');
INSERT INTO `role_permission` VALUES (5215, '1000001673944386', '1000000426716222');
INSERT INTO `role_permission` VALUES (5216, '1000001673944386', '1000000812880328');
INSERT INTO `role_permission` VALUES (5217, '1000001673944386', '1000000666428532');
INSERT INTO `role_permission` VALUES (5218, '1000001673944386', '2');
INSERT INTO `role_permission` VALUES (5219, '1000001673944386', '1000001665814828');
INSERT INTO `role_permission` VALUES (5220, '1000001673944386', '1000000075001179');
INSERT INTO `role_permission` VALUES (5221, '1000001673944386', '1000001516188546');
INSERT INTO `role_permission` VALUES (5222, '1000001673944386', '1000000790358121');
INSERT INTO `role_permission` VALUES (5223, '1000001673944386', '201');
INSERT INTO `role_permission` VALUES (5224, '1000001673944386', '20101');
INSERT INTO `role_permission` VALUES (5225, '1000001673944386', '202');
INSERT INTO `role_permission` VALUES (5226, '1000001673944386', '20201');
INSERT INTO `role_permission` VALUES (5227, '1000001673944386', '203');
INSERT INTO `role_permission` VALUES (5228, '1000001673944386', '20301');
INSERT INTO `role_permission` VALUES (5229, '1000001673944386', '1000000863853891');
INSERT INTO `role_permission` VALUES (5230, '1000001673944386', '1000000237721285');
INSERT INTO `role_permission` VALUES (5231, '1000001673944386', '1000001238193773');
INSERT INTO `role_permission` VALUES (5232, '1000001673944386', '1000000224901858');
INSERT INTO `role_permission` VALUES (5233, '1000001673944386', '1000001579533936');
INSERT INTO `role_permission` VALUES (5234, '1000001673944386', '1000000976625379');
INSERT INTO `role_permission` VALUES (5235, '1000001673944386', '1000002127467055');
INSERT INTO `role_permission` VALUES (5236, '1000001673944386', '4');
INSERT INTO `role_permission` VALUES (5237, '1000001673944386', '401');
INSERT INTO `role_permission` VALUES (5238, '1000001673944386', '1000001992372345');
INSERT INTO `role_permission` VALUES (5239, '1000001673944386', '3');
INSERT INTO `role_permission` VALUES (5240, '1000001673944386', '301');

-- ----------------------------
-- Table structure for subject
-- ----------------------------
DROP TABLE IF EXISTS `subject`;
CREATE TABLE `subject`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `user_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '考生主键ID',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '学科名称',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '课程描述',
  `img_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '课程封面',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `author` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '作者',
  `create_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `status` int(11) NULL DEFAULT 0 COMMENT '课程状态,0表示正常,1表示弃用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of subject
-- ----------------------------
INSERT INTO `subject` VALUES (1, '1', 'C语言程序设计', '计算机专业学生必修课程', 'https://online-exam-1256117146.cos.ap-beijing.myqcloud.com/img/exam/346fae5706c7044dd530304c25a21d72.jpg', 1, '超级管理员', '2019-01-18 19:23:42', '2019-05-28 22:38:19', 0);
INSERT INTO `subject` VALUES (2, '1', 'Java程序设计', '软件工程专业学生必修课程', 'https://online-exam-1256117146.cos.ap-beijing.myqcloud.com/img/exam/6bea0f0034d2f0b9a236346fc3f171fb.jpg', 2, '超级管理员', '2019-01-18 19:25:09', '2019-05-28 22:38:33', 0);
INSERT INTO `subject` VALUES (3, '1', '数据库', '软件工程专业学生必须课程', 'https://online-exam-1256117146.cos.ap-beijing.myqcloud.com/img/exam/7080a373597bdc28e123cdce4d4893a7.jpg', 3, '超级管理员', '2019-01-23 23:40:05', '2019-05-28 22:38:50', 0);
INSERT INTO `subject` VALUES (6, '1', 'Python程序设计', '计算机科学与技术专业必修课程', 'https://online-exam-1256117146.cos.ap-beijing.myqcloud.com/img/exam/02017c3f559b8307455898d3e860673d.jpg', 4, '超级管理员', '2019-03-26 19:42:15', '2019-05-28 22:39:01', 0);
INSERT INTO `subject` VALUES (7, '1', '大数据理论', '大数据专业学生必修课程', 'https://online-exam-1256117146.cos.ap-beijing.myqcloud.com/img/exam/56d9260f1724cd7493eeec4e6c2dcded.jpg', 5, '超级管理员', '2019-04-05 17:32:13', '2019-05-28 22:39:19', 0);
INSERT INTO `subject` VALUES (8, '1', '大学英语综合课程', '大学生必修课程', 'http://edu-image.nosdn.127.net/F65EA321B9CEAA759E7A3E09567125EA.JPG?imageView&thumbnail=426y240&quality=100', 6, '涛涛涛', '2021-04-27 12:06:32', '2021-04-27 12:10:43', 0);
INSERT INTO `subject` VALUES (9, '1', 'web前端开发', '计算机专业必修课程', 'http://edu-image.nosdn.127.net/4D561AF42BB03B2BA9CA349BCE61BFDF.jpg?imageView&quality=100&thumbnail=230y130', 7, '涛涛涛', '2021-04-27 12:07:33', '2021-04-27 12:10:46', 0);
INSERT INTO `subject` VALUES (13, '1', '数据结构与算法', '计算机专业必修课程', 'http://edu-image.nosdn.127.net/8A2FD753FE609F6F62064E95F74432E6.jpg?imageView&thumbnail=426y240&quality=100', 8, '涛 涛', '2021-04-29 06:41:54', '2021-04-29 06:42:56', 0);

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sys_key` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'key',
  `sys_value` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'value',
  `status` tinyint(4) NULL DEFAULT 1 COMMENT '状态   0：隐藏   1：显示',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `key`(`sys_key`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统配置信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, 'SITE_PHONE', '+86-15733593820', 1, '云存储配置信息');
INSERT INTO `sys_config` VALUES (5, 'SITE_FAX', '+86-15733593820', 1, '网站名称');
INSERT INTO `sys_config` VALUES (6, 'SITE_EMAIL', '841423154@qq.com', 1, '网站关键字');
INSERT INTO `sys_config` VALUES (7, 'SITE_ADDRESS', '重庆市XX区XX路', 1, '网站描述');
INSERT INTO `sys_config` VALUES (8, 'SITE_NAME', 'Quer考', 1, '站长头像');
INSERT INTO `sys_config` VALUES (9, 'SITE_URL', 'https://lengao.xyz', 1, '站长名称');
INSERT INTO `sys_config` VALUES (10, 'SITE_DESC', 'Quer考 | Quer考在线考试系统是一个在线测试学习系统，并用于辅助课程教学和学生学习。', 1, '站长描述');
INSERT INTO `sys_config` VALUES (11, 'CLOUD_STORAGE_CONFIG', '{\"type\":3,\"qiniuDomain\":\"\",\"qiniuPrefix\":\"\",\"qiniuAccessKey\":\"\",\"qiniuSecretKey\":\"\",\"qiniuBucketName\":\"\",\"aliyunDomain\":\"\",\"aliyunPrefix\":\"\",\"aliyunEndPoint\":\"\",\"aliyunAccessKeyId\":\"\",\"aliyunAccessKeySecret\":\"\",\"aliyunBucketName\":\"\",\"qcloudDomain\":\"https://online-exam-1305724216.cos.ap-chongqing.myqcloud.com\",\"qcloudPrefix\":\"img/exam\",\"qcloudSecretId\":\"AKIDYOzLWRwSXW57uW94ycyb8THpCKCwYoUV\",\"qcloudSecretKey\":\"uaCYfw88OYVCdxDqEH1XnnmhPE28znLe\",\"qcloudBucketName\":\"online-exam-1305724216\",\"qcloudRegion\":\"ap-chongqing\"}', 1, '百度推送地址');

-- ----------------------------
-- Table structure for tag
-- ----------------------------
DROP TABLE IF EXISTS `tag`;
CREATE TABLE `tag`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '书签名',
  `description` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '添加时间',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of tag
-- ----------------------------
INSERT INTO `tag` VALUES (1, 'Linux', 'Linux', '2018-01-14 21:35:31', '2021-04-27 02:55:26');
INSERT INTO `tag` VALUES (2, 'Java', 'Java', '2018-01-14 21:35:45', '2021-04-27 02:55:30');
INSERT INTO `tag` VALUES (3, 'Spring', 'Spring', '2018-01-14 21:35:52', '2021-04-27 02:55:36');
INSERT INTO `tag` VALUES (4, 'Spring Boot', 'Spring Boot', '2018-01-14 21:36:01', '2021-04-27 02:55:41');
INSERT INTO `tag` VALUES (5, '其他', '其他', '2018-07-25 18:55:06', '2018-07-25 18:55:06');
INSERT INTO `tag` VALUES (6, 'C语言在线考试系统', '在线考试系统', '2019-04-07 18:36:34', '2019-04-07 18:36:34');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户id',
  `class_id` int(11) NULL DEFAULT NULL COMMENT '班级id',
  `face_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '个人描述',
  `salt` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '加密盐值',
  `grade` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '年级',
  `nickname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系方式',
  `sex` int(11) NULL DEFAULT NULL COMMENT '年龄：1男0女',
  `age` int(11) NULL DEFAULT NULL COMMENT '年龄',
  `img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像地址',
  `status` int(11) NOT NULL COMMENT '用户状态：1有效; 2删除',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `last_login_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '最后登录时间',
  PRIMARY KEY (`id`, `user_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (2, '1000001949385290', 11, 'lengao', 'aoaoao', '8871bb26017a42b663e318a3313c1c5b', '', 'fefd468b87c8f8469e89d7bf201cc6a4', '2018', '冷 澳', '841423155@qq.com', '15733593820', 1, 22, 'https://img-blog.csdnimg.cn/20210428091150478.jpg?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80NDg4NDMwNQ==,size_16,color_FFFFFF,t_70#pic_center', 1, '2021-04-26 06:25:57', '2021-04-28 03:48:02', '2021-05-13 09:54:24');
INSERT INTO `user` VALUES (7, '1000000104321715', 11, NULL, 'taotao', '747fec20d33bc3ada4a0c96f30f327ce', '', 'b362a917f1bbe0af704f9108208cc6b1', '2018', '涛 涛', '', '', 1, NULL, '/img/user-default.png', 1, '2021-04-26 08:41:17', '2021-04-28 06:48:15', '2021-05-11 12:46:15');
INSERT INTO `user` VALUES (9, '1000000709878559', 11, NULL, 'DBA', 'f34b12450770dc77ed0f921bf336968c', NULL, '25325e1c1d6a62c0beac64c9ac3d24eb', '2018', 'DBA', '', '', 1, NULL, NULL, 1, '2021-04-26 08:42:38', '2021-04-28 03:12:50', '2021-04-26 09:50:25');
INSERT INTO `user` VALUES (10, '1000001157479099', 16, NULL, 'xiaoxiao', '9f3e3925cdfd468bc319a3df3bd6776b', NULL, '8ec5926d626d3a554f29daf1c8e1e914', '2017', '潇潇潇', '', '', 2, NULL, NULL, 1, '2021-04-26 08:43:22', '2021-04-28 03:13:23', '2021-04-26 08:43:22');
INSERT INTO `user` VALUES (11, '1000000839346914', 16, NULL, 'keke', '97c8eb421d5a8e1fac366936ea225ff5', NULL, '17ba77fd5898c32c9d0f6da0e1f3d2dd', '2015', '柯柯柯', '', '', 1, NULL, NULL, 1, '2021-04-26 08:43:42', '2021-04-28 03:13:36', '2021-04-26 08:43:42');
INSERT INTO `user` VALUES (13, '1000000501575022', 10, NULL, '2018211801', 'f3c8e82c7c0828d2491cbebb627e0a60', NULL, '06d3bfde05d834696d29b1d598ed15f8', '2018', '郑小杰', '', '', 1, NULL, '/img/user-default.png', 1, '2021-04-26 08:46:28', '2021-04-26 08:46:28', '2021-04-26 08:46:28');
INSERT INTO `user` VALUES (14, '1000000702361890', 11, NULL, '2018211802', '8bf35046f62a853ff50ac98243713371', NULL, '1cd3b0930273b3074d7368cfc8eb85d5', '2018', '朱小星', '', '', 2, NULL, '/img/user-default.png', 1, '2021-04-26 08:47:58', '2021-04-26 08:47:58', '2021-04-26 08:47:58');
INSERT INTO `user` VALUES (15, '1000001198571801', 12, NULL, '2018211803', '59e3f00d5193edfccf59ca198ff027f7', NULL, '874721322aff6014546abbcba9414b51', '2018', '郭蓉蓉', '', '', 2, NULL, '/img/user-default.png', 1, '2021-04-26 08:48:21', '2021-04-26 08:48:21', '2021-04-26 08:48:21');
INSERT INTO `user` VALUES (16, '1000000034755920', 13, NULL, '2018211804', '44a050848b27eff1578620f70b0af3b9', NULL, '4e05b5bedf47262b7a771e0745ee6d8b', '2018', '张康康', '', '', 1, NULL, '/img/user-default.png', 1, '2021-04-26 08:49:09', '2021-04-26 08:49:09', '2021-04-26 08:49:09');
INSERT INTO `user` VALUES (17, '1000000861115754', 12, NULL, '2018211805', '8e92c1ad875732a3a76eff52bcbe0cb5', NULL, 'dc5b26769f63d708cce083c6229f8ffd', '2018', '刘星星', '', '', 1, NULL, '/img/user-default.png', 1, '2021-04-26 08:49:38', '2021-04-26 08:49:38', '2021-04-26 08:49:38');
INSERT INTO `user` VALUES (18, '1000001569837070', 10, NULL, '2018211806', '05e2339117f9bf017bc2d0c08ecf6292', NULL, '525c98716eaeca57f343fe49dcf39d0e', '2018', '黄小娜', '', '', 2, NULL, '/img/user-default.png', 1, '2021-04-26 08:50:10', '2021-04-26 08:50:10', '2021-04-26 08:50:10');
INSERT INTO `user` VALUES (19, '1000001792839898', 10, NULL, '2018211807', '557aa5a533abce05b72d90fc0d943b9e', NULL, 'dad540a670eb619c2bd687bb82beee33', '2018', '熊林林', '', '', 1, NULL, '/img/user-default.png', 1, '2021-04-26 08:50:37', '2021-04-26 08:50:37', '2021-04-26 08:50:37');
INSERT INTO `user` VALUES (20, '1000000283633938', 12, NULL, '2018211808', '383a6893fa88190d7fe593f911c0cda4', NULL, '285f273bb9a2cf3464fb0d09ebfba52e', '2018', '罗洪洪', '', '', 2, NULL, '/img/user-default.png', 1, '2021-04-26 08:52:05', '2021-04-26 08:52:05', '2021-04-26 08:52:05');
INSERT INTO `user` VALUES (21, '1000001770857249', 12, NULL, '2018211809', 'a971f177e94272b6ac8b4f5695ac9112', NULL, 'b32ac84fb2292ab4433c29d11191c8fa', '2018', '谭小婷', '', '', 2, NULL, '/img/user-default.png', 1, '2021-04-26 08:53:14', '2021-04-26 08:53:14', '2021-04-26 08:53:14');
INSERT INTO `user` VALUES (22, '1000000860608860', 13, NULL, '2018211810', 'b0293ce07639c32993f0261551df2ea4', NULL, '8e709c288af369b7b328103c00a01233', '2018', '徐小涛', '', '', 1, NULL, '/img/user-default.png', 1, '2021-04-26 08:55:04', '2021-04-26 08:55:04', '2021-04-26 08:55:04');
INSERT INTO `user` VALUES (23, '1000001198613152', 13, NULL, '2018211811', 'fcdd0b5263c42d989f16d8efcb89fc8a', NULL, '06438f16afef1f1e569b9b8566ba4486', '2018', '付发发', '', '', 1, NULL, '/img/user-default.png', 1, '2021-04-26 09:07:36', '2021-04-26 09:07:36', '2021-04-26 09:07:36');
INSERT INTO `user` VALUES (24, '1000001829403433', 13, NULL, '2018211813', '1ffa7134a495520da35343c18e1afbbe', NULL, 'f26984eabdd2c905f8fdcfcc1864e21b', '2018', '代平平', '', '', 1, NULL, '/img/user-default.png', 1, '2021-04-26 09:08:53', '2021-04-26 09:08:53', '2021-04-26 09:08:53');
INSERT INTO `user` VALUES (25, '1000001874993044', 11, NULL, '2018211814', '3e6544a76e19f7ea8c18f520ff2b1101', NULL, '18692bab71ed53aa5ee16fc00ac724b8', '2018', '舒小鹏', '', '', 1, NULL, '/img/user-default.png', 1, '2021-04-26 09:25:43', '2021-04-26 09:25:43', '2021-04-26 10:11:13');
INSERT INTO `user` VALUES (30, '1000000176946191', 13, NULL, '2018211131', '310c2f8d88348e218c591bd92b943ccc', '', 'f83baba49340c608f7571912098cef2f', '2018', '张 波', '', '', 1, 22, '', 1, '2021-04-27 00:51:22', '2021-04-28 16:24:39', '2021-05-03 09:13:54');
INSERT INTO `user` VALUES (31, '1000000121366369', 10, NULL, 'lanlan', 'c64bda3175555d61e12d0b5a8116cfe1', NULL, 'b4cc1ee0258260ffc88dc65c827e4270', '2018', '赵岚岚', '', '', 2, NULL, NULL, 1, '2021-04-27 02:53:56', '2021-04-28 03:12:41', '2021-05-11 11:42:28');
INSERT INTO `user` VALUES (35, '1000001056548025', 11, NULL, '2018211140', 'e8a13e8213a365efef982a44cb2e3aca', NULL, 'dfc404130eead4ae7f42fad102a8e9c2', '2018', '张德帅', '', '', 0, NULL, '/img/user-default.png', 1, '2021-04-28 16:11:17', '2021-04-28 16:11:17', '2021-04-28 16:11:17');
INSERT INTO `user` VALUES (36, '1000001693253255', 10, NULL, 'admin', '887f33c653afa1778aa75a76c599f6e4', NULL, '390a64803844a4eb1344dc3f8535b716', '2018', 'admin', '', '', 1, NULL, '/img/user-default.png', 1, '2021-05-10 09:46:28', '2021-05-10 09:46:28', '2021-05-10 09:51:08');

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户id',
  `role_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `pri2`(`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 47 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES (1, '1', '1');
INSERT INTO `user_role` VALUES (3, '1000001922567951', '1');
INSERT INTO `user_role` VALUES (4, '1000001333028269', '1');
INSERT INTO `user_role` VALUES (6, '1000000285892278', '1');
INSERT INTO `user_role` VALUES (7, '1000000709878559', '4');
INSERT INTO `user_role` VALUES (12, '1000002052979370', '3');
INSERT INTO `user_role` VALUES (13, '1000000501575022', '3');
INSERT INTO `user_role` VALUES (14, '1000000702361890', '3');
INSERT INTO `user_role` VALUES (15, '1000001198571801', '3');
INSERT INTO `user_role` VALUES (16, '1000000034755920', '3');
INSERT INTO `user_role` VALUES (17, '1000000861115754', '3');
INSERT INTO `user_role` VALUES (18, '1000001569837070', '3');
INSERT INTO `user_role` VALUES (19, '1000001792839898', '3');
INSERT INTO `user_role` VALUES (20, '1000000283633938', '3');
INSERT INTO `user_role` VALUES (21, '1000001770857249', '3');
INSERT INTO `user_role` VALUES (22, '1000000860608860', '3');
INSERT INTO `user_role` VALUES (23, '1000001198613152', '3');
INSERT INTO `user_role` VALUES (24, '1000001829403433', '3');
INSERT INTO `user_role` VALUES (27, '1000000898552409', '3');
INSERT INTO `user_role` VALUES (30, '1000000834108987', '3');
INSERT INTO `user_role` VALUES (31, '1000001157479099', '1');
INSERT INTO `user_role` VALUES (32, '1000001157479099', '2');
INSERT INTO `user_role` VALUES (33, '1000000839346914', '1');
INSERT INTO `user_role` VALUES (34, '1000000839346914', '2');
INSERT INTO `user_role` VALUES (35, '1000000871687622', '2');
INSERT INTO `user_role` VALUES (36, '1000000176946191', '3');
INSERT INTO `user_role` VALUES (37, '1000001874993044', '3');
INSERT INTO `user_role` VALUES (38, '1000000121366369', '1');
INSERT INTO `user_role` VALUES (43, '1000000104321715', '1');
INSERT INTO `user_role` VALUES (44, '1000001949385290', '1');
INSERT INTO `user_role` VALUES (45, '1000001949385290', '2');
INSERT INTO `user_role` VALUES (46, '1000001693253255', '1000001673944386');

SET FOREIGN_KEY_CHECKS = 1;
