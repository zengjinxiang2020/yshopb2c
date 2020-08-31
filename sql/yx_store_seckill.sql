/*
 Navicat Premium Data Transfer

 Source Server         : 本地
 Source Server Type    : MySQL
 Source Server Version : 50729
 Source Host           : localhost:3306
 Source Schema         : yshopb2c

 Target Server Type    : MySQL
 Target Server Version : 50729
 File Encoding         : 65001

 Date: 31/08/2020 09:21:52
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for yx_store_seckill
-- ----------------------------
DROP TABLE IF EXISTS `yx_store_seckill`;
CREATE TABLE `yx_store_seckill`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '商品秒杀产品表id',
  `product_id` bigint(20) UNSIGNED NOT NULL COMMENT '商品id',
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
  `start_time` date NOT NULL COMMENT '开始时间',
  `stop_time` date NOT NULL COMMENT '结束时间',
  `create_time` datetime(0) NOT NULL COMMENT '添加时间',
  `update_time` datetime(0) NULL DEFAULT NULL,
  `status` tinyint(1) UNSIGNED NOT NULL COMMENT '产品状态',
  `is_postage` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否包邮',
  `is_hot` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '热门推荐',
  `is_del` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除 0未删除1已删除',
  `num` int(11) UNSIGNED NOT NULL COMMENT '最多秒杀几个',
  `is_show` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '显示',
  `time_id` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '时间段id',
  `spec_type` tinyint(1) NULL DEFAULT NULL COMMENT '规格 0单 1多',
  `temp_id` int(10) NULL DEFAULT NULL COMMENT '运费模板id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `product_id`(`product_id`) USING BTREE,
  INDEX `start_time`(`start_time`, `stop_time`) USING BTREE,
  INDEX `is_del`(`is_del`) USING BTREE,
  INDEX `is_hot`(`is_hot`) USING BTREE,
  INDEX `is_show`(`status`) USING BTREE,
  INDEX `add_time`(`create_time`) USING BTREE,
  INDEX `sort`(`sort`) USING BTREE,
  INDEX `is_postage`(`is_postage`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品秒杀产品表' ROW_FORMAT = DYNAMIC;

SET FOREIGN_KEY_CHECKS = 1;
