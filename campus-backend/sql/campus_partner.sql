/*
 Navicat Premium Dump SQL

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80028 (8.0.28)
 Source Host           : localhost:3306
 Source Schema         : campus_partner

 Target Server Type    : MySQL
 Target Server Version : 80028 (8.0.28)
 File Encoding         : 65001

 Date: 03/02/2025 14:18:08
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for blog
-- ----------------------------
DROP TABLE IF EXISTS `blog`;
CREATE TABLE `blog`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint UNSIGNED NOT NULL COMMENT '用户id',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '标题',
  `images` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图片，最多9张，多张以\",\"隔开',
  `content` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '文章',
  `liked_num` int UNSIGNED NULL DEFAULT 0 COMMENT '点赞数量',
  `comments_num` int UNSIGNED NULL DEFAULT 0 COMMENT '评论数量',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '博客表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of blog
-- ----------------------------
INSERT INTO `blog` VALUES (1, 2, '25年如何顺利毕业', 'http://127.0.0.1:9000/campus-partner/avatarUrls/2025-01/1.jpg', '关于2025年如何顺利毕业，很抱歉，我也在未毕业发愁', 2, 1, '2024-12-27 11:34:57', '2025-01-08 23:39:52');
INSERT INTO `blog` VALUES (2, 1, '25如何顺利毕业', 'http://127.0.0.1:9000/campus-partner/avatarUrls/2025-01/4.jpg', '别担心了，总会好起来的。', 1, 1, '2024-12-27 12:51:15', '2025-01-08 23:39:08');
INSERT INTO `blog` VALUES (3, 1, '幸运2025', 'http://127.0.0.1:9000/campus-partner/avatarUrls/2025-01/5.jpg', '2025一定要好运啊', 1, 1, '2024-12-27 15:53:34', '2025-01-08 23:39:57');
INSERT INTO `blog` VALUES (4, 4, '码农聚集体', 'http://127.0.0.1:9000/campus-partner/avatarUrls/2025-01/7.jpg', '码农集合', 1, 1, '2024-12-27 17:41:47', '2025-01-08 23:40:00');
INSERT INTO `blog` VALUES (6, 2, '测试组', 'http://127.0.0.1:9000/campus-partner/avatarUrls/2025-01/4.jpg', 'test', 0, 0, '2024-12-30 15:47:50', '2025-01-08 23:39:08');
INSERT INTO `blog` VALUES (8, 1, '测试', 'http://127.0.0.1:9000/campus-partner/avatarUrls/2025-01/4.jpg', 'test', 1, 0, '2024-12-31 14:50:16', '2025-01-08 23:39:08');
INSERT INTO `blog` VALUES (9, 1, '测试', 'http://127.0.0.1:9000/campus-partner/avatarUrls/2025-01/4.jpg', 'test', 0, 0, '2024-12-31 14:51:59', '2025-01-08 23:39:08');
INSERT INTO `blog` VALUES (10, 1, 'hello', 'http://127.0.0.1:9000/campus-partner/avatarUrls/2025-01/4.jpg', 'h', 0, 0, '2024-12-31 15:43:59', '2025-01-08 23:39:08');
INSERT INTO `blog` VALUES (11, 1, 'test', 'http://127.0.0.1:9000/campus-partner/avatarUrls/2025-01/4.jpg', '啊啊', 1, 0, '2024-12-31 15:44:33', '2025-01-08 23:39:08');
INSERT INTO `blog` VALUES (12, 1, 'aa.', 'http://127.0.0.1:9000/campus-partner/avatarUrls/2025-01/animal2.jpg', 'aa', 0, 0, '2025-01-09 13:35:34', '2025-01-09 13:35:34');
INSERT INTO `blog` VALUES (13, 21, '张三测试组', 'http://127.0.0.1:9000/campus-partner/avatarUrls/2025-01/2.jpg', 'test', 1, 2, '2025-01-09 13:52:07', '2025-01-20 11:38:27');
INSERT INTO `blog` VALUES (14, 21, 'zhangsan', 'http://127.0.0.1:9000/campus-partner/avatarUrls/2025-01/3.jpg', 'test', 0, 0, '2025-01-09 13:52:49', '2025-01-09 13:52:49');

-- ----------------------------
-- Table structure for blog_comments
-- ----------------------------
DROP TABLE IF EXISTS `blog_comments`;
CREATE TABLE `blog_comments`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint UNSIGNED NOT NULL COMMENT '用户id',
  `blog_id` bigint UNSIGNED NOT NULL COMMENT '博文id',
  `parent_id` bigint UNSIGNED NULL DEFAULT NULL COMMENT '关联的1级评论id，如果是一级评论，则值为0',
  `answer_id` bigint UNSIGNED NULL DEFAULT NULL COMMENT '回复的评论id',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '回复的内容',
  `liked_num` int UNSIGNED NULL DEFAULT 0 COMMENT '点赞数',
  `status` tinyint UNSIGNED NULL DEFAULT NULL COMMENT '状态，0：正常，1：被举报，2：禁止查看',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '博客评论信息表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of blog_comments
-- ----------------------------
INSERT INTO `blog_comments` VALUES (1, 1, 1, NULL, NULL, '很敷衍', 1, 0, '2024-12-27 11:58:17', '2024-12-27 17:53:31');
INSERT INTO `blog_comments` VALUES (2, 1, 2, NULL, NULL, '很理智', 1, 0, '2024-12-27 12:54:29', '2024-12-27 13:04:20');
INSERT INTO `blog_comments` VALUES (4, 1, 3, NULL, NULL, '自己点个赞吧，嘿嘿', 1, 0, '2024-12-27 15:54:56', '2024-12-27 17:53:27');
INSERT INTO `blog_comments` VALUES (5, 1, 4, NULL, NULL, '000', 0, 0, '2024-12-27 17:52:53', '2024-12-27 17:52:53');
INSERT INTO `blog_comments` VALUES (6, 21, 13, NULL, NULL, 'fuck you', 0, 0, '2025-01-16 13:48:12', '2025-01-16 13:48:12');
INSERT INTO `blog_comments` VALUES (7, 2, 13, NULL, NULL, '楼上真没礼貌', 0, 0, '2025-01-20 11:38:27', '2025-01-20 11:38:27');

-- ----------------------------
-- Table structure for blog_like
-- ----------------------------
DROP TABLE IF EXISTS `blog_like`;
CREATE TABLE `blog_like`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `blog_id` bigint NOT NULL COMMENT '博文id',
  `user_id` bigint NOT NULL COMMENT '用户id',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_delete` tinyint NULL DEFAULT 0 COMMENT '逻辑删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '博客点赞表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of blog_like
-- ----------------------------
INSERT INTO `blog_like` VALUES (1, 1, 3, '2024-12-27 11:42:41', NULL, 0);
INSERT INTO `blog_like` VALUES (2, 1, 1, '2024-12-27 11:58:09', NULL, 0);
INSERT INTO `blog_like` VALUES (3, 2, 1, '2024-12-27 12:54:22', NULL, 0);
INSERT INTO `blog_like` VALUES (4, 3, 1, '2024-12-27 15:54:46', NULL, 0);
INSERT INTO `blog_like` VALUES (5, 4, 1, '2024-12-27 17:52:49', NULL, 0);
INSERT INTO `blog_like` VALUES (6, 8, 1, '2024-12-31 14:55:09', NULL, 0);
INSERT INTO `blog_like` VALUES (7, 11, 1, '2025-01-08 23:36:45', NULL, 0);
INSERT INTO `blog_like` VALUES (8, 13, 21, '2025-01-16 13:45:13', NULL, 0);

-- ----------------------------
-- Table structure for chat
-- ----------------------------
DROP TABLE IF EXISTS `chat`;
CREATE TABLE `chat`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '聊天记录id',
  `from_id` bigint NOT NULL COMMENT '发送消息id',
  `to_id` bigint NULL DEFAULT NULL COMMENT '接收消息id',
  `text` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `chat_type` tinyint NOT NULL COMMENT '聊天类型 1-私聊 2-群聊',
  `is_read` tinyint NULL DEFAULT 0 COMMENT '是否已读 1-已读 2-未读',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `team_id` bigint NULL DEFAULT NULL,
  `is_delete` tinyint NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 44 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '聊天消息表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of chat
-- ----------------------------
INSERT INTO `chat` VALUES (1, 1, 2, '你好', 1, 1, '2024-12-27 15:51:40', '2024-12-27 15:51:40', NULL, 0);
INSERT INTO `chat` VALUES (2, 2, 1, '你好啊', 1, 1, '2024-12-27 15:52:53', '2024-12-27 15:52:53', NULL, 0);
INSERT INTO `chat` VALUES (3, 1, 2, '嘿嘿', 1, 1, '2024-12-27 15:54:04', '2024-12-27 15:54:04', NULL, 0);
INSERT INTO `chat` VALUES (4, 2, NULL, '有人吗', 3, 0, '2024-12-27 15:55:52', '2024-12-27 15:55:51', NULL, 0);
INSERT INTO `chat` VALUES (5, 3, NULL, '没人，散会', 3, 0, '2024-12-27 15:56:06', '2024-12-27 15:56:05', NULL, 0);
INSERT INTO `chat` VALUES (6, 1, NULL, '。。。有趣', 3, 0, '2024-12-27 15:56:23', '2024-12-27 15:56:22', NULL, 0);
INSERT INTO `chat` VALUES (7, 1, NULL, '好运报道', 2, 0, '2024-12-27 16:29:30', '2024-12-27 16:29:30', 4, 0);
INSERT INTO `chat` VALUES (8, 1, NULL, '啥地方', 2, 0, '2024-12-30 08:14:29', '2024-12-30 08:14:29', 2, 0);
INSERT INTO `chat` VALUES (9, 2, 4, '尼玛', 1, 0, '2024-12-30 17:24:11', '2024-12-30 17:24:10', NULL, 0);
INSERT INTO `chat` VALUES (10, 2, 4, '你吗', 1, 0, '2024-12-30 17:25:30', '2024-12-30 17:25:30', NULL, 0);
INSERT INTO `chat` VALUES (11, 4, NULL, '你好', 2, 0, '2024-12-30 17:30:29', '2024-12-30 17:30:29', 7, 0);
INSERT INTO `chat` VALUES (12, 2, NULL, '尼玛', 2, 0, '2024-12-30 17:30:54', '2024-12-30 17:30:53', 7, 0);
INSERT INTO `chat` VALUES (13, 4, 2, '尼玛', 1, 0, '2024-12-30 17:31:12', '2024-12-30 17:31:11', NULL, 0);
INSERT INTO `chat` VALUES (14, 2, NULL, '？？？', 2, 0, '2024-12-30 17:31:19', '2024-12-30 17:31:19', 7, 0);
INSERT INTO `chat` VALUES (15, 2, 4, '？？？？', 1, 0, '2024-12-30 17:31:48', '2024-12-30 17:31:47', NULL, 0);
INSERT INTO `chat` VALUES (16, 4, 2, '测试失败', 1, 0, '2024-12-30 17:31:56', '2024-12-30 17:31:56', NULL, 0);
INSERT INTO `chat` VALUES (17, 2, NULL, '敏感词问题待解决。。。。', 3, 0, '2024-12-30 18:12:22', '2024-12-30 18:12:22', NULL, 0);
INSERT INTO `chat` VALUES (18, 4, 2, '继续测试', 1, 0, '2024-12-30 20:19:47', '2024-12-30 20:19:47', NULL, 0);
INSERT INTO `chat` VALUES (19, 2, NULL, 'test', 3, 0, '2024-12-30 20:21:01', '2024-12-30 20:21:00', NULL, 0);
INSERT INTO `chat` VALUES (20, 4, NULL, 'test', 2, 0, '2024-12-30 20:25:58', '2024-12-30 20:25:58', 7, 0);
INSERT INTO `chat` VALUES (21, 2, NULL, '在测试一遍', 2, 0, '2024-12-30 20:28:11', '2024-12-30 20:28:10', 7, 0);
INSERT INTO `chat` VALUES (22, 2, NULL, 'continue', 2, 0, '2024-12-30 20:28:42', '2024-12-30 20:28:42', 7, 0);
INSERT INTO `chat` VALUES (23, 2, NULL, '继续吧', 2, 0, '2024-12-30 20:30:57', '2024-12-30 20:30:56', 7, 0);
INSERT INTO `chat` VALUES (24, 2, NULL, '再来一遍', 2, 0, '2024-12-30 20:34:48', '2024-12-30 20:34:48', 7, 0);
INSERT INTO `chat` VALUES (25, 4, NULL, '****', 2, 0, '2024-12-30 21:20:24', '2024-12-30 21:20:24', 7, 0);
INSERT INTO `chat` VALUES (26, 2, NULL, 'hello', 2, 0, '2024-12-30 21:20:43', '2024-12-30 21:20:42', 7, 0);
INSERT INTO `chat` VALUES (27, 4, NULL, '问题不大', 2, 0, '2024-12-30 21:20:51', '2024-12-30 21:20:50', 7, 0);
INSERT INTO `chat` VALUES (28, 2, NULL, '感谢伟大的***', 2, 0, '2024-12-30 21:21:08', '2024-12-30 21:21:08', 7, 0);
INSERT INTO `chat` VALUES (29, 2, NULL, 'hello', 2, 0, '2024-12-30 21:23:37', '2024-12-30 21:23:37', 7, 0);
INSERT INTO `chat` VALUES (30, 4, NULL, '****', 2, 0, '2024-12-30 21:23:45', '2024-12-30 21:23:44', 7, 0);
INSERT INTO `chat` VALUES (31, 4, NULL, '我 靠 你 娘', 2, 0, '2024-12-30 21:27:21', '2024-12-30 21:27:21', 7, 0);
INSERT INTO `chat` VALUES (32, 18, NULL, '敏感词已解决', 3, 0, '2024-12-30 21:36:53', '2024-12-30 21:36:53', NULL, 0);
INSERT INTO `chat` VALUES (33, 18, NULL, '我真棒', 3, 0, '2024-12-30 21:36:59', '2024-12-30 21:36:59', NULL, 0);
INSERT INTO `chat` VALUES (34, 1, 20, '**** you mother every day', 1, 0, '2025-01-09 13:27:01', '2025-01-09 13:27:01', NULL, 0);
INSERT INTO `chat` VALUES (35, 21, NULL, '答辩顺利', 2, 0, '2025-01-09 13:53:49', '2025-01-09 13:53:48', 1, 0);
INSERT INTO `chat` VALUES (36, 2, NULL, '**** you', 2, 0, '2025-01-16 14:08:51', '2025-01-16 14:08:51', 10, 0);
INSERT INTO `chat` VALUES (37, 1, NULL, '**** you', 2, 0, '2025-01-16 14:09:39', '2025-01-16 14:09:39', 4, 0);
INSERT INTO `chat` VALUES (38, 2, NULL, '**** you', 2, 0, '2025-01-16 14:10:41', '2025-01-16 14:10:40', 2, 0);
INSERT INTO `chat` VALUES (39, 1, NULL, 'a', 2, 0, '2025-01-16 17:09:28', '2025-01-16 17:09:27', 9, 0);
INSERT INTO `chat` VALUES (40, 1, NULL, 'a', 2, 0, '2025-01-16 17:12:07', '2025-01-16 17:12:06', 1, 0);
INSERT INTO `chat` VALUES (41, 1, NULL, 'aaa', 2, 0, '2025-01-16 17:13:10', '2025-01-16 17:13:10', 2, 0);
INSERT INTO `chat` VALUES (42, 2, NULL, 'a ', 2, 0, '2025-01-16 17:18:14', '2025-01-16 17:18:13', 2, 0);
INSERT INTO `chat` VALUES (43, 2, 1, 'hello', 1, 0, '2025-01-20 10:36:20', '2025-01-20 10:36:20', NULL, 0);

-- ----------------------------
-- Table structure for comment_like
-- ----------------------------
DROP TABLE IF EXISTS `comment_like`;
CREATE TABLE `comment_like`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `comment_id` bigint NOT NULL COMMENT '评论id',
  `user_id` bigint NOT NULL COMMENT '用户id',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_delete` tinyint NULL DEFAULT 0 COMMENT '逻辑删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '评论点赞表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of comment_like
-- ----------------------------
INSERT INTO `comment_like` VALUES (1, 2, 1, '2024-12-27 13:04:20', '2024-12-27 13:04:20', 0);
INSERT INTO `comment_like` VALUES (2, 4, 4, '2024-12-27 17:53:27', '2024-12-27 17:53:27', 0);
INSERT INTO `comment_like` VALUES (3, 1, 4, '2024-12-27 17:53:31', '2024-12-27 17:53:31', 0);

-- ----------------------------
-- Table structure for config
-- ----------------------------
DROP TABLE IF EXISTS `config`;
CREATE TABLE `config`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `value` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '数据',
  `type` tinyint NULL DEFAULT NULL COMMENT '0-通知栏 1-轮播图',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_delete` tinyint NULL DEFAULT 0 COMMENT '逻辑删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统配置表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of config
-- ----------------------------
INSERT INTO `config` VALUES (3, 'http://172.20.89.208:9000/campus-partner/null2024-12/animal6.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=pJLYfyc4dLZIFUo20rAj%2F20241231%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20241231T072503Z&X-Amz-Expires=604800&X-Amz-SignedHeaders=host&X-Amz-Signature=a13a0a78b95ddf038a0b210259efc3029ff19057f561c6025b5ebae8a446a0d9', 1, '2024-12-31 15:29:03', '2024-12-31 15:29:03', 0);

-- ----------------------------
-- Table structure for follow
-- ----------------------------
DROP TABLE IF EXISTS `follow`;
CREATE TABLE `follow`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint UNSIGNED NOT NULL COMMENT '用户id',
  `follow_user_id` bigint UNSIGNED NOT NULL COMMENT '关注的用户id',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_delete` tinyint NULL DEFAULT 0 COMMENT '逻辑删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户关注' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of follow
-- ----------------------------
INSERT INTO `follow` VALUES (1, 3, 2, '2024-12-27 11:42:35', '2024-12-27 11:42:35', 0);
INSERT INTO `follow` VALUES (2, 2, 1, '2024-12-27 15:32:00', '2024-12-27 15:55:15', 1);
INSERT INTO `follow` VALUES (3, 2, 1, '2024-12-27 15:55:17', '2024-12-27 15:55:17', 0);
INSERT INTO `follow` VALUES (4, 1, 2, '2025-01-14 11:39:27', '2025-01-14 11:39:51', 1);

-- ----------------------------
-- Table structure for friends
-- ----------------------------
DROP TABLE IF EXISTS `friends`;
CREATE TABLE `friends`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '好友申请id',
  `from_id` bigint NOT NULL COMMENT '发送申请的用户id',
  `receive_id` bigint NULL DEFAULT NULL COMMENT '接收申请的用户id ',
  `is_read` tinyint NOT NULL DEFAULT 0 COMMENT '是否已读(0-未读 1-已读)',
  `status` tinyint NOT NULL DEFAULT 0 COMMENT '申请状态 默认0 （0-未通过 1-已同意 2-已过期 3-不同意）',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `is_delete` tinyint NOT NULL DEFAULT 0 COMMENT '是否删除',
  `remark` varchar(214) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '好友申请备注信息',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '好友申请管理表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of friends
-- ----------------------------
INSERT INTO `friends` VALUES (1, 1, 2, 0, 1, '2024-12-27 12:57:54', '2024-12-27 12:57:54', 0, '我是zhourx');
INSERT INTO `friends` VALUES (2, 2, 1, 0, 1, '2024-12-27 12:59:42', '2024-12-27 12:59:41', 0, '我是dongcl');
INSERT INTO `friends` VALUES (3, 2, 3, 0, 1, '2024-12-27 13:01:13', '2024-12-27 13:01:13', 0, '1');
INSERT INTO `friends` VALUES (4, 1, 4, 1, 1, '2024-12-27 17:40:34', '2024-12-27 17:40:34', 0, NULL);
INSERT INTO `friends` VALUES (5, 4, 1, 1, 1, '2024-12-27 17:40:34', '2024-12-27 17:40:34', 0, '我是denggw');

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `type` tinyint NULL DEFAULT NULL COMMENT '类型-1 点赞',
  `from_id` bigint NULL DEFAULT NULL COMMENT '消息发送的用户id',
  `to_id` bigint NULL DEFAULT NULL COMMENT '消息接收的用户id',
  `data` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '消息内容',
  `is_read` tinyint NULL DEFAULT 0 COMMENT '已读-0 未读 ,1 已读',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_delete` tinyint NULL DEFAULT 0 COMMENT '逻辑删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '消息表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES (1, 0, 3, 2, '1', 1, '2024-12-27 11:42:41', '2024-12-27 12:55:14', 0);
INSERT INTO `message` VALUES (2, 0, 1, 2, '1', 1, '2024-12-27 11:58:09', '2024-12-27 12:55:14', 0);
INSERT INTO `message` VALUES (3, 0, 1, 1, '2', 1, '2024-12-27 12:54:22', '2024-12-27 12:57:18', 0);
INSERT INTO `message` VALUES (4, 1, 1, 1, '2', 1, '2024-12-27 13:04:20', '2024-12-27 13:48:42', 0);
INSERT INTO `message` VALUES (5, 0, 1, 1, '3', 1, '2024-12-27 15:54:46', '2024-12-27 15:56:11', 0);
INSERT INTO `message` VALUES (6, 0, 1, 4, '4', 1, '2024-12-27 17:52:49', '2024-12-27 17:53:15', 0);
INSERT INTO `message` VALUES (7, 1, 4, 1, '4', 1, '2024-12-27 17:53:27', '2024-12-31 14:59:56', 0);
INSERT INTO `message` VALUES (8, 1, 4, 1, '1', 1, '2024-12-27 17:53:31', '2024-12-31 14:59:56', 0);
INSERT INTO `message` VALUES (9, 0, 1, 1, '8', 1, '2024-12-31 14:55:09', '2024-12-31 14:59:56', 0);
INSERT INTO `message` VALUES (10, 0, 1, 1, '11', 1, '2025-01-08 23:36:45', '2025-01-20 11:37:59', 0);
INSERT INTO `message` VALUES (11, 0, 21, 21, '13', 0, '2025-01-16 13:45:13', '2025-01-16 13:45:13', 0);

-- ----------------------------
-- Table structure for sign
-- ----------------------------
DROP TABLE IF EXISTS `sign`;
CREATE TABLE `sign`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint NOT NULL COMMENT '用户id',
  `sign_date` datetime NOT NULL COMMENT '签到的日期',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `is_backup` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否补签 0-不补签 1-补签',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '签到表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sign
-- ----------------------------
INSERT INTO `sign` VALUES (1, 2, '2024-12-27 00:00:00', '2024-12-27 11:36:17', '2024-12-27 11:36:17', 0);
INSERT INTO `sign` VALUES (2, 3, '2024-12-27 00:00:00', '2024-12-27 11:41:53', '2024-12-27 11:41:53', 0);
INSERT INTO `sign` VALUES (3, 1, '2024-12-27 00:00:00', '2024-12-27 11:58:37', '2024-12-27 11:58:37', 0);
INSERT INTO `sign` VALUES (4, 6, '2024-12-27 17:12:18', '2024-12-27 17:12:17', '2024-12-27 17:12:17', 0);
INSERT INTO `sign` VALUES (5, 1, '2024-12-30 08:08:43', '2024-12-30 08:08:42', '2024-12-30 08:08:42', 0);
INSERT INTO `sign` VALUES (6, 17, '2024-12-30 15:22:12', '2024-12-30 15:22:11', '2024-12-30 15:22:11', 0);
INSERT INTO `sign` VALUES (7, 4, '2024-12-30 17:23:38', '2024-12-30 17:23:38', '2024-12-30 17:23:38', 0);
INSERT INTO `sign` VALUES (8, 18, '2024-12-30 21:36:26', '2024-12-30 21:36:26', '2024-12-30 21:36:26', 0);
INSERT INTO `sign` VALUES (9, 1, '2024-12-31 16:06:00', '2024-12-31 16:06:00', '2024-12-31 16:06:00', 0);
INSERT INTO `sign` VALUES (10, 2, '2025-01-14 16:02:16', '2025-01-14 16:02:16', '2025-01-14 16:02:16', 0);
INSERT INTO `sign` VALUES (11, 1, '2025-01-14 16:02:22', '2025-01-14 16:02:21', '2025-01-14 16:02:21', 0);
INSERT INTO `sign` VALUES (12, 2, '2025-01-22 12:50:21', '2025-01-22 12:50:20', '2025-01-22 12:50:20', 0);
INSERT INTO `sign` VALUES (13, 1, '2025-01-22 12:50:35', '2025-01-22 12:50:34', '2025-01-22 12:50:34', 0);
INSERT INTO `sign` VALUES (14, 1, '2025-01-23 12:33:22', '2025-01-23 12:33:22', '2025-01-23 12:33:22', 0);
INSERT INTO `sign` VALUES (15, 45, '2025-02-03 09:48:58', '2025-02-03 09:48:57', '2025-02-03 09:48:57', 0);

-- ----------------------------
-- Table structure for tag
-- ----------------------------
DROP TABLE IF EXISTS `tag`;
CREATE TABLE `tag`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `tag_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标签名称',
  `user_id` bigint NULL DEFAULT NULL COMMENT '上传用户id',
  `parent_id` bigint NULL DEFAULT NULL COMMENT '父标签id',
  `is_parent` tinyint NOT NULL COMMENT '0-不是父标签，1-父标签',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `is_delete` tinyint NOT NULL DEFAULT 0 COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniIdx_tagName`(`tag_name` ASC) USING BTREE,
  INDEX `Idx_userId`(`user_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '标签表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of tag
-- ----------------------------

-- ----------------------------
-- Table structure for team
-- ----------------------------
DROP TABLE IF EXISTS `team`;
CREATE TABLE `team`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '队伍名称',
  `description` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `cover_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '封面图片',
  `max_num` int NOT NULL DEFAULT 10 COMMENT '最大人数',
  `expire_time` datetime NULL DEFAULT NULL COMMENT '过期时间',
  `user_id` bigint NULL DEFAULT NULL COMMENT '用户id',
  `status` int NOT NULL DEFAULT 0 COMMENT '0 - 公开，1 - 私有，2 - 加密',
  `password` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '密码',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_delete` tinyint NOT NULL DEFAULT 0 COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '队伍表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of team
-- ----------------------------
INSERT INTO `team` VALUES (1, '25毕业季咱们一定好运', '祝我们好运', 'http://127.0.0.1:9000/campus-partner/avatarUrls/2025-01/1.jpg', 10, '2025-01-29 00:00:00', 1, 0, '', '2024-12-27 11:21:36', '2025-02-03 09:50:00', 1);
INSERT INTO `team` VALUES (2, '安徽建筑大学', '25届安徽建筑大学毕业生', NULL, 5, '2025-04-30 00:00:00', 1, 2, '1234', '2024-12-27 11:22:31', '2024-12-27 00:00:00', 0);
INSERT INTO `team` VALUES (3, '安徽职业技术学院', '25安职院联培毕业生', NULL, 10, '2025-06-25 00:00:00', 1, 2, '1234', '2024-12-27 11:23:25', '2024-12-27 11:23:25', 0);
INSERT INTO `team` VALUES (4, '25好运狗', '25毕业的好运狗集合地', NULL, 10, '2025-06-27 00:00:00', 2, 0, '', '2024-12-27 11:34:16', '2024-12-27 11:34:16', 0);
INSERT INTO `team` VALUES (5, '25省考皆好运', '祝我们25年省考顺利', NULL, 3, '2025-01-15 00:00:00', 1, 0, '', '2024-12-27 12:57:03', '2025-01-15 12:07:00', 1);
INSERT INTO `team` VALUES (6, '码农聚集体', '编玛爱好者', NULL, 4, NULL, 4, 0, '', '2024-12-27 17:42:50', '2024-12-27 17:43:32', 1);
INSERT INTO `team` VALUES (7, '测试组', 'test', 'http://127.0.0.1:9000/campus-partner/null2024-12/4.jpg', 5, NULL, 2, 0, '', '2024-12-30 15:48:21', '2025-01-09 13:30:25', 1);
INSERT INTO `team` VALUES (8, '在测试一次吧', 'test', 'http://127.0.0.1:9000/campus-partner/null2024-12/2.jpg', 4, NULL, 20, 0, '', '2024-12-31 15:49:30', '2025-01-08 23:35:44', 0);
INSERT INTO `team` VALUES (9, '测试组', 'test', 'http://127.0.0.1:9000/campus-partner/avatarUrls/2025-01/6.jpg', 6, NULL, 1, 0, '', '2025-01-09 13:30:42', '2025-01-09 13:30:51', 0);
INSERT INTO `team` VALUES (10, 'zhangsan', 'test', 'http://127.0.0.1:9000/campus-partner/avatarUrls/2025-01/3.jpg', 6, NULL, 21, 0, '', '2025-01-09 13:53:10', '2025-01-09 13:53:24', 0);
INSERT INTO `team` VALUES (11, '哦吼', '加密', NULL, 6, NULL, 2, 2, '1234', '2025-01-23 09:55:01', '2025-01-23 09:55:01', 0);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户昵称',
  `password` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户密码',
  `user_account` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '账号',
  `avatar_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户头像',
  `gender` tinyint NOT NULL DEFAULT 1 COMMENT '性别 0-女 1-男 2-保密',
  `profile` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `email` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` int NULL DEFAULT 0 COMMENT '用户状态，0为正常',
  `role` int NOT NULL DEFAULT 0 COMMENT '用户角色 0-普通用户,1-管理员',
  `friend_ids` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tags` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标签列表',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_delete` tinyint NOT NULL DEFAULT 0 COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniIdx_account`(`user_account` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 48 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '周小新 ', '18558495a1a805260a8a5ea94c94e02d', 'zhourx', 'http://127.0.0.1:9000/campus-partner/avatarUrls/2025-01/animal5.jpg', 1, '25一把过', '13333333333', 'zhourx111@end.tw', 0, 1, '[2,4]', '[\"安徽职业技术大学\"]', '2024-12-27 11:18:18', '2025-01-22 10:33:13', 0);
INSERT INTO `user` VALUES (2, '董小龙', '18558495a1a805260a8a5ea94c94e02d', 'dongcl', 'http://127.0.0.1:9000/campus-partner/avatarUrls/2025-01/animal2.jpg', 1, 'lucky', '14444444444', 'zhourx2@end.tw', 0, 0, '[1,3]', '[\"男\",\"大四\",\"Python\",\"游戏\",\"设计师\"]', '2024-12-27 11:30:15', '2025-01-16 10:05:20', 0);
INSERT INTO `user` VALUES (3, '陈小星', '18558495a1a805260a8a5ea94c94e02d', 'chenx', 'http://127.0.0.1:9000/campus-partner/avatarUrls/2025-01/animal4.jpg', 1, NULL, '15555555555', 'zhourx3@end.tw', 0, 0, '[2]', '[\"保密\",\"大四\",\"JavaScript\",\"阅读\",\"学生\"]', '2024-12-27 11:39:42', '2025-01-16 10:05:24', 0);
INSERT INTO `user` VALUES (4, 'denggw', 'e9b37e6d735b70d863c200a480bb207c', 'denggw', 'http://127.0.0.1:9000/campus-partner/avatarUrls/2025-01/animal2.jpg', 1, NULL, '16666666666', 'zhourx4@end.tw', 0, 0, '[1]', '[\"男\",\"大四\",\"TypeScript\",\"Python\",\"Java\",\"JavaScript\",\"游戏\",\"程序员\",\"学生\"]', '2024-12-27 16:42:24', '2025-01-16 10:05:27', 0);
INSERT INTO `user` VALUES (5, 'zhuch', '18558495a1a805260a8a5ea94c94e02d', 'zhuch', 'http://127.0.0.1:9000/campus-partner/avatarUrls/2025-01/animal2.jpg', 1, NULL, '17777777777', 'zhourx5@end.tw', 0, 0, NULL, '[\"男\",\"大四\",\"Java\",\"美食\",\"市场营销\",\"安徽职业技术大学\"]', '2024-12-27 16:58:06', '2025-01-16 11:00:00', 0);
INSERT INTO `user` VALUES (6, 'wangy', '18558495a1a805260a8a5ea94c94e02d', 'wangy', 'http://127.0.0.1:9000/campus-partner/avatarUrls/2025-01/animal5.jpg', 1, NULL, '18888888888', 'zhourx6@end.tw', 0, 0, NULL, '[]', '2024-12-27 17:11:36', '2025-01-16 11:06:46', 0);
INSERT INTO `user` VALUES (17, 'AAAAA叶小美', '5bf7071388bc08ebeb56ebb8f324dc36', 'AAAAA叶小美', 'http://127.0.0.1:9000/campus-partner/avatarUrls/2025-01/animal5.jpg', 1, NULL, '13456789098', 'zhourx7@end.tw', 0, 0, NULL, '[\"女\",\"高一\",\"Java\",\"健身\",\"美食\",\"音乐\",\"羽毛球\",\"绘画\",\"投资银行家\"]', '2024-12-30 15:01:15', '2025-01-16 11:06:49', 0);
INSERT INTO `user` VALUES (18, '周小胖aaa', '18558495a1a805260a8a5ea94c94e02d', '周小胖aaa', 'http://127.0.0.1:9000/campus-partner/avatarUrls/2025-01/animal5.jpg', 1, NULL, '13111111112', 'zhourx8@end.tw', 0, 0, NULL, '[\"男\",\"安徽建筑大学\",\"已工作\",\"游戏\",\"销售\"]', '2024-12-30 21:34:19', '2025-01-16 11:06:51', 1);
INSERT INTO `user` VALUES (19, 'linrx', '18558495a1a805260a8a5ea94c94e02d', 'linrx', 'http://127.0.0.1:9000/campus-partner/avatarUrls/2025-01/animal5.jpg', 1, NULL, '13222222220', 'zhourx9@end.tw', 0, 0, NULL, '[\"女\",\"安徽建筑大学\",\"大四\",\"PHP\",\"学生\"]', '2024-12-31 13:42:47', '2025-01-16 11:06:54', 0);
INSERT INTO `user` VALUES (20, 'cibufan', '18558495a1a805260a8a5ea94c94e02d', 'cibufan', 'http://172.20.89.208:9000/campus-partner/null2024-12/4.jpg', 1, NULL, '15000111111', 'zhourx10@end.tw', 0, 0, NULL, '[]', '2024-12-31 14:04:48', '2025-01-16 10:05:47', 1);
INSERT INTO `user` VALUES (21, 'zhangsan', '18558495a1a805260a8a5ea94c94e02d', 'zhangsan', 'http://127.0.0.1:9000/campus-partner/avatarUrls/2025-01/animal6.jpg', 1, NULL, '19999999999', 'zhourx11@end.tw', 0, 0, NULL, '[\"男\",\"安徽职业技术学院\",\"已工作\",\"Java\",\"游戏\",\"教师\"]', '2025-01-09 13:51:01', '2025-01-16 10:05:51', 0);
INSERT INTO `user` VALUES (23, 'lisi', '18558495a1a805260a8a5ea94c94e02d', 'lisi', 'http://127.0.0.1:9000/campus-partner/avatarUrls/2025-01/animal6.jpg', 1, NULL, '13131313131', NULL, 0, 0, NULL, '[]', '2025-01-14 14:18:16', '2025-01-14 15:52:33', 0);
INSERT INTO `user` VALUES (43, 'zhourx111', '18558495a1a805260a8a5ea94c94e02d', 'zhourx111', 'http://127.0.0.1:9000/campus-partner/avatarUrls/2025-01/animal5.jpg', 1, NULL, '13323563456', NULL, 0, 0, NULL, '[]', '2025-01-15 16:13:13', '2025-01-16 11:07:03', 0);
INSERT INTO `user` VALUES (44, 'test', 'aacc018d5b20d76266bc712e2b849258', 'test', 'http://127.0.0.1:9000/campus-partner/avatarUrls/2025-01/campus.jpg', 1, NULL, '15533333333', NULL, 0, 0, NULL, '[]', '2025-01-19 15:26:56', '2025-01-19 15:31:39', 0);
INSERT INTO `user` VALUES (47, 'wanger', '18558495a1a805260a8a5ea94c94e02d', 'wanger', 'http://127.0.0.1:9000/campus-partner/avatarUrls/2025-01/animal2.jpg', 1, NULL, '13333333437', 'zhourx.sleet066@simplelogin.com', 0, 0, NULL, '[]', '2025-02-03 14:02:28', '2025-02-03 14:14:49', 0);

-- ----------------------------
-- Table structure for user_team
-- ----------------------------
DROP TABLE IF EXISTS `user_team`;
CREATE TABLE `user_team`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` bigint NULL DEFAULT NULL COMMENT '用户id',
  `team_id` bigint NULL DEFAULT NULL COMMENT '队伍id',
  `join_time` datetime NULL DEFAULT NULL COMMENT '加入时间',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_delete` tinyint NOT NULL DEFAULT 0 COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户队伍关系' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of user_team
-- ----------------------------
INSERT INTO `user_team` VALUES (1, 1, 1, '2024-12-27 11:21:37', '2024-12-27 11:21:36', '2025-02-03 09:50:00', 1);
INSERT INTO `user_team` VALUES (2, 1, 2, '2024-12-27 11:22:32', '2024-12-27 11:22:31', '2024-12-27 11:22:31', 0);
INSERT INTO `user_team` VALUES (3, 1, 3, '2024-12-27 11:23:25', '2024-12-27 11:23:25', '2024-12-27 11:23:25', 0);
INSERT INTO `user_team` VALUES (4, 2, 2, '2024-12-27 11:31:28', '2024-12-27 11:31:27', '2024-12-27 12:50:06', 1);
INSERT INTO `user_team` VALUES (5, 2, 1, '2024-12-27 11:33:30', '2024-12-27 11:33:29', '2024-12-27 11:33:31', 1);
INSERT INTO `user_team` VALUES (6, 2, 1, '2024-12-27 11:33:34', '2024-12-27 11:33:33', '2024-12-27 11:33:34', 1);
INSERT INTO `user_team` VALUES (7, 2, 3, '2024-12-27 11:33:40', '2024-12-27 11:33:40', '2024-12-27 11:33:40', 0);
INSERT INTO `user_team` VALUES (8, 2, 4, '2024-12-27 11:34:16', '2024-12-27 11:34:16', '2024-12-27 11:34:16', 0);
INSERT INTO `user_team` VALUES (9, 2, 1, '2024-12-27 11:34:21', '2024-12-27 11:34:21', '2024-12-27 11:34:22', 1);
INSERT INTO `user_team` VALUES (10, 3, 2, '2024-12-27 11:42:14', '2024-12-27 11:42:13', '2024-12-27 11:42:13', 0);
INSERT INTO `user_team` VALUES (11, 3, 3, '2024-12-27 11:42:17', '2024-12-27 11:42:16', '2024-12-27 11:42:16', 0);
INSERT INTO `user_team` VALUES (12, 2, 2, '2024-12-27 12:55:31', '2024-12-27 12:55:31', '2024-12-27 12:55:31', 0);
INSERT INTO `user_team` VALUES (13, 1, 4, '2024-12-27 12:56:34', '2024-12-27 12:56:33', '2024-12-27 12:56:33', 0);
INSERT INTO `user_team` VALUES (14, 1, 5, '2024-12-27 12:57:03', '2024-12-27 12:57:03', '2025-01-15 12:07:00', 1);
INSERT INTO `user_team` VALUES (15, 3, 5, '2024-12-27 12:59:28', '2024-12-27 12:59:27', '2025-01-15 12:07:00', 1);
INSERT INTO `user_team` VALUES (16, 2, 5, '2024-12-27 13:01:07', '2024-12-27 13:01:06', '2025-01-15 12:07:00', 1);
INSERT INTO `user_team` VALUES (17, 4, 6, '2024-12-27 17:42:50', '2024-12-27 17:42:50', '2024-12-27 17:43:32', 1);
INSERT INTO `user_team` VALUES (18, 1, 6, '2024-12-27 17:43:19', '2024-12-27 17:43:18', '2024-12-27 17:43:32', 1);
INSERT INTO `user_team` VALUES (19, 2, 6, '2024-12-27 17:43:26', '2024-12-27 17:43:25', '2024-12-27 17:43:32', 1);
INSERT INTO `user_team` VALUES (20, 2, 7, '2024-12-30 15:48:21', '2024-12-30 15:48:21', '2025-01-09 13:30:25', 1);
INSERT INTO `user_team` VALUES (21, 4, 7, '2024-12-30 17:30:04', '2024-12-30 17:30:04', '2025-01-09 13:30:25', 1);
INSERT INTO `user_team` VALUES (22, 20, 8, '2024-12-31 15:49:31', '2024-12-31 15:49:30', '2024-12-31 15:49:30', 0);
INSERT INTO `user_team` VALUES (23, 1, 9, '2025-01-09 13:30:42', '2025-01-09 13:30:42', '2025-01-09 13:30:42', 0);
INSERT INTO `user_team` VALUES (24, 21, 1, '2025-01-09 13:51:31', '2025-01-09 13:51:31', '2025-02-03 09:50:00', 1);
INSERT INTO `user_team` VALUES (25, 21, 2, '2025-01-09 13:51:38', '2025-01-09 13:51:37', '2025-01-09 13:51:37', 0);
INSERT INTO `user_team` VALUES (26, 21, 3, '2025-01-09 13:51:44', '2025-01-09 13:51:43', '2025-01-09 13:51:43', 0);
INSERT INTO `user_team` VALUES (27, 21, 10, '2025-01-09 13:53:10', '2025-01-09 13:53:10', '2025-01-09 13:53:10', 0);
INSERT INTO `user_team` VALUES (28, 2, 10, '2025-01-16 14:02:54', '2025-01-16 14:02:53', '2025-01-16 14:02:53', 0);
INSERT INTO `user_team` VALUES (29, 44, 1, '2025-01-19 17:55:40', '2025-01-19 17:55:39', '2025-02-03 09:50:00', 1);
INSERT INTO `user_team` VALUES (30, 44, 4, '2025-01-19 17:55:42', '2025-01-19 17:55:42', '2025-01-19 17:55:42', 0);
INSERT INTO `user_team` VALUES (31, 2, 11, '2025-01-23 09:55:02', '2025-01-23 09:55:01', '2025-01-23 09:55:01', 0);

SET FOREIGN_KEY_CHECKS = 1;
