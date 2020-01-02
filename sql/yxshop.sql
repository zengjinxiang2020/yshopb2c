/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50723
 Source Host           : localhost:3306
 Source Schema         : yxshop

 Target Server Type    : MySQL
 Target Server Version : 50723
 File Encoding         : 65001

 Date: 02/01/2020 11:42:22
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for alipay_config
-- ----------------------------
DROP TABLE IF EXISTS `alipay_config`;
CREATE TABLE `alipay_config`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `app_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '应用ID',
  `charset` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '编码',
  `format` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型 固定格式json',
  `gateway_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '网关地址',
  `notify_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '异步回调',
  `private_key` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '私钥',
  `public_key` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '公钥',
  `return_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '回调地址',
  `sign_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '签名方式',
  `sys_service_provider_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商户号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of alipay_config
-- ----------------------------
INSERT INTO `alipay_config` VALUES (1, '2016091700532697', 'utf-8', 'JSON', 'https://openapi.alipaydev.com/gateway.do', 'http://api.auauz.net/api/aliPay/notify', 'MIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQC5js8sInU10AJ0cAQ8UMMyXrQ+oHZEkVt5lBwsStmTJ7YikVYgbskx1YYEXTojRsWCb+SH/kDmDU4pK/u91SJ4KFCRMF2411piYuXU/jF96zKrADznYh/zAraqT6hvAIVtQAlMHN53nx16rLzZ/8jDEkaSwT7+HvHiS+7sxSojnu/3oV7BtgISoUNstmSe8WpWHOaWv19xyS+Mce9MY4BfseFhzTICUymUQdd/8hXA28/H6osUfAgsnxAKv7Wil3aJSgaJczWuflYOve0dJ3InZkhw5Cvr0atwpk8YKBQjy5CdkoHqvkOcIB+cYHXJKzOE5tqU7inSwVbHzOLQ3XbnAgMBAAECggEAVJp5eT0Ixg1eYSqFs9568WdetUNCSUchNxDBu6wxAbhUgfRUGZuJnnAll63OCTGGck+EGkFh48JjRcBpGoeoHLL88QXlZZbC/iLrea6gcDIhuvfzzOffe1RcZtDFEj9hlotg8dQj1tS0gy9pN9g4+EBH7zeu+fyv+qb2e/v1l6FkISXUjpkD7RLQr3ykjiiEw9BpeKb7j5s7Kdx1NNIzhkcQKNqlk8JrTGDNInbDM6inZfwwIO2R1DHinwdfKWkvOTODTYa2MoAvVMFT9Bec9FbLpoWp7ogv1JMV9svgrcF9XLzANZ/OQvkbe9TV9GWYvIbxN6qwQioKCWO4GPnCAQKBgQDgW5MgfhX8yjXqoaUy/d1VjI8dHeIyw8d+OBAYwaxRSlCfyQ+tieWcR2HdTzPca0T0GkWcKZm0ei5xRURgxt4DUDLXNh26HG0qObbtLJdu/AuBUuCqgOiLqJ2f1uIbrz6OZUHns+bT/jGW2Ws8+C13zTCZkZt9CaQsrp3QOGDx5wKBgQDTul39hp3ZPwGNFeZdkGoUoViOSd5Lhowd5wYMGAEXWRLlU8z+smT5v0POz9JnIbCRchIY2FAPKRdVTICzmPk2EPJFxYTcwaNbVqL6lN7J2IlXXMiit5QbiLauo55w7plwV6LQmKm9KV7JsZs5XwqF7CEovI7GevFzyD3w+uizAQKBgC3LY1eRhOlpWOIAhpjG6qOoohmeXOphvdmMlfSHq6WYFqbWwmV4rS5d/6LNpNdL6fItXqIGd8I34jzql49taCmi+A2nlR/E559j0mvM20gjGDIYeZUz5MOE8k+K6/IcrhcgofgqZ2ZED1ksHdB/E8DNWCswZl16V1FrfvjeWSNnAoGAMrBplCrIW5xz+J0Hm9rZKrs+AkK5D4fUv8vxbK/KgxZ2KaUYbNm0xv39c+PZUYuFRCz1HDGdaSPDTE6WeWjkMQd5mS6ikl9hhpqFRkyh0d0fdGToO9yLftQKOGE/q3XUEktI1XvXF0xyPwNgUCnq0QkpHyGVZPtGFxwXiDvpvgECgYA5PoB+nY8iDiRaJNko9w0hL4AeKogwf+4TbCw+KWVEn6jhuJa4LFTdSqp89PktQaoVpwv92el/AhYjWOl/jVCm122f9b7GyoelbjMNolToDwe5pF5RnSpEuDdLy9MfE8LnE3PlbE7E5BipQ3UjSebkgNboLHH/lNZA5qvEtvbfvQ==', 'MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAut9evKRuHJ/2QNfDlLwvN/S8l9hRAgPbb0u61bm4AtzaTGsLeMtScetxTWJnVvAVpMS9luhEJjt+Sbk5TNLArsgzzwARgaTKOLMT1TvWAK5EbHyI+eSrc3s7Awe1VYGwcubRFWDm16eQLv0k7iqiw+4mweHSz/wWyvBJVgwLoQ02btVtAQErCfSJCOmt0Q/oJQjj08YNRV4EKzB19+f5A+HQVAKy72dSybTzAK+3FPtTtNen/+b5wGeat7c32dhYHnGorPkPeXLtsqqUTp1su5fMfd4lElNdZaoCI7osZxWWUo17vBCZnyeXc9fk0qwD9mK6yRAxNbrY72Xx5VqIqwIDAQAB', 'http://api.auauz.net/api/aliPay/return', 'RSA2', '2088102176044281');

-- ----------------------------
-- Table structure for dept
-- ----------------------------
DROP TABLE IF EXISTS `dept`;
CREATE TABLE `dept`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `pid` bigint(20) NOT NULL COMMENT '上级部门',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `enabled` bit(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of dept
-- ----------------------------
INSERT INTO `dept` VALUES (1, 'yshop', 0, '2019-03-25 09:14:05', b'1');
INSERT INTO `dept` VALUES (2, '研发部', 7, '2019-03-25 09:15:32', b'1');
INSERT INTO `dept` VALUES (5, '运维部', 7, '2019-03-25 09:20:44', b'1');
INSERT INTO `dept` VALUES (6, '测试部', 8, '2019-03-25 09:52:18', b'1');
INSERT INTO `dept` VALUES (7, '华南分部', 1, '2019-03-25 11:04:50', b'1');
INSERT INTO `dept` VALUES (8, '华北分部', 1, '2019-03-25 11:04:53', b'1');
INSERT INTO `dept` VALUES (9, '财务部', 7, '2019-03-25 11:05:34', b'1');
INSERT INTO `dept` VALUES (10, '行政部', 8, '2019-03-25 11:05:58', b'1');
INSERT INTO `dept` VALUES (11, '人事部', 8, '2019-03-25 11:07:58', b'1');
INSERT INTO `dept` VALUES (12, '市场部', 7, '2019-03-25 11:10:24', b'0');

-- ----------------------------
-- Table structure for dict
-- ----------------------------
DROP TABLE IF EXISTS `dict`;
CREATE TABLE `dict`  (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字典名称',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of dict
-- ----------------------------
INSERT INTO `dict` VALUES (1, 'user_status', '用户状态');
INSERT INTO `dict` VALUES (4, 'dept_status', '部门状态');
INSERT INTO `dict` VALUES (5, 'job_status', '岗位状态');
INSERT INTO `dict` VALUES (7, 'cate_show_status', '商品分类显示状态');
INSERT INTO `dict` VALUES (8, 'express_companys', '快递公司');

-- ----------------------------
-- Table structure for dict_detail
-- ----------------------------
DROP TABLE IF EXISTS `dict_detail`;
CREATE TABLE `dict_detail`  (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字典标签',
  `value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字典值',
  `sort` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '排序',
  `dict_id` bigint(11) NULL DEFAULT NULL COMMENT '字典id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK5tpkputc6d9nboxojdbgnpmyb`(`dict_id`) USING BTREE,
  CONSTRAINT `FK5tpkputc6d9nboxojdbgnpmyb` FOREIGN KEY (`dict_id`) REFERENCES `dict` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of dict_detail
-- ----------------------------
INSERT INTO `dict_detail` VALUES (1, '激活', 'true', '1', 1);
INSERT INTO `dict_detail` VALUES (2, '锁定', 'false', '2', 1);
INSERT INTO `dict_detail` VALUES (11, '正常', 'true', '1', 4);
INSERT INTO `dict_detail` VALUES (12, '停用', 'false', '2', 4);
INSERT INTO `dict_detail` VALUES (13, '正常', 'true', '1', 5);
INSERT INTO `dict_detail` VALUES (14, '停用', 'false', '2', 5);
INSERT INTO `dict_detail` VALUES (16, '显示', 'true', '1', 7);
INSERT INTO `dict_detail` VALUES (17, '隐藏', 'false', '2', 7);
INSERT INTO `dict_detail` VALUES (18, '申通快递', 'STO', '1', 8);
INSERT INTO `dict_detail` VALUES (19, '顺丰速运', 'SF', '2', 8);
INSERT INTO `dict_detail` VALUES (20, '中通快递', 'ZTO', '3', 8);
INSERT INTO `dict_detail` VALUES (21, '圆通速递', 'YTO', '4', 8);

-- ----------------------------
-- Table structure for email_config
-- ----------------------------
DROP TABLE IF EXISTS `email_config`;
CREATE TABLE `email_config`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `from_user` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收件人',
  `host` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮件服务器SMTP地址',
  `pass` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `port` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '端口',
  `user` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发件者用户名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for gen_config
-- ----------------------------
DROP TABLE IF EXISTS `gen_config`;
CREATE TABLE `gen_config`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `author` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '作者',
  `cover` bit(1) NULL DEFAULT NULL COMMENT '是否覆盖',
  `module_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '模块名称',
  `pack` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '至于哪个包下',
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '前端代码生成的路径',
  `api_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `prefix` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of gen_config
-- ----------------------------
INSERT INTO `gen_config` VALUES (1, 'hupeng', b'0', 'yshop-shop', 'co.yixiang.modules.wechat', 'E:\\java\\yxshop-private\\yshop-qd\\src\\views\\wechat\\user', 'E:\\java\\yxshop-private\\yshop-qd\\src\\api', NULL);

-- ----------------------------
-- Table structure for job
-- ----------------------------
DROP TABLE IF EXISTS `job`;
CREATE TABLE `job`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `enabled` bit(1) NOT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `sort` bigint(20) NOT NULL,
  `dept_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKmvhj0rogastlctflsxf1d6k3i`(`dept_id`) USING BTREE,
  CONSTRAINT `FKmvhj0rogastlctflsxf1d6k3i` FOREIGN KEY (`dept_id`) REFERENCES `dept` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of job
-- ----------------------------
INSERT INTO `job` VALUES (2, '董事长秘书', b'1', '2019-03-29 14:01:30', 2, 1);
INSERT INTO `job` VALUES (8, '人事专员', b'1', '2019-03-29 14:52:28', 3, 11);
INSERT INTO `job` VALUES (10, '产品经理', b'0', '2019-03-29 14:55:51', 4, 2);
INSERT INTO `job` VALUES (11, '全栈开发', b'1', '2019-03-31 13:39:30', 6, 2);
INSERT INTO `job` VALUES (12, '软件测试', b'1', '2019-03-31 13:39:43', 5, 2);
INSERT INTO `job` VALUES (19, '董事长', b'1', '2019-03-31 14:58:15', 1, 1);

-- ----------------------------
-- Table structure for local_storage
-- ----------------------------
DROP TABLE IF EXISTS `local_storage`;
CREATE TABLE `local_storage`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `real_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件名',
  `suffix` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '后缀',
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '路径',
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型',
  `size` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '大小',
  `operate` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改日期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 40 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of local_storage
-- ----------------------------
INSERT INTO `local_storage` VALUES (20, 'qrcode_for_gh_eefce3c49b0b_258-20191006102644425.jpg', 'qrcode_for_gh_eefce3c49b0b_258', 'jpg', 'C:\\eladmin\\file\\图片\\qrcode_for_gh_eefce3c49b0b_258-20191006102644425.jpg', '图片', '14.58KB   ', 'admin', '2019-10-06 10:26:44', '2019-10-06 10:26:44');
INSERT INTO `local_storage` VALUES (21, 'qrcode_for_gh_eefce3c49b0b_344-20191006103408206.jpg', 'qrcode_for_gh_eefce3c49b0b_344', 'jpg', 'C:\\eladmin\\file\\图片\\qrcode_for_gh_eefce3c49b0b_344-20191006103408206.jpg', '图片', '8.15KB   ', 'admin', '2019-10-06 10:34:08', '2019-10-06 10:34:08');
INSERT INTO `local_storage` VALUES (22, 'collection-20191103033448651.png', 'collection', 'png', 'E:\\eladmin\\file\\图片\\collection-20191103033448651.png', '图片', '1.17KB   ', 'admin', '2019-11-03 15:34:49', '2019-11-03 15:34:49');
INSERT INTO `local_storage` VALUES (23, 'address-20191115025702812.png', 'local', 'png', 'E:\\yashop\\file\\图片\\address-20191115025702812.png', '图片', '1.20KB   ', 'admin', '2019-11-15 14:57:03', '2019-11-15 14:57:03');
INSERT INTO `local_storage` VALUES (24, 'bargain-2019111503272634.png', 'local', 'png', 'E:\\yashop\\file\\图片\\bargain-2019111503272634.png', '图片', '411B   ', 'admin', '2019-11-15 15:27:26', '2019-11-15 15:27:26');
INSERT INTO `local_storage` VALUES (25, 'collection-20191115033532153.png', 'collection', 'png', 'E:\\yshop\\file\\图片\\collection-20191115033532153.png', '图片', '1.17KB   ', 'admin', '2019-11-15 15:35:32', '2019-11-15 15:35:32');
INSERT INTO `local_storage` VALUES (26, 'bargain-2019111503361352.png', 'bargain', 'png', 'E:\\yshop\\file\\图片\\bargain-2019111503361352.png', '图片', '411B   ', 'admin', '2019-11-15 15:36:13', '2019-11-15 15:36:13');
INSERT INTO `local_storage` VALUES (27, 'collection-20191115033713266.png', 'collection', 'png', 'E:\\yshop\\file\\图片\\collection-20191115033713266.png', '图片', '1.17KB   ', 'admin', '2019-11-15 15:37:13', '2019-11-15 15:37:13');
INSERT INTO `local_storage` VALUES (28, 'svn搭建-20191228104838604.txt', 'svn搭建', 'txt', 'E:\\yshop\\file\\文档\\svn搭建-20191228104838604.txt', '文档', '1.44KB   ', 'admin', '2019-12-28 22:48:39', '2019-12-28 22:48:39');
INSERT INTO `local_storage` VALUES (29, 'ruoyi-20191228112222962.sql', 'ruoyi', 'sql', 'E:\\yshop\\file\\其他\\ruoyi-20191228112222962.sql', '其他', '332.35KB   ', 'admin', '2019-12-28 23:22:23', '2019-12-28 23:22:23');
INSERT INTO `local_storage` VALUES (30, 'svn搭建-20191228112342505.txt', 'svn搭建', 'txt', 'E:\\yshop\\file\\文档\\svn搭建-20191228112342505.txt', '文档', '1.44KB   ', 'admin', '2019-12-28 23:23:43', '2019-12-28 23:23:43');
INSERT INTO `local_storage` VALUES (31, 'list_13-20191228112435575.png', 'list_13', 'png', 'E:\\yshop\\file\\图片\\list_13-20191228112435575.png', '图片', '23.05KB   ', 'admin', '2019-12-28 23:24:36', '2019-12-28 23:24:36');
INSERT INTO `local_storage` VALUES (32, 'list_34-2019122811335064.png', 'list_34', 'png', 'E:\\yshop\\file\\图片\\list_34-2019122811335064.png', '图片', '27.05KB   ', 'admin', '2019-12-28 23:33:50', '2019-12-28 23:33:50');
INSERT INTO `local_storage` VALUES (33, 'list_18-20191228113712114.png', 'list_18', 'png', 'E:\\yshop\\file\\图片\\list_18-20191228113712114.png', '图片', '29.62KB   ', 'admin', '2019-12-28 23:37:12', '2019-12-28 23:37:12');
INSERT INTO `local_storage` VALUES (34, 'list_34-20191228113719870.png', 'list_34', 'png', 'E:\\yshop\\file\\图片\\list_34-20191228113719870.png', '图片', '27.05KB   ', 'admin', '2019-12-28 23:37:20', '2019-12-28 23:37:20');
INSERT INTO `local_storage` VALUES (35, 'list_34-20191228113729347.png', 'list_34', 'png', 'E:\\yshop\\file\\图片\\list_34-20191228113729347.png', '图片', '27.05KB   ', 'admin', '2019-12-28 23:37:29', '2019-12-28 23:37:29');
INSERT INTO `local_storage` VALUES (36, 'list_32-20191228113817423.png', 'list_32', 'png', 'E:\\yshop\\file\\图片\\list_32-20191228113817423.png', '图片', '27.65KB   ', 'admin', '2019-12-28 23:38:17', '2019-12-28 23:38:17');
INSERT INTO `local_storage` VALUES (37, 'list_32-20191228114437584.png', 'list_32', 'png', 'E:\\yshop\\file\\图片\\list_32-20191228114437584.png', '图片', '27.65KB   ', 'admin', '2019-12-28 23:44:38', '2019-12-28 23:44:38');
INSERT INTO `local_storage` VALUES (38, 'list_20-20191228114534892.png', 'list_20', 'png', 'E:\\yshop\\file\\图片\\list_20-20191228114534892.png', '图片', '22.92KB   ', 'admin', '2019-12-28 23:45:35', '2019-12-28 23:45:35');
INSERT INTO `local_storage` VALUES (39, 'svn搭建-201912281147261.txt', 'svn搭建', 'txt', 'E:\\yshop\\file\\文档\\svn搭建-201912281147261.txt', '文档', '1.44KB   ', 'admin', '2019-12-28 23:47:26', '2019-12-28 23:47:26');

-- ----------------------------
-- Table structure for log
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `exception_detail` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `log_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `method` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `params` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `request_ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `time` bigint(20) NULL DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '0-后台1-移动端',
  `uid` bigint(20) UNSIGNED NULL DEFAULT 0 COMMENT '用户id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17892 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of log
-- ----------------------------
INSERT INTO `log` VALUES (17745, '2019-12-26 13:51:40', '查询商品', NULL, 'INFO', 'co.yixiang.modules.shop.rest.YxStoreProductController.getYxStoreProducts()', '{ criteria: YxStoreProductQueryCriteria(storeName=null, isDel=null, isShow=0) pageable: Page request [number: 0, size 10, sort: id: DESC] }', '127.0.0.1', 202, 'admin', '内网IP', 0, NULL);
INSERT INTO `log` VALUES (17746, '2019-12-26 13:51:40', '查询商品', NULL, 'INFO', 'co.yixiang.modules.shop.rest.YxStoreProductController.getYxStoreProducts()', '{ criteria: YxStoreProductQueryCriteria(storeName=null, isDel=1, isShow=null) pageable: Page request [number: 0, size 10, sort: id: DESC] }', '127.0.0.1', 202, 'admin', '内网IP', 0, NULL);
INSERT INTO `log` VALUES (17747, '2019-12-26 13:51:40', '查询商品', NULL, 'INFO', 'co.yixiang.modules.shop.rest.YxStoreProductController.getYxStoreProducts()', '{ criteria: YxStoreProductQueryCriteria(storeName=null, isDel=0, isShow=1) pageable: Page request [number: 0, size 10, sort: id: DESC] }', '127.0.0.1', 251, 'admin', '内网IP', 0, NULL);
INSERT INTO `log` VALUES (17748, '2019-12-26 13:56:52', '查询商品分类', NULL, 'INFO', 'co.yixiang.modules.shop.rest.YxStoreCategoryController.getYxStoreCategorys()', '{ criteria: YxStoreCategoryQueryCriteria(cateName=null) pageable: Page request [number: 0, size 10, sort: id: DESC] }', '127.0.0.1', 70, 'admin', '内网IP', 0, 1);
INSERT INTO `log` VALUES (17749, '2019-12-26 13:56:52', '查询字典详情', NULL, 'INFO', 'co.yixiang.modules.system.rest.DictDetailController.getDictDetails()', '{ criteria: DictDetailQueryCriteria(label=null, dictName=cate_show_status) pageable: Page request [number: 0, size 2000, sort: sort: ASC] }', '127.0.0.1', 113, 'admin', '内网IP', 0, 1);
INSERT INTO `log` VALUES (17750, '2019-12-26 14:09:26', '查看商品详情', NULL, 'INFO', 'co.yixiang.modules.shop.web.controller.StoreProductController.detail()', '{ id: 19 }', '127.0.0.1', 88, '15136175246', '内网IP', 1, 12);
INSERT INTO `log` VALUES (17751, '2019-12-26 14:22:05', '进入用户中心', NULL, 'INFO', 'co.yixiang.modules.user.web.controller.UserController.userMenu()', '{ }', '127.0.0.1', 18, '15136175246', '内网IP', 1, 12);
INSERT INTO `log` VALUES (17752, '2019-12-26 14:22:16', '查看订单列表', NULL, 'INFO', 'co.yixiang.modules.order.web.controller.StoreOrderController.orderList()', '{ type: 0 page: 1 limit: 20 }', '127.0.0.1', 72, '15136175246', '内网IP', 1, 12);
INSERT INTO `log` VALUES (17753, '2019-12-26 14:47:59', '查询字典详情', NULL, 'INFO', 'co.yixiang.modules.system.rest.DictDetailController.getDictDetails()', '{ criteria: DictDetailQueryCriteria(label=null, dictName=cate_show_status) pageable: Page request [number: 0, size 2000, sort: sort: ASC] }', '127.0.0.1', 12, 'admin', '内网IP', 0, 1);
INSERT INTO `log` VALUES (17754, '2019-12-26 14:47:59', '查询商品分类', NULL, 'INFO', 'co.yixiang.modules.shop.rest.YxStoreCategoryController.getYxStoreCategorys()', '{ criteria: YxStoreCategoryQueryCriteria(cateName=null) pageable: Page request [number: 0, size 10, sort: id: DESC] }', '127.0.0.1', 24, 'admin', '内网IP', 0, 1);
INSERT INTO `log` VALUES (17755, '2019-12-26 14:51:23', '查询菜单', NULL, 'INFO', 'co.yixiang.modules.system.rest.MenuController.getMenus()', '{ criteria: MenuQueryCriteria(blurry=null) }', '127.0.0.1', 32, 'admin', '内网IP', 0, 1);
INSERT INTO `log` VALUES (17756, '2019-12-26 14:51:42', '查询菜单', NULL, 'INFO', 'co.yixiang.modules.system.rest.MenuController.getMenus()', '{ criteria: MenuQueryCriteria(blurry=null) }', '127.0.0.1', 8, 'admin', '内网IP', 0, 1);
INSERT INTO `log` VALUES (17757, '2019-12-26 14:53:25', '新增菜单', NULL, 'INFO', 'co.yixiang.modules.system.rest.MenuController.create()', '{ resources: co.yixiang.modules.system.domain.Menu@75 }', '127.0.0.1', 91, 'admin', '内网IP', 0, 1);
INSERT INTO `log` VALUES (17758, '2019-12-26 14:53:25', '查询菜单', NULL, 'INFO', 'co.yixiang.modules.system.rest.MenuController.getMenus()', '{ criteria: MenuQueryCriteria(blurry=null) }', '127.0.0.1', 44, 'admin', '内网IP', 0, 1);
INSERT INTO `log` VALUES (17759, '2019-12-26 14:53:34', '查询菜单', NULL, 'INFO', 'co.yixiang.modules.system.rest.MenuController.getMenus()', '{ criteria: MenuQueryCriteria(blurry=null) }', '127.0.0.1', 3, 'admin', '内网IP', 0, 1);
INSERT INTO `log` VALUES (17760, '2019-12-26 14:53:46', '查询权限', NULL, 'INFO', 'co.yixiang.modules.system.rest.PermissionController.getPermissions()', '{ criteria: PermissionQueryCriteria(blurry=null) }', '127.0.0.1', 52, 'admin', '内网IP', 0, 1);
INSERT INTO `log` VALUES (17761, '2019-12-26 14:53:50', '查询角色', NULL, 'INFO', 'co.yixiang.modules.system.rest.RoleController.getRoles()', '{ criteria: RoleQueryCriteria(blurry=null) pageable: Page request [number: 0, size 10, sort: level: ASC] }', '127.0.0.1', 194, 'admin', '内网IP', 0, 1);
INSERT INTO `log` VALUES (17762, '2019-12-26 14:54:00', '修改角色菜单', NULL, 'INFO', 'co.yixiang.modules.system.rest.RoleController.updateMenu()', '{ resources: Role{id=1, name=\'null\', remark=\'null\', createDateTime=null} }', '127.0.0.1', 177, 'admin', '内网IP', 0, 1);
INSERT INTO `log` VALUES (17763, '2019-12-26 14:55:22', '修改角色菜单', NULL, 'INFO', 'co.yixiang.modules.system.rest.RoleController.updateMenu()', '{ resources: Role{id=1, name=\'null\', remark=\'null\', createDateTime=null} }', '127.0.0.1', 27, 'admin', '内网IP', 0, 1);
INSERT INTO `log` VALUES (17764, '2019-12-26 14:55:28', '查询角色', NULL, 'INFO', 'co.yixiang.modules.system.rest.RoleController.getRoles()', '{ criteria: RoleQueryCriteria(blurry=null) pageable: Page request [number: 0, size 10, sort: level: ASC] }', '127.0.0.1', 54, 'admin', '内网IP', 0, 1);
INSERT INTO `log` VALUES (17765, '2019-12-26 15:24:24', '查看商品详情', NULL, 'INFO', 'co.yixiang.modules.shop.web.controller.StoreProductController.detail()', '{ id: 19 }', '127.0.0.1', 238, '15136175246', '内网IP', 1, 12);
INSERT INTO `log` VALUES (17766, '2019-12-26 15:24:24', '查看优惠券', NULL, 'INFO', 'co.yixiang.modules.shop.web.controller.CouponController.getList()', '{ page: 1 limit: 20 }', '127.0.0.1', 234, '15136175246', '内网IP', 1, 12);
INSERT INTO `log` VALUES (17767, '2019-12-26 15:24:28', '添加购物车', NULL, 'INFO', 'co.yixiang.modules.shop.web.controller.StoreCartController.add()', '{ jsonStr: {\"productId\":\"19\",\"cartNum\":1,\"new\":1,\"uniqueId\":\"00e86525a7af4dcf9e653ae0a2062369\"} }', '127.0.0.1', 85, '15136175246', '内网IP', 1, 12);
INSERT INTO `log` VALUES (17768, '2019-12-26 15:24:32', '查看订单详情', NULL, 'INFO', 'co.yixiang.modules.order.web.controller.StoreOrderController.detail()', '{ key: 20191226152431045 }', '127.0.0.1', 17, '15136175246', '内网IP', 1, 12);
INSERT INTO `log` VALUES (17769, '2019-12-26 15:33:47', '查询菜单', NULL, 'INFO', 'co.yixiang.modules.system.rest.MenuController.getMenus()', '{ criteria: MenuQueryCriteria(blurry=null) }', '127.0.0.1', 18, 'admin', '内网IP', 0, 1);
INSERT INTO `log` VALUES (17770, '2019-12-26 15:35:40', '查询菜单', NULL, 'INFO', 'co.yixiang.modules.system.rest.MenuController.getMenus()', '{ criteria: MenuQueryCriteria(blurry=null) }', '127.0.0.1', 5, 'admin', '内网IP', 0, 1);
INSERT INTO `log` VALUES (17771, '2019-12-26 15:36:02', '查询YxSystemConfig', NULL, 'INFO', 'co.yixiang.modules.wechat.rest.YxSystemConfigController.getYxSystemConfigs()', '{ criteria: YxSystemConfigQueryCriteria() pageable: Page request [number: 0, size 50, sort: UNSORTED] }', '127.0.0.1', 23, 'admin', '内网IP', 0, 1);
INSERT INTO `log` VALUES (17772, '2019-12-27 18:20:35', '用户登录', NULL, 'INFO', 'co.yixiang.modules.security.rest.AuthenticationController.login()', '{ authorizationUser: {username=15136175246, password= ******} }', '127.0.0.1', 628, '', '内网IP', 0, 0);
INSERT INTO `log` VALUES (17773, '2019-12-27 18:22:05', '查看优惠券', NULL, 'INFO', 'co.yixiang.modules.shop.web.controller.CouponController.getList()', '{ page: 1 limit: 20 }', '127.0.0.1', 132, '15136175246', '内网IP', 1, 12);
INSERT INTO `log` VALUES (17774, '2019-12-27 18:22:05', '查看商品详情', NULL, 'INFO', 'co.yixiang.modules.shop.web.controller.StoreProductController.detail()', '{ id: 20 }', '127.0.0.1', 150, '15136175246', '内网IP', 1, 12);
INSERT INTO `log` VALUES (17775, '2019-12-27 18:22:08', '添加购物车', NULL, 'INFO', 'co.yixiang.modules.shop.web.controller.StoreCartController.add()', '{ jsonStr: {\"productId\":\"20\",\"cartNum\":1,\"new\":1,\"uniqueId\":\"ba5d202555c44d378e6644ca1296ee01\"} }', '127.0.0.1', 168, '15136175246', '内网IP', 1, 12);
INSERT INTO `log` VALUES (17776, '2019-12-27 18:22:17', '查看订单详情', NULL, 'INFO', 'co.yixiang.modules.order.web.controller.StoreOrderController.detail()', '{ key: 20191227182216663 }', '127.0.0.1', 16, '15136175246', '内网IP', 1, 12);
INSERT INTO `log` VALUES (17777, '2019-12-28 22:41:12', '用户登录', NULL, 'INFO', 'co.yixiang.modules.security.rest.AuthenticationController.login()', '{ authorizationUser: {username=admin, password= ******} }', '127.0.0.1', 949, 'admin', '内网IP', 0, 0);
INSERT INTO `log` VALUES (17778, '2019-12-28 22:41:44', '查询YxSystemConfig', NULL, 'INFO', 'co.yixiang.modules.wechat.rest.YxSystemConfigController.getYxSystemConfigs()', '{ criteria: YxSystemConfigQueryCriteria() pageable: Page request [number: 0, size 50, sort: UNSORTED] }', '127.0.0.1', 389, 'admin', '内网IP', 0, 1);
INSERT INTO `log` VALUES (17779, '2019-12-28 22:42:45', '查询YxSystemConfig', NULL, 'INFO', 'co.yixiang.modules.wechat.rest.YxSystemConfigController.getYxSystemConfigs()', '{ criteria: YxSystemConfigQueryCriteria() pageable: Page request [number: 0, size 50, sort: UNSORTED] }', '127.0.0.1', 9, 'admin', '内网IP', 0, 1);
INSERT INTO `log` VALUES (17780, '2019-12-28 22:52:35', '查询字典详情', NULL, 'INFO', 'co.yixiang.modules.system.rest.DictDetailController.getDictDetails()', '{ criteria: DictDetailQueryCriteria(label=null, dictName=cate_show_status) pageable: Page request [number: 0, size 2000, sort: sort: ASC] }', '127.0.0.1', 15, 'admin', '内网IP', 0, 1);
INSERT INTO `log` VALUES (17781, '2019-12-28 22:52:35', '查询商品分类', NULL, 'INFO', 'co.yixiang.modules.shop.rest.YxStoreCategoryController.getYxStoreCategorys()', '{ criteria: YxStoreCategoryQueryCriteria(cateName=null) pageable: Page request [number: 0, size 10, sort: id: DESC] }', '127.0.0.1', 31, 'admin', '内网IP', 0, 1);
INSERT INTO `log` VALUES (17782, '2019-12-28 22:52:36', '查询商品分类', NULL, 'INFO', 'co.yixiang.modules.shop.rest.YxStoreCategoryController.getYxStoreCategorys()', '{ criteria: YxStoreCategoryQueryCriteria(cateName=null) pageable: Page request [number: 0, size 20, sort: UNSORTED] }', '127.0.0.1', 13, 'admin', '内网IP', 0, 1);
INSERT INTO `log` VALUES (17783, '2019-12-28 22:52:47', '上传文件', 'co.yixiang.exception.BadRequestException: 请先添加相应配置，再操作\r\n	at co.yixiang.service.impl.QiNiuServiceImpl.upload(QiNiuServiceImpl.java:81)\r\n	at co.yixiang.service.impl.QiNiuServiceImpl$$FastClassBySpringCGLIB$$e5e388f1.invoke(<generated>)\r\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\r\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:746)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\r\n	at org.springframework.transaction.interceptor.TransactionAspectSupport.invokeWithinTransaction(TransactionAspectSupport.java:294)\r\n	at org.springframework.transaction.interceptor.TransactionInterceptor.invoke(TransactionInterceptor.java:98)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\r\n	at org.springframework.cache.interceptor.CacheInterceptor.lambda$invoke$0(CacheInterceptor.java:53)\r\n	at org.springframework.cache.interceptor.CacheAspectSupport.invokeOperation(CacheAspectSupport.java:365)\r\n	at org.springframework.cache.interceptor.CacheAspectSupport.execute(CacheAspectSupport.java:420)\r\n	at org.springframework.cache.interceptor.CacheAspectSupport.execute(CacheAspectSupport.java:345)\r\n	at org.springframework.cache.interceptor.CacheInterceptor.invoke(CacheInterceptor.java:61)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\r\n	at org.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.intercept(CglibAopProxy.java:688)\r\n	at co.yixiang.service.impl.QiNiuServiceImpl$$EnhancerBySpringCGLIB$$d094bbe3.upload(<generated>)\r\n	at co.yixiang.rest.QiniuController.upload(QiniuController.java:65)\r\n	at co.yixiang.rest.QiniuController$$FastClassBySpringCGLIB$$60ff4db.invoke(<generated>)\r\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\r\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:746)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\r\n	at org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint.proceed(MethodInvocationProceedingJoinPoint.java:88)\r\n	at co.yixiang.aspect.LogAspect.logAround(LogAspect.java:50)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethodWithGivenArgs(AbstractAspectJAdvice.java:644)\r\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethod(AbstractAspectJAdvice.java:633)\r\n	at org.springframework.aop.aspectj.AspectJAroundAdvice.invoke(AspectJAroundAdvice.java:70)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:175)\r\n	at org.springframework.aop.aspectj.AspectJAfterThrowingAdvice.invoke(AspectJAfterThrowingAdvice.java:62)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:175)\r\n	at org.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:93)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\r\n	at org.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.intercept(CglibAopProxy.java:688)\r\n	at co.yixiang.rest.QiniuController$$EnhancerBySpringCGLIB$$657e21a9.upload(<generated>)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:215)\r\n	at org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:142)\r\n	at org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:102)\r\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:895)\r\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:800)\r\n	at org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:87)\r\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:1038)\r\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:942)\r\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:998)\r\n	at org.springframework.web.servlet.FrameworkServlet.doPost(FrameworkServlet.java:901)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:660)\r\n	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:875)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:741)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:231)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:53)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:101)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at com.alibaba.druid.support.http.WebStatFilter.doFilter(WebStatFilter.java:123)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:320)\r\n	at org.springframework.security.web.access.intercept.FilterSecurityInterceptor.invoke(FilterSecurityInterceptor.java:127)\r\n	at org.springframework.security.web.access.intercept.FilterSecurityInterceptor.doFilter(FilterSecurityInterceptor.java:91)\r\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.access.ExceptionTranslationFilter.doFilter(ExceptionTranslationFilter.java:119)\r\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.session.SessionManagementFilter.doFilter(SessionManagementFilter.java:137)\r\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.authentication.AnonymousAuthenticationFilter.doFilter(AnonymousAuthenticationFilter.java:111)\r\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.servletapi.SecurityContextHolderAwareRequestFilter.doFilter(SecurityContextHolderAwareRequestFilter.java:170)\r\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.savedrequest.RequestCacheAwareFilter.doFilter(RequestCacheAwareFilter.java:63)\r\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at co.yixiang.modules.security.security.JwtAuthorizationTokenFilter.doFilterInternal(JwtAuthorizationTokenFilter.java:67)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.authentication.logout.LogoutFilter.doFilter(LogoutFilter.java:116)\r\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.header.HeaderWriterFilter.doFilterInternal(HeaderWriterFilter.java:66)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.context.SecurityContextPersistenceFilter.doFilter(SecurityContextPersistenceFilter.java:105)\r\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.context.request.async.WebAsyncManagerIntegrationFilter.doFilterInternal(WebAsyncManagerIntegrationFilter.java:56)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.FilterChainProxy.doFilterInternal(FilterChainProxy.java:215)\r\n	at org.springframework.security.web.FilterChainProxy.doFilter(FilterChainProxy.java:178)\r\n	at org.springframework.web.filter.DelegatingFilterProxy.invokeDelegate(DelegatingFilterProxy.java:357)\r\n	at org.springframework.web.filter.DelegatingFilterProxy.doFilter(DelegatingFilterProxy.java:270)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:200)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:199)\r\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:96)\r\n	at org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:490)\r\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:139)\r\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:92)\r\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:74)\r\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:343)\r\n	at org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:408)\r\n	at org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:66)\r\n	at org.apache.coyote.AbstractProtocol$ConnectionHandler.process(AbstractProtocol.java:770)\r\n	at org.apache.tomcat.util.net.NioEndpoint$SocketProcessor.doRun(NioEndpoint.java:1415)\r\n	at org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:49)\r\n	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1149)\r\n	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:624)\r\n	at org.apache.tomcat.util.threads.TaskThread$WrappingRunnable.run(TaskThread.java:61)\r\n	at java.lang.Thread.run(Thread.java:748)\r\n', 'ERROR', 'co.yixiang.rest.QiniuController.upload()', '{ file: org.springframework.web.multipart.support.StandardMultipartHttpServletRequest$StandardMultipartFile@28654040 }', '127.0.0.1', 13, 'admin', '内网IP', 0, 1);
INSERT INTO `log` VALUES (17784, '2019-12-28 22:53:18', '上传文件', 'co.yixiang.exception.BadRequestException: 请先添加相应配置，再操作\r\n	at co.yixiang.service.impl.QiNiuServiceImpl.upload(QiNiuServiceImpl.java:81)\r\n	at co.yixiang.service.impl.QiNiuServiceImpl$$FastClassBySpringCGLIB$$e5e388f1.invoke(<generated>)\r\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\r\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:746)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\r\n	at org.springframework.transaction.interceptor.TransactionAspectSupport.invokeWithinTransaction(TransactionAspectSupport.java:294)\r\n	at org.springframework.transaction.interceptor.TransactionInterceptor.invoke(TransactionInterceptor.java:98)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\r\n	at org.springframework.cache.interceptor.CacheInterceptor.lambda$invoke$0(CacheInterceptor.java:53)\r\n	at org.springframework.cache.interceptor.CacheAspectSupport.invokeOperation(CacheAspectSupport.java:365)\r\n	at org.springframework.cache.interceptor.CacheAspectSupport.execute(CacheAspectSupport.java:420)\r\n	at org.springframework.cache.interceptor.CacheAspectSupport.execute(CacheAspectSupport.java:345)\r\n	at org.springframework.cache.interceptor.CacheInterceptor.invoke(CacheInterceptor.java:61)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\r\n	at org.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.intercept(CglibAopProxy.java:688)\r\n	at co.yixiang.service.impl.QiNiuServiceImpl$$EnhancerBySpringCGLIB$$d094bbe3.upload(<generated>)\r\n	at co.yixiang.rest.QiniuController.upload(QiniuController.java:65)\r\n	at co.yixiang.rest.QiniuController$$FastClassBySpringCGLIB$$60ff4db.invoke(<generated>)\r\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\r\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:746)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\r\n	at org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint.proceed(MethodInvocationProceedingJoinPoint.java:88)\r\n	at co.yixiang.aspect.LogAspect.logAround(LogAspect.java:50)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethodWithGivenArgs(AbstractAspectJAdvice.java:644)\r\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethod(AbstractAspectJAdvice.java:633)\r\n	at org.springframework.aop.aspectj.AspectJAroundAdvice.invoke(AspectJAroundAdvice.java:70)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:175)\r\n	at org.springframework.aop.aspectj.AspectJAfterThrowingAdvice.invoke(AspectJAfterThrowingAdvice.java:62)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:175)\r\n	at org.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:93)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\r\n	at org.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.intercept(CglibAopProxy.java:688)\r\n	at co.yixiang.rest.QiniuController$$EnhancerBySpringCGLIB$$657e21a9.upload(<generated>)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:215)\r\n	at org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:142)\r\n	at org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:102)\r\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:895)\r\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:800)\r\n	at org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:87)\r\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:1038)\r\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:942)\r\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:998)\r\n	at org.springframework.web.servlet.FrameworkServlet.doPost(FrameworkServlet.java:901)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:660)\r\n	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:875)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:741)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:231)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:53)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:101)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at com.alibaba.druid.support.http.WebStatFilter.doFilter(WebStatFilter.java:123)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:320)\r\n	at org.springframework.security.web.access.intercept.FilterSecurityInterceptor.invoke(FilterSecurityInterceptor.java:127)\r\n	at org.springframework.security.web.access.intercept.FilterSecurityInterceptor.doFilter(FilterSecurityInterceptor.java:91)\r\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.access.ExceptionTranslationFilter.doFilter(ExceptionTranslationFilter.java:119)\r\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.session.SessionManagementFilter.doFilter(SessionManagementFilter.java:137)\r\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.authentication.AnonymousAuthenticationFilter.doFilter(AnonymousAuthenticationFilter.java:111)\r\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.servletapi.SecurityContextHolderAwareRequestFilter.doFilter(SecurityContextHolderAwareRequestFilter.java:170)\r\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.savedrequest.RequestCacheAwareFilter.doFilter(RequestCacheAwareFilter.java:63)\r\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at co.yixiang.modules.security.security.JwtAuthorizationTokenFilter.doFilterInternal(JwtAuthorizationTokenFilter.java:67)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.authentication.logout.LogoutFilter.doFilter(LogoutFilter.java:116)\r\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.header.HeaderWriterFilter.doFilterInternal(HeaderWriterFilter.java:66)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.context.SecurityContextPersistenceFilter.doFilter(SecurityContextPersistenceFilter.java:105)\r\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.context.request.async.WebAsyncManagerIntegrationFilter.doFilterInternal(WebAsyncManagerIntegrationFilter.java:56)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.FilterChainProxy.doFilterInternal(FilterChainProxy.java:215)\r\n	at org.springframework.security.web.FilterChainProxy.doFilter(FilterChainProxy.java:178)\r\n	at org.springframework.web.filter.DelegatingFilterProxy.invokeDelegate(DelegatingFilterProxy.java:357)\r\n	at org.springframework.web.filter.DelegatingFilterProxy.doFilter(DelegatingFilterProxy.java:270)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:200)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:199)\r\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:96)\r\n	at org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:490)\r\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:139)\r\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:92)\r\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:74)\r\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:343)\r\n	at org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:408)\r\n	at org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:66)\r\n	at org.apache.coyote.AbstractProtocol$ConnectionHandler.process(AbstractProtocol.java:770)\r\n	at org.apache.tomcat.util.net.NioEndpoint$SocketProcessor.doRun(NioEndpoint.java:1415)\r\n	at org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:49)\r\n	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1149)\r\n	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:624)\r\n	at org.apache.tomcat.util.threads.TaskThread$WrappingRunnable.run(TaskThread.java:61)\r\n	at java.lang.Thread.run(Thread.java:748)\r\n', 'ERROR', 'co.yixiang.rest.QiniuController.upload()', '{ file: org.springframework.web.multipart.support.StandardMultipartHttpServletRequest$StandardMultipartFile@ae7564a }', '127.0.0.1', 5, 'admin', '内网IP', 0, 1);
INSERT INTO `log` VALUES (17785, '2019-12-28 22:53:51', '查询图片', NULL, 'INFO', 'co.yixiang.rest.PictureController.getRoles()', '{ criteria: PictureQueryCriteria(filename=null, username=null) pageable: Page request [number: 0, size 10, sort: id: DESC] }', '127.0.0.1', 29, 'admin', '内网IP', 0, 1);
INSERT INTO `log` VALUES (17786, '2019-12-28 22:53:55', '查询文件', NULL, 'INFO', 'co.yixiang.rest.QiniuController.getRoles()', '{ criteria: QiniuQueryCriteria(key=null) pageable: Page request [number: 0, size 10, sort: id: DESC] }', '127.0.0.1', 20, 'admin', '内网IP', 0, 1);
INSERT INTO `log` VALUES (17787, '2019-12-28 22:53:59', '查询文件', NULL, 'INFO', 'co.yixiang.rest.QiniuController.getRoles()', '{ criteria: QiniuQueryCriteria(key=null) pageable: Page request [number: 0, size 10, sort: id: DESC] }', '127.0.0.1', 6, 'admin', '内网IP', 0, 1);
INSERT INTO `log` VALUES (17788, '2019-12-28 22:54:11', '查询文件', NULL, 'INFO', 'co.yixiang.rest.QiniuController.getRoles()', '{ criteria: QiniuQueryCriteria(key=null) pageable: Page request [number: 0, size 10, sort: id: DESC] }', '127.0.0.1', 2, 'admin', '内网IP', 0, 1);
INSERT INTO `log` VALUES (17789, '2019-12-28 23:18:24', '查询YxSystemConfig', NULL, 'INFO', 'co.yixiang.modules.wechat.rest.YxSystemConfigController.getYxSystemConfigs()', '{ criteria: YxSystemConfigQueryCriteria() pageable: Page request [number: 0, size 50, sort: UNSORTED] }', '127.0.0.1', 10, 'admin', '内网IP', 0, 1);
INSERT INTO `log` VALUES (17790, '2019-12-28 23:22:02', '查询YxSystemConfig', NULL, 'INFO', 'co.yixiang.modules.wechat.rest.YxSystemConfigController.getYxSystemConfigs()', '{ criteria: YxSystemConfigQueryCriteria() pageable: Page request [number: 0, size 50, sort: UNSORTED] }', '127.0.0.1', 8, 'admin', '内网IP', 0, 1);
INSERT INTO `log` VALUES (17791, '2019-12-28 23:24:24', '查询YxSystemConfig', NULL, 'INFO', 'co.yixiang.modules.wechat.rest.YxSystemConfigController.getYxSystemConfigs()', '{ criteria: YxSystemConfigQueryCriteria() pageable: Page request [number: 0, size 50, sort: UNSORTED] }', '127.0.0.1', 4, 'admin', '内网IP', 0, 1);
INSERT INTO `log` VALUES (17792, '2019-12-28 23:27:32', '查询YxSystemConfig', NULL, 'INFO', 'co.yixiang.modules.wechat.rest.YxSystemConfigController.getYxSystemConfigs()', '{ criteria: YxSystemConfigQueryCriteria() pageable: Page request [number: 0, size 50, sort: UNSORTED] }', '127.0.0.1', 6, 'admin', '内网IP', 0, 1);
INSERT INTO `log` VALUES (17793, '2019-12-28 23:37:26', '查询YxSystemConfig', NULL, 'INFO', 'co.yixiang.modules.wechat.rest.YxSystemConfigController.getYxSystemConfigs()', '{ criteria: YxSystemConfigQueryCriteria() pageable: Page request [number: 0, size 50, sort: UNSORTED] }', '127.0.0.1', 8, 'admin', '内网IP', 0, 1);
INSERT INTO `log` VALUES (17794, '2019-12-28 23:45:31', '查询YxSystemConfig', NULL, 'INFO', 'co.yixiang.modules.wechat.rest.YxSystemConfigController.getYxSystemConfigs()', '{ criteria: YxSystemConfigQueryCriteria() pageable: Page request [number: 0, size 50, sort: UNSORTED] }', '127.0.0.1', 6, 'admin', '内网IP', 0, 1);
INSERT INTO `log` VALUES (17795, '2019-12-28 23:47:19', '查询YxSystemConfig', NULL, 'INFO', 'co.yixiang.modules.wechat.rest.YxSystemConfigController.getYxSystemConfigs()', '{ criteria: YxSystemConfigQueryCriteria() pageable: Page request [number: 0, size 50, sort: UNSORTED] }', '127.0.0.1', 7, 'admin', '内网IP', 0, 1);
INSERT INTO `log` VALUES (17796, '2019-12-28 23:47:46', '新增YxSystemConfig', NULL, 'INFO', 'co.yixiang.modules.wechat.rest.YxSystemConfigController.create()', '{ jsonStr: {\"wechat_share_img\":\"\",\"wechat_avatar\":\"\",\"wechat_share_synopsis\":\"4444444\",\"api\":\"http://你的H5端域名/api/wechat/serve\",\"wechat_share_title\":\"4444\",\"store_postage\":\"0\",\"store_free_postage\":\"0\",\"integral_ratio\":\"1\",\"store_brokerage_ratio\":\"70\",\"store_brokerage_statu\":\"2\",\"user_extract_min_price\":\"1\",\"store_brokerage_two\":\"30\",\"site_url\":\"http://localhost:8080\",\"api_url\":\"http://127.0.0.1:8009\",\"order_cancel_job_time\":\"20\",\"wechat_appid\":\"1111\",\"wechat_appsecret\":\"2222\",\"wechat_encodingaeskey\":\"6666\",\"wechat_token\":\"999\",\"wxpay_mchId\":\"2222\",\"wxpay_appId\":\"111111\",\"wxpay_mchKey\":\"55555\",\"wxapp_appId\":\"22222\",\"wxapp_secret\":\"22222222\",\"wxpay_keyPath\":\"http://localhost:8000/file/文档/svn搭建-201912281147261.txt\"} }', '127.0.0.1', 481, 'admin', '内网IP', 0, 1);
INSERT INTO `log` VALUES (17797, '2019-12-28 23:48:10', '查询YxSystemConfig', NULL, 'INFO', 'co.yixiang.modules.wechat.rest.YxSystemConfigController.getYxSystemConfigs()', '{ criteria: YxSystemConfigQueryCriteria() pageable: Page request [number: 0, size 50, sort: UNSORTED] }', '127.0.0.1', 4, 'admin', '内网IP', 0, 1);
INSERT INTO `log` VALUES (17798, '2019-12-29 09:54:11', '用户登录', 'co.yixiang.exception.BadRequestException: 验证码已过期\r\n	at co.yixiang.modules.security.rest.AuthenticationController.login(AuthenticationController.java:67)\r\n	at co.yixiang.modules.security.rest.AuthenticationController$$FastClassBySpringCGLIB$$7265dd5e.invoke(<generated>)\r\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\r\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:746)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\r\n	at org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint.proceed(MethodInvocationProceedingJoinPoint.java:88)\r\n	at co.yixiang.aspect.LogAspect.logAround(LogAspect.java:50)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethodWithGivenArgs(AbstractAspectJAdvice.java:644)\r\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethod(AbstractAspectJAdvice.java:633)\r\n	at org.springframework.aop.aspectj.AspectJAroundAdvice.invoke(AspectJAroundAdvice.java:70)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:175)\r\n	at org.springframework.aop.aspectj.AspectJAfterThrowingAdvice.invoke(AspectJAfterThrowingAdvice.java:62)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:175)\r\n	at org.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:93)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\r\n	at org.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.intercept(CglibAopProxy.java:688)\r\n	at co.yixiang.modules.security.rest.AuthenticationController$$EnhancerBySpringCGLIB$$f749e410.login(<generated>)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:215)\r\n	at org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:142)\r\n	at org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:102)\r\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:895)\r\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:800)\r\n	at org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:87)\r\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:1038)\r\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:942)\r\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:998)\r\n	at org.springframework.web.servlet.FrameworkServlet.doPost(FrameworkServlet.java:901)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:660)\r\n	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:875)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:741)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:231)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:53)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:101)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at com.alibaba.druid.support.http.WebStatFilter.doFilter(WebStatFilter.java:123)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:320)\r\n	at org.springframework.security.web.access.intercept.FilterSecurityInterceptor.invoke(FilterSecurityInterceptor.java:127)\r\n	at org.springframework.security.web.access.intercept.FilterSecurityInterceptor.doFilter(FilterSecurityInterceptor.java:91)\r\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.access.ExceptionTranslationFilter.doFilter(ExceptionTranslationFilter.java:119)\r\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.session.SessionManagementFilter.doFilter(SessionManagementFilter.java:137)\r\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.authentication.AnonymousAuthenticationFilter.doFilter(AnonymousAuthenticationFilter.java:111)\r\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.servletapi.SecurityContextHolderAwareRequestFilter.doFilter(SecurityContextHolderAwareRequestFilter.java:170)\r\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.savedrequest.RequestCacheAwareFilter.doFilter(RequestCacheAwareFilter.java:63)\r\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at co.yixiang.modules.security.security.JwtAuthorizationTokenFilter.doFilterInternal(JwtAuthorizationTokenFilter.java:67)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.authentication.logout.LogoutFilter.doFilter(LogoutFilter.java:116)\r\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.header.HeaderWriterFilter.doFilterInternal(HeaderWriterFilter.java:66)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.context.SecurityContextPersistenceFilter.doFilter(SecurityContextPersistenceFilter.java:105)\r\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.context.request.async.WebAsyncManagerIntegrationFilter.doFilterInternal(WebAsyncManagerIntegrationFilter.java:56)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.FilterChainProxy.doFilterInternal(FilterChainProxy.java:215)\r\n	at org.springframework.security.web.FilterChainProxy.doFilter(FilterChainProxy.java:178)\r\n	at org.springframework.web.filter.DelegatingFilterProxy.invokeDelegate(DelegatingFilterProxy.java:357)\r\n	at org.springframework.web.filter.DelegatingFilterProxy.doFilter(DelegatingFilterProxy.java:270)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:200)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:199)\r\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:96)\r\n	at org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:490)\r\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:139)\r\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:92)\r\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:74)\r\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:343)\r\n	at org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:408)\r\n	at org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:66)\r\n	at org.apache.coyote.AbstractProtocol$ConnectionHandler.process(AbstractProtocol.java:770)\r\n	at org.apache.tomcat.util.net.NioEndpoint$SocketProcessor.doRun(NioEndpoint.java:1415)\r\n	at org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:49)\r\n	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1149)\r\n	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:624)\r\n	at org.apache.tomcat.util.threads.TaskThread$WrappingRunnable.run(TaskThread.java:61)\r\n	at java.lang.Thread.run(Thread.java:748)\r\n', 'ERROR', 'co.yixiang.modules.security.rest.AuthenticationController.login()', '{ authorizationUser: {username=admin, password= ******} }', '127.0.0.1', 14, 'admin', '内网IP', 0, 0);
INSERT INTO `log` VALUES (17799, '2019-12-29 09:54:19', '用户登录', NULL, 'INFO', 'co.yixiang.modules.security.rest.AuthenticationController.login()', '{ authorizationUser: {username=admin, password= ******} }', '127.0.0.1', 735, 'admin', '内网IP', 0, 0);
INSERT INTO `log` VALUES (17800, '2019-12-29 09:54:24', '查询用户', NULL, 'INFO', 'co.yixiang.modules.shop.rest.YxUserController.getYxUsers()', '{ criteria: YxUserQueryCriteria(nickname=null, phone=null, isPromoter=null) pageable: Page request [number: 0, size 10, sort: uid: DESC] }', '127.0.0.1', 30, 'admin', '内网IP', 0, 1);
INSERT INTO `log` VALUES (17801, '2019-12-29 09:54:43', '查询YxExpress', NULL, 'INFO', 'co.yixiang.modules.shop.rest.YxExpressController.getYxExpresss()', '{ criteria: YxExpressQueryCriteria() pageable: Page request [number: 0, size 20, sort: UNSORTED] }', '127.0.0.1', 18, 'admin', '内网IP', 0, 1);
INSERT INTO `log` VALUES (17802, '2019-12-29 10:27:51', '进入用户中心', NULL, 'INFO', 'co.yixiang.modules.user.web.controller.UserController.userMenu()', '{ }', '127.0.0.1', 17, '15136175246', '内网IP', 1, 12);
INSERT INTO `log` VALUES (17803, '2019-12-29 10:27:57', '查看订单列表', NULL, 'INFO', 'co.yixiang.modules.order.web.controller.StoreOrderController.orderList()', '{ type: 1 page: 1 limit: 20 }', '127.0.0.1', 131, '15136175246', '内网IP', 1, 12);
INSERT INTO `log` VALUES (17804, '2019-12-29 10:28:00', '查看订单详情', NULL, 'INFO', 'co.yixiang.modules.order.web.controller.StoreOrderController.detail()', '{ key: 20191227182216663 }', '127.0.0.1', 38, '15136175246', '内网IP', 1, 12);
INSERT INTO `log` VALUES (17805, '2019-12-29 10:28:03', '查看订单详情', NULL, 'INFO', 'co.yixiang.modules.order.web.controller.StoreOrderController.detail()', '{ key: 20191227182216663 }', '127.0.0.1', 13, '15136175246', '内网IP', 1, 12);
INSERT INTO `log` VALUES (17806, '2019-12-29 10:28:20', '提交订单退款', NULL, 'INFO', 'co.yixiang.modules.order.web.controller.StoreOrderController.refundVerify()', '{ param: RefundParam(refund_reason_wap_explain=33333, refund_reason_wap_img=, text=收货地址填错了, uni=20191227182216663) }', '127.0.0.1', 83, '15136175246', '内网IP', 1, 12);
INSERT INTO `log` VALUES (17807, '2019-12-29 10:28:20', '查看订单详情', NULL, 'INFO', 'co.yixiang.modules.order.web.controller.StoreOrderController.detail()', '{ key: 20191227182216663 }', '127.0.0.1', 20, '15136175246', '内网IP', 1, 12);
INSERT INTO `log` VALUES (17808, '2019-12-29 10:32:03', '查看订单列表', NULL, 'INFO', 'co.yixiang.modules.order.web.controller.StoreOrderController.orderList()', '{ type: 1 page: 1 limit: 20 }', '127.0.0.1', 68, '15136175246', '内网IP', 1, 12);
INSERT INTO `log` VALUES (17809, '2019-12-29 10:32:04', '查看订单详情', NULL, 'INFO', 'co.yixiang.modules.order.web.controller.StoreOrderController.detail()', '{ key: 20191226152431045 }', '127.0.0.1', 11, '15136175246', '内网IP', 1, 12);
INSERT INTO `log` VALUES (17810, '2019-12-29 10:32:05', '查看订单详情', NULL, 'INFO', 'co.yixiang.modules.order.web.controller.StoreOrderController.detail()', '{ key: 20191226152431045 }', '127.0.0.1', 12, '15136175246', '内网IP', 1, 12);
INSERT INTO `log` VALUES (17811, '2019-12-29 10:32:09', '提交订单退款', NULL, 'INFO', 'co.yixiang.modules.order.web.controller.StoreOrderController.refundVerify()', '{ param: RefundParam(refund_reason_wap_explain=555, refund_reason_wap_img=, text=收货地址填错了, uni=20191226152431045) }', '127.0.0.1', 72, '15136175246', '内网IP', 1, 12);
INSERT INTO `log` VALUES (17812, '2019-12-29 10:32:10', '查看订单详情', NULL, 'INFO', 'co.yixiang.modules.order.web.controller.StoreOrderController.detail()', '{ key: 20191226152431045 }', '127.0.0.1', 9, '15136175246', '内网IP', 1, 12);
INSERT INTO `log` VALUES (17813, '2019-12-29 10:33:50', '进入用户中心', NULL, 'INFO', 'co.yixiang.modules.user.web.controller.UserController.userMenu()', '{ }', '127.0.0.1', 7, '15136175246', '内网IP', 1, 12);
INSERT INTO `log` VALUES (17814, '2019-12-29 10:33:54', '查看订单列表', NULL, 'INFO', 'co.yixiang.modules.order.web.controller.StoreOrderController.orderList()', '{ type: -3 page: 1 limit: 20 }', '127.0.0.1', 40, '15136175246', '内网IP', 1, 12);
INSERT INTO `log` VALUES (17815, '2019-12-29 10:34:04', '查看订单详情', NULL, 'INFO', 'co.yixiang.modules.order.web.controller.StoreOrderController.detail()', '{ key: 20191226152431045 }', '127.0.0.1', 8, '15136175246', '内网IP', 1, 12);
INSERT INTO `log` VALUES (17816, '2019-12-29 13:49:54', '查询商品', NULL, 'INFO', 'co.yixiang.modules.shop.rest.YxStoreProductController.getYxStoreProducts()', '{ criteria: YxStoreProductQueryCriteria(storeName=null, isDel=0, isShow=1) pageable: Page request [number: 0, size 10, sort: id: DESC] }', '127.0.0.1', 77, 'admin', '内网IP', 0, 1);
INSERT INTO `log` VALUES (17817, '2019-12-29 13:49:54', '查询字典详情', NULL, 'INFO', 'co.yixiang.modules.system.rest.DictDetailController.getDictDetails()', '{ criteria: DictDetailQueryCriteria(label=null, dictName=cate_show_status) pageable: Page request [number: 0, size 2000, sort: sort: ASC] }', '127.0.0.1', 52, 'admin', '内网IP', 0, 1);
INSERT INTO `log` VALUES (17818, '2019-12-29 13:49:54', '查询商品分类', NULL, 'INFO', 'co.yixiang.modules.shop.rest.YxStoreCategoryController.getYxStoreCategorys()', '{ criteria: YxStoreCategoryQueryCriteria(cateName=null) pageable: Page request [number: 0, size 10, sort: id: DESC] }', '127.0.0.1', 100, 'admin', '内网IP', 0, 1);
INSERT INTO `log` VALUES (17819, '2019-12-29 13:49:54', '查询商品', NULL, 'INFO', 'co.yixiang.modules.shop.rest.YxStoreProductController.getYxStoreProducts()', '{ criteria: YxStoreProductQueryCriteria(storeName=null, isDel=1, isShow=null) pageable: Page request [number: 0, size 10, sort: id: DESC] }', '127.0.0.1', 9, 'admin', '内网IP', 0, 1);
INSERT INTO `log` VALUES (17820, '2019-12-29 13:49:54', '查询商品', NULL, 'INFO', 'co.yixiang.modules.shop.rest.YxStoreProductController.getYxStoreProducts()', '{ criteria: YxStoreProductQueryCriteria(storeName=null, isDel=null, isShow=0) pageable: Page request [number: 0, size 10, sort: id: DESC] }', '127.0.0.1', 10, 'admin', '内网IP', 0, 1);
INSERT INTO `log` VALUES (17821, '2019-12-29 13:49:58', '查询', NULL, 'INFO', 'co.yixiang.modules.shop.rest.YxSystemUserLevelController.getYxSystemUserLevels()', '{ criteria: YxSystemUserLevelQueryCriteria() pageable: Page request [number: 0, size 10, sort: id: DESC] }', '127.0.0.1', 33, 'admin', '内网IP', 0, 1);
INSERT INTO `log` VALUES (17822, '2019-12-29 13:49:58', '查询', NULL, 'INFO', 'co.yixiang.modules.shop.rest.YxSystemUserTaskController.getYxSystemUserTasks()', '{ criteria: YxSystemUserTaskQueryCriteria() pageable: Page request [number: 0, size 10, sort: id: DESC] }', '127.0.0.1', 95, 'admin', '内网IP', 0, 1);
INSERT INTO `log` VALUES (17823, '2019-12-29 13:49:59', '查询', NULL, 'INFO', 'co.yixiang.modules.shop.rest.YxUserBillController.getYxUserBills()', '{ criteria: YxUserBillQueryCriteria(nickname=, category=, type=) pageable: Page request [number: 0, size 10, sort: UNSORTED] }', '127.0.0.1', 13, 'admin', '内网IP', 0, 1);
INSERT INTO `log` VALUES (17824, '2019-12-29 13:50:01', '查询', NULL, 'INFO', 'co.yixiang.modules.wechat.rest.YxSystemConfigController.getYxSystemConfigs()', '{ criteria: YxSystemConfigQueryCriteria() pageable: Page request [number: 0, size 50, sort: UNSORTED] }', '127.0.0.1', 20, 'admin', '内网IP', 0, 1);
INSERT INTO `log` VALUES (17825, '2019-12-29 13:50:02', '查询', NULL, 'INFO', 'co.yixiang.modules.wechat.rest.YxSystemConfigController.getYxSystemConfigs()', '{ criteria: YxSystemConfigQueryCriteria() pageable: Page request [number: 0, size 50, sort: UNSORTED] }', '127.0.0.1', 13, 'admin', '内网IP', 0, 1);
INSERT INTO `log` VALUES (17826, '2019-12-29 13:50:02', '查询', NULL, 'INFO', 'co.yixiang.modules.wechat.rest.YxSystemConfigController.getYxSystemConfigs()', '{ criteria: YxSystemConfigQueryCriteria() pageable: Page request [number: 0, size 50, sort: UNSORTED] }', '127.0.0.1', 4, 'admin', '内网IP', 0, 1);
INSERT INTO `log` VALUES (17827, '2019-12-29 13:50:05', '查询快递', NULL, 'INFO', 'co.yixiang.modules.shop.rest.YxExpressController.getYxExpresss()', '{ criteria: YxExpressQueryCriteria() pageable: Page request [number: 0, size 10, sort: id: DESC] }', '127.0.0.1', 12, 'admin', '内网IP', 0, 1);
INSERT INTO `log` VALUES (17828, '2019-12-29 13:50:06', '查询数据配置', NULL, 'INFO', 'co.yixiang.modules.shop.rest.YxSystemGroupDataController.getYxSystemGroupDatas()', '{ criteria: YxSystemGroupDataQueryCriteria(groupName=routine_my_menus) pageable: Page request [number: 0, size 10, sort: id: DESC] }', '127.0.0.1', 36, 'admin', '内网IP', 0, 1);
INSERT INTO `log` VALUES (17829, '2019-12-29 13:50:07', '查询', NULL, 'INFO', 'co.yixiang.modules.wechat.rest.YxSystemConfigController.getYxSystemConfigs()', '{ criteria: YxSystemConfigQueryCriteria() pageable: Page request [number: 0, size 50, sort: UNSORTED] }', '127.0.0.1', 11, 'admin', '内网IP', 0, 1);
INSERT INTO `log` VALUES (17830, '2019-12-29 13:50:07', '查询数据配置', NULL, 'INFO', 'co.yixiang.modules.shop.rest.YxSystemGroupDataController.getYxSystemGroupDatas()', '{ criteria: YxSystemGroupDataQueryCriteria(groupName=sign_day_num) pageable: Page request [number: 0, size 10, sort: id: DESC] }', '127.0.0.1', 9, 'admin', '内网IP', 0, 1);
INSERT INTO `log` VALUES (17831, '2019-12-29 13:50:09', '查询砍价', NULL, 'INFO', 'co.yixiang.modules.activity.rest.YxStoreBargainController.getYxStoreBargains()', '{ criteria: YxStoreBargainQueryCriteria() pageable: Page request [number: 0, size 10, sort: id: DESC] }', '127.0.0.1', 14, 'admin', '内网IP', 0, 1);
INSERT INTO `log` VALUES (17832, '2019-12-29 13:50:11', '查询Y', NULL, 'INFO', 'co.yixiang.modules.activity.rest.YxStoreCouponUserController.getYxStoreCouponUsers()', '{ criteria: YxStoreCouponUserQueryCriteria(couponTitle=null) pageable: Page request [number: 0, size 10, sort: id: DESC] }', '127.0.0.1', 41, 'admin', '内网IP', 0, 1);
INSERT INTO `log` VALUES (17833, '2019-12-29 13:50:13', '查询', NULL, 'INFO', 'co.yixiang.modules.wechat.rest.YxSystemConfigController.getYxSystemConfigs()', '{ criteria: YxSystemConfigQueryCriteria() pageable: Page request [number: 0, size 50, sort: UNSORTED] }', '127.0.0.1', 4, 'admin', '内网IP', 0, 1);
INSERT INTO `log` VALUES (17834, '2019-12-29 13:50:14', '查询', NULL, 'INFO', 'co.yixiang.modules.activity.rest.YxUserExtractController.getYxUserExtracts()', '{ criteria: YxUserExtractQueryCriteria(realName=null) pageable: Page request [number: 0, size 10, sort: id: DESC] }', '127.0.0.1', 18, 'admin', '内网IP', 0, 1);
INSERT INTO `log` VALUES (17835, '2019-12-29 13:50:15', '查询字典详情', NULL, 'INFO', 'co.yixiang.modules.system.rest.DictDetailController.getDictDetails()', '{ criteria: DictDetailQueryCriteria(label=null, dictName=dept_status) pageable: Page request [number: 0, size 2000, sort: sort: ASC] }', '127.0.0.1', 2, 'admin', '内网IP', 0, 1);
INSERT INTO `log` VALUES (17836, '2019-12-29 13:50:15', '查询部门', NULL, 'INFO', 'co.yixiang.modules.system.rest.DeptController.getDepts()', '{ criteria: DeptQueryCriteria(ids=[], name=null, enabled=null, pid=null) }', '127.0.0.1', 25, 'admin', '内网IP', 0, 1);
INSERT INTO `log` VALUES (17837, '2019-12-29 17:25:58', '用户登录', 'java.lang.NoClassDefFoundError: co/yixiang/modules/security/security/JwtUser\r\n	at co.yixiang.modules.security.service.JwtUserDetailsService.createJwtUser(JwtUserDetailsService.java:42)\r\n	at co.yixiang.modules.security.service.JwtUserDetailsService.loadUserByUsername(JwtUserDetailsService.java:37)\r\n	at co.yixiang.modules.security.service.JwtUserDetailsService$$FastClassBySpringCGLIB$$c7eee17c.invoke(<generated>)\r\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\r\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:746)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\r\n	at org.springframework.transaction.interceptor.TransactionAspectSupport.invokeWithinTransaction(TransactionAspectSupport.java:294)\r\n	at org.springframework.transaction.interceptor.TransactionInterceptor.invoke(TransactionInterceptor.java:98)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\r\n	at org.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.intercept(CglibAopProxy.java:688)\r\n	at co.yixiang.modules.security.service.JwtUserDetailsService$$EnhancerBySpringCGLIB$$1075cc1b.loadUserByUsername(<generated>)\r\n	at co.yixiang.modules.security.rest.AuthenticationController.login(AuthenticationController.java:77)\r\n	at co.yixiang.modules.security.rest.AuthenticationController$$FastClassBySpringCGLIB$$7265dd5e.invoke(<generated>)\r\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\r\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:746)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\r\n	at org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint.proceed(MethodInvocationProceedingJoinPoint.java:88)\r\n	at co.yixiang.aspect.LogAspect.logAround(LogAspect.java:50)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethodWithGivenArgs(AbstractAspectJAdvice.java:644)\r\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethod(AbstractAspectJAdvice.java:633)\r\n	at org.springframework.aop.aspectj.AspectJAroundAdvice.invoke(AspectJAroundAdvice.java:70)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:175)\r\n	at org.springframework.aop.aspectj.AspectJAfterThrowingAdvice.invoke(AspectJAfterThrowingAdvice.java:62)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:175)\r\n	at org.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:93)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\r\n	at org.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.intercept(CglibAopProxy.java:688)\r\n	at co.yixiang.modules.security.rest.AuthenticationController$$EnhancerBySpringCGLIB$$d9f4e588.login(<generated>)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:215)\r\n	at org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:142)\r\n	at org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:102)\r\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:895)\r\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:800)\r\n	at org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:87)\r\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:1038)\r\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:942)\r\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:998)\r\n	at org.springframework.web.servlet.FrameworkServlet.doPost(FrameworkServlet.java:901)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:660)\r\n	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:875)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:741)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:231)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:53)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:101)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at com.alibaba.druid.support.http.WebStatFilter.doFilter(WebStatFilter.java:123)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:320)\r\n	at org.springframework.security.web.access.intercept.FilterSecurityInterceptor.invoke(FilterSecurityInterceptor.java:127)\r\n	at org.springframework.security.web.access.intercept.FilterSecurityInterceptor.doFilter(FilterSecurityInterceptor.java:91)\r\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.access.ExceptionTranslationFilter.doFilter(ExceptionTranslationFilter.java:119)\r\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.session.SessionManagementFilter.doFilter(SessionManagementFilter.java:137)\r\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.authentication.AnonymousAuthenticationFilter.doFilter(AnonymousAuthenticationFilter.java:111)\r\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.servletapi.SecurityContextHolderAwareRequestFilter.doFilter(SecurityContextHolderAwareRequestFilter.java:170)\r\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.savedrequest.RequestCacheAwareFilter.doFilter(RequestCacheAwareFilter.java:63)\r\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at co.yixiang.modules.security.security.JwtAuthorizationTokenFilter.doFilterInternal(JwtAuthorizationTokenFilter.java:65)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.authentication.logout.LogoutFilter.doFilter(LogoutFilter.java:116)\r\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.header.HeaderWriterFilter.doFilterInternal(HeaderWriterFilter.java:66)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.context.SecurityContextPersistenceFilter.doFilter(SecurityContextPersistenceFilter.java:105)\r\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.context.request.async.WebAsyncManagerIntegrationFilter.doFilterInternal(WebAsyncManagerIntegrationFilter.java:56)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.FilterChainProxy.doFilterInternal(FilterChainProxy.java:215)\r\n	at org.springframework.security.web.FilterChainProxy.doFilter(FilterChainProxy.java:178)\r\n	at org.springframework.web.filter.DelegatingFilterProxy.invokeDelegate(DelegatingFilterProxy.java:357)\r\n	at org.springframework.web.filter.DelegatingFilterProxy.doFilter(DelegatingFilterProxy.java:270)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:200)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:199)\r\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:96)\r\n	at org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:490)\r\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:139)\r\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:92)\r\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:74)\r\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:343)\r\n	at org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:408)\r\n	at org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:66)\r\n	at org.apache.coyote.AbstractProtocol$ConnectionHandler.process(AbstractProtocol.java:770)\r\n	at org.apache.tomcat.util.net.NioEndpoint$SocketProcessor.doRun(NioEndpoint.java:1415)\r\n	at org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:49)\r\n	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1149)\r\n	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:624)\r\n	at org.apache.tomcat.util.threads.TaskThread$WrappingRunnable.run(TaskThread.java:61)\r\n	at java.lang.Thread.run(Thread.java:748)\r\n', 'ERROR', 'co.yixiang.modules.security.rest.AuthenticationController.login()', '{ authorizationUser: {username=15136175246, password= ******} }', '127.0.0.1', 10, '', '', 0, 0);
INSERT INTO `log` VALUES (17838, '2019-12-29 17:27:43', '用户登录', NULL, 'INFO', 'co.yixiang.modules.security.rest.AuthenticationController.login()', '{ authorizationUser: {username=15136175246, password= ******} }', '127.0.0.1', 622, '', '内网IP', 0, 0);
INSERT INTO `log` VALUES (17839, '2019-12-29 17:27:47', '查看优惠券', NULL, 'INFO', 'co.yixiang.modules.shop.web.controller.CouponController.getList()', '{ page: 1 limit: 20 }', '127.0.0.1', 180, '15136175246', '内网IP', 1, 12);
INSERT INTO `log` VALUES (17840, '2019-12-29 17:27:47', '查看商品详情', NULL, 'INFO', 'co.yixiang.modules.shop.web.controller.StoreProductController.detail()', '{ id: 19 }', '127.0.0.1', 525, '15136175246', '内网IP', 1, 12);
INSERT INTO `log` VALUES (17841, '2019-12-29 17:27:53', '添加购物车', NULL, 'INFO', 'co.yixiang.modules.shop.web.controller.StoreCartController.add()', '{ jsonStr: {\"productId\":\"19\",\"cartNum\":1,\"new\":1,\"uniqueId\":\"00e86525a7af4dcf9e653ae0a2062369\"} }', '127.0.0.1', 85, '15136175246', '内网IP', 1, 12);
INSERT INTO `log` VALUES (17842, '2019-12-29 17:28:01', '查看订单详情', NULL, 'INFO', 'co.yixiang.modules.order.web.controller.StoreOrderController.detail()', '{ key: 191229CD16HWC0ZC }', '127.0.0.1', 24, '15136175246', '内网IP', 1, 12);
INSERT INTO `log` VALUES (17843, '2019-12-30 12:09:01', '用户登录', NULL, 'INFO', 'co.yixiang.modules.security.rest.AuthenticationController.login()', '{ authorizationUser: {username=15136175246, password= ******} }', '127.0.0.1', 1387, '', '内网IP', 0, 0);
INSERT INTO `log` VALUES (17844, '2019-12-30 12:09:08', '进入用户中心', NULL, 'INFO', 'co.yixiang.modules.user.web.controller.UserController.userMenu()', '{ }', '127.0.0.1', 11, '15136175246', '内网IP', 1, 12);
INSERT INTO `log` VALUES (17845, '2019-12-30 12:09:27', '查看优惠券', NULL, 'INFO', 'co.yixiang.modules.shop.web.controller.CouponController.getList()', '{ page: 1 limit: 20 }', '127.0.0.1', 75, '15136175246', '内网IP', 1, 12);
INSERT INTO `log` VALUES (17846, '2019-12-30 12:09:27', '查看商品详情', NULL, 'INFO', 'co.yixiang.modules.shop.web.controller.StoreProductController.detail()', '{ id: 19 }', '127.0.0.1', 111, '15136175246', '内网IP', 1, 12);
INSERT INTO `log` VALUES (17847, '2019-12-30 12:09:28', '添加购物车', NULL, 'INFO', 'co.yixiang.modules.shop.web.controller.StoreCartController.add()', '{ jsonStr: {\"productId\":\"19\",\"cartNum\":1,\"new\":1,\"uniqueId\":\"00e86525a7af4dcf9e653ae0a2062369\"} }', '127.0.0.1', 81, '15136175246', '内网IP', 1, 12);
INSERT INTO `log` VALUES (17848, '2019-12-31 11:13:35', '用户登录', NULL, 'INFO', 'co.yixiang.modules.security.rest.AuthenticationController.login()', '{ authorizationUser: {username=admin, password= ******} }', '127.0.0.1', 1071, 'admin', '内网IP', 0, 0);
INSERT INTO `log` VALUES (17849, '2019-12-31 11:13:40', '查询快递', NULL, 'INFO', 'co.yixiang.modules.shop.rest.YxExpressController.getYxExpresss()', '{ criteria: YxExpressQueryCriteria() pageable: Page request [number: 0, size 20, sort: UNSORTED] }', '127.0.0.1', 63, 'admin', '内网IP', 0, 1);
INSERT INTO `log` VALUES (17850, '2019-12-31 12:55:37', '查询快递', NULL, 'INFO', 'co.yixiang.modules.shop.rest.YxExpressController.getYxExpresss()', '{ criteria: YxExpressQueryCriteria() pageable: Page request [number: 0, size 20, sort: UNSORTED] }', '127.0.0.1', 75, 'admin', '内网IP', 0, 1);
INSERT INTO `log` VALUES (17851, '2019-12-31 13:03:18', '查询快递', NULL, 'INFO', 'co.yixiang.modules.shop.rest.YxExpressController.getYxExpresss()', '{ criteria: YxExpressQueryCriteria() pageable: Page request [number: 0, size 20, sort: UNSORTED] }', '127.0.0.1', 9, 'admin', '内网IP', 0, 1);
INSERT INTO `log` VALUES (17852, '2019-12-31 13:11:01', '查询快递', NULL, 'INFO', 'co.yixiang.modules.shop.rest.YxExpressController.getYxExpresss()', '{ criteria: YxExpressQueryCriteria() pageable: Page request [number: 0, size 20, sort: UNSORTED] }', '127.0.0.1', 11, 'admin', '内网IP', 0, 1);
INSERT INTO `log` VALUES (17853, '2019-12-31 13:13:32', '查询快递', NULL, 'INFO', 'co.yixiang.modules.shop.rest.YxExpressController.getYxExpresss()', '{ criteria: YxExpressQueryCriteria() pageable: Page request [number: 0, size 20, sort: UNSORTED] }', '127.0.0.1', 7, 'admin', '内网IP', 0, 1);
INSERT INTO `log` VALUES (17854, '2019-12-31 13:15:26', '查询快递', NULL, 'INFO', 'co.yixiang.modules.shop.rest.YxExpressController.getYxExpresss()', '{ criteria: YxExpressQueryCriteria() pageable: Page request [number: 0, size 20, sort: UNSORTED] }', '127.0.0.1', 4, 'admin', '内网IP', 0, 1);
INSERT INTO `log` VALUES (17855, '2019-12-31 13:16:20', '查询快递', NULL, 'INFO', 'co.yixiang.modules.shop.rest.YxExpressController.getYxExpresss()', '{ criteria: YxExpressQueryCriteria() pageable: Page request [number: 0, size 20, sort: UNSORTED] }', '127.0.0.1', 9, 'admin', '内网IP', 0, 1);
INSERT INTO `log` VALUES (17856, '2019-12-31 13:25:12', '修改订单', NULL, 'INFO', 'co.yixiang.modules.shop.rest.YxStoreOrderController.editOrder()', '{ resources: YxStoreOrder(id=30, orderId=20191107173722332, uid=8, realName=胡鹏, userPhone=15136175246, userAddress=山西 大同市 灵丘县 999, cartId=29, freightPrice=0, totalNum=1, totalPrice=0.2, totalPostage=0, payPrice=0, payPostage=0, deductionPrice=0, couponId=0, couponPrice=0, paid=0, payTime=null, payType=weixin, addTime=1573119442, status=0, refundStatus=0, refundReasonWapImg=null, refundReasonWapExplain=null, refundReasonTime=null, refundReasonWap=null, refundReason=null, refundPrice=0, deliveryName=null, deliverySn=null, deliveryType=null, deliveryId=null, gainIntegral=1, useIntegral=0, backIntegral=null, mark=, isDel=0, unique=f9dd9de7f09442bcbeb3b0ffc3d7c090, remark=null, merId=0, isMerCheck=0, combinationId=0, pinkId=0, cost=0.2, seckillId=0, bargainId=0, verifyCode=, storeId=0, shippingType=1, isChannel=0, isRemind=0, isSystemDel=0) }', '127.0.0.1', 401, 'admin', '内网IP', 0, 1);
INSERT INTO `log` VALUES (17857, '2019-12-31 13:35:21', '查询快递', NULL, 'INFO', 'co.yixiang.modules.shop.rest.YxExpressController.getYxExpresss()', '{ criteria: YxExpressQueryCriteria() pageable: Page request [number: 0, size 20, sort: UNSORTED] }', '127.0.0.1', 46, 'admin', '内网IP', 0, 1);
INSERT INTO `log` VALUES (17858, '2019-12-31 13:44:45', '查询快递', NULL, 'INFO', 'co.yixiang.modules.shop.rest.YxExpressController.getYxExpresss()', '{ criteria: YxExpressQueryCriteria() pageable: Page request [number: 0, size 20, sort: UNSORTED] }', '127.0.0.1', 36, 'admin', '内网IP', 0, 1);
INSERT INTO `log` VALUES (17859, '2019-12-31 13:45:40', '查询快递', NULL, 'INFO', 'co.yixiang.modules.shop.rest.YxExpressController.getYxExpresss()', '{ criteria: YxExpressQueryCriteria() pageable: Page request [number: 0, size 20, sort: UNSORTED] }', '127.0.0.1', 46, 'admin', '内网IP', 0, 1);
INSERT INTO `log` VALUES (17860, '2019-12-31 13:51:14', '查询快递', NULL, 'INFO', 'co.yixiang.modules.shop.rest.YxExpressController.getYxExpresss()', '{ criteria: YxExpressQueryCriteria() pageable: Page request [number: 0, size 20, sort: UNSORTED] }', '127.0.0.1', 156, 'admin', '内网IP', 0, 1);
INSERT INTO `log` VALUES (17861, '2019-12-31 13:52:07', '修改订单备注', NULL, 'INFO', 'co.yixiang.modules.shop.rest.YxStoreOrderController.editOrderRemark()', '{ resources: YxStoreOrder(id=105, orderId=191229CD16HWC0ZC, uid=12, realName=hu, userPhone=15136175246, userAddress=上海 闸北区 城区 99999, cartId=105, freightPrice=0, totalNum=1, totalPrice=118.8, totalPostage=0, payPrice=118.8, payPostage=0, deductionPrice=0, couponId=0, couponPrice=0, paid=1, payTime=1577611680, payType=yue, addTime=1577611680, status=0, refundStatus=0, refundReasonWapImg=null, refundReasonWapExplain=null, refundReasonTime=null, refundReasonWap=null, refundReason=null, refundPrice=0, deliveryName=null, deliverySn=null, deliveryType=null, deliveryId=null, gainIntegral=1, useIntegral=0, backIntegral=null, mark=, isDel=0, unique=63576ad9de2e4575a5c29a78f4458ebc, remark=备注2222, merId=0, isMerCheck=0, combinationId=0, pinkId=0, cost=100, seckillId=0, bargainId=0, verifyCode=, storeId=0, shippingType=1, isChannel=1, isRemind=0, isSystemDel=0) }', '127.0.0.1', 366, 'admin', '内网IP', 0, 1);
INSERT INTO `log` VALUES (17862, '2019-12-31 14:44:34', '查看商品详情', NULL, 'INFO', 'co.yixiang.modules.shop.web.controller.StoreProductController.detail()', '{ id: 19 }', '127.0.0.1', 136, '15136175246', '内网IP', 1, 12);
INSERT INTO `log` VALUES (17863, '2019-12-31 14:44:34', '查看优惠券', NULL, 'INFO', 'co.yixiang.modules.shop.web.controller.CouponController.getList()', '{ page: 1 limit: 20 }', '127.0.0.1', 37, '15136175246', '内网IP', 1, 12);
INSERT INTO `log` VALUES (17864, '2019-12-31 14:44:36', '添加购物车', NULL, 'INFO', 'co.yixiang.modules.shop.web.controller.StoreCartController.add()', '{ jsonStr: {\"productId\":\"19\",\"cartNum\":1,\"new\":1,\"uniqueId\":\"00e86525a7af4dcf9e653ae0a2062369\"} }', '127.0.0.1', 209, '15136175246', '内网IP', 1, 12);
INSERT INTO `log` VALUES (17865, '2019-12-31 14:45:07', '查看订单详情', NULL, 'INFO', 'co.yixiang.modules.order.web.controller.StoreOrderController.detail()', '{ key: 191231AFS407HNXP }', '127.0.0.1', 15, '15136175246', '内网IP', 1, 12);
INSERT INTO `log` VALUES (17866, '2019-12-31 14:47:39', '查看订单详情', NULL, 'INFO', 'co.yixiang.modules.order.web.controller.StoreOrderController.detail()', '{ key: 191231AFS407HNXP }', '127.0.0.1', 14, '15136175246', '内网IP', 1, 12);
INSERT INTO `log` VALUES (17867, '2019-12-31 14:49:03', '进入用户中心', NULL, 'INFO', 'co.yixiang.modules.user.web.controller.UserController.userMenu()', '{ }', '127.0.0.1', 9, '15136175246', '内网IP', 1, 12);
INSERT INTO `log` VALUES (17868, '2019-12-31 14:49:05', '查看积分流水', NULL, 'INFO', 'co.yixiang.modules.user.web.controller.UserBillController.userInfo()', '{ page: 1 limit: 15 }', '127.0.0.1', 26, '15136175246', '内网IP', 1, 12);
INSERT INTO `log` VALUES (17869, '2019-12-31 14:49:23', '查看积分流水', NULL, 'INFO', 'co.yixiang.modules.user.web.controller.UserBillController.userInfo()', '{ page: 1 limit: 15 }', '127.0.0.1', 16, '15136175246', '内网IP', 1, 12);
INSERT INTO `log` VALUES (17870, '2019-12-31 14:50:59', '查看积分流水', NULL, 'INFO', 'co.yixiang.modules.user.web.controller.UserBillController.userInfo()', '{ page: 1 limit: 15 }', '127.0.0.1', 7, '15136175246', '内网IP', 1, 12);
INSERT INTO `log` VALUES (17871, '2019-12-31 16:06:27', '查看商品详情', NULL, 'INFO', 'co.yixiang.modules.shop.web.controller.StoreProductController.detail()', '{ id: 19 }', '127.0.0.1', 310, '15136175246', '内网IP', 1, 12);
INSERT INTO `log` VALUES (17872, '2019-12-31 16:06:27', '查看优惠券', NULL, 'INFO', 'co.yixiang.modules.shop.web.controller.CouponController.getList()', '{ page: 1 limit: 20 }', '127.0.0.1', 209, '15136175246', '内网IP', 1, 12);
INSERT INTO `log` VALUES (17873, '2019-12-31 16:06:35', '查看优惠券', NULL, 'INFO', 'co.yixiang.modules.shop.web.controller.CouponController.getList()', '{ page: 1 limit: 20 }', '127.0.0.1', 14, '15136175246', '内网IP', 1, 12);
INSERT INTO `log` VALUES (17874, '2019-12-31 16:06:35', '查看商品详情', NULL, 'INFO', 'co.yixiang.modules.shop.web.controller.StoreProductController.detail()', '{ id: 19 }', '127.0.0.1', 48, '15136175246', '内网IP', 1, 12);
INSERT INTO `log` VALUES (17875, '2019-12-31 16:06:37', '进入用户中心', NULL, 'INFO', 'co.yixiang.modules.user.web.controller.UserController.userMenu()', '{ }', '127.0.0.1', 12, '15136175246', '内网IP', 1, 12);
INSERT INTO `log` VALUES (17876, '2019-12-31 16:06:39', '查看订单列表', NULL, 'INFO', 'co.yixiang.modules.order.web.controller.StoreOrderController.orderList()', '{ type: 3 page: 1 limit: 20 }', '127.0.0.1', 78, '15136175246', '内网IP', 1, 12);
INSERT INTO `log` VALUES (17877, '2019-12-31 16:06:40', '查看订单详情', NULL, 'INFO', 'co.yixiang.modules.order.web.controller.StoreOrderController.detail()', '{ key: 20191122202407197 }', '127.0.0.1', 14, '15136175246', '内网IP', 1, 12);
INSERT INTO `log` VALUES (17878, '2019-12-31 16:06:50', '评价商品', NULL, 'INFO', 'co.yixiang.modules.order.web.controller.StoreOrderController.comment()', '{ productReply: YxStoreProductReply(id=4, uid=12, oid=96, unique=af8ca64055ac4c739cfded03c2c0b784, productId=19, replyType=product, productScore=1, serviceScore=1, comment=差评, pics=, addTime=1577779610, merchantReplyContent=null, merchantReplyTime=null, isDel=null, isReply=null) }', '127.0.0.1', 211, '15136175246', '内网IP', 1, 12);
INSERT INTO `log` VALUES (17879, '2019-12-31 16:06:50', '查看订单详情', NULL, 'INFO', 'co.yixiang.modules.order.web.controller.StoreOrderController.detail()', '{ key: 20191122202407197 }', '127.0.0.1', 12, '15136175246', '内网IP', 1, 12);
INSERT INTO `log` VALUES (17880, '2019-12-31 16:06:54', '查看优惠券', NULL, 'INFO', 'co.yixiang.modules.shop.web.controller.CouponController.getList()', '{ page: 1 limit: 20 }', '127.0.0.1', 4, '15136175246', '内网IP', 1, 12);
INSERT INTO `log` VALUES (17881, '2019-12-31 16:06:54', '查看商品详情', NULL, 'INFO', 'co.yixiang.modules.shop.web.controller.StoreProductController.detail()', '{ id: 19 }', '127.0.0.1', 30, '15136175246', '内网IP', 1, 12);
INSERT INTO `log` VALUES (17882, '2019-12-31 16:57:16', '查看优惠券', NULL, 'INFO', 'co.yixiang.modules.shop.web.controller.CouponController.getList()', '{ page: 1 limit: 20 }', '127.0.0.1', 151, '15136175246', '内网IP', 1, 12);
INSERT INTO `log` VALUES (17883, '2019-12-31 16:57:16', '查看商品详情', NULL, 'INFO', 'co.yixiang.modules.shop.web.controller.StoreProductController.detail()', '{ id: 19 }', '127.0.0.1', 153, '15136175246', '内网IP', 1, 12);
INSERT INTO `log` VALUES (17884, '2020-01-01 22:57:25', '用户登录', NULL, 'INFO', 'co.yixiang.modules.security.rest.AuthenticationController.login()', '{ authorizationUser: {username=15136175246, password= ******} }', '127.0.0.1', 186, '', '内网IP', 0, 0);
INSERT INTO `log` VALUES (17885, '2020-01-01 22:57:27', '查看优惠券', NULL, 'INFO', 'co.yixiang.modules.shop.web.controller.CouponController.getList()', '{ page: 1 limit: 20 }', '127.0.0.1', 51, '15136175246', '内网IP', 1, 12);
INSERT INTO `log` VALUES (17886, '2020-01-01 22:57:27', '查看商品详情', NULL, 'INFO', 'co.yixiang.modules.shop.web.controller.StoreProductController.detail()', '{ id: 19 }', '127.0.0.1', 118, '15136175246', '内网IP', 1, 12);
INSERT INTO `log` VALUES (17887, '2020-01-01 22:57:31', '添加购物车', NULL, 'INFO', 'co.yixiang.modules.shop.web.controller.StoreCartController.add()', '{ jsonStr: {\"productId\":\"19\",\"cartNum\":1,\"new\":1,\"uniqueId\":\"00e86525a7af4dcf9e653ae0a2062369\"} }', '127.0.0.1', 76, '15136175246', '内网IP', 1, 12);
INSERT INTO `log` VALUES (17888, '2020-01-01 22:57:44', '查看订单详情', NULL, 'INFO', 'co.yixiang.modules.order.web.controller.StoreOrderController.detail()', '{ key: 200101HASMPA74DP }', '127.0.0.1', 10, '15136175246', '内网IP', 1, 12);
INSERT INTO `log` VALUES (17889, '2020-01-01 22:58:18', '进入用户中心', NULL, 'INFO', 'co.yixiang.modules.user.web.controller.UserController.userMenu()', '{ }', '127.0.0.1', 6, '15136175246', '内网IP', 1, 12);
INSERT INTO `log` VALUES (17890, '2020-01-01 22:58:19', '查看订单列表', NULL, 'INFO', 'co.yixiang.modules.order.web.controller.StoreOrderController.orderList()', '{ type: 0 page: 1 limit: 20 }', '127.0.0.1', 42, '15136175246', '内网IP', 1, 12);
INSERT INTO `log` VALUES (17891, '2020-01-01 22:59:45', '查看订单列表', NULL, 'INFO', 'co.yixiang.modules.order.web.controller.StoreOrderController.orderList()', '{ type: 0 page: 1 limit: 20 }', '127.0.0.1', 26, '15136175246', '内网IP', 1, 12);

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `i_frame` bit(1) NULL DEFAULT NULL COMMENT '是否外链',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单名称',
  `component` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组件',
  `pid` bigint(20) NOT NULL COMMENT '上级菜单ID',
  `sort` bigint(20) NOT NULL COMMENT '排序',
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图标',
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '链接地址',
  `cache` bit(1) NULL DEFAULT b'0',
  `hidden` bit(1) NULL DEFAULT b'0',
  `component_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '-',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKqcf9gem97gqa5qjm4d3elcqt5`(`pid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 87 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES (1, '2018-12-18 15:11:29', b'0', '系统管理', NULL, 0, 99, 'system', 'system', b'0', b'0', NULL);
INSERT INTO `menu` VALUES (2, '2018-12-18 15:14:44', b'0', '用户管理', 'system/user/index', 1, 2, 'peoples', 'user', b'0', b'0', 'User');
INSERT INTO `menu` VALUES (3, '2018-12-18 15:16:07', b'0', '角色管理', 'system/role/index', 1, 3, 'role', 'role', b'0', b'0', 'Role');
INSERT INTO `menu` VALUES (4, '2018-12-18 15:16:45', b'0', '权限管理', 'system/permission/index', 1, 4, 'permission', 'permission', b'0', b'0', 'Permission');
INSERT INTO `menu` VALUES (5, '2018-12-18 15:17:28', b'0', '菜单管理', 'system/menu/index', 1, 5, 'menu', 'menu', b'0', b'0', 'Menu');
INSERT INTO `menu` VALUES (6, '2018-12-18 15:17:48', b'0', '系统监控', NULL, 0, 100, 'monitor', 'monitor', b'0', b'0', NULL);
INSERT INTO `menu` VALUES (7, '2018-12-18 15:18:26', b'0', '操作日志', 'monitor/log/index', 6, 11, 'log', 'logs', b'1', b'0', 'Log');
INSERT INTO `menu` VALUES (8, '2018-12-18 15:19:01', b'0', '系统缓存', 'monitor/redis/index', 6, 13, 'redis', 'redis', b'0', b'0', 'Redis');
INSERT INTO `menu` VALUES (9, '2018-12-18 15:19:34', b'0', 'SQL监控', 'monitor/sql/index', 6, 14, 'sqlMonitor', 'druid', b'0', b'0', 'Sql');
INSERT INTO `menu` VALUES (14, '2018-12-27 10:13:09', b'0', '邮件工具', 'tools/email/index', 36, 24, 'email', 'email', b'0', b'0', 'Email');
INSERT INTO `menu` VALUES (16, '2018-12-28 09:36:53', b'0', '图床管理', 'tools/picture/index', 36, 25, 'image', 'pictures', b'0', b'0', 'Pictures');
INSERT INTO `menu` VALUES (18, '2018-12-31 11:12:15', b'0', '存储管理', 'tools/storage/index', 36, 23, 'qiniu', 'storage', b'0', b'0', 'Storage');
INSERT INTO `menu` VALUES (19, '2018-12-31 14:52:38', b'0', '支付宝工具', 'tools/aliPay/index', 36, 27, 'alipay', 'aliPay', b'0', b'0', 'AliPay');
INSERT INTO `menu` VALUES (28, '2019-01-07 20:34:40', b'0', '定时任务', 'system/timing/index', 36, 21, 'timing', 'timing', b'0', b'0', 'Timing');
INSERT INTO `menu` VALUES (30, '2019-01-11 15:45:55', b'0', '代码生成', 'generator/index', 36, 22, 'dev', 'generator', b'0', b'0', 'GeneratorIndex');
INSERT INTO `menu` VALUES (32, '2019-01-13 13:49:03', b'0', '异常日志', 'monitor/log/errorLog', 6, 12, 'error', 'errorLog', b'0', b'0', 'ErrorLog');
INSERT INTO `menu` VALUES (35, '2019-03-25 09:46:00', b'0', '部门管理', 'system/dept/index', 1, 6, 'dept', 'dept', b'0', b'0', 'Dept');
INSERT INTO `menu` VALUES (36, '2019-03-29 10:57:35', b'0', '系统工具', '', 0, 101, 'sys-tools', 'sys-tools', b'0', b'0', NULL);
INSERT INTO `menu` VALUES (37, '2019-03-29 13:51:18', b'0', '岗位管理', 'system/job/index', 1, 7, 'Steve-Jobs', 'job', b'0', b'0', 'Job');
INSERT INTO `menu` VALUES (39, '2019-04-10 11:49:04', b'0', '字典管理', 'system/dict/index', 1, 8, 'dictionary', 'dict', b'0', b'0', 'Dict');
INSERT INTO `menu` VALUES (40, '2019-10-03 17:40:19', b'0', '商品管理', '', 0, 1, 'shop', 'shop', b'0', b'0', '');
INSERT INTO `menu` VALUES (41, '2019-10-03 17:42:35', b'0', '商品分类', 'shop/cate/index', 40, 11, 'icon', 'cate', b'0', b'0', 'Cate');
INSERT INTO `menu` VALUES (45, '2019-10-04 15:34:35', b'0', '管理商品', 'shop/goods/tab', 40, 12, 'develop', 'goods', b'0', b'0', 'Goods');
INSERT INTO `menu` VALUES (46, '2019-10-06 16:18:05', b'0', '会员管理', '', 0, 2, 'peoples', 'member', b'0', b'0', '');
INSERT INTO `menu` VALUES (47, '2019-10-06 16:20:17', b'0', '会员', 'shop/user/index', 46, 21, 'peoples', 'member', b'0', b'0', 'Member');
INSERT INTO `menu` VALUES (48, '2019-10-06 18:28:54', b'0', '微信管理', '', 0, 3, 'weixin', 'wechat', b'0', b'0', '');
INSERT INTO `menu` VALUES (49, '2019-10-06 18:31:06', b'0', '微信菜单', 'wechat/menu/index', 48, 31, 'menu', 'wemenu', b'0', b'0', 'WeMenu');
INSERT INTO `menu` VALUES (50, '2019-10-07 17:33:45', b'0', '图文管理', 'wechat/article/index', 48, 32, 'article', 'wearticle', b'0', b'0', 'WeArticle');
INSERT INTO `menu` VALUES (51, '2019-10-10 09:58:31', b'0', '自动回复', 'wechat/reply/index', 48, 33, 'reply', 'wereply', b'0', b'0', 'Wereply');
INSERT INTO `menu` VALUES (52, '2019-10-10 15:52:24', b'0', '公众号配置', 'wechat/config/index', 48, 34, 'configure', 'weconfig', b'0', b'0', 'WeConfig');
INSERT INTO `menu` VALUES (53, '2019-10-14 14:35:18', b'0', '订单管理', '', 0, 4, 'lock', 'order', b'0', b'0', '');
INSERT INTO `menu` VALUES (54, '2019-10-14 14:36:28', b'0', '订单', 'shop/order/index', 53, 41, 'order', 'order', b'0', b'0', 'Order');
INSERT INTO `menu` VALUES (55, '2019-10-18 15:21:26', b'0', '数据配置', '', 0, 5, 'configure', 'set', b'0', b'0', '');
INSERT INTO `menu` VALUES (56, '2019-10-18 15:24:30', b'0', '首页幻灯片', 'shop/set/index', 55, 51, 'banner', 'homeBanner', b'0', b'0', 'HomeBanner');
INSERT INTO `menu` VALUES (57, '2019-10-18 17:23:35', b'0', '首页导航按钮', 'shop/set/menu', 55, 52, 'button', 'homeMenus', b'0', b'0', 'HomeMenus');
INSERT INTO `menu` VALUES (59, '2019-10-21 16:41:30', b'0', '首页滚动新闻', 'shop/set/roll', 55, 54, 'news', 'roll', b'0', b'0', 'Roll');
INSERT INTO `menu` VALUES (60, '2019-10-26 18:21:54', b'0', '热门搜索', 'shop/set/hot', 55, 55, 'search', 'hot', b'0', b'0', 'Hot');
INSERT INTO `menu` VALUES (61, '2019-10-26 18:42:18', b'0', '个人中心菜单', 'shop/set/usermenu', 55, 56, 'menu', 'userMenu', b'0', b'0', 'UserMenu');
INSERT INTO `menu` VALUES (62, '2019-11-03 14:39:09', b'0', '评论管理', 'shop/reply/index', 53, 42, 'comment', 'reply', b'0', b'0', 'Reply');
INSERT INTO `menu` VALUES (63, '2019-11-09 14:17:42', b'0', '营销管理', '', 0, 6, 'yingxiao', 'activity', b'0', b'0', '');
INSERT INTO `menu` VALUES (64, '2019-11-09 14:18:58', b'0', '优惠券制作', 'activity/coupon/index', 63, 61, 'coupon', 'coupon', b'0', b'0', 'Coupon');
INSERT INTO `menu` VALUES (65, '2019-11-09 14:20:35', b'0', '已发布优惠券', 'activity/couponissue/index', 63, 62, 'coupon2', 'couponissue', b'0', b'0', 'Couponissue');
INSERT INTO `menu` VALUES (66, '2019-11-09 14:21:35', b'0', '优惠券领取记录', 'activity/storecouponuser/index', 63, 63, 'log', 'couponuser', b'0', b'0', 'Couponuser');
INSERT INTO `menu` VALUES (67, '2019-11-09 14:22:17', b'0', '优惠券配置', 'activity/coupon/set', 63, 64, 'log', 'couponset', b'0', b'1', 'Couponset');
INSERT INTO `menu` VALUES (68, '2019-11-10 18:45:55', b'0', '积分配置', 'wechat/config/point', 55, 57, 'configure', 'pointConfig', b'0', b'0', 'PointConfig');
INSERT INTO `menu` VALUES (69, '2019-11-11 10:42:16', b'0', '分销管理', '', 0, 7, 'fenxiao', 'promoter', b'0', b'0', '');
INSERT INTO `menu` VALUES (70, '2019-11-11 10:48:37', b'0', '分销配置', 'wechat/config/promoter', 69, 71, 'configure', 'promoterconfig', b'0', b'0', 'Promoterconfig');
INSERT INTO `menu` VALUES (71, '2019-11-13 18:32:00', b'0', '分销员', 'shop/user/aindex', 69, 72, 'user', 'agent', b'0', b'0', 'Agent');
INSERT INTO `menu` VALUES (72, '2019-11-14 10:49:39', b'0', '提现管理', 'activity/extract/index', 69, 73, 'tixian', 'extract', b'0', b'0', 'Extract');
INSERT INTO `menu` VALUES (73, '2019-11-18 14:23:04', b'0', '拼团产品', 'activity/combination/index', 63, 64, 'peoples', 'combination', b'0', b'0', 'Combination');
INSERT INTO `menu` VALUES (74, '2019-11-21 19:35:58', b'0', '拼团列表', 'activity/combinlist/index', 63, 65, 'list', 'pink', b'0', b'0', 'Pink');
INSERT INTO `menu` VALUES (75, '2019-11-28 17:06:22', b'0', '微信支付配置', 'wechat/config/pay', 48, 35, 'wxpay', 'wxpayconfig', b'0', b'0', 'Wxpayconfig');
INSERT INTO `menu` VALUES (76, '2019-11-29 15:13:46', b'0', '小程序配置', 'wechat/config/wxapp', 48, 36, 'configure', 'wxapp', b'0', b'0', 'Wxapp');
INSERT INTO `menu` VALUES (77, '2019-12-04 16:35:41', b'0', '会员等级', 'shop/userlevel/index', 46, 22, 'dengji', 'userlevel', b'0', b'0', 'Userlevel');
INSERT INTO `menu` VALUES (78, '2019-12-04 17:26:19', b'0', '等级任务', 'shop/usertask/index', 46, 23, 'task manege', 'usertask', b'0', b'0', 'Usertask');
INSERT INTO `menu` VALUES (79, '2019-12-05 14:12:16', b'0', '签到天数配置', 'shop/set/sign', 55, 57, 'sign2', 'signday', b'0', b'0', 'Signday');
INSERT INTO `menu` VALUES (80, '2019-12-11 17:28:38', b'0', '用户账单', 'shop/user/bill', 46, 24, 'list', 'bill', b'0', b'0', 'Bill');
INSERT INTO `menu` VALUES (81, '2019-12-12 16:36:00', b'0', '物流快递', 'shop/express/index', 53, 43, 'express', 'express', b'0', b'0', 'Express');
INSERT INTO `menu` VALUES (82, '2019-12-13 14:42:50', b'0', '微信模板消息', 'wechat/template/index', 48, 35, 'anq', 'template', b'0', b'0', 'Template');
INSERT INTO `menu` VALUES (83, '2019-12-16 13:06:29', b'0', '秒杀产品', 'activity/seckill/index', 63, 66, 'seckill', 'seckill', b'0', b'0', 'Seckill');
INSERT INTO `menu` VALUES (84, '2019-12-16 16:07:42', b'0', '秒杀配置', 'shop/set/seckill', 63, 67, 'configure', 'seckillconfig', b'0', b'0', 'Seckillconfig');
INSERT INTO `menu` VALUES (85, '2019-12-23 15:56:01', b'0', '砍价产品', 'activity/bargain/index', 63, 68, 'bargain', 'bargain', b'0', b'0', 'Bargain');
INSERT INTO `menu` VALUES (86, '2019-12-26 14:53:25', b'0', '浏览记录', 'monitor/log/mlog', 40, 13, 'log', 'viewlog', b'0', b'0', 'Viewlog');

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '别名',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `pid` int(11) NOT NULL COMMENT '上级权限',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 62 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES (1, '超级管理员', '2018-12-03 12:27:48', 'ADMIN', 0);
INSERT INTO `permission` VALUES (2, '用户管理', '2018-12-03 12:28:19', 'USER_ALL', 0);
INSERT INTO `permission` VALUES (3, '用户查询', '2018-12-03 12:31:35', 'USER_SELECT', 2);
INSERT INTO `permission` VALUES (4, '用户创建', '2018-12-03 12:31:35', 'USER_CREATE', 2);
INSERT INTO `permission` VALUES (5, '用户编辑', '2018-12-03 12:31:35', 'USER_EDIT', 2);
INSERT INTO `permission` VALUES (6, '用户删除', '2018-12-03 12:31:35', 'USER_DELETE', 2);
INSERT INTO `permission` VALUES (7, '角色管理', '2018-12-03 12:28:19', 'ROLES_ALL', 0);
INSERT INTO `permission` VALUES (8, '角色查询', '2018-12-03 12:31:35', 'ROLES_SELECT', 7);
INSERT INTO `permission` VALUES (10, '角色创建', '2018-12-09 20:10:16', 'ROLES_CREATE', 7);
INSERT INTO `permission` VALUES (11, '角色编辑', '2018-12-09 20:10:42', 'ROLES_EDIT', 7);
INSERT INTO `permission` VALUES (12, '角色删除', '2018-12-09 20:11:07', 'ROLES_DELETE', 7);
INSERT INTO `permission` VALUES (13, '权限管理', '2018-12-09 20:11:37', 'PERMISSION_ALL', 0);
INSERT INTO `permission` VALUES (14, '权限查询', '2018-12-09 20:11:55', 'PERMISSION_SELECT', 13);
INSERT INTO `permission` VALUES (15, '权限创建', '2018-12-09 20:14:10', 'PERMISSION_CREATE', 13);
INSERT INTO `permission` VALUES (16, '权限编辑', '2018-12-09 20:15:44', 'PERMISSION_EDIT', 13);
INSERT INTO `permission` VALUES (17, '权限删除', '2018-12-09 20:15:59', 'PERMISSION_DELETE', 13);
INSERT INTO `permission` VALUES (18, '缓存管理', '2018-12-17 13:53:25', 'REDIS_ALL', 0);
INSERT INTO `permission` VALUES (20, '缓存查询', '2018-12-17 13:54:07', 'REDIS_SELECT', 18);
INSERT INTO `permission` VALUES (22, '缓存删除', '2018-12-17 13:55:04', 'REDIS_DELETE', 18);
INSERT INTO `permission` VALUES (23, '图床管理', '2018-12-27 20:31:49', 'PICTURE_ALL', 0);
INSERT INTO `permission` VALUES (24, '查询图片', '2018-12-27 20:32:04', 'PICTURE_SELECT', 23);
INSERT INTO `permission` VALUES (25, '上传图片', '2018-12-27 20:32:24', 'PICTURE_UPLOAD', 23);
INSERT INTO `permission` VALUES (26, '删除图片', '2018-12-27 20:32:45', 'PICTURE_DELETE', 23);
INSERT INTO `permission` VALUES (29, '菜单管理', '2018-12-28 17:34:31', 'MENU_ALL', 0);
INSERT INTO `permission` VALUES (30, '菜单查询', '2018-12-28 17:34:41', 'MENU_SELECT', 29);
INSERT INTO `permission` VALUES (31, '菜单创建', '2018-12-28 17:34:52', 'MENU_CREATE', 29);
INSERT INTO `permission` VALUES (32, '菜单编辑', '2018-12-28 17:35:20', 'MENU_EDIT', 29);
INSERT INTO `permission` VALUES (33, '菜单删除', '2018-12-28 17:35:29', 'MENU_DELETE', 29);
INSERT INTO `permission` VALUES (35, '定时任务管理', '2019-01-08 14:59:57', 'JOB_ALL', 0);
INSERT INTO `permission` VALUES (36, '任务查询', '2019-01-08 15:00:09', 'JOB_SELECT', 35);
INSERT INTO `permission` VALUES (37, '任务创建', '2019-01-08 15:00:20', 'JOB_CREATE', 35);
INSERT INTO `permission` VALUES (38, '任务编辑', '2019-01-08 15:00:33', 'JOB_EDIT', 35);
INSERT INTO `permission` VALUES (39, '任务删除', '2019-01-08 15:01:13', 'JOB_DELETE', 35);
INSERT INTO `permission` VALUES (40, '部门管理', '2019-03-29 17:06:55', 'DEPT_ALL', 0);
INSERT INTO `permission` VALUES (41, '部门查询', '2019-03-29 17:07:09', 'DEPT_SELECT', 40);
INSERT INTO `permission` VALUES (42, '部门创建', '2019-03-29 17:07:29', 'DEPT_CREATE', 40);
INSERT INTO `permission` VALUES (43, '部门编辑', '2019-03-29 17:07:52', 'DEPT_EDIT', 40);
INSERT INTO `permission` VALUES (44, '部门删除', '2019-03-29 17:08:14', 'DEPT_DELETE', 40);
INSERT INTO `permission` VALUES (45, '岗位管理', '2019-03-29 17:08:52', 'USERJOB_ALL', 0);
INSERT INTO `permission` VALUES (46, '岗位查询', '2019-03-29 17:10:27', 'USERJOB_SELECT', 45);
INSERT INTO `permission` VALUES (47, '岗位创建', '2019-03-29 17:10:55', 'USERJOB_CREATE', 45);
INSERT INTO `permission` VALUES (48, '岗位编辑', '2019-03-29 17:11:08', 'USERJOB_EDIT', 45);
INSERT INTO `permission` VALUES (49, '岗位删除', '2019-03-29 17:11:19', 'USERJOB_DELETE', 45);
INSERT INTO `permission` VALUES (50, '字典管理', '2019-04-10 16:24:51', 'DICT_ALL', 0);
INSERT INTO `permission` VALUES (51, '字典查询', '2019-04-10 16:25:16', 'DICT_SELECT', 50);
INSERT INTO `permission` VALUES (52, '字典创建', '2019-04-10 16:25:29', 'DICT_CREATE', 50);
INSERT INTO `permission` VALUES (53, '字典编辑', '2019-04-10 16:27:19', 'DICT_EDIT', 50);
INSERT INTO `permission` VALUES (54, '字典删除', '2019-04-10 16:27:30', 'DICT_DELETE', 50);
INSERT INTO `permission` VALUES (55, '文件管理', '2019-09-08 12:31:54', 'LOCALSTORAGE_ALL', 0);
INSERT INTO `permission` VALUES (56, '文件搜索', '2019-09-08 12:40:53', 'LOCALSTORAGE_SELECT', 55);
INSERT INTO `permission` VALUES (57, '文件上传', '2019-09-08 12:41:05', 'LOCALSTORAGE_CREATE', 55);
INSERT INTO `permission` VALUES (58, '文件编辑', '2019-09-08 12:41:19', 'LOCALSTORAGE_EDIT', 55);
INSERT INTO `permission` VALUES (59, '文件删除', '2019-09-08 12:41:29', 'LOCALSTORAGE_DELETE', 55);
INSERT INTO `permission` VALUES (60, '商品分类管理', '2019-10-03 18:09:55', 'YXSTORECATEGORY_ALL', 0);
INSERT INTO `permission` VALUES (61, '查询', '2019-10-03 18:10:49', 'YXSTORECATEGORY_SELECT', 60);

-- ----------------------------
-- Table structure for picture
-- ----------------------------
DROP TABLE IF EXISTS `picture`;
CREATE TABLE `picture`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '上传日期',
  `delete_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '删除的URL',
  `filename` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片名称',
  `height` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片高度',
  `size` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片大小',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片地址',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名称',
  `width` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片宽度',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of picture
-- ----------------------------
INSERT INTO `picture` VALUES (1, '2019-10-04 15:40:28', 'https://sm.ms/delete/fawNE9deLIFijZCGvbm7OxpYXt', 'list_13.png', '202', '23.05KB   ', 'https://i.loli.net/2019/10/04/9CcInL3TWwmpaEb.png', 'admin', '202');
INSERT INTO `picture` VALUES (2, '2019-10-05 17:34:46', 'https://sm.ms/delete/bGNUexEnDYz4itZQM1qOPdoAas', '微信图片_20190408095429.jpg', '1080', '559.80KB   ', 'https://i.loli.net/2019/10/05/rYybEAOxDXCNJ32.jpg', 'admin', '1440');
INSERT INTO `picture` VALUES (3, '2019-10-05 17:36:13', 'https://sm.ms/delete/FRnaCmMputQeXJjlPfyZBhrKb6', 'banner.jpg', '300', '223.25KB   ', 'https://i.loli.net/2019/10/05/AhRdWVTtkQYuexD.jpg', 'admin', '1919');
INSERT INTO `picture` VALUES (4, '2019-10-05 17:38:02', 'https://sm.ms/delete/cGtPqZfRDXw1nCaAdy7EN5LHmY', '5c3dc286862fd.jpg', '978', '79.39KB   ', 'https://i.loli.net/2019/10/05/Q7row6U3IGlRiYx.jpg', 'admin', '1080');
INSERT INTO `picture` VALUES (5, '2019-10-06 10:17:31', 'https://sm.ms/delete/jG9KNL3BMCD4Z7Y61Qol85zvwO', 'qrcode_for_gh_be92ee602481_258.jpg', '258', '27.73KB   ', 'https://i.loli.net/2019/10/06/WLqkaib7GErQPvK.jpg', 'admin', '258');
INSERT INTO `picture` VALUES (6, '2019-10-06 11:25:10', 'https://sm.ms/delete/id56aHmcPxFfozMvyZSCbBJpg7', 'qrcode_for_gh_eefce3c49b0b_258.jpg', '258', '14.58KB   ', 'https://i.loli.net/2019/10/06/m127dvLEzowXMNq.jpg', 'admin', '258');
INSERT INTO `picture` VALUES (7, '2019-10-06 11:25:24', 'https://sm.ms/delete/8J9PjRn2IBGLdupCq4bUgFzhkY', 'qrcode_for_gh_eefce3c49b0b_344.jpg', '344', '8.15KB   ', 'https://i.loli.net/2019/10/06/M5eH4YOvQlpkhuR.jpg', 'admin', '344');
INSERT INTO `picture` VALUES (8, '2019-10-06 11:27:57', 'https://sm.ms/delete/BS7ITwsbiXfyRHdpqC69U8lMVu', 'list_13.png', '202', '23.05KB   ', 'https://i.loli.net/2019/10/06/YCV2jFuLagzxrKe.png', 'admin', '202');
INSERT INTO `picture` VALUES (9, '2019-10-06 11:31:29', 'https://sm.ms/delete/mBucZbTNjkrFwgGEa9l43vxCLJ', 'list_16.png', '202', '28.93KB   ', 'https://i.loli.net/2019/10/06/MSHXfGhjCqsivRt.png', 'admin', '202');
INSERT INTO `picture` VALUES (10, '2019-10-06 11:38:54', 'https://sm.ms/delete/rlN1RaJWbSuoCk5eDHnL4spv2c', 'list_20.png', '202', '22.92KB   ', 'https://i.loli.net/2019/10/06/MTs1cUKFVEOCnha.png', 'admin', '202');
INSERT INTO `picture` VALUES (11, '2019-10-06 11:40:20', 'https://sm.ms/delete/kpEqHcDtN24QieLxwS3zbgjylV', 'list_22.png', '202', '28.23KB   ', 'https://i.loli.net/2019/10/06/Vzp9YxlWiboKLIB.png', 'admin', '202');
INSERT INTO `picture` VALUES (12, '2019-10-06 11:40:33', 'https://sm.ms/delete/zYsxCfjeXQDKlgVtvTBqH3JNoE', 'list_28.png', '202', '28.38KB   ', 'https://i.loli.net/2019/10/06/Ip5CwqR63GyvkaS.png', 'admin', '202');
INSERT INTO `picture` VALUES (13, '2019-10-06 11:46:47', 'https://sm.ms/delete/uw7tiAykED49z3BLHFpMR5xhjC', 'list_32.png', '202', '27.65KB   ', 'https://i.loli.net/2019/10/06/VRKrw3gLMvXODYs.png', 'admin', '202');
INSERT INTO `picture` VALUES (14, '2019-10-06 11:48:03', 'https://sm.ms/delete/hSUExmFGn4jeLwZg6T87RVvNHA', 'list_34.png', '202', '27.05KB   ', 'https://i.loli.net/2019/10/06/V9HhpUYyc8wsKzu.png', 'admin', '202');
INSERT INTO `picture` VALUES (15, '2019-10-06 11:49:40', 'https://sm.ms/delete/Mkm8fyhHjF5PlSqKVAG7o92iuB', 'list_18.png', '202', '29.62KB   ', 'https://i.loli.net/2019/10/06/fvXwrj6abWZoVPx.png', 'admin', '202');
INSERT INTO `picture` VALUES (16, '2019-10-06 11:55:26', 'https://sm.ms/delete/vLZBc3OJR6eGHumXIf7UDlP9T8', 'list_30.png', '202', '28.57KB   ', 'https://i.loli.net/2019/10/06/ogK6lpxMaBqYz7Z.png', 'admin', '202');
INSERT INTO `picture` VALUES (17, '2019-10-08 16:39:04', 'https://sm.ms/delete/TVx7NRQSoJvD5uqaUiz3ZI9drH', '58de77bca268e_610.jpg', '610', '20.55KB   ', 'https://i.loli.net/2019/10/08/xjneQu9thPNDKLg.jpg', 'admin', '610');
INSERT INTO `picture` VALUES (18, '2019-10-08 16:43:46', 'https://sm.ms/delete/9b5fkcjr3D6A1IwpzUixO4agvS', '保健.png', '110', '9.65KB   ', 'https://i.loli.net/2019/10/08/CRnUIMgVQlk3eGL.png', 'admin', '110');
INSERT INTO `picture` VALUES (19, '2019-10-08 17:02:41', 'https://sm.ms/delete/lPx6kbus3Xh4NOeKrBHmtfpQY5', '家电.png', '110', '9.06KB   ', 'https://i.loli.net/2019/10/08/EgR73JrMevH9lfh.png', 'admin', '110');
INSERT INTO `picture` VALUES (20, '2019-10-13 10:30:41', 'https://sm.ms/delete/IWOwypnM6luPJQCzi4qhVKxLNX', 'qrcode_for_gh_eefce3c49b0b_258.jpg', '258', '14.58KB   ', 'https://i.loli.net/2019/10/13/XHalywZqEG5RtV7.jpg', 'admin', '258');
INSERT INTO `picture` VALUES (21, '2019-10-18 16:12:55', 'https://sm.ms/delete/xa3tfc6siHQZ1ChUnEq4GBzVvk', 'list_13.png', '202', '23.05KB   ', 'https://i.loli.net/2019/10/18/k8Nxwo3uIzWVqPC.png', 'admin', '202');
INSERT INTO `picture` VALUES (22, '2019-10-18 16:30:37', 'https://sm.ms/delete/I4DXzew85VYMOlToj1HBtUCKF9', 'list_24.png', '202', '27.31KB   ', 'https://i.loli.net/2019/10/18/7Yiu2xOAUW8aoyN.png', 'admin', '202');
INSERT INTO `picture` VALUES (23, '2019-10-18 16:33:26', 'https://sm.ms/delete/58dvMbQJRWXgjx1HamOYE7LB3f', 'list_18.png', '202', '29.62KB   ', 'https://i.loli.net/2019/10/18/K8iLklnhy5BuRHf.png', 'admin', '202');
INSERT INTO `picture` VALUES (24, '2019-10-18 16:41:43', 'https://sm.ms/delete/atrXBGhZ9M5CQkJ4VToYNSmE71', 'list_32.png', '202', '27.65KB   ', 'https://i.loli.net/2019/10/18/jPlWIZsAyHQXhF2.png', 'admin', '202');
INSERT INTO `picture` VALUES (25, '2019-10-18 17:27:18', 'https://sm.ms/delete/nLB7KkAxDawd1rPN5zs3T9v2CR', 'balance.png', '46', '1.97KB   ', 'https://i.loli.net/2019/10/18/PKdDzRmEefu8NaH.png', 'admin', '46');
INSERT INTO `picture` VALUES (26, '2019-10-18 17:40:35', 'https://sm.ms/delete/kNfW72GMDwdZsV5LBCz6jJ9cgp', 'dfh001.png', '110', '7.71KB   ', 'https://i.loli.net/2019/10/18/DqOUgNf7wjuFpPT.png', 'admin', '110');
INSERT INTO `picture` VALUES (27, '2019-10-23 15:38:29', 'https://sm.ms/delete/7mzFgWi19NQyMGv8aLPexdVCjt', '58de77bca268e_610.jpg', '610', '20.55KB   ', 'https://i.loli.net/2019/10/23/s4mqAkaWegQnbjr.jpg', 'admin', '610');
INSERT INTO `picture` VALUES (28, '2019-10-23 15:38:45', 'https://sm.ms/delete/EoL9qR2QsnKfWXNhGjmlaY5xpS', 'iphone.jpg', '220', '17.08KB   ', 'https://i.loli.net/2019/10/23/P3I5aSefpcHAsit.jpg', 'admin', '220');
INSERT INTO `picture` VALUES (29, '2019-10-26 19:02:00', 'https://sm.ms/delete/bzlshPBJaNEQ3gF4oAKwIfeqZX', 'memberCenter.png', '44', '886B   ', 'https://i.loli.net/2019/10/26/zSpIZ8BvKgoNR5b.png', 'admin', '36');

-- ----------------------------
-- Table structure for qiniu_config
-- ----------------------------
DROP TABLE IF EXISTS `qiniu_config`;
CREATE TABLE `qiniu_config`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `access_key` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'accessKey',
  `bucket` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Bucket 识别符',
  `host` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '外链域名',
  `secret_key` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'secretKey',
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '空间类型',
  `zone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '机房',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for qiniu_content
-- ----------------------------
DROP TABLE IF EXISTS `qiniu_content`;
CREATE TABLE `qiniu_content`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `bucket` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Bucket 识别符',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件名称',
  `size` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件大小',
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件类型：私有或公开',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '上传或同步的时间',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件url',
  `suffix` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of qiniu_content
-- ----------------------------
INSERT INTO `qiniu_content` VALUES (1, 'yixiang', '5ca01c7fc9238', '67.58KB   ', '公开', '2019-11-07 14:09:32', 'http://pic.dayouqiantu.cn/5ca01c7fc9238.jpg', 'jpg');
INSERT INTO `qiniu_content` VALUES (2, 'yixiang', '5ca01c7676042', '26.05KB   ', '公开', '2019-11-07 14:09:49', 'http://pic.dayouqiantu.cn/5ca01c7676042.jpg', 'jpg');
INSERT INTO `qiniu_content` VALUES (3, 'yixiang', '5ca01c7fc9238', '67.58KB   ', '公开', '2019-11-07 14:18:25', 'http://pic.dayouqiantu.cn/5ca01c7fc9238.jpg', 'jpg');
INSERT INTO `qiniu_content` VALUES (4, 'yixiang', '5ca01c7fc9238', '67.58KB   ', '公开', '2019-11-07 14:18:32', 'http://pic.dayouqiantu.cn/5ca01c7fc9238.jpg', 'jpg');
INSERT INTO `qiniu_content` VALUES (5, 'yixiang', '5ca01c7fc9238', '67.58KB   ', '公开', '2019-11-07 14:24:10', 'http://pic.dayouqiantu.cn/5ca01c7fc9238.jpg', 'jpg');
INSERT INTO `qiniu_content` VALUES (6, 'yixiang', '5ca01c7fc9238', '67.58KB   ', '公开', '2019-11-07 14:24:14', 'http://pic.dayouqiantu.cn/5ca01c7fc9238.jpg', 'jpg');
INSERT INTO `qiniu_content` VALUES (7, 'yixiang', '5ca01c7fc9238', '67.58KB   ', '公开', '2019-11-07 14:26:13', 'http://pic.dayouqiantu.cn/5ca01c7fc9238.jpg', 'jpg');
INSERT INTO `qiniu_content` VALUES (8, 'yixiang', '5ca01c7fc9238', '67.58KB   ', '公开', '2019-11-07 14:26:17', 'http://pic.dayouqiantu.cn/5ca01c7fc9238.jpg', 'jpg');

-- ----------------------------
-- Table structure for quartz_job
-- ----------------------------
DROP TABLE IF EXISTS `quartz_job`;
CREATE TABLE `quartz_job`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `bean_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Spring Bean名称',
  `cron_expression` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'cron 表达式',
  `is_pause` bit(1) NULL DEFAULT NULL COMMENT '状态：1暂停、0启用',
  `job_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务名称',
  `method_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '方法名称',
  `params` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参数',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '创建或更新日期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of quartz_job
-- ----------------------------
INSERT INTO `quartz_job` VALUES (1, 'visitsTask', '0 0 0 * * ?', b'0', '更新访客记录', 'run', NULL, '每日0点创建新的访客记录', '2019-01-08 14:53:31');
INSERT INTO `quartz_job` VALUES (2, 'testTask', '0/5 * * * * ?', b'1', '测试1', 'run1', 'test', '带参测试，多参使用json', '2019-08-22 14:08:29');
INSERT INTO `quartz_job` VALUES (3, 'testTask', '0/5 * * * * ?', b'1', '测试', 'run', '', '不带参测试', '2019-09-26 16:44:39');

-- ----------------------------
-- Table structure for quartz_log
-- ----------------------------
DROP TABLE IF EXISTS `quartz_log`;
CREATE TABLE `quartz_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `baen_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `cron_expression` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `exception_detail` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `is_success` bit(1) NULL DEFAULT NULL,
  `job_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `method_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `params` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `time` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of quartz_log
-- ----------------------------
INSERT INTO `quartz_log` VALUES (1, 'visitsTask', '2019-11-03 08:57:59', '0 0 0 * * ?', NULL, b'1', '更新访客记录', 'run', NULL, 542);

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `data_scope` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `level` int(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, '2018-11-23 11:04:37', '超级管理员', '·', '全部', 1);
INSERT INTO `role` VALUES (2, '2018-11-23 13:09:06', '普通用户', '用于测试菜单与权限', '自定义', 3);
INSERT INTO `role` VALUES (4, '2019-05-13 14:16:15', '普通管理员', '普通管理员级别为2，使用该角色新增用户时只能赋予比普通管理员级别低的角色', '自定义', 2);

-- ----------------------------
-- Table structure for roles_depts
-- ----------------------------
DROP TABLE IF EXISTS `roles_depts`;
CREATE TABLE `roles_depts`  (
  `role_id` bigint(20) NOT NULL,
  `dept_id` bigint(20) NOT NULL,
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE,
  INDEX `FK7qg6itn5ajdoa9h9o78v9ksur`(`dept_id`) USING BTREE,
  CONSTRAINT `FK7qg6itn5ajdoa9h9o78v9ksur` FOREIGN KEY (`dept_id`) REFERENCES `dept` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKrg1ci4cxxfbja0sb0pddju7k` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of roles_depts
-- ----------------------------
INSERT INTO `roles_depts` VALUES (2, 5);
INSERT INTO `roles_depts` VALUES (4, 6);
INSERT INTO `roles_depts` VALUES (4, 7);
INSERT INTO `roles_depts` VALUES (2, 8);
INSERT INTO `roles_depts` VALUES (2, 9);

-- ----------------------------
-- Table structure for roles_menus
-- ----------------------------
DROP TABLE IF EXISTS `roles_menus`;
CREATE TABLE `roles_menus`  (
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`menu_id`, `role_id`) USING BTREE,
  INDEX `FKcngg2qadojhi3a651a5adkvbq`(`role_id`) USING BTREE,
  CONSTRAINT `FKo7wsmlrrxb2osfaoavp46rv2r` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKtag324maketmxffly3pdyh193` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of roles_menus
-- ----------------------------
INSERT INTO `roles_menus` VALUES (1, 1);
INSERT INTO `roles_menus` VALUES (2, 1);
INSERT INTO `roles_menus` VALUES (3, 1);
INSERT INTO `roles_menus` VALUES (4, 1);
INSERT INTO `roles_menus` VALUES (5, 1);
INSERT INTO `roles_menus` VALUES (6, 1);
INSERT INTO `roles_menus` VALUES (7, 1);
INSERT INTO `roles_menus` VALUES (8, 1);
INSERT INTO `roles_menus` VALUES (9, 1);
INSERT INTO `roles_menus` VALUES (14, 1);
INSERT INTO `roles_menus` VALUES (16, 1);
INSERT INTO `roles_menus` VALUES (18, 1);
INSERT INTO `roles_menus` VALUES (19, 1);
INSERT INTO `roles_menus` VALUES (28, 1);
INSERT INTO `roles_menus` VALUES (30, 1);
INSERT INTO `roles_menus` VALUES (32, 1);
INSERT INTO `roles_menus` VALUES (35, 1);
INSERT INTO `roles_menus` VALUES (36, 1);
INSERT INTO `roles_menus` VALUES (37, 1);
INSERT INTO `roles_menus` VALUES (39, 1);
INSERT INTO `roles_menus` VALUES (40, 1);
INSERT INTO `roles_menus` VALUES (41, 1);
INSERT INTO `roles_menus` VALUES (45, 1);
INSERT INTO `roles_menus` VALUES (46, 1);
INSERT INTO `roles_menus` VALUES (47, 1);
INSERT INTO `roles_menus` VALUES (48, 1);
INSERT INTO `roles_menus` VALUES (49, 1);
INSERT INTO `roles_menus` VALUES (50, 1);
INSERT INTO `roles_menus` VALUES (51, 1);
INSERT INTO `roles_menus` VALUES (52, 1);
INSERT INTO `roles_menus` VALUES (53, 1);
INSERT INTO `roles_menus` VALUES (54, 1);
INSERT INTO `roles_menus` VALUES (55, 1);
INSERT INTO `roles_menus` VALUES (56, 1);
INSERT INTO `roles_menus` VALUES (57, 1);
INSERT INTO `roles_menus` VALUES (59, 1);
INSERT INTO `roles_menus` VALUES (60, 1);
INSERT INTO `roles_menus` VALUES (61, 1);
INSERT INTO `roles_menus` VALUES (62, 1);
INSERT INTO `roles_menus` VALUES (63, 1);
INSERT INTO `roles_menus` VALUES (64, 1);
INSERT INTO `roles_menus` VALUES (65, 1);
INSERT INTO `roles_menus` VALUES (66, 1);
INSERT INTO `roles_menus` VALUES (67, 1);
INSERT INTO `roles_menus` VALUES (68, 1);
INSERT INTO `roles_menus` VALUES (69, 1);
INSERT INTO `roles_menus` VALUES (70, 1);
INSERT INTO `roles_menus` VALUES (71, 1);
INSERT INTO `roles_menus` VALUES (72, 1);
INSERT INTO `roles_menus` VALUES (73, 1);
INSERT INTO `roles_menus` VALUES (74, 1);
INSERT INTO `roles_menus` VALUES (75, 1);
INSERT INTO `roles_menus` VALUES (76, 1);
INSERT INTO `roles_menus` VALUES (77, 1);
INSERT INTO `roles_menus` VALUES (78, 1);
INSERT INTO `roles_menus` VALUES (79, 1);
INSERT INTO `roles_menus` VALUES (80, 1);
INSERT INTO `roles_menus` VALUES (81, 1);
INSERT INTO `roles_menus` VALUES (82, 1);
INSERT INTO `roles_menus` VALUES (83, 1);
INSERT INTO `roles_menus` VALUES (84, 1);
INSERT INTO `roles_menus` VALUES (85, 1);
INSERT INTO `roles_menus` VALUES (86, 1);
INSERT INTO `roles_menus` VALUES (1, 2);
INSERT INTO `roles_menus` VALUES (2, 2);
INSERT INTO `roles_menus` VALUES (3, 2);
INSERT INTO `roles_menus` VALUES (4, 2);
INSERT INTO `roles_menus` VALUES (5, 2);
INSERT INTO `roles_menus` VALUES (6, 2);
INSERT INTO `roles_menus` VALUES (8, 2);
INSERT INTO `roles_menus` VALUES (9, 2);
INSERT INTO `roles_menus` VALUES (14, 2);
INSERT INTO `roles_menus` VALUES (16, 2);
INSERT INTO `roles_menus` VALUES (18, 2);
INSERT INTO `roles_menus` VALUES (19, 2);
INSERT INTO `roles_menus` VALUES (28, 2);
INSERT INTO `roles_menus` VALUES (30, 2);
INSERT INTO `roles_menus` VALUES (35, 2);
INSERT INTO `roles_menus` VALUES (36, 2);
INSERT INTO `roles_menus` VALUES (37, 2);
INSERT INTO `roles_menus` VALUES (39, 2);
INSERT INTO `roles_menus` VALUES (1, 4);
INSERT INTO `roles_menus` VALUES (2, 4);

-- ----------------------------
-- Table structure for roles_permissions
-- ----------------------------
DROP TABLE IF EXISTS `roles_permissions`;
CREATE TABLE `roles_permissions`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `permission_id` bigint(20) NOT NULL COMMENT '权限ID',
  PRIMARY KEY (`role_id`, `permission_id`) USING BTREE,
  INDEX `FKboeuhl31go7wer3bpy6so7exi`(`permission_id`) USING BTREE,
  CONSTRAINT `FK4hrolwj4ned5i7qe8kyiaak6m` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKboeuhl31go7wer3bpy6so7exi` FOREIGN KEY (`permission_id`) REFERENCES `permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of roles_permissions
-- ----------------------------
INSERT INTO `roles_permissions` VALUES (1, 1);
INSERT INTO `roles_permissions` VALUES (2, 3);
INSERT INTO `roles_permissions` VALUES (4, 3);
INSERT INTO `roles_permissions` VALUES (4, 4);
INSERT INTO `roles_permissions` VALUES (4, 5);
INSERT INTO `roles_permissions` VALUES (2, 8);
INSERT INTO `roles_permissions` VALUES (2, 14);
INSERT INTO `roles_permissions` VALUES (2, 20);
INSERT INTO `roles_permissions` VALUES (2, 23);
INSERT INTO `roles_permissions` VALUES (2, 24);
INSERT INTO `roles_permissions` VALUES (2, 25);
INSERT INTO `roles_permissions` VALUES (2, 26);
INSERT INTO `roles_permissions` VALUES (2, 30);
INSERT INTO `roles_permissions` VALUES (2, 36);
INSERT INTO `roles_permissions` VALUES (2, 41);
INSERT INTO `roles_permissions` VALUES (2, 46);
INSERT INTO `roles_permissions` VALUES (2, 51);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `avatar_id` bigint(20) NULL DEFAULT NULL COMMENT '头像',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `enabled` bigint(20) NULL DEFAULT NULL COMMENT '状态：1启用、0禁用',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `last_password_reset_time` datetime(0) NULL DEFAULT NULL COMMENT '最后修改密码的日期',
  `dept_id` bigint(20) NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `job_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UK_kpubos9gc2cvtkb0thktkbkes`(`email`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE,
  INDEX `FK5rwmryny6jthaaxkogownknqp`(`dept_id`) USING BTREE,
  INDEX `FKfftoc2abhot8f2wu6cl9a5iky`(`job_id`) USING BTREE,
  INDEX `FKpq2dhypk2qgt68nauh2by22jb`(`avatar_id`) USING BTREE,
  CONSTRAINT `FK5rwmryny6jthaaxkogownknqp` FOREIGN KEY (`dept_id`) REFERENCES `dept` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKfftoc2abhot8f2wu6cl9a5iky` FOREIGN KEY (`job_id`) REFERENCES `job` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKpq2dhypk2qgt68nauh2by22jb` FOREIGN KEY (`avatar_id`) REFERENCES `user_avatar` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, NULL, '2018-08-23 09:11:56', 'admin@eladmin.net', 1, 'e10adc3949ba59abbe56e057f20f883e', 'admin', '2019-05-18 17:34:21', 2, '18888888888', 11);
INSERT INTO `user` VALUES (3, NULL, '2018-12-27 20:05:26', 'test@eladmin.net', 1, 'e10adc3949ba59abbe56e057f20f883e', 'test', '2019-04-01 09:15:24', 2, '17777777777', 12);
INSERT INTO `user` VALUES (5, NULL, '2019-04-02 10:07:12', 'hr@eladmin.net', 1, 'e10adc3949ba59abbe56e057f20f883e', 'hr', NULL, 11, '15555555555', 8);
INSERT INTO `user` VALUES (6, NULL, '2019-11-07 17:15:58', '610796224@qq.com', 1, 'e10adc3949ba59abbe56e057f20f883e', 'yshop', NULL, 2, '13888888888', 10);

-- ----------------------------
-- Table structure for user_avatar
-- ----------------------------
DROP TABLE IF EXISTS `user_avatar`;
CREATE TABLE `user_avatar`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `real_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `size` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for users_roles
-- ----------------------------
DROP TABLE IF EXISTS `users_roles`;
CREATE TABLE `users_roles`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE,
  INDEX `FKq4eq273l04bpu4efj0jd0jb98`(`role_id`) USING BTREE,
  CONSTRAINT `FKgd3iendaoyh04b95ykqise6qh` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKt4v0rrweyk393bdgt107vdx0x` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of users_roles
-- ----------------------------
INSERT INTO `users_roles` VALUES (1, 1);
INSERT INTO `users_roles` VALUES (6, 1);
INSERT INTO `users_roles` VALUES (3, 2);
INSERT INTO `users_roles` VALUES (5, 4);

-- ----------------------------
-- Table structure for verification_code
-- ----------------------------
DROP TABLE IF EXISTS `verification_code`;
CREATE TABLE `verification_code`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '验证码',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `status` bit(1) NULL DEFAULT NULL COMMENT '状态：1有效、0过期',
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '验证码类型：email或者短信',
  `value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '接收邮箱或者手机号码',
  `scenes` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '业务名称：如重置邮箱、重置密码等',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for visits
-- ----------------------------
DROP TABLE IF EXISTS `visits`;
CREATE TABLE `visits`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `date` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ip_counts` bigint(20) NULL DEFAULT NULL,
  `pv_counts` bigint(20) NULL DEFAULT NULL,
  `week_day` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UK_11aksgq87euk9bcyeesfs4vtp`(`date`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 180 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of visits
-- ----------------------------
INSERT INTO `visits` VALUES (96, '2019-10-01 15:21:03', '2019-10-01', 1, 2, 'Tue');
INSERT INTO `visits` VALUES (97, '2019-10-03 17:01:47', '2019-10-03', 1, 7, 'Thu');
INSERT INTO `visits` VALUES (98, '2019-10-04 09:19:38', '2019-10-04', 1, 3, 'Fri');
INSERT INTO `visits` VALUES (99, '2019-10-05 12:52:59', '2019-10-05', 1, 1, 'Sat');
INSERT INTO `visits` VALUES (100, '2019-10-06 10:09:04', '2019-10-06', 1, 2, 'Sun');
INSERT INTO `visits` VALUES (101, '2019-10-07 10:08:29', '2019-10-07', 1, 2, 'Mon');
INSERT INTO `visits` VALUES (102, '2019-10-08 16:15:24', '2019-10-08', 1, 3, 'Tue');
INSERT INTO `visits` VALUES (103, '2019-10-10 09:49:02', '2019-10-10', 1, 2, 'Thu');
INSERT INTO `visits` VALUES (104, '2019-10-11 12:53:01', '2019-10-11', 1, 2, 'Fri');
INSERT INTO `visits` VALUES (105, '2019-10-12 09:53:21', '2019-10-12', 1, 2, 'Sat');
INSERT INTO `visits` VALUES (106, '2019-10-13 09:07:42', '2019-10-13', 1, 4, 'Sun');
INSERT INTO `visits` VALUES (107, '2019-10-14 10:18:02', '2019-10-14', 1, 2, 'Mon');
INSERT INTO `visits` VALUES (108, '2019-10-16 11:35:09', '2019-10-16', 1, 2, 'Wed');
INSERT INTO `visits` VALUES (109, '2019-10-17 09:39:26', '2019-10-17', 1, 1, 'Thu');
INSERT INTO `visits` VALUES (110, '2019-10-18 15:01:58', '2019-10-18', 1, 2, 'Fri');
INSERT INTO `visits` VALUES (111, '2019-10-19 09:14:27', '2019-10-19', 1, 1, 'Sat');
INSERT INTO `visits` VALUES (112, '2019-10-21 16:11:34', '2019-10-21', 1, 2, 'Mon');
INSERT INTO `visits` VALUES (113, '2019-10-22 11:17:28', '2019-10-22', 1, 1, 'Tue');
INSERT INTO `visits` VALUES (114, '2019-10-23 12:41:18', '2019-10-23', 1, 3, 'Wed');
INSERT INTO `visits` VALUES (115, '2019-10-24 15:51:20', '2019-10-24', 1, 2, 'Thu');
INSERT INTO `visits` VALUES (116, '2019-10-25 13:40:40', '2019-10-25', 1, 1, 'Fri');
INSERT INTO `visits` VALUES (117, '2019-10-26 12:03:50', '2019-10-26', 1, 3, 'Sat');
INSERT INTO `visits` VALUES (118, '2019-10-27 09:57:13', '2019-10-27', 1, 1, 'Sun');
INSERT INTO `visits` VALUES (119, '2019-10-28 10:02:20', '2019-10-28', 1, 1, 'Mon');
INSERT INTO `visits` VALUES (120, '2019-10-29 15:55:06', '2019-10-29', 1, 1, 'Tue');
INSERT INTO `visits` VALUES (121, '2019-10-30 11:23:39', '2019-10-30', 1, 1, 'Wed');
INSERT INTO `visits` VALUES (122, '2019-10-31 09:54:30', '2019-10-31', 1, 7, 'Thu');
INSERT INTO `visits` VALUES (123, '2019-11-01 10:27:42', '2019-11-01', 1, 4, 'Fri');
INSERT INTO `visits` VALUES (124, '2019-11-02 11:23:29', '2019-11-02', 1, 2, 'Sat');
INSERT INTO `visits` VALUES (125, '2019-11-03 08:57:58', '2019-11-03', 1, 2, 'Sun');
INSERT INTO `visits` VALUES (126, '2019-11-04 10:01:11', '2019-11-04', 1, 1, 'Mon');
INSERT INTO `visits` VALUES (127, '2019-11-05 10:18:04', '2019-11-05', 1, 1, 'Tue');
INSERT INTO `visits` VALUES (128, '2019-11-06 10:09:22', '2019-11-06', 1, 8, 'Wed');
INSERT INTO `visits` VALUES (129, '2019-11-07 10:05:00', '2019-11-07', 2, 8, 'Thu');
INSERT INTO `visits` VALUES (130, '2019-11-08 16:56:45', '2019-11-08', 1, 2, 'Fri');
INSERT INTO `visits` VALUES (131, '2019-11-09 13:58:52', '2019-11-09', 1, 3, 'Sat');
INSERT INTO `visits` VALUES (132, '2019-11-10 10:08:05', '2019-11-10', 1, 4, 'Sun');
INSERT INTO `visits` VALUES (133, '2019-11-11 10:36:42', '2019-11-11', 1, 3, 'Mon');
INSERT INTO `visits` VALUES (134, '2019-11-12 10:34:13', '2019-11-12', 1, 1, 'Tue');
INSERT INTO `visits` VALUES (135, '2019-11-13 10:26:32', '2019-11-13', 1, 2, 'Wed');
INSERT INTO `visits` VALUES (136, '2019-11-14 09:47:16', '2019-11-14', 1, 3, 'Thu');
INSERT INTO `visits` VALUES (137, '2019-11-15 09:56:30', '2019-11-15', 0, 2, 'Fri');
INSERT INTO `visits` VALUES (138, '2019-11-16 03:36:01', '2019-11-16', 1, 3, 'Sat');
INSERT INTO `visits` VALUES (139, '2019-11-17 10:33:03', '2019-11-17', 1, 1, 'Sun');
INSERT INTO `visits` VALUES (140, '2019-11-18 09:09:02', '2019-11-18', 1, 5, 'Mon');
INSERT INTO `visits` VALUES (141, '2019-11-19 10:24:21', '2019-11-19', 1, 2, 'Tue');
INSERT INTO `visits` VALUES (142, '2019-11-20 09:05:13', '2019-11-20', 1, 1, 'Wed');
INSERT INTO `visits` VALUES (143, '2019-11-21 10:35:08', '2019-11-21', 1, 3, 'Thu');
INSERT INTO `visits` VALUES (144, '2019-11-22 17:56:04', '2019-11-22', 1, 2, 'Fri');
INSERT INTO `visits` VALUES (145, '2019-11-23 19:53:01', '2019-11-23', 1, 1, 'Sat');
INSERT INTO `visits` VALUES (146, '2019-11-24 13:59:44', '2019-11-24', 1, 4, 'Sun');
INSERT INTO `visits` VALUES (147, '2019-11-25 16:44:39', '2019-11-25', 1, 2, 'Mon');
INSERT INTO `visits` VALUES (148, '2019-11-26 09:57:20', '2019-11-26', 1, 1, 'Tue');
INSERT INTO `visits` VALUES (149, '2019-11-27 12:29:21', '2019-11-27', 1, 31, 'Wed');
INSERT INTO `visits` VALUES (150, '2019-11-28 10:34:08', '2019-11-28', 1, 4, 'Thu');
INSERT INTO `visits` VALUES (151, '2019-11-29 10:30:17', '2019-11-29', 1, 5, 'Fri');
INSERT INTO `visits` VALUES (152, '2019-11-30 10:07:25', '2019-11-30', 1, 1, 'Sat');
INSERT INTO `visits` VALUES (153, '2019-12-04 10:27:07', '2019-12-04', 1, 3, 'Wed');
INSERT INTO `visits` VALUES (154, '2019-12-05 14:04:33', '2019-12-05', 1, 3, 'Thu');
INSERT INTO `visits` VALUES (155, '2019-12-06 20:07:01', '2019-12-06', 1, 1, 'Fri');
INSERT INTO `visits` VALUES (156, '2019-12-07 09:45:53', '2019-12-07', 1, 1, 'Sat');
INSERT INTO `visits` VALUES (157, '2019-12-08 09:31:19', '2019-12-08', 1, 4, 'Sun');
INSERT INTO `visits` VALUES (158, '2019-12-09 09:37:28', '2019-12-09', 1, 3, 'Mon');
INSERT INTO `visits` VALUES (159, '2019-12-10 19:39:46', '2019-12-10', 1, 1, 'Tue');
INSERT INTO `visits` VALUES (160, '2019-12-11 11:11:35', '2019-12-11', 1, 52, 'Wed');
INSERT INTO `visits` VALUES (161, '2019-12-12 13:33:10', '2019-12-12', 1, 2, 'Thu');
INSERT INTO `visits` VALUES (162, '2019-12-13 14:17:04', '2019-12-13', 1, 6, 'Fri');
INSERT INTO `visits` VALUES (163, '2019-12-14 09:17:31', '2019-12-14', 1, 2, 'Sat');
INSERT INTO `visits` VALUES (164, '2019-12-15 20:23:23', '2019-12-15', 1, 1, 'Sun');
INSERT INTO `visits` VALUES (165, '2019-12-16 10:44:59', '2019-12-16', 1, 5, 'Mon');
INSERT INTO `visits` VALUES (166, '2019-12-17 09:34:14', '2019-12-17', 1, 2, 'Tue');
INSERT INTO `visits` VALUES (167, '2019-12-19 15:20:25', '2019-12-19', 1, 1, 'Thu');
INSERT INTO `visits` VALUES (168, '2019-12-21 09:49:05', '2019-12-21', 1, 1, 'Sat');
INSERT INTO `visits` VALUES (169, '2019-12-22 16:17:10', '2019-12-22', 1, 1, 'Sun');
INSERT INTO `visits` VALUES (170, '2019-12-23 14:27:20', '2019-12-23', 1, 5, 'Mon');
INSERT INTO `visits` VALUES (171, '2019-12-24 11:30:02', '2019-12-24', 1, 1, 'Tue');
INSERT INTO `visits` VALUES (172, '2019-12-26 13:48:29', '2019-12-26', 1, 4, 'Thu');
INSERT INTO `visits` VALUES (173, '2019-12-27 18:11:21', '2019-12-27', 1, 1, 'Fri');
INSERT INTO `visits` VALUES (174, '2019-12-28 22:17:35', '2019-12-28', 1, 2, 'Sat');
INSERT INTO `visits` VALUES (175, '2019-12-29 09:47:32', '2019-12-29', 1, 3, 'Sun');
INSERT INTO `visits` VALUES (176, '2019-12-30 12:08:53', '2019-12-30', 1, 1, 'Mon');
INSERT INTO `visits` VALUES (177, '2019-12-31 11:12:46', '2019-12-31', 1, 2, 'Tue');
INSERT INTO `visits` VALUES (178, '2020-01-01 10:54:06', '2020-01-01', 1, 1, 'Wed');
INSERT INTO `visits` VALUES (179, '2020-01-02 10:21:04', '2020-01-02', 1, 1, 'Thu');

-- ----------------------------
-- Table structure for yx_article
-- ----------------------------
DROP TABLE IF EXISTS `yx_article`;
CREATE TABLE `yx_article`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '文章管理ID',
  `cid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '分类id',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文章标题',
  `author` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文章作者',
  `image_input` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文章图片',
  `synopsis` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文章简介',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `share_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文章分享标题',
  `share_synopsis` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文章分享简介',
  `visit` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '浏览次数',
  `sort` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '排序',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '原文链接',
  `status` tinyint(1) UNSIGNED NULL DEFAULT NULL COMMENT '状态',
  `add_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '添加时间',
  `hide` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '是否隐藏',
  `admin_id` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '管理员id',
  `mer_id` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '商户id',
  `product_id` int(10) NULL DEFAULT 0 COMMENT '产品关联id',
  `is_hot` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '是否热门(小程序)',
  `is_banner` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '是否轮播图(小程序)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '文章管理表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of yx_article
-- ----------------------------
INSERT INTO `yx_article` VALUES (1, '', '333', '333', 'https://i.loli.net/2019/10/08/CRnUIMgVQlk3eGL.png', '33333', NULL, '', '', '5', NULL, '', NULL, '2019-08-22 12:26', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `yx_article` VALUES (2, '', 'yshop1.3版本上线了', 'yshop', 'https://i.loli.net/2019/10/08/EgR73JrMevH9lfh.png', 'yshop1.3版本上线了', '<h3 data-v-01881cfc=\"\" style=\"text-align: center;\"><p>yshop1.3版本上线了</p></h3>', '', '', '3', NULL, '', NULL, '2019-08-22 12:26', NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for yx_article_category
-- ----------------------------
DROP TABLE IF EXISTS `yx_article_category`;
CREATE TABLE `yx_article_category`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '文章分类id',
  `pid` int(11) NOT NULL DEFAULT 0 COMMENT '父级ID',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文章分类标题',
  `intr` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文章分类简介',
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文章分类图片',
  `status` tinyint(1) UNSIGNED NOT NULL COMMENT '状态',
  `sort` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序',
  `is_del` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '1删除0未删除',
  `add_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '添加时间',
  `hidden` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否隐藏',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '文章分类表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for yx_article_content
-- ----------------------------
DROP TABLE IF EXISTS `yx_article_content`;
CREATE TABLE `yx_article_content`  (
  `nid` int(10) UNSIGNED NOT NULL COMMENT '文章id',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文章内容',
  UNIQUE INDEX `nid`(`nid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '文章内容表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for yx_cache
-- ----------------------------
DROP TABLE IF EXISTS `yx_cache`;
CREATE TABLE `yx_cache`  (
  `key` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `result` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '缓存数据',
  `add_time` int(10) NULL DEFAULT NULL COMMENT '缓存时间',
  PRIMARY KEY (`key`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '微信缓存表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of yx_cache
-- ----------------------------
INSERT INTO `yx_cache` VALUES ('wechat_menus', '[{\"subButtons\":[{\"name\":\"公众号演示\",\"type\":\"view\",\"url\":\"https://h5.dayouqiantu.cn\"}],\"name\":\"Yshop商城3\",\"type\":\"click\",\"key\":\"yshop\"},{\"subButtons\":[{\"appId\":\"wxa82b5b7fcb0ec161\",\"name\":\"小程序演示\",\"pagePath\":\"pages/index\",\"type\":\"miniprogram\",\"url\":\"pages/index\"}],\"name\":\"供货商城\",\"type\":\"click\",\"key\":\"supply\"}]', 1570435277);

-- ----------------------------
-- Table structure for yx_express
-- ----------------------------
DROP TABLE IF EXISTS `yx_express`;
CREATE TABLE `yx_express`  (
  `id` mediumint(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '快递公司id',
  `code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '快递公司简称',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '快递公司全称',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '排序',
  `is_show` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否显示',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `code`(`code`) USING BTREE,
  INDEX `is_show`(`is_show`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 430 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '快递公司表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of yx_express
-- ----------------------------
INSERT INTO `yx_express` VALUES (426, 'STO', '申通快递', 0, 0);
INSERT INTO `yx_express` VALUES (427, 'SF', '顺丰速运', 0, 0);
INSERT INTO `yx_express` VALUES (428, 'ZTO', '中通快递', 0, 0);
INSERT INTO `yx_express` VALUES (429, 'YTO', '圆通速递', 0, 0);

-- ----------------------------
-- Table structure for yx_routine_access_token
-- ----------------------------
DROP TABLE IF EXISTS `yx_routine_access_token`;
CREATE TABLE `yx_routine_access_token`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '小程序access_token表ID',
  `access_token` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'openid',
  `stop_time` int(11) UNSIGNED NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '小程序access_token表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of yx_routine_access_token
-- ----------------------------
INSERT INTO `yx_routine_access_token` VALUES (1, '20_z3MAutcbznCSyQPqMVOQVRUktcvLYUXAAICpCMXkpu5rLoVnBB0u88rnJr1sWDJlwj-S6aVhmswmLdW86e9Bg2ugd3BOayE6ntY6FfckSXWgvW2y5N0bLkBxHpCjJH2bQpuvnmMIZr08G32hWSQfACAZVT', 1554809658);

-- ----------------------------
-- Table structure for yx_routine_form_id
-- ----------------------------
DROP TABLE IF EXISTS `yx_routine_form_id`;
CREATE TABLE `yx_routine_form_id`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '表单ID表ID',
  `uid` int(11) NULL DEFAULT 0 COMMENT '用户uid',
  `form_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '表单ID',
  `stop_time` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '表单ID失效时间',
  `status` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '状态1 未使用 2不能使用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '表单id表记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for yx_routine_qrcode
-- ----------------------------
DROP TABLE IF EXISTS `yx_routine_qrcode`;
CREATE TABLE `yx_routine_qrcode`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '微信二维码ID',
  `third_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '二维码类型 spread(用户推广) product_spread(产品推广)',
  `third_id` int(11) UNSIGNED NOT NULL COMMENT '用户id',
  `status` tinyint(1) UNSIGNED NULL DEFAULT 1 COMMENT '状态 0不可用 1可用',
  `add_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '添加时间',
  `page` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '小程序页面路径带参数',
  `qrcode_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '小程序二维码路径',
  `url_time` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '二维码添加时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '小程序二维码管理表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for yx_routine_template
-- ----------------------------
DROP TABLE IF EXISTS `yx_routine_template`;
CREATE TABLE `yx_routine_template`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '模板id',
  `tempkey` char(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '模板编号',
  `name` char(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '模板名',
  `content` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '回复内容',
  `tempid` char(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '模板ID',
  `add_time` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '添加时间',
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `tempkey`(`tempkey`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '微信模板' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of yx_routine_template
-- ----------------------------
INSERT INTO `yx_routine_template` VALUES (13, 'AT0007', '订单发货提醒', '订单号{{keyword1.DATA}}\n快递公司{{keyword2.DATA}}\n快递单号{{keyword3.DATA}}\n发货时间{{keyword4.DATA}}\n备注{{keyword5.DATA}}', 'fLsTVQmI2AE9q48BL58tffLRcyCnPLC9guSFrEHXbR8', '1534469928', 1);
INSERT INTO `yx_routine_template` VALUES (14, 'AT0787', '退款成功通知', '订单号{{keyword1.DATA}}\n退款时间{{keyword2.DATA}}\n退款金额{{keyword3.DATA}}\n退款方式{{keyword4.DATA}}\n备注{{keyword5.DATA}}', 'vgTj1nk1A1bVObCX0Fw3h9WbXvay1URcHMITjGW13cc', '1534469993', 1);
INSERT INTO `yx_routine_template` VALUES (15, 'AT0009', '订单支付成功通知', '单号{{keyword1.DATA}}\n下单时间{{keyword2.DATA}}\n订单状态{{keyword3.DATA}}\n支付金额{{keyword4.DATA}}\n支付方式{{keyword5.DATA}}', 'Rwt2QIz3zHbQGPXCH3E8nBneWzgFFBMiMI6EShTBLpI', '1534470043', 1);
INSERT INTO `yx_routine_template` VALUES (16, 'AT1173', '砍价成功通知', '商品名称{{keyword1.DATA}}\n砍价金额{{keyword2.DATA}}\n底价{{keyword3.DATA}}\n砍掉价格{{keyword4.DATA}}\n支付金额{{keyword5.DATA}}\n备注{{keyword6.DATA}}', 'qu3nRoV9lTmmvVWOdgf-2uz8NPT3w71cOx7UDJ5Uryo', '1534470085', 1);
INSERT INTO `yx_routine_template` VALUES (17, 'AT0036', '退款通知', '订单编号{{keyword1.DATA}}\n退款原因{{keyword2.DATA}}\n退款时间{{keyword3.DATA}}\n退款金额{{keyword4.DATA}}\n退款方式{{keyword5.DATA}}', 'gYYXx5nz8eWHPd_zp42EdR9UzhdynOo8Eq5GDb4dTrc', '1534470134', 1);
INSERT INTO `yx_routine_template` VALUES (19, 'AT2430', '拼团取消通知', '活动名称{{keyword1.DATA}}\n订单编号{{keyword2.DATA}}\n订单金额{{keyword3.DATA}}', 'OmzyMqsWJFn3L68DmEcZqV9FdSHrr2ThHYe6Czs8iaM', '1553910500', 1);
INSERT INTO `yx_routine_template` VALUES (20, 'AT0310', '拼团失败通知', '商品名称{{keyword1.DATA}}\n失败原因{{keyword2.DATA}}\n订单号{{keyword3.DATA}}\n开团时间{{keyword4.DATA}}\n退款金额{{keyword5.DATA}}', 'GRpTaZ1-tHoLvrfM-iEsBBbVSIXgh7bO17b7Z2AUpKM', '1553910844', 1);
INSERT INTO `yx_routine_template` VALUES (21, 'AT0051', '拼团成功通知', '活动名称{{keyword1.DATA}}\n团长{{keyword2.DATA}}\n成团时间{{keyword3.DATA}}\n拼团价{{keyword4.DATA}}', 'dlYqzgGLrVgRq-Ealw31wCy5PV-rGof-99OppSZhWxY', '1553911022', 1);
INSERT INTO `yx_routine_template` VALUES (22, 'AT0541', '开团成功提醒', '开团时间{{keyword1.DATA}}\n截至时间{{keyword2.DATA}}\n产品名称{{keyword3.DATA}}\n单号{{keyword4.DATA}}\n支付金额{{keyword5.DATA}}', 'E2NURfqs4MnciPB1YzvjtMDZCMfCCOHOwCdKFl7XigU', '1555133496', 1);
INSERT INTO `yx_routine_template` VALUES (23, 'AT0241', '确认收货通知', '订单编号{{keyword1.DATA}}\n商品详情{{keyword2.DATA}}\n支付金额{{keyword3.DATA}}\n确认收货时间{{keyword4.DATA}}', '4-DQPQMVsJfHjiKhEACz0ofcs_PHupy3xHTX1N1tzTo', '1557384781', 1);
INSERT INTO `yx_routine_template` VALUES (24, 'AT0329', '退款失败通知', '订单号{{keyword1.DATA}}\n商品名称{{keyword2.DATA}}\n退款金额{{keyword3.DATA}}\n失败原因{{keyword4.DATA}}', 'rlOEIDa0s6PMG4L_CkDLpBWCPf_mGci3z86UC5LmXCc', '1557384804', 1);
INSERT INTO `yx_routine_template` VALUES (25, 'AT1242', '提现失败通知', '失败原因{{keyword1.DATA}}\n提现金额{{keyword2.DATA}}\n提现方式{{keyword3.DATA}}\n审核时间{{keyword4.DATA}}', 'MsVoI7IV4CTFObS9XoJYTjMWPh8zjbNRK5-Z_II0Dnk', '1558918703', 1);
INSERT INTO `yx_routine_template` VALUES (26, 'AT1330', ' 提现成功通知', '提现金额{{keyword1.DATA}}\n提现状态{{keyword2.DATA}}\n审核时间{{keyword3.DATA}}\n提现方式{{keyword4.DATA}}', 'Twp4EWZTRUF2mps0J5Inw55_DpbNEfqqdKvfEx_ihos', '1558918767', 1);

-- ----------------------------
-- Table structure for yx_store_bargain
-- ----------------------------
DROP TABLE IF EXISTS `yx_store_bargain`;
CREATE TABLE `yx_store_bargain`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '砍价产品ID',
  `product_id` int(11) UNSIGNED NOT NULL COMMENT '关联产品ID',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '砍价活动名称',
  `image` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '砍价活动图片',
  `unit_name` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '单位名称',
  `stock` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '库存',
  `sales` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '销量',
  `images` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '砍价产品轮播图',
  `start_time` int(11) UNSIGNED NOT NULL COMMENT '砍价开启时间',
  `stop_time` int(11) UNSIGNED NOT NULL COMMENT '砍价结束时间',
  `store_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '砍价产品名称',
  `price` decimal(8, 2) UNSIGNED NULL DEFAULT NULL COMMENT '砍价金额',
  `min_price` decimal(8, 2) UNSIGNED NULL DEFAULT NULL COMMENT '砍价商品最低价',
  `num` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '每次购买的砍价产品数量',
  `bargain_max_price` decimal(8, 2) UNSIGNED NULL DEFAULT NULL COMMENT '用户每次砍价的最大金额',
  `bargain_min_price` decimal(8, 2) UNSIGNED NULL DEFAULT NULL COMMENT '用户每次砍价的最小金额',
  `bargain_num` int(11) UNSIGNED NOT NULL DEFAULT 1 COMMENT '用户每次砍价的次数',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '砍价状态 0(到砍价时间不自动开启)  1(到砍价时间自动开启时间)',
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '砍价详情',
  `give_integral` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '反多少积分',
  `info` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '砍价活动简介',
  `cost` decimal(8, 2) UNSIGNED NULL DEFAULT NULL COMMENT '成本价',
  `sort` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序',
  `is_hot` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否推荐0不推荐1推荐',
  `is_del` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否删除 0未删除 1删除',
  `add_time` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '添加时间',
  `is_postage` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '是否包邮 0不包邮 1包邮',
  `postage` decimal(10, 2) UNSIGNED NULL DEFAULT NULL COMMENT '邮费',
  `rule` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '砍价规则',
  `look` int(11) UNSIGNED NULL DEFAULT 0 COMMENT '砍价产品浏览量',
  `share` int(11) UNSIGNED NULL DEFAULT 0 COMMENT '砍价产品分享量',
  `end_time_date` datetime(0) NOT NULL,
  `start_time_date` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '砍价表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of yx_store_bargain
-- ----------------------------
INSERT INTO `yx_store_bargain` VALUES (2, 20, '砍价测试01', 'https://image.dayouqiantu.cn/5ca04fa9c08ef.jpg', '张', 100, 1, 'https://image.dayouqiantu.cn/5ca05103ad634.jpg,https://image.dayouqiantu.cn/5ca04fa9c08ef.jpg', 1577090495, 1577728800, '70gA4彩色打印复印', 10.00, 0.01, 1, 2.00, 0.01, 1, 1, '<p style=\"text-align: center;\">7<strong>文件请传QQ2412733099，</strong></p><p style=\"text-align: center;\"><strong>718504558或2412733099@qq.com邮箱，</strong></p><p style=\"text-align: center;\"><strong>手机/微信：13733990583</strong></p><p style=\"text-align: center;\"><strong>量大请联系店主，一定让您满意而归</strong></p><p style=\"text-align: center;\"><strong>&nbsp; &nbsp;实体店面经营 保质保量</strong></p><p style=\"text-align: center;\"><strong>A4黑白2毛/张，量大1毛/张，</strong></p><p style=\"text-align: center;\"><strong>A3黑白双面5毛/张，量大3毛/张，</strong></p><p style=\"text-align: center;\"><strong>更大量请联系店主报价，</strong></p><p style=\"text-align: center;\"><strong>每消费1元可积1分，1分抵现金1毛，</strong></p><p style=\"text-align: center;\"><strong>付款时直接抵扣</strong></p><p style=\"text-align: center;\"><strong>（如此优惠的基础上还可积分，积分抵现金）</strong></p><p style=\"text-align: center;\"><img src=\"https://image.dayouqiantu.cn/5ca03007150f1.jpg\" style=\"max-width:100%;\"><strong><br></strong></p><p style=\"text-align: center;\"><br></p>', 0.00, '70gA4彩色打印复印', 0.50, 0, 0, 0, 1577090553, 1, 0.00, '<p>这里是规则</p>', 15, 0, '2019-12-31 02:00:00', '2019-12-23 16:41:35');
INSERT INTO `yx_store_bargain` VALUES (3, 20, '砍价活动2', 'https://image.dayouqiantu.cn/5ca04fa9c08ef.jpg', '张', 100, 1, 'https://image.dayouqiantu.cn/5ca05103ad634.jpg,https://image.dayouqiantu.cn/5ca04fa9c08ef.jpg', 1577101169, 1577721600, '70gA4彩色打印复印', 0.01, 0.01, 1, 10.00, 0.01, 1, 1, '<p style=\"text-align: center;\">7<strong>文件请传QQ2412733099，</strong></p><p style=\"text-align: center;\"><strong>718504558或2412733099@qq.com邮箱，</strong></p><p style=\"text-align: center;\"><strong>手机/微信：13733990583</strong></p><p style=\"text-align: center;\"><strong>量大请联系店主，一定让您满意而归</strong></p><p style=\"text-align: center;\"><strong>&nbsp; &nbsp;实体店面经营 保质保量</strong></p><p style=\"text-align: center;\"><strong>A4黑白2毛/张，量大1毛/张，</strong></p><p style=\"text-align: center;\"><strong>A3黑白双面5毛/张，量大3毛/张，</strong></p><p style=\"text-align: center;\"><strong>更大量请联系店主报价，</strong></p><p style=\"text-align: center;\"><strong>每消费1元可积1分，1分抵现金1毛，</strong></p><p style=\"text-align: center;\"><strong>付款时直接抵扣</strong></p><p style=\"text-align: center;\"><strong>（如此优惠的基础上还可积分，积分抵现金）</strong></p><p style=\"text-align: center;\"><img src=\"https://image.dayouqiantu.cn/5ca03007150f1.jpg\" style=\"max-width:100%;\"><strong><br></strong></p><p style=\"text-align: center;\"><br></p>', 0.00, '70gA4彩色打印复印', 0.50, 0, 0, 0, 1577101179, 1, 0.00, '<p>444444</p>', 0, 0, '2019-12-31 00:00:00', '2019-12-23 19:39:29');

-- ----------------------------
-- Table structure for yx_store_bargain_user
-- ----------------------------
DROP TABLE IF EXISTS `yx_store_bargain_user`;
CREATE TABLE `yx_store_bargain_user`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用户参与砍价表ID',
  `uid` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '用户ID',
  `bargain_id` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '砍价产品id',
  `bargain_price_min` decimal(8, 2) UNSIGNED NULL DEFAULT NULL COMMENT '砍价的最低价',
  `bargain_price` decimal(8, 2) NULL DEFAULT NULL COMMENT '砍价金额',
  `price` decimal(8, 2) UNSIGNED NULL DEFAULT NULL COMMENT '砍掉的价格',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '状态 1参与中 2 活动结束参与失败 3活动结束参与成功',
  `add_time` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '参与时间',
  `is_del` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否取消',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户参与砍价表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of yx_store_bargain_user
-- ----------------------------
INSERT INTO `yx_store_bargain_user` VALUES (32, 12, 2, 0.01, 10.00, 1.06, 1, 1577099027, 1);
INSERT INTO `yx_store_bargain_user` VALUES (33, 12, 2, 0.01, 10.00, 1.34, 1, 1577099210, 0);

-- ----------------------------
-- Table structure for yx_store_bargain_user_help
-- ----------------------------
DROP TABLE IF EXISTS `yx_store_bargain_user_help`;
CREATE TABLE `yx_store_bargain_user_help`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '砍价用户帮助表ID',
  `uid` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '帮助的用户id',
  `bargain_id` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '砍价产品ID',
  `bargain_user_id` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '用户参与砍价表id',
  `price` decimal(8, 2) UNSIGNED NULL DEFAULT NULL COMMENT '帮助砍价多少金额',
  `add_time` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '砍价用户帮助表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of yx_store_bargain_user_help
-- ----------------------------
INSERT INTO `yx_store_bargain_user_help` VALUES (33, 12, 2, 32, 1.06, 1577099027);
INSERT INTO `yx_store_bargain_user_help` VALUES (34, 12, 2, 33, 1.34, 1577099210);

-- ----------------------------
-- Table structure for yx_store_cart
-- ----------------------------
DROP TABLE IF EXISTS `yx_store_cart`;
CREATE TABLE `yx_store_cart`  (
  `id` bigint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '购物车表ID',
  `uid` int(10) UNSIGNED NOT NULL COMMENT '用户ID',
  `type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类型',
  `product_id` int(10) UNSIGNED NOT NULL COMMENT '商品ID',
  `product_attr_unique` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '商品属性',
  `cart_num` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT '商品数量',
  `add_time` int(10) UNSIGNED NOT NULL COMMENT '添加时间',
  `is_pay` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 = 未购买 1 = 已购买',
  `is_del` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否删除',
  `is_new` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否为立即购买',
  `combination_id` int(11) UNSIGNED NULL DEFAULT 0 COMMENT '拼团id',
  `seckill_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '秒杀产品ID',
  `bargain_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '砍价id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`uid`) USING BTREE,
  INDEX `goods_id`(`product_id`) USING BTREE,
  INDEX `uid`(`uid`, `is_pay`) USING BTREE,
  INDEX `uid_2`(`uid`, `is_del`) USING BTREE,
  INDEX `uid_3`(`uid`, `is_new`) USING BTREE,
  INDEX `type`(`type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 108 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '购物车表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of yx_store_cart
-- ----------------------------
INSERT INTO `yx_store_cart` VALUES (21, 10, 'product', 19, 'b2f53a706c0646ce93e5df0b44350b35', 1, 1573110327, 1, 0, 1, 0, 0, 0);
INSERT INTO `yx_store_cart` VALUES (22, 7, 'product', 19, 'ccfd0537cffc4cb984d2feec6deccfe5', 1, 1573118819, 0, 0, 1, 0, 0, 0);
INSERT INTO `yx_store_cart` VALUES (23, 7, 'product', 19, '74d02ea6a57a46979a999457d8819421', 1, 1573118876, 1, 0, 1, 0, 0, 0);
INSERT INTO `yx_store_cart` VALUES (24, 3, 'product', 19, '2e4fdfe41da9408ebe5dc5f46b247c36', 1, 1573119028, 1, 0, 1, 0, 0, 0);
INSERT INTO `yx_store_cart` VALUES (25, 7, 'product', 20, '75d1d355cdb44970beb3524911c7bae7', 1, 1573119053, 1, 0, 1, 0, 0, 0);
INSERT INTO `yx_store_cart` VALUES (26, 3, 'product', 19, '0938e298745940318f07af0887b657b8', 1, 1573119078, 1, 0, 1, 0, 0, 0);
INSERT INTO `yx_store_cart` VALUES (27, 7, 'product', 19, '2e4fdfe41da9408ebe5dc5f46b247c36', 1, 1573119170, 1, 0, 1, 0, 0, 0);
INSERT INTO `yx_store_cart` VALUES (28, 8, 'product', 19, '74d02ea6a57a46979a999457d8819421', 1, 1573119388, 0, 0, 1, 0, 0, 0);
INSERT INTO `yx_store_cart` VALUES (29, 8, 'product', 19, '0938e298745940318f07af0887b657b8', 1, 1573119419, 1, 0, 1, 0, 0, 0);
INSERT INTO `yx_store_cart` VALUES (30, 11, 'product', 19, '2e4fdfe41da9408ebe5dc5f46b247c36', 1, 1573120609, 1, 0, 1, 0, 0, 0);
INSERT INTO `yx_store_cart` VALUES (31, 12, 'product', 19, '2e4fdfe41da9408ebe5dc5f46b247c36', 1, 1573123442, 1, 0, 1, 0, 0, 0);
INSERT INTO `yx_store_cart` VALUES (32, 12, 'product', 19, '2e4fdfe41da9408ebe5dc5f46b247c36', 1, 1573123802, 1, 0, 1, 0, 0, 0);
INSERT INTO `yx_store_cart` VALUES (33, 12, 'product', 19, '2e4fdfe41da9408ebe5dc5f46b247c36', 1, 1573123872, 1, 0, 1, 0, 0, 0);
INSERT INTO `yx_store_cart` VALUES (34, 12, 'product', 19, '00e86525a7af4dcf9e653ae0a2062369', 1, 1573368853, 1, 0, 1, 0, 0, 0);
INSERT INTO `yx_store_cart` VALUES (35, 12, 'product', 19, '00e86525a7af4dcf9e653ae0a2062369', 1, 1573380121, 1, 0, 1, 0, 0, 0);
INSERT INTO `yx_store_cart` VALUES (36, 12, 'product', 19, 'd8c72945fdbe4035a95a393aff1eea46', 1, 1573380432, 1, 0, 1, 0, 0, 0);
INSERT INTO `yx_store_cart` VALUES (37, 14, 'product', 19, '00e86525a7af4dcf9e653ae0a2062369', 1, 1573612783, 1, 0, 1, 0, 0, 0);
INSERT INTO `yx_store_cart` VALUES (38, 11, 'product', 19, '00e86525a7af4dcf9e653ae0a2062369', 1, 1573613951, 0, 0, 1, 0, 0, 0);
INSERT INTO `yx_store_cart` VALUES (39, 11, 'product', 19, '00e86525a7af4dcf9e653ae0a2062369', 1, 1573817530, 0, 0, 0, 0, 0, 0);
INSERT INTO `yx_store_cart` VALUES (40, 12, 'product', 19, '00e86525a7af4dcf9e653ae0a2062369', 1, 1573846766, 0, 1, 0, 0, 0, 0);
INSERT INTO `yx_store_cart` VALUES (41, 12, 'product', 20, 'ba5d202555c44d378e6644ca1296ee01', 1, 1573846775, 0, 1, 0, 0, 0, 0);
INSERT INTO `yx_store_cart` VALUES (42, 14, 'product', 19, '00e86525a7af4dcf9e653ae0a2062369', 1, 1573888313, 1, 0, 1, 0, 0, 0);
INSERT INTO `yx_store_cart` VALUES (43, 14, 'product', 19, '00e86525a7af4dcf9e653ae0a2062369', 1, 1573979445, 1, 0, 1, 0, 0, 0);
INSERT INTO `yx_store_cart` VALUES (44, 14, 'product', 19, '00e86525a7af4dcf9e653ae0a2062369', 1, 1573979624, 1, 0, 1, 0, 0, 0);
INSERT INTO `yx_store_cart` VALUES (45, 14, 'product', 19, '00e86525a7af4dcf9e653ae0a2062369', 1, 1573980036, 1, 0, 1, 0, 0, 0);
INSERT INTO `yx_store_cart` VALUES (46, 14, 'product', 19, '00e86525a7af4dcf9e653ae0a2062369', 1, 1573980984, 1, 0, 1, 0, 0, 0);
INSERT INTO `yx_store_cart` VALUES (47, 14, 'product', 19, '00e86525a7af4dcf9e653ae0a2062369', 1, 1573981512, 1, 0, 1, 0, 0, 0);
INSERT INTO `yx_store_cart` VALUES (48, 14, 'product', 19, '00e86525a7af4dcf9e653ae0a2062369', 1, 1573981625, 1, 0, 1, 0, 0, 0);
INSERT INTO `yx_store_cart` VALUES (49, 14, 'product', 19, '00e86525a7af4dcf9e653ae0a2062369', 1, 1573982911, 1, 0, 1, 0, 0, 0);
INSERT INTO `yx_store_cart` VALUES (50, 14, 'product', 19, '00e86525a7af4dcf9e653ae0a2062369', 1, 1573983129, 1, 0, 1, 0, 0, 0);
INSERT INTO `yx_store_cart` VALUES (51, 14, 'product', 19, '00e86525a7af4dcf9e653ae0a2062369', 1, 1573984480, 1, 0, 1, 0, 0, 0);
INSERT INTO `yx_store_cart` VALUES (52, 14, 'product', 19, '00e86525a7af4dcf9e653ae0a2062369', 1, 1573984575, 1, 0, 1, 0, 0, 0);
INSERT INTO `yx_store_cart` VALUES (53, 14, 'product', 19, '00e86525a7af4dcf9e653ae0a2062369', 1, 1573984665, 1, 0, 1, 0, 0, 0);
INSERT INTO `yx_store_cart` VALUES (54, 14, 'product', 19, '00e86525a7af4dcf9e653ae0a2062369', 1, 1573985135, 1, 0, 1, 0, 0, 0);
INSERT INTO `yx_store_cart` VALUES (55, 14, 'product', 19, '00e86525a7af4dcf9e653ae0a2062369', 1, 1573985245, 1, 0, 1, 0, 0, 0);
INSERT INTO `yx_store_cart` VALUES (56, 14, 'product', 19, '00e86525a7af4dcf9e653ae0a2062369', 1, 1573985381, 1, 0, 1, 0, 0, 0);
INSERT INTO `yx_store_cart` VALUES (57, 14, 'product', 19, '00e86525a7af4dcf9e653ae0a2062369', 1, 1573985953, 1, 0, 1, 0, 0, 0);
INSERT INTO `yx_store_cart` VALUES (58, 14, 'product', 19, '00e86525a7af4dcf9e653ae0a2062369', 1, 1573987260, 1, 0, 1, 0, 0, 0);
INSERT INTO `yx_store_cart` VALUES (59, 14, 'product', 19, '00e86525a7af4dcf9e653ae0a2062369', 1, 1573987803, 1, 0, 1, 0, 0, 0);
INSERT INTO `yx_store_cart` VALUES (60, 14, 'product', 19, '00e86525a7af4dcf9e653ae0a2062369', 1, 1573988062, 1, 0, 1, 0, 0, 0);
INSERT INTO `yx_store_cart` VALUES (61, 14, 'product', 19, '00e86525a7af4dcf9e653ae0a2062369', 1, 1573989582, 1, 0, 1, 0, 0, 0);
INSERT INTO `yx_store_cart` VALUES (62, 14, 'product', 19, '00e86525a7af4dcf9e653ae0a2062369', 1, 1573991786, 1, 0, 1, 0, 0, 0);
INSERT INTO `yx_store_cart` VALUES (63, 14, 'product', 19, '00e86525a7af4dcf9e653ae0a2062369', 1, 1573991863, 1, 0, 1, 0, 0, 0);
INSERT INTO `yx_store_cart` VALUES (64, 14, 'product', 19, '00e86525a7af4dcf9e653ae0a2062369', 1, 1573992167, 1, 0, 1, 0, 0, 0);
INSERT INTO `yx_store_cart` VALUES (65, 14, 'product', 19, '00e86525a7af4dcf9e653ae0a2062369', 1, 1573992682, 1, 0, 1, 0, 0, 0);
INSERT INTO `yx_store_cart` VALUES (66, 14, 'product', 19, '00e86525a7af4dcf9e653ae0a2062369', 1, 1573995851, 1, 0, 1, 0, 0, 0);
INSERT INTO `yx_store_cart` VALUES (67, 14, 'product', 19, '00e86525a7af4dcf9e653ae0a2062369', 1, 1573996185, 1, 0, 1, 0, 0, 0);
INSERT INTO `yx_store_cart` VALUES (68, 14, 'product', 19, '00e86525a7af4dcf9e653ae0a2062369', 1, 1573996420, 1, 0, 1, 0, 0, 0);
INSERT INTO `yx_store_cart` VALUES (69, 14, 'product', 19, '00e86525a7af4dcf9e653ae0a2062369', 1, 1573996695, 1, 0, 1, 0, 0, 0);
INSERT INTO `yx_store_cart` VALUES (70, 14, 'product', 19, '00e86525a7af4dcf9e653ae0a2062369', 1, 1573999215, 1, 0, 1, 0, 0, 0);
INSERT INTO `yx_store_cart` VALUES (71, 14, 'product', 19, '00e86525a7af4dcf9e653ae0a2062369', 1, 1573999374, 1, 0, 1, 0, 0, 0);
INSERT INTO `yx_store_cart` VALUES (72, 14, 'product', 19, '00e86525a7af4dcf9e653ae0a2062369', 1, 1573999538, 1, 0, 1, 0, 0, 0);
INSERT INTO `yx_store_cart` VALUES (73, 14, 'product', 19, '00e86525a7af4dcf9e653ae0a2062369', 1, 1573999673, 1, 0, 1, 0, 0, 0);
INSERT INTO `yx_store_cart` VALUES (74, 14, 'product', 19, '00e86525a7af4dcf9e653ae0a2062369', 1, 1574000128, 1, 0, 1, 0, 0, 0);
INSERT INTO `yx_store_cart` VALUES (75, 14, 'product', 19, '00e86525a7af4dcf9e653ae0a2062369', 1, 1574000409, 1, 0, 1, 0, 0, 0);
INSERT INTO `yx_store_cart` VALUES (76, 14, 'product', 19, '00e86525a7af4dcf9e653ae0a2062369', 1, 1574000926, 1, 0, 1, 0, 0, 0);
INSERT INTO `yx_store_cart` VALUES (77, 14, 'product', 19, '00e86525a7af4dcf9e653ae0a2062369', 1, 1574001199, 1, 0, 1, 0, 0, 0);
INSERT INTO `yx_store_cart` VALUES (78, 14, 'product', 19, '00e86525a7af4dcf9e653ae0a2062369', 1, 1574001302, 1, 0, 1, 0, 0, 0);
INSERT INTO `yx_store_cart` VALUES (79, 14, 'product', 19, '00e86525a7af4dcf9e653ae0a2062369', 1, 1574039489, 1, 0, 1, 0, 0, 0);
INSERT INTO `yx_store_cart` VALUES (80, 14, 'product', 19, '00e86525a7af4dcf9e653ae0a2062369', 1, 1574040157, 1, 0, 1, 0, 0, 0);
INSERT INTO `yx_store_cart` VALUES (81, 14, 'product', 19, '00e86525a7af4dcf9e653ae0a2062369', 1, 1574040943, 1, 0, 1, 0, 0, 0);
INSERT INTO `yx_store_cart` VALUES (82, 14, 'product', 19, '00e86525a7af4dcf9e653ae0a2062369', 1, 1574043311, 1, 0, 1, 0, 0, 0);
INSERT INTO `yx_store_cart` VALUES (83, 12, 'product', 19, '', 1, 1574216552, 1, 0, 1, 2, 0, 0);
INSERT INTO `yx_store_cart` VALUES (84, 12, 'product', 19, '', 1, 1574243149, 1, 0, 1, 2, 0, 0);
INSERT INTO `yx_store_cart` VALUES (85, 12, 'product', 19, '', 1, 1574244169, 1, 0, 1, 2, 0, 0);
INSERT INTO `yx_store_cart` VALUES (86, 12, 'product', 19, '', 1, 1574320376, 1, 0, 1, 2, 0, 0);
INSERT INTO `yx_store_cart` VALUES (87, 11, 'product', 19, '', 1, 1574329392, 1, 0, 1, 2, 0, 0);
INSERT INTO `yx_store_cart` VALUES (88, 12, 'product', 19, '', 1, 1574424869, 1, 0, 1, 2, 0, 0);
INSERT INTO `yx_store_cart` VALUES (89, 12, 'product', 19, '00e86525a7af4dcf9e653ae0a2062369', 1, 1575095144, 1, 0, 1, 0, 0, 0);
INSERT INTO `yx_store_cart` VALUES (90, 12, 'product', 19, '00e86525a7af4dcf9e653ae0a2062369', 1, 1575095354, 1, 0, 1, 0, 0, 0);
INSERT INTO `yx_store_cart` VALUES (91, 12, 'product', 19, '00e86525a7af4dcf9e653ae0a2062369', 2, 1575551197, 0, 1, 0, 0, 0, 0);
INSERT INTO `yx_store_cart` VALUES (92, 12, 'product', 20, 'ba5d202555c44d378e6644ca1296ee01', 3, 1575551310, 0, 1, 0, 0, 0, 0);
INSERT INTO `yx_store_cart` VALUES (93, 12, 'product', 19, '', 1, 1575552290, 0, 0, 1, 2, 0, 0);
INSERT INTO `yx_store_cart` VALUES (94, 12, 'product', 19, '', 1, 1575552309, 0, 0, 1, 1, 0, 0);
INSERT INTO `yx_store_cart` VALUES (95, 12, 'product', 19, '00e86525a7af4dcf9e653ae0a2062369', 1, 1575771477, 1, 0, 1, 0, 0, 0);
INSERT INTO `yx_store_cart` VALUES (96, 12, 'product', 19, '00e86525a7af4dcf9e653ae0a2062369', 1, 1576234305, 1, 0, 1, 0, 0, 0);
INSERT INTO `yx_store_cart` VALUES (97, 12, 'product', 19, '00e86525a7af4dcf9e653ae0a2062369', 1, 1576290026, 1, 0, 1, 0, 0, 0);
INSERT INTO `yx_store_cart` VALUES (98, 12, 'product', 20, '', 1, 1576559862, 0, 0, 1, 0, 0, 0);
INSERT INTO `yx_store_cart` VALUES (99, 12, 'product', 20, '', 1, 1576561530, 1, 0, 1, 0, 2, 0);
INSERT INTO `yx_store_cart` VALUES (100, 12, 'product', 19, '00e86525a7af4dcf9e653ae0a2062369', 9, 1576749041, 0, 0, 0, 0, 0, 0);
INSERT INTO `yx_store_cart` VALUES (101, 12, 'product', 19, '6c2deabbdebd4f57a7c7b4c9e1c08bce', 9, 1576749047, 0, 0, 0, 0, 0, 0);
INSERT INTO `yx_store_cart` VALUES (102, 12, 'product', 19, 'd8c72945fdbe4035a95a393aff1eea46', 11, 1576749059, 0, 0, 0, 0, 0, 0);
INSERT INTO `yx_store_cart` VALUES (103, 12, 'product', 19, '', 1, 1577085055, 1, 0, 1, 0, 0, 1);
INSERT INTO `yx_store_cart` VALUES (104, 12, 'product', 20, 'ba5d202555c44d378e6644ca1296ee01', 1, 1577442127, 1, 0, 1, 0, 0, 0);
INSERT INTO `yx_store_cart` VALUES (105, 12, 'product', 19, '00e86525a7af4dcf9e653ae0a2062369', 1, 1577611673, 1, 0, 1, 0, 0, 0);
INSERT INTO `yx_store_cart` VALUES (106, 12, 'product', 19, '00e86525a7af4dcf9e653ae0a2062369', 1, 1577678968, 1, 0, 1, 0, 0, 0);
INSERT INTO `yx_store_cart` VALUES (107, 12, 'product', 19, '00e86525a7af4dcf9e653ae0a2062369', 1, 1577890650, 1, 0, 1, 0, 0, 0);

-- ----------------------------
-- Table structure for yx_store_category
-- ----------------------------
DROP TABLE IF EXISTS `yx_store_category`;
CREATE TABLE `yx_store_category`  (
  `id` mediumint(11) NOT NULL AUTO_INCREMENT COMMENT '商品分类表ID',
  `pid` mediumint(11) NOT NULL COMMENT '父id',
  `cate_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分类名称',
  `sort` mediumint(11) NULL DEFAULT NULL COMMENT '排序',
  `pic` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '图标',
  `is_show` tinyint(1) NULL DEFAULT 1 COMMENT '是否推荐',
  `add_time` int(11) NULL DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `pid`(`pid`) USING BTREE,
  INDEX `is_base`(`is_show`) USING BTREE,
  INDEX `sort`(`sort`) USING BTREE,
  INDEX `add_time`(`add_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品分类表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of yx_store_category
-- ----------------------------
INSERT INTO `yx_store_category` VALUES (1, 0, '打印复印', 1, '', 1, NULL);
INSERT INTO `yx_store_category` VALUES (24, 1, '打印复印', 2, 'https://image.dayouqiantu.cn/5ca05103ad634.jpg', 1, NULL);
INSERT INTO `yx_store_category` VALUES (25, 0, '广告印刷', 2, '', 1, NULL);
INSERT INTO `yx_store_category` VALUES (26, 25, '广告印刷', 2, 'https://image.dayouqiantu.cn/5ca04fa9c08ef.jpg', 1, NULL);

-- ----------------------------
-- Table structure for yx_store_combination
-- ----------------------------
DROP TABLE IF EXISTS `yx_store_combination`;
CREATE TABLE `yx_store_combination`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` int(10) UNSIGNED NOT NULL COMMENT '商品id',
  `mer_id` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '商户id',
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '推荐图',
  `images` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '轮播图',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '活动标题',
  `attr` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '活动属性',
  `people` int(2) UNSIGNED NOT NULL COMMENT '参团人数',
  `info` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '简介',
  `price` decimal(10, 2) UNSIGNED NOT NULL COMMENT '价格',
  `sort` int(10) UNSIGNED NOT NULL COMMENT '排序',
  `sales` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '销量',
  `stock` int(10) UNSIGNED NOT NULL COMMENT '库存',
  `add_time` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '添加时间',
  `is_host` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '推荐',
  `is_show` tinyint(1) UNSIGNED NOT NULL COMMENT '产品状态',
  `is_del` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `combination` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `mer_use` tinyint(1) UNSIGNED NULL DEFAULT NULL COMMENT '商户是否可用1可用0不可用',
  `is_postage` tinyint(1) UNSIGNED NOT NULL COMMENT '是否包邮1是0否',
  `postage` decimal(10, 2) UNSIGNED NOT NULL COMMENT '邮费',
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '拼团内容',
  `start_time` int(11) UNSIGNED NOT NULL COMMENT '拼团开始时间',
  `stop_time` int(11) UNSIGNED NOT NULL COMMENT '拼团结束时间',
  `effective_time` int(11) NOT NULL DEFAULT 0 COMMENT '拼团订单有效时间',
  `cost` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '拼图产品成本',
  `browse` int(11) NULL DEFAULT 0 COMMENT '浏览量',
  `unit_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '单位名',
  `end_time_date` datetime(0) NOT NULL,
  `start_time_date` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '拼团产品表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of yx_store_combination
-- ----------------------------
INSERT INTO `yx_store_combination` VALUES (1, 19, NULL, 'https://image.dayouqiantu.cn/5ca011a1cd487.jpg', 'https://image.dayouqiantu.cn/5ca01c7fc9238.jpg,https://image.dayouqiantu.cn/5ca01c7676042.jpg', '70gA4黑白打印复印', NULL, 2, '打印复印资料A4黑白彩色印刷画册书本装订图文数码快印服务', 1.00, 1, 19, 98, '1574064564', 1, 1, 0, 1, NULL, 1, 0.00, '<p style=\"text-align: center;\"><strong>文件请传QQ2412733099，</strong></p><p style=\"text-align: center;\"><strong>718504558或2412733099@qq.com邮箱，</strong></p><p style=\"text-align: center;\"><strong>手机/微信：13733990583</strong></p><p style=\"text-align: center;\"><strong>量大请联系店主，一定让您满意而归</strong></p><p style=\"text-align: center;\"><strong>&nbsp; &nbsp;实体店面经营 保质保量</strong></p><p style=\"text-align: center;\"><strong>A4黑白2毛/张，量大1毛/张，</strong></p><p style=\"text-align: center;\"><strong>A3黑白双面5毛/张，量大3毛/张，</strong></p><p style=\"text-align: center;\"><strong>更大量请联系店主报价，</strong></p><p style=\"text-align: center;\"><strong>每消费1元可积1分，1分抵现金1毛，</strong></p><p style=\"text-align: center;\"><strong>付款时直接抵扣</strong></p><p style=\"text-align: center;\"><strong>（如此优惠的基础上还可积分，积分抵现金）</strong></p><p style=\"text-align: left;\"><strong><br></strong></p><p><br></p><p>&nbsp; &nbsp;&nbsp;<img src=\"https://image.dayouqiantu.cn/5ca03007150f1.jpg\" style=\"max-width: 100%;\"><br></p>', 1574064557, 1577289600, 24, 0, 0, '张', '2019-11-22 00:00:00', '2019-11-18 16:09:17');
INSERT INTO `yx_store_combination` VALUES (2, 19, NULL, 'https://image.dayouqiantu.cn/5ca011a1cd487.jpg', 'https://image.dayouqiantu.cn/5ca01c7fc9238.jpg,https://image.dayouqiantu.cn/5ca01c7676042.jpg', '70gA4黑白打印复印', NULL, 2, '打印复印资料A4黑白彩色印刷画册书本装订图文数码快印服务', 1.00, 1, 24, 93, '1574066608', 1, 1, 0, 1, NULL, 1, 0.00, '<p style=\"text-align: center;\"><strong>文件请传QQ2412733099，</strong></p><p style=\"text-align: center;\"><strong>718504558或2412733099@qq.com邮箱，</strong></p><p style=\"text-align: center;\"><strong>手机/微信：13733990583</strong></p><p style=\"text-align: center;\"><strong>量大请联系店主，一定让您满意而归</strong></p><p style=\"text-align: center;\"><strong>&nbsp; &nbsp;实体店面经营 保质保量</strong></p><p style=\"text-align: center;\"><strong>A4黑白2毛/张，量大1毛/张，</strong></p><p style=\"text-align: center;\"><strong>A3黑白双面5毛/张，量大3毛/张，</strong></p><p style=\"text-align: center;\"><strong>更大量请联系店主报价，</strong></p><p style=\"text-align: center;\"><strong>每消费1元可积1分，1分抵现金1毛，</strong></p><p style=\"text-align: center;\"><strong>付款时直接抵扣</strong></p><p style=\"text-align: center;\"><strong>（如此优惠的基础上还可积分，积分抵现金）</strong></p><p style=\"text-align: left;\"><strong><br></strong></p><p><br></p><p>&nbsp; &nbsp;&nbsp;<img src=\"https://image.dayouqiantu.cn/5ca03007150f1.jpg\" style=\"max-width: 100%;\"><br></p>', 1574066592, 1577289600, 24, 0, 0, '张', '2019-11-28 00:00:00', '2019-11-18 16:43:12');

-- ----------------------------
-- Table structure for yx_store_combination_attr
-- ----------------------------
DROP TABLE IF EXISTS `yx_store_combination_attr`;
CREATE TABLE `yx_store_combination_attr`  (
  `product_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '商品ID',
  `attr_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '属性名',
  `attr_values` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '属性值',
  INDEX `store_id`(`product_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品属性表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for yx_store_combination_attr_result
-- ----------------------------
DROP TABLE IF EXISTS `yx_store_combination_attr_result`;
CREATE TABLE `yx_store_combination_attr_result`  (
  `product_id` int(10) UNSIGNED NOT NULL COMMENT '商品ID',
  `result` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品属性参数',
  `change_time` int(10) UNSIGNED NOT NULL COMMENT '上次修改时间',
  UNIQUE INDEX `product_id`(`product_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品属性详情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for yx_store_combination_attr_value
-- ----------------------------
DROP TABLE IF EXISTS `yx_store_combination_attr_value`;
CREATE TABLE `yx_store_combination_attr_value`  (
  `product_id` int(10) UNSIGNED NOT NULL COMMENT '商品ID',
  `suk` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品属性索引值 (attr_value|attr_value[|....])',
  `stock` int(10) UNSIGNED NOT NULL COMMENT '属性对应的库存',
  `sales` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '销量',
  `price` decimal(8, 2) UNSIGNED NOT NULL COMMENT '属性金额',
  `image` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片',
  `unique` char(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '唯一值',
  `cost` decimal(8, 2) UNSIGNED NOT NULL COMMENT '成本价',
  UNIQUE INDEX `unique`(`unique`, `suk`) USING BTREE,
  INDEX `store_id`(`product_id`, `suk`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品属性值表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for yx_store_coupon
-- ----------------------------
DROP TABLE IF EXISTS `yx_store_coupon`;
CREATE TABLE `yx_store_coupon`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '优惠券表ID',
  `title` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '优惠券名称',
  `integral` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '兑换消耗积分值',
  `coupon_price` decimal(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '兑换的优惠券面值',
  `use_min_price` decimal(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '最低消费多少金额可用优惠券',
  `coupon_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '优惠券有效期限（单位：天）',
  `sort` int(11) UNSIGNED NOT NULL DEFAULT 1 COMMENT '排序',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '状态（0：关闭，1：开启）',
  `add_time` int(11) UNSIGNED NOT NULL COMMENT '兑换项目添加时间',
  `is_del` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `state`(`status`) USING BTREE,
  INDEX `add_time`(`add_time`) USING BTREE,
  INDEX `coupon_time`(`coupon_time`) USING BTREE,
  INDEX `is_del`(`is_del`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '优惠券表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of yx_store_coupon
-- ----------------------------
INSERT INTO `yx_store_coupon` VALUES (1, '双十一', 0, 1.00, 100.00, 10, 0, 1, 1573281957, 0);
INSERT INTO `yx_store_coupon` VALUES (2, '44444446', 0, 1.00, 1.00, 1, 0, 1, 1574130748, 0);
INSERT INTO `yx_store_coupon` VALUES (3, '999', 0, 1.00, 1.00, 1, 1, 1, 1574131073, 0);

-- ----------------------------
-- Table structure for yx_store_coupon_issue
-- ----------------------------
DROP TABLE IF EXISTS `yx_store_coupon_issue`;
CREATE TABLE `yx_store_coupon_issue`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `cname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cid` int(10) NULL DEFAULT NULL COMMENT '优惠券ID',
  `start_time` int(10) NULL DEFAULT NULL COMMENT '优惠券领取开启时间',
  `end_time` int(10) NULL DEFAULT NULL COMMENT '优惠券领取结束时间',
  `total_count` int(10) NULL DEFAULT NULL COMMENT '优惠券领取数量',
  `remain_count` int(10) NULL DEFAULT NULL COMMENT '优惠券剩余领取数量',
  `is_permanent` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否无限张数',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1 正常 0 未开启 -1 已无效',
  `is_del` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `add_time` int(10) NULL DEFAULT NULL COMMENT '优惠券添加时间',
  `end_time_date` datetime(0) NOT NULL,
  `start_time_date` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `cid`(`cid`) USING BTREE,
  INDEX `start_time`(`start_time`, `end_time`) USING BTREE,
  INDEX `remain_count`(`remain_count`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  INDEX `is_del`(`is_del`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '优惠券前台领取表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of yx_store_coupon_issue
-- ----------------------------
INSERT INTO `yx_store_coupon_issue` VALUES (11, '双十一', 1, 1573352364, 1577277208, 1000, 999, 0, 1, 0, 1573352375, '2020-01-15 01:00:00', '2019-12-02 10:19:24');
INSERT INTO `yx_store_coupon_issue` VALUES (12, '双十一', 1, 1573353166, 1577277208, 100, 99, 0, 1, 0, 1573353175, '2019-12-26 00:00:00', '2019-11-10 10:32:46');
INSERT INTO `yx_store_coupon_issue` VALUES (13, '双十一', 1, 1573353254, 1577277208, 10, 9, 0, 1, 0, 1573353261, '2019-12-26 00:00:00', '2019-11-10 10:34:14');

-- ----------------------------
-- Table structure for yx_store_coupon_issue_user
-- ----------------------------
DROP TABLE IF EXISTS `yx_store_coupon_issue_user`;
CREATE TABLE `yx_store_coupon_issue_user`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uid` int(10) NULL DEFAULT NULL COMMENT '领取优惠券用户ID',
  `issue_coupon_id` int(10) NULL DEFAULT NULL COMMENT '优惠券前台领取ID',
  `add_time` int(10) NULL DEFAULT NULL COMMENT '领取时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uid`(`uid`, `issue_coupon_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '优惠券前台用户领取记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of yx_store_coupon_issue_user
-- ----------------------------
INSERT INTO `yx_store_coupon_issue_user` VALUES (1, 12, 11, 1573353024);
INSERT INTO `yx_store_coupon_issue_user` VALUES (2, 12, 12, 1573353194);
INSERT INTO `yx_store_coupon_issue_user` VALUES (3, 12, 13, 1573353269);

-- ----------------------------
-- Table structure for yx_store_coupon_user
-- ----------------------------
DROP TABLE IF EXISTS `yx_store_coupon_user`;
CREATE TABLE `yx_store_coupon_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '优惠券发放记录id',
  `cid` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '兑换的项目id',
  `uid` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '优惠券所属用户',
  `coupon_title` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '优惠券名称',
  `coupon_price` decimal(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '优惠券的面值',
  `use_min_price` decimal(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '最低消费多少金额可用优惠券',
  `add_time` int(11) UNSIGNED NOT NULL COMMENT '优惠券创建时间',
  `end_time` int(11) UNSIGNED NOT NULL COMMENT '优惠券结束时间',
  `use_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '使用时间',
  `type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'send' COMMENT '获取方式',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '状态（0：未使用，1：已使用, 2:已过期）',
  `is_fail` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否有效',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `cid`(`cid`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `add_time`(`add_time`) USING BTREE,
  INDEX `end_time`(`end_time`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  INDEX `is_fail`(`is_fail`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '优惠券发放记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of yx_store_coupon_user
-- ----------------------------
INSERT INTO `yx_store_coupon_user` VALUES (1, 1, 12, '双十一', 1.00, 100.00, 1573353024, 1574217024, 0, 'get', 2, 0);
INSERT INTO `yx_store_coupon_user` VALUES (2, 1, 12, '双十一', 1.00, 100.00, 1573353194, 1574217194, 1573380051, 'get', 1, 0);
INSERT INTO `yx_store_coupon_user` VALUES (3, 1, 12, '双十一', 1.00, 100.00, 1573353269, 1574217269, 0, 'get', 2, 0);

-- ----------------------------
-- Table structure for yx_store_order
-- ----------------------------
DROP TABLE IF EXISTS `yx_store_order`;
CREATE TABLE `yx_store_order`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '订单ID',
  `order_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单号',
  `uid` int(11) UNSIGNED NOT NULL COMMENT '用户id',
  `real_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户姓名',
  `user_phone` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户电话',
  `user_address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '详细地址',
  `cart_id` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '[]' COMMENT '购物车id',
  `freight_price` decimal(8, 2) NOT NULL DEFAULT 0.00 COMMENT '运费金额',
  `total_num` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '订单商品总数',
  `total_price` decimal(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '订单总价',
  `total_postage` decimal(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '邮费',
  `pay_price` decimal(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '实际支付金额',
  `pay_postage` decimal(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '支付邮费',
  `deduction_price` decimal(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '抵扣金额',
  `coupon_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '优惠券id',
  `coupon_price` decimal(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '优惠券金额',
  `paid` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '支付状态',
  `pay_time` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '支付时间',
  `pay_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '支付方式',
  `add_time` int(11) UNSIGNED NOT NULL COMMENT '创建时间',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '订单状态（-1 : 申请退款 -2 : 退货成功 0：待发货；1：待收货；2：已收货；3：待评价；-1：已退款）',
  `refund_status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '0 未退款 1 申请中 2 已退款',
  `refund_reason_wap_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '退款图片',
  `refund_reason_wap_explain` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '退款用户说明',
  `refund_reason_time` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '退款时间',
  `refund_reason_wap` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '前台退款原因',
  `refund_reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '不退款的理由',
  `refund_price` decimal(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '退款金额',
  `delivery_sn` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '快递公司编号',
  `delivery_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '快递名称/送货人姓名',
  `delivery_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发货类型',
  `delivery_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '快递单号/手机号',
  `gain_integral` decimal(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '消费赚取积分',
  `use_integral` decimal(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '使用积分',
  `back_integral` decimal(8, 2) UNSIGNED NULL DEFAULT NULL COMMENT '给用户退了多少积分',
  `mark` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '备注',
  `is_del` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否删除',
  `unique` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '唯一id(md5加密)类似id',
  `remark` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '管理员备注',
  `mer_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '商户ID',
  `is_mer_check` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `combination_id` int(11) UNSIGNED NULL DEFAULT 0 COMMENT '拼团产品id0一般产品',
  `pink_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '拼团id 0没有拼团',
  `cost` decimal(8, 2) UNSIGNED NOT NULL COMMENT '成本价',
  `seckill_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '秒杀产品ID',
  `bargain_id` int(11) UNSIGNED NULL DEFAULT 0 COMMENT '砍价id',
  `verify_code` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '核销码',
  `store_id` int(11) NOT NULL DEFAULT 0 COMMENT '门店id',
  `shipping_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '配送方式 1=快递 ，2=门店自提',
  `is_channel` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '支付渠道(0微信公众号1微信小程序)',
  `is_remind` tinyint(1) UNSIGNED NULL DEFAULT 0,
  `is_system_del` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `order_id_2`(`order_id`, `uid`) USING BTREE,
  UNIQUE INDEX `unique`(`unique`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `add_time`(`add_time`) USING BTREE,
  INDEX `pay_price`(`pay_price`) USING BTREE,
  INDEX `paid`(`paid`) USING BTREE,
  INDEX `pay_time`(`pay_time`) USING BTREE,
  INDEX `pay_type`(`pay_type`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  INDEX `is_del`(`is_del`) USING BTREE,
  INDEX `coupon_id`(`coupon_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 108 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of yx_store_order
-- ----------------------------
INSERT INTO `yx_store_order` VALUES (24, '20191107150558943', 10, '胡鹏', '15136175246', '天津 东丽区 全境 66', '21', 0.00, 1, 0.20, 0.00, 0.20, 0.00, 0.00, 0, 0.00, 1, 1573110365, 'weixin', 1573110358, 3, 0, NULL, NULL, NULL, NULL, NULL, 0.00, '', '顺丰快递', 'express', '9999999', 1.00, 0.00, NULL, '', 0, '1cf30e92469e4f6d993df172ca1a01d9', NULL, 0, 0, 0, 0, 0.20, 0, 0, '', 0, 1, 0, 0, 0);
INSERT INTO `yx_store_order` VALUES (25, '20191107172818825', 7, '胡鹏', '15136175246', '山西 太原市 迎泽区 666', '23', 0.00, 1, 0.20, 0.00, 0.20, 0.00, 0.00, 0, 0.00, 0, NULL, 'weixin', 1573118898, 0, 0, NULL, NULL, NULL, NULL, NULL, 0.00, '', NULL, NULL, NULL, 1.00, 0.00, NULL, '', 0, '4f509e2c50e64051b36749a3f1e60550', NULL, 0, 0, 0, 0, 0.20, 0, 0, '', 0, 1, 0, 0, 0);
INSERT INTO `yx_store_order` VALUES (26, '20191107173034582', 3, 'HU22', '15136175246', '天津 和平区 全境 999', '24', 0.00, 1, 0.20, 0.00, 0.20, 0.00, 0.00, 0, 0.00, 1, 1573119034, 'yue', 1573119034, 0, 0, NULL, NULL, NULL, NULL, NULL, 0.00, '', NULL, NULL, NULL, 1.00, 0.00, NULL, '', 0, '58a1341001d746739952911cf49519dc', NULL, 0, 0, 0, 0, 0.20, 0, 0, '', 0, 1, 1, 0, 0);
INSERT INTO `yx_store_order` VALUES (27, '20191107173055258', 7, '胡鹏', '15136175246', '山西 太原市 迎泽区 666', '25', 0.00, 1, 0.50, 0.00, 0.50, 0.00, 0.00, 0, 0.00, 0, NULL, 'weixin', 1573119055, 0, 0, NULL, NULL, NULL, NULL, NULL, 0.00, '', NULL, NULL, NULL, 0.00, 0.00, NULL, '', 0, '4c5a85899213426b9dd4a054f0e99f58', NULL, 0, 0, 0, 0, 0.50, 0, 0, '', 0, 1, 0, 0, 0);
INSERT INTO `yx_store_order` VALUES (28, '20191107173121292', 3, 'HU22', '15136175246', '天津 和平区 全境 999', '26', 0.00, 1, 0.20, 0.00, 0.20, 0.00, 0.00, 0, 0.00, 0, NULL, 'weixin', 1573119081, 0, 0, NULL, NULL, NULL, NULL, NULL, 0.00, '', NULL, NULL, NULL, 1.00, 0.00, NULL, '', 0, '1c07a2c063e14a9eac62ecf4d0b64b65', NULL, 0, 0, 0, 0, 0.20, 0, 0, '', 0, 1, 1, 0, 0);
INSERT INTO `yx_store_order` VALUES (29, '20191107173257032', 7, '胡鹏', '15136175246', '山西 太原市 迎泽区 666', '27', 0.00, 1, 0.20, 0.00, 0.20, 0.00, 0.00, 0, 0.00, 0, NULL, 'weixin', 1573119177, 0, 0, NULL, NULL, NULL, NULL, NULL, 0.00, '', NULL, NULL, NULL, 1.00, 0.00, NULL, '', 0, '043f42ca2015446f8b12ffc3890a4cdb', NULL, 0, 0, 0, 0, 0.20, 0, 0, '', 0, 1, 0, 0, 0);
INSERT INTO `yx_store_order` VALUES (30, '20191107173722332', 8, '胡鹏', '15136175246', '山西 大同市 灵丘县 999', '29', 0.00, 1, 0.20, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0, NULL, 'weixin', 1573119442, 0, 0, NULL, NULL, NULL, NULL, NULL, 0.00, '', NULL, NULL, NULL, 1.00, 0.00, NULL, '', 0, 'f9dd9de7f09442bcbeb3b0ffc3d7c090', NULL, 0, 0, 0, 0, 0.20, 0, 0, '', 0, 1, 0, 0, 0);
INSERT INTO `yx_store_order` VALUES (31, '20191107175713269', 11, '胡鹏', '15139175246', '重庆 荣昌县 广顺镇 999', '30', 0.00, 1, 0.20, 0.00, 0.20, 0.00, 0.00, 0, 0.00, 1, 1573120639, 'weixin', 1573120633, 0, 0, NULL, NULL, NULL, NULL, NULL, 0.00, '', NULL, NULL, NULL, 1.00, 0.00, NULL, '', 0, 'dae5d2e5965f444da857f31536287cdf', NULL, 0, 0, 0, 0, 0.20, 0, 0, '', 0, 1, 0, 0, 0);
INSERT INTO `yx_store_order` VALUES (32, '20191107184639089', 12, 'hu', '15136175246', '上海 闸北区 城区 99999', '31', 0.00, 1, 0.20, 0.00, 0.20, 0.00, 0.00, 0, 0.00, 0, NULL, 'weixin', 1573123599, 0, 0, NULL, NULL, NULL, NULL, NULL, 0.00, '', NULL, NULL, NULL, 1.00, 0.00, NULL, '', 1, 'fb07f53a51974b46863b57b9a6b543fd', NULL, 0, 0, 0, 0, 0.20, 0, 0, '', 0, 1, 1, 0, 0);
INSERT INTO `yx_store_order` VALUES (33, '20191107185008487', 12, 'hu', '15136175246', '上海 闸北区 城区 99999', '32', 0.00, 1, 0.20, 0.00, 0.20, 0.00, 0.00, 0, 0.00, 1, 1573124914, 'yue', 1573123808, 0, 0, NULL, NULL, NULL, NULL, NULL, 0.00, '', NULL, NULL, NULL, 1.00, 0.00, NULL, '', 0, 'be898332372b4d1dbea444d2f547a031', NULL, 0, 0, 0, 0, 0.20, 0, 0, '', 0, 1, 1, 0, 0);
INSERT INTO `yx_store_order` VALUES (34, '20191107185115070', 12, 'hu', '15136175246', '上海 闸北区 城区 99999', '33', 0.00, 1, 0.20, 0.00, 0.20, 0.00, 0.00, 0, 0.00, 1, 1573124900, 'yue', 1573123875, 0, 0, NULL, NULL, NULL, NULL, NULL, 0.00, '', NULL, NULL, NULL, 1.00, 0.00, NULL, '', 0, 'ef53cabfeff64a65b9c70ab5997d27ef', NULL, 0, 0, 0, 0, 0.20, 0, 0, '', 0, 1, 1, 0, 0);
INSERT INTO `yx_store_order` VALUES (35, '20191110180051521', 12, 'hu', '15136175246', '上海 闸北区 城区 99999', '34', 0.00, 1, 120.00, 0.00, 119.00, 0.00, 0.00, 2, 1.00, 1, 1573380051, 'yue', 1573380051, 0, 0, NULL, NULL, NULL, NULL, NULL, 0.00, '', NULL, NULL, NULL, 1.00, 0.00, NULL, '', 0, 'ff56e24a213c40a08381fb10f5e30de5', NULL, 0, 0, 0, 0, 100.00, 0, 0, '', 0, 1, 1, 0, 0);
INSERT INTO `yx_store_order` VALUES (36, '20191110183227714', 12, 'hu', '15136175246', '上海 闸北区 城区 99999', '36', 0.00, 1, 170.00, 0.00, 160.00, 0.00, 10.00, 0, 0.00, 1, 1573381947, 'yue', 1573381947, 1, 0, NULL, NULL, NULL, NULL, NULL, 0.00, 'STO', '申通快递', 'express', NULL, 1.00, 10.00, NULL, '', 0, '105e06edb7bf4113aff646a45b13abaa', NULL, 0, 0, 0, 0, 100.00, 0, 0, '', 0, 1, 1, 0, 0);
INSERT INTO `yx_store_order` VALUES (37, '20191113104022550', 14, 'zhang', '15136175247', '上海 静安区 城区 999', '37', 0.00, 1, 120.00, 0.00, 120.00, 0.00, 0.00, 0, 0.00, 1, 1573612822, 'yue', 1573612822, 2, 0, NULL, NULL, NULL, NULL, NULL, 0.00, '', '顺丰快递', 'express', '1111111', 1.00, 0.00, NULL, '', 0, 'db7d9878c8d2458587fb0441eba3bb55', NULL, 0, 0, 0, 0, 100.00, 0, 0, '', 0, 1, 1, 0, 0);
INSERT INTO `yx_store_order` VALUES (38, '20191116145425159', 12, 'hu', '15136175246', '上海 闸北区 城区 99999', '35', 0.00, 1, 120.00, 0.00, 119.00, 0.00, 0.00, 1, 1.00, 0, NULL, 'weixin', 1573887265, 0, 0, NULL, NULL, NULL, NULL, NULL, 0.00, '', NULL, NULL, NULL, 1.00, 0.00, NULL, '', 1, '5cc35fef31864f4ebe158e43f8e02699', NULL, 0, 0, 0, 0, 100.00, 0, 0, '', 0, 1, 1, 0, 0);
INSERT INTO `yx_store_order` VALUES (39, '20191116151201683', 14, 'zhang', '15136175247', '上海 静安区 城区 999', '42', 0.00, 1, 120.00, 0.00, 119.00, 0.00, 1.00, 0, 0.00, 0, NULL, 'weixin', 1573888321, 0, 0, NULL, NULL, NULL, NULL, NULL, 0.00, '', NULL, NULL, NULL, 1.00, 1.00, 1.00, '', 1, '84892a2626a341939dd05cd7f2adff9e', NULL, 0, 0, 0, 0, 100.00, 0, 0, '', 0, 1, 1, 0, 0);
INSERT INTO `yx_store_order` VALUES (42, '20191117163245197', 14, 'zhang', '15136175247', '上海 静安区 城区 999', '43', 0.00, 1, 120.00, 0.00, 120.00, 0.00, 0.00, 0, 0.00, 1, 1573979565, 'yue', 1573979565, 1, 0, NULL, NULL, NULL, NULL, NULL, 0.00, 'SF', '顺丰速运', 'express', '999999', 1.00, 0.00, NULL, '', 0, '89607a8b9e4d41a5ac2e380be796b24c', NULL, 0, 0, 0, 0, 100.00, 0, 0, '', 0, 1, 1, 0, 0);
INSERT INTO `yx_store_order` VALUES (43, '20191117163347781', 14, 'zhang', '15136175247', '上海 静安区 城区 999', '44', 0.00, 1, 120.00, 0.00, 120.00, 0.00, 0.00, 0, 0.00, 0, NULL, 'weixin', 1573979627, 0, 0, NULL, NULL, NULL, NULL, NULL, 0.00, '', NULL, NULL, NULL, 1.00, 0.00, NULL, '', 1, '0b25abb12d5c415b91255017598718cc', NULL, 0, 0, 0, 0, 100.00, 0, 0, '', 0, 1, 1, 0, 0);
INSERT INTO `yx_store_order` VALUES (44, '20191117164050025', 14, 'zhang', '15136175247', '上海 静安区 城区 999', '45', 0.00, 1, 120.00, 0.00, 120.00, 0.00, 0.00, 0, 0.00, 0, NULL, 'weixin', 1573980050, 0, 0, NULL, NULL, NULL, NULL, NULL, 0.00, '', NULL, NULL, NULL, 1.00, 0.00, NULL, '', 1, '997f4b8c66814853a43feb054897d1a7', NULL, 0, 0, 0, 0, 100.00, 0, 0, '', 0, 1, 1, 0, 0);
INSERT INTO `yx_store_order` VALUES (45, '20191117165632858', 14, 'zhang', '15136175247', '上海 静安区 城区 999', '46', 0.00, 1, 120.00, 0.00, 120.00, 0.00, 0.00, 0, 0.00, 0, NULL, 'weixin', 1573980992, 0, 0, NULL, NULL, NULL, NULL, NULL, 0.00, '', NULL, NULL, NULL, 1.00, 0.00, NULL, '', 1, 'cc2d97b4c6614c238f1b61c42e77190e', NULL, 0, 0, 0, 0, 100.00, 0, 0, '', 0, 1, 1, 0, 0);
INSERT INTO `yx_store_order` VALUES (46, '20191117170520086', 14, 'zhang', '15136175247', '上海 静安区 城区 999', '47', 0.00, 1, 120.00, 0.00, 120.00, 0.00, 0.00, 0, 0.00, 0, NULL, 'weixin', 1573981520, 0, 0, NULL, NULL, NULL, NULL, NULL, 0.00, '', NULL, NULL, NULL, 1.00, 0.00, NULL, '', 1, '387a2d1d5f4e4392b3f6fbd342e6611f', NULL, 0, 0, 0, 0, 100.00, 0, 0, '', 0, 1, 1, 0, 0);
INSERT INTO `yx_store_order` VALUES (47, '20191117170713328', 14, 'zhang', '15136175247', '上海 静安区 城区 999', '48', 0.00, 1, 120.00, 0.00, 120.00, 0.00, 0.00, 0, 0.00, 0, NULL, 'weixin', 1573981633, 0, 0, NULL, NULL, NULL, NULL, NULL, 0.00, '', NULL, NULL, NULL, 1.00, 0.00, NULL, '', 1, '8bf32f666e294f0abda5233c7c590cef', NULL, 0, 0, 0, 0, 100.00, 0, 0, '', 0, 1, 1, 0, 0);
INSERT INTO `yx_store_order` VALUES (48, '20191117172839669', 14, 'zhang', '15136175247', '上海 静安区 城区 999', '49', 0.00, 1, 120.00, 0.00, 120.00, 0.00, 0.00, 0, 0.00, 0, NULL, 'weixin', 1573982919, 0, 0, NULL, NULL, NULL, NULL, NULL, 0.00, '', NULL, NULL, NULL, 1.00, 0.00, NULL, '', 1, 'f1c2b58a236b48849d31701eb121334b', NULL, 0, 0, 0, 0, 100.00, 0, 0, '', 0, 1, 1, 0, 0);
INSERT INTO `yx_store_order` VALUES (49, '20191117173218008', 14, 'zhang', '15136175247', '上海 静安区 城区 999', '50', 0.00, 1, 120.00, 0.00, 120.00, 0.00, 0.00, 0, 0.00, 0, NULL, 'weixin', 1573983138, 0, 0, NULL, NULL, NULL, NULL, NULL, 0.00, '', NULL, NULL, NULL, 1.00, 0.00, NULL, '', 1, 'd7d1a4fa6e724b5a86c2eb88c3de0e03', NULL, 0, 0, 0, 0, 100.00, 0, 0, '', 0, 1, 1, 0, 0);
INSERT INTO `yx_store_order` VALUES (50, '20191117175447409', 14, 'zhang', '15136175247', '上海 静安区 城区 999', '51', 0.00, 1, 120.00, 0.00, 120.00, 0.00, 0.00, 0, 0.00, 0, NULL, 'weixin', 1573984487, 0, 0, NULL, NULL, NULL, NULL, NULL, 0.00, '', NULL, NULL, NULL, 1.00, 0.00, NULL, '', 1, '116bf0d72d104b148d7ba0cc96922af8', NULL, 0, 0, 0, 0, 100.00, 0, 0, '', 0, 1, 1, 0, 0);
INSERT INTO `yx_store_order` VALUES (51, '20191117175622269', 14, 'zhang', '15136175247', '上海 静安区 城区 999', '52', 0.00, 1, 120.00, 0.00, 120.00, 0.00, 0.00, 0, 0.00, 0, NULL, 'weixin', 1573984582, 0, 0, NULL, NULL, NULL, NULL, NULL, 0.00, '', NULL, NULL, NULL, 1.00, 0.00, NULL, '', 1, '419e8957ddc0486d93e9a02ea3856ae8', NULL, 0, 0, 0, 0, 100.00, 0, 0, '', 0, 1, 1, 0, 0);
INSERT INTO `yx_store_order` VALUES (52, '20191117175753662', 14, 'zhang', '15136175247', '上海 静安区 城区 999', '53', 0.00, 1, 120.00, 0.00, 120.00, 0.00, 0.00, 0, 0.00, 0, NULL, 'weixin', 1573984673, 0, 0, NULL, NULL, NULL, NULL, NULL, 0.00, '', NULL, NULL, NULL, 1.00, 0.00, NULL, '', 1, '6f6b298cb58a4ddd8b29c0aa6b87e26b', NULL, 0, 0, 0, 0, 100.00, 0, 0, '', 0, 1, 1, 0, 0);
INSERT INTO `yx_store_order` VALUES (53, '20191117180545594', 14, 'zhang', '15136175247', '上海 静安区 城区 999', '54', 0.00, 1, 120.00, 0.00, 120.00, 0.00, 0.00, 0, 0.00, 0, NULL, 'weixin', 1573985145, 0, 0, NULL, NULL, NULL, NULL, NULL, 0.00, '', NULL, NULL, NULL, 1.00, 0.00, NULL, '', 1, 'd9603215461546cd9e7b8137ce22b63a', NULL, 0, 0, 0, 0, 100.00, 0, 0, '', 0, 1, 1, 0, 0);
INSERT INTO `yx_store_order` VALUES (54, '20191117180730457', 14, 'zhang', '15136175247', '上海 静安区 城区 999', '55', 0.00, 1, 120.00, 0.00, 120.00, 0.00, 0.00, 0, 0.00, 0, NULL, 'weixin', 1573985250, 0, 0, NULL, NULL, NULL, NULL, NULL, 0.00, '', NULL, NULL, NULL, 1.00, 0.00, NULL, '', 1, '80a4d256df4640a5b9eec8d652be3b7d', NULL, 0, 0, 0, 0, 100.00, 0, 0, '', 0, 1, 1, 0, 0);
INSERT INTO `yx_store_order` VALUES (55, '20191117180950303', 14, 'zhang', '15136175247', '上海 静安区 城区 999', '56', 0.00, 1, 120.00, 0.00, 120.00, 0.00, 0.00, 0, 0.00, 0, NULL, 'weixin', 1573985390, 0, 0, NULL, NULL, NULL, NULL, NULL, 0.00, '', NULL, NULL, NULL, 1.00, 0.00, NULL, '', 1, 'c0af62b2a50f4660862aa1da960ae400', NULL, 0, 0, 0, 0, 100.00, 0, 0, '', 0, 1, 1, 0, 0);
INSERT INTO `yx_store_order` VALUES (56, '20191117181915552', 14, 'zhang', '15136175247', '上海 静安区 城区 999', '57', 0.00, 1, 120.00, 0.00, 120.00, 0.00, 0.00, 0, 0.00, 0, NULL, 'weixin', 1573985955, 0, 0, NULL, NULL, NULL, NULL, NULL, 0.00, '', NULL, NULL, NULL, 1.00, 0.00, NULL, '', 1, 'c53e1d0669da4fc5b12bd0fbc9f70a86', NULL, 0, 0, 0, 0, 100.00, 0, 0, '', 0, 1, 1, 0, 0);
INSERT INTO `yx_store_order` VALUES (57, '20191117184108757', 14, 'zhang', '15136175247', '上海 静安区 城区 999', '58', 0.00, 1, 120.00, 0.00, 120.00, 0.00, 0.00, 0, 0.00, 0, NULL, 'weixin', 1573987268, 0, 0, NULL, NULL, NULL, NULL, NULL, 0.00, '', NULL, NULL, NULL, 1.00, 0.00, NULL, '', 1, '1b0af2d52a864679a1fe5649ef455cd0', NULL, 0, 0, 0, 0, 100.00, 0, 0, '', 0, 1, 1, 0, 0);
INSERT INTO `yx_store_order` VALUES (58, '20191117185342145', 14, 'zhang', '15136175247', '上海 静安区 城区 999', '59', 0.00, 1, 120.00, 0.00, 120.00, 0.00, 0.00, 0, 0.00, 0, NULL, 'weixin', 1573988022, 0, 0, NULL, NULL, NULL, NULL, NULL, 0.00, '', NULL, NULL, NULL, 1.00, 0.00, NULL, '', 1, '51bdce0f229f44a8ae65c25e4718f408', NULL, 0, 0, 0, 0, 100.00, 0, 0, '', 0, 1, 1, 0, 0);
INSERT INTO `yx_store_order` VALUES (59, '20191117185432953', 14, 'zhang', '15136175247', '上海 静安区 城区 999', '60', 0.00, 1, 120.00, 0.00, 120.00, 0.00, 0.00, 0, 0.00, 0, NULL, 'weixin', 1573988072, 0, 0, NULL, NULL, NULL, NULL, NULL, 0.00, '', NULL, NULL, NULL, 1.00, 0.00, NULL, '', 1, 'adc2a9b7f64940ea89d1f91b1b2f65c8', NULL, 0, 0, 0, 0, 100.00, 0, 0, '', 0, 1, 1, 0, 0);
INSERT INTO `yx_store_order` VALUES (60, '20191117191949005', 14, 'zhang', '15136175247', '上海 静安区 城区 999', '61', 0.00, 1, 120.00, 0.00, 120.00, 0.00, 0.00, 0, 0.00, 0, NULL, 'weixin', 1573989589, 0, 0, NULL, NULL, NULL, NULL, NULL, 0.00, '', NULL, NULL, NULL, 1.00, 0.00, NULL, '', 1, 'dfa907c582e84696a1e31069907058c6', NULL, 0, 0, 0, 0, 100.00, 0, 0, '', 0, 1, 1, 0, 0);
INSERT INTO `yx_store_order` VALUES (61, '20191117195636214', 14, 'zhang', '15136175247', '上海 静安区 城区 999', '62', 0.00, 1, 120.00, 0.00, 120.00, 0.00, 0.00, 0, 0.00, 1, 1573991796, 'yue', 1573991796, 1, 0, NULL, NULL, NULL, NULL, NULL, 0.00, 'SF', '顺丰速运', 'express', '99999', 1.00, 0.00, NULL, '', 0, 'a6a7f299f0c4460ab90a01558581ddec', NULL, 0, 0, 0, 0, 100.00, 0, 0, '', 0, 1, 1, 0, 0);
INSERT INTO `yx_store_order` VALUES (62, '20191117195746607', 14, 'zhang', '15136175247', '上海 静安区 城区 999', '63', 0.00, 1, 120.00, 0.00, 120.00, 0.00, 0.00, 0, 0.00, 0, NULL, 'weixin', 1573991866, 0, 0, NULL, NULL, NULL, NULL, NULL, 0.00, '', NULL, NULL, NULL, 1.00, 0.00, NULL, '', 1, '5e5a3b127cc14e64a6c4a7a75f525187', NULL, 0, 0, 0, 0, 100.00, 0, 0, '', 0, 1, 1, 0, 0);
INSERT INTO `yx_store_order` VALUES (63, '20191117200249481', 14, 'zhang', '15136175247', '上海 静安区 城区 999', '64', 0.00, 1, 120.00, 0.00, 120.00, 0.00, 0.00, 0, 0.00, 0, NULL, 'weixin', 1573992169, 0, 0, NULL, NULL, NULL, NULL, NULL, 0.00, '', NULL, NULL, NULL, 1.00, 0.00, NULL, '', 1, '38d23b945d7649d89176a55ebfa2cd0b', NULL, 0, 0, 0, 0, 100.00, 0, 0, '', 0, 1, 1, 0, 0);
INSERT INTO `yx_store_order` VALUES (64, '20191117201129097', 14, 'zhang', '15136175247', '上海 静安区 城区 999', '65', 0.00, 1, 120.00, 0.00, 120.00, 0.00, 0.00, 0, 0.00, 0, NULL, 'weixin', 1573992689, 0, 0, NULL, NULL, NULL, NULL, NULL, 0.00, '', NULL, NULL, NULL, 1.00, 0.00, NULL, '', 1, 'd873176e7c2d4e9f811f01c92c14d6cd', NULL, 0, 0, 0, 0, 100.00, 0, 0, '', 0, 1, 1, 0, 0);
INSERT INTO `yx_store_order` VALUES (66, '20191117210807397', 14, 'zhang', '15136175247', '上海 静安区 城区 999', '66', 0.00, 1, 120.00, 0.00, 120.00, 0.00, 0.00, 0, 0.00, 0, NULL, 'weixin', 1573996087, 0, 0, NULL, NULL, NULL, NULL, NULL, 0.00, '', NULL, NULL, NULL, 1.00, 0.00, NULL, '', 1, '3736d4b5d9064ddca5904b1c8bb46d32', NULL, 0, 0, 0, 0, 100.00, 0, 0, '', 0, 1, 1, 0, 0);
INSERT INTO `yx_store_order` VALUES (67, '20191117211003977', 14, 'zhang', '15136175247', '上海 静安区 城区 999', '67', 0.00, 1, 120.00, 0.00, 120.00, 0.00, 0.00, 0, 0.00, 1, 1573996204, 'yue', 1573996203, 1, 0, NULL, NULL, NULL, NULL, NULL, 0.00, 'SF', '顺丰速运', 'express', '444444', 1.00, 0.00, NULL, '', 0, '2c8d6ea861f24e52a0ad0d464c35b60d', NULL, 0, 0, 0, 0, 100.00, 0, 0, '', 0, 1, 1, 0, 0);
INSERT INTO `yx_store_order` VALUES (68, '20191117211348778', 14, 'zhang', '15136175247', '上海 静安区 城区 999', '68', 0.00, 1, 120.00, 0.00, 120.00, 0.00, 0.00, 0, 0.00, 1, 1573996429, 'yue', 1573996428, 2, 0, NULL, NULL, NULL, NULL, NULL, 0.00, '', '顺丰快递', 'express', '99999999', 1.00, 0.00, NULL, '', 0, '9216e6ba59de4a969f5be7ca69469f7e', NULL, 0, 0, 0, 0, 100.00, 0, 0, '', 0, 1, 1, 0, 0);
INSERT INTO `yx_store_order` VALUES (75, '20191117215755011', 14, 'zhang', '15136175247', '上海 静安区 城区 999', '69', 0.00, 1, 120.00, 0.00, 120.00, 0.00, 0.00, 0, 0.00, 0, NULL, 'weixin', 1573999075, 0, 0, NULL, NULL, NULL, NULL, NULL, 0.00, '', NULL, NULL, NULL, 1.00, 0.00, NULL, '', 1, 'e0930d3bed624476b0c540e4191c5eb9', NULL, 0, 0, 0, 0, 100.00, 0, 0, '', 0, 1, 1, 0, 0);
INSERT INTO `yx_store_order` VALUES (76, '20191117220023803', 14, 'zhang', '15136175247', '上海 静安区 城区 999', '70', 0.00, 1, 120.00, 0.00, 120.00, 0.00, 0.00, 0, 0.00, 0, NULL, 'weixin', 1573999223, 0, 0, NULL, NULL, NULL, NULL, NULL, 0.00, '', NULL, NULL, NULL, 1.00, 0.00, NULL, '', 1, 'c34ab48907b24ecf955ae813b1710925', NULL, 0, 0, 0, 0, 100.00, 0, 0, '', 0, 1, 1, 0, 0);
INSERT INTO `yx_store_order` VALUES (77, '20191117220257428', 14, 'zhang', '15136175247', '上海 静安区 城区 999', '71', 0.00, 1, 120.00, 0.00, 120.00, 0.00, 0.00, 0, 0.00, 0, NULL, 'weixin', 1573999377, 0, 0, NULL, NULL, NULL, NULL, NULL, 0.00, '', NULL, NULL, NULL, 1.00, 0.00, NULL, '', 1, '77f76142e315479282a9c866e001e9ac', NULL, 0, 0, 0, 0, 100.00, 0, 0, '', 0, 1, 1, 0, 0);
INSERT INTO `yx_store_order` VALUES (78, '20191117220546233', 14, 'zhang', '15136175247', '上海 静安区 城区 999', '72', 0.00, 1, 120.00, 0.00, 120.00, 0.00, 0.00, 0, 0.00, 0, NULL, 'weixin', 1573999546, 0, 0, NULL, NULL, NULL, NULL, NULL, 0.00, '', NULL, NULL, NULL, 1.00, 0.00, NULL, '', 1, '2d2c8a6de9a442fc864cb76ca705c216', NULL, 0, 0, 0, 0, 100.00, 0, 0, '', 0, 1, 1, 0, 0);
INSERT INTO `yx_store_order` VALUES (79, '20191117220758627', 14, 'zhang', '15136175247', '上海 静安区 城区 999', '73', 0.00, 1, 120.00, 0.00, 120.00, 0.00, 0.00, 0, 0.00, 0, NULL, 'weixin', 1573999678, 0, 0, NULL, NULL, NULL, NULL, NULL, 0.00, '', NULL, NULL, NULL, 1.00, 0.00, NULL, '', 1, 'e1dfcb231c5c4617a531a12889f6b5db', NULL, 0, 0, 0, 0, 100.00, 0, 0, '', 0, 1, 1, 0, 0);
INSERT INTO `yx_store_order` VALUES (80, '20191117221535800', 14, 'zhang', '15136175247', '上海 静安区 城区 999', '74', 0.00, 1, 120.00, 0.00, 120.00, 0.00, 0.00, 0, 0.00, 0, NULL, 'weixin', 1574000135, 0, 0, NULL, NULL, NULL, NULL, NULL, 0.00, '', NULL, NULL, NULL, 1.00, 0.00, NULL, '', 1, '2ba90ad69960433e898136b4a5d3db41', NULL, 0, 0, 0, 0, 100.00, 0, 0, '', 0, 1, 1, 0, 0);
INSERT INTO `yx_store_order` VALUES (81, '20191117222011401', 14, 'zhang', '15136175247', '上海 静安区 城区 999', '75', 0.00, 1, 120.00, 0.00, 120.00, 0.00, 0.00, 0, 0.00, 0, NULL, 'weixin', 1574000411, 0, 0, NULL, NULL, NULL, NULL, NULL, 0.00, '', NULL, NULL, NULL, 1.00, 0.00, NULL, '', 1, 'fbf985955e3f425aa2b45a3440a17017', NULL, 0, 0, 0, 0, 100.00, 0, 0, '', 0, 1, 1, 0, 0);
INSERT INTO `yx_store_order` VALUES (82, '20191117223048392', 14, 'zhang', '15136175247', '上海 静安区 城区 999', '76', 0.00, 1, 120.00, 0.00, 120.00, 0.00, 0.00, 0, 0.00, 0, NULL, 'weixin', 1574001048, 0, 0, NULL, NULL, NULL, NULL, NULL, 0.00, '', NULL, NULL, NULL, 1.00, 0.00, NULL, '', 1, '5132e7f05e394b4ba96a2fc974886412', NULL, 0, 0, 0, 0, 100.00, 0, 0, '', 0, 1, 1, 0, 0);
INSERT INTO `yx_store_order` VALUES (83, '20191117223320049', 14, 'zhang', '15136175247', '上海 静安区 城区 999', '77', 0.00, 1, 120.00, 0.00, 120.00, 0.00, 0.00, 0, 0.00, 0, NULL, 'weixin', 1574001200, 0, 0, NULL, NULL, NULL, NULL, NULL, 0.00, '', NULL, NULL, NULL, 1.00, 0.00, NULL, '', 1, '43e6c4938cf246eea99736227d57073a', NULL, 0, 0, 0, 0, 100.00, 0, 0, '', 0, 1, 1, 0, 0);
INSERT INTO `yx_store_order` VALUES (84, '20191117223503585', 14, 'zhang', '15136175247', '上海 静安区 城区 999', '78', 0.00, 1, 120.00, 0.00, 120.00, 0.00, 0.00, 0, 0.00, 0, NULL, 'weixin', 1574001303, 0, 0, NULL, NULL, NULL, NULL, NULL, 0.00, '', NULL, NULL, NULL, 1.00, 0.00, NULL, '', 1, 'd69ad9182ce44fe9b5a789e701428e17', NULL, 0, 0, 0, 0, 100.00, 0, 0, '', 0, 1, 1, 0, 0);
INSERT INTO `yx_store_order` VALUES (85, '20191118091147010', 14, 'zhang', '15136175247', '上海 静安区 城区 999', '79', 0.00, 1, 120.00, 0.00, 120.00, 0.00, 0.00, 0, 0.00, 0, NULL, 'weixin', 1574039507, 0, 0, NULL, NULL, NULL, NULL, NULL, 0.00, '', NULL, NULL, NULL, 1.00, 0.00, NULL, '', 1, 'dde3e744ac754e0cbff630d4124b3264', NULL, 0, 0, 0, 0, 100.00, 0, 0, '', 0, 1, 1, 0, 0);
INSERT INTO `yx_store_order` VALUES (86, '20191118092248659', 14, 'zhang', '15136175247', '上海 静安区 城区 999', '80', 0.00, 1, 120.00, 0.00, 120.00, 0.00, 0.00, 0, 0.00, 0, NULL, 'weixin', 1574040168, 0, 0, NULL, NULL, NULL, NULL, NULL, 0.00, '', NULL, NULL, NULL, 1.00, 0.00, NULL, '', 1, '2b31ac7ae31540569ba10db538aed627', NULL, 0, 0, 0, 0, 100.00, 0, 0, '', 0, 1, 1, 0, 0);
INSERT INTO `yx_store_order` VALUES (87, '20191118093545580', 14, 'zhang', '15136175247', '上海 静安区 城区 999', '81', 0.00, 1, 120.00, 0.00, 120.00, 0.00, 0.00, 0, 0.00, 0, NULL, 'weixin', 1574040945, 0, 0, NULL, NULL, NULL, NULL, NULL, 0.00, '', NULL, NULL, NULL, 1.00, 0.00, NULL, '', 1, 'e859607310ec47eb8aaec87956a0cc1b', NULL, 0, 0, 0, 0, 100.00, 0, 0, '', 0, 1, 1, 0, 0);
INSERT INTO `yx_store_order` VALUES (88, '20191118101528735', 14, 'zhang', '15136175247', '上海 静安区 城区 999', '82', 0.00, 1, 120.00, 0.00, 120.00, 0.00, 0.00, 0, 0.00, 0, NULL, 'weixin', 1574043328, 0, 0, NULL, NULL, NULL, NULL, NULL, 0.00, '', NULL, NULL, NULL, 1.00, 0.00, NULL, '', 1, 'e9b44d207cc249d4a505b8b809e17789', NULL, 0, 0, 0, 0, 100.00, 0, 0, '', 0, 1, 1, 0, 0);
INSERT INTO `yx_store_order` VALUES (91, '20191120180255448', 12, 'hu', '15136175246', '上海 闸北区 城区 99999', '85', 0.00, 1, 120.00, 0.00, 120.00, 0.00, 0.00, 0, 0.00, 1, 1574244175, 'yue', 1574244175, -1, 2, NULL, NULL, 1574326954, '拼团取消开团', NULL, 120.00, '', NULL, NULL, NULL, 1.00, 0.00, NULL, '', 0, '63975e6c877541008bf8338044920085', NULL, 0, 0, 2, 1, 0.20, 0, 0, '', 0, 1, 1, 0, 0);
INSERT INTO `yx_store_order` VALUES (92, '20191121170829222', 12, 'hu', '15136175246', '上海 闸北区 城区 99999', '86', 0.00, 1, 1.00, 0.00, 1.00, 0.00, 0.00, 0, 0.00, 1, 1574327309, 'yue', 1574327309, 1, 0, NULL, NULL, NULL, NULL, NULL, 0.00, 'ZTO', '中通快递', 'express', '9999999', 0.00, 0.00, NULL, '', 0, 'd0c1574db2da4ee5a714223e30b00431', NULL, 0, 0, 2, 2, 0.00, 0, 0, '', 0, 1, 1, 0, 0);
INSERT INTO `yx_store_order` VALUES (93, '20191121174323679', 11, '胡鹏', '15139175246', '重庆 荣昌县 广顺镇 999', '87', 0.00, 1, 1.00, 0.00, 1.00, 0.00, 0.00, 0, 0.00, 1, 1574329404, 'yue', 1574329403, 1, 0, NULL, NULL, NULL, NULL, NULL, 0.00, '', '顺丰快递', 'express', '9669999', 0.00, 0.00, NULL, '', 0, 'd59ebdae5a4b457b910c366c1f5e5d61', NULL, 0, 0, 2, 2, 0.00, 0, 0, '', 0, 1, 1, 0, 0);
INSERT INTO `yx_store_order` VALUES (96, '20191122202407197', 12, 'hu', '15136175246', '上海 闸北区 城区 99999', '88', 0.00, 1, 1.00, 0.00, 1.00, 0.00, 0.00, 0, 0.00, 1, 1574425447, 'yue', 1574425447, 3, 0, NULL, NULL, NULL, NULL, NULL, 0.00, '', '顺丰快递', 'express', '99999', 0.00, 0.00, NULL, '', 0, '69c1587a72364eb1b14dc51173511b17', NULL, 0, 0, 2, 4, 0.00, 0, 0, '', 0, 1, 1, 0, 0);
INSERT INTO `yx_store_order` VALUES (97, '20191130142549154', 12, 'hu', '15136175246', '上海 闸北区 城区 99999', '89', 0.00, 1, 120.00, 0.00, 120.00, 0.00, 0.00, 0, 0.00, 0, NULL, 'weixin', 1575095149, 0, 0, NULL, NULL, NULL, NULL, NULL, 0.00, '', NULL, NULL, NULL, 1.00, 0.00, NULL, '', 1, 'e12352b189954c35bac63da6698ff8a3', NULL, 0, 0, 0, 0, 100.00, 0, 0, '', 0, 1, 1, 0, 0);
INSERT INTO `yx_store_order` VALUES (98, '20191130142917149', 12, 'hu', '15136175246', '上海 闸北区 城区 99999', '90', 0.00, 1, 120.00, 0.00, 120.00, 0.00, 0.00, 0, 0.00, 0, NULL, 'weixin', 1575095357, 0, 0, NULL, NULL, NULL, NULL, NULL, 0.00, '', NULL, NULL, NULL, 1.00, 0.00, NULL, '', 1, '42fa607a1bf243e8b797767c81be8950', NULL, 0, 0, 0, 0, 100.00, 0, 0, '', 0, 1, 1, 0, 0);
INSERT INTO `yx_store_order` VALUES (99, '20191208101834125', 12, 'hu', '15136175246', '上海 闸北区 城区 99999', '95', 0.00, 1, 118.80, 0.00, 118.80, 0.00, 0.00, 0, 0.00, 1, 1575771514, 'yue', 1575771514, 1, 0, NULL, NULL, NULL, NULL, NULL, 0.00, 'STO', '申通快递', 'express', '773002763618907', 1.00, 0.00, NULL, '', 0, 'ffe728984deb4fde9efc3ff9ce900bfb', NULL, 0, 0, 0, 0, 100.00, 0, 0, '', 0, 1, 1, 0, 0);
INSERT INTO `yx_store_order` VALUES (100, '20191213185147846', 12, 'hu', '15136175246', '上海 闸北区 城区 99999', '96', 0.00, 1, 118.80, 0.00, 118.80, 0.00, 0.00, 0, 0.00, 1, 1576234308, 'yue', 1576234307, 0, 0, NULL, NULL, NULL, NULL, NULL, 0.00, '', NULL, NULL, NULL, 1.00, 0.00, NULL, '', 0, '6f7c8d3152d9432b96b0144f56cfa97f', NULL, 0, 0, 0, 0, 100.00, 0, 0, '', 0, 1, 1, 0, 0);
INSERT INTO `yx_store_order` VALUES (101, '20191217144936011', 12, 'hu', '15136175246', '上海 闸北区 城区 99999', '99', 0.00, 1, 1.00, 0.00, 1.00, 0.00, 0.00, 0, 0.00, 1, 1576565376, 'yue', 1576565376, 0, 0, NULL, NULL, NULL, NULL, NULL, 0.00, '', NULL, NULL, NULL, 0.00, 0.00, NULL, '', 0, '6f7494dc75e64d76a9c47b5caeb6a6cd', NULL, 0, 0, 0, 0, 0.50, 2, 0, '', 0, 1, 1, 0, 0);
INSERT INTO `yx_store_order` VALUES (102, '20191223152924608', 12, 'hu', '15136175246', '上海 闸北区 城区 99999', '103', 0.00, 1, 1.00, 0.00, 1.00, 0.00, 0.00, 0, 0.00, 1, 1577086164, 'yue', 1577086164, 0, 0, NULL, NULL, NULL, NULL, NULL, 0.00, '', NULL, NULL, NULL, 0.00, 0.00, NULL, '', 0, 'b3aef09833a749f2951461c230e809a9', NULL, 0, 0, 0, 0, 50.00, 0, 1, '', 0, 1, 1, 0, 0);
INSERT INTO `yx_store_order` VALUES (103, '20191226152431045', 12, 'hu', '15136175246', '上海 闸北区 城区 99999', '97', 0.00, 1, 118.80, 0.00, 118.80, 0.00, 0.00, 0, 0.00, 1, 1577345071, 'yue', 1577345071, 0, 0, '', '555', 1577586729, '收货地址填错了', NULL, 0.00, '', NULL, NULL, NULL, 1.00, 0.00, NULL, '', 0, 'c5edfdefa8614eac8b555545d248ccbc', NULL, 0, 0, 0, 0, 100.00, 0, 0, '', 0, 1, 1, 0, 0);
INSERT INTO `yx_store_order` VALUES (104, '20191227182216663', 12, 'hu', '15136175246', '上海 闸北区 城区 99999', '104', 0.00, 1, 0.50, 0.00, 0.00, 0.00, 0.50, 0, 0.00, 1, 1577442136, 'yue', 1577442136, 0, 2, '', '33333', 1577586499, '收货地址填错了', NULL, 0.00, '', NULL, NULL, NULL, 0.00, 0.50, NULL, '', 0, '25f5693f8e82419bba4f581af126dc47', NULL, 0, 0, 0, 0, 0.50, 0, 0, '', 0, 1, 1, 0, 0);
INSERT INTO `yx_store_order` VALUES (105, '191229CD16HWC0ZC', 12, 'hu', '15136175246', '上海 闸北区 城区 99999', '105', 0.00, 1, 118.80, 0.00, 118.80, 0.00, 0.00, 0, 0.00, 1, 1577611680, 'yue', 1577611680, 0, 0, NULL, NULL, NULL, NULL, NULL, 0.00, '', NULL, NULL, NULL, 1.00, 0.00, NULL, '', 0, '63576ad9de2e4575a5c29a78f4458ebc', '备注2222', 0, 0, 0, 0, 100.00, 0, 0, '', 0, 1, 1, 0, 0);
INSERT INTO `yx_store_order` VALUES (106, '191231AFS407HNXP', 12, 'hu', '15136175246', '上海 闸北区 城区 99999', '106', 0.00, 1, 118.80, 0.00, 118.80, 0.00, 0.00, 0, 0.00, 1, 1577774706, 'yue', 1577774706, 0, 0, NULL, NULL, NULL, NULL, NULL, 0.00, '', NULL, NULL, NULL, 1.00, 0.00, NULL, '99999999', 0, 'ecc50362d82d4fb9be6b9ee5eabea2df', NULL, 0, 0, 0, 0, 100.00, 0, 0, '', 0, 1, 1, 0, 0);
INSERT INTO `yx_store_order` VALUES (107, '200101HASMPA74DP', 12, 'hu', '15136175246', '上海 闸北区 城区 99999', '107', 0.00, 1, 118.80, 0.00, 118.80, 0.00, 0.00, 0, 0.00, 0, NULL, 'weixin', 1577890654, 0, 0, NULL, NULL, NULL, NULL, NULL, 0.00, '', NULL, NULL, NULL, 1.00, 0.00, NULL, '', 1, '157bc0123dec4372af5566327b89b9f7', NULL, 0, 0, 0, 0, 100.00, 0, 0, '', 0, 1, 1, 0, 0);

-- ----------------------------
-- Table structure for yx_store_order_cart_info
-- ----------------------------
DROP TABLE IF EXISTS `yx_store_order_cart_info`;
CREATE TABLE `yx_store_order_cart_info`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `oid` int(11) UNSIGNED NOT NULL COMMENT '订单id',
  `cart_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '购物车id',
  `product_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '商品ID',
  `cart_info` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '购买东西的详细信息',
  `unique` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '唯一id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `oid`(`oid`, `unique`) USING BTREE,
  INDEX `cart_id`(`cart_id`) USING BTREE,
  INDEX `product_id`(`product_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 104 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单购物详情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of yx_store_order_cart_info
-- ----------------------------
INSERT INTO `yx_store_order_cart_info` VALUES (22, 24, 21, 19, '{\"addTime\":1573110327,\"productId\":19,\"seckillId\":0,\"vipTruePrice\":0.2,\"combinationId\":0,\"costPrice\":0.2,\"trueStock\":1,\"truePrice\":0.2,\"type\":\"product\",\"cartNum\":1,\"productInfo\":{\"otPrice\":0.50,\"userCollect\":false,\"description\":\"<p style=\\\"text-align: center;\\\"><strong>文件请传QQ2412733099，</strong></p><p style=\\\"text-align: center;\\\"><strong>718504558或2412733099@qq.com邮箱，</strong></p><p style=\\\"text-align: center;\\\"><strong>手机/微信：13733990583</strong></p><p style=\\\"text-align: center;\\\"><strong>量大请联系店主，一定让您满意而归</strong></p><p style=\\\"text-align: center;\\\"><strong>&nbsp; &nbsp;实体店面经营 保质保量</strong></p><p style=\\\"text-align: center;\\\"><strong>A4黑白2毛/张，量大1毛/张，</strong></p><p style=\\\"text-align: center;\\\"><strong>A3黑白双面5毛/张，量大3毛/张，</strong></p><p style=\\\"text-align: center;\\\"><strong>更大量请联系店主报价，</strong></p><p style=\\\"text-align: center;\\\"><strong>每消费1元可积1分，1分抵现金1毛，</strong></p><p style=\\\"text-align: center;\\\"><strong>付款时直接抵扣</strong></p><p style=\\\"text-align: center;\\\"><strong>（如此优惠的基础上还可积分，积分抵现金）</strong></p><p style=\\\"text-align: left;\\\"><strong><br></strong></p><p><br></p><p>&nbsp; &nbsp;&nbsp;<img src=\\\"https://image.dayouqiantu.cn/5ca03007150f1.jpg\\\" style=\\\"max-width: 100%;\\\"><br></p>\",\"merUse\":0,\"isPostage\":1,\"image_base\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"isBest\":1,\"sales\":1,\"price\":0.20,\"isBargain\":0,\"userLike\":false,\"vipPrice\":0.20,\"storeName\":\"70gA4黑白打印复印\",\"id\":19,\"keyword\":\"打印复印\",\"stock\":99,\"image\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"cost\":0.20,\"isGood\":1,\"unitName\":\"张\",\"isBenefit\":1,\"giveIntegral\":1.00,\"isNew\":1,\"sort\":1,\"sliderImageArr\":[\"https://image.dayouqiantu.cn/5ca01c7fc9238.jpg\",\"https://image.dayouqiantu.cn/5ca01c7676042.jpg\"],\"sliderImage\":\"https://image.dayouqiantu.cn/5ca01c7fc9238.jpg,https://image.dayouqiantu.cn/5ca01c7676042.jpg\",\"barCode\":\"\",\"isShow\":1,\"postage\":0.00,\"codePath\":\"\",\"soureLink\":\"\",\"cateId\":\"24\",\"isSeckill\":0,\"storeInfo\":\"打印复印资料A4黑白彩色印刷画册书本装订图文数码快印服务\",\"isDel\":0,\"isHot\":1,\"attrInfo\":{\"image\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"cost\":0.20,\"productId\":19,\"price\":0.20,\"unique\":\"b2f53a706c0646ce93e5df0b44350b35\",\"suk\":\"A1,白色\",\"id\":14,\"stock\":1}},\"uid\":10,\"productAttrUnique\":\"b2f53a706c0646ce93e5df0b44350b35\",\"bargainId\":0,\"id\":21}', '9f0a08deeec34114bbe70d6322b5bb13');
INSERT INTO `yx_store_order_cart_info` VALUES (23, 25, 23, 19, '{\"addTime\":1573118876,\"productId\":19,\"seckillId\":0,\"vipTruePrice\":0.2,\"combinationId\":0,\"costPrice\":0.2,\"trueStock\":999,\"truePrice\":0.2,\"type\":\"product\",\"cartNum\":1,\"productInfo\":{\"otPrice\":0.50,\"userCollect\":false,\"description\":\"<p style=\\\"text-align: center;\\\"><strong>文件请传QQ2412733099，</strong></p><p style=\\\"text-align: center;\\\"><strong>718504558或2412733099@qq.com邮箱，</strong></p><p style=\\\"text-align: center;\\\"><strong>手机/微信：13733990583</strong></p><p style=\\\"text-align: center;\\\"><strong>量大请联系店主，一定让您满意而归</strong></p><p style=\\\"text-align: center;\\\"><strong>&nbsp; &nbsp;实体店面经营 保质保量</strong></p><p style=\\\"text-align: center;\\\"><strong>A4黑白2毛/张，量大1毛/张，</strong></p><p style=\\\"text-align: center;\\\"><strong>A3黑白双面5毛/张，量大3毛/张，</strong></p><p style=\\\"text-align: center;\\\"><strong>更大量请联系店主报价，</strong></p><p style=\\\"text-align: center;\\\"><strong>每消费1元可积1分，1分抵现金1毛，</strong></p><p style=\\\"text-align: center;\\\"><strong>付款时直接抵扣</strong></p><p style=\\\"text-align: center;\\\"><strong>（如此优惠的基础上还可积分，积分抵现金）</strong></p><p style=\\\"text-align: left;\\\"><strong><br></strong></p><p><br></p><p>&nbsp; &nbsp;&nbsp;<img src=\\\"https://image.dayouqiantu.cn/5ca03007150f1.jpg\\\" style=\\\"max-width: 100%;\\\"><br></p>\",\"merUse\":0,\"isPostage\":1,\"image_base\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"isBest\":1,\"sales\":2,\"price\":0.20,\"isBargain\":0,\"userLike\":false,\"vipPrice\":0.20,\"storeName\":\"70gA4黑白打印复印\",\"id\":19,\"keyword\":\"打印复印\",\"stock\":99,\"image\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"cost\":0.20,\"isGood\":1,\"unitName\":\"张\",\"isBenefit\":1,\"giveIntegral\":1.00,\"isNew\":1,\"sort\":1,\"sliderImageArr\":[\"https://image.dayouqiantu.cn/5ca01c7fc9238.jpg\",\"https://image.dayouqiantu.cn/5ca01c7676042.jpg\"],\"sliderImage\":\"https://image.dayouqiantu.cn/5ca01c7fc9238.jpg,https://image.dayouqiantu.cn/5ca01c7676042.jpg\",\"barCode\":\"\",\"isShow\":1,\"postage\":0.00,\"codePath\":\"\",\"soureLink\":\"\",\"cateId\":\"24\",\"isSeckill\":0,\"storeInfo\":\"打印复印资料A4黑白彩色印刷画册书本装订图文数码快印服务\",\"isDel\":0,\"isHot\":1,\"attrInfo\":{\"image\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"cost\":0.20,\"productId\":19,\"price\":0.20,\"unique\":\"74d02ea6a57a46979a999457d8819421\",\"suk\":\"A4,白色\",\"id\":20,\"stock\":999}},\"uid\":7,\"productAttrUnique\":\"74d02ea6a57a46979a999457d8819421\",\"bargainId\":0,\"id\":23}', 'a6845f54a0d14bd0b6b26cd153e0f3a6');
INSERT INTO `yx_store_order_cart_info` VALUES (24, 26, 24, 19, '{\"addTime\":1573119028,\"productId\":19,\"seckillId\":0,\"vipTruePrice\":0.2,\"combinationId\":0,\"costPrice\":0.2,\"trueStock\":999,\"truePrice\":0.2,\"type\":\"product\",\"cartNum\":1,\"productInfo\":{\"otPrice\":0.50,\"userCollect\":false,\"description\":\"<p style=\\\"text-align: center;\\\"><strong>文件请传QQ2412733099，</strong></p><p style=\\\"text-align: center;\\\"><strong>718504558或2412733099@qq.com邮箱，</strong></p><p style=\\\"text-align: center;\\\"><strong>手机/微信：13733990583</strong></p><p style=\\\"text-align: center;\\\"><strong>量大请联系店主，一定让您满意而归</strong></p><p style=\\\"text-align: center;\\\"><strong>&nbsp; &nbsp;实体店面经营 保质保量</strong></p><p style=\\\"text-align: center;\\\"><strong>A4黑白2毛/张，量大1毛/张，</strong></p><p style=\\\"text-align: center;\\\"><strong>A3黑白双面5毛/张，量大3毛/张，</strong></p><p style=\\\"text-align: center;\\\"><strong>更大量请联系店主报价，</strong></p><p style=\\\"text-align: center;\\\"><strong>每消费1元可积1分，1分抵现金1毛，</strong></p><p style=\\\"text-align: center;\\\"><strong>付款时直接抵扣</strong></p><p style=\\\"text-align: center;\\\"><strong>（如此优惠的基础上还可积分，积分抵现金）</strong></p><p style=\\\"text-align: left;\\\"><strong><br></strong></p><p><br></p><p>&nbsp; &nbsp;&nbsp;<img src=\\\"https://image.dayouqiantu.cn/5ca03007150f1.jpg\\\" style=\\\"max-width: 100%;\\\"><br></p>\",\"merUse\":0,\"isPostage\":1,\"image_base\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"isBest\":1,\"sales\":3,\"price\":0.20,\"isBargain\":0,\"userLike\":false,\"vipPrice\":0.20,\"storeName\":\"70gA4黑白打印复印\",\"id\":19,\"keyword\":\"打印复印\",\"stock\":99,\"image\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"cost\":0.20,\"isGood\":1,\"unitName\":\"张\",\"isBenefit\":1,\"giveIntegral\":1.00,\"isNew\":1,\"sort\":1,\"sliderImageArr\":[\"https://image.dayouqiantu.cn/5ca01c7fc9238.jpg\",\"https://image.dayouqiantu.cn/5ca01c7676042.jpg\"],\"sliderImage\":\"https://image.dayouqiantu.cn/5ca01c7fc9238.jpg,https://image.dayouqiantu.cn/5ca01c7676042.jpg\",\"barCode\":\"\",\"isShow\":1,\"postage\":0.00,\"codePath\":\"\",\"soureLink\":\"\",\"cateId\":\"24\",\"isSeckill\":0,\"storeInfo\":\"打印复印资料A4黑白彩色印刷画册书本装订图文数码快印服务\",\"isDel\":0,\"isHot\":1,\"attrInfo\":{\"image\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"cost\":0.20,\"productId\":19,\"price\":0.20,\"unique\":\"2e4fdfe41da9408ebe5dc5f46b247c36\",\"suk\":\"A1,白色\",\"id\":18,\"stock\":999}},\"uid\":3,\"productAttrUnique\":\"2e4fdfe41da9408ebe5dc5f46b247c36\",\"bargainId\":0,\"id\":24}', 'b1c774c3d5d2498bb7c7cba0cb5dc711');
INSERT INTO `yx_store_order_cart_info` VALUES (25, 27, 25, 20, '{\"addTime\":1573119053,\"productId\":20,\"seckillId\":0,\"vipTruePrice\":0.5,\"combinationId\":0,\"costPrice\":0.5,\"trueStock\":999,\"truePrice\":0.5,\"type\":\"product\",\"cartNum\":1,\"productInfo\":{\"addTime\":1573108370,\"otPrice\":1.00,\"userCollect\":false,\"description\":\"<p style=\\\"text-align: center;\\\">7<strong>文件请传QQ2412733099，</strong></p><p style=\\\"text-align: center;\\\"><strong>718504558或2412733099@qq.com邮箱，</strong></p><p style=\\\"text-align: center;\\\"><strong>手机/微信：13733990583</strong></p><p style=\\\"text-align: center;\\\"><strong>量大请联系店主，一定让您满意而归</strong></p><p style=\\\"text-align: center;\\\"><strong>&nbsp; &nbsp;实体店面经营 保质保量</strong></p><p style=\\\"text-align: center;\\\"><strong>A4黑白2毛/张，量大1毛/张，</strong></p><p style=\\\"text-align: center;\\\"><strong>A3黑白双面5毛/张，量大3毛/张，</strong></p><p style=\\\"text-align: center;\\\"><strong>更大量请联系店主报价，</strong></p><p style=\\\"text-align: center;\\\"><strong>每消费1元可积1分，1分抵现金1毛，</strong></p><p style=\\\"text-align: center;\\\"><strong>付款时直接抵扣</strong></p><p style=\\\"text-align: center;\\\"><strong>（如此优惠的基础上还可积分，积分抵现金）</strong></p><p style=\\\"text-align: center;\\\"><img src=\\\"https://image.dayouqiantu.cn/5ca03007150f1.jpg\\\" style=\\\"max-width:100%;\\\"><strong><br></strong></p><p style=\\\"text-align: center;\\\"><br></p>\",\"merUse\":0,\"isPostage\":1,\"image_base\":\"https://image.dayouqiantu.cn/5ca04fa9c08ef.jpg\",\"isBest\":1,\"sales\":0,\"price\":0.50,\"isBargain\":0,\"userLike\":false,\"vipPrice\":0.50,\"storeName\":\"70gA4彩色打印复印\",\"id\":20,\"keyword\":\"彩色打印复印\",\"stock\":100,\"image\":\"https://image.dayouqiantu.cn/5ca04fa9c08ef.jpg\",\"cost\":0.50,\"isGood\":1,\"unitName\":\"张\",\"isBenefit\":1,\"giveIntegral\":0.00,\"isNew\":1,\"sort\":0,\"sliderImageArr\":[\"https://image.dayouqiantu.cn/5ca05103ad634.jpg\",\"https://image.dayouqiantu.cn/5ca04fa9c08ef.jpg\"],\"sliderImage\":\"https://image.dayouqiantu.cn/5ca05103ad634.jpg,https://image.dayouqiantu.cn/5ca04fa9c08ef.jpg\",\"barCode\":\"\",\"isShow\":1,\"postage\":0.00,\"codePath\":\"\",\"soureLink\":\"\",\"cateId\":\"24\",\"isSeckill\":0,\"merId\":0,\"ficti\":0,\"storeInfo\":\"70gA4彩色打印复印\",\"isDel\":0,\"isHot\":1,\"attrInfo\":{\"image\":\"https://image.dayouqiantu.cn/5ca04fa9c08ef.jpg\",\"cost\":0.50,\"productId\":20,\"price\":0.50,\"unique\":\"75d1d355cdb44970beb3524911c7bae7\",\"suk\":\"A3,红色\",\"id\":11,\"stock\":999},\"browse\":0},\"uid\":7,\"productAttrUnique\":\"75d1d355cdb44970beb3524911c7bae7\",\"bargainId\":0,\"id\":25}', 'a39f347d838545dfa33cdf5136f89983');
INSERT INTO `yx_store_order_cart_info` VALUES (26, 28, 26, 19, '{\"addTime\":1573119078,\"productId\":19,\"seckillId\":0,\"vipTruePrice\":0.2,\"combinationId\":0,\"costPrice\":0.2,\"trueStock\":9999,\"truePrice\":0.2,\"type\":\"product\",\"cartNum\":1,\"productInfo\":{\"otPrice\":0.50,\"userCollect\":false,\"description\":\"<p style=\\\"text-align: center;\\\"><strong>文件请传QQ2412733099，</strong></p><p style=\\\"text-align: center;\\\"><strong>718504558或2412733099@qq.com邮箱，</strong></p><p style=\\\"text-align: center;\\\"><strong>手机/微信：13733990583</strong></p><p style=\\\"text-align: center;\\\"><strong>量大请联系店主，一定让您满意而归</strong></p><p style=\\\"text-align: center;\\\"><strong>&nbsp; &nbsp;实体店面经营 保质保量</strong></p><p style=\\\"text-align: center;\\\"><strong>A4黑白2毛/张，量大1毛/张，</strong></p><p style=\\\"text-align: center;\\\"><strong>A3黑白双面5毛/张，量大3毛/张，</strong></p><p style=\\\"text-align: center;\\\"><strong>更大量请联系店主报价，</strong></p><p style=\\\"text-align: center;\\\"><strong>每消费1元可积1分，1分抵现金1毛，</strong></p><p style=\\\"text-align: center;\\\"><strong>付款时直接抵扣</strong></p><p style=\\\"text-align: center;\\\"><strong>（如此优惠的基础上还可积分，积分抵现金）</strong></p><p style=\\\"text-align: left;\\\"><strong><br></strong></p><p><br></p><p>&nbsp; &nbsp;&nbsp;<img src=\\\"https://image.dayouqiantu.cn/5ca03007150f1.jpg\\\" style=\\\"max-width: 100%;\\\"><br></p>\",\"merUse\":0,\"isPostage\":1,\"image_base\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"isBest\":1,\"sales\":4,\"price\":0.20,\"isBargain\":0,\"userLike\":false,\"vipPrice\":0.20,\"storeName\":\"70gA4黑白打印复印\",\"id\":19,\"keyword\":\"打印复印\",\"stock\":99,\"image\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"cost\":0.20,\"isGood\":1,\"unitName\":\"张\",\"isBenefit\":1,\"giveIntegral\":1.00,\"isNew\":1,\"sort\":1,\"sliderImageArr\":[\"https://image.dayouqiantu.cn/5ca01c7fc9238.jpg\",\"https://image.dayouqiantu.cn/5ca01c7676042.jpg\"],\"sliderImage\":\"https://image.dayouqiantu.cn/5ca01c7fc9238.jpg,https://image.dayouqiantu.cn/5ca01c7676042.jpg\",\"barCode\":\"\",\"isShow\":1,\"postage\":0.00,\"codePath\":\"\",\"soureLink\":\"\",\"cateId\":\"24\",\"isSeckill\":0,\"storeInfo\":\"打印复印资料A4黑白彩色印刷画册书本装订图文数码快印服务\",\"isDel\":0,\"isHot\":1,\"attrInfo\":{\"image\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"cost\":0.20,\"productId\":19,\"price\":0.20,\"unique\":\"0938e298745940318f07af0887b657b8\",\"suk\":\"A1,蓝色\",\"id\":19,\"stock\":9999}},\"uid\":3,\"productAttrUnique\":\"0938e298745940318f07af0887b657b8\",\"bargainId\":0,\"id\":26}', '7128f9431bd04bcfa9bce462a6cf7368');
INSERT INTO `yx_store_order_cart_info` VALUES (27, 29, 27, 19, '{\"addTime\":1573119170,\"productId\":19,\"seckillId\":0,\"vipTruePrice\":0.2,\"combinationId\":0,\"costPrice\":0.2,\"trueStock\":998,\"truePrice\":0.2,\"type\":\"product\",\"cartNum\":1,\"productInfo\":{\"otPrice\":0.50,\"userCollect\":false,\"description\":\"<p style=\\\"text-align: center;\\\"><strong>文件请传QQ2412733099，</strong></p><p style=\\\"text-align: center;\\\"><strong>718504558或2412733099@qq.com邮箱，</strong></p><p style=\\\"text-align: center;\\\"><strong>手机/微信：13733990583</strong></p><p style=\\\"text-align: center;\\\"><strong>量大请联系店主，一定让您满意而归</strong></p><p style=\\\"text-align: center;\\\"><strong>&nbsp; &nbsp;实体店面经营 保质保量</strong></p><p style=\\\"text-align: center;\\\"><strong>A4黑白2毛/张，量大1毛/张，</strong></p><p style=\\\"text-align: center;\\\"><strong>A3黑白双面5毛/张，量大3毛/张，</strong></p><p style=\\\"text-align: center;\\\"><strong>更大量请联系店主报价，</strong></p><p style=\\\"text-align: center;\\\"><strong>每消费1元可积1分，1分抵现金1毛，</strong></p><p style=\\\"text-align: center;\\\"><strong>付款时直接抵扣</strong></p><p style=\\\"text-align: center;\\\"><strong>（如此优惠的基础上还可积分，积分抵现金）</strong></p><p style=\\\"text-align: left;\\\"><strong><br></strong></p><p><br></p><p>&nbsp; &nbsp;&nbsp;<img src=\\\"https://image.dayouqiantu.cn/5ca03007150f1.jpg\\\" style=\\\"max-width: 100%;\\\"><br></p>\",\"merUse\":0,\"isPostage\":1,\"image_base\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"isBest\":1,\"sales\":5,\"price\":0.20,\"isBargain\":0,\"userLike\":false,\"vipPrice\":0.20,\"storeName\":\"70gA4黑白打印复印\",\"id\":19,\"keyword\":\"打印复印\",\"stock\":99,\"image\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"cost\":0.20,\"isGood\":1,\"unitName\":\"张\",\"isBenefit\":1,\"giveIntegral\":1.00,\"isNew\":1,\"sort\":1,\"sliderImageArr\":[\"https://image.dayouqiantu.cn/5ca01c7fc9238.jpg\",\"https://image.dayouqiantu.cn/5ca01c7676042.jpg\"],\"sliderImage\":\"https://image.dayouqiantu.cn/5ca01c7fc9238.jpg,https://image.dayouqiantu.cn/5ca01c7676042.jpg\",\"barCode\":\"\",\"isShow\":1,\"postage\":0.00,\"codePath\":\"\",\"soureLink\":\"\",\"cateId\":\"24\",\"isSeckill\":0,\"storeInfo\":\"打印复印资料A4黑白彩色印刷画册书本装订图文数码快印服务\",\"isDel\":0,\"isHot\":1,\"attrInfo\":{\"image\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"cost\":0.20,\"productId\":19,\"price\":0.20,\"unique\":\"2e4fdfe41da9408ebe5dc5f46b247c36\",\"suk\":\"A1,白色\",\"id\":18,\"stock\":998}},\"uid\":7,\"productAttrUnique\":\"2e4fdfe41da9408ebe5dc5f46b247c36\",\"bargainId\":0,\"id\":27}', '9bab84881cf846c393f7a9b2ed68813b');
INSERT INTO `yx_store_order_cart_info` VALUES (28, 30, 29, 19, '{\"addTime\":1573119419,\"productId\":19,\"seckillId\":0,\"vipTruePrice\":0.2,\"combinationId\":0,\"costPrice\":0.2,\"trueStock\":9998,\"truePrice\":0.2,\"type\":\"product\",\"cartNum\":1,\"productInfo\":{\"otPrice\":0.50,\"userCollect\":false,\"description\":\"<p style=\\\"text-align: center;\\\"><strong>文件请传QQ2412733099，</strong></p><p style=\\\"text-align: center;\\\"><strong>718504558或2412733099@qq.com邮箱，</strong></p><p style=\\\"text-align: center;\\\"><strong>手机/微信：13733990583</strong></p><p style=\\\"text-align: center;\\\"><strong>量大请联系店主，一定让您满意而归</strong></p><p style=\\\"text-align: center;\\\"><strong>&nbsp; &nbsp;实体店面经营 保质保量</strong></p><p style=\\\"text-align: center;\\\"><strong>A4黑白2毛/张，量大1毛/张，</strong></p><p style=\\\"text-align: center;\\\"><strong>A3黑白双面5毛/张，量大3毛/张，</strong></p><p style=\\\"text-align: center;\\\"><strong>更大量请联系店主报价，</strong></p><p style=\\\"text-align: center;\\\"><strong>每消费1元可积1分，1分抵现金1毛，</strong></p><p style=\\\"text-align: center;\\\"><strong>付款时直接抵扣</strong></p><p style=\\\"text-align: center;\\\"><strong>（如此优惠的基础上还可积分，积分抵现金）</strong></p><p style=\\\"text-align: left;\\\"><strong><br></strong></p><p><br></p><p>&nbsp; &nbsp;&nbsp;<img src=\\\"https://image.dayouqiantu.cn/5ca03007150f1.jpg\\\" style=\\\"max-width: 100%;\\\"><br></p>\",\"merUse\":0,\"isPostage\":1,\"image_base\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"isBest\":1,\"sales\":6,\"price\":0.20,\"isBargain\":0,\"userLike\":false,\"vipPrice\":0.20,\"storeName\":\"70gA4黑白打印复印\",\"id\":19,\"keyword\":\"打印复印\",\"stock\":99,\"image\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"cost\":0.20,\"isGood\":1,\"unitName\":\"张\",\"isBenefit\":1,\"giveIntegral\":1.00,\"isNew\":1,\"sort\":1,\"sliderImageArr\":[\"https://image.dayouqiantu.cn/5ca01c7fc9238.jpg\",\"https://image.dayouqiantu.cn/5ca01c7676042.jpg\"],\"sliderImage\":\"https://image.dayouqiantu.cn/5ca01c7fc9238.jpg,https://image.dayouqiantu.cn/5ca01c7676042.jpg\",\"barCode\":\"\",\"isShow\":1,\"postage\":0.00,\"codePath\":\"\",\"soureLink\":\"\",\"cateId\":\"24\",\"isSeckill\":0,\"storeInfo\":\"打印复印资料A4黑白彩色印刷画册书本装订图文数码快印服务\",\"isDel\":0,\"isHot\":1,\"attrInfo\":{\"image\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"cost\":0.20,\"productId\":19,\"price\":0.20,\"unique\":\"0938e298745940318f07af0887b657b8\",\"suk\":\"A1,蓝色\",\"id\":19,\"stock\":9998}},\"uid\":8,\"productAttrUnique\":\"0938e298745940318f07af0887b657b8\",\"bargainId\":0,\"id\":29}', '28a09b3c854d41e7b16dd10886b083b1');
INSERT INTO `yx_store_order_cart_info` VALUES (29, 31, 30, 19, '{\"addTime\":1573120609,\"productId\":19,\"seckillId\":0,\"vipTruePrice\":0.2,\"combinationId\":0,\"costPrice\":0.2,\"trueStock\":997,\"truePrice\":0.2,\"type\":\"product\",\"cartNum\":1,\"productInfo\":{\"otPrice\":0.50,\"userCollect\":false,\"description\":\"<p style=\\\"text-align: center;\\\"><strong>文件请传QQ2412733099，</strong></p><p style=\\\"text-align: center;\\\"><strong>718504558或2412733099@qq.com邮箱，</strong></p><p style=\\\"text-align: center;\\\"><strong>手机/微信：13733990583</strong></p><p style=\\\"text-align: center;\\\"><strong>量大请联系店主，一定让您满意而归</strong></p><p style=\\\"text-align: center;\\\"><strong>&nbsp; &nbsp;实体店面经营 保质保量</strong></p><p style=\\\"text-align: center;\\\"><strong>A4黑白2毛/张，量大1毛/张，</strong></p><p style=\\\"text-align: center;\\\"><strong>A3黑白双面5毛/张，量大3毛/张，</strong></p><p style=\\\"text-align: center;\\\"><strong>更大量请联系店主报价，</strong></p><p style=\\\"text-align: center;\\\"><strong>每消费1元可积1分，1分抵现金1毛，</strong></p><p style=\\\"text-align: center;\\\"><strong>付款时直接抵扣</strong></p><p style=\\\"text-align: center;\\\"><strong>（如此优惠的基础上还可积分，积分抵现金）</strong></p><p style=\\\"text-align: left;\\\"><strong><br></strong></p><p><br></p><p>&nbsp; &nbsp;&nbsp;<img src=\\\"https://image.dayouqiantu.cn/5ca03007150f1.jpg\\\" style=\\\"max-width: 100%;\\\"><br></p>\",\"merUse\":0,\"isPostage\":1,\"image_base\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"isBest\":1,\"sales\":7,\"price\":0.20,\"isBargain\":0,\"userLike\":false,\"vipPrice\":0.20,\"storeName\":\"70gA4黑白打印复印\",\"id\":19,\"keyword\":\"打印复印\",\"stock\":99,\"image\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"cost\":0.20,\"isGood\":1,\"unitName\":\"张\",\"isBenefit\":1,\"giveIntegral\":1.00,\"isNew\":1,\"sort\":1,\"sliderImageArr\":[\"https://image.dayouqiantu.cn/5ca01c7fc9238.jpg\",\"https://image.dayouqiantu.cn/5ca01c7676042.jpg\"],\"sliderImage\":\"https://image.dayouqiantu.cn/5ca01c7fc9238.jpg,https://image.dayouqiantu.cn/5ca01c7676042.jpg\",\"barCode\":\"\",\"isShow\":1,\"postage\":0.00,\"codePath\":\"\",\"soureLink\":\"\",\"cateId\":\"24\",\"isSeckill\":0,\"storeInfo\":\"打印复印资料A4黑白彩色印刷画册书本装订图文数码快印服务\",\"isDel\":0,\"isHot\":1,\"attrInfo\":{\"image\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"cost\":0.20,\"productId\":19,\"price\":0.20,\"unique\":\"2e4fdfe41da9408ebe5dc5f46b247c36\",\"suk\":\"A1,白色\",\"id\":18,\"stock\":997}},\"uid\":11,\"productAttrUnique\":\"2e4fdfe41da9408ebe5dc5f46b247c36\",\"bargainId\":0,\"id\":30}', '5fbebeaf20e54dfab79ea58da33502ad');
INSERT INTO `yx_store_order_cart_info` VALUES (30, 32, 31, 19, '{\"addTime\":1573123442,\"productId\":19,\"seckillId\":0,\"vipTruePrice\":0.2,\"combinationId\":0,\"costPrice\":0.2,\"trueStock\":996,\"truePrice\":0.2,\"type\":\"product\",\"cartNum\":1,\"productInfo\":{\"otPrice\":0.50,\"userCollect\":false,\"description\":\"<p style=\\\"text-align: center;\\\"><strong>文件请传QQ2412733099，</strong></p><p style=\\\"text-align: center;\\\"><strong>718504558或2412733099@qq.com邮箱，</strong></p><p style=\\\"text-align: center;\\\"><strong>手机/微信：13733990583</strong></p><p style=\\\"text-align: center;\\\"><strong>量大请联系店主，一定让您满意而归</strong></p><p style=\\\"text-align: center;\\\"><strong>&nbsp; &nbsp;实体店面经营 保质保量</strong></p><p style=\\\"text-align: center;\\\"><strong>A4黑白2毛/张，量大1毛/张，</strong></p><p style=\\\"text-align: center;\\\"><strong>A3黑白双面5毛/张，量大3毛/张，</strong></p><p style=\\\"text-align: center;\\\"><strong>更大量请联系店主报价，</strong></p><p style=\\\"text-align: center;\\\"><strong>每消费1元可积1分，1分抵现金1毛，</strong></p><p style=\\\"text-align: center;\\\"><strong>付款时直接抵扣</strong></p><p style=\\\"text-align: center;\\\"><strong>（如此优惠的基础上还可积分，积分抵现金）</strong></p><p style=\\\"text-align: left;\\\"><strong><br></strong></p><p><br></p><p>&nbsp; &nbsp;&nbsp;<img src=\\\"https://image.dayouqiantu.cn/5ca03007150f1.jpg\\\" style=\\\"max-width: 100%;\\\"><br></p>\",\"merUse\":0,\"isPostage\":1,\"image_base\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"isBest\":1,\"sales\":8,\"price\":0.20,\"isBargain\":0,\"userLike\":false,\"vipPrice\":0.20,\"storeName\":\"70gA4黑白打印复印\",\"id\":19,\"keyword\":\"打印复印\",\"stock\":99,\"image\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"cost\":0.20,\"isGood\":1,\"unitName\":\"张\",\"isBenefit\":1,\"giveIntegral\":1.00,\"isNew\":1,\"sort\":1,\"sliderImageArr\":[\"https://image.dayouqiantu.cn/5ca01c7fc9238.jpg\",\"https://image.dayouqiantu.cn/5ca01c7676042.jpg\"],\"sliderImage\":\"https://image.dayouqiantu.cn/5ca01c7fc9238.jpg,https://image.dayouqiantu.cn/5ca01c7676042.jpg\",\"barCode\":\"\",\"isShow\":1,\"postage\":0.00,\"codePath\":\"\",\"soureLink\":\"\",\"cateId\":\"24\",\"isSeckill\":0,\"storeInfo\":\"打印复印资料A4黑白彩色印刷画册书本装订图文数码快印服务\",\"isDel\":0,\"isHot\":1,\"attrInfo\":{\"image\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"cost\":0.20,\"productId\":19,\"price\":0.20,\"unique\":\"2e4fdfe41da9408ebe5dc5f46b247c36\",\"suk\":\"A1,白色\",\"id\":18,\"stock\":996}},\"uid\":12,\"productAttrUnique\":\"2e4fdfe41da9408ebe5dc5f46b247c36\",\"bargainId\":0,\"id\":31}', 'afb19af2993c4eceb0a39056363e6886');
INSERT INTO `yx_store_order_cart_info` VALUES (31, 33, 32, 19, '{\"addTime\":1573123802,\"productId\":19,\"seckillId\":0,\"vipTruePrice\":0.2,\"combinationId\":0,\"costPrice\":0.2,\"trueStock\":995,\"truePrice\":0.2,\"type\":\"product\",\"cartNum\":1,\"productInfo\":{\"otPrice\":0.50,\"userCollect\":false,\"description\":\"<p style=\\\"text-align: center;\\\"><strong>文件请传QQ2412733099，</strong></p><p style=\\\"text-align: center;\\\"><strong>718504558或2412733099@qq.com邮箱，</strong></p><p style=\\\"text-align: center;\\\"><strong>手机/微信：13733990583</strong></p><p style=\\\"text-align: center;\\\"><strong>量大请联系店主，一定让您满意而归</strong></p><p style=\\\"text-align: center;\\\"><strong>&nbsp; &nbsp;实体店面经营 保质保量</strong></p><p style=\\\"text-align: center;\\\"><strong>A4黑白2毛/张，量大1毛/张，</strong></p><p style=\\\"text-align: center;\\\"><strong>A3黑白双面5毛/张，量大3毛/张，</strong></p><p style=\\\"text-align: center;\\\"><strong>更大量请联系店主报价，</strong></p><p style=\\\"text-align: center;\\\"><strong>每消费1元可积1分，1分抵现金1毛，</strong></p><p style=\\\"text-align: center;\\\"><strong>付款时直接抵扣</strong></p><p style=\\\"text-align: center;\\\"><strong>（如此优惠的基础上还可积分，积分抵现金）</strong></p><p style=\\\"text-align: left;\\\"><strong><br></strong></p><p><br></p><p>&nbsp; &nbsp;&nbsp;<img src=\\\"https://image.dayouqiantu.cn/5ca03007150f1.jpg\\\" style=\\\"max-width: 100%;\\\"><br></p>\",\"merUse\":0,\"isPostage\":1,\"image_base\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"isBest\":1,\"sales\":9,\"price\":0.20,\"isBargain\":0,\"userLike\":false,\"vipPrice\":0.20,\"storeName\":\"70gA4黑白打印复印\",\"id\":19,\"keyword\":\"打印复印\",\"stock\":99,\"image\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"cost\":0.20,\"isGood\":1,\"unitName\":\"张\",\"isBenefit\":1,\"giveIntegral\":1.00,\"isNew\":1,\"sort\":1,\"sliderImageArr\":[\"https://image.dayouqiantu.cn/5ca01c7fc9238.jpg\",\"https://image.dayouqiantu.cn/5ca01c7676042.jpg\"],\"sliderImage\":\"https://image.dayouqiantu.cn/5ca01c7fc9238.jpg,https://image.dayouqiantu.cn/5ca01c7676042.jpg\",\"barCode\":\"\",\"isShow\":1,\"postage\":0.00,\"codePath\":\"\",\"soureLink\":\"\",\"cateId\":\"24\",\"isSeckill\":0,\"storeInfo\":\"打印复印资料A4黑白彩色印刷画册书本装订图文数码快印服务\",\"isDel\":0,\"isHot\":1,\"attrInfo\":{\"image\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"cost\":0.20,\"productId\":19,\"price\":0.20,\"unique\":\"2e4fdfe41da9408ebe5dc5f46b247c36\",\"suk\":\"A1,白色\",\"id\":18,\"stock\":995}},\"uid\":12,\"productAttrUnique\":\"2e4fdfe41da9408ebe5dc5f46b247c36\",\"bargainId\":0,\"id\":32}', 'c55f2f7ef8e24e459cadd1a12dca6249');
INSERT INTO `yx_store_order_cart_info` VALUES (32, 34, 33, 19, '{\"addTime\":1573123872,\"productId\":19,\"seckillId\":0,\"vipTruePrice\":0.2,\"combinationId\":0,\"costPrice\":0.2,\"trueStock\":994,\"truePrice\":0.2,\"type\":\"product\",\"cartNum\":1,\"productInfo\":{\"otPrice\":0.50,\"userCollect\":false,\"description\":\"<p style=\\\"text-align: center;\\\"><strong>文件请传QQ2412733099，</strong></p><p style=\\\"text-align: center;\\\"><strong>718504558或2412733099@qq.com邮箱，</strong></p><p style=\\\"text-align: center;\\\"><strong>手机/微信：13733990583</strong></p><p style=\\\"text-align: center;\\\"><strong>量大请联系店主，一定让您满意而归</strong></p><p style=\\\"text-align: center;\\\"><strong>&nbsp; &nbsp;实体店面经营 保质保量</strong></p><p style=\\\"text-align: center;\\\"><strong>A4黑白2毛/张，量大1毛/张，</strong></p><p style=\\\"text-align: center;\\\"><strong>A3黑白双面5毛/张，量大3毛/张，</strong></p><p style=\\\"text-align: center;\\\"><strong>更大量请联系店主报价，</strong></p><p style=\\\"text-align: center;\\\"><strong>每消费1元可积1分，1分抵现金1毛，</strong></p><p style=\\\"text-align: center;\\\"><strong>付款时直接抵扣</strong></p><p style=\\\"text-align: center;\\\"><strong>（如此优惠的基础上还可积分，积分抵现金）</strong></p><p style=\\\"text-align: left;\\\"><strong><br></strong></p><p><br></p><p>&nbsp; &nbsp;&nbsp;<img src=\\\"https://image.dayouqiantu.cn/5ca03007150f1.jpg\\\" style=\\\"max-width: 100%;\\\"><br></p>\",\"merUse\":0,\"isPostage\":1,\"image_base\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"isBest\":1,\"sales\":10,\"price\":0.20,\"isBargain\":0,\"userLike\":false,\"vipPrice\":0.20,\"storeName\":\"70gA4黑白打印复印\",\"id\":19,\"keyword\":\"打印复印\",\"stock\":99,\"image\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"cost\":0.20,\"isGood\":1,\"unitName\":\"张\",\"isBenefit\":1,\"giveIntegral\":1.00,\"isNew\":1,\"sort\":1,\"sliderImageArr\":[\"https://image.dayouqiantu.cn/5ca01c7fc9238.jpg\",\"https://image.dayouqiantu.cn/5ca01c7676042.jpg\"],\"sliderImage\":\"https://image.dayouqiantu.cn/5ca01c7fc9238.jpg,https://image.dayouqiantu.cn/5ca01c7676042.jpg\",\"barCode\":\"\",\"isShow\":1,\"postage\":0.00,\"codePath\":\"\",\"soureLink\":\"\",\"cateId\":\"24\",\"isSeckill\":0,\"storeInfo\":\"打印复印资料A4黑白彩色印刷画册书本装订图文数码快印服务\",\"isDel\":0,\"isHot\":1,\"attrInfo\":{\"image\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"cost\":0.20,\"productId\":19,\"price\":0.20,\"unique\":\"2e4fdfe41da9408ebe5dc5f46b247c36\",\"suk\":\"A1,白色\",\"id\":18,\"stock\":994}},\"uid\":12,\"productAttrUnique\":\"2e4fdfe41da9408ebe5dc5f46b247c36\",\"bargainId\":0,\"id\":33}', '6086f21b510640b398df40d4fbd555de');
INSERT INTO `yx_store_order_cart_info` VALUES (33, 35, 34, 19, '{\"addTime\":1573368853,\"productId\":19,\"seckillId\":0,\"vipTruePrice\":120.0,\"combinationId\":0,\"costPrice\":100.0,\"trueStock\":999,\"truePrice\":120.0,\"type\":\"product\",\"cartNum\":1,\"productInfo\":{\"otPrice\":0.50,\"userCollect\":false,\"description\":\"<p style=\\\"text-align: center;\\\"><strong>文件请传QQ2412733099，</strong></p><p style=\\\"text-align: center;\\\"><strong>718504558或2412733099@qq.com邮箱，</strong></p><p style=\\\"text-align: center;\\\"><strong>手机/微信：13733990583</strong></p><p style=\\\"text-align: center;\\\"><strong>量大请联系店主，一定让您满意而归</strong></p><p style=\\\"text-align: center;\\\"><strong>&nbsp; &nbsp;实体店面经营 保质保量</strong></p><p style=\\\"text-align: center;\\\"><strong>A4黑白2毛/张，量大1毛/张，</strong></p><p style=\\\"text-align: center;\\\"><strong>A3黑白双面5毛/张，量大3毛/张，</strong></p><p style=\\\"text-align: center;\\\"><strong>更大量请联系店主报价，</strong></p><p style=\\\"text-align: center;\\\"><strong>每消费1元可积1分，1分抵现金1毛，</strong></p><p style=\\\"text-align: center;\\\"><strong>付款时直接抵扣</strong></p><p style=\\\"text-align: center;\\\"><strong>（如此优惠的基础上还可积分，积分抵现金）</strong></p><p style=\\\"text-align: left;\\\"><strong><br></strong></p><p><br></p><p>&nbsp; &nbsp;&nbsp;<img src=\\\"https://image.dayouqiantu.cn/5ca03007150f1.jpg\\\" style=\\\"max-width: 100%;\\\"><br></p>\",\"merUse\":0,\"isPostage\":1,\"image_base\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"isBest\":1,\"sales\":11,\"price\":120.00,\"isBargain\":0,\"userLike\":false,\"vipPrice\":0.20,\"storeName\":\"70gA4黑白打印复印\",\"id\":19,\"keyword\":\"打印复印\",\"stock\":99,\"image\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"cost\":0.20,\"isGood\":1,\"unitName\":\"张\",\"isBenefit\":1,\"giveIntegral\":1.00,\"isNew\":1,\"sort\":1,\"sliderImageArr\":[\"https://image.dayouqiantu.cn/5ca01c7fc9238.jpg\",\"https://image.dayouqiantu.cn/5ca01c7676042.jpg\"],\"sliderImage\":\"https://image.dayouqiantu.cn/5ca01c7fc9238.jpg,https://image.dayouqiantu.cn/5ca01c7676042.jpg\",\"barCode\":\"\",\"isShow\":1,\"postage\":0.00,\"codePath\":\"\",\"soureLink\":\"\",\"cateId\":\"24\",\"isSeckill\":0,\"storeInfo\":\"打印复印资料A4黑白彩色印刷画册书本装订图文数码快印服务\",\"isDel\":0,\"isHot\":1,\"attrInfo\":{\"image\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"cost\":100.00,\"productId\":19,\"price\":120.00,\"unique\":\"00e86525a7af4dcf9e653ae0a2062369\",\"suk\":\"A1,白色\",\"id\":22,\"stock\":999}},\"uid\":12,\"productAttrUnique\":\"00e86525a7af4dcf9e653ae0a2062369\",\"bargainId\":0,\"id\":34}', '7ff106b3a7494f0f917ed4eca6c77d35');
INSERT INTO `yx_store_order_cart_info` VALUES (34, 36, 36, 19, '{\"addTime\":1573380432,\"productId\":19,\"seckillId\":0,\"vipTruePrice\":170.0,\"combinationId\":0,\"costPrice\":100.0,\"trueStock\":9999,\"truePrice\":170.0,\"type\":\"product\",\"cartNum\":1,\"productInfo\":{\"otPrice\":0.50,\"userCollect\":false,\"description\":\"<p style=\\\"text-align: center;\\\"><strong>文件请传QQ2412733099，</strong></p><p style=\\\"text-align: center;\\\"><strong>718504558或2412733099@qq.com邮箱，</strong></p><p style=\\\"text-align: center;\\\"><strong>手机/微信：13733990583</strong></p><p style=\\\"text-align: center;\\\"><strong>量大请联系店主，一定让您满意而归</strong></p><p style=\\\"text-align: center;\\\"><strong>&nbsp; &nbsp;实体店面经营 保质保量</strong></p><p style=\\\"text-align: center;\\\"><strong>A4黑白2毛/张，量大1毛/张，</strong></p><p style=\\\"text-align: center;\\\"><strong>A3黑白双面5毛/张，量大3毛/张，</strong></p><p style=\\\"text-align: center;\\\"><strong>更大量请联系店主报价，</strong></p><p style=\\\"text-align: center;\\\"><strong>每消费1元可积1分，1分抵现金1毛，</strong></p><p style=\\\"text-align: center;\\\"><strong>付款时直接抵扣</strong></p><p style=\\\"text-align: center;\\\"><strong>（如此优惠的基础上还可积分，积分抵现金）</strong></p><p style=\\\"text-align: left;\\\"><strong><br></strong></p><p><br></p><p>&nbsp; &nbsp;&nbsp;<img src=\\\"https://image.dayouqiantu.cn/5ca03007150f1.jpg\\\" style=\\\"max-width: 100%;\\\"><br></p>\",\"merUse\":0,\"isPostage\":1,\"image_base\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"isBest\":1,\"sales\":12,\"price\":120.00,\"isBargain\":0,\"userLike\":false,\"vipPrice\":0.20,\"storeName\":\"70gA4黑白打印复印\",\"id\":19,\"keyword\":\"打印复印\",\"stock\":99,\"image\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"cost\":0.20,\"isGood\":1,\"unitName\":\"张\",\"isBenefit\":1,\"giveIntegral\":1.00,\"isNew\":1,\"sort\":1,\"sliderImageArr\":[\"https://image.dayouqiantu.cn/5ca01c7fc9238.jpg\",\"https://image.dayouqiantu.cn/5ca01c7676042.jpg\"],\"sliderImage\":\"https://image.dayouqiantu.cn/5ca01c7fc9238.jpg,https://image.dayouqiantu.cn/5ca01c7676042.jpg\",\"barCode\":\"\",\"isShow\":1,\"postage\":0.00,\"codePath\":\"\",\"soureLink\":\"\",\"cateId\":\"24\",\"isSeckill\":0,\"storeInfo\":\"打印复印资料A4黑白彩色印刷画册书本装订图文数码快印服务\",\"isDel\":0,\"isHot\":1,\"attrInfo\":{\"image\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"cost\":100.00,\"productId\":19,\"price\":170.00,\"unique\":\"d8c72945fdbe4035a95a393aff1eea46\",\"suk\":\"A4,蓝色\",\"id\":25,\"stock\":9999}},\"uid\":12,\"productAttrUnique\":\"d8c72945fdbe4035a95a393aff1eea46\",\"bargainId\":0,\"id\":36}', 'ff093e14f6454cdc8df13f8ff507a249');
INSERT INTO `yx_store_order_cart_info` VALUES (35, 37, 37, 19, '{\"addTime\":1573612783,\"productId\":19,\"seckillId\":0,\"vipTruePrice\":120.0,\"combinationId\":0,\"costPrice\":100.0,\"trueStock\":998,\"truePrice\":120.0,\"type\":\"product\",\"cartNum\":1,\"productInfo\":{\"otPrice\":0.50,\"userCollect\":false,\"description\":\"<p style=\\\"text-align: center;\\\"><strong>文件请传QQ2412733099，</strong></p><p style=\\\"text-align: center;\\\"><strong>718504558或2412733099@qq.com邮箱，</strong></p><p style=\\\"text-align: center;\\\"><strong>手机/微信：13733990583</strong></p><p style=\\\"text-align: center;\\\"><strong>量大请联系店主，一定让您满意而归</strong></p><p style=\\\"text-align: center;\\\"><strong>&nbsp; &nbsp;实体店面经营 保质保量</strong></p><p style=\\\"text-align: center;\\\"><strong>A4黑白2毛/张，量大1毛/张，</strong></p><p style=\\\"text-align: center;\\\"><strong>A3黑白双面5毛/张，量大3毛/张，</strong></p><p style=\\\"text-align: center;\\\"><strong>更大量请联系店主报价，</strong></p><p style=\\\"text-align: center;\\\"><strong>每消费1元可积1分，1分抵现金1毛，</strong></p><p style=\\\"text-align: center;\\\"><strong>付款时直接抵扣</strong></p><p style=\\\"text-align: center;\\\"><strong>（如此优惠的基础上还可积分，积分抵现金）</strong></p><p style=\\\"text-align: left;\\\"><strong><br></strong></p><p><br></p><p>&nbsp; &nbsp;&nbsp;<img src=\\\"https://image.dayouqiantu.cn/5ca03007150f1.jpg\\\" style=\\\"max-width: 100%;\\\"><br></p>\",\"merUse\":0,\"isPostage\":1,\"image_base\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"isBest\":1,\"sales\":13,\"price\":120.00,\"isBargain\":0,\"userLike\":false,\"vipPrice\":0.20,\"storeName\":\"70gA4黑白打印复印\",\"id\":19,\"keyword\":\"打印复印\",\"stock\":99,\"image\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"cost\":0.20,\"isGood\":1,\"unitName\":\"张\",\"isBenefit\":1,\"giveIntegral\":1.00,\"isNew\":1,\"sort\":1,\"sliderImageArr\":[\"https://image.dayouqiantu.cn/5ca01c7fc9238.jpg\",\"https://image.dayouqiantu.cn/5ca01c7676042.jpg\"],\"sliderImage\":\"https://image.dayouqiantu.cn/5ca01c7fc9238.jpg,https://image.dayouqiantu.cn/5ca01c7676042.jpg\",\"barCode\":\"\",\"isShow\":1,\"postage\":0.00,\"codePath\":\"\",\"soureLink\":\"\",\"cateId\":\"24\",\"isSeckill\":0,\"storeInfo\":\"打印复印资料A4黑白彩色印刷画册书本装订图文数码快印服务\",\"isDel\":0,\"isHot\":1,\"attrInfo\":{\"image\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"cost\":100.00,\"productId\":19,\"price\":120.00,\"unique\":\"00e86525a7af4dcf9e653ae0a2062369\",\"suk\":\"A1,白色\",\"id\":22,\"stock\":998}},\"uid\":14,\"productAttrUnique\":\"00e86525a7af4dcf9e653ae0a2062369\",\"bargainId\":0,\"id\":37}', '87313559f00648c5a43fc84a168b6a64');
INSERT INTO `yx_store_order_cart_info` VALUES (36, 38, 35, 19, '{\"addTime\":1573380121,\"productId\":19,\"seckillId\":0,\"vipTruePrice\":120.0,\"combinationId\":0,\"costPrice\":100.0,\"trueStock\":997,\"truePrice\":120.0,\"type\":\"product\",\"cartNum\":1,\"productInfo\":{\"otPrice\":0.50,\"userCollect\":false,\"description\":\"<p style=\\\"text-align: center;\\\"><strong>文件请传QQ2412733099，</strong></p><p style=\\\"text-align: center;\\\"><strong>718504558或2412733099@qq.com邮箱，</strong></p><p style=\\\"text-align: center;\\\"><strong>手机/微信：13733990583</strong></p><p style=\\\"text-align: center;\\\"><strong>量大请联系店主，一定让您满意而归</strong></p><p style=\\\"text-align: center;\\\"><strong>&nbsp; &nbsp;实体店面经营 保质保量</strong></p><p style=\\\"text-align: center;\\\"><strong>A4黑白2毛/张，量大1毛/张，</strong></p><p style=\\\"text-align: center;\\\"><strong>A3黑白双面5毛/张，量大3毛/张，</strong></p><p style=\\\"text-align: center;\\\"><strong>更大量请联系店主报价，</strong></p><p style=\\\"text-align: center;\\\"><strong>每消费1元可积1分，1分抵现金1毛，</strong></p><p style=\\\"text-align: center;\\\"><strong>付款时直接抵扣</strong></p><p style=\\\"text-align: center;\\\"><strong>（如此优惠的基础上还可积分，积分抵现金）</strong></p><p style=\\\"text-align: left;\\\"><strong><br></strong></p><p><br></p><p>&nbsp; &nbsp;&nbsp;<img src=\\\"https://image.dayouqiantu.cn/5ca03007150f1.jpg\\\" style=\\\"max-width: 100%;\\\"><br></p>\",\"merUse\":0,\"isPostage\":1,\"image_base\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"isBest\":1,\"sales\":14,\"price\":120.00,\"isBargain\":0,\"userLike\":false,\"vipPrice\":0.20,\"storeName\":\"70gA4黑白打印复印\",\"id\":19,\"keyword\":\"打印复印\",\"stock\":99,\"image\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"cost\":0.20,\"isGood\":1,\"unitName\":\"张\",\"isBenefit\":1,\"giveIntegral\":1.00,\"isNew\":1,\"sort\":1,\"sliderImageArr\":[\"https://image.dayouqiantu.cn/5ca01c7fc9238.jpg\",\"https://image.dayouqiantu.cn/5ca01c7676042.jpg\"],\"sliderImage\":\"https://image.dayouqiantu.cn/5ca01c7fc9238.jpg,https://image.dayouqiantu.cn/5ca01c7676042.jpg\",\"barCode\":\"\",\"isShow\":1,\"postage\":0.00,\"codePath\":\"\",\"soureLink\":\"\",\"cateId\":\"24\",\"isSeckill\":0,\"storeInfo\":\"打印复印资料A4黑白彩色印刷画册书本装订图文数码快印服务\",\"isDel\":0,\"isHot\":1,\"attrInfo\":{\"image\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"cost\":100.00,\"productId\":19,\"price\":120.00,\"unique\":\"00e86525a7af4dcf9e653ae0a2062369\",\"suk\":\"A1,白色\",\"id\":22,\"stock\":997}},\"uid\":12,\"productAttrUnique\":\"00e86525a7af4dcf9e653ae0a2062369\",\"bargainId\":0,\"id\":35}', '2a9f20b03d0a4f2588e932e3651e9072');
INSERT INTO `yx_store_order_cart_info` VALUES (37, 39, 42, 19, '{\"addTime\":1573888313,\"productId\":19,\"seckillId\":0,\"vipTruePrice\":120.0,\"combinationId\":0,\"costPrice\":100.0,\"trueStock\":997,\"truePrice\":120.0,\"type\":\"product\",\"cartNum\":1,\"productInfo\":{\"otPrice\":0.50,\"userCollect\":false,\"description\":\"<p style=\\\"text-align: center;\\\"><strong>文件请传QQ2412733099，</strong></p><p style=\\\"text-align: center;\\\"><strong>718504558或2412733099@qq.com邮箱，</strong></p><p style=\\\"text-align: center;\\\"><strong>手机/微信：13733990583</strong></p><p style=\\\"text-align: center;\\\"><strong>量大请联系店主，一定让您满意而归</strong></p><p style=\\\"text-align: center;\\\"><strong>&nbsp; &nbsp;实体店面经营 保质保量</strong></p><p style=\\\"text-align: center;\\\"><strong>A4黑白2毛/张，量大1毛/张，</strong></p><p style=\\\"text-align: center;\\\"><strong>A3黑白双面5毛/张，量大3毛/张，</strong></p><p style=\\\"text-align: center;\\\"><strong>更大量请联系店主报价，</strong></p><p style=\\\"text-align: center;\\\"><strong>每消费1元可积1分，1分抵现金1毛，</strong></p><p style=\\\"text-align: center;\\\"><strong>付款时直接抵扣</strong></p><p style=\\\"text-align: center;\\\"><strong>（如此优惠的基础上还可积分，积分抵现金）</strong></p><p style=\\\"text-align: left;\\\"><strong><br></strong></p><p><br></p><p>&nbsp; &nbsp;&nbsp;<img src=\\\"https://image.dayouqiantu.cn/5ca03007150f1.jpg\\\" style=\\\"max-width: 100%;\\\"><br></p>\",\"merUse\":0,\"isPostage\":1,\"image_base\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"isBest\":1,\"sales\":14,\"price\":120.00,\"isBargain\":0,\"userLike\":false,\"vipPrice\":0.20,\"storeName\":\"70gA4黑白打印复印\",\"id\":19,\"keyword\":\"打印复印\",\"stock\":99,\"image\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"cost\":0.20,\"isGood\":1,\"unitName\":\"张\",\"isBenefit\":1,\"giveIntegral\":1.00,\"isNew\":1,\"sort\":1,\"sliderImageArr\":[\"https://image.dayouqiantu.cn/5ca01c7fc9238.jpg\",\"https://image.dayouqiantu.cn/5ca01c7676042.jpg\"],\"sliderImage\":\"https://image.dayouqiantu.cn/5ca01c7fc9238.jpg,https://image.dayouqiantu.cn/5ca01c7676042.jpg\",\"barCode\":\"\",\"isShow\":1,\"postage\":0.00,\"codePath\":\"\",\"soureLink\":\"\",\"cateId\":\"24\",\"isSeckill\":0,\"storeInfo\":\"打印复印资料A4黑白彩色印刷画册书本装订图文数码快印服务\",\"isDel\":0,\"isHot\":1,\"attrInfo\":{\"image\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"cost\":100.00,\"productId\":19,\"price\":120.00,\"unique\":\"00e86525a7af4dcf9e653ae0a2062369\",\"suk\":\"A1,白色\",\"id\":22,\"stock\":997}},\"uid\":14,\"productAttrUnique\":\"00e86525a7af4dcf9e653ae0a2062369\",\"bargainId\":0,\"id\":42}', 'cf1ab595ceeb4d1281e56a65b1815241');
INSERT INTO `yx_store_order_cart_info` VALUES (40, 42, 43, 19, '{\"addTime\":1573979445,\"productId\":19,\"seckillId\":0,\"vipTruePrice\":120.0,\"combinationId\":0,\"costPrice\":100.0,\"trueStock\":997,\"truePrice\":120.0,\"type\":\"product\",\"cartNum\":1,\"productInfo\":{\"otPrice\":0.50,\"userCollect\":false,\"description\":\"<p style=\\\"text-align: center;\\\"><strong>文件请传QQ2412733099，</strong></p><p style=\\\"text-align: center;\\\"><strong>718504558或2412733099@qq.com邮箱，</strong></p><p style=\\\"text-align: center;\\\"><strong>手机/微信：13733990583</strong></p><p style=\\\"text-align: center;\\\"><strong>量大请联系店主，一定让您满意而归</strong></p><p style=\\\"text-align: center;\\\"><strong>&nbsp; &nbsp;实体店面经营 保质保量</strong></p><p style=\\\"text-align: center;\\\"><strong>A4黑白2毛/张，量大1毛/张，</strong></p><p style=\\\"text-align: center;\\\"><strong>A3黑白双面5毛/张，量大3毛/张，</strong></p><p style=\\\"text-align: center;\\\"><strong>更大量请联系店主报价，</strong></p><p style=\\\"text-align: center;\\\"><strong>每消费1元可积1分，1分抵现金1毛，</strong></p><p style=\\\"text-align: center;\\\"><strong>付款时直接抵扣</strong></p><p style=\\\"text-align: center;\\\"><strong>（如此优惠的基础上还可积分，积分抵现金）</strong></p><p style=\\\"text-align: left;\\\"><strong><br></strong></p><p><br></p><p>&nbsp; &nbsp;&nbsp;<img src=\\\"https://image.dayouqiantu.cn/5ca03007150f1.jpg\\\" style=\\\"max-width: 100%;\\\"><br></p>\",\"merUse\":0,\"isPostage\":1,\"image_base\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"isBest\":1,\"sales\":14,\"price\":120.00,\"isBargain\":0,\"userLike\":false,\"vipPrice\":0.20,\"storeName\":\"70gA4黑白打印复印\",\"id\":19,\"keyword\":\"打印复印\",\"stock\":99,\"image\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"cost\":0.20,\"isGood\":1,\"unitName\":\"张\",\"isBenefit\":1,\"giveIntegral\":1.00,\"isNew\":1,\"sort\":1,\"sliderImageArr\":[\"https://image.dayouqiantu.cn/5ca01c7fc9238.jpg\",\"https://image.dayouqiantu.cn/5ca01c7676042.jpg\"],\"sliderImage\":\"https://image.dayouqiantu.cn/5ca01c7fc9238.jpg,https://image.dayouqiantu.cn/5ca01c7676042.jpg\",\"barCode\":\"\",\"isShow\":1,\"postage\":0.00,\"codePath\":\"\",\"soureLink\":\"\",\"cateId\":\"24\",\"isSeckill\":0,\"storeInfo\":\"打印复印资料A4黑白彩色印刷画册书本装订图文数码快印服务\",\"isDel\":0,\"isHot\":1,\"attrInfo\":{\"image\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"cost\":100.00,\"productId\":19,\"price\":120.00,\"unique\":\"00e86525a7af4dcf9e653ae0a2062369\",\"suk\":\"A1,白色\",\"id\":22,\"stock\":997}},\"uid\":14,\"productAttrUnique\":\"00e86525a7af4dcf9e653ae0a2062369\",\"bargainId\":0,\"id\":43}', '6b4282ee66e9400e881cbb0a94d3a469');
INSERT INTO `yx_store_order_cart_info` VALUES (41, 43, 44, 19, '{\"addTime\":1573979624,\"productId\":19,\"seckillId\":0,\"vipTruePrice\":120.0,\"combinationId\":0,\"costPrice\":100.0,\"trueStock\":996,\"truePrice\":120.0,\"type\":\"product\",\"cartNum\":1,\"productInfo\":{\"otPrice\":0.50,\"userCollect\":false,\"description\":\"<p style=\\\"text-align: center;\\\"><strong>文件请传QQ2412733099，</strong></p><p style=\\\"text-align: center;\\\"><strong>718504558或2412733099@qq.com邮箱，</strong></p><p style=\\\"text-align: center;\\\"><strong>手机/微信：13733990583</strong></p><p style=\\\"text-align: center;\\\"><strong>量大请联系店主，一定让您满意而归</strong></p><p style=\\\"text-align: center;\\\"><strong>&nbsp; &nbsp;实体店面经营 保质保量</strong></p><p style=\\\"text-align: center;\\\"><strong>A4黑白2毛/张，量大1毛/张，</strong></p><p style=\\\"text-align: center;\\\"><strong>A3黑白双面5毛/张，量大3毛/张，</strong></p><p style=\\\"text-align: center;\\\"><strong>更大量请联系店主报价，</strong></p><p style=\\\"text-align: center;\\\"><strong>每消费1元可积1分，1分抵现金1毛，</strong></p><p style=\\\"text-align: center;\\\"><strong>付款时直接抵扣</strong></p><p style=\\\"text-align: center;\\\"><strong>（如此优惠的基础上还可积分，积分抵现金）</strong></p><p style=\\\"text-align: left;\\\"><strong><br></strong></p><p><br></p><p>&nbsp; &nbsp;&nbsp;<img src=\\\"https://image.dayouqiantu.cn/5ca03007150f1.jpg\\\" style=\\\"max-width: 100%;\\\"><br></p>\",\"merUse\":0,\"isPostage\":1,\"image_base\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"isBest\":1,\"sales\":15,\"price\":120.00,\"isBargain\":0,\"userLike\":false,\"vipPrice\":0.20,\"storeName\":\"70gA4黑白打印复印\",\"id\":19,\"keyword\":\"打印复印\",\"stock\":99,\"image\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"cost\":0.20,\"isGood\":1,\"unitName\":\"张\",\"isBenefit\":1,\"giveIntegral\":1.00,\"isNew\":1,\"sort\":1,\"sliderImageArr\":[\"https://image.dayouqiantu.cn/5ca01c7fc9238.jpg\",\"https://image.dayouqiantu.cn/5ca01c7676042.jpg\"],\"sliderImage\":\"https://image.dayouqiantu.cn/5ca01c7fc9238.jpg,https://image.dayouqiantu.cn/5ca01c7676042.jpg\",\"barCode\":\"\",\"isShow\":1,\"postage\":0.00,\"codePath\":\"\",\"soureLink\":\"\",\"cateId\":\"24\",\"isSeckill\":0,\"storeInfo\":\"打印复印资料A4黑白彩色印刷画册书本装订图文数码快印服务\",\"isDel\":0,\"isHot\":1,\"attrInfo\":{\"image\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"cost\":100.00,\"productId\":19,\"price\":120.00,\"unique\":\"00e86525a7af4dcf9e653ae0a2062369\",\"suk\":\"A1,白色\",\"id\":22,\"stock\":996}},\"uid\":14,\"productAttrUnique\":\"00e86525a7af4dcf9e653ae0a2062369\",\"bargainId\":0,\"id\":44}', '209dc336955b40818b5cc42345e0a6e5');
INSERT INTO `yx_store_order_cart_info` VALUES (42, 44, 45, 19, '{\"addTime\":1573980036,\"productId\":19,\"seckillId\":0,\"vipTruePrice\":120.0,\"combinationId\":0,\"costPrice\":100.0,\"trueStock\":995,\"truePrice\":120.0,\"type\":\"product\",\"cartNum\":1,\"productInfo\":{\"otPrice\":0.50,\"userCollect\":false,\"description\":\"<p style=\\\"text-align: center;\\\"><strong>文件请传QQ2412733099，</strong></p><p style=\\\"text-align: center;\\\"><strong>718504558或2412733099@qq.com邮箱，</strong></p><p style=\\\"text-align: center;\\\"><strong>手机/微信：13733990583</strong></p><p style=\\\"text-align: center;\\\"><strong>量大请联系店主，一定让您满意而归</strong></p><p style=\\\"text-align: center;\\\"><strong>&nbsp; &nbsp;实体店面经营 保质保量</strong></p><p style=\\\"text-align: center;\\\"><strong>A4黑白2毛/张，量大1毛/张，</strong></p><p style=\\\"text-align: center;\\\"><strong>A3黑白双面5毛/张，量大3毛/张，</strong></p><p style=\\\"text-align: center;\\\"><strong>更大量请联系店主报价，</strong></p><p style=\\\"text-align: center;\\\"><strong>每消费1元可积1分，1分抵现金1毛，</strong></p><p style=\\\"text-align: center;\\\"><strong>付款时直接抵扣</strong></p><p style=\\\"text-align: center;\\\"><strong>（如此优惠的基础上还可积分，积分抵现金）</strong></p><p style=\\\"text-align: left;\\\"><strong><br></strong></p><p><br></p><p>&nbsp; &nbsp;&nbsp;<img src=\\\"https://image.dayouqiantu.cn/5ca03007150f1.jpg\\\" style=\\\"max-width: 100%;\\\"><br></p>\",\"merUse\":0,\"isPostage\":1,\"image_base\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"isBest\":1,\"sales\":16,\"price\":120.00,\"isBargain\":0,\"userLike\":false,\"vipPrice\":0.20,\"storeName\":\"70gA4黑白打印复印\",\"id\":19,\"keyword\":\"打印复印\",\"stock\":99,\"image\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"cost\":0.20,\"isGood\":1,\"unitName\":\"张\",\"isBenefit\":1,\"giveIntegral\":1.00,\"isNew\":1,\"sort\":1,\"sliderImageArr\":[\"https://image.dayouqiantu.cn/5ca01c7fc9238.jpg\",\"https://image.dayouqiantu.cn/5ca01c7676042.jpg\"],\"sliderImage\":\"https://image.dayouqiantu.cn/5ca01c7fc9238.jpg,https://image.dayouqiantu.cn/5ca01c7676042.jpg\",\"barCode\":\"\",\"isShow\":1,\"postage\":0.00,\"codePath\":\"\",\"soureLink\":\"\",\"cateId\":\"24\",\"isSeckill\":0,\"storeInfo\":\"打印复印资料A4黑白彩色印刷画册书本装订图文数码快印服务\",\"isDel\":0,\"isHot\":1,\"attrInfo\":{\"image\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"cost\":100.00,\"productId\":19,\"price\":120.00,\"unique\":\"00e86525a7af4dcf9e653ae0a2062369\",\"suk\":\"A1,白色\",\"id\":22,\"stock\":995}},\"uid\":14,\"productAttrUnique\":\"00e86525a7af4dcf9e653ae0a2062369\",\"bargainId\":0,\"id\":45}', 'a21ddcde860c469bbfca289347a1ee17');
INSERT INTO `yx_store_order_cart_info` VALUES (43, 45, 46, 19, '{\"addTime\":1573980984,\"productId\":19,\"seckillId\":0,\"vipTruePrice\":120.0,\"combinationId\":0,\"costPrice\":100.0,\"trueStock\":994,\"truePrice\":120.0,\"type\":\"product\",\"cartNum\":1,\"productInfo\":{\"otPrice\":0.50,\"userCollect\":false,\"description\":\"<p style=\\\"text-align: center;\\\"><strong>文件请传QQ2412733099，</strong></p><p style=\\\"text-align: center;\\\"><strong>718504558或2412733099@qq.com邮箱，</strong></p><p style=\\\"text-align: center;\\\"><strong>手机/微信：13733990583</strong></p><p style=\\\"text-align: center;\\\"><strong>量大请联系店主，一定让您满意而归</strong></p><p style=\\\"text-align: center;\\\"><strong>&nbsp; &nbsp;实体店面经营 保质保量</strong></p><p style=\\\"text-align: center;\\\"><strong>A4黑白2毛/张，量大1毛/张，</strong></p><p style=\\\"text-align: center;\\\"><strong>A3黑白双面5毛/张，量大3毛/张，</strong></p><p style=\\\"text-align: center;\\\"><strong>更大量请联系店主报价，</strong></p><p style=\\\"text-align: center;\\\"><strong>每消费1元可积1分，1分抵现金1毛，</strong></p><p style=\\\"text-align: center;\\\"><strong>付款时直接抵扣</strong></p><p style=\\\"text-align: center;\\\"><strong>（如此优惠的基础上还可积分，积分抵现金）</strong></p><p style=\\\"text-align: left;\\\"><strong><br></strong></p><p><br></p><p>&nbsp; &nbsp;&nbsp;<img src=\\\"https://image.dayouqiantu.cn/5ca03007150f1.jpg\\\" style=\\\"max-width: 100%;\\\"><br></p>\",\"merUse\":0,\"isPostage\":1,\"image_base\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"isBest\":1,\"sales\":17,\"price\":120.00,\"isBargain\":0,\"userLike\":false,\"vipPrice\":0.20,\"storeName\":\"70gA4黑白打印复印\",\"id\":19,\"keyword\":\"打印复印\",\"stock\":99,\"image\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"cost\":0.20,\"isGood\":1,\"unitName\":\"张\",\"isBenefit\":1,\"giveIntegral\":1.00,\"isNew\":1,\"sort\":1,\"sliderImageArr\":[\"https://image.dayouqiantu.cn/5ca01c7fc9238.jpg\",\"https://image.dayouqiantu.cn/5ca01c7676042.jpg\"],\"sliderImage\":\"https://image.dayouqiantu.cn/5ca01c7fc9238.jpg,https://image.dayouqiantu.cn/5ca01c7676042.jpg\",\"barCode\":\"\",\"isShow\":1,\"postage\":0.00,\"codePath\":\"\",\"soureLink\":\"\",\"cateId\":\"24\",\"isSeckill\":0,\"storeInfo\":\"打印复印资料A4黑白彩色印刷画册书本装订图文数码快印服务\",\"isDel\":0,\"isHot\":1,\"attrInfo\":{\"image\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"cost\":100.00,\"productId\":19,\"price\":120.00,\"unique\":\"00e86525a7af4dcf9e653ae0a2062369\",\"suk\":\"A1,白色\",\"id\":22,\"stock\":994}},\"uid\":14,\"productAttrUnique\":\"00e86525a7af4dcf9e653ae0a2062369\",\"bargainId\":0,\"id\":46}', 'bef7346c0e6b439c9b7c9c9e55141848');
INSERT INTO `yx_store_order_cart_info` VALUES (44, 46, 47, 19, '{\"addTime\":1573981512,\"productId\":19,\"seckillId\":0,\"vipTruePrice\":120.0,\"combinationId\":0,\"costPrice\":100.0,\"trueStock\":993,\"truePrice\":120.0,\"type\":\"product\",\"cartNum\":1,\"productInfo\":{\"otPrice\":0.50,\"userCollect\":false,\"description\":\"<p style=\\\"text-align: center;\\\"><strong>文件请传QQ2412733099，</strong></p><p style=\\\"text-align: center;\\\"><strong>718504558或2412733099@qq.com邮箱，</strong></p><p style=\\\"text-align: center;\\\"><strong>手机/微信：13733990583</strong></p><p style=\\\"text-align: center;\\\"><strong>量大请联系店主，一定让您满意而归</strong></p><p style=\\\"text-align: center;\\\"><strong>&nbsp; &nbsp;实体店面经营 保质保量</strong></p><p style=\\\"text-align: center;\\\"><strong>A4黑白2毛/张，量大1毛/张，</strong></p><p style=\\\"text-align: center;\\\"><strong>A3黑白双面5毛/张，量大3毛/张，</strong></p><p style=\\\"text-align: center;\\\"><strong>更大量请联系店主报价，</strong></p><p style=\\\"text-align: center;\\\"><strong>每消费1元可积1分，1分抵现金1毛，</strong></p><p style=\\\"text-align: center;\\\"><strong>付款时直接抵扣</strong></p><p style=\\\"text-align: center;\\\"><strong>（如此优惠的基础上还可积分，积分抵现金）</strong></p><p style=\\\"text-align: left;\\\"><strong><br></strong></p><p><br></p><p>&nbsp; &nbsp;&nbsp;<img src=\\\"https://image.dayouqiantu.cn/5ca03007150f1.jpg\\\" style=\\\"max-width: 100%;\\\"><br></p>\",\"merUse\":0,\"isPostage\":1,\"image_base\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"isBest\":1,\"sales\":18,\"price\":120.00,\"isBargain\":0,\"userLike\":false,\"vipPrice\":0.20,\"storeName\":\"70gA4黑白打印复印\",\"id\":19,\"keyword\":\"打印复印\",\"stock\":99,\"image\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"cost\":0.20,\"isGood\":1,\"unitName\":\"张\",\"isBenefit\":1,\"giveIntegral\":1.00,\"isNew\":1,\"sort\":1,\"sliderImageArr\":[\"https://image.dayouqiantu.cn/5ca01c7fc9238.jpg\",\"https://image.dayouqiantu.cn/5ca01c7676042.jpg\"],\"sliderImage\":\"https://image.dayouqiantu.cn/5ca01c7fc9238.jpg,https://image.dayouqiantu.cn/5ca01c7676042.jpg\",\"barCode\":\"\",\"isShow\":1,\"postage\":0.00,\"codePath\":\"\",\"soureLink\":\"\",\"cateId\":\"24\",\"isSeckill\":0,\"storeInfo\":\"打印复印资料A4黑白彩色印刷画册书本装订图文数码快印服务\",\"isDel\":0,\"isHot\":1,\"attrInfo\":{\"image\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"cost\":100.00,\"productId\":19,\"price\":120.00,\"unique\":\"00e86525a7af4dcf9e653ae0a2062369\",\"suk\":\"A1,白色\",\"id\":22,\"stock\":993}},\"uid\":14,\"productAttrUnique\":\"00e86525a7af4dcf9e653ae0a2062369\",\"bargainId\":0,\"id\":47}', 'fe65a7d18c884816bf6e6118e816c27b');
INSERT INTO `yx_store_order_cart_info` VALUES (45, 47, 48, 19, '{\"addTime\":1573981625,\"productId\":19,\"seckillId\":0,\"vipTruePrice\":120.0,\"combinationId\":0,\"costPrice\":100.0,\"trueStock\":992,\"truePrice\":120.0,\"type\":\"product\",\"cartNum\":1,\"productInfo\":{\"otPrice\":0.50,\"userCollect\":false,\"description\":\"<p style=\\\"text-align: center;\\\"><strong>文件请传QQ2412733099，</strong></p><p style=\\\"text-align: center;\\\"><strong>718504558或2412733099@qq.com邮箱，</strong></p><p style=\\\"text-align: center;\\\"><strong>手机/微信：13733990583</strong></p><p style=\\\"text-align: center;\\\"><strong>量大请联系店主，一定让您满意而归</strong></p><p style=\\\"text-align: center;\\\"><strong>&nbsp; &nbsp;实体店面经营 保质保量</strong></p><p style=\\\"text-align: center;\\\"><strong>A4黑白2毛/张，量大1毛/张，</strong></p><p style=\\\"text-align: center;\\\"><strong>A3黑白双面5毛/张，量大3毛/张，</strong></p><p style=\\\"text-align: center;\\\"><strong>更大量请联系店主报价，</strong></p><p style=\\\"text-align: center;\\\"><strong>每消费1元可积1分，1分抵现金1毛，</strong></p><p style=\\\"text-align: center;\\\"><strong>付款时直接抵扣</strong></p><p style=\\\"text-align: center;\\\"><strong>（如此优惠的基础上还可积分，积分抵现金）</strong></p><p style=\\\"text-align: left;\\\"><strong><br></strong></p><p><br></p><p>&nbsp; &nbsp;&nbsp;<img src=\\\"https://image.dayouqiantu.cn/5ca03007150f1.jpg\\\" style=\\\"max-width: 100%;\\\"><br></p>\",\"merUse\":0,\"isPostage\":1,\"image_base\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"isBest\":1,\"sales\":19,\"price\":120.00,\"isBargain\":0,\"userLike\":false,\"vipPrice\":0.20,\"storeName\":\"70gA4黑白打印复印\",\"id\":19,\"keyword\":\"打印复印\",\"stock\":99,\"image\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"cost\":0.20,\"isGood\":1,\"unitName\":\"张\",\"isBenefit\":1,\"giveIntegral\":1.00,\"isNew\":1,\"sort\":1,\"sliderImageArr\":[\"https://image.dayouqiantu.cn/5ca01c7fc9238.jpg\",\"https://image.dayouqiantu.cn/5ca01c7676042.jpg\"],\"sliderImage\":\"https://image.dayouqiantu.cn/5ca01c7fc9238.jpg,https://image.dayouqiantu.cn/5ca01c7676042.jpg\",\"barCode\":\"\",\"isShow\":1,\"postage\":0.00,\"codePath\":\"\",\"soureLink\":\"\",\"cateId\":\"24\",\"isSeckill\":0,\"storeInfo\":\"打印复印资料A4黑白彩色印刷画册书本装订图文数码快印服务\",\"isDel\":0,\"isHot\":1,\"attrInfo\":{\"image\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"cost\":100.00,\"productId\":19,\"price\":120.00,\"unique\":\"00e86525a7af4dcf9e653ae0a2062369\",\"suk\":\"A1,白色\",\"id\":22,\"stock\":992}},\"uid\":14,\"productAttrUnique\":\"00e86525a7af4dcf9e653ae0a2062369\",\"bargainId\":0,\"id\":48}', '0cb3929d4e9041a2a15fe0b8b99b7582');
INSERT INTO `yx_store_order_cart_info` VALUES (46, 48, 49, 19, '{\"addTime\":1573982911,\"productId\":19,\"seckillId\":0,\"vipTruePrice\":120.0,\"combinationId\":0,\"costPrice\":100.0,\"trueStock\":991,\"truePrice\":120.0,\"type\":\"product\",\"cartNum\":1,\"productInfo\":{\"otPrice\":0.50,\"userCollect\":false,\"description\":\"<p style=\\\"text-align: center;\\\"><strong>文件请传QQ2412733099，</strong></p><p style=\\\"text-align: center;\\\"><strong>718504558或2412733099@qq.com邮箱，</strong></p><p style=\\\"text-align: center;\\\"><strong>手机/微信：13733990583</strong></p><p style=\\\"text-align: center;\\\"><strong>量大请联系店主，一定让您满意而归</strong></p><p style=\\\"text-align: center;\\\"><strong>&nbsp; &nbsp;实体店面经营 保质保量</strong></p><p style=\\\"text-align: center;\\\"><strong>A4黑白2毛/张，量大1毛/张，</strong></p><p style=\\\"text-align: center;\\\"><strong>A3黑白双面5毛/张，量大3毛/张，</strong></p><p style=\\\"text-align: center;\\\"><strong>更大量请联系店主报价，</strong></p><p style=\\\"text-align: center;\\\"><strong>每消费1元可积1分，1分抵现金1毛，</strong></p><p style=\\\"text-align: center;\\\"><strong>付款时直接抵扣</strong></p><p style=\\\"text-align: center;\\\"><strong>（如此优惠的基础上还可积分，积分抵现金）</strong></p><p style=\\\"text-align: left;\\\"><strong><br></strong></p><p><br></p><p>&nbsp; &nbsp;&nbsp;<img src=\\\"https://image.dayouqiantu.cn/5ca03007150f1.jpg\\\" style=\\\"max-width: 100%;\\\"><br></p>\",\"merUse\":0,\"isPostage\":1,\"image_base\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"isBest\":1,\"sales\":20,\"price\":120.00,\"isBargain\":0,\"userLike\":false,\"vipPrice\":0.20,\"storeName\":\"70gA4黑白打印复印\",\"id\":19,\"keyword\":\"打印复印\",\"stock\":99,\"image\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"cost\":0.20,\"isGood\":1,\"unitName\":\"张\",\"isBenefit\":1,\"giveIntegral\":1.00,\"isNew\":1,\"sort\":1,\"sliderImageArr\":[\"https://image.dayouqiantu.cn/5ca01c7fc9238.jpg\",\"https://image.dayouqiantu.cn/5ca01c7676042.jpg\"],\"sliderImage\":\"https://image.dayouqiantu.cn/5ca01c7fc9238.jpg,https://image.dayouqiantu.cn/5ca01c7676042.jpg\",\"barCode\":\"\",\"isShow\":1,\"postage\":0.00,\"codePath\":\"\",\"soureLink\":\"\",\"cateId\":\"24\",\"isSeckill\":0,\"storeInfo\":\"打印复印资料A4黑白彩色印刷画册书本装订图文数码快印服务\",\"isDel\":0,\"isHot\":1,\"attrInfo\":{\"image\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"cost\":100.00,\"productId\":19,\"price\":120.00,\"unique\":\"00e86525a7af4dcf9e653ae0a2062369\",\"suk\":\"A1,白色\",\"id\":22,\"stock\":991}},\"uid\":14,\"productAttrUnique\":\"00e86525a7af4dcf9e653ae0a2062369\",\"bargainId\":0,\"id\":49}', '6b82f8e86ad744a884266f1bae1bb607');
INSERT INTO `yx_store_order_cart_info` VALUES (47, 49, 50, 19, '{\"addTime\":1573983129,\"productId\":19,\"seckillId\":0,\"vipTruePrice\":120.0,\"combinationId\":0,\"costPrice\":100.0,\"trueStock\":990,\"truePrice\":120.0,\"type\":\"product\",\"cartNum\":1,\"productInfo\":{\"otPrice\":0.50,\"userCollect\":false,\"description\":\"<p style=\\\"text-align: center;\\\"><strong>文件请传QQ2412733099，</strong></p><p style=\\\"text-align: center;\\\"><strong>718504558或2412733099@qq.com邮箱，</strong></p><p style=\\\"text-align: center;\\\"><strong>手机/微信：13733990583</strong></p><p style=\\\"text-align: center;\\\"><strong>量大请联系店主，一定让您满意而归</strong></p><p style=\\\"text-align: center;\\\"><strong>&nbsp; &nbsp;实体店面经营 保质保量</strong></p><p style=\\\"text-align: center;\\\"><strong>A4黑白2毛/张，量大1毛/张，</strong></p><p style=\\\"text-align: center;\\\"><strong>A3黑白双面5毛/张，量大3毛/张，</strong></p><p style=\\\"text-align: center;\\\"><strong>更大量请联系店主报价，</strong></p><p style=\\\"text-align: center;\\\"><strong>每消费1元可积1分，1分抵现金1毛，</strong></p><p style=\\\"text-align: center;\\\"><strong>付款时直接抵扣</strong></p><p style=\\\"text-align: center;\\\"><strong>（如此优惠的基础上还可积分，积分抵现金）</strong></p><p style=\\\"text-align: left;\\\"><strong><br></strong></p><p><br></p><p>&nbsp; &nbsp;&nbsp;<img src=\\\"https://image.dayouqiantu.cn/5ca03007150f1.jpg\\\" style=\\\"max-width: 100%;\\\"><br></p>\",\"merUse\":0,\"isPostage\":1,\"image_base\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"isBest\":1,\"sales\":21,\"price\":120.00,\"isBargain\":0,\"userLike\":false,\"vipPrice\":0.20,\"storeName\":\"70gA4黑白打印复印\",\"id\":19,\"keyword\":\"打印复印\",\"stock\":99,\"image\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"cost\":0.20,\"isGood\":1,\"unitName\":\"张\",\"isBenefit\":1,\"giveIntegral\":1.00,\"isNew\":1,\"sort\":1,\"sliderImageArr\":[\"https://image.dayouqiantu.cn/5ca01c7fc9238.jpg\",\"https://image.dayouqiantu.cn/5ca01c7676042.jpg\"],\"sliderImage\":\"https://image.dayouqiantu.cn/5ca01c7fc9238.jpg,https://image.dayouqiantu.cn/5ca01c7676042.jpg\",\"barCode\":\"\",\"isShow\":1,\"postage\":0.00,\"codePath\":\"\",\"soureLink\":\"\",\"cateId\":\"24\",\"isSeckill\":0,\"storeInfo\":\"打印复印资料A4黑白彩色印刷画册书本装订图文数码快印服务\",\"isDel\":0,\"isHot\":1,\"attrInfo\":{\"image\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"cost\":100.00,\"productId\":19,\"price\":120.00,\"unique\":\"00e86525a7af4dcf9e653ae0a2062369\",\"suk\":\"A1,白色\",\"id\":22,\"stock\":990}},\"uid\":14,\"productAttrUnique\":\"00e86525a7af4dcf9e653ae0a2062369\",\"bargainId\":0,\"id\":50}', 'ae654633e331445caea3615a80081b32');
INSERT INTO `yx_store_order_cart_info` VALUES (48, 50, 51, 19, '{\"addTime\":1573984480,\"productId\":19,\"seckillId\":0,\"vipTruePrice\":120.0,\"combinationId\":0,\"costPrice\":100.0,\"trueStock\":989,\"truePrice\":120.0,\"type\":\"product\",\"cartNum\":1,\"productInfo\":{\"otPrice\":0.50,\"userCollect\":false,\"description\":\"<p style=\\\"text-align: center;\\\"><strong>文件请传QQ2412733099，</strong></p><p style=\\\"text-align: center;\\\"><strong>718504558或2412733099@qq.com邮箱，</strong></p><p style=\\\"text-align: center;\\\"><strong>手机/微信：13733990583</strong></p><p style=\\\"text-align: center;\\\"><strong>量大请联系店主，一定让您满意而归</strong></p><p style=\\\"text-align: center;\\\"><strong>&nbsp; &nbsp;实体店面经营 保质保量</strong></p><p style=\\\"text-align: center;\\\"><strong>A4黑白2毛/张，量大1毛/张，</strong></p><p style=\\\"text-align: center;\\\"><strong>A3黑白双面5毛/张，量大3毛/张，</strong></p><p style=\\\"text-align: center;\\\"><strong>更大量请联系店主报价，</strong></p><p style=\\\"text-align: center;\\\"><strong>每消费1元可积1分，1分抵现金1毛，</strong></p><p style=\\\"text-align: center;\\\"><strong>付款时直接抵扣</strong></p><p style=\\\"text-align: center;\\\"><strong>（如此优惠的基础上还可积分，积分抵现金）</strong></p><p style=\\\"text-align: left;\\\"><strong><br></strong></p><p><br></p><p>&nbsp; &nbsp;&nbsp;<img src=\\\"https://image.dayouqiantu.cn/5ca03007150f1.jpg\\\" style=\\\"max-width: 100%;\\\"><br></p>\",\"merUse\":0,\"isPostage\":1,\"image_base\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"isBest\":1,\"sales\":22,\"price\":120.00,\"isBargain\":0,\"userLike\":false,\"vipPrice\":0.20,\"storeName\":\"70gA4黑白打印复印\",\"id\":19,\"keyword\":\"打印复印\",\"stock\":99,\"image\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"cost\":0.20,\"isGood\":1,\"unitName\":\"张\",\"isBenefit\":1,\"giveIntegral\":1.00,\"isNew\":1,\"sort\":1,\"sliderImageArr\":[\"https://image.dayouqiantu.cn/5ca01c7fc9238.jpg\",\"https://image.dayouqiantu.cn/5ca01c7676042.jpg\"],\"sliderImage\":\"https://image.dayouqiantu.cn/5ca01c7fc9238.jpg,https://image.dayouqiantu.cn/5ca01c7676042.jpg\",\"barCode\":\"\",\"isShow\":1,\"postage\":0.00,\"codePath\":\"\",\"soureLink\":\"\",\"cateId\":\"24\",\"isSeckill\":0,\"storeInfo\":\"打印复印资料A4黑白彩色印刷画册书本装订图文数码快印服务\",\"isDel\":0,\"isHot\":1,\"attrInfo\":{\"image\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"cost\":100.00,\"productId\":19,\"price\":120.00,\"unique\":\"00e86525a7af4dcf9e653ae0a2062369\",\"suk\":\"A1,白色\",\"id\":22,\"stock\":989}},\"uid\":14,\"productAttrUnique\":\"00e86525a7af4dcf9e653ae0a2062369\",\"bargainId\":0,\"id\":51}', 'f849d4a0b54b46e192399b421c94b432');
INSERT INTO `yx_store_order_cart_info` VALUES (49, 51, 52, 19, '{\"addTime\":1573984575,\"productId\":19,\"seckillId\":0,\"vipTruePrice\":120.0,\"combinationId\":0,\"costPrice\":100.0,\"trueStock\":988,\"truePrice\":120.0,\"type\":\"product\",\"cartNum\":1,\"productInfo\":{\"otPrice\":0.50,\"userCollect\":false,\"description\":\"<p style=\\\"text-align: center;\\\"><strong>文件请传QQ2412733099，</strong></p><p style=\\\"text-align: center;\\\"><strong>718504558或2412733099@qq.com邮箱，</strong></p><p style=\\\"text-align: center;\\\"><strong>手机/微信：13733990583</strong></p><p style=\\\"text-align: center;\\\"><strong>量大请联系店主，一定让您满意而归</strong></p><p style=\\\"text-align: center;\\\"><strong>&nbsp; &nbsp;实体店面经营 保质保量</strong></p><p style=\\\"text-align: center;\\\"><strong>A4黑白2毛/张，量大1毛/张，</strong></p><p style=\\\"text-align: center;\\\"><strong>A3黑白双面5毛/张，量大3毛/张，</strong></p><p style=\\\"text-align: center;\\\"><strong>更大量请联系店主报价，</strong></p><p style=\\\"text-align: center;\\\"><strong>每消费1元可积1分，1分抵现金1毛，</strong></p><p style=\\\"text-align: center;\\\"><strong>付款时直接抵扣</strong></p><p style=\\\"text-align: center;\\\"><strong>（如此优惠的基础上还可积分，积分抵现金）</strong></p><p style=\\\"text-align: left;\\\"><strong><br></strong></p><p><br></p><p>&nbsp; &nbsp;&nbsp;<img src=\\\"https://image.dayouqiantu.cn/5ca03007150f1.jpg\\\" style=\\\"max-width: 100%;\\\"><br></p>\",\"merUse\":0,\"isPostage\":1,\"image_base\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"isBest\":1,\"sales\":23,\"price\":120.00,\"isBargain\":0,\"userLike\":false,\"vipPrice\":0.20,\"storeName\":\"70gA4黑白打印复印\",\"id\":19,\"keyword\":\"打印复印\",\"stock\":99,\"image\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"cost\":0.20,\"isGood\":1,\"unitName\":\"张\",\"isBenefit\":1,\"giveIntegral\":1.00,\"isNew\":1,\"sort\":1,\"sliderImageArr\":[\"https://image.dayouqiantu.cn/5ca01c7fc9238.jpg\",\"https://image.dayouqiantu.cn/5ca01c7676042.jpg\"],\"sliderImage\":\"https://image.dayouqiantu.cn/5ca01c7fc9238.jpg,https://image.dayouqiantu.cn/5ca01c7676042.jpg\",\"barCode\":\"\",\"isShow\":1,\"postage\":0.00,\"codePath\":\"\",\"soureLink\":\"\",\"cateId\":\"24\",\"isSeckill\":0,\"storeInfo\":\"打印复印资料A4黑白彩色印刷画册书本装订图文数码快印服务\",\"isDel\":0,\"isHot\":1,\"attrInfo\":{\"image\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"cost\":100.00,\"productId\":19,\"price\":120.00,\"unique\":\"00e86525a7af4dcf9e653ae0a2062369\",\"suk\":\"A1,白色\",\"id\":22,\"stock\":988}},\"uid\":14,\"productAttrUnique\":\"00e86525a7af4dcf9e653ae0a2062369\",\"bargainId\":0,\"id\":52}', '8cf1e3ad5bfc4cbdb14ebf26925e2772');
INSERT INTO `yx_store_order_cart_info` VALUES (50, 52, 53, 19, '{\"addTime\":1573984665,\"productId\":19,\"seckillId\":0,\"vipTruePrice\":120.0,\"combinationId\":0,\"costPrice\":100.0,\"trueStock\":996,\"truePrice\":120.0,\"type\":\"product\",\"cartNum\":1,\"productInfo\":{\"otPrice\":0.50,\"userCollect\":false,\"description\":\"<p style=\\\"text-align: center;\\\"><strong>文件请传QQ2412733099，</strong></p><p style=\\\"text-align: center;\\\"><strong>718504558或2412733099@qq.com邮箱，</strong></p><p style=\\\"text-align: center;\\\"><strong>手机/微信：13733990583</strong></p><p style=\\\"text-align: center;\\\"><strong>量大请联系店主，一定让您满意而归</strong></p><p style=\\\"text-align: center;\\\"><strong>&nbsp; &nbsp;实体店面经营 保质保量</strong></p><p style=\\\"text-align: center;\\\"><strong>A4黑白2毛/张，量大1毛/张，</strong></p><p style=\\\"text-align: center;\\\"><strong>A3黑白双面5毛/张，量大3毛/张，</strong></p><p style=\\\"text-align: center;\\\"><strong>更大量请联系店主报价，</strong></p><p style=\\\"text-align: center;\\\"><strong>每消费1元可积1分，1分抵现金1毛，</strong></p><p style=\\\"text-align: center;\\\"><strong>付款时直接抵扣</strong></p><p style=\\\"text-align: center;\\\"><strong>（如此优惠的基础上还可积分，积分抵现金）</strong></p><p style=\\\"text-align: left;\\\"><strong><br></strong></p><p><br></p><p>&nbsp; &nbsp;&nbsp;<img src=\\\"https://image.dayouqiantu.cn/5ca03007150f1.jpg\\\" style=\\\"max-width: 100%;\\\"><br></p>\",\"merUse\":0,\"isPostage\":1,\"image_base\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"isBest\":1,\"sales\":15,\"price\":120.00,\"isBargain\":0,\"userLike\":false,\"vipPrice\":0.20,\"storeName\":\"70gA4黑白打印复印\",\"id\":19,\"keyword\":\"打印复印\",\"stock\":99,\"image\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"cost\":0.20,\"isGood\":1,\"unitName\":\"张\",\"isBenefit\":1,\"giveIntegral\":1.00,\"isNew\":1,\"sort\":1,\"sliderImageArr\":[\"https://image.dayouqiantu.cn/5ca01c7fc9238.jpg\",\"https://image.dayouqiantu.cn/5ca01c7676042.jpg\"],\"sliderImage\":\"https://image.dayouqiantu.cn/5ca01c7fc9238.jpg,https://image.dayouqiantu.cn/5ca01c7676042.jpg\",\"barCode\":\"\",\"isShow\":1,\"postage\":0.00,\"codePath\":\"\",\"soureLink\":\"\",\"cateId\":\"24\",\"isSeckill\":0,\"storeInfo\":\"打印复印资料A4黑白彩色印刷画册书本装订图文数码快印服务\",\"isDel\":0,\"isHot\":1,\"attrInfo\":{\"image\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"cost\":100.00,\"productId\":19,\"price\":120.00,\"unique\":\"00e86525a7af4dcf9e653ae0a2062369\",\"suk\":\"A1,白色\",\"id\":22,\"stock\":996}},\"uid\":14,\"productAttrUnique\":\"00e86525a7af4dcf9e653ae0a2062369\",\"bargainId\":0,\"id\":53}', 'e1280295ae504aeaa06733a446a75258');
INSERT INTO `yx_store_order_cart_info` VALUES (51, 53, 54, 19, '{\"addTime\":1573985135,\"productId\":19,\"seckillId\":0,\"vipTruePrice\":120.0,\"combinationId\":0,\"costPrice\":100.0,\"trueStock\":995,\"truePrice\":120.0,\"type\":\"product\",\"cartNum\":1,\"productInfo\":{\"otPrice\":0.50,\"userCollect\":false,\"description\":\"<p style=\\\"text-align: center;\\\"><strong>文件请传QQ2412733099，</strong></p><p style=\\\"text-align: center;\\\"><strong>718504558或2412733099@qq.com邮箱，</strong></p><p style=\\\"text-align: center;\\\"><strong>手机/微信：13733990583</strong></p><p style=\\\"text-align: center;\\\"><strong>量大请联系店主，一定让您满意而归</strong></p><p style=\\\"text-align: center;\\\"><strong>&nbsp; &nbsp;实体店面经营 保质保量</strong></p><p style=\\\"text-align: center;\\\"><strong>A4黑白2毛/张，量大1毛/张，</strong></p><p style=\\\"text-align: center;\\\"><strong>A3黑白双面5毛/张，量大3毛/张，</strong></p><p style=\\\"text-align: center;\\\"><strong>更大量请联系店主报价，</strong></p><p style=\\\"text-align: center;\\\"><strong>每消费1元可积1分，1分抵现金1毛，</strong></p><p style=\\\"text-align: center;\\\"><strong>付款时直接抵扣</strong></p><p style=\\\"text-align: center;\\\"><strong>（如此优惠的基础上还可积分，积分抵现金）</strong></p><p style=\\\"text-align: left;\\\"><strong><br></strong></p><p><br></p><p>&nbsp; &nbsp;&nbsp;<img src=\\\"https://image.dayouqiantu.cn/5ca03007150f1.jpg\\\" style=\\\"max-width: 100%;\\\"><br></p>\",\"merUse\":0,\"isPostage\":1,\"image_base\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"isBest\":1,\"sales\":16,\"price\":120.00,\"isBargain\":0,\"userLike\":false,\"vipPrice\":0.20,\"storeName\":\"70gA4黑白打印复印\",\"id\":19,\"keyword\":\"打印复印\",\"stock\":99,\"image\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"cost\":0.20,\"isGood\":1,\"unitName\":\"张\",\"isBenefit\":1,\"giveIntegral\":1.00,\"isNew\":1,\"sort\":1,\"sliderImageArr\":[\"https://image.dayouqiantu.cn/5ca01c7fc9238.jpg\",\"https://image.dayouqiantu.cn/5ca01c7676042.jpg\"],\"sliderImage\":\"https://image.dayouqiantu.cn/5ca01c7fc9238.jpg,https://image.dayouqiantu.cn/5ca01c7676042.jpg\",\"barCode\":\"\",\"isShow\":1,\"postage\":0.00,\"codePath\":\"\",\"soureLink\":\"\",\"cateId\":\"24\",\"isSeckill\":0,\"storeInfo\":\"打印复印资料A4黑白彩色印刷画册书本装订图文数码快印服务\",\"isDel\":0,\"isHot\":1,\"attrInfo\":{\"image\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"cost\":100.00,\"productId\":19,\"price\":120.00,\"unique\":\"00e86525a7af4dcf9e653ae0a2062369\",\"suk\":\"A1,白色\",\"id\":22,\"stock\":995}},\"uid\":14,\"productAttrUnique\":\"00e86525a7af4dcf9e653ae0a2062369\",\"bargainId\":0,\"id\":54}', '225f6ec45fec4b7eaafff6eca34eee66');
INSERT INTO `yx_store_order_cart_info` VALUES (52, 54, 55, 19, '{\"addTime\":1573985245,\"productId\":19,\"seckillId\":0,\"vipTruePrice\":120.0,\"combinationId\":0,\"costPrice\":100.0,\"trueStock\":995,\"truePrice\":120.0,\"type\":\"product\",\"cartNum\":1,\"productInfo\":{\"otPrice\":0.50,\"userCollect\":false,\"description\":\"<p style=\\\"text-align: center;\\\"><strong>文件请传QQ2412733099，</strong></p><p style=\\\"text-align: center;\\\"><strong>718504558或2412733099@qq.com邮箱，</strong></p><p style=\\\"text-align: center;\\\"><strong>手机/微信：13733990583</strong></p><p style=\\\"text-align: center;\\\"><strong>量大请联系店主，一定让您满意而归</strong></p><p style=\\\"text-align: center;\\\"><strong>&nbsp; &nbsp;实体店面经营 保质保量</strong></p><p style=\\\"text-align: center;\\\"><strong>A4黑白2毛/张，量大1毛/张，</strong></p><p style=\\\"text-align: center;\\\"><strong>A3黑白双面5毛/张，量大3毛/张，</strong></p><p style=\\\"text-align: center;\\\"><strong>更大量请联系店主报价，</strong></p><p style=\\\"text-align: center;\\\"><strong>每消费1元可积1分，1分抵现金1毛，</strong></p><p style=\\\"text-align: center;\\\"><strong>付款时直接抵扣</strong></p><p style=\\\"text-align: center;\\\"><strong>（如此优惠的基础上还可积分，积分抵现金）</strong></p><p style=\\\"text-align: left;\\\"><strong><br></strong></p><p><br></p><p>&nbsp; &nbsp;&nbsp;<img src=\\\"https://image.dayouqiantu.cn/5ca03007150f1.jpg\\\" style=\\\"max-width: 100%;\\\"><br></p>\",\"merUse\":0,\"isPostage\":1,\"image_base\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"isBest\":1,\"sales\":16,\"price\":120.00,\"isBargain\":0,\"userLike\":false,\"vipPrice\":0.20,\"storeName\":\"70gA4黑白打印复印\",\"id\":19,\"keyword\":\"打印复印\",\"stock\":99,\"image\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"cost\":0.20,\"isGood\":1,\"unitName\":\"张\",\"isBenefit\":1,\"giveIntegral\":1.00,\"isNew\":1,\"sort\":1,\"sliderImageArr\":[\"https://image.dayouqiantu.cn/5ca01c7fc9238.jpg\",\"https://image.dayouqiantu.cn/5ca01c7676042.jpg\"],\"sliderImage\":\"https://image.dayouqiantu.cn/5ca01c7fc9238.jpg,https://image.dayouqiantu.cn/5ca01c7676042.jpg\",\"barCode\":\"\",\"isShow\":1,\"postage\":0.00,\"codePath\":\"\",\"soureLink\":\"\",\"cateId\":\"24\",\"isSeckill\":0,\"storeInfo\":\"打印复印资料A4黑白彩色印刷画册书本装订图文数码快印服务\",\"isDel\":0,\"isHot\":1,\"attrInfo\":{\"image\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"cost\":100.00,\"productId\":19,\"price\":120.00,\"unique\":\"00e86525a7af4dcf9e653ae0a2062369\",\"suk\":\"A1,白色\",\"id\":22,\"stock\":995}},\"uid\":14,\"productAttrUnique\":\"00e86525a7af4dcf9e653ae0a2062369\",\"bargainId\":0,\"id\":55}', 'f9ebd84148f94059bc4fadd399b00719');
INSERT INTO `yx_store_order_cart_info` VALUES (53, 55, 56, 19, '{\"addTime\":1573985381,\"productId\":19,\"seckillId\":0,\"vipTruePrice\":120.0,\"combinationId\":0,\"costPrice\":100.0,\"trueStock\":995,\"truePrice\":120.0,\"type\":\"product\",\"cartNum\":1,\"productInfo\":{\"otPrice\":0.50,\"userCollect\":false,\"description\":\"<p style=\\\"text-align: center;\\\"><strong>文件请传QQ2412733099，</strong></p><p style=\\\"text-align: center;\\\"><strong>718504558或2412733099@qq.com邮箱，</strong></p><p style=\\\"text-align: center;\\\"><strong>手机/微信：13733990583</strong></p><p style=\\\"text-align: center;\\\"><strong>量大请联系店主，一定让您满意而归</strong></p><p style=\\\"text-align: center;\\\"><strong>&nbsp; &nbsp;实体店面经营 保质保量</strong></p><p style=\\\"text-align: center;\\\"><strong>A4黑白2毛/张，量大1毛/张，</strong></p><p style=\\\"text-align: center;\\\"><strong>A3黑白双面5毛/张，量大3毛/张，</strong></p><p style=\\\"text-align: center;\\\"><strong>更大量请联系店主报价，</strong></p><p style=\\\"text-align: center;\\\"><strong>每消费1元可积1分，1分抵现金1毛，</strong></p><p style=\\\"text-align: center;\\\"><strong>付款时直接抵扣</strong></p><p style=\\\"text-align: center;\\\"><strong>（如此优惠的基础上还可积分，积分抵现金）</strong></p><p style=\\\"text-align: left;\\\"><strong><br></strong></p><p><br></p><p>&nbsp; &nbsp;&nbsp;<img src=\\\"https://image.dayouqiantu.cn/5ca03007150f1.jpg\\\" style=\\\"max-width: 100%;\\\"><br></p>\",\"merUse\":0,\"isPostage\":1,\"image_base\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"isBest\":1,\"sales\":16,\"price\":120.00,\"isBargain\":0,\"userLike\":false,\"vipPrice\":0.20,\"storeName\":\"70gA4黑白打印复印\",\"id\":19,\"keyword\":\"打印复印\",\"stock\":99,\"image\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"cost\":0.20,\"isGood\":1,\"unitName\":\"张\",\"isBenefit\":1,\"giveIntegral\":1.00,\"isNew\":1,\"sort\":1,\"sliderImageArr\":[\"https://image.dayouqiantu.cn/5ca01c7fc9238.jpg\",\"https://image.dayouqiantu.cn/5ca01c7676042.jpg\"],\"sliderImage\":\"https://image.dayouqiantu.cn/5ca01c7fc9238.jpg,https://image.dayouqiantu.cn/5ca01c7676042.jpg\",\"barCode\":\"\",\"isShow\":1,\"postage\":0.00,\"codePath\":\"\",\"soureLink\":\"\",\"cateId\":\"24\",\"isSeckill\":0,\"storeInfo\":\"打印复印资料A4黑白彩色印刷画册书本装订图文数码快印服务\",\"isDel\":0,\"isHot\":1,\"attrInfo\":{\"image\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"cost\":100.00,\"productId\":19,\"price\":120.00,\"unique\":\"00e86525a7af4dcf9e653ae0a2062369\",\"suk\":\"A1,白色\",\"id\":22,\"stock\":995}},\"uid\":14,\"productAttrUnique\":\"00e86525a7af4dcf9e653ae0a2062369\",\"bargainId\":0,\"id\":56}', 'bc94aeb032d641709f7f08af620ac7b3');
INSERT INTO `yx_store_order_cart_info` VALUES (54, 56, 57, 19, '{\"addTime\":1573985953,\"productId\":19,\"seckillId\":0,\"vipTruePrice\":120.0,\"combinationId\":0,\"costPrice\":100.0,\"trueStock\":995,\"truePrice\":120.0,\"type\":\"product\",\"cartNum\":1,\"productInfo\":{\"otPrice\":0.50,\"userCollect\":false,\"description\":\"<p style=\\\"text-align: center;\\\"><strong>文件请传QQ2412733099，</strong></p><p style=\\\"text-align: center;\\\"><strong>718504558或2412733099@qq.com邮箱，</strong></p><p style=\\\"text-align: center;\\\"><strong>手机/微信：13733990583</strong></p><p style=\\\"text-align: center;\\\"><strong>量大请联系店主，一定让您满意而归</strong></p><p style=\\\"text-align: center;\\\"><strong>&nbsp; &nbsp;实体店面经营 保质保量</strong></p><p style=\\\"text-align: center;\\\"><strong>A4黑白2毛/张，量大1毛/张，</strong></p><p style=\\\"text-align: center;\\\"><strong>A3黑白双面5毛/张，量大3毛/张，</strong></p><p style=\\\"text-align: center;\\\"><strong>更大量请联系店主报价，</strong></p><p style=\\\"text-align: center;\\\"><strong>每消费1元可积1分，1分抵现金1毛，</strong></p><p style=\\\"text-align: center;\\\"><strong>付款时直接抵扣</strong></p><p style=\\\"text-align: center;\\\"><strong>（如此优惠的基础上还可积分，积分抵现金）</strong></p><p style=\\\"text-align: left;\\\"><strong><br></strong></p><p><br></p><p>&nbsp; &nbsp;&nbsp;<img src=\\\"https://image.dayouqiantu.cn/5ca03007150f1.jpg\\\" style=\\\"max-width: 100%;\\\"><br></p>\",\"merUse\":0,\"isPostage\":1,\"image_base\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"isBest\":1,\"sales\":16,\"price\":120.00,\"isBargain\":0,\"userLike\":false,\"vipPrice\":0.20,\"storeName\":\"70gA4黑白打印复印\",\"id\":19,\"keyword\":\"打印复印\",\"stock\":99,\"image\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"cost\":0.20,\"isGood\":1,\"unitName\":\"张\",\"isBenefit\":1,\"giveIntegral\":1.00,\"isNew\":1,\"sort\":1,\"sliderImageArr\":[\"https://image.dayouqiantu.cn/5ca01c7fc9238.jpg\",\"https://image.dayouqiantu.cn/5ca01c7676042.jpg\"],\"sliderImage\":\"https://image.dayouqiantu.cn/5ca01c7fc9238.jpg,https://image.dayouqiantu.cn/5ca01c7676042.jpg\",\"barCode\":\"\",\"isShow\":1,\"postage\":0.00,\"codePath\":\"\",\"soureLink\":\"\",\"cateId\":\"24\",\"isSeckill\":0,\"storeInfo\":\"打印复印资料A4黑白彩色印刷画册书本装订图文数码快印服务\",\"isDel\":0,\"isHot\":1,\"attrInfo\":{\"image\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"cost\":100.00,\"productId\":19,\"price\":120.00,\"unique\":\"00e86525a7af4dcf9e653ae0a2062369\",\"suk\":\"A1,白色\",\"id\":22,\"stock\":995}},\"uid\":14,\"productAttrUnique\":\"00e86525a7af4dcf9e653ae0a2062369\",\"bargainId\":0,\"id\":57}', '5b165e0d27d54bc4847bbc309d471648');
INSERT INTO `yx_store_order_cart_info` VALUES (55, 57, 58, 19, '{\"addTime\":1573987260,\"productId\":19,\"seckillId\":0,\"vipTruePrice\":120.0,\"combinationId\":0,\"costPrice\":100.0,\"trueStock\":996,\"truePrice\":120.0,\"type\":\"product\",\"cartNum\":1,\"productInfo\":{\"otPrice\":0.50,\"userCollect\":false,\"description\":\"<p style=\\\"text-align: center;\\\"><strong>文件请传QQ2412733099，</strong></p><p style=\\\"text-align: center;\\\"><strong>718504558或2412733099@qq.com邮箱，</strong></p><p style=\\\"text-align: center;\\\"><strong>手机/微信：13733990583</strong></p><p style=\\\"text-align: center;\\\"><strong>量大请联系店主，一定让您满意而归</strong></p><p style=\\\"text-align: center;\\\"><strong>&nbsp; &nbsp;实体店面经营 保质保量</strong></p><p style=\\\"text-align: center;\\\"><strong>A4黑白2毛/张，量大1毛/张，</strong></p><p style=\\\"text-align: center;\\\"><strong>A3黑白双面5毛/张，量大3毛/张，</strong></p><p style=\\\"text-align: center;\\\"><strong>更大量请联系店主报价，</strong></p><p style=\\\"text-align: center;\\\"><strong>每消费1元可积1分，1分抵现金1毛，</strong></p><p style=\\\"text-align: center;\\\"><strong>付款时直接抵扣</strong></p><p style=\\\"text-align: center;\\\"><strong>（如此优惠的基础上还可积分，积分抵现金）</strong></p><p style=\\\"text-align: left;\\\"><strong><br></strong></p><p><br></p><p>&nbsp; &nbsp;&nbsp;<img src=\\\"https://image.dayouqiantu.cn/5ca03007150f1.jpg\\\" style=\\\"max-width: 100%;\\\"><br></p>\",\"merUse\":0,\"isPostage\":1,\"image_base\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"isBest\":1,\"sales\":15,\"price\":120.00,\"isBargain\":0,\"userLike\":false,\"vipPrice\":0.20,\"storeName\":\"70gA4黑白打印复印\",\"id\":19,\"keyword\":\"打印复印\",\"stock\":99,\"image\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"cost\":0.20,\"isGood\":1,\"unitName\":\"张\",\"isBenefit\":1,\"giveIntegral\":1.00,\"isNew\":1,\"sort\":1,\"sliderImageArr\":[\"https://image.dayouqiantu.cn/5ca01c7fc9238.jpg\",\"https://image.dayouqiantu.cn/5ca01c7676042.jpg\"],\"sliderImage\":\"https://image.dayouqiantu.cn/5ca01c7fc9238.jpg,https://image.dayouqiantu.cn/5ca01c7676042.jpg\",\"barCode\":\"\",\"isShow\":1,\"postage\":0.00,\"codePath\":\"\",\"soureLink\":\"\",\"cateId\":\"24\",\"isSeckill\":0,\"storeInfo\":\"打印复印资料A4黑白彩色印刷画册书本装订图文数码快印服务\",\"isDel\":0,\"isHot\":1,\"attrInfo\":{\"image\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"cost\":100.00,\"productId\":19,\"price\":120.00,\"unique\":\"00e86525a7af4dcf9e653ae0a2062369\",\"suk\":\"A1,白色\",\"id\":22,\"stock\":996}},\"uid\":14,\"productAttrUnique\":\"00e86525a7af4dcf9e653ae0a2062369\",\"bargainId\":0,\"id\":58}', '21af773114624b9fb0c45f9dcd7d7e2d');
INSERT INTO `yx_store_order_cart_info` VALUES (56, 58, 59, 19, '{\"addTime\":1573987803,\"productId\":19,\"seckillId\":0,\"vipTruePrice\":120.0,\"combinationId\":0,\"costPrice\":100.0,\"trueStock\":996,\"truePrice\":120.0,\"type\":\"product\",\"cartNum\":1,\"productInfo\":{\"otPrice\":0.50,\"userCollect\":false,\"description\":\"<p style=\\\"text-align: center;\\\"><strong>文件请传QQ2412733099，</strong></p><p style=\\\"text-align: center;\\\"><strong>718504558或2412733099@qq.com邮箱，</strong></p><p style=\\\"text-align: center;\\\"><strong>手机/微信：13733990583</strong></p><p style=\\\"text-align: center;\\\"><strong>量大请联系店主，一定让您满意而归</strong></p><p style=\\\"text-align: center;\\\"><strong>&nbsp; &nbsp;实体店面经营 保质保量</strong></p><p style=\\\"text-align: center;\\\"><strong>A4黑白2毛/张，量大1毛/张，</strong></p><p style=\\\"text-align: center;\\\"><strong>A3黑白双面5毛/张，量大3毛/张，</strong></p><p style=\\\"text-align: center;\\\"><strong>更大量请联系店主报价，</strong></p><p style=\\\"text-align: center;\\\"><strong>每消费1元可积1分，1分抵现金1毛，</strong></p><p style=\\\"text-align: center;\\\"><strong>付款时直接抵扣</strong></p><p style=\\\"text-align: center;\\\"><strong>（如此优惠的基础上还可积分，积分抵现金）</strong></p><p style=\\\"text-align: left;\\\"><strong><br></strong></p><p><br></p><p>&nbsp; &nbsp;&nbsp;<img src=\\\"https://image.dayouqiantu.cn/5ca03007150f1.jpg\\\" style=\\\"max-width: 100%;\\\"><br></p>\",\"merUse\":0,\"isPostage\":1,\"image_base\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"isBest\":1,\"sales\":15,\"price\":120.00,\"isBargain\":0,\"userLike\":false,\"vipPrice\":0.20,\"storeName\":\"70gA4黑白打印复印\",\"id\":19,\"keyword\":\"打印复印\",\"stock\":99,\"image\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"cost\":0.20,\"isGood\":1,\"unitName\":\"张\",\"isBenefit\":1,\"giveIntegral\":1.00,\"isNew\":1,\"sort\":1,\"sliderImageArr\":[\"https://image.dayouqiantu.cn/5ca01c7fc9238.jpg\",\"https://image.dayouqiantu.cn/5ca01c7676042.jpg\"],\"sliderImage\":\"https://image.dayouqiantu.cn/5ca01c7fc9238.jpg,https://image.dayouqiantu.cn/5ca01c7676042.jpg\",\"barCode\":\"\",\"isShow\":1,\"postage\":0.00,\"codePath\":\"\",\"soureLink\":\"\",\"cateId\":\"24\",\"isSeckill\":0,\"storeInfo\":\"打印复印资料A4黑白彩色印刷画册书本装订图文数码快印服务\",\"isDel\":0,\"isHot\":1,\"attrInfo\":{\"image\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"cost\":100.00,\"productId\":19,\"price\":120.00,\"unique\":\"00e86525a7af4dcf9e653ae0a2062369\",\"suk\":\"A1,白色\",\"id\":22,\"stock\":996}},\"uid\":14,\"productAttrUnique\":\"00e86525a7af4dcf9e653ae0a2062369\",\"bargainId\":0,\"id\":59}', '7aa6883c272a4b40ad53f9ed4022123e');
INSERT INTO `yx_store_order_cart_info` VALUES (57, 59, 60, 19, '{\"addTime\":1573988062,\"productId\":19,\"seckillId\":0,\"vipTruePrice\":120.0,\"combinationId\":0,\"costPrice\":100.0,\"trueStock\":995,\"truePrice\":120.0,\"type\":\"product\",\"cartNum\":1,\"productInfo\":{\"otPrice\":0.50,\"userCollect\":false,\"description\":\"<p style=\\\"text-align: center;\\\"><strong>文件请传QQ2412733099，</strong></p><p style=\\\"text-align: center;\\\"><strong>718504558或2412733099@qq.com邮箱，</strong></p><p style=\\\"text-align: center;\\\"><strong>手机/微信：13733990583</strong></p><p style=\\\"text-align: center;\\\"><strong>量大请联系店主，一定让您满意而归</strong></p><p style=\\\"text-align: center;\\\"><strong>&nbsp; &nbsp;实体店面经营 保质保量</strong></p><p style=\\\"text-align: center;\\\"><strong>A4黑白2毛/张，量大1毛/张，</strong></p><p style=\\\"text-align: center;\\\"><strong>A3黑白双面5毛/张，量大3毛/张，</strong></p><p style=\\\"text-align: center;\\\"><strong>更大量请联系店主报价，</strong></p><p style=\\\"text-align: center;\\\"><strong>每消费1元可积1分，1分抵现金1毛，</strong></p><p style=\\\"text-align: center;\\\"><strong>付款时直接抵扣</strong></p><p style=\\\"text-align: center;\\\"><strong>（如此优惠的基础上还可积分，积分抵现金）</strong></p><p style=\\\"text-align: left;\\\"><strong><br></strong></p><p><br></p><p>&nbsp; &nbsp;&nbsp;<img src=\\\"https://image.dayouqiantu.cn/5ca03007150f1.jpg\\\" style=\\\"max-width: 100%;\\\"><br></p>\",\"merUse\":0,\"isPostage\":1,\"image_base\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"isBest\":1,\"sales\":16,\"price\":120.00,\"isBargain\":0,\"userLike\":false,\"vipPrice\":0.20,\"storeName\":\"70gA4黑白打印复印\",\"id\":19,\"keyword\":\"打印复印\",\"stock\":99,\"image\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"cost\":0.20,\"isGood\":1,\"unitName\":\"张\",\"isBenefit\":1,\"giveIntegral\":1.00,\"isNew\":1,\"sort\":1,\"sliderImageArr\":[\"https://image.dayouqiantu.cn/5ca01c7fc9238.jpg\",\"https://image.dayouqiantu.cn/5ca01c7676042.jpg\"],\"sliderImage\":\"https://image.dayouqiantu.cn/5ca01c7fc9238.jpg,https://image.dayouqiantu.cn/5ca01c7676042.jpg\",\"barCode\":\"\",\"isShow\":1,\"postage\":0.00,\"codePath\":\"\",\"soureLink\":\"\",\"cateId\":\"24\",\"isSeckill\":0,\"storeInfo\":\"打印复印资料A4黑白彩色印刷画册书本装订图文数码快印服务\",\"isDel\":0,\"isHot\":1,\"attrInfo\":{\"image\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"cost\":100.00,\"productId\":19,\"price\":120.00,\"unique\":\"00e86525a7af4dcf9e653ae0a2062369\",\"suk\":\"A1,白色\",\"id\":22,\"stock\":995}},\"uid\":14,\"productAttrUnique\":\"00e86525a7af4dcf9e653ae0a2062369\",\"bargainId\":0,\"id\":60}', '54f016da7cda4bc4a2c8f60c740c02ad');
INSERT INTO `yx_store_order_cart_info` VALUES (58, 60, 61, 19, '{\"addTime\":1573989582,\"productId\":19,\"seckillId\":0,\"vipTruePrice\":120.0,\"combinationId\":0,\"costPrice\":100.0,\"trueStock\":996,\"truePrice\":120.0,\"type\":\"product\",\"cartNum\":1,\"productInfo\":{\"otPrice\":0.50,\"userCollect\":false,\"description\":\"<p style=\\\"text-align: center;\\\"><strong>文件请传QQ2412733099，</strong></p><p style=\\\"text-align: center;\\\"><strong>718504558或2412733099@qq.com邮箱，</strong></p><p style=\\\"text-align: center;\\\"><strong>手机/微信：13733990583</strong></p><p style=\\\"text-align: center;\\\"><strong>量大请联系店主，一定让您满意而归</strong></p><p style=\\\"text-align: center;\\\"><strong>&nbsp; &nbsp;实体店面经营 保质保量</strong></p><p style=\\\"text-align: center;\\\"><strong>A4黑白2毛/张，量大1毛/张，</strong></p><p style=\\\"text-align: center;\\\"><strong>A3黑白双面5毛/张，量大3毛/张，</strong></p><p style=\\\"text-align: center;\\\"><strong>更大量请联系店主报价，</strong></p><p style=\\\"text-align: center;\\\"><strong>每消费1元可积1分，1分抵现金1毛，</strong></p><p style=\\\"text-align: center;\\\"><strong>付款时直接抵扣</strong></p><p style=\\\"text-align: center;\\\"><strong>（如此优惠的基础上还可积分，积分抵现金）</strong></p><p style=\\\"text-align: left;\\\"><strong><br></strong></p><p><br></p><p>&nbsp; &nbsp;&nbsp;<img src=\\\"https://image.dayouqiantu.cn/5ca03007150f1.jpg\\\" style=\\\"max-width: 100%;\\\"><br></p>\",\"merUse\":0,\"isPostage\":1,\"image_base\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"isBest\":1,\"sales\":15,\"price\":120.00,\"isBargain\":0,\"userLike\":false,\"vipPrice\":0.20,\"storeName\":\"70gA4黑白打印复印\",\"id\":19,\"keyword\":\"打印复印\",\"stock\":99,\"image\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"cost\":0.20,\"isGood\":1,\"unitName\":\"张\",\"isBenefit\":1,\"giveIntegral\":1.00,\"isNew\":1,\"sort\":1,\"sliderImageArr\":[\"https://image.dayouqiantu.cn/5ca01c7fc9238.jpg\",\"https://image.dayouqiantu.cn/5ca01c7676042.jpg\"],\"sliderImage\":\"https://image.dayouqiantu.cn/5ca01c7fc9238.jpg,https://image.dayouqiantu.cn/5ca01c7676042.jpg\",\"barCode\":\"\",\"isShow\":1,\"postage\":0.00,\"codePath\":\"\",\"soureLink\":\"\",\"cateId\":\"24\",\"isSeckill\":0,\"storeInfo\":\"打印复印资料A4黑白彩色印刷画册书本装订图文数码快印服务\",\"isDel\":0,\"isHot\":1,\"attrInfo\":{\"image\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"cost\":100.00,\"productId\":19,\"price\":120.00,\"unique\":\"00e86525a7af4dcf9e653ae0a2062369\",\"suk\":\"A1,白色\",\"id\":22,\"stock\":996}},\"uid\":14,\"productAttrUnique\":\"00e86525a7af4dcf9e653ae0a2062369\",\"bargainId\":0,\"id\":61}', 'a59cdd8519504f589231e4346a678d0d');
INSERT INTO `yx_store_order_cart_info` VALUES (59, 61, 62, 19, '{\"addTime\":1573991786,\"productId\":19,\"seckillId\":0,\"vipTruePrice\":120.0,\"combinationId\":0,\"costPrice\":100.0,\"trueStock\":995,\"truePrice\":120.0,\"type\":\"product\",\"cartNum\":1,\"productInfo\":{\"otPrice\":0.50,\"userCollect\":false,\"description\":\"<p style=\\\"text-align: center;\\\"><strong>文件请传QQ2412733099，</strong></p><p style=\\\"text-align: center;\\\"><strong>718504558或2412733099@qq.com邮箱，</strong></p><p style=\\\"text-align: center;\\\"><strong>手机/微信：13733990583</strong></p><p style=\\\"text-align: center;\\\"><strong>量大请联系店主，一定让您满意而归</strong></p><p style=\\\"text-align: center;\\\"><strong>&nbsp; &nbsp;实体店面经营 保质保量</strong></p><p style=\\\"text-align: center;\\\"><strong>A4黑白2毛/张，量大1毛/张，</strong></p><p style=\\\"text-align: center;\\\"><strong>A3黑白双面5毛/张，量大3毛/张，</strong></p><p style=\\\"text-align: center;\\\"><strong>更大量请联系店主报价，</strong></p><p style=\\\"text-align: center;\\\"><strong>每消费1元可积1分，1分抵现金1毛，</strong></p><p style=\\\"text-align: center;\\\"><strong>付款时直接抵扣</strong></p><p style=\\\"text-align: center;\\\"><strong>（如此优惠的基础上还可积分，积分抵现金）</strong></p><p style=\\\"text-align: left;\\\"><strong><br></strong></p><p><br></p><p>&nbsp; &nbsp;&nbsp;<img src=\\\"https://image.dayouqiantu.cn/5ca03007150f1.jpg\\\" style=\\\"max-width: 100%;\\\"><br></p>\",\"merUse\":0,\"isPostage\":1,\"image_base\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"isBest\":1,\"sales\":16,\"price\":120.00,\"isBargain\":0,\"userLike\":false,\"vipPrice\":0.20,\"storeName\":\"70gA4黑白打印复印\",\"id\":19,\"keyword\":\"打印复印\",\"stock\":99,\"image\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"cost\":0.20,\"isGood\":1,\"unitName\":\"张\",\"isBenefit\":1,\"giveIntegral\":1.00,\"isNew\":1,\"sort\":1,\"sliderImageArr\":[\"https://image.dayouqiantu.cn/5ca01c7fc9238.jpg\",\"https://image.dayouqiantu.cn/5ca01c7676042.jpg\"],\"sliderImage\":\"https://image.dayouqiantu.cn/5ca01c7fc9238.jpg,https://image.dayouqiantu.cn/5ca01c7676042.jpg\",\"barCode\":\"\",\"isShow\":1,\"postage\":0.00,\"codePath\":\"\",\"soureLink\":\"\",\"cateId\":\"24\",\"isSeckill\":0,\"storeInfo\":\"打印复印资料A4黑白彩色印刷画册书本装订图文数码快印服务\",\"isDel\":0,\"isHot\":1,\"attrInfo\":{\"image\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"cost\":100.00,\"productId\":19,\"price\":120.00,\"unique\":\"00e86525a7af4dcf9e653ae0a2062369\",\"suk\":\"A1,白色\",\"id\":22,\"stock\":995}},\"uid\":14,\"productAttrUnique\":\"00e86525a7af4dcf9e653ae0a2062369\",\"bargainId\":0,\"id\":62}', '3410d21cc53e408b8656f6ca5363521a');
INSERT INTO `yx_store_order_cart_info` VALUES (60, 62, 63, 19, '{\"addTime\":1573991863,\"productId\":19,\"seckillId\":0,\"vipTruePrice\":120.0,\"combinationId\":0,\"costPrice\":100.0,\"trueStock\":995,\"truePrice\":120.0,\"type\":\"product\",\"cartNum\":1,\"productInfo\":{\"otPrice\":0.50,\"userCollect\":false,\"description\":\"<p style=\\\"text-align: center;\\\"><strong>文件请传QQ2412733099，</strong></p><p style=\\\"text-align: center;\\\"><strong>718504558或2412733099@qq.com邮箱，</strong></p><p style=\\\"text-align: center;\\\"><strong>手机/微信：13733990583</strong></p><p style=\\\"text-align: center;\\\"><strong>量大请联系店主，一定让您满意而归</strong></p><p style=\\\"text-align: center;\\\"><strong>&nbsp; &nbsp;实体店面经营 保质保量</strong></p><p style=\\\"text-align: center;\\\"><strong>A4黑白2毛/张，量大1毛/张，</strong></p><p style=\\\"text-align: center;\\\"><strong>A3黑白双面5毛/张，量大3毛/张，</strong></p><p style=\\\"text-align: center;\\\"><strong>更大量请联系店主报价，</strong></p><p style=\\\"text-align: center;\\\"><strong>每消费1元可积1分，1分抵现金1毛，</strong></p><p style=\\\"text-align: center;\\\"><strong>付款时直接抵扣</strong></p><p style=\\\"text-align: center;\\\"><strong>（如此优惠的基础上还可积分，积分抵现金）</strong></p><p style=\\\"text-align: left;\\\"><strong><br></strong></p><p><br></p><p>&nbsp; &nbsp;&nbsp;<img src=\\\"https://image.dayouqiantu.cn/5ca03007150f1.jpg\\\" style=\\\"max-width: 100%;\\\"><br></p>\",\"merUse\":0,\"isPostage\":1,\"image_base\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"isBest\":1,\"sales\":16,\"price\":120.00,\"isBargain\":0,\"userLike\":false,\"vipPrice\":0.20,\"storeName\":\"70gA4黑白打印复印\",\"id\":19,\"keyword\":\"打印复印\",\"stock\":99,\"image\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"cost\":0.20,\"isGood\":1,\"unitName\":\"张\",\"isBenefit\":1,\"giveIntegral\":1.00,\"isNew\":1,\"sort\":1,\"sliderImageArr\":[\"https://image.dayouqiantu.cn/5ca01c7fc9238.jpg\",\"https://image.dayouqiantu.cn/5ca01c7676042.jpg\"],\"sliderImage\":\"https://image.dayouqiantu.cn/5ca01c7fc9238.jpg,https://image.dayouqiantu.cn/5ca01c7676042.jpg\",\"barCode\":\"\",\"isShow\":1,\"postage\":0.00,\"codePath\":\"\",\"soureLink\":\"\",\"cateId\":\"24\",\"isSeckill\":0,\"storeInfo\":\"打印复印资料A4黑白彩色印刷画册书本装订图文数码快印服务\",\"isDel\":0,\"isHot\":1,\"attrInfo\":{\"image\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"cost\":100.00,\"productId\":19,\"price\":120.00,\"unique\":\"00e86525a7af4dcf9e653ae0a2062369\",\"suk\":\"A1,白色\",\"id\":22,\"stock\":995}},\"uid\":14,\"productAttrUnique\":\"00e86525a7af4dcf9e653ae0a2062369\",\"bargainId\":0,\"id\":63}', 'c1eff785b72e4d36b2bb400d49e69b3c');
INSERT INTO `yx_store_order_cart_info` VALUES (61, 63, 64, 19, '{\"addTime\":1573992167,\"productId\":19,\"seckillId\":0,\"vipTruePrice\":120.0,\"combinationId\":0,\"costPrice\":100.0,\"trueStock\":994,\"truePrice\":120.0,\"type\":\"product\",\"cartNum\":1,\"productInfo\":{\"otPrice\":0.50,\"userCollect\":false,\"description\":\"<p style=\\\"text-align: center;\\\"><strong>文件请传QQ2412733099，</strong></p><p style=\\\"text-align: center;\\\"><strong>718504558或2412733099@qq.com邮箱，</strong></p><p style=\\\"text-align: center;\\\"><strong>手机/微信：13733990583</strong></p><p style=\\\"text-align: center;\\\"><strong>量大请联系店主，一定让您满意而归</strong></p><p style=\\\"text-align: center;\\\"><strong>&nbsp; &nbsp;实体店面经营 保质保量</strong></p><p style=\\\"text-align: center;\\\"><strong>A4黑白2毛/张，量大1毛/张，</strong></p><p style=\\\"text-align: center;\\\"><strong>A3黑白双面5毛/张，量大3毛/张，</strong></p><p style=\\\"text-align: center;\\\"><strong>更大量请联系店主报价，</strong></p><p style=\\\"text-align: center;\\\"><strong>每消费1元可积1分，1分抵现金1毛，</strong></p><p style=\\\"text-align: center;\\\"><strong>付款时直接抵扣</strong></p><p style=\\\"text-align: center;\\\"><strong>（如此优惠的基础上还可积分，积分抵现金）</strong></p><p style=\\\"text-align: left;\\\"><strong><br></strong></p><p><br></p><p>&nbsp; &nbsp;&nbsp;<img src=\\\"https://image.dayouqiantu.cn/5ca03007150f1.jpg\\\" style=\\\"max-width: 100%;\\\"><br></p>\",\"merUse\":0,\"isPostage\":1,\"image_base\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"isBest\":1,\"sales\":17,\"price\":120.00,\"isBargain\":0,\"userLike\":false,\"vipPrice\":0.20,\"storeName\":\"70gA4黑白打印复印\",\"id\":19,\"keyword\":\"打印复印\",\"stock\":99,\"image\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"cost\":0.20,\"isGood\":1,\"unitName\":\"张\",\"isBenefit\":1,\"giveIntegral\":1.00,\"isNew\":1,\"sort\":1,\"sliderImageArr\":[\"https://image.dayouqiantu.cn/5ca01c7fc9238.jpg\",\"https://image.dayouqiantu.cn/5ca01c7676042.jpg\"],\"sliderImage\":\"https://image.dayouqiantu.cn/5ca01c7fc9238.jpg,https://image.dayouqiantu.cn/5ca01c7676042.jpg\",\"barCode\":\"\",\"isShow\":1,\"postage\":0.00,\"codePath\":\"\",\"soureLink\":\"\",\"cateId\":\"24\",\"isSeckill\":0,\"storeInfo\":\"打印复印资料A4黑白彩色印刷画册书本装订图文数码快印服务\",\"isDel\":0,\"isHot\":1,\"attrInfo\":{\"image\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"cost\":100.00,\"productId\":19,\"price\":120.00,\"unique\":\"00e86525a7af4dcf9e653ae0a2062369\",\"suk\":\"A1,白色\",\"id\":22,\"stock\":994}},\"uid\":14,\"productAttrUnique\":\"00e86525a7af4dcf9e653ae0a2062369\",\"bargainId\":0,\"id\":64}', 'd2661ad8457c43e68769974841dbd199');
INSERT INTO `yx_store_order_cart_info` VALUES (62, 64, 65, 19, '{\"addTime\":1573992682,\"productId\":19,\"seckillId\":0,\"vipTruePrice\":120.0,\"combinationId\":0,\"costPrice\":100.0,\"trueStock\":995,\"truePrice\":120.0,\"type\":\"product\",\"cartNum\":1,\"productInfo\":{\"otPrice\":0.50,\"userCollect\":false,\"description\":\"<p style=\\\"text-align: center;\\\"><strong>文件请传QQ2412733099，</strong></p><p style=\\\"text-align: center;\\\"><strong>718504558或2412733099@qq.com邮箱，</strong></p><p style=\\\"text-align: center;\\\"><strong>手机/微信：13733990583</strong></p><p style=\\\"text-align: center;\\\"><strong>量大请联系店主，一定让您满意而归</strong></p><p style=\\\"text-align: center;\\\"><strong>&nbsp; &nbsp;实体店面经营 保质保量</strong></p><p style=\\\"text-align: center;\\\"><strong>A4黑白2毛/张，量大1毛/张，</strong></p><p style=\\\"text-align: center;\\\"><strong>A3黑白双面5毛/张，量大3毛/张，</strong></p><p style=\\\"text-align: center;\\\"><strong>更大量请联系店主报价，</strong></p><p style=\\\"text-align: center;\\\"><strong>每消费1元可积1分，1分抵现金1毛，</strong></p><p style=\\\"text-align: center;\\\"><strong>付款时直接抵扣</strong></p><p style=\\\"text-align: center;\\\"><strong>（如此优惠的基础上还可积分，积分抵现金）</strong></p><p style=\\\"text-align: left;\\\"><strong><br></strong></p><p><br></p><p>&nbsp; &nbsp;&nbsp;<img src=\\\"https://image.dayouqiantu.cn/5ca03007150f1.jpg\\\" style=\\\"max-width: 100%;\\\"><br></p>\",\"merUse\":0,\"isPostage\":1,\"image_base\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"isBest\":1,\"sales\":16,\"price\":120.00,\"isBargain\":0,\"userLike\":false,\"vipPrice\":0.20,\"storeName\":\"70gA4黑白打印复印\",\"id\":19,\"keyword\":\"打印复印\",\"stock\":99,\"image\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"cost\":0.20,\"isGood\":1,\"unitName\":\"张\",\"isBenefit\":1,\"giveIntegral\":1.00,\"isNew\":1,\"sort\":1,\"sliderImageArr\":[\"https://image.dayouqiantu.cn/5ca01c7fc9238.jpg\",\"https://image.dayouqiantu.cn/5ca01c7676042.jpg\"],\"sliderImage\":\"https://image.dayouqiantu.cn/5ca01c7fc9238.jpg,https://image.dayouqiantu.cn/5ca01c7676042.jpg\",\"barCode\":\"\",\"isShow\":1,\"postage\":0.00,\"codePath\":\"\",\"soureLink\":\"\",\"cateId\":\"24\",\"isSeckill\":0,\"storeInfo\":\"打印复印资料A4黑白彩色印刷画册书本装订图文数码快印服务\",\"isDel\":0,\"isHot\":1,\"attrInfo\":{\"image\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"cost\":100.00,\"productId\":19,\"price\":120.00,\"unique\":\"00e86525a7af4dcf9e653ae0a2062369\",\"suk\":\"A1,白色\",\"id\":22,\"stock\":995}},\"uid\":14,\"productAttrUnique\":\"00e86525a7af4dcf9e653ae0a2062369\",\"bargainId\":0,\"id\":65}', '0b194cc7210c4aee8bc0b3900c6de3d5');
INSERT INTO `yx_store_order_cart_info` VALUES (64, 66, 66, 19, '{\"addTime\":1573995851,\"productId\":19,\"seckillId\":0,\"vipTruePrice\":120.0,\"combinationId\":0,\"costPrice\":100.0,\"trueStock\":995,\"truePrice\":120.0,\"type\":\"product\",\"cartNum\":1,\"productInfo\":{\"otPrice\":0.50,\"userCollect\":false,\"description\":\"<p style=\\\"text-align: center;\\\"><strong>文件请传QQ2412733099，</strong></p><p style=\\\"text-align: center;\\\"><strong>718504558或2412733099@qq.com邮箱，</strong></p><p style=\\\"text-align: center;\\\"><strong>手机/微信：13733990583</strong></p><p style=\\\"text-align: center;\\\"><strong>量大请联系店主，一定让您满意而归</strong></p><p style=\\\"text-align: center;\\\"><strong>&nbsp; &nbsp;实体店面经营 保质保量</strong></p><p style=\\\"text-align: center;\\\"><strong>A4黑白2毛/张，量大1毛/张，</strong></p><p style=\\\"text-align: center;\\\"><strong>A3黑白双面5毛/张，量大3毛/张，</strong></p><p style=\\\"text-align: center;\\\"><strong>更大量请联系店主报价，</strong></p><p style=\\\"text-align: center;\\\"><strong>每消费1元可积1分，1分抵现金1毛，</strong></p><p style=\\\"text-align: center;\\\"><strong>付款时直接抵扣</strong></p><p style=\\\"text-align: center;\\\"><strong>（如此优惠的基础上还可积分，积分抵现金）</strong></p><p style=\\\"text-align: left;\\\"><strong><br></strong></p><p><br></p><p>&nbsp; &nbsp;&nbsp;<img src=\\\"https://image.dayouqiantu.cn/5ca03007150f1.jpg\\\" style=\\\"max-width: 100%;\\\"><br></p>\",\"merUse\":0,\"isPostage\":1,\"image_base\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"isBest\":1,\"sales\":16,\"price\":120.00,\"isBargain\":0,\"userLike\":false,\"vipPrice\":0.20,\"storeName\":\"70gA4黑白打印复印\",\"id\":19,\"keyword\":\"打印复印\",\"stock\":99,\"image\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"cost\":0.20,\"isGood\":1,\"unitName\":\"张\",\"isBenefit\":1,\"giveIntegral\":1.00,\"isNew\":1,\"sort\":1,\"sliderImageArr\":[\"https://image.dayouqiantu.cn/5ca01c7fc9238.jpg\",\"https://image.dayouqiantu.cn/5ca01c7676042.jpg\"],\"sliderImage\":\"https://image.dayouqiantu.cn/5ca01c7fc9238.jpg,https://image.dayouqiantu.cn/5ca01c7676042.jpg\",\"barCode\":\"\",\"isShow\":1,\"postage\":0.00,\"codePath\":\"\",\"soureLink\":\"\",\"cateId\":\"24\",\"isSeckill\":0,\"storeInfo\":\"打印复印资料A4黑白彩色印刷画册书本装订图文数码快印服务\",\"isDel\":0,\"isHot\":1,\"attrInfo\":{\"image\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"cost\":100.00,\"productId\":19,\"price\":120.00,\"unique\":\"00e86525a7af4dcf9e653ae0a2062369\",\"suk\":\"A1,白色\",\"id\":22,\"stock\":995}},\"uid\":14,\"productAttrUnique\":\"00e86525a7af4dcf9e653ae0a2062369\",\"bargainId\":0,\"id\":66}', 'c172e14bca8b487b85004bd2e7e1a8b2');
INSERT INTO `yx_store_order_cart_info` VALUES (65, 67, 67, 19, '{\"addTime\":1573996185,\"productId\":19,\"seckillId\":0,\"vipTruePrice\":120.0,\"combinationId\":0,\"costPrice\":100.0,\"trueStock\":995,\"truePrice\":120.0,\"type\":\"product\",\"cartNum\":1,\"productInfo\":{\"otPrice\":0.50,\"userCollect\":false,\"description\":\"<p style=\\\"text-align: center;\\\"><strong>文件请传QQ2412733099，</strong></p><p style=\\\"text-align: center;\\\"><strong>718504558或2412733099@qq.com邮箱，</strong></p><p style=\\\"text-align: center;\\\"><strong>手机/微信：13733990583</strong></p><p style=\\\"text-align: center;\\\"><strong>量大请联系店主，一定让您满意而归</strong></p><p style=\\\"text-align: center;\\\"><strong>&nbsp; &nbsp;实体店面经营 保质保量</strong></p><p style=\\\"text-align: center;\\\"><strong>A4黑白2毛/张，量大1毛/张，</strong></p><p style=\\\"text-align: center;\\\"><strong>A3黑白双面5毛/张，量大3毛/张，</strong></p><p style=\\\"text-align: center;\\\"><strong>更大量请联系店主报价，</strong></p><p style=\\\"text-align: center;\\\"><strong>每消费1元可积1分，1分抵现金1毛，</strong></p><p style=\\\"text-align: center;\\\"><strong>付款时直接抵扣</strong></p><p style=\\\"text-align: center;\\\"><strong>（如此优惠的基础上还可积分，积分抵现金）</strong></p><p style=\\\"text-align: left;\\\"><strong><br></strong></p><p><br></p><p>&nbsp; &nbsp;&nbsp;<img src=\\\"https://image.dayouqiantu.cn/5ca03007150f1.jpg\\\" style=\\\"max-width: 100%;\\\"><br></p>\",\"merUse\":0,\"isPostage\":1,\"image_base\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"isBest\":1,\"sales\":16,\"price\":120.00,\"isBargain\":0,\"userLike\":false,\"vipPrice\":0.20,\"storeName\":\"70gA4黑白打印复印\",\"id\":19,\"keyword\":\"打印复印\",\"stock\":99,\"image\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"cost\":0.20,\"isGood\":1,\"unitName\":\"张\",\"isBenefit\":1,\"giveIntegral\":1.00,\"isNew\":1,\"sort\":1,\"sliderImageArr\":[\"https://image.dayouqiantu.cn/5ca01c7fc9238.jpg\",\"https://image.dayouqiantu.cn/5ca01c7676042.jpg\"],\"sliderImage\":\"https://image.dayouqiantu.cn/5ca01c7fc9238.jpg,https://image.dayouqiantu.cn/5ca01c7676042.jpg\",\"barCode\":\"\",\"isShow\":1,\"postage\":0.00,\"codePath\":\"\",\"soureLink\":\"\",\"cateId\":\"24\",\"isSeckill\":0,\"storeInfo\":\"打印复印资料A4黑白彩色印刷画册书本装订图文数码快印服务\",\"isDel\":0,\"isHot\":1,\"attrInfo\":{\"image\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"cost\":100.00,\"productId\":19,\"price\":120.00,\"unique\":\"00e86525a7af4dcf9e653ae0a2062369\",\"suk\":\"A1,白色\",\"id\":22,\"stock\":995}},\"uid\":14,\"productAttrUnique\":\"00e86525a7af4dcf9e653ae0a2062369\",\"bargainId\":0,\"id\":67}', '2af264b8a00849798bdb61071c4cdf23');
INSERT INTO `yx_store_order_cart_info` VALUES (66, 68, 68, 19, '{\"addTime\":1573996420,\"productId\":19,\"seckillId\":0,\"vipTruePrice\":120.0,\"combinationId\":0,\"costPrice\":100.0,\"trueStock\":994,\"truePrice\":120.0,\"type\":\"product\",\"cartNum\":1,\"productInfo\":{\"otPrice\":0.50,\"userCollect\":false,\"description\":\"<p style=\\\"text-align: center;\\\"><strong>文件请传QQ2412733099，</strong></p><p style=\\\"text-align: center;\\\"><strong>718504558或2412733099@qq.com邮箱，</strong></p><p style=\\\"text-align: center;\\\"><strong>手机/微信：13733990583</strong></p><p style=\\\"text-align: center;\\\"><strong>量大请联系店主，一定让您满意而归</strong></p><p style=\\\"text-align: center;\\\"><strong>&nbsp; &nbsp;实体店面经营 保质保量</strong></p><p style=\\\"text-align: center;\\\"><strong>A4黑白2毛/张，量大1毛/张，</strong></p><p style=\\\"text-align: center;\\\"><strong>A3黑白双面5毛/张，量大3毛/张，</strong></p><p style=\\\"text-align: center;\\\"><strong>更大量请联系店主报价，</strong></p><p style=\\\"text-align: center;\\\"><strong>每消费1元可积1分，1分抵现金1毛，</strong></p><p style=\\\"text-align: center;\\\"><strong>付款时直接抵扣</strong></p><p style=\\\"text-align: center;\\\"><strong>（如此优惠的基础上还可积分，积分抵现金）</strong></p><p style=\\\"text-align: left;\\\"><strong><br></strong></p><p><br></p><p>&nbsp; &nbsp;&nbsp;<img src=\\\"https://image.dayouqiantu.cn/5ca03007150f1.jpg\\\" style=\\\"max-width: 100%;\\\"><br></p>\",\"merUse\":0,\"isPostage\":1,\"image_base\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"isBest\":1,\"sales\":17,\"price\":120.00,\"isBargain\":0,\"userLike\":false,\"vipPrice\":0.20,\"storeName\":\"70gA4黑白打印复印\",\"id\":19,\"keyword\":\"打印复印\",\"stock\":99,\"image\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"cost\":0.20,\"isGood\":1,\"unitName\":\"张\",\"isBenefit\":1,\"giveIntegral\":1.00,\"isNew\":1,\"sort\":1,\"sliderImageArr\":[\"https://image.dayouqiantu.cn/5ca01c7fc9238.jpg\",\"https://image.dayouqiantu.cn/5ca01c7676042.jpg\"],\"sliderImage\":\"https://image.dayouqiantu.cn/5ca01c7fc9238.jpg,https://image.dayouqiantu.cn/5ca01c7676042.jpg\",\"barCode\":\"\",\"isShow\":1,\"postage\":0.00,\"codePath\":\"\",\"soureLink\":\"\",\"cateId\":\"24\",\"isSeckill\":0,\"storeInfo\":\"打印复印资料A4黑白彩色印刷画册书本装订图文数码快印服务\",\"isDel\":0,\"isHot\":1,\"attrInfo\":{\"image\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"cost\":100.00,\"productId\":19,\"price\":120.00,\"unique\":\"00e86525a7af4dcf9e653ae0a2062369\",\"suk\":\"A1,白色\",\"id\":22,\"stock\":994}},\"uid\":14,\"productAttrUnique\":\"00e86525a7af4dcf9e653ae0a2062369\",\"bargainId\":0,\"id\":68}', '3c5b98f947e3409bacad9d20a17af08c');
INSERT INTO `yx_store_order_cart_info` VALUES (73, 75, 69, 19, '{\"addTime\":1573996695,\"productId\":19,\"seckillId\":0,\"vipTruePrice\":120.0,\"combinationId\":0,\"costPrice\":100.0,\"trueStock\":993,\"truePrice\":120.0,\"type\":\"product\",\"cartNum\":1,\"productInfo\":{\"otPrice\":0.50,\"userCollect\":false,\"description\":\"<p style=\\\"text-align: center;\\\"><strong>文件请传QQ2412733099，</strong></p><p style=\\\"text-align: center;\\\"><strong>718504558或2412733099@qq.com邮箱，</strong></p><p style=\\\"text-align: center;\\\"><strong>手机/微信：13733990583</strong></p><p style=\\\"text-align: center;\\\"><strong>量大请联系店主，一定让您满意而归</strong></p><p style=\\\"text-align: center;\\\"><strong>&nbsp; &nbsp;实体店面经营 保质保量</strong></p><p style=\\\"text-align: center;\\\"><strong>A4黑白2毛/张，量大1毛/张，</strong></p><p style=\\\"text-align: center;\\\"><strong>A3黑白双面5毛/张，量大3毛/张，</strong></p><p style=\\\"text-align: center;\\\"><strong>更大量请联系店主报价，</strong></p><p style=\\\"text-align: center;\\\"><strong>每消费1元可积1分，1分抵现金1毛，</strong></p><p style=\\\"text-align: center;\\\"><strong>付款时直接抵扣</strong></p><p style=\\\"text-align: center;\\\"><strong>（如此优惠的基础上还可积分，积分抵现金）</strong></p><p style=\\\"text-align: left;\\\"><strong><br></strong></p><p><br></p><p>&nbsp; &nbsp;&nbsp;<img src=\\\"https://image.dayouqiantu.cn/5ca03007150f1.jpg\\\" style=\\\"max-width: 100%;\\\"><br></p>\",\"merUse\":0,\"isPostage\":1,\"image_base\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"isBest\":1,\"sales\":18,\"price\":120.00,\"isBargain\":0,\"userLike\":false,\"vipPrice\":0.20,\"storeName\":\"70gA4黑白打印复印\",\"id\":19,\"keyword\":\"打印复印\",\"stock\":99,\"image\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"cost\":0.20,\"isGood\":1,\"unitName\":\"张\",\"isBenefit\":1,\"giveIntegral\":1.00,\"isNew\":1,\"sort\":1,\"sliderImageArr\":[\"https://image.dayouqiantu.cn/5ca01c7fc9238.jpg\",\"https://image.dayouqiantu.cn/5ca01c7676042.jpg\"],\"sliderImage\":\"https://image.dayouqiantu.cn/5ca01c7fc9238.jpg,https://image.dayouqiantu.cn/5ca01c7676042.jpg\",\"barCode\":\"\",\"isShow\":1,\"postage\":0.00,\"codePath\":\"\",\"soureLink\":\"\",\"cateId\":\"24\",\"isSeckill\":0,\"storeInfo\":\"打印复印资料A4黑白彩色印刷画册书本装订图文数码快印服务\",\"isDel\":0,\"isHot\":1,\"attrInfo\":{\"image\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"cost\":100.00,\"productId\":19,\"price\":120.00,\"unique\":\"00e86525a7af4dcf9e653ae0a2062369\",\"suk\":\"A1,白色\",\"id\":22,\"stock\":993}},\"uid\":14,\"productAttrUnique\":\"00e86525a7af4dcf9e653ae0a2062369\",\"bargainId\":0,\"id\":69}', 'dd5fb60b6cce409c941faac9bfc29043');
INSERT INTO `yx_store_order_cart_info` VALUES (74, 76, 70, 19, '{\"addTime\":1573999215,\"productId\":19,\"seckillId\":0,\"vipTruePrice\":120.0,\"combinationId\":0,\"costPrice\":100.0,\"trueStock\":993,\"truePrice\":120.0,\"type\":\"product\",\"cartNum\":1,\"productInfo\":{\"otPrice\":0.50,\"userCollect\":false,\"description\":\"<p style=\\\"text-align: center;\\\"><strong>文件请传QQ2412733099，</strong></p><p style=\\\"text-align: center;\\\"><strong>718504558或2412733099@qq.com邮箱，</strong></p><p style=\\\"text-align: center;\\\"><strong>手机/微信：13733990583</strong></p><p style=\\\"text-align: center;\\\"><strong>量大请联系店主，一定让您满意而归</strong></p><p style=\\\"text-align: center;\\\"><strong>&nbsp; &nbsp;实体店面经营 保质保量</strong></p><p style=\\\"text-align: center;\\\"><strong>A4黑白2毛/张，量大1毛/张，</strong></p><p style=\\\"text-align: center;\\\"><strong>A3黑白双面5毛/张，量大3毛/张，</strong></p><p style=\\\"text-align: center;\\\"><strong>更大量请联系店主报价，</strong></p><p style=\\\"text-align: center;\\\"><strong>每消费1元可积1分，1分抵现金1毛，</strong></p><p style=\\\"text-align: center;\\\"><strong>付款时直接抵扣</strong></p><p style=\\\"text-align: center;\\\"><strong>（如此优惠的基础上还可积分，积分抵现金）</strong></p><p style=\\\"text-align: left;\\\"><strong><br></strong></p><p><br></p><p>&nbsp; &nbsp;&nbsp;<img src=\\\"https://image.dayouqiantu.cn/5ca03007150f1.jpg\\\" style=\\\"max-width: 100%;\\\"><br></p>\",\"merUse\":0,\"isPostage\":1,\"image_base\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"isBest\":1,\"sales\":18,\"price\":120.00,\"isBargain\":0,\"userLike\":false,\"vipPrice\":0.20,\"storeName\":\"70gA4黑白打印复印\",\"id\":19,\"keyword\":\"打印复印\",\"stock\":99,\"image\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"cost\":0.20,\"isGood\":1,\"unitName\":\"张\",\"isBenefit\":1,\"giveIntegral\":1.00,\"isNew\":1,\"sort\":1,\"sliderImageArr\":[\"https://image.dayouqiantu.cn/5ca01c7fc9238.jpg\",\"https://image.dayouqiantu.cn/5ca01c7676042.jpg\"],\"sliderImage\":\"https://image.dayouqiantu.cn/5ca01c7fc9238.jpg,https://image.dayouqiantu.cn/5ca01c7676042.jpg\",\"barCode\":\"\",\"isShow\":1,\"postage\":0.00,\"codePath\":\"\",\"soureLink\":\"\",\"cateId\":\"24\",\"isSeckill\":0,\"storeInfo\":\"打印复印资料A4黑白彩色印刷画册书本装订图文数码快印服务\",\"isDel\":0,\"isHot\":1,\"attrInfo\":{\"image\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"cost\":100.00,\"productId\":19,\"price\":120.00,\"unique\":\"00e86525a7af4dcf9e653ae0a2062369\",\"suk\":\"A1,白色\",\"id\":22,\"stock\":993}},\"uid\":14,\"productAttrUnique\":\"00e86525a7af4dcf9e653ae0a2062369\",\"bargainId\":0,\"id\":70}', '82770b6bd27046d7bd1757b6cb5b800f');
INSERT INTO `yx_store_order_cart_info` VALUES (75, 77, 71, 19, '{\"addTime\":1573999374,\"productId\":19,\"seckillId\":0,\"vipTruePrice\":120.0,\"combinationId\":0,\"costPrice\":100.0,\"trueStock\":993,\"truePrice\":120.0,\"type\":\"product\",\"cartNum\":1,\"productInfo\":{\"otPrice\":0.50,\"userCollect\":false,\"description\":\"<p style=\\\"text-align: center;\\\"><strong>文件请传QQ2412733099，</strong></p><p style=\\\"text-align: center;\\\"><strong>718504558或2412733099@qq.com邮箱，</strong></p><p style=\\\"text-align: center;\\\"><strong>手机/微信：13733990583</strong></p><p style=\\\"text-align: center;\\\"><strong>量大请联系店主，一定让您满意而归</strong></p><p style=\\\"text-align: center;\\\"><strong>&nbsp; &nbsp;实体店面经营 保质保量</strong></p><p style=\\\"text-align: center;\\\"><strong>A4黑白2毛/张，量大1毛/张，</strong></p><p style=\\\"text-align: center;\\\"><strong>A3黑白双面5毛/张，量大3毛/张，</strong></p><p style=\\\"text-align: center;\\\"><strong>更大量请联系店主报价，</strong></p><p style=\\\"text-align: center;\\\"><strong>每消费1元可积1分，1分抵现金1毛，</strong></p><p style=\\\"text-align: center;\\\"><strong>付款时直接抵扣</strong></p><p style=\\\"text-align: center;\\\"><strong>（如此优惠的基础上还可积分，积分抵现金）</strong></p><p style=\\\"text-align: left;\\\"><strong><br></strong></p><p><br></p><p>&nbsp; &nbsp;&nbsp;<img src=\\\"https://image.dayouqiantu.cn/5ca03007150f1.jpg\\\" style=\\\"max-width: 100%;\\\"><br></p>\",\"merUse\":0,\"isPostage\":1,\"image_base\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"isBest\":1,\"sales\":18,\"price\":120.00,\"isBargain\":0,\"userLike\":false,\"vipPrice\":0.20,\"storeName\":\"70gA4黑白打印复印\",\"id\":19,\"keyword\":\"打印复印\",\"stock\":99,\"image\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"cost\":0.20,\"isGood\":1,\"unitName\":\"张\",\"isBenefit\":1,\"giveIntegral\":1.00,\"isNew\":1,\"sort\":1,\"sliderImageArr\":[\"https://image.dayouqiantu.cn/5ca01c7fc9238.jpg\",\"https://image.dayouqiantu.cn/5ca01c7676042.jpg\"],\"sliderImage\":\"https://image.dayouqiantu.cn/5ca01c7fc9238.jpg,https://image.dayouqiantu.cn/5ca01c7676042.jpg\",\"barCode\":\"\",\"isShow\":1,\"postage\":0.00,\"codePath\":\"\",\"soureLink\":\"\",\"cateId\":\"24\",\"isSeckill\":0,\"storeInfo\":\"打印复印资料A4黑白彩色印刷画册书本装订图文数码快印服务\",\"isDel\":0,\"isHot\":1,\"attrInfo\":{\"image\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"cost\":100.00,\"productId\":19,\"price\":120.00,\"unique\":\"00e86525a7af4dcf9e653ae0a2062369\",\"suk\":\"A1,白色\",\"id\":22,\"stock\":993}},\"uid\":14,\"productAttrUnique\":\"00e86525a7af4dcf9e653ae0a2062369\",\"bargainId\":0,\"id\":71}', '78a8a18f789d4d3587e087d85c0a3324');
INSERT INTO `yx_store_order_cart_info` VALUES (76, 78, 72, 19, '{\"addTime\":1573999538,\"productId\":19,\"seckillId\":0,\"vipTruePrice\":120.0,\"combinationId\":0,\"costPrice\":100.0,\"trueStock\":993,\"truePrice\":120.0,\"type\":\"product\",\"cartNum\":1,\"productInfo\":{\"otPrice\":0.50,\"userCollect\":false,\"description\":\"<p style=\\\"text-align: center;\\\"><strong>文件请传QQ2412733099，</strong></p><p style=\\\"text-align: center;\\\"><strong>718504558或2412733099@qq.com邮箱，</strong></p><p style=\\\"text-align: center;\\\"><strong>手机/微信：13733990583</strong></p><p style=\\\"text-align: center;\\\"><strong>量大请联系店主，一定让您满意而归</strong></p><p style=\\\"text-align: center;\\\"><strong>&nbsp; &nbsp;实体店面经营 保质保量</strong></p><p style=\\\"text-align: center;\\\"><strong>A4黑白2毛/张，量大1毛/张，</strong></p><p style=\\\"text-align: center;\\\"><strong>A3黑白双面5毛/张，量大3毛/张，</strong></p><p style=\\\"text-align: center;\\\"><strong>更大量请联系店主报价，</strong></p><p style=\\\"text-align: center;\\\"><strong>每消费1元可积1分，1分抵现金1毛，</strong></p><p style=\\\"text-align: center;\\\"><strong>付款时直接抵扣</strong></p><p style=\\\"text-align: center;\\\"><strong>（如此优惠的基础上还可积分，积分抵现金）</strong></p><p style=\\\"text-align: left;\\\"><strong><br></strong></p><p><br></p><p>&nbsp; &nbsp;&nbsp;<img src=\\\"https://image.dayouqiantu.cn/5ca03007150f1.jpg\\\" style=\\\"max-width: 100%;\\\"><br></p>\",\"merUse\":0,\"isPostage\":1,\"image_base\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"isBest\":1,\"sales\":18,\"price\":120.00,\"isBargain\":0,\"userLike\":false,\"vipPrice\":0.20,\"storeName\":\"70gA4黑白打印复印\",\"id\":19,\"keyword\":\"打印复印\",\"stock\":99,\"image\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"cost\":0.20,\"isGood\":1,\"unitName\":\"张\",\"isBenefit\":1,\"giveIntegral\":1.00,\"isNew\":1,\"sort\":1,\"sliderImageArr\":[\"https://image.dayouqiantu.cn/5ca01c7fc9238.jpg\",\"https://image.dayouqiantu.cn/5ca01c7676042.jpg\"],\"sliderImage\":\"https://image.dayouqiantu.cn/5ca01c7fc9238.jpg,https://image.dayouqiantu.cn/5ca01c7676042.jpg\",\"barCode\":\"\",\"isShow\":1,\"postage\":0.00,\"codePath\":\"\",\"soureLink\":\"\",\"cateId\":\"24\",\"isSeckill\":0,\"storeInfo\":\"打印复印资料A4黑白彩色印刷画册书本装订图文数码快印服务\",\"isDel\":0,\"isHot\":1,\"attrInfo\":{\"image\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"cost\":100.00,\"productId\":19,\"price\":120.00,\"unique\":\"00e86525a7af4dcf9e653ae0a2062369\",\"suk\":\"A1,白色\",\"id\":22,\"stock\":993}},\"uid\":14,\"productAttrUnique\":\"00e86525a7af4dcf9e653ae0a2062369\",\"bargainId\":0,\"id\":72}', '321a280b69bf42219044e0677c520477');
INSERT INTO `yx_store_order_cart_info` VALUES (77, 79, 73, 19, '{\"addTime\":1573999673,\"productId\":19,\"seckillId\":0,\"vipTruePrice\":120.0,\"combinationId\":0,\"costPrice\":100.0,\"trueStock\":993,\"truePrice\":120.0,\"type\":\"product\",\"cartNum\":1,\"productInfo\":{\"otPrice\":0.50,\"userCollect\":false,\"description\":\"<p style=\\\"text-align: center;\\\"><strong>文件请传QQ2412733099，</strong></p><p style=\\\"text-align: center;\\\"><strong>718504558或2412733099@qq.com邮箱，</strong></p><p style=\\\"text-align: center;\\\"><strong>手机/微信：13733990583</strong></p><p style=\\\"text-align: center;\\\"><strong>量大请联系店主，一定让您满意而归</strong></p><p style=\\\"text-align: center;\\\"><strong>&nbsp; &nbsp;实体店面经营 保质保量</strong></p><p style=\\\"text-align: center;\\\"><strong>A4黑白2毛/张，量大1毛/张，</strong></p><p style=\\\"text-align: center;\\\"><strong>A3黑白双面5毛/张，量大3毛/张，</strong></p><p style=\\\"text-align: center;\\\"><strong>更大量请联系店主报价，</strong></p><p style=\\\"text-align: center;\\\"><strong>每消费1元可积1分，1分抵现金1毛，</strong></p><p style=\\\"text-align: center;\\\"><strong>付款时直接抵扣</strong></p><p style=\\\"text-align: center;\\\"><strong>（如此优惠的基础上还可积分，积分抵现金）</strong></p><p style=\\\"text-align: left;\\\"><strong><br></strong></p><p><br></p><p>&nbsp; &nbsp;&nbsp;<img src=\\\"https://image.dayouqiantu.cn/5ca03007150f1.jpg\\\" style=\\\"max-width: 100%;\\\"><br></p>\",\"merUse\":0,\"isPostage\":1,\"image_base\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"isBest\":1,\"sales\":18,\"price\":120.00,\"isBargain\":0,\"userLike\":false,\"vipPrice\":0.20,\"storeName\":\"70gA4黑白打印复印\",\"id\":19,\"keyword\":\"打印复印\",\"stock\":99,\"image\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"cost\":0.20,\"isGood\":1,\"unitName\":\"张\",\"isBenefit\":1,\"giveIntegral\":1.00,\"isNew\":1,\"sort\":1,\"sliderImageArr\":[\"https://image.dayouqiantu.cn/5ca01c7fc9238.jpg\",\"https://image.dayouqiantu.cn/5ca01c7676042.jpg\"],\"sliderImage\":\"https://image.dayouqiantu.cn/5ca01c7fc9238.jpg,https://image.dayouqiantu.cn/5ca01c7676042.jpg\",\"barCode\":\"\",\"isShow\":1,\"postage\":0.00,\"codePath\":\"\",\"soureLink\":\"\",\"cateId\":\"24\",\"isSeckill\":0,\"storeInfo\":\"打印复印资料A4黑白彩色印刷画册书本装订图文数码快印服务\",\"isDel\":0,\"isHot\":1,\"attrInfo\":{\"image\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"cost\":100.00,\"productId\":19,\"price\":120.00,\"unique\":\"00e86525a7af4dcf9e653ae0a2062369\",\"suk\":\"A1,白色\",\"id\":22,\"stock\":993}},\"uid\":14,\"productAttrUnique\":\"00e86525a7af4dcf9e653ae0a2062369\",\"bargainId\":0,\"id\":73}', '61fb913b3fc44cb5861f88a2dd7702d8');
INSERT INTO `yx_store_order_cart_info` VALUES (78, 80, 74, 19, '{\"addTime\":1574000128,\"productId\":19,\"seckillId\":0,\"vipTruePrice\":120.0,\"combinationId\":0,\"costPrice\":100.0,\"trueStock\":993,\"truePrice\":120.0,\"type\":\"product\",\"cartNum\":1,\"productInfo\":{\"otPrice\":0.50,\"userCollect\":false,\"description\":\"<p style=\\\"text-align: center;\\\"><strong>文件请传QQ2412733099，</strong></p><p style=\\\"text-align: center;\\\"><strong>718504558或2412733099@qq.com邮箱，</strong></p><p style=\\\"text-align: center;\\\"><strong>手机/微信：13733990583</strong></p><p style=\\\"text-align: center;\\\"><strong>量大请联系店主，一定让您满意而归</strong></p><p style=\\\"text-align: center;\\\"><strong>&nbsp; &nbsp;实体店面经营 保质保量</strong></p><p style=\\\"text-align: center;\\\"><strong>A4黑白2毛/张，量大1毛/张，</strong></p><p style=\\\"text-align: center;\\\"><strong>A3黑白双面5毛/张，量大3毛/张，</strong></p><p style=\\\"text-align: center;\\\"><strong>更大量请联系店主报价，</strong></p><p style=\\\"text-align: center;\\\"><strong>每消费1元可积1分，1分抵现金1毛，</strong></p><p style=\\\"text-align: center;\\\"><strong>付款时直接抵扣</strong></p><p style=\\\"text-align: center;\\\"><strong>（如此优惠的基础上还可积分，积分抵现金）</strong></p><p style=\\\"text-align: left;\\\"><strong><br></strong></p><p><br></p><p>&nbsp; &nbsp;&nbsp;<img src=\\\"https://image.dayouqiantu.cn/5ca03007150f1.jpg\\\" style=\\\"max-width: 100%;\\\"><br></p>\",\"merUse\":0,\"isPostage\":1,\"image_base\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"isBest\":1,\"sales\":18,\"price\":120.00,\"isBargain\":0,\"userLike\":false,\"vipPrice\":0.20,\"storeName\":\"70gA4黑白打印复印\",\"id\":19,\"keyword\":\"打印复印\",\"stock\":99,\"image\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"cost\":0.20,\"isGood\":1,\"unitName\":\"张\",\"isBenefit\":1,\"giveIntegral\":1.00,\"isNew\":1,\"sort\":1,\"sliderImageArr\":[\"https://image.dayouqiantu.cn/5ca01c7fc9238.jpg\",\"https://image.dayouqiantu.cn/5ca01c7676042.jpg\"],\"sliderImage\":\"https://image.dayouqiantu.cn/5ca01c7fc9238.jpg,https://image.dayouqiantu.cn/5ca01c7676042.jpg\",\"barCode\":\"\",\"isShow\":1,\"postage\":0.00,\"codePath\":\"\",\"soureLink\":\"\",\"cateId\":\"24\",\"isSeckill\":0,\"storeInfo\":\"打印复印资料A4黑白彩色印刷画册书本装订图文数码快印服务\",\"isDel\":0,\"isHot\":1,\"attrInfo\":{\"image\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"cost\":100.00,\"productId\":19,\"price\":120.00,\"unique\":\"00e86525a7af4dcf9e653ae0a2062369\",\"suk\":\"A1,白色\",\"id\":22,\"stock\":993}},\"uid\":14,\"productAttrUnique\":\"00e86525a7af4dcf9e653ae0a2062369\",\"bargainId\":0,\"id\":74}', '2eb073557f3e439ba95d0e6a3eb6253e');
INSERT INTO `yx_store_order_cart_info` VALUES (79, 81, 75, 19, '{\"addTime\":1574000409,\"productId\":19,\"seckillId\":0,\"vipTruePrice\":120.0,\"combinationId\":0,\"costPrice\":100.0,\"trueStock\":993,\"truePrice\":120.0,\"type\":\"product\",\"cartNum\":1,\"productInfo\":{\"otPrice\":0.50,\"userCollect\":false,\"description\":\"<p style=\\\"text-align: center;\\\"><strong>文件请传QQ2412733099，</strong></p><p style=\\\"text-align: center;\\\"><strong>718504558或2412733099@qq.com邮箱，</strong></p><p style=\\\"text-align: center;\\\"><strong>手机/微信：13733990583</strong></p><p style=\\\"text-align: center;\\\"><strong>量大请联系店主，一定让您满意而归</strong></p><p style=\\\"text-align: center;\\\"><strong>&nbsp; &nbsp;实体店面经营 保质保量</strong></p><p style=\\\"text-align: center;\\\"><strong>A4黑白2毛/张，量大1毛/张，</strong></p><p style=\\\"text-align: center;\\\"><strong>A3黑白双面5毛/张，量大3毛/张，</strong></p><p style=\\\"text-align: center;\\\"><strong>更大量请联系店主报价，</strong></p><p style=\\\"text-align: center;\\\"><strong>每消费1元可积1分，1分抵现金1毛，</strong></p><p style=\\\"text-align: center;\\\"><strong>付款时直接抵扣</strong></p><p style=\\\"text-align: center;\\\"><strong>（如此优惠的基础上还可积分，积分抵现金）</strong></p><p style=\\\"text-align: left;\\\"><strong><br></strong></p><p><br></p><p>&nbsp; &nbsp;&nbsp;<img src=\\\"https://image.dayouqiantu.cn/5ca03007150f1.jpg\\\" style=\\\"max-width: 100%;\\\"><br></p>\",\"merUse\":0,\"isPostage\":1,\"image_base\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"isBest\":1,\"sales\":18,\"price\":120.00,\"isBargain\":0,\"userLike\":false,\"vipPrice\":0.20,\"storeName\":\"70gA4黑白打印复印\",\"id\":19,\"keyword\":\"打印复印\",\"stock\":99,\"image\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"cost\":0.20,\"isGood\":1,\"unitName\":\"张\",\"isBenefit\":1,\"giveIntegral\":1.00,\"isNew\":1,\"sort\":1,\"sliderImageArr\":[\"https://image.dayouqiantu.cn/5ca01c7fc9238.jpg\",\"https://image.dayouqiantu.cn/5ca01c7676042.jpg\"],\"sliderImage\":\"https://image.dayouqiantu.cn/5ca01c7fc9238.jpg,https://image.dayouqiantu.cn/5ca01c7676042.jpg\",\"barCode\":\"\",\"isShow\":1,\"postage\":0.00,\"codePath\":\"\",\"soureLink\":\"\",\"cateId\":\"24\",\"isSeckill\":0,\"storeInfo\":\"打印复印资料A4黑白彩色印刷画册书本装订图文数码快印服务\",\"isDel\":0,\"isHot\":1,\"attrInfo\":{\"image\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"cost\":100.00,\"productId\":19,\"price\":120.00,\"unique\":\"00e86525a7af4dcf9e653ae0a2062369\",\"suk\":\"A1,白色\",\"id\":22,\"stock\":993}},\"uid\":14,\"productAttrUnique\":\"00e86525a7af4dcf9e653ae0a2062369\",\"bargainId\":0,\"id\":75}', '979fbfa642474275829595120bacddd8');
INSERT INTO `yx_store_order_cart_info` VALUES (80, 82, 76, 19, '{\"addTime\":1574000926,\"productId\":19,\"seckillId\":0,\"vipTruePrice\":120.0,\"combinationId\":0,\"costPrice\":100.0,\"trueStock\":993,\"truePrice\":120.0,\"type\":\"product\",\"cartNum\":1,\"productInfo\":{\"otPrice\":0.50,\"userCollect\":false,\"description\":\"<p style=\\\"text-align: center;\\\"><strong>文件请传QQ2412733099，</strong></p><p style=\\\"text-align: center;\\\"><strong>718504558或2412733099@qq.com邮箱，</strong></p><p style=\\\"text-align: center;\\\"><strong>手机/微信：13733990583</strong></p><p style=\\\"text-align: center;\\\"><strong>量大请联系店主，一定让您满意而归</strong></p><p style=\\\"text-align: center;\\\"><strong>&nbsp; &nbsp;实体店面经营 保质保量</strong></p><p style=\\\"text-align: center;\\\"><strong>A4黑白2毛/张，量大1毛/张，</strong></p><p style=\\\"text-align: center;\\\"><strong>A3黑白双面5毛/张，量大3毛/张，</strong></p><p style=\\\"text-align: center;\\\"><strong>更大量请联系店主报价，</strong></p><p style=\\\"text-align: center;\\\"><strong>每消费1元可积1分，1分抵现金1毛，</strong></p><p style=\\\"text-align: center;\\\"><strong>付款时直接抵扣</strong></p><p style=\\\"text-align: center;\\\"><strong>（如此优惠的基础上还可积分，积分抵现金）</strong></p><p style=\\\"text-align: left;\\\"><strong><br></strong></p><p><br></p><p>&nbsp; &nbsp;&nbsp;<img src=\\\"https://image.dayouqiantu.cn/5ca03007150f1.jpg\\\" style=\\\"max-width: 100%;\\\"><br></p>\",\"merUse\":0,\"isPostage\":1,\"image_base\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"isBest\":1,\"sales\":18,\"price\":120.00,\"isBargain\":0,\"userLike\":false,\"vipPrice\":0.20,\"storeName\":\"70gA4黑白打印复印\",\"id\":19,\"keyword\":\"打印复印\",\"stock\":99,\"image\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"cost\":0.20,\"isGood\":1,\"unitName\":\"张\",\"isBenefit\":1,\"giveIntegral\":1.00,\"isNew\":1,\"sort\":1,\"sliderImageArr\":[\"https://image.dayouqiantu.cn/5ca01c7fc9238.jpg\",\"https://image.dayouqiantu.cn/5ca01c7676042.jpg\"],\"sliderImage\":\"https://image.dayouqiantu.cn/5ca01c7fc9238.jpg,https://image.dayouqiantu.cn/5ca01c7676042.jpg\",\"barCode\":\"\",\"isShow\":1,\"postage\":0.00,\"codePath\":\"\",\"soureLink\":\"\",\"cateId\":\"24\",\"isSeckill\":0,\"storeInfo\":\"打印复印资料A4黑白彩色印刷画册书本装订图文数码快印服务\",\"isDel\":0,\"isHot\":1,\"attrInfo\":{\"image\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"cost\":100.00,\"productId\":19,\"price\":120.00,\"unique\":\"00e86525a7af4dcf9e653ae0a2062369\",\"suk\":\"A1,白色\",\"id\":22,\"stock\":993}},\"uid\":14,\"productAttrUnique\":\"00e86525a7af4dcf9e653ae0a2062369\",\"bargainId\":0,\"id\":76}', '49415f7331324948a53193088f6e2b80');
INSERT INTO `yx_store_order_cart_info` VALUES (81, 83, 77, 19, '{\"addTime\":1574001199,\"productId\":19,\"seckillId\":0,\"vipTruePrice\":120.0,\"combinationId\":0,\"costPrice\":100.0,\"trueStock\":993,\"truePrice\":120.0,\"type\":\"product\",\"cartNum\":1,\"productInfo\":{\"otPrice\":0.50,\"userCollect\":false,\"description\":\"<p style=\\\"text-align: center;\\\"><strong>文件请传QQ2412733099，</strong></p><p style=\\\"text-align: center;\\\"><strong>718504558或2412733099@qq.com邮箱，</strong></p><p style=\\\"text-align: center;\\\"><strong>手机/微信：13733990583</strong></p><p style=\\\"text-align: center;\\\"><strong>量大请联系店主，一定让您满意而归</strong></p><p style=\\\"text-align: center;\\\"><strong>&nbsp; &nbsp;实体店面经营 保质保量</strong></p><p style=\\\"text-align: center;\\\"><strong>A4黑白2毛/张，量大1毛/张，</strong></p><p style=\\\"text-align: center;\\\"><strong>A3黑白双面5毛/张，量大3毛/张，</strong></p><p style=\\\"text-align: center;\\\"><strong>更大量请联系店主报价，</strong></p><p style=\\\"text-align: center;\\\"><strong>每消费1元可积1分，1分抵现金1毛，</strong></p><p style=\\\"text-align: center;\\\"><strong>付款时直接抵扣</strong></p><p style=\\\"text-align: center;\\\"><strong>（如此优惠的基础上还可积分，积分抵现金）</strong></p><p style=\\\"text-align: left;\\\"><strong><br></strong></p><p><br></p><p>&nbsp; &nbsp;&nbsp;<img src=\\\"https://image.dayouqiantu.cn/5ca03007150f1.jpg\\\" style=\\\"max-width: 100%;\\\"><br></p>\",\"merUse\":0,\"isPostage\":1,\"image_base\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"isBest\":1,\"sales\":18,\"price\":120.00,\"isBargain\":0,\"userLike\":false,\"vipPrice\":0.20,\"storeName\":\"70gA4黑白打印复印\",\"id\":19,\"keyword\":\"打印复印\",\"stock\":99,\"image\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"cost\":0.20,\"isGood\":1,\"unitName\":\"张\",\"isBenefit\":1,\"giveIntegral\":1.00,\"isNew\":1,\"sort\":1,\"sliderImageArr\":[\"https://image.dayouqiantu.cn/5ca01c7fc9238.jpg\",\"https://image.dayouqiantu.cn/5ca01c7676042.jpg\"],\"sliderImage\":\"https://image.dayouqiantu.cn/5ca01c7fc9238.jpg,https://image.dayouqiantu.cn/5ca01c7676042.jpg\",\"barCode\":\"\",\"isShow\":1,\"postage\":0.00,\"codePath\":\"\",\"soureLink\":\"\",\"cateId\":\"24\",\"isSeckill\":0,\"storeInfo\":\"打印复印资料A4黑白彩色印刷画册书本装订图文数码快印服务\",\"isDel\":0,\"isHot\":1,\"attrInfo\":{\"image\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"cost\":100.00,\"productId\":19,\"price\":120.00,\"unique\":\"00e86525a7af4dcf9e653ae0a2062369\",\"suk\":\"A1,白色\",\"id\":22,\"stock\":993}},\"uid\":14,\"productAttrUnique\":\"00e86525a7af4dcf9e653ae0a2062369\",\"bargainId\":0,\"id\":77}', '66dbb6eac2dd43a99ff3273d2e29db80');
INSERT INTO `yx_store_order_cart_info` VALUES (82, 84, 78, 19, '{\"addTime\":1574001302,\"productId\":19,\"seckillId\":0,\"vipTruePrice\":120.0,\"combinationId\":0,\"costPrice\":100.0,\"trueStock\":993,\"truePrice\":120.0,\"type\":\"product\",\"cartNum\":1,\"productInfo\":{\"otPrice\":0.50,\"userCollect\":false,\"description\":\"<p style=\\\"text-align: center;\\\"><strong>文件请传QQ2412733099，</strong></p><p style=\\\"text-align: center;\\\"><strong>718504558或2412733099@qq.com邮箱，</strong></p><p style=\\\"text-align: center;\\\"><strong>手机/微信：13733990583</strong></p><p style=\\\"text-align: center;\\\"><strong>量大请联系店主，一定让您满意而归</strong></p><p style=\\\"text-align: center;\\\"><strong>&nbsp; &nbsp;实体店面经营 保质保量</strong></p><p style=\\\"text-align: center;\\\"><strong>A4黑白2毛/张，量大1毛/张，</strong></p><p style=\\\"text-align: center;\\\"><strong>A3黑白双面5毛/张，量大3毛/张，</strong></p><p style=\\\"text-align: center;\\\"><strong>更大量请联系店主报价，</strong></p><p style=\\\"text-align: center;\\\"><strong>每消费1元可积1分，1分抵现金1毛，</strong></p><p style=\\\"text-align: center;\\\"><strong>付款时直接抵扣</strong></p><p style=\\\"text-align: center;\\\"><strong>（如此优惠的基础上还可积分，积分抵现金）</strong></p><p style=\\\"text-align: left;\\\"><strong><br></strong></p><p><br></p><p>&nbsp; &nbsp;&nbsp;<img src=\\\"https://image.dayouqiantu.cn/5ca03007150f1.jpg\\\" style=\\\"max-width: 100%;\\\"><br></p>\",\"merUse\":0,\"isPostage\":1,\"image_base\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"isBest\":1,\"sales\":18,\"price\":120.00,\"isBargain\":0,\"userLike\":false,\"vipPrice\":0.20,\"storeName\":\"70gA4黑白打印复印\",\"id\":19,\"keyword\":\"打印复印\",\"stock\":99,\"image\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"cost\":0.20,\"isGood\":1,\"unitName\":\"张\",\"isBenefit\":1,\"giveIntegral\":1.00,\"isNew\":1,\"sort\":1,\"sliderImageArr\":[\"https://image.dayouqiantu.cn/5ca01c7fc9238.jpg\",\"https://image.dayouqiantu.cn/5ca01c7676042.jpg\"],\"sliderImage\":\"https://image.dayouqiantu.cn/5ca01c7fc9238.jpg,https://image.dayouqiantu.cn/5ca01c7676042.jpg\",\"barCode\":\"\",\"isShow\":1,\"postage\":0.00,\"codePath\":\"\",\"soureLink\":\"\",\"cateId\":\"24\",\"isSeckill\":0,\"storeInfo\":\"打印复印资料A4黑白彩色印刷画册书本装订图文数码快印服务\",\"isDel\":0,\"isHot\":1,\"attrInfo\":{\"image\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"cost\":100.00,\"productId\":19,\"price\":120.00,\"unique\":\"00e86525a7af4dcf9e653ae0a2062369\",\"suk\":\"A1,白色\",\"id\":22,\"stock\":993}},\"uid\":14,\"productAttrUnique\":\"00e86525a7af4dcf9e653ae0a2062369\",\"bargainId\":0,\"id\":78}', '6e76027cecde4891a40c00e3bc84922f');
INSERT INTO `yx_store_order_cart_info` VALUES (83, 85, 79, 19, '{\"addTime\":1574039489,\"productId\":19,\"seckillId\":0,\"vipTruePrice\":120.0,\"combinationId\":0,\"costPrice\":100.0,\"trueStock\":993,\"truePrice\":120.0,\"type\":\"product\",\"cartNum\":1,\"productInfo\":{\"otPrice\":0.50,\"userCollect\":false,\"description\":\"<p style=\\\"text-align: center;\\\"><strong>文件请传QQ2412733099，</strong></p><p style=\\\"text-align: center;\\\"><strong>718504558或2412733099@qq.com邮箱，</strong></p><p style=\\\"text-align: center;\\\"><strong>手机/微信：13733990583</strong></p><p style=\\\"text-align: center;\\\"><strong>量大请联系店主，一定让您满意而归</strong></p><p style=\\\"text-align: center;\\\"><strong>&nbsp; &nbsp;实体店面经营 保质保量</strong></p><p style=\\\"text-align: center;\\\"><strong>A4黑白2毛/张，量大1毛/张，</strong></p><p style=\\\"text-align: center;\\\"><strong>A3黑白双面5毛/张，量大3毛/张，</strong></p><p style=\\\"text-align: center;\\\"><strong>更大量请联系店主报价，</strong></p><p style=\\\"text-align: center;\\\"><strong>每消费1元可积1分，1分抵现金1毛，</strong></p><p style=\\\"text-align: center;\\\"><strong>付款时直接抵扣</strong></p><p style=\\\"text-align: center;\\\"><strong>（如此优惠的基础上还可积分，积分抵现金）</strong></p><p style=\\\"text-align: left;\\\"><strong><br></strong></p><p><br></p><p>&nbsp; &nbsp;&nbsp;<img src=\\\"https://image.dayouqiantu.cn/5ca03007150f1.jpg\\\" style=\\\"max-width: 100%;\\\"><br></p>\",\"merUse\":0,\"isPostage\":1,\"image_base\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"isBest\":1,\"sales\":18,\"price\":120.00,\"isBargain\":0,\"userLike\":false,\"vipPrice\":0.20,\"storeName\":\"70gA4黑白打印复印\",\"id\":19,\"keyword\":\"打印复印\",\"stock\":99,\"image\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"cost\":0.20,\"isGood\":1,\"unitName\":\"张\",\"isBenefit\":1,\"giveIntegral\":1.00,\"isNew\":1,\"sort\":1,\"sliderImageArr\":[\"https://image.dayouqiantu.cn/5ca01c7fc9238.jpg\",\"https://image.dayouqiantu.cn/5ca01c7676042.jpg\"],\"sliderImage\":\"https://image.dayouqiantu.cn/5ca01c7fc9238.jpg,https://image.dayouqiantu.cn/5ca01c7676042.jpg\",\"barCode\":\"\",\"isShow\":1,\"postage\":0.00,\"codePath\":\"\",\"soureLink\":\"\",\"cateId\":\"24\",\"isSeckill\":0,\"storeInfo\":\"打印复印资料A4黑白彩色印刷画册书本装订图文数码快印服务\",\"isDel\":0,\"isHot\":1,\"attrInfo\":{\"image\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"cost\":100.00,\"productId\":19,\"price\":120.00,\"unique\":\"00e86525a7af4dcf9e653ae0a2062369\",\"suk\":\"A1,白色\",\"id\":22,\"stock\":993}},\"uid\":14,\"productAttrUnique\":\"00e86525a7af4dcf9e653ae0a2062369\",\"bargainId\":0,\"id\":79}', '58b701815010440aa8d892fb0a8e22ff');
INSERT INTO `yx_store_order_cart_info` VALUES (84, 86, 80, 19, '{\"addTime\":1574040157,\"productId\":19,\"seckillId\":0,\"vipTruePrice\":120.0,\"combinationId\":0,\"costPrice\":100.0,\"trueStock\":993,\"truePrice\":120.0,\"type\":\"product\",\"cartNum\":1,\"productInfo\":{\"otPrice\":0.50,\"userCollect\":false,\"description\":\"<p style=\\\"text-align: center;\\\"><strong>文件请传QQ2412733099，</strong></p><p style=\\\"text-align: center;\\\"><strong>718504558或2412733099@qq.com邮箱，</strong></p><p style=\\\"text-align: center;\\\"><strong>手机/微信：13733990583</strong></p><p style=\\\"text-align: center;\\\"><strong>量大请联系店主，一定让您满意而归</strong></p><p style=\\\"text-align: center;\\\"><strong>&nbsp; &nbsp;实体店面经营 保质保量</strong></p><p style=\\\"text-align: center;\\\"><strong>A4黑白2毛/张，量大1毛/张，</strong></p><p style=\\\"text-align: center;\\\"><strong>A3黑白双面5毛/张，量大3毛/张，</strong></p><p style=\\\"text-align: center;\\\"><strong>更大量请联系店主报价，</strong></p><p style=\\\"text-align: center;\\\"><strong>每消费1元可积1分，1分抵现金1毛，</strong></p><p style=\\\"text-align: center;\\\"><strong>付款时直接抵扣</strong></p><p style=\\\"text-align: center;\\\"><strong>（如此优惠的基础上还可积分，积分抵现金）</strong></p><p style=\\\"text-align: left;\\\"><strong><br></strong></p><p><br></p><p>&nbsp; &nbsp;&nbsp;<img src=\\\"https://image.dayouqiantu.cn/5ca03007150f1.jpg\\\" style=\\\"max-width: 100%;\\\"><br></p>\",\"merUse\":0,\"isPostage\":1,\"image_base\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"isBest\":1,\"sales\":18,\"price\":120.00,\"isBargain\":0,\"userLike\":false,\"vipPrice\":0.20,\"storeName\":\"70gA4黑白打印复印\",\"id\":19,\"keyword\":\"打印复印\",\"stock\":99,\"image\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"cost\":0.20,\"isGood\":1,\"unitName\":\"张\",\"isBenefit\":1,\"giveIntegral\":1.00,\"isNew\":1,\"sort\":1,\"sliderImageArr\":[\"https://image.dayouqiantu.cn/5ca01c7fc9238.jpg\",\"https://image.dayouqiantu.cn/5ca01c7676042.jpg\"],\"sliderImage\":\"https://image.dayouqiantu.cn/5ca01c7fc9238.jpg,https://image.dayouqiantu.cn/5ca01c7676042.jpg\",\"barCode\":\"\",\"isShow\":1,\"postage\":0.00,\"codePath\":\"\",\"soureLink\":\"\",\"cateId\":\"24\",\"isSeckill\":0,\"storeInfo\":\"打印复印资料A4黑白彩色印刷画册书本装订图文数码快印服务\",\"isDel\":0,\"isHot\":1,\"attrInfo\":{\"image\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"cost\":100.00,\"productId\":19,\"price\":120.00,\"unique\":\"00e86525a7af4dcf9e653ae0a2062369\",\"suk\":\"A1,白色\",\"id\":22,\"stock\":993}},\"uid\":14,\"productAttrUnique\":\"00e86525a7af4dcf9e653ae0a2062369\",\"bargainId\":0,\"id\":80}', '918f2044600a43efac65bc49a528af75');
INSERT INTO `yx_store_order_cart_info` VALUES (85, 87, 81, 19, '{\"addTime\":1574040943,\"productId\":19,\"seckillId\":0,\"vipTruePrice\":120.0,\"combinationId\":0,\"costPrice\":100.0,\"trueStock\":993,\"truePrice\":120.0,\"type\":\"product\",\"cartNum\":1,\"productInfo\":{\"otPrice\":0.50,\"userCollect\":false,\"description\":\"<p style=\\\"text-align: center;\\\"><strong>文件请传QQ2412733099，</strong></p><p style=\\\"text-align: center;\\\"><strong>718504558或2412733099@qq.com邮箱，</strong></p><p style=\\\"text-align: center;\\\"><strong>手机/微信：13733990583</strong></p><p style=\\\"text-align: center;\\\"><strong>量大请联系店主，一定让您满意而归</strong></p><p style=\\\"text-align: center;\\\"><strong>&nbsp; &nbsp;实体店面经营 保质保量</strong></p><p style=\\\"text-align: center;\\\"><strong>A4黑白2毛/张，量大1毛/张，</strong></p><p style=\\\"text-align: center;\\\"><strong>A3黑白双面5毛/张，量大3毛/张，</strong></p><p style=\\\"text-align: center;\\\"><strong>更大量请联系店主报价，</strong></p><p style=\\\"text-align: center;\\\"><strong>每消费1元可积1分，1分抵现金1毛，</strong></p><p style=\\\"text-align: center;\\\"><strong>付款时直接抵扣</strong></p><p style=\\\"text-align: center;\\\"><strong>（如此优惠的基础上还可积分，积分抵现金）</strong></p><p style=\\\"text-align: left;\\\"><strong><br></strong></p><p><br></p><p>&nbsp; &nbsp;&nbsp;<img src=\\\"https://image.dayouqiantu.cn/5ca03007150f1.jpg\\\" style=\\\"max-width: 100%;\\\"><br></p>\",\"merUse\":0,\"isPostage\":1,\"image_base\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"isBest\":1,\"sales\":18,\"price\":120.00,\"isBargain\":0,\"userLike\":false,\"vipPrice\":0.20,\"storeName\":\"70gA4黑白打印复印\",\"id\":19,\"keyword\":\"打印复印\",\"stock\":99,\"image\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"cost\":0.20,\"isGood\":1,\"unitName\":\"张\",\"isBenefit\":1,\"giveIntegral\":1.00,\"isNew\":1,\"sort\":1,\"sliderImageArr\":[\"https://image.dayouqiantu.cn/5ca01c7fc9238.jpg\",\"https://image.dayouqiantu.cn/5ca01c7676042.jpg\"],\"sliderImage\":\"https://image.dayouqiantu.cn/5ca01c7fc9238.jpg,https://image.dayouqiantu.cn/5ca01c7676042.jpg\",\"barCode\":\"\",\"isShow\":1,\"postage\":0.00,\"codePath\":\"\",\"soureLink\":\"\",\"cateId\":\"24\",\"isSeckill\":0,\"storeInfo\":\"打印复印资料A4黑白彩色印刷画册书本装订图文数码快印服务\",\"isDel\":0,\"isHot\":1,\"attrInfo\":{\"image\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"cost\":100.00,\"productId\":19,\"price\":120.00,\"unique\":\"00e86525a7af4dcf9e653ae0a2062369\",\"suk\":\"A1,白色\",\"id\":22,\"stock\":993}},\"uid\":14,\"productAttrUnique\":\"00e86525a7af4dcf9e653ae0a2062369\",\"bargainId\":0,\"id\":81}', '150254729b63429b8273a02d6cfc6b5b');
INSERT INTO `yx_store_order_cart_info` VALUES (86, 88, 82, 19, '{\"addTime\":1574043311,\"productId\":19,\"seckillId\":0,\"vipTruePrice\":120.0,\"combinationId\":0,\"costPrice\":100.0,\"trueStock\":993,\"truePrice\":120.0,\"type\":\"product\",\"cartNum\":1,\"productInfo\":{\"otPrice\":0.50,\"userCollect\":false,\"description\":\"<p style=\\\"text-align: center;\\\"><strong>文件请传QQ2412733099，</strong></p><p style=\\\"text-align: center;\\\"><strong>718504558或2412733099@qq.com邮箱，</strong></p><p style=\\\"text-align: center;\\\"><strong>手机/微信：13733990583</strong></p><p style=\\\"text-align: center;\\\"><strong>量大请联系店主，一定让您满意而归</strong></p><p style=\\\"text-align: center;\\\"><strong>&nbsp; &nbsp;实体店面经营 保质保量</strong></p><p style=\\\"text-align: center;\\\"><strong>A4黑白2毛/张，量大1毛/张，</strong></p><p style=\\\"text-align: center;\\\"><strong>A3黑白双面5毛/张，量大3毛/张，</strong></p><p style=\\\"text-align: center;\\\"><strong>更大量请联系店主报价，</strong></p><p style=\\\"text-align: center;\\\"><strong>每消费1元可积1分，1分抵现金1毛，</strong></p><p style=\\\"text-align: center;\\\"><strong>付款时直接抵扣</strong></p><p style=\\\"text-align: center;\\\"><strong>（如此优惠的基础上还可积分，积分抵现金）</strong></p><p style=\\\"text-align: left;\\\"><strong><br></strong></p><p><br></p><p>&nbsp; &nbsp;&nbsp;<img src=\\\"https://image.dayouqiantu.cn/5ca03007150f1.jpg\\\" style=\\\"max-width: 100%;\\\"><br></p>\",\"merUse\":0,\"isPostage\":1,\"image_base\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"isBest\":1,\"sales\":18,\"price\":120.00,\"isBargain\":0,\"userLike\":false,\"vipPrice\":0.20,\"storeName\":\"70gA4黑白打印复印\",\"id\":19,\"keyword\":\"打印复印\",\"stock\":99,\"image\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"cost\":0.20,\"isGood\":1,\"unitName\":\"张\",\"isBenefit\":1,\"giveIntegral\":1.00,\"isNew\":1,\"sort\":1,\"sliderImageArr\":[\"https://image.dayouqiantu.cn/5ca01c7fc9238.jpg\",\"https://image.dayouqiantu.cn/5ca01c7676042.jpg\"],\"sliderImage\":\"https://image.dayouqiantu.cn/5ca01c7fc9238.jpg,https://image.dayouqiantu.cn/5ca01c7676042.jpg\",\"barCode\":\"\",\"isShow\":1,\"postage\":0.00,\"codePath\":\"\",\"soureLink\":\"\",\"cateId\":\"24\",\"isSeckill\":0,\"storeInfo\":\"打印复印资料A4黑白彩色印刷画册书本装订图文数码快印服务\",\"isDel\":0,\"isHot\":1,\"attrInfo\":{\"image\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"cost\":100.00,\"productId\":19,\"price\":120.00,\"unique\":\"00e86525a7af4dcf9e653ae0a2062369\",\"suk\":\"A1,白色\",\"id\":22,\"stock\":993}},\"uid\":14,\"productAttrUnique\":\"00e86525a7af4dcf9e653ae0a2062369\",\"bargainId\":0,\"id\":82}', '451e4661a80f4de5b123a50cae269a3c');
INSERT INTO `yx_store_order_cart_info` VALUES (87, 89, 83, 19, '{\"addTime\":1574216552,\"productId\":19,\"seckillId\":0,\"vipTruePrice\":0.0,\"combinationId\":2,\"costPrice\":0.2,\"trueStock\":99,\"truePrice\":120.0,\"type\":\"product\",\"cartNum\":1,\"productInfo\":{\"otPrice\":0.50,\"userCollect\":false,\"description\":\"<p style=\\\"text-align: center;\\\"><strong>文件请传QQ2412733099，</strong></p><p style=\\\"text-align: center;\\\"><strong>718504558或2412733099@qq.com邮箱，</strong></p><p style=\\\"text-align: center;\\\"><strong>手机/微信：13733990583</strong></p><p style=\\\"text-align: center;\\\"><strong>量大请联系店主，一定让您满意而归</strong></p><p style=\\\"text-align: center;\\\"><strong>&nbsp; &nbsp;实体店面经营 保质保量</strong></p><p style=\\\"text-align: center;\\\"><strong>A4黑白2毛/张，量大1毛/张，</strong></p><p style=\\\"text-align: center;\\\"><strong>A3黑白双面5毛/张，量大3毛/张，</strong></p><p style=\\\"text-align: center;\\\"><strong>更大量请联系店主报价，</strong></p><p style=\\\"text-align: center;\\\"><strong>每消费1元可积1分，1分抵现金1毛，</strong></p><p style=\\\"text-align: center;\\\"><strong>付款时直接抵扣</strong></p><p style=\\\"text-align: center;\\\"><strong>（如此优惠的基础上还可积分，积分抵现金）</strong></p><p style=\\\"text-align: left;\\\"><strong><br></strong></p><p><br></p><p>&nbsp; &nbsp;&nbsp;<img src=\\\"https://image.dayouqiantu.cn/5ca03007150f1.jpg\\\" style=\\\"max-width: 100%;\\\"><br></p>\",\"merUse\":0,\"isPostage\":1,\"image_base\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"isBest\":1,\"sales\":18,\"price\":120.00,\"isBargain\":0,\"userLike\":false,\"vipPrice\":0.20,\"storeName\":\"70gA4黑白打印复印\",\"id\":19,\"keyword\":\"打印复印\",\"stock\":99,\"image\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"cost\":0.20,\"isGood\":1,\"unitName\":\"张\",\"isBenefit\":1,\"giveIntegral\":1.00,\"isNew\":1,\"sort\":1,\"sliderImageArr\":[\"https://image.dayouqiantu.cn/5ca01c7fc9238.jpg\",\"https://image.dayouqiantu.cn/5ca01c7676042.jpg\"],\"sliderImage\":\"https://image.dayouqiantu.cn/5ca01c7fc9238.jpg,https://image.dayouqiantu.cn/5ca01c7676042.jpg\",\"barCode\":\"\",\"isShow\":1,\"postage\":0.00,\"codePath\":\"\",\"soureLink\":\"\",\"cateId\":\"24\",\"isSeckill\":0,\"storeInfo\":\"打印复印资料A4黑白彩色印刷画册书本装订图文数码快印服务\",\"isDel\":0,\"isHot\":1},\"uid\":12,\"productAttrUnique\":\"\",\"bargainId\":0,\"id\":83}', 'baf91a0e8b16413fbf81d90df38711d3');
INSERT INTO `yx_store_order_cart_info` VALUES (88, 90, 84, 19, '{\"addTime\":1574243149,\"productId\":19,\"seckillId\":0,\"vipTruePrice\":0.0,\"combinationId\":2,\"costPrice\":0.2,\"trueStock\":99,\"truePrice\":120.0,\"type\":\"product\",\"cartNum\":1,\"productInfo\":{\"otPrice\":0.50,\"userCollect\":false,\"description\":\"<p style=\\\"text-align: center;\\\"><strong>文件请传QQ2412733099，</strong></p><p style=\\\"text-align: center;\\\"><strong>718504558或2412733099@qq.com邮箱，</strong></p><p style=\\\"text-align: center;\\\"><strong>手机/微信：13733990583</strong></p><p style=\\\"text-align: center;\\\"><strong>量大请联系店主，一定让您满意而归</strong></p><p style=\\\"text-align: center;\\\"><strong>&nbsp; &nbsp;实体店面经营 保质保量</strong></p><p style=\\\"text-align: center;\\\"><strong>A4黑白2毛/张，量大1毛/张，</strong></p><p style=\\\"text-align: center;\\\"><strong>A3黑白双面5毛/张，量大3毛/张，</strong></p><p style=\\\"text-align: center;\\\"><strong>更大量请联系店主报价，</strong></p><p style=\\\"text-align: center;\\\"><strong>每消费1元可积1分，1分抵现金1毛，</strong></p><p style=\\\"text-align: center;\\\"><strong>付款时直接抵扣</strong></p><p style=\\\"text-align: center;\\\"><strong>（如此优惠的基础上还可积分，积分抵现金）</strong></p><p style=\\\"text-align: left;\\\"><strong><br></strong></p><p><br></p><p>&nbsp; &nbsp;&nbsp;<img src=\\\"https://image.dayouqiantu.cn/5ca03007150f1.jpg\\\" style=\\\"max-width: 100%;\\\"><br></p>\",\"merUse\":0,\"isPostage\":1,\"image_base\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"isBest\":1,\"sales\":18,\"price\":120.00,\"isBargain\":0,\"userLike\":false,\"vipPrice\":0.20,\"storeName\":\"70gA4黑白打印复印\",\"id\":19,\"keyword\":\"打印复印\",\"stock\":99,\"image\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"cost\":0.20,\"isGood\":1,\"unitName\":\"张\",\"isBenefit\":1,\"giveIntegral\":1.00,\"isNew\":1,\"sort\":1,\"sliderImageArr\":[\"https://image.dayouqiantu.cn/5ca01c7fc9238.jpg\",\"https://image.dayouqiantu.cn/5ca01c7676042.jpg\"],\"sliderImage\":\"https://image.dayouqiantu.cn/5ca01c7fc9238.jpg,https://image.dayouqiantu.cn/5ca01c7676042.jpg\",\"barCode\":\"\",\"isShow\":1,\"postage\":0.00,\"codePath\":\"\",\"soureLink\":\"\",\"cateId\":\"24\",\"isSeckill\":0,\"storeInfo\":\"打印复印资料A4黑白彩色印刷画册书本装订图文数码快印服务\",\"isDel\":0,\"isHot\":1},\"uid\":12,\"productAttrUnique\":\"\",\"bargainId\":0,\"id\":84}', '290daae35e7b428a8361648da10bc5aa');
INSERT INTO `yx_store_order_cart_info` VALUES (89, 91, 85, 19, '{\"addTime\":1574244169,\"productId\":19,\"seckillId\":0,\"vipTruePrice\":0.0,\"combinationId\":2,\"costPrice\":0.2,\"trueStock\":99,\"truePrice\":120.0,\"type\":\"product\",\"cartNum\":1,\"productInfo\":{\"otPrice\":0.50,\"userCollect\":false,\"description\":\"<p style=\\\"text-align: center;\\\"><strong>文件请传QQ2412733099，</strong></p><p style=\\\"text-align: center;\\\"><strong>718504558或2412733099@qq.com邮箱，</strong></p><p style=\\\"text-align: center;\\\"><strong>手机/微信：13733990583</strong></p><p style=\\\"text-align: center;\\\"><strong>量大请联系店主，一定让您满意而归</strong></p><p style=\\\"text-align: center;\\\"><strong>&nbsp; &nbsp;实体店面经营 保质保量</strong></p><p style=\\\"text-align: center;\\\"><strong>A4黑白2毛/张，量大1毛/张，</strong></p><p style=\\\"text-align: center;\\\"><strong>A3黑白双面5毛/张，量大3毛/张，</strong></p><p style=\\\"text-align: center;\\\"><strong>更大量请联系店主报价，</strong></p><p style=\\\"text-align: center;\\\"><strong>每消费1元可积1分，1分抵现金1毛，</strong></p><p style=\\\"text-align: center;\\\"><strong>付款时直接抵扣</strong></p><p style=\\\"text-align: center;\\\"><strong>（如此优惠的基础上还可积分，积分抵现金）</strong></p><p style=\\\"text-align: left;\\\"><strong><br></strong></p><p><br></p><p>&nbsp; &nbsp;&nbsp;<img src=\\\"https://image.dayouqiantu.cn/5ca03007150f1.jpg\\\" style=\\\"max-width: 100%;\\\"><br></p>\",\"merUse\":0,\"isPostage\":1,\"image_base\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"isBest\":1,\"sales\":18,\"price\":120.00,\"isBargain\":0,\"userLike\":false,\"vipPrice\":0.20,\"storeName\":\"70gA4黑白打印复印\",\"id\":19,\"keyword\":\"打印复印\",\"stock\":99,\"image\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"cost\":0.20,\"isGood\":1,\"unitName\":\"张\",\"isBenefit\":1,\"giveIntegral\":1.00,\"isNew\":1,\"sort\":1,\"sliderImageArr\":[\"https://image.dayouqiantu.cn/5ca01c7fc9238.jpg\",\"https://image.dayouqiantu.cn/5ca01c7676042.jpg\"],\"sliderImage\":\"https://image.dayouqiantu.cn/5ca01c7fc9238.jpg,https://image.dayouqiantu.cn/5ca01c7676042.jpg\",\"barCode\":\"\",\"isShow\":1,\"postage\":0.00,\"codePath\":\"\",\"soureLink\":\"\",\"cateId\":\"24\",\"isSeckill\":0,\"storeInfo\":\"打印复印资料A4黑白彩色印刷画册书本装订图文数码快印服务\",\"isDel\":0,\"isHot\":1},\"uid\":12,\"productAttrUnique\":\"\",\"bargainId\":0,\"id\":85}', '8c7b019a2e5e48cba12389c84e143dcc');
INSERT INTO `yx_store_order_cart_info` VALUES (90, 92, 86, 19, '{\"addTime\":1574320376,\"productId\":19,\"seckillId\":0,\"vipTruePrice\":0.0,\"combinationId\":2,\"costPrice\":0.0,\"trueStock\":96,\"truePrice\":1.0,\"type\":\"product\",\"cartNum\":1,\"productInfo\":{\"userCollect\":false,\"isPostage\":1,\"image_base\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"sales\":21,\"price\":1.00,\"userLike\":false,\"storeName\":\"70gA4黑白打印复印\",\"id\":2,\"stock\":96,\"image\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"cost\":0,\"sliderImageArr\":[],\"isShow\":1,\"postage\":0.00,\"isDel\":0},\"uid\":12,\"productAttrUnique\":\"\",\"bargainId\":0,\"id\":86}', '15bd4c8455204bfe8329d9520c40b7b1');
INSERT INTO `yx_store_order_cart_info` VALUES (91, 93, 87, 19, '{\"addTime\":1574329392,\"productId\":19,\"seckillId\":0,\"vipTruePrice\":0.0,\"combinationId\":2,\"costPrice\":0.0,\"trueStock\":95,\"truePrice\":1.0,\"type\":\"product\",\"cartNum\":1,\"productInfo\":{\"userCollect\":false,\"isPostage\":1,\"image_base\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"sales\":22,\"price\":1.00,\"userLike\":false,\"storeName\":\"70gA4黑白打印复印\",\"id\":2,\"stock\":95,\"image\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"cost\":0,\"sliderImageArr\":[],\"isShow\":1,\"postage\":0.00,\"isDel\":0},\"uid\":11,\"productAttrUnique\":\"\",\"bargainId\":0,\"id\":87}', '7233bf11cc3a460d83ce80a3e82d35be');
INSERT INTO `yx_store_order_cart_info` VALUES (92, 96, 88, 19, '{\"addTime\":1574424869,\"productId\":19,\"seckillId\":0,\"vipTruePrice\":0.0,\"combinationId\":2,\"costPrice\":0.0,\"trueStock\":94,\"truePrice\":1.0,\"type\":\"product\",\"cartNum\":1,\"productInfo\":{\"userCollect\":false,\"isPostage\":1,\"image_base\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"sales\":23,\"price\":1.00,\"userLike\":false,\"storeName\":\"70gA4黑白打印复印\",\"id\":2,\"stock\":94,\"image\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"cost\":0,\"sliderImageArr\":[],\"isShow\":1,\"postage\":0.00,\"isDel\":0},\"uid\":12,\"productAttrUnique\":\"\",\"bargainId\":0,\"id\":88}', 'af8ca64055ac4c739cfded03c2c0b784');
INSERT INTO `yx_store_order_cart_info` VALUES (93, 97, 89, 19, '{\"addTime\":1575095144,\"productId\":19,\"seckillId\":0,\"vipTruePrice\":120.0,\"combinationId\":0,\"costPrice\":100.0,\"trueStock\":993,\"truePrice\":120.0,\"type\":\"product\",\"cartNum\":1,\"productInfo\":{\"otPrice\":0.50,\"userCollect\":false,\"description\":\"<p style=\\\"text-align: center;\\\"><strong>文件请传QQ2412733099，</strong></p><p style=\\\"text-align: center;\\\"><strong>718504558或2412733099@qq.com邮箱，</strong></p><p style=\\\"text-align: center;\\\"><strong>手机/微信：13733990583</strong></p><p style=\\\"text-align: center;\\\"><strong>量大请联系店主，一定让您满意而归</strong></p><p style=\\\"text-align: center;\\\"><strong>&nbsp; &nbsp;实体店面经营 保质保量</strong></p><p style=\\\"text-align: center;\\\"><strong>A4黑白2毛/张，量大1毛/张，</strong></p><p style=\\\"text-align: center;\\\"><strong>A3黑白双面5毛/张，量大3毛/张，</strong></p><p style=\\\"text-align: center;\\\"><strong>更大量请联系店主报价，</strong></p><p style=\\\"text-align: center;\\\"><strong>每消费1元可积1分，1分抵现金1毛，</strong></p><p style=\\\"text-align: center;\\\"><strong>付款时直接抵扣</strong></p><p style=\\\"text-align: center;\\\"><strong>（如此优惠的基础上还可积分，积分抵现金）</strong></p><p style=\\\"text-align: left;\\\"><strong><br></strong></p><p><br></p><p>&nbsp; &nbsp;&nbsp;<img src=\\\"https://image.dayouqiantu.cn/5ca03007150f1.jpg\\\" style=\\\"max-width: 100%;\\\"><br></p>\",\"merUse\":0,\"isPostage\":1,\"image_base\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"isBest\":1,\"sales\":18,\"price\":120.00,\"isBargain\":0,\"userLike\":false,\"vipPrice\":0.20,\"storeName\":\"70gA4黑白打印复印\",\"id\":19,\"keyword\":\"打印复印\",\"stock\":99,\"image\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"cost\":0.20,\"isGood\":1,\"unitName\":\"张\",\"isBenefit\":1,\"giveIntegral\":1.00,\"isNew\":1,\"sort\":1,\"sliderImageArr\":[\"https://image.dayouqiantu.cn/5ca01c7fc9238.jpg\",\"https://image.dayouqiantu.cn/5ca01c7676042.jpg\"],\"sliderImage\":\"https://image.dayouqiantu.cn/5ca01c7fc9238.jpg,https://image.dayouqiantu.cn/5ca01c7676042.jpg\",\"barCode\":\"\",\"isShow\":1,\"postage\":0.00,\"codePath\":\"\",\"soureLink\":\"\",\"cateId\":\"24\",\"isSeckill\":0,\"storeInfo\":\"打印复印资料A4黑白彩色印刷画册书本装订图文数码快印服务\",\"isDel\":0,\"isHot\":1,\"attrInfo\":{\"image\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"cost\":100.00,\"productId\":19,\"price\":120.00,\"unique\":\"00e86525a7af4dcf9e653ae0a2062369\",\"suk\":\"A1,白色\",\"id\":22,\"stock\":993}},\"uid\":12,\"productAttrUnique\":\"00e86525a7af4dcf9e653ae0a2062369\",\"bargainId\":0,\"id\":89}', '247853fbd42241269dc6812edc71fba1');
INSERT INTO `yx_store_order_cart_info` VALUES (94, 98, 90, 19, '{\"addTime\":1575095354,\"productId\":19,\"seckillId\":0,\"vipTruePrice\":120.0,\"combinationId\":0,\"costPrice\":100.0,\"trueStock\":993,\"truePrice\":120.0,\"type\":\"product\",\"cartNum\":1,\"productInfo\":{\"otPrice\":0.50,\"userCollect\":false,\"description\":\"<p style=\\\"text-align: center;\\\"><strong>文件请传QQ2412733099，</strong></p><p style=\\\"text-align: center;\\\"><strong>718504558或2412733099@qq.com邮箱，</strong></p><p style=\\\"text-align: center;\\\"><strong>手机/微信：13733990583</strong></p><p style=\\\"text-align: center;\\\"><strong>量大请联系店主，一定让您满意而归</strong></p><p style=\\\"text-align: center;\\\"><strong>&nbsp; &nbsp;实体店面经营 保质保量</strong></p><p style=\\\"text-align: center;\\\"><strong>A4黑白2毛/张，量大1毛/张，</strong></p><p style=\\\"text-align: center;\\\"><strong>A3黑白双面5毛/张，量大3毛/张，</strong></p><p style=\\\"text-align: center;\\\"><strong>更大量请联系店主报价，</strong></p><p style=\\\"text-align: center;\\\"><strong>每消费1元可积1分，1分抵现金1毛，</strong></p><p style=\\\"text-align: center;\\\"><strong>付款时直接抵扣</strong></p><p style=\\\"text-align: center;\\\"><strong>（如此优惠的基础上还可积分，积分抵现金）</strong></p><p style=\\\"text-align: left;\\\"><strong><br></strong></p><p><br></p><p>&nbsp; &nbsp;&nbsp;<img src=\\\"https://image.dayouqiantu.cn/5ca03007150f1.jpg\\\" style=\\\"max-width: 100%;\\\"><br></p>\",\"merUse\":0,\"isPostage\":1,\"image_base\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"isBest\":1,\"sales\":17,\"price\":120.00,\"isBargain\":0,\"userLike\":false,\"vipPrice\":0.20,\"storeName\":\"70gA4黑白打印复印\",\"id\":19,\"keyword\":\"打印复印\",\"stock\":99,\"image\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"cost\":0.20,\"isGood\":1,\"unitName\":\"张\",\"isBenefit\":1,\"giveIntegral\":1.00,\"isNew\":1,\"sort\":1,\"sliderImageArr\":[\"https://image.dayouqiantu.cn/5ca01c7fc9238.jpg\",\"https://image.dayouqiantu.cn/5ca01c7676042.jpg\"],\"sliderImage\":\"https://image.dayouqiantu.cn/5ca01c7fc9238.jpg,https://image.dayouqiantu.cn/5ca01c7676042.jpg\",\"barCode\":\"\",\"isShow\":1,\"postage\":0.00,\"codePath\":\"\",\"soureLink\":\"\",\"cateId\":\"24\",\"isSeckill\":0,\"storeInfo\":\"打印复印资料A4黑白彩色印刷画册书本装订图文数码快印服务\",\"isDel\":0,\"isHot\":1,\"attrInfo\":{\"image\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"cost\":100.00,\"productId\":19,\"price\":120.00,\"unique\":\"00e86525a7af4dcf9e653ae0a2062369\",\"suk\":\"A1,白色\",\"id\":22,\"stock\":993}},\"uid\":12,\"productAttrUnique\":\"00e86525a7af4dcf9e653ae0a2062369\",\"bargainId\":0,\"id\":90}', 'e76d7e013f46469492b62998752ad052');
INSERT INTO `yx_store_order_cart_info` VALUES (95, 99, 95, 19, '{\"addTime\":1575771477,\"productId\":19,\"seckillId\":0,\"vipTruePrice\":120.0,\"combinationId\":0,\"costPrice\":100.0,\"trueStock\":993,\"truePrice\":118.8,\"type\":\"product\",\"cartNum\":1,\"productInfo\":{\"otPrice\":0.50,\"userCollect\":false,\"description\":\"<p style=\\\"text-align: center;\\\"><strong>文件请传QQ2412733099，</strong></p><p style=\\\"text-align: center;\\\"><strong>718504558或2412733099@qq.com邮箱，</strong></p><p style=\\\"text-align: center;\\\"><strong>手机/微信：13733990583</strong></p><p style=\\\"text-align: center;\\\"><strong>量大请联系店主，一定让您满意而归</strong></p><p style=\\\"text-align: center;\\\"><strong>&nbsp; &nbsp;实体店面经营 保质保量</strong></p><p style=\\\"text-align: center;\\\"><strong>A4黑白2毛/张，量大1毛/张，</strong></p><p style=\\\"text-align: center;\\\"><strong>A3黑白双面5毛/张，量大3毛/张，</strong></p><p style=\\\"text-align: center;\\\"><strong>更大量请联系店主报价，</strong></p><p style=\\\"text-align: center;\\\"><strong>每消费1元可积1分，1分抵现金1毛，</strong></p><p style=\\\"text-align: center;\\\"><strong>付款时直接抵扣</strong></p><p style=\\\"text-align: center;\\\"><strong>（如此优惠的基础上还可积分，积分抵现金）</strong></p><p style=\\\"text-align: left;\\\"><strong><br></strong></p><p><br></p><p>&nbsp; &nbsp;&nbsp;<img src=\\\"https://image.dayouqiantu.cn/5ca03007150f1.jpg\\\" style=\\\"max-width: 100%;\\\"><br></p>\",\"merUse\":0,\"isPostage\":1,\"image_base\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"isBest\":1,\"sales\":17,\"price\":120.00,\"isBargain\":0,\"userLike\":false,\"vipPrice\":0.20,\"storeName\":\"70gA4黑白打印复印\",\"id\":19,\"keyword\":\"打印复印\",\"stock\":99,\"image\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"cost\":0.20,\"isGood\":1,\"unitName\":\"张\",\"isBenefit\":1,\"giveIntegral\":1.00,\"isNew\":1,\"sort\":1,\"sliderImageArr\":[\"https://image.dayouqiantu.cn/5ca01c7fc9238.jpg\",\"https://image.dayouqiantu.cn/5ca01c7676042.jpg\"],\"sliderImage\":\"https://image.dayouqiantu.cn/5ca01c7fc9238.jpg,https://image.dayouqiantu.cn/5ca01c7676042.jpg\",\"barCode\":\"\",\"isShow\":1,\"postage\":0.00,\"codePath\":\"\",\"soureLink\":\"\",\"cateId\":\"24\",\"isSeckill\":0,\"storeInfo\":\"打印复印资料A4黑白彩色印刷画册书本装订图文数码快印服务\",\"isDel\":0,\"isHot\":1,\"attrInfo\":{\"image\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"cost\":100.00,\"productId\":19,\"price\":120.00,\"unique\":\"00e86525a7af4dcf9e653ae0a2062369\",\"suk\":\"A1,白色\",\"id\":22,\"stock\":993}},\"uid\":12,\"productAttrUnique\":\"00e86525a7af4dcf9e653ae0a2062369\",\"bargainId\":0,\"id\":95}', '16e9212266b949cdac21e7e45881a84f');
INSERT INTO `yx_store_order_cart_info` VALUES (96, 100, 96, 19, '{\"addTime\":1576234305,\"productId\":19,\"seckillId\":0,\"vipTruePrice\":120.0,\"combinationId\":0,\"costPrice\":100.0,\"trueStock\":992,\"truePrice\":118.8,\"type\":\"product\",\"cartNum\":1,\"productInfo\":{\"otPrice\":0.50,\"userCollect\":false,\"description\":\"<p style=\\\"text-align: center;\\\"><strong>文件请传QQ2412733099，</strong></p><p style=\\\"text-align: center;\\\"><strong>718504558或2412733099@qq.com邮箱，</strong></p><p style=\\\"text-align: center;\\\"><strong>手机/微信：13733990583</strong></p><p style=\\\"text-align: center;\\\"><strong>量大请联系店主，一定让您满意而归</strong></p><p style=\\\"text-align: center;\\\"><strong>&nbsp; &nbsp;实体店面经营 保质保量</strong></p><p style=\\\"text-align: center;\\\"><strong>A4黑白2毛/张，量大1毛/张，</strong></p><p style=\\\"text-align: center;\\\"><strong>A3黑白双面5毛/张，量大3毛/张，</strong></p><p style=\\\"text-align: center;\\\"><strong>更大量请联系店主报价，</strong></p><p style=\\\"text-align: center;\\\"><strong>每消费1元可积1分，1分抵现金1毛，</strong></p><p style=\\\"text-align: center;\\\"><strong>付款时直接抵扣</strong></p><p style=\\\"text-align: center;\\\"><strong>（如此优惠的基础上还可积分，积分抵现金）</strong></p><p style=\\\"text-align: left;\\\"><strong><br></strong></p><p><br></p><p>&nbsp; &nbsp;&nbsp;<img src=\\\"https://image.dayouqiantu.cn/5ca03007150f1.jpg\\\" style=\\\"max-width: 100%;\\\"><br></p>\",\"merUse\":0,\"isPostage\":1,\"image_base\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"isBest\":1,\"sales\":18,\"price\":120.00,\"isBargain\":0,\"userLike\":false,\"vipPrice\":0.20,\"storeName\":\"70gA4黑白打印复印\",\"id\":19,\"keyword\":\"打印复印\",\"stock\":99,\"image\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"cost\":0.20,\"isGood\":1,\"unitName\":\"张\",\"isBenefit\":1,\"giveIntegral\":1.00,\"isNew\":1,\"sort\":1,\"sliderImageArr\":[\"https://image.dayouqiantu.cn/5ca01c7fc9238.jpg\",\"https://image.dayouqiantu.cn/5ca01c7676042.jpg\"],\"sliderImage\":\"https://image.dayouqiantu.cn/5ca01c7fc9238.jpg,https://image.dayouqiantu.cn/5ca01c7676042.jpg\",\"barCode\":\"\",\"isShow\":1,\"postage\":0.00,\"codePath\":\"\",\"soureLink\":\"\",\"cateId\":\"24\",\"isSeckill\":0,\"storeInfo\":\"打印复印资料A4黑白彩色印刷画册书本装订图文数码快印服务\",\"isDel\":0,\"isHot\":1,\"attrInfo\":{\"image\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"cost\":100.00,\"productId\":19,\"price\":120.00,\"unique\":\"00e86525a7af4dcf9e653ae0a2062369\",\"suk\":\"A1,白色\",\"id\":22,\"stock\":992}},\"uid\":12,\"productAttrUnique\":\"00e86525a7af4dcf9e653ae0a2062369\",\"bargainId\":0,\"id\":96}', 'd186a2b7f7f146389c33223f3ce180cf');
INSERT INTO `yx_store_order_cart_info` VALUES (97, 101, 99, 20, '{\"addTime\":1576561530,\"productId\":20,\"seckillId\":2,\"vipTruePrice\":0.0,\"combinationId\":0,\"costPrice\":0.5,\"trueStock\":100,\"truePrice\":1.0,\"type\":\"product\",\"cartNum\":1,\"productInfo\":{\"userCollect\":false,\"isPostage\":1,\"image_base\":\"https://image.dayouqiantu.cn/5ca04fa9c08ef.jpg\",\"sales\":1,\"price\":1.00,\"userLike\":false,\"storeName\":\"70gA4彩色打印复印\",\"id\":2,\"stock\":100,\"image\":\"https://image.dayouqiantu.cn/5ca04fa9c08ef.jpg\",\"cost\":0.50,\"sliderImageArr\":[],\"isShow\":1,\"postage\":0.00,\"isDel\":0},\"uid\":12,\"productAttrUnique\":\"\",\"bargainId\":0,\"id\":99}', 'e132b2634fc64a8eb5fe4022ca04dcb7');
INSERT INTO `yx_store_order_cart_info` VALUES (98, 102, 103, 19, '{\"addTime\":1577085055,\"productId\":19,\"seckillId\":0,\"vipTruePrice\":0.0,\"combinationId\":0,\"costPrice\":50.0,\"trueStock\":100,\"truePrice\":1.0,\"type\":\"product\",\"cartNum\":1,\"productInfo\":{\"otPrice\":30.00,\"userCollect\":false,\"isPostage\":1,\"image_base\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"sales\":10,\"price\":1.00,\"userLike\":false,\"storeName\":\"砍价标题\",\"id\":1,\"stock\":100,\"image\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"cost\":50.00,\"sliderImageArr\":[],\"isShow\":1,\"postage\":0.00,\"isDel\":0},\"uid\":12,\"productAttrUnique\":\"\",\"bargainId\":1,\"id\":103}', '7b3edd5545764840bb7aa0eba8374286');
INSERT INTO `yx_store_order_cart_info` VALUES (99, 103, 97, 19, '{\"addTime\":1576290026,\"productId\":19,\"seckillId\":0,\"vipTruePrice\":120.0,\"combinationId\":0,\"costPrice\":100.0,\"trueStock\":991,\"truePrice\":118.8,\"type\":\"product\",\"cartNum\":1,\"productInfo\":{\"otPrice\":0.50,\"userCollect\":false,\"description\":\"<p style=\\\"text-align: center;\\\"><strong>文件请传QQ2412733099，</strong></p><p style=\\\"text-align: center;\\\"><strong>718504558或2412733099@qq.com邮箱，</strong></p><p style=\\\"text-align: center;\\\"><strong>手机/微信：13733990583</strong></p><p style=\\\"text-align: center;\\\"><strong>量大请联系店主，一定让您满意而归</strong></p><p style=\\\"text-align: center;\\\"><strong>&nbsp; &nbsp;实体店面经营 保质保量</strong></p><p style=\\\"text-align: center;\\\"><strong>A4黑白2毛/张，量大1毛/张，</strong></p><p style=\\\"text-align: center;\\\"><strong>A3黑白双面5毛/张，量大3毛/张，</strong></p><p style=\\\"text-align: center;\\\"><strong>更大量请联系店主报价，</strong></p><p style=\\\"text-align: center;\\\"><strong>每消费1元可积1分，1分抵现金1毛，</strong></p><p style=\\\"text-align: center;\\\"><strong>付款时直接抵扣</strong></p><p style=\\\"text-align: center;\\\"><strong>（如此优惠的基础上还可积分，积分抵现金）</strong></p><p style=\\\"text-align: left;\\\"><strong><br></strong></p><p><br></p><p>&nbsp; &nbsp;&nbsp;<img src=\\\"https://image.dayouqiantu.cn/5ca03007150f1.jpg\\\" style=\\\"max-width: 100%;\\\"><br></p>\",\"merUse\":0,\"isPostage\":1,\"image_base\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"isBest\":1,\"sales\":19,\"price\":120.00,\"isBargain\":0,\"userLike\":false,\"vipPrice\":0.20,\"storeName\":\"70gA4黑白打印复印\",\"id\":19,\"keyword\":\"打印复印\",\"stock\":99,\"image\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"cost\":0.20,\"isGood\":1,\"unitName\":\"张\",\"isBenefit\":1,\"giveIntegral\":1.00,\"isNew\":1,\"sort\":1,\"sliderImageArr\":[\"https://image.dayouqiantu.cn/5ca01c7fc9238.jpg\",\"https://image.dayouqiantu.cn/5ca01c7676042.jpg\"],\"sliderImage\":\"https://image.dayouqiantu.cn/5ca01c7fc9238.jpg,https://image.dayouqiantu.cn/5ca01c7676042.jpg\",\"barCode\":\"\",\"isShow\":1,\"postage\":0.00,\"codePath\":\"\",\"soureLink\":\"\",\"cateId\":\"24\",\"isSeckill\":0,\"storeInfo\":\"打印复印资料A4黑白彩色印刷画册书本装订图文数码快印服务\",\"isDel\":0,\"isHot\":1,\"attrInfo\":{\"image\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"cost\":100.00,\"productId\":19,\"price\":120.00,\"unique\":\"00e86525a7af4dcf9e653ae0a2062369\",\"suk\":\"A1,白色\",\"id\":22,\"stock\":991}},\"uid\":12,\"productAttrUnique\":\"00e86525a7af4dcf9e653ae0a2062369\",\"bargainId\":0,\"id\":97}', '1b650c0c743d42edb5f02dc545ea381d');
INSERT INTO `yx_store_order_cart_info` VALUES (100, 104, 104, 20, '{\"addTime\":1577442127,\"productId\":20,\"seckillId\":0,\"vipTruePrice\":0.5,\"combinationId\":0,\"costPrice\":0.5,\"trueStock\":999,\"truePrice\":0.495,\"type\":\"product\",\"cartNum\":1,\"productInfo\":{\"addTime\":1573108370,\"otPrice\":1.00,\"userCollect\":false,\"description\":\"<p style=\\\"text-align: center;\\\">7<strong>文件请传QQ2412733099，</strong></p><p style=\\\"text-align: center;\\\"><strong>718504558或2412733099@qq.com邮箱，</strong></p><p style=\\\"text-align: center;\\\"><strong>手机/微信：13733990583</strong></p><p style=\\\"text-align: center;\\\"><strong>量大请联系店主，一定让您满意而归</strong></p><p style=\\\"text-align: center;\\\"><strong>&nbsp; &nbsp;实体店面经营 保质保量</strong></p><p style=\\\"text-align: center;\\\"><strong>A4黑白2毛/张，量大1毛/张，</strong></p><p style=\\\"text-align: center;\\\"><strong>A3黑白双面5毛/张，量大3毛/张，</strong></p><p style=\\\"text-align: center;\\\"><strong>更大量请联系店主报价，</strong></p><p style=\\\"text-align: center;\\\"><strong>每消费1元可积1分，1分抵现金1毛，</strong></p><p style=\\\"text-align: center;\\\"><strong>付款时直接抵扣</strong></p><p style=\\\"text-align: center;\\\"><strong>（如此优惠的基础上还可积分，积分抵现金）</strong></p><p style=\\\"text-align: center;\\\"><img src=\\\"https://image.dayouqiantu.cn/5ca03007150f1.jpg\\\" style=\\\"max-width:100%;\\\"><strong><br></strong></p><p style=\\\"text-align: center;\\\"><br></p>\",\"merUse\":0,\"isPostage\":1,\"image_base\":\"https://image.dayouqiantu.cn/5ca04fa9c08ef.jpg\",\"isBest\":1,\"sales\":1,\"price\":0.50,\"isBargain\":0,\"userLike\":false,\"vipPrice\":0.50,\"storeName\":\"70gA4彩色打印复印\",\"id\":20,\"keyword\":\"彩色打印复印\",\"stock\":100,\"image\":\"https://image.dayouqiantu.cn/5ca04fa9c08ef.jpg\",\"cost\":0.50,\"isGood\":1,\"unitName\":\"张\",\"isBenefit\":1,\"giveIntegral\":0.00,\"isNew\":1,\"sort\":0,\"sliderImageArr\":[\"https://image.dayouqiantu.cn/5ca05103ad634.jpg\",\"https://image.dayouqiantu.cn/5ca04fa9c08ef.jpg\"],\"sliderImage\":\"https://image.dayouqiantu.cn/5ca05103ad634.jpg,https://image.dayouqiantu.cn/5ca04fa9c08ef.jpg\",\"barCode\":\"\",\"isShow\":1,\"postage\":0.00,\"codePath\":\"\",\"soureLink\":\"\",\"cateId\":\"24\",\"isSeckill\":0,\"merId\":0,\"ficti\":0,\"storeInfo\":\"70gA4彩色打印复印\",\"isDel\":0,\"isHot\":1,\"attrInfo\":{\"image\":\"https://image.dayouqiantu.cn/5ca04fa9c08ef.jpg\",\"cost\":0.50,\"productId\":20,\"price\":0.50,\"unique\":\"ba5d202555c44d378e6644ca1296ee01\",\"suk\":\"A3,白色\",\"id\":10,\"stock\":999},\"browse\":0},\"uid\":12,\"productAttrUnique\":\"ba5d202555c44d378e6644ca1296ee01\",\"bargainId\":0,\"id\":104}', 'f2bccd6cf98f4afb9a7e6465f6ca224c');
INSERT INTO `yx_store_order_cart_info` VALUES (101, 105, 105, 19, '{\"addTime\":1577611673,\"productId\":19,\"seckillId\":0,\"vipTruePrice\":120.0,\"combinationId\":0,\"costPrice\":100.0,\"trueStock\":990,\"truePrice\":118.8,\"type\":\"product\",\"cartNum\":1,\"productInfo\":{\"otPrice\":0.50,\"userCollect\":false,\"description\":\"<p style=\\\"text-align: center;\\\"><strong>文件请传QQ2412733099，</strong></p><p style=\\\"text-align: center;\\\"><strong>718504558或2412733099@qq.com邮箱，</strong></p><p style=\\\"text-align: center;\\\"><strong>手机/微信：13733990583</strong></p><p style=\\\"text-align: center;\\\"><strong>量大请联系店主，一定让您满意而归</strong></p><p style=\\\"text-align: center;\\\"><strong>&nbsp; &nbsp;实体店面经营 保质保量</strong></p><p style=\\\"text-align: center;\\\"><strong>A4黑白2毛/张，量大1毛/张，</strong></p><p style=\\\"text-align: center;\\\"><strong>A3黑白双面5毛/张，量大3毛/张，</strong></p><p style=\\\"text-align: center;\\\"><strong>更大量请联系店主报价，</strong></p><p style=\\\"text-align: center;\\\"><strong>每消费1元可积1分，1分抵现金1毛，</strong></p><p style=\\\"text-align: center;\\\"><strong>付款时直接抵扣</strong></p><p style=\\\"text-align: center;\\\"><strong>（如此优惠的基础上还可积分，积分抵现金）</strong></p><p style=\\\"text-align: left;\\\"><strong><br></strong></p><p><br></p><p>&nbsp; &nbsp;&nbsp;<img src=\\\"https://image.dayouqiantu.cn/5ca03007150f1.jpg\\\" style=\\\"max-width: 100%;\\\"><br></p>\",\"merUse\":0,\"isPostage\":1,\"image_base\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"isBest\":1,\"sales\":20,\"price\":120.00,\"isBargain\":0,\"userLike\":false,\"vipPrice\":0.20,\"storeName\":\"70gA4黑白打印复印\",\"id\":19,\"keyword\":\"打印复印\",\"stock\":99,\"image\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"cost\":0.20,\"isGood\":1,\"unitName\":\"张\",\"isBenefit\":1,\"giveIntegral\":1.00,\"isNew\":1,\"sort\":1,\"sliderImageArr\":[\"https://image.dayouqiantu.cn/5ca01c7fc9238.jpg\",\"https://image.dayouqiantu.cn/5ca01c7676042.jpg\"],\"sliderImage\":\"https://image.dayouqiantu.cn/5ca01c7fc9238.jpg,https://image.dayouqiantu.cn/5ca01c7676042.jpg\",\"barCode\":\"\",\"isShow\":1,\"postage\":0.00,\"codePath\":\"\",\"soureLink\":\"\",\"cateId\":\"24\",\"isSeckill\":0,\"storeInfo\":\"打印复印资料A4黑白彩色印刷画册书本装订图文数码快印服务\",\"isDel\":0,\"isHot\":1,\"attrInfo\":{\"image\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"cost\":100.00,\"productId\":19,\"price\":120.00,\"unique\":\"00e86525a7af4dcf9e653ae0a2062369\",\"suk\":\"A1,白色\",\"id\":22,\"stock\":990}},\"uid\":12,\"productAttrUnique\":\"00e86525a7af4dcf9e653ae0a2062369\",\"bargainId\":0,\"id\":105}', 'c9735ac229bf41c6b07d43e7f84cc3f5');
INSERT INTO `yx_store_order_cart_info` VALUES (102, 106, 106, 19, '{\"addTime\":1577678968,\"productId\":19,\"seckillId\":0,\"vipTruePrice\":120.0,\"combinationId\":0,\"costPrice\":100.0,\"trueStock\":989,\"truePrice\":118.8,\"type\":\"product\",\"cartNum\":1,\"productInfo\":{\"otPrice\":0.50,\"userCollect\":false,\"description\":\"<p style=\\\"text-align: center;\\\"><strong>文件请传QQ2412733099，</strong></p><p style=\\\"text-align: center;\\\"><strong>718504558或2412733099@qq.com邮箱，</strong></p><p style=\\\"text-align: center;\\\"><strong>手机/微信：13733990583</strong></p><p style=\\\"text-align: center;\\\"><strong>量大请联系店主，一定让您满意而归</strong></p><p style=\\\"text-align: center;\\\"><strong>&nbsp; &nbsp;实体店面经营 保质保量</strong></p><p style=\\\"text-align: center;\\\"><strong>A4黑白2毛/张，量大1毛/张，</strong></p><p style=\\\"text-align: center;\\\"><strong>A3黑白双面5毛/张，量大3毛/张，</strong></p><p style=\\\"text-align: center;\\\"><strong>更大量请联系店主报价，</strong></p><p style=\\\"text-align: center;\\\"><strong>每消费1元可积1分，1分抵现金1毛，</strong></p><p style=\\\"text-align: center;\\\"><strong>付款时直接抵扣</strong></p><p style=\\\"text-align: center;\\\"><strong>（如此优惠的基础上还可积分，积分抵现金）</strong></p><p style=\\\"text-align: left;\\\"><strong><br></strong></p><p><br></p><p>&nbsp; &nbsp;&nbsp;<img src=\\\"https://image.dayouqiantu.cn/5ca03007150f1.jpg\\\" style=\\\"max-width: 100%;\\\"><br></p>\",\"merUse\":0,\"isPostage\":1,\"image_base\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"isBest\":1,\"sales\":21,\"price\":120.00,\"isBargain\":0,\"userLike\":false,\"vipPrice\":0.20,\"storeName\":\"70gA4黑白打印复印\",\"id\":19,\"keyword\":\"打印复印\",\"stock\":99,\"image\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"cost\":0.20,\"isGood\":1,\"unitName\":\"张\",\"isBenefit\":1,\"giveIntegral\":1.00,\"isNew\":1,\"sort\":1,\"sliderImageArr\":[\"https://image.dayouqiantu.cn/5ca01c7fc9238.jpg\",\"https://image.dayouqiantu.cn/5ca01c7676042.jpg\"],\"sliderImage\":\"https://image.dayouqiantu.cn/5ca01c7fc9238.jpg,https://image.dayouqiantu.cn/5ca01c7676042.jpg\",\"barCode\":\"\",\"isShow\":1,\"postage\":0.00,\"codePath\":\"\",\"soureLink\":\"\",\"cateId\":\"24\",\"isSeckill\":0,\"storeInfo\":\"打印复印资料A4黑白彩色印刷画册书本装订图文数码快印服务\",\"isDel\":0,\"isHot\":1,\"attrInfo\":{\"image\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"cost\":100.00,\"productId\":19,\"price\":120.00,\"unique\":\"00e86525a7af4dcf9e653ae0a2062369\",\"suk\":\"A1,白色\",\"id\":22,\"stock\":989}},\"uid\":12,\"productAttrUnique\":\"00e86525a7af4dcf9e653ae0a2062369\",\"bargainId\":0,\"id\":106}', '6c4d0a6e129641968c09bab2f3ed54b5');
INSERT INTO `yx_store_order_cart_info` VALUES (103, 107, 107, 19, '{\"addTime\":1577890650,\"productId\":19,\"seckillId\":0,\"vipTruePrice\":120.0,\"combinationId\":0,\"costPrice\":100.0,\"trueStock\":988,\"truePrice\":118.8,\"type\":\"product\",\"cartNum\":1,\"productInfo\":{\"otPrice\":0.50,\"userCollect\":false,\"description\":\"<p style=\\\"text-align: center;\\\"><strong>文件请传QQ2412733099，</strong></p><p style=\\\"text-align: center;\\\"><strong>718504558或2412733099@qq.com邮箱，</strong></p><p style=\\\"text-align: center;\\\"><strong>手机/微信：13733990583</strong></p><p style=\\\"text-align: center;\\\"><strong>量大请联系店主，一定让您满意而归</strong></p><p style=\\\"text-align: center;\\\"><strong>&nbsp; &nbsp;实体店面经营 保质保量</strong></p><p style=\\\"text-align: center;\\\"><strong>A4黑白2毛/张，量大1毛/张，</strong></p><p style=\\\"text-align: center;\\\"><strong>A3黑白双面5毛/张，量大3毛/张，</strong></p><p style=\\\"text-align: center;\\\"><strong>更大量请联系店主报价，</strong></p><p style=\\\"text-align: center;\\\"><strong>每消费1元可积1分，1分抵现金1毛，</strong></p><p style=\\\"text-align: center;\\\"><strong>付款时直接抵扣</strong></p><p style=\\\"text-align: center;\\\"><strong>（如此优惠的基础上还可积分，积分抵现金）</strong></p><p style=\\\"text-align: left;\\\"><strong><br></strong></p><p><br></p><p>&nbsp; &nbsp;&nbsp;<img src=\\\"https://image.dayouqiantu.cn/5ca03007150f1.jpg\\\" style=\\\"max-width: 100%;\\\"><br></p>\",\"merUse\":0,\"isPostage\":1,\"image_base\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"isBest\":1,\"sales\":22,\"price\":120.00,\"isBargain\":0,\"userLike\":false,\"vipPrice\":0.20,\"storeName\":\"70gA4黑白打印复印\",\"id\":19,\"keyword\":\"打印复印\",\"stock\":99,\"image\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"cost\":0.20,\"isGood\":1,\"unitName\":\"张\",\"isBenefit\":1,\"giveIntegral\":1.00,\"isNew\":1,\"sort\":1,\"sliderImageArr\":[\"https://image.dayouqiantu.cn/5ca01c7fc9238.jpg\",\"https://image.dayouqiantu.cn/5ca01c7676042.jpg\"],\"sliderImage\":\"https://image.dayouqiantu.cn/5ca01c7fc9238.jpg,https://image.dayouqiantu.cn/5ca01c7676042.jpg\",\"barCode\":\"\",\"isShow\":1,\"postage\":0.00,\"codePath\":\"\",\"soureLink\":\"\",\"cateId\":\"24\",\"isSeckill\":0,\"storeInfo\":\"打印复印资料A4黑白彩色印刷画册书本装订图文数码快印服务\",\"isDel\":0,\"isHot\":1,\"attrInfo\":{\"image\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"cost\":100.00,\"productId\":19,\"price\":120.00,\"unique\":\"00e86525a7af4dcf9e653ae0a2062369\",\"suk\":\"A1,白色\",\"id\":22,\"stock\":988}},\"uid\":12,\"productAttrUnique\":\"00e86525a7af4dcf9e653ae0a2062369\",\"bargainId\":0,\"id\":107}', 'b83df15cc9954742b72c3dc86b1f265c');

-- ----------------------------
-- Table structure for yx_store_order_status
-- ----------------------------
DROP TABLE IF EXISTS `yx_store_order_status`;
CREATE TABLE `yx_store_order_status`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `oid` int(10) UNSIGNED NOT NULL COMMENT '订单id',
  `change_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作类型',
  `change_message` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作备注',
  `change_time` int(10) UNSIGNED NOT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `oid`(`oid`) USING BTREE,
  INDEX `change_type`(`change_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 166 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单操作记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of yx_store_order_status
-- ----------------------------
INSERT INTO `yx_store_order_status` VALUES (31, 24, 'cache_key_create_order', '订单生成', 1573110358);
INSERT INTO `yx_store_order_status` VALUES (32, 24, 'pay_success', '用户付款成功', 1573110365);
INSERT INTO `yx_store_order_status` VALUES (33, 24, 'delivery_goods', '已发货 快递公司：顺丰快递 快递单号：9999999', 1573110448);
INSERT INTO `yx_store_order_status` VALUES (34, 24, 'user_take_delivery', '用户已收货', 1573110461);
INSERT INTO `yx_store_order_status` VALUES (35, 24, 'check_order_over', '用户评价', 1573110475);
INSERT INTO `yx_store_order_status` VALUES (36, 25, 'cache_key_create_order', '订单生成', 1573118898);
INSERT INTO `yx_store_order_status` VALUES (37, 26, 'cache_key_create_order', '订单生成', 1573119034);
INSERT INTO `yx_store_order_status` VALUES (38, 26, 'pay_success', '用户付款成功', 1573119034);
INSERT INTO `yx_store_order_status` VALUES (39, 27, 'cache_key_create_order', '订单生成', 1573119055);
INSERT INTO `yx_store_order_status` VALUES (40, 28, 'cache_key_create_order', '订单生成', 1573119081);
INSERT INTO `yx_store_order_status` VALUES (41, 29, 'cache_key_create_order', '订单生成', 1573119177);
INSERT INTO `yx_store_order_status` VALUES (42, 30, 'cache_key_create_order', '订单生成', 1573119442);
INSERT INTO `yx_store_order_status` VALUES (43, 31, 'cache_key_create_order', '订单生成', 1573120633);
INSERT INTO `yx_store_order_status` VALUES (44, 31, 'pay_success', '用户付款成功', 1573120639);
INSERT INTO `yx_store_order_status` VALUES (45, 32, 'cache_key_create_order', '订单生成', 1573123599);
INSERT INTO `yx_store_order_status` VALUES (46, 33, 'cache_key_create_order', '订单生成', 1573123808);
INSERT INTO `yx_store_order_status` VALUES (47, 34, 'cache_key_create_order', '订单生成', 1573123875);
INSERT INTO `yx_store_order_status` VALUES (48, 34, 'pay_success', '用户付款成功', 1573124900);
INSERT INTO `yx_store_order_status` VALUES (49, 33, 'pay_success', '用户付款成功', 1573124914);
INSERT INTO `yx_store_order_status` VALUES (50, 35, 'cache_key_create_order', '订单生成', 1573380051);
INSERT INTO `yx_store_order_status` VALUES (51, 35, 'pay_success', '用户付款成功', 1573380051);
INSERT INTO `yx_store_order_status` VALUES (52, 36, 'cache_key_create_order', '订单生成', 1573381947);
INSERT INTO `yx_store_order_status` VALUES (53, 36, 'pay_success', '用户付款成功', 1573381947);
INSERT INTO `yx_store_order_status` VALUES (54, 37, 'cache_key_create_order', '订单生成', 1573612822);
INSERT INTO `yx_store_order_status` VALUES (55, 37, 'pay_success', '用户付款成功', 1573612822);
INSERT INTO `yx_store_order_status` VALUES (56, 37, 'delivery_goods', '已发货 快递公司：顺丰快递 快递单号：1111111', 1573613127);
INSERT INTO `yx_store_order_status` VALUES (57, 37, 'user_take_delivery', '用户已收货', 1573613426);
INSERT INTO `yx_store_order_status` VALUES (58, 38, 'cache_key_create_order', '订单生成', 1573887265);
INSERT INTO `yx_store_order_status` VALUES (59, 39, 'cache_key_create_order', '订单生成', 1573888321);
INSERT INTO `yx_store_order_status` VALUES (62, 42, 'cache_key_create_order', '订单生成', 1573979565);
INSERT INTO `yx_store_order_status` VALUES (63, 42, 'pay_success', '用户付款成功', 1573979565);
INSERT INTO `yx_store_order_status` VALUES (64, 43, 'cache_key_create_order', '订单生成', 1573979627);
INSERT INTO `yx_store_order_status` VALUES (65, 44, 'cache_key_create_order', '订单生成', 1573980050);
INSERT INTO `yx_store_order_status` VALUES (66, 45, 'cache_key_create_order', '订单生成', 1573980992);
INSERT INTO `yx_store_order_status` VALUES (67, 46, 'cache_key_create_order', '订单生成', 1573981520);
INSERT INTO `yx_store_order_status` VALUES (68, 47, 'cache_key_create_order', '订单生成', 1573981633);
INSERT INTO `yx_store_order_status` VALUES (69, 48, 'cache_key_create_order', '订单生成', 1573982919);
INSERT INTO `yx_store_order_status` VALUES (70, 49, 'cache_key_create_order', '订单生成', 1573983138);
INSERT INTO `yx_store_order_status` VALUES (71, 50, 'cache_key_create_order', '订单生成', 1573984487);
INSERT INTO `yx_store_order_status` VALUES (72, 51, 'cache_key_create_order', '订单生成', 1573984582);
INSERT INTO `yx_store_order_status` VALUES (73, 52, 'cache_key_create_order', '订单生成', 1573984673);
INSERT INTO `yx_store_order_status` VALUES (74, 53, 'cache_key_create_order', '订单生成', 1573985145);
INSERT INTO `yx_store_order_status` VALUES (75, 54, 'cache_key_create_order', '订单生成', 1573985250);
INSERT INTO `yx_store_order_status` VALUES (76, 55, 'cache_key_create_order', '订单生成', 1573985390);
INSERT INTO `yx_store_order_status` VALUES (77, 56, 'cache_key_create_order', '订单生成', 1573985955);
INSERT INTO `yx_store_order_status` VALUES (78, 57, 'cache_key_create_order', '订单生成', 1573987268);
INSERT INTO `yx_store_order_status` VALUES (79, 58, 'cache_key_create_order', '订单生成', 1573988022);
INSERT INTO `yx_store_order_status` VALUES (80, 59, 'cache_key_create_order', '订单生成', 1573988072);
INSERT INTO `yx_store_order_status` VALUES (81, 60, 'cache_key_create_order', '订单生成', 1573989589);
INSERT INTO `yx_store_order_status` VALUES (82, 61, 'cache_key_create_order', '订单生成', 1573991796);
INSERT INTO `yx_store_order_status` VALUES (83, 61, 'pay_success', '用户付款成功', 1573991796);
INSERT INTO `yx_store_order_status` VALUES (84, 62, 'cache_key_create_order', '订单生成', 1573991866);
INSERT INTO `yx_store_order_status` VALUES (85, 63, 'cache_key_create_order', '订单生成', 1573992169);
INSERT INTO `yx_store_order_status` VALUES (86, 64, 'cache_key_create_order', '订单生成', 1573992689);
INSERT INTO `yx_store_order_status` VALUES (88, 66, 'cache_key_create_order', '订单生成', 1573996087);
INSERT INTO `yx_store_order_status` VALUES (89, 67, 'cache_key_create_order', '订单生成', 1573996203);
INSERT INTO `yx_store_order_status` VALUES (90, 67, 'pay_success', '用户付款成功', 1573996204);
INSERT INTO `yx_store_order_status` VALUES (91, 68, 'cache_key_create_order', '订单生成', 1573996428);
INSERT INTO `yx_store_order_status` VALUES (92, 68, 'pay_success', '用户付款成功', 1573996429);
INSERT INTO `yx_store_order_status` VALUES (99, 75, 'cache_key_create_order', '订单生成', 1573999075);
INSERT INTO `yx_store_order_status` VALUES (100, 76, 'cache_key_create_order', '订单生成', 1573999223);
INSERT INTO `yx_store_order_status` VALUES (101, 77, 'cache_key_create_order', '订单生成', 1573999377);
INSERT INTO `yx_store_order_status` VALUES (102, 78, 'cache_key_create_order', '订单生成', 1573999546);
INSERT INTO `yx_store_order_status` VALUES (103, 79, 'cache_key_create_order', '订单生成', 1573999678);
INSERT INTO `yx_store_order_status` VALUES (104, 80, 'cache_key_create_order', '订单生成', 1574000136);
INSERT INTO `yx_store_order_status` VALUES (105, 81, 'cache_key_create_order', '订单生成', 1574000411);
INSERT INTO `yx_store_order_status` VALUES (106, 82, 'cache_key_create_order', '订单生成', 1574001048);
INSERT INTO `yx_store_order_status` VALUES (107, 83, 'cache_key_create_order', '订单生成', 1574001200);
INSERT INTO `yx_store_order_status` VALUES (108, 84, 'cache_key_create_order', '订单生成', 1574001303);
INSERT INTO `yx_store_order_status` VALUES (109, 85, 'cache_key_create_order', '订单生成', 1574039507);
INSERT INTO `yx_store_order_status` VALUES (110, 86, 'cache_key_create_order', '订单生成', 1574040168);
INSERT INTO `yx_store_order_status` VALUES (111, 87, 'cache_key_create_order', '订单生成', 1574040945);
INSERT INTO `yx_store_order_status` VALUES (112, 88, 'cache_key_create_order', '订单生成', 1574043328);
INSERT INTO `yx_store_order_status` VALUES (113, 68, 'delivery_goods', '已发货 快递公司：顺丰快递 快递单号：99999999', 1574047591);
INSERT INTO `yx_store_order_status` VALUES (114, 68, 'user_take_delivery', '用户已收货', 1574048275);
INSERT INTO `yx_store_order_status` VALUES (115, 89, 'cache_key_create_order', '订单生成', 1574221758);
INSERT INTO `yx_store_order_status` VALUES (116, 89, 'pay_success', '用户付款成功', 1574221758);
INSERT INTO `yx_store_order_status` VALUES (117, 90, 'cache_key_create_order', '订单生成', 1574243178);
INSERT INTO `yx_store_order_status` VALUES (118, 90, 'pay_success', '用户付款成功', 1574243179);
INSERT INTO `yx_store_order_status` VALUES (119, 91, 'cache_key_create_order', '订单生成', 1574244175);
INSERT INTO `yx_store_order_status` VALUES (120, 91, 'pay_success', '用户付款成功', 1574244175);
INSERT INTO `yx_store_order_status` VALUES (121, 91, 'apply_refund', '用户申请退款，原因：拼团取消开团', 1574326954);
INSERT INTO `yx_store_order_status` VALUES (122, 92, 'cache_key_create_order', '订单生成', 1574327309);
INSERT INTO `yx_store_order_status` VALUES (123, 92, 'pay_success', '用户付款成功', 1574327310);
INSERT INTO `yx_store_order_status` VALUES (124, 93, 'cache_key_create_order', '订单生成', 1574329404);
INSERT INTO `yx_store_order_status` VALUES (125, 93, 'pay_success', '用户付款成功', 1574329404);
INSERT INTO `yx_store_order_status` VALUES (126, 96, 'cache_key_create_order', '订单生成', 1574425447);
INSERT INTO `yx_store_order_status` VALUES (127, 96, 'pay_success', '用户付款成功', 1574425447);
INSERT INTO `yx_store_order_status` VALUES (128, 32, 'order_edit', '修改实际支付金额', 1574740506);
INSERT INTO `yx_store_order_status` VALUES (129, 32, 'order_edit', '修改实际支付金额', 1574740704);
INSERT INTO `yx_store_order_status` VALUES (130, 32, 'order_edit', '修改实际支付金额', 1574741913);
INSERT INTO `yx_store_order_status` VALUES (131, 96, 'delivery_goods', '已发货 快递公司：顺丰快递快递单号：99999', 1574752175);
INSERT INTO `yx_store_order_status` VALUES (132, 93, 'delivery_goods', '已发货 快递公司：顺丰快递快递单号：9669999', 1574752215);
INSERT INTO `yx_store_order_status` VALUES (133, 91, 'order_edit', '退款给用户：120.0元', 1574757130);
INSERT INTO `yx_store_order_status` VALUES (134, 91, 'order_edit', '退款给用户：120.0元', 1574757363);
INSERT INTO `yx_store_order_status` VALUES (135, 97, 'cache_key_create_order', '订单生成', 1575095149);
INSERT INTO `yx_store_order_status` VALUES (136, 98, 'cache_key_create_order', '订单生成', 1575095357);
INSERT INTO `yx_store_order_status` VALUES (137, 99, 'cache_key_create_order', '订单生成', 1575771514);
INSERT INTO `yx_store_order_status` VALUES (138, 99, 'pay_success', '用户付款成功', 1575771514);
INSERT INTO `yx_store_order_status` VALUES (139, 96, 'user_take_delivery', '用户已收货', 1575868078);
INSERT INTO `yx_store_order_status` VALUES (140, 92, 'delivery_goods', '已发货 快递公司：中通快递 快递单号：9999999', 1575880109);
INSERT INTO `yx_store_order_status` VALUES (141, 36, 'delivery_goods', '已发货 快递公司：申通快递 快递单号：null', 1576142259);
INSERT INTO `yx_store_order_status` VALUES (142, 67, 'delivery_goods', '已发货 快递公司：顺丰速运 快递单号：444444', 1576142488);
INSERT INTO `yx_store_order_status` VALUES (143, 61, 'delivery_goods', '已发货 快递公司：顺丰速运 快递单号：99999', 1576142551);
INSERT INTO `yx_store_order_status` VALUES (144, 42, 'delivery_goods', '已发货 快递公司：顺丰速运快递单号：999999', 1576229079);
INSERT INTO `yx_store_order_status` VALUES (145, 100, 'cache_key_create_order', '订单生成', 1576234308);
INSERT INTO `yx_store_order_status` VALUES (146, 100, 'pay_success', '用户付款成功', 1576234308);
INSERT INTO `yx_store_order_status` VALUES (147, 91, 'refund_price', '退款给用户：120元', 1576286856);
INSERT INTO `yx_store_order_status` VALUES (148, 101, 'cache_key_create_order', '订单生成', 1576565376);
INSERT INTO `yx_store_order_status` VALUES (149, 101, 'pay_success', '用户付款成功', 1576565376);
INSERT INTO `yx_store_order_status` VALUES (150, 102, 'cache_key_create_order', '订单生成', 1577086164);
INSERT INTO `yx_store_order_status` VALUES (151, 102, 'pay_success', '用户付款成功', 1577086165);
INSERT INTO `yx_store_order_status` VALUES (152, 103, 'cache_key_create_order', '订单生成', 1577345071);
INSERT INTO `yx_store_order_status` VALUES (153, 103, 'pay_success', '用户付款成功', 1577345071);
INSERT INTO `yx_store_order_status` VALUES (154, 104, 'cache_key_create_order', '订单生成', 1577442136);
INSERT INTO `yx_store_order_status` VALUES (155, 104, 'pay_success', '用户付款成功', 1577442136);
INSERT INTO `yx_store_order_status` VALUES (156, 104, 'apply_refund', '用户申请退款，原因：收货地址填错了', 1577586499);
INSERT INTO `yx_store_order_status` VALUES (157, 104, 'order_edit', '退款给用户：0.0元', 1577586525);
INSERT INTO `yx_store_order_status` VALUES (158, 103, 'apply_refund', '用户申请退款，原因：收货地址填错了', 1577586729);
INSERT INTO `yx_store_order_status` VALUES (159, 105, 'cache_key_create_order', '订单生成', 1577611680);
INSERT INTO `yx_store_order_status` VALUES (160, 105, 'pay_success', '用户付款成功', 1577611680);
INSERT INTO `yx_store_order_status` VALUES (161, 30, 'order_edit', '修改订单价格为：0', 1577769911);
INSERT INTO `yx_store_order_status` VALUES (162, 106, 'cache_key_create_order', '订单生成', 1577774706);
INSERT INTO `yx_store_order_status` VALUES (163, 106, 'pay_success', '用户付款成功', 1577774706);
INSERT INTO `yx_store_order_status` VALUES (164, 96, 'check_order_over', '用户评价', 1577779610);
INSERT INTO `yx_store_order_status` VALUES (165, 107, 'cache_key_create_order', '订单生成', 1577890654);

-- ----------------------------
-- Table structure for yx_store_pink
-- ----------------------------
DROP TABLE IF EXISTS `yx_store_pink`;
CREATE TABLE `yx_store_pink`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uid` int(10) UNSIGNED NOT NULL COMMENT '用户id',
  `order_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单id 生成',
  `order_id_key` int(10) UNSIGNED NOT NULL COMMENT '订单id  数据库',
  `total_num` int(10) UNSIGNED NOT NULL COMMENT '购买商品个数',
  `total_price` decimal(10, 2) UNSIGNED NOT NULL COMMENT '购买总金额',
  `cid` int(10) UNSIGNED NOT NULL COMMENT '拼团产品id',
  `pid` int(10) UNSIGNED NOT NULL COMMENT '产品id',
  `people` int(10) UNSIGNED NOT NULL COMMENT '拼图总人数',
  `price` decimal(10, 2) UNSIGNED NOT NULL COMMENT '拼团产品单价',
  `add_time` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '开始时间',
  `stop_time` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `k_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '团长id 0为团长',
  `is_tpl` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否发送模板消息0未发送1已发送',
  `is_refund` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否退款 0未退款 1已退款',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态1进行中2已完成3未完成',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '拼团表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of yx_store_pink
-- ----------------------------
INSERT INTO `yx_store_pink` VALUES (1, 12, '20191120180255448', 91, 1, 120.00, 2, 19, 2, 120.00, '1574244175', '1574326954', 0, 0, 0, 3);
INSERT INTO `yx_store_pink` VALUES (2, 12, '20191121170829222', 92, 1, 1.00, 2, 19, 2, 1.00, '1574327310', '1574330684', 0, 0, 0, 2);
INSERT INTO `yx_store_pink` VALUES (3, 11, '20191121174323679', 93, 1, 1.00, 2, 19, 2, 1.00, '1574329404', '1574330684', 2, 0, 0, 2);
INSERT INTO `yx_store_pink` VALUES (4, 12, '20191122202407197', 96, 1, 1.00, 2, 19, 2, 1.00, '1574425447', '1574511847', 0, 0, 0, 1);

-- ----------------------------
-- Table structure for yx_store_product
-- ----------------------------
DROP TABLE IF EXISTS `yx_store_product`;
CREATE TABLE `yx_store_product`  (
  `id` mediumint(11) NOT NULL AUTO_INCREMENT COMMENT '商品id',
  `mer_id` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '商户Id(0为总后台管理员创建,不为0的时候是商户后台创建)',
  `image` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品图片',
  `slider_image` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '轮播图',
  `store_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品名称',
  `store_info` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品简介',
  `keyword` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '关键字',
  `bar_code` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '产品条码（一维码）',
  `cate_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分类id',
  `price` decimal(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '商品价格',
  `vip_price` decimal(8, 2) UNSIGNED NULL DEFAULT 0.00 COMMENT '会员价格',
  `ot_price` decimal(8, 2) UNSIGNED NULL DEFAULT 0.00 COMMENT '市场价',
  `postage` decimal(8, 2) UNSIGNED NULL DEFAULT 0.00 COMMENT '邮费',
  `unit_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '单位名',
  `sort` smallint(11) NULL DEFAULT 0 COMMENT '排序',
  `sales` mediumint(11) UNSIGNED NULL DEFAULT 0 COMMENT '销量',
  `stock` mediumint(11) UNSIGNED NULL DEFAULT 0 COMMENT '库存',
  `is_show` tinyint(1) NULL DEFAULT 1 COMMENT '状态（0：未上架，1：上架）',
  `is_hot` tinyint(1) NULL DEFAULT 0 COMMENT '是否热卖',
  `is_benefit` tinyint(1) NULL DEFAULT 0 COMMENT '是否优惠',
  `is_best` tinyint(1) NULL DEFAULT 0 COMMENT '是否精品',
  `is_new` tinyint(1) NULL DEFAULT 0 COMMENT '是否新品',
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '产品描述',
  `add_time` int(11) UNSIGNED NULL DEFAULT 0 COMMENT '添加时间',
  `is_postage` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '是否包邮',
  `is_del` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '是否删除',
  `mer_use` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '商户是否代理 0不可代理1可代理',
  `give_integral` decimal(8, 2) UNSIGNED NULL DEFAULT NULL COMMENT '获得积分',
  `cost` decimal(8, 2) UNSIGNED NULL DEFAULT NULL COMMENT '成本价',
  `is_seckill` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '秒杀状态 0 未开启 1已开启',
  `is_bargain` tinyint(1) UNSIGNED NULL DEFAULT NULL COMMENT '砍价状态 0未开启 1开启',
  `is_good` tinyint(1) NULL DEFAULT 0 COMMENT '是否优品推荐',
  `ficti` mediumint(11) NULL DEFAULT 100 COMMENT '虚拟销量',
  `browse` int(11) NULL DEFAULT 0 COMMENT '浏览量',
  `code_path` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '产品二维码地址(用户小程序海报)',
  `soure_link` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '淘宝京东1688类型',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `is_hot`(`is_hot`) USING BTREE,
  INDEX `is_benefit`(`is_benefit`) USING BTREE,
  INDEX `is_best`(`is_best`) USING BTREE,
  INDEX `is_new`(`is_new`) USING BTREE,
  INDEX `toggle_on_sale, is_del`(`is_del`) USING BTREE,
  INDEX `price`(`price`) USING BTREE,
  INDEX `is_show`(`is_show`) USING BTREE,
  INDEX `sort`(`sort`) USING BTREE,
  INDEX `sales`(`sales`) USING BTREE,
  INDEX `add_time`(`add_time`) USING BTREE,
  INDEX `is_postage`(`is_postage`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of yx_store_product
-- ----------------------------
INSERT INTO `yx_store_product` VALUES (19, NULL, 'https://image.dayouqiantu.cn/5ca011a1cd487.jpg', 'https://image.dayouqiantu.cn/5ca01c7fc9238.jpg,https://image.dayouqiantu.cn/5ca01c7676042.jpg', '70gA4黑白打印复印', '打印复印资料A4黑白彩色印刷画册书本装订图文数码快印服务', '打印复印', '', '24', 120.00, 0.20, 0.50, 0.00, '张', 1, 22, 99, 1, 1, 1, 1, 1, '<p style=\"text-align: center;\"><strong>文件请传QQ2412733099，</strong></p><p style=\"text-align: center;\"><strong>718504558或2412733099@qq.com邮箱，</strong></p><p style=\"text-align: center;\"><strong>手机/微信：13733990583</strong></p><p style=\"text-align: center;\"><strong>量大请联系店主，一定让您满意而归</strong></p><p style=\"text-align: center;\"><strong>&nbsp; &nbsp;实体店面经营 保质保量</strong></p><p style=\"text-align: center;\"><strong>A4黑白2毛/张，量大1毛/张，</strong></p><p style=\"text-align: center;\"><strong>A3黑白双面5毛/张，量大3毛/张，</strong></p><p style=\"text-align: center;\"><strong>更大量请联系店主报价，</strong></p><p style=\"text-align: center;\"><strong>每消费1元可积1分，1分抵现金1毛，</strong></p><p style=\"text-align: center;\"><strong>付款时直接抵扣</strong></p><p style=\"text-align: center;\"><strong>（如此优惠的基础上还可积分，积分抵现金）</strong></p><p style=\"text-align: left;\"><strong><br></strong></p><p><br></p><p>&nbsp; &nbsp;&nbsp;<img src=\"https://image.dayouqiantu.cn/5ca03007150f1.jpg\" style=\"max-width: 100%;\"><br></p>', NULL, 1, 0, 0, 1.00, 0.20, 0, 0, 1, NULL, NULL, '', '');
INSERT INTO `yx_store_product` VALUES (20, 0, 'https://image.dayouqiantu.cn/5ca04fa9c08ef.jpg', 'https://image.dayouqiantu.cn/5ca05103ad634.jpg,https://image.dayouqiantu.cn/5ca04fa9c08ef.jpg', '70gA4彩色打印复印', '70gA4彩色打印复印', '彩色打印复印', '', '24', 0.50, 0.50, 1.00, 0.00, '张', 0, 2, 100, 1, 1, 1, 1, 1, '<p style=\"text-align: center;\">7<strong>文件请传QQ2412733099，</strong></p><p style=\"text-align: center;\"><strong>718504558或2412733099@qq.com邮箱，</strong></p><p style=\"text-align: center;\"><strong>手机/微信：13733990583</strong></p><p style=\"text-align: center;\"><strong>量大请联系店主，一定让您满意而归</strong></p><p style=\"text-align: center;\"><strong>&nbsp; &nbsp;实体店面经营 保质保量</strong></p><p style=\"text-align: center;\"><strong>A4黑白2毛/张，量大1毛/张，</strong></p><p style=\"text-align: center;\"><strong>A3黑白双面5毛/张，量大3毛/张，</strong></p><p style=\"text-align: center;\"><strong>更大量请联系店主报价，</strong></p><p style=\"text-align: center;\"><strong>每消费1元可积1分，1分抵现金1毛，</strong></p><p style=\"text-align: center;\"><strong>付款时直接抵扣</strong></p><p style=\"text-align: center;\"><strong>（如此优惠的基础上还可积分，积分抵现金）</strong></p><p style=\"text-align: center;\"><img src=\"https://image.dayouqiantu.cn/5ca03007150f1.jpg\" style=\"max-width:100%;\"><strong><br></strong></p><p style=\"text-align: center;\"><br></p>', 1573108370, 1, 0, 0, 0.00, 0.50, 0, 0, 1, 0, 0, '', '');

-- ----------------------------
-- Table structure for yx_store_product_attr
-- ----------------------------
DROP TABLE IF EXISTS `yx_store_product_attr`;
CREATE TABLE `yx_store_product_attr`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '商品ID',
  `attr_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '属性名',
  `attr_values` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '属性值',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `store_id`(`product_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品属性表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of yx_store_product_attr
-- ----------------------------
INSERT INTO `yx_store_product_attr` VALUES (6, 20, '纸张', 'A3,A4');
INSERT INTO `yx_store_product_attr` VALUES (7, 20, '颜色', '白色,红色');
INSERT INTO `yx_store_product_attr` VALUES (12, 19, '纸张', 'A1,A4');
INSERT INTO `yx_store_product_attr` VALUES (13, 19, '颜色', '白色,蓝色');

-- ----------------------------
-- Table structure for yx_store_product_attr_result
-- ----------------------------
DROP TABLE IF EXISTS `yx_store_product_attr_result`;
CREATE TABLE `yx_store_product_attr_result`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` int(10) UNSIGNED NOT NULL COMMENT '商品ID',
  `result` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品属性参数',
  `change_time` int(10) UNSIGNED NOT NULL COMMENT '上次修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `product_id`(`product_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品属性详情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of yx_store_product_attr_result
-- ----------------------------
INSERT INTO `yx_store_product_attr_result` VALUES (4, 20, '{\"attr\":[{\"attrHidden\":true,\"detailValue\":\"\",\"detail\":[\"A3\",\"A4\"],\"value\":\"纸张\"},{\"attrHidden\":true,\"detailValue\":\"\",\"detail\":[\"白色\",\"红色\"],\"value\":\"颜色\"}],\"value\":[{\"cost\":0.5,\"price\":0.5,\"pic\":\"https://image.dayouqiantu.cn/5ca04fa9c08ef.jpg\",\"detail\":{\"颜色\":\"白色\",\"纸张\":\"A3\"},\"check\":false,\"sales\":\"999\"},{\"cost\":0.5,\"price\":0.5,\"pic\":\"https://image.dayouqiantu.cn/5ca04fa9c08ef.jpg\",\"detail\":{\"颜色\":\"红色\",\"纸张\":\"A3\"},\"check\":false,\"sales\":\"999\"},{\"cost\":0.5,\"price\":\"0.2\",\"pic\":\"https://image.dayouqiantu.cn/5ca04fa9c08ef.jpg\",\"detail\":{\"颜色\":\"白色\",\"纸张\":\"A4\"},\"check\":false,\"sales\":\"999\"},{\"cost\":0.5,\"price\":\"0.2\",\"pic\":\"https://image.dayouqiantu.cn/5ca04fa9c08ef.jpg\",\"detail\":{\"颜色\":\"红色\",\"纸张\":\"A4\"},\"check\":false,\"sales\":\"999\"}]}', 1573108529);
INSERT INTO `yx_store_product_attr_result` VALUES (7, 19, '{\"attr\":[{\"attrHidden\":true,\"detailValue\":\"\",\"detail\":[\"A1\",\"A4\"],\"value\":\"纸张\"},{\"attrHidden\":true,\"detailValue\":\"\",\"detail\":[\"白色\",\"蓝色\"],\"value\":\"颜色\"}],\"value\":[{\"cost\":\"100\",\"price\":\"120\",\"pic\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"detail\":{\"颜色\":\"白色\",\"纸张\":\"A1\"},\"check\":false,\"sales\":\"999\"},{\"cost\":\"100\",\"price\":\"119\",\"pic\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"detail\":{\"颜色\":\"蓝色\",\"纸张\":\"A1\"},\"check\":false,\"sales\":\"9999\"},{\"cost\":\"100\",\"price\":\"150\",\"pic\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"detail\":{\"颜色\":\"白色\",\"纸张\":\"A4\"},\"check\":false,\"sales\":\"999\"},{\"cost\":\"100\",\"price\":\"170\",\"pic\":\"https://image.dayouqiantu.cn/5ca011a1cd487.jpg\",\"detail\":{\"颜色\":\"蓝色\",\"纸张\":\"A4\"},\"check\":false,\"sales\":\"9999\"}]}', 1573368795);

-- ----------------------------
-- Table structure for yx_store_product_attr_value
-- ----------------------------
DROP TABLE IF EXISTS `yx_store_product_attr_value`;
CREATE TABLE `yx_store_product_attr_value`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` int(10) UNSIGNED NOT NULL COMMENT '商品ID',
  `suk` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品属性索引值 (attr_value|attr_value[|....])',
  `stock` int(10) UNSIGNED NOT NULL COMMENT '属性对应的库存',
  `sales` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '销量',
  `price` decimal(8, 2) UNSIGNED NOT NULL COMMENT '属性金额',
  `image` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片',
  `unique` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '唯一值',
  `cost` decimal(8, 2) UNSIGNED NOT NULL COMMENT '成本价',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique`(`unique`, `suk`) USING BTREE,
  INDEX `store_id`(`product_id`, `suk`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品属性值表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of yx_store_product_attr_value
-- ----------------------------
INSERT INTO `yx_store_product_attr_value` VALUES (10, 20, 'A3,白色', 998, NULL, 0.50, 'https://image.dayouqiantu.cn/5ca04fa9c08ef.jpg', 'ba5d202555c44d378e6644ca1296ee01', 0.50);
INSERT INTO `yx_store_product_attr_value` VALUES (11, 20, 'A3,红色', 998, NULL, 0.50, 'https://image.dayouqiantu.cn/5ca04fa9c08ef.jpg', '75d1d355cdb44970beb3524911c7bae7', 0.50);
INSERT INTO `yx_store_product_attr_value` VALUES (12, 20, 'A4,白色', 999, NULL, 0.20, 'https://image.dayouqiantu.cn/5ca04fa9c08ef.jpg', '8e9aed0696654a6bafc2f68a7b4d9960', 0.50);
INSERT INTO `yx_store_product_attr_value` VALUES (13, 20, 'A4,红色', 999, NULL, 0.20, 'https://image.dayouqiantu.cn/5ca04fa9c08ef.jpg', 'de81216b2dc743d0b2b626a514e2f78c', 0.50);
INSERT INTO `yx_store_product_attr_value` VALUES (22, 19, 'A1,白色', 988, NULL, 120.00, 'https://image.dayouqiantu.cn/5ca011a1cd487.jpg', '00e86525a7af4dcf9e653ae0a2062369', 100.00);
INSERT INTO `yx_store_product_attr_value` VALUES (23, 19, 'A1,蓝色', 9999, NULL, 119.00, 'https://image.dayouqiantu.cn/5ca011a1cd487.jpg', '26b0cd2c869e445f850212f62ee2de26', 100.00);
INSERT INTO `yx_store_product_attr_value` VALUES (24, 19, 'A4,白色', 999, NULL, 150.00, 'https://image.dayouqiantu.cn/5ca011a1cd487.jpg', '6c2deabbdebd4f57a7c7b4c9e1c08bce', 100.00);
INSERT INTO `yx_store_product_attr_value` VALUES (25, 19, 'A4,蓝色', 9998, NULL, 170.00, 'https://image.dayouqiantu.cn/5ca011a1cd487.jpg', 'd8c72945fdbe4035a95a393aff1eea46', 100.00);

-- ----------------------------
-- Table structure for yx_store_product_cate
-- ----------------------------
DROP TABLE IF EXISTS `yx_store_product_cate`;
CREATE TABLE `yx_store_product_cate`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL DEFAULT 0 COMMENT '产品id',
  `cate_id` int(11) NOT NULL DEFAULT 0 COMMENT '分类id',
  `add_time` int(11) NOT NULL DEFAULT 0 COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 73 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '产品分类辅助表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of yx_store_product_cate
-- ----------------------------
INSERT INTO `yx_store_product_cate` VALUES (14, 6, 2, 1558580351);
INSERT INTO `yx_store_product_cate` VALUES (24, 4, 3, 1559110372);
INSERT INTO `yx_store_product_cate` VALUES (25, 4, 2, 1559110372);
INSERT INTO `yx_store_product_cate` VALUES (28, 3, 3, 1559110403);
INSERT INTO `yx_store_product_cate` VALUES (29, 3, 2, 1559110403);
INSERT INTO `yx_store_product_cate` VALUES (38, 12, 3, 1560650420);
INSERT INTO `yx_store_product_cate` VALUES (49, 5, 4, 1562729229);
INSERT INTO `yx_store_product_cate` VALUES (50, 5, 7, 1562729229);
INSERT INTO `yx_store_product_cate` VALUES (51, 5, 2, 1562729229);
INSERT INTO `yx_store_product_cate` VALUES (52, 5, 3, 1562729229);
INSERT INTO `yx_store_product_cate` VALUES (53, 5, 19, 1562729229);
INSERT INTO `yx_store_product_cate` VALUES (55, 11, 4, 1562729250);
INSERT INTO `yx_store_product_cate` VALUES (59, 10, 4, 1562741711);
INSERT INTO `yx_store_product_cate` VALUES (60, 1, 2, 1562835320);
INSERT INTO `yx_store_product_cate` VALUES (61, 1, 7, 1562835320);
INSERT INTO `yx_store_product_cate` VALUES (64, 17, 4, 1564471319);
INSERT INTO `yx_store_product_cate` VALUES (65, 2, 3, 1565148046);
INSERT INTO `yx_store_product_cate` VALUES (66, 2, 2, 1565148046);
INSERT INTO `yx_store_product_cate` VALUES (67, 18, 0, 1565148206);
INSERT INTO `yx_store_product_cate` VALUES (68, 9, 2, 1565148922);
INSERT INTO `yx_store_product_cate` VALUES (70, 8, 2, 1565426114);
INSERT INTO `yx_store_product_cate` VALUES (71, 7, 2, 1565600246);
INSERT INTO `yx_store_product_cate` VALUES (72, 19, 4, 1565687845);

-- ----------------------------
-- Table structure for yx_store_product_relation
-- ----------------------------
DROP TABLE IF EXISTS `yx_store_product_relation`;
CREATE TABLE `yx_store_product_relation`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uid` int(10) UNSIGNED NOT NULL COMMENT '用户ID',
  `product_id` int(10) UNSIGNED NOT NULL COMMENT '商品ID',
  `type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类型(收藏(collect）、点赞(like))',
  `category` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '某种类型的商品(普通商品、秒杀商品)',
  `add_time` int(10) UNSIGNED NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uid`(`uid`, `product_id`, `type`, `category`) USING BTREE,
  INDEX `type`(`type`) USING BTREE,
  INDEX `category`(`category`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品点赞和收藏表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for yx_store_product_reply
-- ----------------------------
DROP TABLE IF EXISTS `yx_store_product_reply`;
CREATE TABLE `yx_store_product_reply`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '评论ID',
  `uid` int(11) NOT NULL COMMENT '用户ID',
  `oid` int(11) NOT NULL COMMENT '订单ID',
  `unique` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '唯一id',
  `product_id` int(11) NOT NULL COMMENT '产品id',
  `reply_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'product' COMMENT '某种商品类型(普通商品、秒杀商品）',
  `product_score` tinyint(1) NOT NULL COMMENT '商品分数',
  `service_score` tinyint(1) NOT NULL COMMENT '服务分数',
  `comment` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '评论内容',
  `pics` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '评论图片',
  `add_time` int(11) NOT NULL COMMENT '评论时间',
  `merchant_reply_content` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '管理员回复内容',
  `merchant_reply_time` int(11) NULL DEFAULT NULL COMMENT '管理员回复时间',
  `is_del` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '0未删除1已删除',
  `is_reply` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0未回复1已回复',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `order_id_2`(`oid`, `unique`) USING BTREE,
  INDEX `add_time`(`add_time`) USING BTREE,
  INDEX `parent_id`(`reply_type`) USING BTREE,
  INDEX `is_del`(`is_del`) USING BTREE,
  INDEX `product_score`(`product_score`) USING BTREE,
  INDEX `service_score`(`service_score`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '评论表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of yx_store_product_reply
-- ----------------------------
INSERT INTO `yx_store_product_reply` VALUES (2, 12, 11, '7eab5fa9f3de480095abc5b1dee40f85', 19, 'product', 5, 5, '999999', 'http://pic.dayouqiantu.cn/Screenshot_2019-12-08-15-15-17-366_com.tencent.mm.png,http://pic.dayouqiantu.cn/IMG_20150322_111102.jpg', 1572753366, NULL, NULL, 0, 0);
INSERT INTO `yx_store_product_reply` VALUES (3, 12, 12, '274fe50fc9d0492d9e375649cae0b194', 19, 'product', 5, 5, '好评', 'http://pic.dayouqiantu.cn/Screenshot_2019-12-08-15-15-17-366_com.tencent.mm.png,http://pic.dayouqiantu.cn/IMG_20150322_111102.jpg', 1573041203, NULL, NULL, 0, 0);
INSERT INTO `yx_store_product_reply` VALUES (4, 12, 96, 'af8ca64055ac4c739cfded03c2c0b784', 19, 'product', 1, 1, '差评', '', 1577779610, NULL, NULL, 0, 0);

-- ----------------------------
-- Table structure for yx_store_seckill
-- ----------------------------
DROP TABLE IF EXISTS `yx_store_seckill`;
CREATE TABLE `yx_store_seckill`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '商品秒杀产品表id',
  `product_id` int(10) UNSIGNED NOT NULL COMMENT '商品id',
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '推荐图',
  `images` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '轮播图',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '活动标题',
  `info` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '简介',
  `price` decimal(10, 2) UNSIGNED NOT NULL COMMENT '价格',
  `cost` decimal(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '成本',
  `ot_price` decimal(10, 2) UNSIGNED NOT NULL COMMENT '原价',
  `give_integral` decimal(10, 2) UNSIGNED NOT NULL COMMENT '返多少积分',
  `sort` int(10) UNSIGNED NOT NULL COMMENT '排序',
  `stock` int(10) UNSIGNED NOT NULL COMMENT '库存',
  `sales` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '销量',
  `unit_name` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '单位名',
  `postage` decimal(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '邮费',
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '内容',
  `start_time` int(11) NOT NULL DEFAULT 0 COMMENT '开始时间',
  `stop_time` int(11) NOT NULL DEFAULT 0 COMMENT '结束时间',
  `add_time` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '添加时间',
  `status` tinyint(1) UNSIGNED NOT NULL COMMENT '产品状态',
  `is_postage` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否包邮',
  `is_hot` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '热门推荐',
  `is_del` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除 0未删除1已删除',
  `num` int(11) UNSIGNED NOT NULL COMMENT '最多秒杀几个',
  `is_show` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '显示',
  `end_time_date` datetime(0) NOT NULL,
  `start_time_date` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `product_id`(`product_id`) USING BTREE,
  INDEX `start_time`(`start_time`, `stop_time`) USING BTREE,
  INDEX `is_del`(`is_del`) USING BTREE,
  INDEX `is_hot`(`is_hot`) USING BTREE,
  INDEX `is_show`(`status`) USING BTREE,
  INDEX `add_time`(`add_time`) USING BTREE,
  INDEX `sort`(`sort`) USING BTREE,
  INDEX `is_postage`(`is_postage`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品秒杀产品表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of yx_store_seckill
-- ----------------------------
INSERT INTO `yx_store_seckill` VALUES (1, 20, 'https://image.dayouqiantu.cn/5ca04fa9c08ef.jpg', 'https://image.dayouqiantu.cn/5ca05103ad634.jpg,https://image.dayouqiantu.cn/5ca04fa9c08ef.jpg', '70gA4彩色打印复印', '70gA4彩色打印复印', 1.00, 0.50, 1.00, 0.00, 0, 100, 1, '张', 0.00, '<p style=\"text-align: center;\">7<strong>文件请传QQ2412733099，</strong></p><p style=\"text-align: center;\"><strong>718504558或2412733099@qq.com邮箱，</strong></p><p style=\"text-align: center;\"><strong>手机/微信：13733990583</strong></p><p style=\"text-align: center;\"><strong>量大请联系店主，一定让您满意而归</strong></p><p style=\"text-align: center;\"><strong>&nbsp; &nbsp;实体店面经营 保质保量</strong></p><p style=\"text-align: center;\"><strong>A4黑白2毛/张，量大1毛/张，</strong></p><p style=\"text-align: center;\"><strong>A3黑白双面5毛/张，量大3毛/张，</strong></p><p style=\"text-align: center;\"><strong>更大量请联系店主报价，</strong></p><p style=\"text-align: center;\"><strong>每消费1元可积1分，1分抵现金1毛，</strong></p><p style=\"text-align: center;\"><strong>付款时直接抵扣</strong></p><p style=\"text-align: center;\"><strong>（如此优惠的基础上还可积分，积分抵现金）</strong></p><p style=\"text-align: center;\"><img src=\"https://image.dayouqiantu.cn/5ca03007150f1.jpg\" style=\"max-width:100%;\"><strong><br></strong></p><p style=\"text-align: center;\"><br></p>', 1576476046, 1577203200, '1576476055', 1, 1, 0, 0, 1, 1, '2019-12-25 00:00:00', '2019-12-16 14:00:46');
INSERT INTO `yx_store_seckill` VALUES (2, 20, 'https://image.dayouqiantu.cn/5ca04fa9c08ef.jpg', 'https://image.dayouqiantu.cn/5ca05103ad634.jpg,https://image.dayouqiantu.cn/5ca04fa9c08ef.jpg', '70gA4彩色打印复印', '70gA4彩色打印复印', 1.00, 0.50, 1.00, 0.00, 0, 99, 2, '张', 0.00, '<p style=\"text-align: center;\">7<strong>文件请传QQ2412733099，</strong></p><p style=\"text-align: center;\"><strong>718504558或2412733099@qq.com邮箱，</strong></p><p style=\"text-align: center;\"><strong>手机/微信：13733990583</strong></p><p style=\"text-align: center;\"><strong>量大请联系店主，一定让您满意而归</strong></p><p style=\"text-align: center;\"><strong>&nbsp; &nbsp;实体店面经营 保质保量</strong></p><p style=\"text-align: center;\"><strong>A4黑白2毛/张，量大1毛/张，</strong></p><p style=\"text-align: center;\"><strong>A3黑白双面5毛/张，量大3毛/张，</strong></p><p style=\"text-align: center;\"><strong>更大量请联系店主报价，</strong></p><p style=\"text-align: center;\"><strong>每消费1元可积1分，1分抵现金1毛，</strong></p><p style=\"text-align: center;\"><strong>付款时直接抵扣</strong></p><p style=\"text-align: center;\"><strong>（如此优惠的基础上还可积分，积分抵现金）</strong></p><p style=\"text-align: center;\"><img src=\"https://image.dayouqiantu.cn/5ca03007150f1.jpg\" style=\"max-width:100%;\"><strong><br></strong></p><p style=\"text-align: center;\"><br></p>', 1576477734, 1576598400, '1576477741', 1, 1, 0, 0, 1, 1, '2019-12-18 00:00:00', '2019-12-16 14:28:54');

-- ----------------------------
-- Table structure for yx_store_seckill_attr
-- ----------------------------
DROP TABLE IF EXISTS `yx_store_seckill_attr`;
CREATE TABLE `yx_store_seckill_attr`  (
  `product_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '商品ID',
  `attr_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '属性名',
  `attr_values` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '属性值',
  INDEX `store_id`(`product_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '秒杀商品属性表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for yx_store_seckill_attr_result
-- ----------------------------
DROP TABLE IF EXISTS `yx_store_seckill_attr_result`;
CREATE TABLE `yx_store_seckill_attr_result`  (
  `product_id` int(10) UNSIGNED NOT NULL COMMENT '商品ID',
  `result` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品属性参数',
  `change_time` int(10) UNSIGNED NOT NULL COMMENT '上次修改时间',
  UNIQUE INDEX `product_id`(`product_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '秒杀商品属性详情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for yx_store_seckill_attr_value
-- ----------------------------
DROP TABLE IF EXISTS `yx_store_seckill_attr_value`;
CREATE TABLE `yx_store_seckill_attr_value`  (
  `product_id` int(10) UNSIGNED NOT NULL COMMENT '商品ID',
  `suk` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品属性索引值 (attr_value|attr_value[|....])',
  `stock` int(10) UNSIGNED NOT NULL COMMENT '属性对应的库存',
  `sales` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '销量',
  `price` decimal(8, 2) UNSIGNED NOT NULL COMMENT '属性金额',
  `image` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片',
  `unique` char(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '唯一值',
  `cost` decimal(8, 2) UNSIGNED NOT NULL COMMENT '成本价',
  UNIQUE INDEX `unique`(`unique`, `suk`) USING BTREE,
  INDEX `store_id`(`product_id`, `suk`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '秒杀商品属性值表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for yx_store_service
-- ----------------------------
DROP TABLE IF EXISTS `yx_store_service`;
CREATE TABLE `yx_store_service`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '客服id',
  `mer_id` int(11) NOT NULL DEFAULT 0 COMMENT '商户id',
  `uid` int(11) NOT NULL COMMENT '客服uid',
  `avatar` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '客服头像',
  `nickname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '代理名称',
  `add_time` int(11) NOT NULL COMMENT '添加时间',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '0隐藏1显示',
  `notify` int(2) NULL DEFAULT 0 COMMENT '订单通知1开启0关闭',
  `customer` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否展示统计管理',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '客服表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for yx_store_service_log
-- ----------------------------
DROP TABLE IF EXISTS `yx_store_service_log`;
CREATE TABLE `yx_store_service_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '客服用户对话记录表ID',
  `mer_id` int(11) NOT NULL DEFAULT 0 COMMENT '商户id',
  `msn` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '消息内容',
  `uid` int(11) NOT NULL COMMENT '发送人uid',
  `to_uid` int(11) NOT NULL COMMENT '接收人uid',
  `add_time` int(11) NOT NULL COMMENT '发送时间',
  `type` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否已读（0：否；1：是；）',
  `remind` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否提醒过',
  `msn_type` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '消息类型 1=文字 2=表情 3=图片 4=语音',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '客服用户对话记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for yx_store_visit
-- ----------------------------
DROP TABLE IF EXISTS `yx_store_visit`;
CREATE TABLE `yx_store_visit`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NULL DEFAULT NULL COMMENT '产品ID',
  `product_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品类型',
  `cate_id` int(11) NULL DEFAULT NULL COMMENT '产品分类ID',
  `type` char(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品类型',
  `uid` int(11) NULL DEFAULT NULL COMMENT '用户ID',
  `count` int(11) NULL DEFAULT NULL COMMENT '访问次数',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注描述',
  `add_time` int(11) NULL DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '产品浏览分析表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for yx_system_attachment
-- ----------------------------
DROP TABLE IF EXISTS `yx_system_attachment`;
CREATE TABLE `yx_system_attachment`  (
  `att_id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '附件名称',
  `att_dir` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '附件路径',
  `satt_dir` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '压缩图片路径',
  `att_size` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '附件大小',
  `att_type` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '附件类型',
  `pid` int(10) NOT NULL DEFAULT 0 COMMENT '分类ID0编辑器,1产品图片,2拼团图片,3砍价图片,4秒杀图片,5文章图片,6组合数据图',
  `time` int(11) NOT NULL DEFAULT 0 COMMENT '上传时间',
  `image_type` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '图片上传类型 1本地 2七牛云 3OSS 4COS ',
  `module_type` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '图片上传模块类型 1 后台上传 2 用户生成',
  PRIMARY KEY (`att_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1254 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '附件管理表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of yx_system_attachment
-- ----------------------------
INSERT INTO `yx_system_attachment` VALUES (1217, '11_0_user_wap.jpg', 'E:\\yshop\\file\\qrcode\\11_0_user_wap.jpg', 'qrcode/11_0_user_wap.jpg', '11128', 'image/jpeg', 1, 1573716532, 1, 2);
INSERT INTO `yx_system_attachment` VALUES (1224, '11_0_user_spread.jpg', 'E:\\yshop\\file\\qrcode\\11_0_user_spread.jpg', 'qrcode/11_0_user_spread.jpg', '57949', 'image/jpeg', 1, 1573720469, 1, 2);
INSERT INTO `yx_system_attachment` VALUES (1225, '1_12_0_pink_share_wap.jpg', 'E:\\yshop\\file\\qrcode\\1_12_0_pink_share_wap.jpg', 'qrcode/1_12_0_pink_share_wap.jpg', '76105', 'image/jpeg', 1, 1574310271, 1, 2);
INSERT INTO `yx_system_attachment` VALUES (1249, '1_12_0_pink_user_spread.jpg', 'E:\\yshop\\file\\qrcode\\1_12_0_pink_user_spread.jpg', 'qrcode/1_12_0_pink_user_spread.jpg', '66223', 'image/jpeg', 1, 1574315903, 1, 2);
INSERT INTO `yx_system_attachment` VALUES (1250, '12_0_user_wap.jpg', 'E:\\yshop\\file\\qrcode\\12_0_user_wap.jpg', 'qrcode/12_0_user_wap.jpg', '304900', 'image/jpeg', 1, 1575039046, 1, 2);
INSERT INTO `yx_system_attachment` VALUES (1251, '12_0_user_spread.jpg', 'E:\\yshop\\file\\qrcode\\12_0_user_spread.jpg', 'qrcode/12_0_user_spread.jpg', '56818', 'image/jpeg', 1, 1575039047, 1, 2);
INSERT INTO `yx_system_attachment` VALUES (1252, '1_12_0_bargain_share_wap.jpg', 'E:\\yshop\\file\\qrcode\\1_12_0_bargain_share_wap.jpg', 'qrcode/1_12_0_bargain_share_wap.jpg', '369077', 'image/jpeg', 1, 1577009608, 1, 2);
INSERT INTO `yx_system_attachment` VALUES (1253, '1_12_0_bargain_user_spread.jpg', 'E:\\yshop\\file\\qrcode\\1_12_0_bargain_user_spread.jpg', 'qrcode/1_12_0_bargain_user_spread.jpg', '50869', 'image/jpeg', 1, 1577009609, 1, 2);

-- ----------------------------
-- Table structure for yx_system_attachment_category
-- ----------------------------
DROP TABLE IF EXISTS `yx_system_attachment_category`;
CREATE TABLE `yx_system_attachment_category`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NULL DEFAULT 0 COMMENT '父级ID',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '分类名称',
  `enname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分类目录',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '附件分类表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for yx_system_config
-- ----------------------------
DROP TABLE IF EXISTS `yx_system_config`;
CREATE TABLE `yx_system_config`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '配置id',
  `menu_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字段名称',
  `value` varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '默认值',
  `sort` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '排序',
  `status` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '是否隐藏',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 197 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of yx_system_config
-- ----------------------------
INSERT INTO `yx_system_config` VALUES (162, 'wechat_share_img', '', NULL, NULL);
INSERT INTO `yx_system_config` VALUES (165, 'wechat_avatar', '', NULL, NULL);
INSERT INTO `yx_system_config` VALUES (172, 'wechat_share_synopsis', '4444444', NULL, NULL);
INSERT INTO `yx_system_config` VALUES (174, 'api', 'http://你的H5端域名/api/wechat/serve', NULL, NULL);
INSERT INTO `yx_system_config` VALUES (175, 'wechat_share_title', '4444', NULL, NULL);
INSERT INTO `yx_system_config` VALUES (177, 'store_postage', '0', 0, 0);
INSERT INTO `yx_system_config` VALUES (178, 'store_free_postage', '0', 0, 0);
INSERT INTO `yx_system_config` VALUES (179, 'integral_ratio', '1', 0, 0);
INSERT INTO `yx_system_config` VALUES (180, 'store_brokerage_ratio', '70', NULL, NULL);
INSERT INTO `yx_system_config` VALUES (181, 'store_brokerage_statu', '2', NULL, NULL);
INSERT INTO `yx_system_config` VALUES (182, 'user_extract_min_price', '1', NULL, NULL);
INSERT INTO `yx_system_config` VALUES (183, 'store_brokerage_two', '30', NULL, NULL);
INSERT INTO `yx_system_config` VALUES (184, 'site_url', 'http://localhost:8080', 0, 0);
INSERT INTO `yx_system_config` VALUES (185, 'api_url', 'http://127.0.0.1:8009', 0, 0);
INSERT INTO `yx_system_config` VALUES (186, 'order_cancel_job_time', '20', 0, 0);
INSERT INTO `yx_system_config` VALUES (187, 'wechat_appid', '1111', NULL, NULL);
INSERT INTO `yx_system_config` VALUES (188, 'wechat_appsecret', '2222', NULL, NULL);
INSERT INTO `yx_system_config` VALUES (189, 'wechat_encodingaeskey', '6666', NULL, NULL);
INSERT INTO `yx_system_config` VALUES (190, 'wechat_token', '999', NULL, NULL);
INSERT INTO `yx_system_config` VALUES (191, 'wxpay_mchId', '2222', NULL, NULL);
INSERT INTO `yx_system_config` VALUES (192, 'wxpay_appId', '111111', NULL, NULL);
INSERT INTO `yx_system_config` VALUES (193, 'wxpay_mchKey', '55555', NULL, NULL);
INSERT INTO `yx_system_config` VALUES (194, 'wxapp_appId', '22222', NULL, NULL);
INSERT INTO `yx_system_config` VALUES (195, 'wxapp_secret', '22222222', NULL, NULL);
INSERT INTO `yx_system_config` VALUES (196, 'wxpay_keyPath', 'http://localhost:8000/file/文档/svn搭建-201912281147261.txt', 0, 0);

-- ----------------------------
-- Table structure for yx_system_group
-- ----------------------------
DROP TABLE IF EXISTS `yx_system_group`;
CREATE TABLE `yx_system_group`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '组合数据ID',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '数据组名称',
  `info` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '数据提示',
  `config_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '数据字段',
  `fields` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '数据组字段以及类型（json数据）',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `config_name`(`config_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '组合数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for yx_system_group_data
-- ----------------------------
DROP TABLE IF EXISTS `yx_system_group_data`;
CREATE TABLE `yx_system_group_data`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '组合数据详情ID',
  `group_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '对应的数据名称',
  `value` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '数据组对应的数据值（json数据）',
  `add_time` int(10) NOT NULL DEFAULT 0 COMMENT '添加数据时间',
  `sort` int(11) NULL DEFAULT 0 COMMENT '数据排序',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态（1：开启；2：关闭；）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 228 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '组合数据详情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of yx_system_group_data
-- ----------------------------
INSERT INTO `yx_system_group_data` VALUES (177, 'routine_home_banner', '{\"addTime\":\"\",\"name\":\"banner\",\"id\":\"\",\"sort\":\"\",\"pic\":\"https://image.dayouqiantu.cn/5c9f02a110a92.jpg\",\"value\":\"\",\"url\":\"wwww\",\"status\":\"\"}', 1571387677, NULL, 1);
INSERT INTO `yx_system_group_data` VALUES (180, 'routine_home_menus', '{\"name\":\"图文分类\",\"id\":180,\"pic\":\"https://image.dayouqiantu.cn/40946.jpg\",\"url\":\"/category\"}', 1571390842, NULL, 1);
INSERT INTO `yx_system_group_data` VALUES (182, 'routine_home_roll_news', '{\"id\":182,\"pic\":\"https://i.loli.net/2019/10/18/DqOUgNf7wjuFpPT.png\",\"title\":\"新版本商城上线啦！\",\"url\":\"/news_list\",\"info\":\"yshop1.0上线啦\"}', 0, 0, 1);
INSERT INTO `yx_system_group_data` VALUES (183, 'routine_hot_search', '{\"id\":183,\"title\":\"照片\"}', 0, 0, 1);
INSERT INTO `yx_system_group_data` VALUES (184, 'routine_hot_search', '{\"id\":184,\"title\":\"springboot\"}', 0, 0, 1);
INSERT INTO `yx_system_group_data` VALUES (187, 'routine_home_roll_news', '{\"id\":187,\"url\":\"/news_list\",\"info\":\"springboot2+JPA+Mybatisplus商城系统\"}', 1572086163, NULL, 1);
INSERT INTO `yx_system_group_data` VALUES (188, 'routine_hot_search', '{\"id\":188,\"title\":\"打印\"}', 1572086172, NULL, 1);
INSERT INTO `yx_system_group_data` VALUES (189, 'routine_my_menus', '{\"name\":\"会员中心\",\"id\":189,\"pic\":\"https://image.dayouqiantu.cn/5dec896eeb25a.png\",\"url\":\"/user/vip\"}', 1572087722, NULL, 1);
INSERT INTO `yx_system_group_data` VALUES (190, 'routine_my_menus', '{\"name\":\"优惠券\",\"id\":190,\"pic\":\"https://image.dayouqiantu.cn/5db428984d64d.png\",\"url\":\"/user/user_coupon\"}', 0, 0, 1);
INSERT INTO `yx_system_group_data` VALUES (191, 'routine_my_menus', '{\"name\":\"收藏商品\",\"id\":191,\"pic\":\"https://image.dayouqiantu.cn/5db428a8d3ab0.png\",\"url\":\"/collection\"}', 0, 0, 1);
INSERT INTO `yx_system_group_data` VALUES (192, 'routine_my_menus', '{\"name\":\"地址管理\",\"id\":192,\"pic\":\"https://image.dayouqiantu.cn/5db428bd61b73.png\",\"url\":\"/user/add_manage\"}', 0, 0, 1);
INSERT INTO `yx_system_group_data` VALUES (193, 'routine_my_menus', '{\"name\":\"我的推广\",\"id\":193,\"pic\":\"https://image.dayouqiantu.cn/5db428e28dd48.png\",\"url\":\"/user/user_promotion\"}', 0, 0, 1);
INSERT INTO `yx_system_group_data` VALUES (194, 'routine_my_menus', '{\"name\":\"我的余额\",\"id\":\"\",\"pic\":\"https://image.dayouqiantu.cn/5db42a4208c55.png\",\"sort\":\"\",\"url\":\"/user/account\",\"status\":\"\"}', 0, 0, 1);
INSERT INTO `yx_system_group_data` VALUES (195, 'routine_my_menus', '{\"name\":\"我的积分\",\"id\":\"\",\"pic\":\"https://image.dayouqiantu.cn/5db428f410462.png\",\"sort\":\"\",\"url\":\"/user/integral\",\"status\":\"\"}', 0, 0, 1);
INSERT INTO `yx_system_group_data` VALUES (196, 'routine_home_menus', '{\"addTime\":\"\",\"name\":\"图文资讯\",\"id\":\"\",\"sort\":\"\",\"pic\":\"https://image.dayouqiantu.cn/326197.jpg\",\"value\":\"\",\"url\":\"/news_list\",\"status\":\"\"}', 1573109648, NULL, 1);
INSERT INTO `yx_system_group_data` VALUES (197, 'routine_home_menus', '{\"name\":\"我的收藏\",\"id\":\"\",\"pic\":\"https://image.dayouqiantu.cn/2638816.jpg\",\"sort\":\"\",\"url\":\"/collection\",\"status\":\"\"}', 1573109723, NULL, 1);
INSERT INTO `yx_system_group_data` VALUES (198, 'routine_home_banner', '{\"name\":\"222\",\"id\":\"\",\"pic\":\"https://image.dayouqiantu.cn/5c9f0657dda90.jpg\",\"sort\":\"\",\"url\":\"/\",\"status\":\"\"}', 1573109952, NULL, 1);
INSERT INTO `yx_system_group_data` VALUES (200, 'routine_home_menus', '{\"name\":\"领取优惠券\",\"id\":200,\"pic\":\"https://image.dayouqiantu.cn/5db428984d64d.png\",\"url\":\"/user/get_coupon\"}', 0, 0, 1);
INSERT INTO `yx_system_group_data` VALUES (201, 'routine_home_roll_news', '{\"id\":\"\",\"url\":\"/\",\"info\":\"new hhhh\"}', 1574047234, NULL, 1);
INSERT INTO `yx_system_group_data` VALUES (202, 'routine_home_menus', '{\"name\":\"拼团活动\",\"id\":180,\"pic\":\"https://image.dayouqiantu.cn/5de1e120c08cd.png\",\"url\":\"/activity/group\"}', 0, 0, 1);
INSERT INTO `yx_system_group_data` VALUES (203, 'routine_my_menus', '{\"name\":\"商户管理\",\"id\":\"\",\"pic\":\"https://image.dayouqiantu.cn/5ddb7a37d58d9.png\",\"sort\":\"\",\"url\":\"/customer/index\",\"status\":\"\"}', 0, 0, 1);
INSERT INTO `yx_system_group_data` VALUES (204, 'routine_home_roll_news', '{\"id\":\"\",\"url\":\"/index\",\"info\":\"新添加\"}', 1574681945, NULL, 1);
INSERT INTO `yx_system_group_data` VALUES (205, 'sign_day_num', '{\"sign_num\":\"10\",\"id\":205,\"day\":\"第一天\"}', 1575526887, NULL, 1);
INSERT INTO `yx_system_group_data` VALUES (207, 'sign_day_num', '{\"sign_num\":\"20\",\"id\":\"\",\"day\":\"第二天\"}', 1575527087, NULL, 1);
INSERT INTO `yx_system_group_data` VALUES (209, 'sign_day_num', '{\"sign_num\":\"30\",\"id\":\"\",\"day\":\"第三天\"}', 1575527252, NULL, 1);
INSERT INTO `yx_system_group_data` VALUES (210, 'sign_day_num', '{\"addTime\":\"\",\"sign_num\":\"40\",\"id\":\"\",\"sort\":\"\",\"value\":\"\",\"day\":\"第四天\",\"status\":\"\"}', 1575527262, NULL, 1);
INSERT INTO `yx_system_group_data` VALUES (211, 'sign_day_num', '{\"addTime\":\"\",\"sign_num\":\"50\",\"id\":\"\",\"sort\":\"\",\"value\":\"\",\"day\":\"第五天\",\"status\":\"\"}', 1575527345, NULL, 1);
INSERT INTO `yx_system_group_data` VALUES (212, 'sign_day_num', '{\"addTime\":\"\",\"sign_num\":\"60\",\"id\":\"\",\"sort\":\"\",\"value\":\"\",\"day\":\"第六天\",\"status\":\"\"}', 1575527354, NULL, 1);
INSERT INTO `yx_system_group_data` VALUES (213, 'sign_day_num', '{\"addTime\":\"\",\"sign_num\":\"100\",\"id\":\"\",\"sort\":\"\",\"value\":\"\",\"day\":\"奖励\",\"status\":\"\"}', 1575527381, NULL, 1);
INSERT INTO `yx_system_group_data` VALUES (216, 'routine_home_menus', '{\"name\":\"积分签到\",\"id\":180,\"pic\":\"https://image.dayouqiantu.cn/5de8a693f365e.jpg\",\"url\":\"/user/sign\"}', 0, 0, 1);
INSERT INTO `yx_system_group_data` VALUES (218, 'routine_seckill_time', '{\"continued\":2,\"id\":\"\",\"time\":5}', 1576484368, NULL, 1);
INSERT INTO `yx_system_group_data` VALUES (219, 'routine_seckill_time', '{\"addTime\":\"\",\"continued\":\"3\",\"id\":\"\",\"sort\":\"\",\"time\":\"7\",\"value\":\"\",\"status\":\"\"}', 1576484383, NULL, 1);
INSERT INTO `yx_system_group_data` VALUES (220, 'routine_seckill_time', '{\"addTime\":\"\",\"continued\":\"2\",\"id\":\"\",\"sort\":\"\",\"time\":\"10\",\"value\":\"\",\"status\":\"\"}', 1576484404, NULL, 1);
INSERT INTO `yx_system_group_data` VALUES (221, 'routine_seckill_time', '{\"addTime\":\"\",\"continued\":\"3\",\"id\":\"\",\"sort\":\"\",\"time\":\"12\",\"value\":\"\",\"status\":\"\"}', 1576484422, NULL, 1);
INSERT INTO `yx_system_group_data` VALUES (222, 'routine_seckill_time', '{\"addTime\":\"\",\"continued\":\"4\",\"id\":\"\",\"sort\":\"\",\"time\":\"15\",\"value\":\"\",\"status\":\"\"}', 1576484435, NULL, 1);
INSERT INTO `yx_system_group_data` VALUES (223, 'routine_seckill_time', '{\"continued\":\"2\",\"id\":223,\"time\":\"19\"}', 1576484444, NULL, 1);
INSERT INTO `yx_system_group_data` VALUES (224, 'routine_home_menus', '{\"name\":\"秒杀\",\"id\":180,\"pic\":\"https://image.dayouqiantu.cn/5df74a3bbac9f.png\",\"url\":\"/activity/goods_seckill\"}', 0, 0, 1);
INSERT INTO `yx_system_group_data` VALUES (226, 'routine_home_menus', '{\"name\":\"砍价\",\"id\":180,\"pic\":\"https://image.dayouqiantu.cn/5dfd7c9c49305.png\",\"url\":\"/activity/bargain\"}', 0, 0, 1);
INSERT INTO `yx_system_group_data` VALUES (227, 'routine_my_menus', '{\"name\":\"砍价记录\",\"id\":\"\",\"pic\":\"https://image.dayouqiantu.cn/5dfd7b748e053.png\",\"sort\":\"\",\"url\":\"/activity/bargain/record\",\"status\":\"\"}', 0, 0, 1);

-- ----------------------------
-- Table structure for yx_system_store
-- ----------------------------
DROP TABLE IF EXISTS `yx_system_store`;
CREATE TABLE `yx_system_store`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '门店名称',
  `introduction` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '简介',
  `phone` char(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '手机号码',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '省市区',
  `detailed_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '详细地址',
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '门店logo',
  `latitude` char(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '纬度',
  `longitude` char(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '经度',
  `valid_time` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '核销有效日期',
  `day_time` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '每日营业开关时间',
  `add_time` int(11) NOT NULL DEFAULT 0 COMMENT '添加时间',
  `is_show` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否显示',
  `is_del` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `phone`(`phone`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '门店自提' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for yx_system_user_level
-- ----------------------------
DROP TABLE IF EXISTS `yx_system_user_level`;
CREATE TABLE `yx_system_user_level`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mer_id` int(11) NOT NULL DEFAULT 0 COMMENT '商户id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '会员名称',
  `money` decimal(8, 2) NOT NULL DEFAULT 0.00 COMMENT '购买金额',
  `valid_date` int(11) NOT NULL DEFAULT 0 COMMENT '有效时间',
  `is_forever` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否为永久会员',
  `is_pay` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否购买,1=购买,0=不购买',
  `is_show` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否显示 1=显示,0=隐藏',
  `grade` int(11) NOT NULL DEFAULT 0 COMMENT '会员等级',
  `discount` decimal(8, 2) NOT NULL DEFAULT 0.00 COMMENT '享受折扣',
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '会员卡背景',
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '会员图标',
  `explain` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '说明',
  `add_time` int(11) NOT NULL DEFAULT 0 COMMENT '添加时间',
  `is_del` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否删除.1=删除,0=未删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '设置用户等级表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of yx_system_user_level
-- ----------------------------
INSERT INTO `yx_system_user_level` VALUES (1, 0, '普通会员', 20.00, 0, 1, 0, 1, 1, 99.00, 'http://pic.dayouqiantu.cn/5c9ccca8cd632.jpg', 'http://pic.dayouqiantu.cn/5c9ccca8bc1e0.png', '普通会员', 1553824559, 0);
INSERT INTO `yx_system_user_level` VALUES (2, 0, '青铜会员', 0.00, 0, 1, 0, 1, 2, 98.00, 'http://pic.dayouqiantu.cn/5c9ccca904016.jpg', 'http://pic.dayouqiantu.cn/5c9ccca8f0a30.png', '青铜会员', 1553824639, 0);
INSERT INTO `yx_system_user_level` VALUES (3, 0, '黄铜会员', 0.00, 0, 1, 0, 1, 3, 95.00, 'http://pic.dayouqiantu.cn/5c9ccca8b27f1.jpg', 'http://pic.dayouqiantu.cn/5c9ccca8e9365.png', '黄铜会员', 1553824742, 0);
INSERT INTO `yx_system_user_level` VALUES (4, 0, '白银会员', 0.00, 0, 1, 0, 1, 4, 94.00, 'http://pic.dayouqiantu.cn/5c9ccca8d6ae1.jpg', 'http://pic.dayouqiantu.cn/5c9ccca8a27f0.png', '白银会员', 1553824797, 0);
INSERT INTO `yx_system_user_level` VALUES (5, 0, '黄金会员', 0.00, 0, 1, 0, 1, 5, 90.00, 'http://pic.dayouqiantu.cn/5c9ccca8b27f1.jpg', 'http://pic.dayouqiantu.cn/5c9ccca8aa5b9.png', '黄金会员', 1553824837, 0);
INSERT INTO `yx_system_user_level` VALUES (6, 0, '钻石会员', 0.00, 0, 1, 0, 1, 6, 88.00, 'http://pic.dayouqiantu.cn/5c9ccca8dfe16.jpg', 'http://pic.dayouqiantu.cn/5c9ccca90d2d3.png', '钻石会员', 1553824871, 1);

-- ----------------------------
-- Table structure for yx_system_user_task
-- ----------------------------
DROP TABLE IF EXISTS `yx_system_user_task`;
CREATE TABLE `yx_system_user_task`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `real_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '配置原名',
  `task_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '任务类型',
  `number` int(11) NOT NULL DEFAULT 0 COMMENT '限定数',
  `level_id` int(11) NOT NULL DEFAULT 0 COMMENT '等级id',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '排序',
  `is_show` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否显示',
  `is_must` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否务必达成任务,1务必达成,0=满足其一',
  `illustrate` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '任务说明',
  `add_time` int(11) NOT NULL DEFAULT 0 COMMENT '新增时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '等级任务设置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of yx_system_user_task
-- ----------------------------
INSERT INTO `yx_system_user_task` VALUES (1, '满足积分20分', '积分数', 'SatisfactionIntegral', 20, 1, 0, 1, 1, '', 1553827616);
INSERT INTO `yx_system_user_task` VALUES (2, '消费满100元', '消费金额', 'ConsumptionAmount', 100, 1, 0, 1, 1, '', 1553827625);
INSERT INTO `yx_system_user_task` VALUES (3, '满足积分200分', '积分数', 'SatisfactionIntegral', 200, 2, 0, 1, 1, '', 1553827638);
INSERT INTO `yx_system_user_task` VALUES (4, '累计签到20天', '累计签到', 'CumulativeAttendance', 20, 2, 0, 1, 1, '', 1553827681);
INSERT INTO `yx_system_user_task` VALUES (5, '满足积分500分', '积分数', 'SatisfactionIntegral', 500, 3, 0, 1, 1, '', 1553827695);
INSERT INTO `yx_system_user_task` VALUES (6, '累计签到30天', '累计签到', 'CumulativeAttendance', 30, 3, 0, 1, 1, '', 1553827703);
INSERT INTO `yx_system_user_task` VALUES (7, '满足积分1000分', '积分数', 'SatisfactionIntegral', 1000, 4, 0, 1, 1, '', 1553827731);
INSERT INTO `yx_system_user_task` VALUES (8, '累计签到10天', '累计签到', 'CumulativeAttendance', 10, 4, 0, 1, 1, '', 1553827740);
INSERT INTO `yx_system_user_task` VALUES (9, '满足积分1200分', '积分数', 'SatisfactionIntegral', 1200, 5, 0, 1, 1, '', 1553827759);
INSERT INTO `yx_system_user_task` VALUES (10, '累计签到60天', '累计签到', 'CumulativeAttendance', 60, 5, 0, 1, 1, '', 1553827768);
INSERT INTO `yx_system_user_task` VALUES (11, '消费满10000元', '消费次数', 'ConsumptionAmount', 10000, 5, 0, 1, 1, '', 1553827776);
INSERT INTO `yx_system_user_task` VALUES (12, '满足积分2000分', '积分数', 'SatisfactionIntegral', 2000, 6, 0, 1, 1, '', 1553827791);
INSERT INTO `yx_system_user_task` VALUES (13, '消费满10000元', '消费次数', 'ConsumptionAmount', 10000, 6, 0, 1, 1, '', 1553827803);
INSERT INTO `yx_system_user_task` VALUES (14, '累计签到100天', '累计签到', 'CumulativeAttendance', 100, 6, 0, 1, 1, '', 1553827814);
INSERT INTO `yx_system_user_task` VALUES (15, '消费满1000元', '消费金额', 'ConsumptionAmount', 1000, 4, 0, 1, 1, '', 1575456513);
INSERT INTO `yx_system_user_task` VALUES (16, '累计签到2天', '累计签到', 'CumulativeAttendance', 2, 1, 0, 1, 1, '', 1575456576);
INSERT INTO `yx_system_user_task` VALUES (17, '消费满100元', '消费次数', 'ConsumptionAmount', 100, 2, 0, 1, 1, '', 1575456612);
INSERT INTO `yx_system_user_task` VALUES (18, '消费满1000元', '消费金额', 'ConsumptionAmount', 1000, 3, 0, 1, 1, '', 1575456692);

-- ----------------------------
-- Table structure for yx_user
-- ----------------------------
DROP TABLE IF EXISTS `yx_user`;
CREATE TABLE `yx_user`  (
  `uid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户账户(跟accout一样)',
  `account` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户账号',
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户密码（跟pwd）',
  `pwd` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户密码',
  `real_name` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '真实姓名',
  `birthday` int(11) NULL DEFAULT 0 COMMENT '生日',
  `card_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '身份证号码',
  `mark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户备注',
  `partner_id` int(11) NULL DEFAULT 0 COMMENT '合伙人id',
  `group_id` int(11) NULL DEFAULT 0 COMMENT '用户分组id',
  `nickname` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户昵称',
  `avatar` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户头像',
  `phone` char(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码',
  `add_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '添加时间',
  `add_ip` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '添加ip',
  `last_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '最后一次登录时间',
  `last_ip` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '最后一次登录ip',
  `now_money` decimal(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '用户余额',
  `brokerage_price` decimal(8, 2) NOT NULL DEFAULT 0.00 COMMENT '佣金金额',
  `integral` decimal(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '用户剩余积分',
  `sign_num` int(11) NOT NULL DEFAULT 0 COMMENT '连续签到天数',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1为正常，0为禁止',
  `level` tinyint(2) UNSIGNED NOT NULL DEFAULT 0 COMMENT '等级',
  `spread_uid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '推广元id',
  `spread_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '推广员关联时间',
  `user_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户类型',
  `is_promoter` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否为推广员',
  `pay_count` int(11) UNSIGNED NULL DEFAULT 0 COMMENT '用户购买次数',
  `spread_count` int(11) NULL DEFAULT 0 COMMENT '下级人数',
  `clean_time` int(11) NULL DEFAULT 0 COMMENT '清理会员时间',
  `addres` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '详细地址',
  `adminid` int(11) UNSIGNED NULL DEFAULT 0 COMMENT '管理员编号 ',
  `login_type` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户登陆类型，h5,wechat,routine',
  PRIMARY KEY (`uid`) USING BTREE,
  INDEX `account`(`account`) USING BTREE,
  INDEX `spreaduid`(`spread_uid`) USING BTREE,
  INDEX `level`(`level`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  INDEX `is_promoter`(`is_promoter`) USING BTREE,
  INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of yx_user
-- ----------------------------
INSERT INTO `yx_user` VALUES (11, 'hupeng', 'hupeng', 'e10adc3949ba59abbe56e057f20f883e', 'e10adc3949ba59abbe56e057f20f883e', '', 0, '', '', 0, 0, '会敲代码的喵', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83er0oNIia5bws9DCW1VM9qNbObKU9icwtvMpp7zE534e4Y9gwqR5Izvllladvop0ibpJJg2n6ticNSB9gA/132', '', 1573120584, '', 1573120584, '', 9999.00, 12.70, 0.00, 0, 1, 0, 0, 1573613651, 'wechat', 0, 2, 1, 0, '', 0, '');
INSERT INTO `yx_user` VALUES (12, '15136175246', 'Here is a boy: :boy|type_6:!', 'e10adc3949ba59abbe56e057f20f883e', 'e10adc3949ba59abbe56e057f20f883e', '', 0, '', '', 0, 0, '会敲代码的喵2', 'https://image.dayouqiantu.cn/5dc2c7f3a104c.png', '15136175246', 1573120881, '', 1573120881, '', 9122.60, 28.00, 69.51, 2, 1, 1, 11, 1573527758, 'h5', 0, 17, 1, 0, '', 0, '');
INSERT INTO `yx_user` VALUES (14, '15136175247', '15136175247', 'e10adc3949ba59abbe56e057f20f883e', 'e10adc3949ba59abbe56e057f20f883e', '', 0, '', '', 0, 0, '15136175247', 'https://image.dayouqiantu.cn/5dc2c7f3a104c.png', '15136175247', 1573612696, '', 1573612696, '', 9400.00, 0.00, 2.00, 0, 1, 0, 12, 1573612702, 'h5', 0, 5, 0, 0, '', 0, '');

-- ----------------------------
-- Table structure for yx_user_address
-- ----------------------------
DROP TABLE IF EXISTS `yx_user_address`;
CREATE TABLE `yx_user_address`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用户地址id',
  `uid` int(10) UNSIGNED NOT NULL COMMENT '用户id',
  `real_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '收货人姓名',
  `phone` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '收货人电话',
  `province` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '收货人所在省',
  `city` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '收货人所在市',
  `district` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '收货人所在区',
  `detail` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '收货人详细地址',
  `post_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '邮编',
  `longitude` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '经度',
  `latitude` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '纬度',
  `is_default` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否默认',
  `is_del` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否删除',
  `add_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `is_default`(`is_default`) USING BTREE,
  INDEX `is_del`(`is_del`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户地址表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of yx_user_address
-- ----------------------------
INSERT INTO `yx_user_address` VALUES (9, 8, '胡鹏', '15136175246', '山西', '大同市', '灵丘县', '999', '', '0', '0', 1, 0, 1573119435);
INSERT INTO `yx_user_address` VALUES (10, 11, '胡鹏', '15139175246', '重庆', '荣昌县', '广顺镇', '999', '', '0', '0', 1, 0, 1573120628);
INSERT INTO `yx_user_address` VALUES (11, 12, 'hu', '15136175246', '上海', '闸北区', '城区', '99999', '', '0', '0', 1, 0, 1573123595);
INSERT INTO `yx_user_address` VALUES (12, 14, 'zhang', '15136175247', '上海', '静安区', '城区', '999', '', '0', '0', 1, 0, 1573612804);

-- ----------------------------
-- Table structure for yx_user_bill
-- ----------------------------
DROP TABLE IF EXISTS `yx_user_bill`;
CREATE TABLE `yx_user_bill`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用户账单id',
  `uid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户uid',
  `link_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '关联id',
  `pm` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '0 = 支出 1 = 获得',
  `title` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '账单标题',
  `category` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '明细种类',
  `type` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '明细类型',
  `number` decimal(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '明细数字',
  `balance` decimal(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '剩余',
  `mark` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '备注',
  `add_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '添加时间',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0 = 带确定 1 = 有效 -1 = 无效',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `openid`(`uid`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  INDEX `add_time`(`add_time`) USING BTREE,
  INDEX `pm`(`pm`) USING BTREE,
  INDEX `type`(`category`, `type`, `link_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 62 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户账单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of yx_user_bill
-- ----------------------------
INSERT INTO `yx_user_bill` VALUES (3, 3, '8', 0, '购买商品', 'now_money', 'pay_product', 100.00, 10000.00, '余额支付', 1572416780, 1);
INSERT INTO `yx_user_bill` VALUES (4, 3, '9', 0, '购买商品', 'now_money', 'pay_product', 300.00, 9900.00, '余额支付', 1572416917, 1);
INSERT INTO `yx_user_bill` VALUES (5, 3, '10', 0, '购买商品', 'now_money', 'pay_product', 100.00, 9600.00, '余额支付', 1572425699, 1);
INSERT INTO `yx_user_bill` VALUES (6, 3, '11', 0, '购买商品', 'now_money', 'pay_product', 100.00, 9500.00, '余额支付', 1572427199, 1);
INSERT INTO `yx_user_bill` VALUES (7, 3, '11', 1, '购买商品赠送积分', 'integral', 'gain', 10.00, 0.00, '购买商品赠送', 1572693386, 1);
INSERT INTO `yx_user_bill` VALUES (8, 3, '10', 1, '商品退款', 'now_money', 'pay_product_refund', 100.00, 9500.00, '订单退款到余额', 1573040186, 1);
INSERT INTO `yx_user_bill` VALUES (9, 3, '12', 0, '购买商品', 'now_money', 'pay_product', 100.00, 9500.00, '余额支付', 1573040704, 1);
INSERT INTO `yx_user_bill` VALUES (10, 12, '12', 1, '购买商品赠送积分', 'integral', 'gain', 10.00, 10.00, '购买商品赠送', 1573041037, 1);
INSERT INTO `yx_user_bill` VALUES (11, 3, '26', 0, '购买商品', 'now_money', 'pay_product', 0.20, 9400.00, '余额支付', 1573119034, 1);
INSERT INTO `yx_user_bill` VALUES (12, 12, '34', 0, '购买商品', 'now_money', 'pay_product', 0.20, 10000.00, '余额支付', 1573124900, 1);
INSERT INTO `yx_user_bill` VALUES (13, 12, '33', 0, '购买商品', 'now_money', 'pay_product', 0.20, 9999.80, '余额支付', 1573124914, 1);
INSERT INTO `yx_user_bill` VALUES (14, 12, '35', 0, '购买商品', 'now_money', 'pay_product', 119.00, 9999.60, '余额支付', 1573380051, 1);
INSERT INTO `yx_user_bill` VALUES (15, 12, '105e06edb7bf4113aff646a45b13abaa', 0, '积分抵扣', 'integral', 'deduction', 10.00, 10.00, '购买商品使用', 1573381947, 1);
INSERT INTO `yx_user_bill` VALUES (16, 12, '36', 0, '购买商品', 'now_money', 'pay_product', 160.00, 9880.60, '余额支付', 1573381947, 1);
INSERT INTO `yx_user_bill` VALUES (17, 14, '37', 0, '购买商品', 'now_money', 'pay_product', 120.00, 10000.00, '余额支付', 1573612822, 1);
INSERT INTO `yx_user_bill` VALUES (18, 14, '37', 1, '购买商品赠送积分', 'integral', 'gain', 1.00, 0.00, '购买商品赠送', 1573613426, 1);
INSERT INTO `yx_user_bill` VALUES (19, 12, '37', 1, '获得推广佣金', 'now_money', 'brokerage', 14.00, 14.00, '15136175247成功消费120.00元,奖励推广佣金14.0', 1573613427, 1);
INSERT INTO `yx_user_bill` VALUES (20, 11, '37', 1, '获得推广佣金', 'now_money', 'brokerage', 6.00, 6.00, '二级推广人15136175247成功消费120.00元,奖励推广佣金6.0', 1573613427, 1);
INSERT INTO `yx_user_bill` VALUES (21, 11, '1', 0, '佣金提现', 'now_money', 'extract', 1.00, 5.00, '使用微信提现1元', 1573648445, 1);
INSERT INTO `yx_user_bill` VALUES (25, 11, '1', 1, '提现失败', 'now_money', 'extract', 1.00, 6.00, '提现失败,退回佣金1元', 1573710526, 1);
INSERT INTO `yx_user_bill` VALUES (26, 14, '84892a2626a341939dd05cd7f2adff9e', 0, '积分抵扣', 'integral', 'deduction', 1.00, 1.00, '购买商品使用', 1573888321, 1);
INSERT INTO `yx_user_bill` VALUES (27, 14, '39', 1, '积分回退', 'integral', 'deduction', 1.00, 0.00, '购买商品失败,回退积分', 1573888707, 1);
INSERT INTO `yx_user_bill` VALUES (28, 14, '42', 0, '购买商品', 'now_money', 'pay_product', 120.00, 9880.00, '余额支付', 1573979565, 1);
INSERT INTO `yx_user_bill` VALUES (29, 14, '61', 0, '购买商品', 'now_money', 'pay_product', 120.00, 9760.00, '余额支付', 1573991796, 1);
INSERT INTO `yx_user_bill` VALUES (30, 14, '67', 0, '购买商品', 'now_money', 'pay_product', 120.00, 9640.00, '余额支付', 1573996204, 1);
INSERT INTO `yx_user_bill` VALUES (31, 14, '68', 0, '购买商品', 'now_money', 'pay_product', 120.00, 9520.00, '余额支付', 1573996429, 1);
INSERT INTO `yx_user_bill` VALUES (32, 14, '68', 1, '购买商品赠送积分', 'integral', 'gain', 1.00, 1.00, '购买商品赠送', 1574048275, 1);
INSERT INTO `yx_user_bill` VALUES (33, 12, '68', 1, '获得推广佣金', 'now_money', 'brokerage', 14.00, 28.00, '15136175247成功消费120.00元,奖励推广佣金14.0', 1574048275, 1);
INSERT INTO `yx_user_bill` VALUES (34, 11, '68', 1, '获得推广佣金', 'now_money', 'brokerage', 6.00, 12.00, '二级推广人15136175247成功消费120.00元,奖励推广佣金6.0', 1574048275, 1);
INSERT INTO `yx_user_bill` VALUES (35, 12, '89', 0, '购买商品', 'now_money', 'pay_product', 120.00, 9720.60, '余额支付', 1574221758, 1);
INSERT INTO `yx_user_bill` VALUES (36, 12, '90', 0, '购买商品', 'now_money', 'pay_product', 120.00, 9600.60, '余额支付', 1574243179, 1);
INSERT INTO `yx_user_bill` VALUES (37, 12, '91', 0, '购买商品', 'now_money', 'pay_product', 120.00, 9480.60, '余额支付', 1574244175, 1);
INSERT INTO `yx_user_bill` VALUES (38, 12, '92', 0, '购买商品', 'now_money', 'pay_product', 1.00, 9360.60, '余额支付', 1574327309, 1);
INSERT INTO `yx_user_bill` VALUES (39, 11, '93', 0, '购买商品', 'now_money', 'pay_product', 1.00, 10000.00, '余额支付', 1574329404, 1);
INSERT INTO `yx_user_bill` VALUES (40, 12, '96', 0, '购买商品', 'now_money', 'pay_product', 1.00, 9359.60, '余额支付', 1574425447, 1);
INSERT INTO `yx_user_bill` VALUES (41, 12, '91', 1, '商品退款', 'now_money', 'pay_product_refund', 120.00, 9478.60, '订单退款到余额', 1574757130, 1);
INSERT INTO `yx_user_bill` VALUES (42, 12, '91', 1, '商品退款', 'now_money', 'pay_product_refund', 120.00, 9598.60, '订单退款到余额', 1574757363, 1);
INSERT INTO `yx_user_bill` VALUES (43, 14, '0', 1, '系统增加余额', 'now_money', 'system_add', 10.00, 9410.00, '系统增加了10.0余额', 1575446946, 1);
INSERT INTO `yx_user_bill` VALUES (44, 14, '0', 0, '系统增加余额', 'now_money', 'system_sub', 10.00, 9400.00, '系统扣除了10.0余额', 1575447084, 1);
INSERT INTO `yx_user_bill` VALUES (45, 12, '0', 1, '签到奖励', 'integral', 'sign', 10.00, 0.00, '', 1575549244, 1);
INSERT INTO `yx_user_bill` VALUES (46, 12, '0', 1, '签到奖励', 'integral', 'sign', 10.00, 10.00, '', 1575684021, 1);
INSERT INTO `yx_user_bill` VALUES (47, 12, '99', 0, '购买商品', 'now_money', 'pay_product', 118.80, 9598.60, '余额支付', 1575771514, 1);
INSERT INTO `yx_user_bill` VALUES (48, 12, '0', 1, '签到奖励', 'integral', 'sign', 20.00, 20.00, '', 1575771932, 1);
INSERT INTO `yx_user_bill` VALUES (49, 11, '96', 1, '获得推广佣金', 'now_money', 'brokerage', 0.70, 12.70, '会敲代码的喵2成功消费1.00元,奖励推广佣金0.7', 1575868078, 1);
INSERT INTO `yx_user_bill` VALUES (50, 12, '100', 0, '购买商品', 'now_money', 'pay_product', 118.80, 9479.80, '余额支付', 1576234308, 1);
INSERT INTO `yx_user_bill` VALUES (51, 12, '91', 1, '商品退款', 'now_money', 'pay_product_refund', 120.00, 9481.00, '订单退款到余额', 1576286856, 1);
INSERT INTO `yx_user_bill` VALUES (52, 12, '101', 0, '购买商品', 'now_money', 'pay_product', 1.00, 9481.00, '余额支付', 1576565376, 1);
INSERT INTO `yx_user_bill` VALUES (53, 12, '0', 1, '签到奖励', 'integral', 'sign', 10.00, 40.00, '', 1577026465, 1);
INSERT INTO `yx_user_bill` VALUES (54, 12, '102', 0, '购买商品', 'now_money', 'pay_product', 1.00, 9480.00, '余额支付', 1577086164, 1);
INSERT INTO `yx_user_bill` VALUES (55, 12, '0', 1, '签到奖励', 'integral', 'sign', 20.00, 50.00, '', 1577099436, 1);
INSERT INTO `yx_user_bill` VALUES (56, 12, '103', 0, '购买商品', 'now_money', 'pay_product', 118.80, 9479.00, '余额支付', 1577345071, 1);
INSERT INTO `yx_user_bill` VALUES (57, 12, '25f5693f8e82419bba4f581af126dc47', 0, '积分抵扣', 'integral', 'deduction', 0.50, 70.00, '购买商品使用', 1577442136, 1);
INSERT INTO `yx_user_bill` VALUES (58, 12, '104', 0, '购买商品', 'now_money', 'pay_product', 0.00, 9360.20, '余额支付', 1577442136, 1);
INSERT INTO `yx_user_bill` VALUES (59, 12, '104', 1, '商品退款', 'now_money', 'pay_product_refund', 0.00, 9360.20, '订单退款到余额', 1577586525, 1);
INSERT INTO `yx_user_bill` VALUES (60, 12, '105', 0, '购买商品', 'now_money', 'pay_product', 118.80, 9360.20, '余额支付', 1577611680, 1);
INSERT INTO `yx_user_bill` VALUES (61, 12, '106', 0, '购买商品', 'now_money', 'pay_product', 118.80, 9241.40, '余额支付', 1577774706, 1);

-- ----------------------------
-- Table structure for yx_user_enter
-- ----------------------------
DROP TABLE IF EXISTS `yx_user_enter`;
CREATE TABLE `yx_user_enter`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '商户申请ID',
  `uid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户ID',
  `province` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '商户所在省',
  `city` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '商户所在市',
  `district` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '商户所在区',
  `address` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '商户详细地址',
  `merchant_name` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '商户名称',
  `link_user` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `link_tel` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '商户电话',
  `charter` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '商户证书',
  `add_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '添加时间',
  `apply_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '审核时间',
  `success_time` int(11) NOT NULL COMMENT '通过时间',
  `fail_message` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '未通过原因',
  `fail_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '未通过时间',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '-1 审核未通过 0未审核 1审核通过',
  `is_lock` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '0 = 开启 1= 关闭',
  `is_del` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uid`(`uid`) USING BTREE,
  INDEX `province`(`province`, `city`, `district`) USING BTREE,
  INDEX `is_lock`(`is_lock`) USING BTREE,
  INDEX `is_del`(`is_del`) USING BTREE,
  INDEX `status`(`status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商户申请表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for yx_user_extract
-- ----------------------------
DROP TABLE IF EXISTS `yx_user_extract`;
CREATE TABLE `yx_user_extract`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uid` int(10) UNSIGNED NULL DEFAULT NULL,
  `real_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `extract_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'bank' COMMENT 'bank = 银行卡 alipay = 支付宝wx=微信',
  `bank_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '银行卡',
  `bank_address` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '开户地址',
  `alipay_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '支付宝账号',
  `extract_price` decimal(8, 2) UNSIGNED NULL DEFAULT 0.00 COMMENT '提现金额',
  `mark` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `balance` decimal(8, 2) UNSIGNED NULL DEFAULT 0.00,
  `fail_msg` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '无效原因',
  `fail_time` int(10) UNSIGNED NULL DEFAULT NULL,
  `add_time` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '添加时间',
  `status` tinyint(2) NULL DEFAULT 0 COMMENT '-1 未通过 0 审核中 1 已提现',
  `wechat` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信号',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `extract_type`(`extract_type`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  INDEX `add_time`(`add_time`) USING BTREE,
  INDEX `openid`(`uid`) USING BTREE,
  INDEX `fail_time`(`fail_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户提现表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of yx_user_extract
-- ----------------------------
INSERT INTO `yx_user_extract` VALUES (1, 11, '会敲代码的喵', 'weixin', '0', '', '', 1.00, NULL, 5.00, '失败了', 1573710526, 1573648445, -1, 'hu');

-- ----------------------------
-- Table structure for yx_user_group
-- ----------------------------
DROP TABLE IF EXISTS `yx_user_group`;
CREATE TABLE `yx_user_group`  (
  `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `group_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户分组名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户分组表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for yx_user_level
-- ----------------------------
DROP TABLE IF EXISTS `yx_user_level`;
CREATE TABLE `yx_user_level`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT 0 COMMENT '用户uid',
  `level_id` int(11) NOT NULL DEFAULT 0 COMMENT '等级vip',
  `grade` int(11) NOT NULL DEFAULT 0 COMMENT '会员等级',
  `valid_time` int(11) NOT NULL DEFAULT 0 COMMENT '过期时间',
  `is_forever` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否永久',
  `mer_id` int(11) NOT NULL DEFAULT 0 COMMENT '商户id',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0:禁止,1:正常',
  `mark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '备注',
  `remind` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否已通知',
  `is_del` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否删除,0=未删除,1=删除',
  `add_time` int(11) NOT NULL DEFAULT 0 COMMENT '添加时间',
  `discount` int(11) NOT NULL DEFAULT 0 COMMENT '享受折扣',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户等级记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of yx_user_level
-- ----------------------------
INSERT INTO `yx_user_level` VALUES (1, 12, 1, 1, 0, 1, 0, 1, '恭喜你成为了普通会员', 0, 0, 1575728091, 99);

-- ----------------------------
-- Table structure for yx_user_notice
-- ----------------------------
DROP TABLE IF EXISTS `yx_user_notice`;
CREATE TABLE `yx_user_notice`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '接收消息的用户id（类型：json数据）',
  `type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '消息通知类型（1：系统消息；2：用户通知）',
  `user` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '发送人',
  `title` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '通知消息的标题信息',
  `content` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '通知消息的内容',
  `add_time` int(11) NOT NULL DEFAULT 0 COMMENT '通知消息发送的时间',
  `is_send` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否发送（0：未发送；1：已发送）',
  `send_time` int(11) NOT NULL COMMENT '发送时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户通知表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for yx_user_notice_see
-- ----------------------------
DROP TABLE IF EXISTS `yx_user_notice_see`;
CREATE TABLE `yx_user_notice_see`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nid` int(11) NOT NULL DEFAULT 0 COMMENT '查看的通知id',
  `uid` int(11) NOT NULL DEFAULT 0 COMMENT '查看通知的用户id',
  `add_time` int(11) NOT NULL DEFAULT 0 COMMENT '查看通知的时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户通知发送记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for yx_user_recharge
-- ----------------------------
DROP TABLE IF EXISTS `yx_user_recharge`;
CREATE TABLE `yx_user_recharge`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uid` int(10) NULL DEFAULT NULL COMMENT '充值用户UID',
  `order_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单号',
  `price` decimal(8, 2) NULL DEFAULT NULL COMMENT '充值金额',
  `recharge_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '充值类型',
  `paid` tinyint(1) NULL DEFAULT NULL COMMENT '是否充值',
  `pay_time` int(10) NULL DEFAULT NULL COMMENT '充值支付时间',
  `add_time` int(12) NULL DEFAULT NULL COMMENT '充值时间',
  `refund_price` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '退款金额',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `order_id`(`order_id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `recharge_type`(`recharge_type`) USING BTREE,
  INDEX `paid`(`paid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户充值表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for yx_user_sign
-- ----------------------------
DROP TABLE IF EXISTS `yx_user_sign`;
CREATE TABLE `yx_user_sign`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT 0 COMMENT '用户uid',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '签到说明',
  `number` int(11) NOT NULL DEFAULT 0 COMMENT '获得积分',
  `balance` int(11) NOT NULL DEFAULT 0 COMMENT '剩余积分',
  `add_time` int(11) NOT NULL DEFAULT 0 COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '签到记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of yx_user_sign
-- ----------------------------
INSERT INTO `yx_user_sign` VALUES (2, 12, '签到奖励', 10, 0, 1575549244);
INSERT INTO `yx_user_sign` VALUES (3, 12, '签到奖励', 10, 10, 1575684021);
INSERT INTO `yx_user_sign` VALUES (4, 12, '签到奖励', 20, 20, 1575771932);
INSERT INTO `yx_user_sign` VALUES (5, 12, '签到奖励', 10, 40, 1577026465);
INSERT INTO `yx_user_sign` VALUES (6, 12, '签到奖励', 20, 50, 1577099436);

-- ----------------------------
-- Table structure for yx_user_task_finish
-- ----------------------------
DROP TABLE IF EXISTS `yx_user_task_finish`;
CREATE TABLE `yx_user_task_finish`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` int(11) NOT NULL DEFAULT 0 COMMENT '任务id',
  `uid` int(11) NOT NULL DEFAULT 0 COMMENT '用户id',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否有效',
  `add_time` int(11) NOT NULL DEFAULT 0 COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户任务完成记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of yx_user_task_finish
-- ----------------------------
INSERT INTO `yx_user_task_finish` VALUES (1, 2, 12, 0, 1575725509);
INSERT INTO `yx_user_task_finish` VALUES (2, 1, 12, 0, 1575726526);
INSERT INTO `yx_user_task_finish` VALUES (3, 16, 12, 0, 1575726526);
INSERT INTO `yx_user_task_finish` VALUES (4, 17, 12, 0, 1575729673);

-- ----------------------------
-- Table structure for yx_wechat_media
-- ----------------------------
DROP TABLE IF EXISTS `yx_wechat_media`;
CREATE TABLE `yx_wechat_media`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '微信视频音频id',
  `type` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '回复类型',
  `path` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '文件路径',
  `media_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '微信服务器返回的id',
  `url` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '地址',
  `temporary` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否永久或者临时 0永久1临时',
  `add_time` int(10) UNSIGNED NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `type`(`type`, `media_id`) USING BTREE,
  INDEX `type_2`(`type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '微信回复表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for yx_wechat_message
-- ----------------------------
DROP TABLE IF EXISTS `yx_wechat_message`;
CREATE TABLE `yx_wechat_message`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用户行为记录id',
  `openid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户openid',
  `type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '操作类型',
  `result` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '操作详细记录',
  `add_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '操作时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `openid`(`openid`) USING BTREE,
  INDEX `type`(`type`) USING BTREE,
  INDEX `add_time`(`add_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户行为记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for yx_wechat_news_category
-- ----------------------------
DROP TABLE IF EXISTS `yx_wechat_news_category`;
CREATE TABLE `yx_wechat_news_category`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '图文消息管理ID',
  `cate_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图文名称',
  `sort` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态',
  `new_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '文章id',
  `add_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '图文消息管理表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of yx_wechat_news_category
-- ----------------------------
INSERT INTO `yx_wechat_news_category` VALUES (21, '小程序商城前景分析', 0, 1, '51,52,58,59,60', '1565520433');

-- ----------------------------
-- Table structure for yx_wechat_qrcode
-- ----------------------------
DROP TABLE IF EXISTS `yx_wechat_qrcode`;
CREATE TABLE `yx_wechat_qrcode`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '微信二维码ID',
  `third_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '二维码类型',
  `third_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户id',
  `ticket` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '二维码参数',
  `expire_seconds` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '二维码有效时间',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态',
  `add_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '添加时间',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '微信访问url',
  `qrcode_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '微信二维码url',
  `scan` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '被扫的次数',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `third_type`(`third_type`, `third_id`) USING BTREE,
  INDEX `ticket`(`ticket`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '微信二维码管理表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for yx_wechat_reply
-- ----------------------------
DROP TABLE IF EXISTS `yx_wechat_reply`;
CREATE TABLE `yx_wechat_reply`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '微信关键字回复id',
  `key` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '关键字',
  `type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '回复类型',
  `data` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '回复数据',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '0=不可用  1 =可用',
  `hide` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '是否隐藏',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `key`(`key`) USING BTREE,
  INDEX `type`(`type`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  INDEX `hide`(`hide`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '微信关键字回复表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of yx_wechat_reply
-- ----------------------------
INSERT INTO `yx_wechat_reply` VALUES (1, 'subscribe', 'text', '{\"content\":\"2222222222244449999\"}', 1, NULL);

-- ----------------------------
-- Table structure for yx_wechat_template
-- ----------------------------
DROP TABLE IF EXISTS `yx_wechat_template`;
CREATE TABLE `yx_wechat_template`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '模板id',
  `tempkey` char(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '模板编号',
  `name` char(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '模板名',
  `content` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '回复内容',
  `tempid` char(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '模板ID',
  `add_time` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '添加时间',
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `tempkey`(`tempkey`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '微信模板' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of yx_wechat_template
-- ----------------------------
INSERT INTO `yx_wechat_template` VALUES (3, 'OPENTM200565259', '订单发货提醒', '{{first.DATA}}\n订单编号：{{keyword1.DATA}}\n物流公司：{{keyword2.DATA}}\n物流单号：{{keyword3.DATA}}\n{{remark.DATA}}', 'KusKZOFc_4CrRU_gzuXMdMMTfFeR-OLVVuDiMyR5PiM', '1515052638', 1);
INSERT INTO `yx_wechat_template` VALUES (13, 'OPENTM207791277', '订单支付成功通知', '{{first.DATA}}\n订单编号：{{keyword1.DATA}}\n支付金额：{{keyword2.DATA}}\n{{remark.DATA}}', 'hJV1d1OwWB_lbPrSaRHi9RGr5CFAF4PJcZdYeg73Mtg', '1528966759', 1);

-- ----------------------------
-- Table structure for yx_wechat_user
-- ----------------------------
DROP TABLE IF EXISTS `yx_wechat_user`;
CREATE TABLE `yx_wechat_user`  (
  `uid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '微信用户id',
  `unionid` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '只有在用户将公众号绑定到微信开放平台帐号后，才会出现该字段',
  `openid` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户的标识，对当前公众号唯一',
  `routine_openid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '小程序唯一身份ID',
  `nickname` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户的昵称',
  `headimgurl` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户头像',
  `sex` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户的性别，值为1时是男性，值为2时是女性，值为0时是未知',
  `city` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户所在城市',
  `language` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户的语言，简体中文为zh_CN',
  `province` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户所在省份',
  `country` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户所在国家',
  `remark` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公众号运营者对粉丝的备注，公众号运营者可在微信公众平台用户管理界面对粉丝添加备注',
  `groupid` smallint(5) UNSIGNED NULL DEFAULT 0 COMMENT '用户所在的分组ID（兼容旧的用户分组接口）',
  `tagid_list` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户被打上的标签ID列表',
  `subscribe` tinyint(3) UNSIGNED NULL DEFAULT 1 COMMENT '用户是否订阅该公众号标识',
  `subscribe_time` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '关注公众号时间',
  `add_time` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '添加时间',
  `stair` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '一级推荐人',
  `second` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '二级推荐人',
  `order_stair` int(11) NULL DEFAULT NULL COMMENT '一级推荐人订单',
  `order_second` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '二级推荐人订单',
  `now_money` decimal(8, 2) UNSIGNED NULL DEFAULT NULL COMMENT '佣金',
  `session_key` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '小程序用户会话密匙',
  `user_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'wechat' COMMENT '用户类型',
  PRIMARY KEY (`uid`) USING BTREE,
  INDEX `groupid`(`groupid`) USING BTREE,
  INDEX `subscribe_time`(`subscribe_time`) USING BTREE,
  INDEX `add_time`(`add_time`) USING BTREE,
  INDEX `subscribe`(`subscribe`) USING BTREE,
  INDEX `unionid`(`unionid`) USING BTREE,
  INDEX `openid`(`openid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '微信用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of yx_wechat_user
-- ----------------------------
INSERT INTO `yx_wechat_user` VALUES (11, NULL, 'oJzld1Dsvf2Gu-nBQGPNFdjrHdo8', NULL, '会敲代码的喵', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83er0oNIia5bws9DCW1VM9qNbObKU9icwtvMpp7zE534e4Y9gwqR5Izvllladvop0ibpJJg2n6ticNSB9gA/132', 1, '信阳', 'zh_CN', '河南', '中国', NULL, 0, NULL, 0, NULL, 1573120584, NULL, NULL, NULL, NULL, NULL, NULL, 'wechat');

SET FOREIGN_KEY_CHECKS = 1;
