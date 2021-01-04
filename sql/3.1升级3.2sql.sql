

-- ----------------------------
-- 字段修改
-- ----------------------------
ALTER TABLE yx_store_product ADD COLUMN is_integral  tinyint(1)   ZEROFILL NULL DEFAULT 0 COMMENT '是开启积分兑换' AFTER is_del;

ALTER TABLE yx_store_product ADD COLUMN integral  tinyint(1)   ZEROFILL NULL DEFAULT 0 COMMENT '需要多少积分兑换' AFTER is_integral;

ALTER TABLE yx_store_product_attr_value ADD COLUMN integral INT(10)  DEFAULT 0 COMMENT '需要多少积分兑换' AFTER seckill_price;

ALTER TABLE  yx_store_order ADD COLUMN `pay_integral` decimal(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '支付积分';


