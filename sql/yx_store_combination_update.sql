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

 Date: 19/08/2020 17:07:08
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for yx_store_combination
-- ----------------------------
DROP TABLE IF EXISTS `yx_store_combination`;
CREATE TABLE `yx_store_combination`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) UNSIGNED NOT NULL COMMENT '商品id',
  `mer_id` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '商户id',
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '推荐图',
  `images` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '轮播图',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '活动标题',
  `attr` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '活动属性',
  `people` int(2) UNSIGNED NOT NULL COMMENT '参团人数',
  `info` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '简介',
  `price` decimal(10, 2) UNSIGNED NOT NULL COMMENT '价格',
  `product_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '商品原价',
  `sort` int(10) UNSIGNED NOT NULL COMMENT '排序',
  `sales` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '销量',
  `stock` int(10) UNSIGNED NOT NULL COMMENT '库存',
  `create_time` datetime(0) NOT NULL COMMENT '添加时间',
  `update_time` datetime(0) NULL DEFAULT NULL,
  `is_host` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '推荐',
  `is_show` tinyint(1) UNSIGNED NOT NULL COMMENT '产品状态',
  `is_del` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `combination` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `mer_use` tinyint(1) UNSIGNED NULL DEFAULT NULL COMMENT '商户是否可用1可用0不可用',
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '拼团内容',
  `start_time` datetime(0) NOT NULL COMMENT '拼团开始时间',
  `stop_time` datetime(0) NOT NULL COMMENT '拼团结束时间',
  `effective_time` int(11) NOT NULL DEFAULT 0 COMMENT '拼团订单有效时间',
  `cost` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '拼图产品成本',
  `browse` int(11) NULL DEFAULT 0 COMMENT '浏览量',
  `unit_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '单位名',
  `spec_type` tinyint(1) NULL DEFAULT NULL COMMENT '规格 0单 1多',
  `temp_id` int(10) NULL DEFAULT NULL COMMENT '运费模板ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '拼团产品表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of yx_store_combination
-- ----------------------------
INSERT INTO `yx_store_combination` VALUES (1, 19, 0, 'https://image.dayouqiantu.cn/5ca011a1cd487.jpg', 'https://image.dayouqiantu.cn/5ca01c7fc9238.jpg,https://image.dayouqiantu.cn/5ca01c7676042.jpg', '70gA4黑白打印复印', NULL, 2, '打印复印资料A4黑白彩色印刷画册书本装订图文数码快印服务', 0.10, 100.00, 1, 55, 94, '2020-06-19 16:55:51', '2020-06-25 23:00:45', 1, 1, 0, 1, 0, '1577289600', '2020-06-19 16:55:21', '2020-07-01 16:55:25', 10, 1, 1, '张', NULL, NULL);
INSERT INTO `yx_store_combination` VALUES (2, 24, 0, 'https://image.dayouqiantu.cn/5ca011a1cd487.jpg', 'https://image.dayouqiantu.cn/5ca011a1cd487.jpg', '彩色打印', NULL, 1, '彩色打印', 0.00, NULL, 0, 10, 10, '2020-06-25 23:02:07', NULL, 1, 1, 0, 1, NULL, '<p>彩色打印</p>', '2020-06-25 23:01:21', '2020-06-30 00:00:00', 24, 0, 0, '张', NULL, NULL);
INSERT INTO `yx_store_combination` VALUES (3, 29, 0, 'https://image.dayouqiantu.cn/5ca0786c5d2c1.jpg', 'https://image.dayouqiantu.cn/5ca0786c5d2c1.jpg,https://image.dayouqiantu.cn/5ca081af6183f.jpg', '喷绘写真', NULL, 1, '喷绘写真', 0.00, NULL, 0, 0, 331, '2020-07-05 12:23:41', NULL, 1, 1, 0, 1, NULL, '<p>喷绘写真</p>', '2020-07-05 12:23:19', '2020-07-29 00:00:00', 24, 0, 0, '平方', NULL, NULL);
INSERT INTO `yx_store_combination` VALUES (4, 29, 0, 'https://image.dayouqiantu.cn/5ca0786c5d2c1.jpg', 'https://image.dayouqiantu.cn/5ca0786c5d2c1.jpg,https://image.dayouqiantu.cn/5ca081af6183f.jpg', 'qwewq', NULL, 3, 'eqweq', 7.00, NULL, 0, 13, 318, '2020-08-19 15:00:28', NULL, 0, 1, 0, 1, NULL, '<p>测试拼团</p><p><img src=\"http://127.0.0.1:8001/file/pic/20200811184905881166.png\"/></p>', '2020-08-19 14:49:36', '2020-08-28 00:00:00', 33, 0, 0, 'weqweqw', 1, NULL);

