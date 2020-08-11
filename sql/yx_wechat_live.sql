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

 Date: 11/08/2020 11:22:41
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for yx_wechat_live
-- ----------------------------
DROP TABLE IF EXISTS `yx_wechat_live`;
CREATE TABLE `yx_wechat_live`  (
  `roomid` bigint(11) NOT NULL COMMENT '直播间id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '直播间标题',
  `cover_imge` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '背景图',
  `share_imge` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '分享图片',
  `live_status` int(9) NULL DEFAULT NULL COMMENT '直播间状态',
  `start_time` bigint(11) NOT NULL COMMENT '开始时间',
  `end_time` bigint(11) NOT NULL COMMENT '预计结束时间',
  `anchor_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主播昵称',
  `anchor_wechat` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主播微信号',
  `anchor_imge` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主播头像',
  `type` tinyint(1) NOT NULL COMMENT '直播间类型 1：推流 0：手机直播',
  `screen_type` tinyint(1) NOT NULL COMMENT '横屏、竖屏 【1：横屏，0：竖屏】',
  `close_like` tinyint(1) NOT NULL COMMENT '是否关闭点赞 【0：开启，1：关闭】',
  `close_comment` tinyint(1) NOT NULL COMMENT '是否关闭评论 【0：开启，1：关闭】',
  `close_goods` tinyint(1) NOT NULL COMMENT '是否关闭货架 【0：开启，1：关闭】',
  PRIMARY KEY (`roomid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
