

-- ----------------------------
-- 字段修改
-- ----------------------------
ALTER TABLE yx_store_product ADD COLUMN is_integral  tinyint(1)   ZEROFILL NULL DEFAULT 0 COMMENT '是开启积分兑换' AFTER is_del;

ALTER TABLE yx_store_product ADD COLUMN integral  tinyint(1)   ZEROFILL NULL DEFAULT 0 COMMENT '需要多少积分兑换' AFTER is_integral;

ALTER TABLE yx_store_product_attr_value ADD COLUMN integral INT(10)  DEFAULT 0 COMMENT '需要多少积分兑换' AFTER seckill_price;

ALTER TABLE  yx_store_order ADD COLUMN `pay_integral` decimal(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '支付积分';

-- ----------------------------
-- Table structure for yx_store_canvas
-- ----------------------------
DROP TABLE IF EXISTS `yx_store_canvas`;
CREATE TABLE `yx_store_canvas`  (
                                    `canvas_id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '画布id',
                                    `terminal` tinyint(1) NOT NULL COMMENT '终端 1-小程序 2-H5 3-APP 4-PC',
                                    `json` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '画布json数据',
                                    `type` tinyint(1) DEFAULT 1 COMMENT '类型 1-系统画布 2-自定义页面 3-商家店铺装修',
                                    `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '名称',
                                    `shop_id` bigint(20)  DEFAULT 0 COMMENT '店铺id，当type=3的时候，值为具体的店铺id，其它情况为0',
                                    `create_time` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
                                    `update_time` timestamp(0) NULL DEFAULT NULL COMMENT '修改时间',
                                    `is_del` tinyint(1) NULL DEFAULT NULL COMMENT '删除标识',
                                    PRIMARY KEY (`canvas_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '画布信息表' ROW_FORMAT = DYNAMIC;