-- ----------------------------
-- Table structure for yx_store_product_attr_value
-- ----------------------------
DROP TABLE IF EXISTS `yx_store_product_attr_value`;
CREATE TABLE `yx_store_product_attr_value`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) UNSIGNED NOT NULL COMMENT '商品ID',
  `sku` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品属性索引值 (attr_value|attr_value[|....])',
  `stock` int(10) UNSIGNED NOT NULL COMMENT '属性对应的库存',
  `sales` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '销量',
  `price` decimal(8, 2) UNSIGNED NOT NULL COMMENT '属性金额',
  `image` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片',
  `unique` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '唯一值',
  `cost` decimal(8, 2) UNSIGNED NOT NULL COMMENT '成本价',
  `bar_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品条码',
  `ot_price` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '原价',
  `weight` decimal(8, 2) NOT NULL DEFAULT 0.00 COMMENT '重量',
  `volume` decimal(8, 2) NOT NULL DEFAULT 0.00 COMMENT '体积',
  `brokerage` decimal(8, 2) NOT NULL DEFAULT 0.00 COMMENT '一级返佣',
  `brokerage_two` decimal(8, 2) NOT NULL DEFAULT 0.00 COMMENT '二级返佣',
  `pink_price` decimal(8, 2) NULL DEFAULT NULL COMMENT '拼团价',
  `pink_stock` int(10) NULL DEFAULT NULL COMMENT '拼团库存',
  `seckill_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '秒杀价',
  `seckill_stock` int(10) NULL DEFAULT NULL COMMENT '秒杀库存',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique`(`unique`, `sku`) USING BTREE,
  INDEX `store_id`(`product_id`, `sku`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 76 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品属性值表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of yx_store_product_attr_value
-- ----------------------------
INSERT INTO `yx_store_product_attr_value` VALUES (58, 28, '默认', 81, 19, 20.00, '', 'cc6bb7e388e54f65838e2635ae9ea0c7', 0.00, '', 0.00, 0.00, 0.00, 2.00, 1.00, NULL, NULL, NULL, NULL);
INSERT INTO `yx_store_product_attr_value` VALUES (60, 30, 'A4,白色', 2997, 0, 100.00, 'http://127.0.0.1:8001/file/pic/20200811184905881166.png', 'e22b36751d804f689c3b8f2890ddebb7', 1.00, '12312313', 200.00, 12.00, 12.00, 0.00, 0.00, NULL, NULL, NULL, NULL);
INSERT INTO `yx_store_product_attr_value` VALUES (61, 30, 'A4,红色', 0, 0, 0.00, 'http://127.0.0.1:8001/file/pic/20200811184905881166.png', '73aaf055b62543159f34a63b5ba08d12', 0.00, '', 0.00, 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL);
INSERT INTO `yx_store_product_attr_value` VALUES (62, 30, 'A3,白色', 0, 0, 0.00, 'http://127.0.0.1:8001/file/pic/20200811184905881166.png', '2f35645a0e5e4cc2aa852347a76ad8a9', 0.00, '', 0.00, 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL);
INSERT INTO `yx_store_product_attr_value` VALUES (63, 30, 'A3,红色', 0, 0, 0.00, 'http://127.0.0.1:8001/file/pic/20200811184905881166.png', '9b0ba66b83b1423a8bf54332513ba1fa', 0.00, '', 0.00, 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL);
INSERT INTO `yx_store_product_attr_value` VALUES (72, 29, 'A4,白色', 87, 0, 10.00, 'https://image.dayouqiantu.cn/5ca0786c5d2c1.jpg', 'de1c221ef2a447e3b507cd095b17d76e', 0.00, '', 10.00, 0.00, 0.00, 1.00, 1.00, NULL, NULL, NULL, NULL);
INSERT INTO `yx_store_product_attr_value` VALUES (73, 29, 'A4,红色', 88, 0, 9.00, 'https://image.dayouqiantu.cn/5ca0786c5d2c1.jpg', '55b272f734ab4572bd085c456a54eb32', 0.00, '', 10.00, 0.00, 0.00, 1.00, 1.00, NULL, NULL, NULL, NULL);
INSERT INTO `yx_store_product_attr_value` VALUES (74, 29, 'A3,白色', 77, 0, 8.00, 'https://image.dayouqiantu.cn/5ca0786c5d2c1.jpg', '560be687e9b942c4adb9cf83c2fa158e', 0.00, '', 10.00, 0.00, 0.00, 1.00, 1.00, NULL, NULL, NULL, NULL);
INSERT INTO `yx_store_product_attr_value` VALUES (75, 29, 'A3,红色', 66, 0, 7.00, 'https://image.dayouqiantu.cn/5ca0786c5d2c1.jpg', '2fdd28d9c98f4e2f9406ed56e81df7c5', 0.00, '', 10.00, 0.00, 0.00, 1.00, 1.00, NULL, NULL, NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;

-- 菜单
INSERT INTO `menu` VALUES (244, b'0', '拼团商品添加', 'activity/combination/form', 63, 999, NULL, 'combinationAdd', b'0', b'1', 'CombinationAdd', '2020-08-13 21:28:45', 'YXSTORECOMBINATION_EDIT', 1, '2020-08-13 21:31:26', 0);
INSERT INTO `menu` VALUES (245, b'0', '拼团商品修改', 'activity/combination/form', 63, 3, 'anq', 'combinationEdit/:id', b'0', b'1', 'CombinationEdit', '2019-12-24 13:02:23', 'YXSTORECOMBINATION_EDIT', 1, '2020-07-10 16:45:33', 0);

-- 菜单角色的关系
INSERT INTO `roles_menus` VALUES (244, 1);
INSERT INTO `roles_menus` VALUES (245, 1);
