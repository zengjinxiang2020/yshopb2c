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

 Date: 11/08/2020 19:07:20
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for yx_wechat_live_goods
-- ----------------------------
DROP TABLE IF EXISTS `yx_wechat_live_goods`;
CREATE TABLE `yx_wechat_live_goods`  (
  `goods_id` bigint(9) NOT NULL COMMENT '直播商品id',
  `product_id` bigint(9) NULL DEFAULT NULL COMMENT '关联商品id',
  `cover_imge_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '商品图片',
  `url` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '商品小程序路径',
  `price_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '价格类型 1：一口价（只需要传入price，price2不传） 2：价格区间（price字段为左边界，price2字段为右边界，price和price2必传） 3：显示折扣价（price字段为原价，price2字段为现价， price和price2必传）',
  `price` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `price2` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '商品名称',
  `third_party_tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '1, 2：表示是为api添加商品，否则是直播控制台添加的商品',
  `audit_id` bigint(20) NULL DEFAULT NULL COMMENT '审核单id',
  `audit_status` int(1) UNSIGNED ZEROFILL NULL DEFAULT NULL COMMENT '审核状态 0：未审核，1：审核中，2:审核通过，3审核失败',
  PRIMARY KEY (`goods_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of yx_wechat_live_goods
-- ----------------------------
INSERT INTO `yx_wechat_live_goods` VALUES (4, 30, 'http://127.0.0.1:8001/file/pic/20200811184905881166.png', 'pages/shop/GoodsCon/index.html?id=30', '1', '200', NULL, '测试商品', NULL, 447126638, NULL);

SET FOREIGN_KEY_CHECKS = 1;
