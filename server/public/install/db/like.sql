SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for yx_account_log
-- ----------------------------
DROP TABLE IF EXISTS `yx_account_log`;
CREATE TABLE `yx_account_log`  (
                                `id` int(11) NOT NULL AUTO_INCREMENT,
                                `log_sn` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '流水单号（20位）',
                                `user_id` int(11) NOT NULL COMMENT '用户id',
                                `source_type` smallint(5) UNSIGNED NOT NULL DEFAULT 100 COMMENT '来源类型',
                                `source_id` int(11) UNSIGNED NULL DEFAULT 0 COMMENT '来源id',
                                `source_sn` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '来源单号',
                                `change_amount` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '变动总数',
                                `left_amount` decimal(10, 2) UNSIGNED NULL DEFAULT 0.00 COMMENT '剩余总数',
                                `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '说明',
                                `extra` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '额外的字段说明',
                                `change_type` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '1-增加；2-减少',
                                `create_time` int(10) UNSIGNED NOT NULL COMMENT '变动时间',
                                PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT = '会员账户流水记录表';

-- ----------------------------
-- Table structure for yx_activity_area
-- ----------------------------
DROP TABLE IF EXISTS `yx_activity_area`;
CREATE TABLE `yx_activity_area`  (
                                    `id` int(10) NOT NULL AUTO_INCREMENT,
                                    `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '活动名称',
                                    `title` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '活动副标题',
                                    `image` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '活动图片',
                                    `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '上下架：1-是；0-否',
                                    `create_time` int(10) NOT NULL COMMENT '创建时间',
                                    `update_time` int(10) NULL DEFAULT NULL COMMENT '更新时间',
                                    `del` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否删除：1-是；0-否',
                                    PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT = '活动区域表';

-- ----------------------------
-- Table structure for yx_activity_goods
-- ----------------------------
DROP TABLE IF EXISTS `yx_activity_goods`;
CREATE TABLE `yx_activity_goods`  (
                                    `id` int(10) NOT NULL AUTO_INCREMENT,
                                    `activity_id` int(1) NOT NULL COMMENT '活动id',
                                    `goods_id` int(11) NOT NULL COMMENT '商品id',
                                    `item_id` int(11) NOT NULL COMMENT '规格id',
                                    `create_time` int(10) NOT NULL COMMENT '创建时间',
                                    `update_time` int(10) NULL DEFAULT NULL COMMENT '更新时间',
                                    `del` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否删除：1-是；0-否',
                                    PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT = '活动区域商品表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for yx_ad
-- ----------------------------
DROP TABLE IF EXISTS `yx_ad`;
CREATE TABLE `yx_ad`  (
                        `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '广告id',
                        `name` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '广告标题',
                        `pid` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '广告位置ID',
                        `client` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '终端,1-H5,2-小程序,3-APP',
                        `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图片地址',
                        `link_type` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '链接类型：0-为空；1-商场页面；2-商品页面；3-自定义类型',
                        `link` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '链接地址：ad_type为1时，保存商品页面路径id；ad_type为2时，保存商品id；ad_type为3时，保存自定义链接',
                        `status` tinyint(1) UNSIGNED NULL DEFAULT NULL COMMENT '广告状态：1-开启；0-关闭',
                        `start_time` int(10) NULL DEFAULT 0 COMMENT '投放时间',
                        `end_time` int(10) NULL DEFAULT 0 COMMENT '结束时间',
                        `sort` smallint(6) NULL DEFAULT 50 COMMENT '排序',
                        `create_time` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '添加时间',
                        `update_time` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '更新时间',
                        `del` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '0为非删除状态，非0位删除时间',
                        PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT = '广告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for yx_ad_position
-- ----------------------------
DROP TABLE IF EXISTS `yx_ad_position`;
CREATE TABLE `yx_ad_position`  (
                                `id` int(3) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
                                `name` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '广告位置名称',
                                `attr` tinyint(2) NOT NULL COMMENT '广告位属性,1-系统默认,0-自定义',
                                `client` tinyint(3) UNSIGNED NOT NULL COMMENT '终端,1-小程序,2-H5,3-APP',
                                `width` smallint(5) UNSIGNED NULL DEFAULT 0 COMMENT '广告位建议宽度',
                                `height` smallint(5) UNSIGNED NULL DEFAULT 0 COMMENT '广告位建议高度',
                                `desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '广告描述',
                                `status` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '1上架,0下架',
                                `create_time` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '添加时间',
                                `update_time` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '更新时间',
                                `del` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否删除,0-未删除,1-已删除',
                                PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT = '广告位置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for yx_admin
-- ----------------------------
DROP TABLE IF EXISTS `yx_admin`;
CREATE TABLE `yx_admin`  (
                            `id` int(11) NOT NULL AUTO_INCREMENT,
                            `root` tinyint(1) NULL DEFAULT 1 COMMENT '0-非超级管理员；1-超级管理；',
                            `name` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '名称',
                            `type` tinyint(4) NULL DEFAULT 0 COMMENT '账号类型：0-默认管理后台；其他根据业务再定',
                            `account` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '账号',
                            `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
                            `salt` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '密码盐',
                            `role_id` int(11) NOT NULL DEFAULT 0 COMMENT '角色id',
                            `create_time` int(10) NULL DEFAULT NULL COMMENT '创建时间',
                            `update_time` int(10) NULL DEFAULT NULL COMMENT '修改时间',
                            `login_time` int(10) NULL DEFAULT NULL COMMENT '最后登录时间',
                            `login_ip` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '最后登录ip',
                            `disable` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否禁用：0-否；1-是；',
                            `del` tinyint(10) NOT NULL DEFAULT 0 COMMENT '0为非删除状态，非0位删除时间',
                            PRIMARY KEY (`id`) USING BTREE,
                            UNIQUE INDEX `account`(`account`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT = '后台管理员表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for yx_after_sale
-- ----------------------------
DROP TABLE IF EXISTS `yx_after_sale`;
CREATE TABLE `yx_after_sale`  (
                                `id` int(10) NOT NULL AUTO_INCREMENT,
                                `sn` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '退款单号',
                                `user_id` int(10) NOT NULL COMMENT '用户id',
                                `order_id` int(10) NULL DEFAULT NULL COMMENT '订单id',
                                `order_goods_id` int(10) NULL DEFAULT NULL COMMENT '订单商品关联表id',
                                `goods_id` int(10) NULL DEFAULT NULL COMMENT '商品id',
                                `item_id` int(10) NULL DEFAULT 0 COMMENT '规格id',
                                `goods_num` int(10) NULL DEFAULT NULL COMMENT '商品数量',
                                `refund_reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '退款原因',
                                `refund_remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '退款说明',
                                `refund_image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '退款图片',
                                `refund_type` tinyint(1) NULL DEFAULT NULL COMMENT '退款类型;0-仅退款;1-退款退货',
                                `refund_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '退款金额',
                                `express_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '快递公司名称',
                                `invoice_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '快递单号',
                                `express_remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物流备注说明',
                                `express_image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物流凭证',
                                `confirm_take_time` int(10) NULL DEFAULT NULL COMMENT '确认收货时间',
                                `status` tinyint(1) NULL DEFAULT 0 COMMENT '售后状态;0-申请退款;1-商家拒绝;2-商品待退货;3-商家待收货;4-商家拒收货;5-等待退款;6-退款成功',
                                `audit_time` int(10) NULL DEFAULT NULL COMMENT '审核时间',
                                `admin_id` int(10) NULL DEFAULT NULL COMMENT '门店管理员id',
                                `admin_remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '售后说明',
                                `create_time` int(10) NULL DEFAULT NULL COMMENT '创建时间',
                                `update_time` int(10) NULL DEFAULT NULL COMMENT '更新时间',
                                `del` tinyint(1) NULL DEFAULT 0 COMMENT '撤销状态;0-正常;1-已撤销',
                                PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT = '售后表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for yx_after_sale_log
-- ----------------------------
DROP TABLE IF EXISTS `yx_after_sale_log`;
CREATE TABLE `yx_after_sale_log`  (
                                    `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'id',
                                    `type` tinyint(1) NULL DEFAULT 0 COMMENT '操作类型;0-会员;1-门店',
                                    `channel` smallint(5) UNSIGNED NULL DEFAULT 0 COMMENT '渠道编号。变动方式。',
                                    `order_id` int(10) NULL DEFAULT NULL COMMENT '订单id',
                                    `after_sale_id` int(11) NULL DEFAULT NULL COMMENT '售后订单id',
                                    `handle_id` int(10) NULL DEFAULT NULL COMMENT '操作人id',
                                    `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日志内容',
                                    `create_time` int(10) NULL DEFAULT NULL COMMENT '创建时间',
                                    PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT = '售后日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for yx_article
-- ----------------------------
DROP TABLE IF EXISTS `yx_article`;
CREATE TABLE `yx_article`  (
                            `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '文章id',
                            `cid` int(11) NULL DEFAULT NULL COMMENT '文章分类',
                            `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文章标题',
                            `synopsis` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文字简介',
                            `image` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文章图片',
                            `is_notice` tinyint(1) NULL DEFAULT 0 COMMENT '是否公告:1-是.0-否',
                            `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '文章内容',
                            `visit` int(11) NULL DEFAULT 0 COMMENT '浏览人数',
                            `sort` int(11) NULL DEFAULT 0 COMMENT '排序',
                            `is_show` tinyint(1) NULL DEFAULT 1 COMMENT '是否显示:1-是.0-否',
                            `create_time` int(11) NULL DEFAULT NULL COMMENT '创建时间',
                            `update_time` int(11) NULL DEFAULT NULL COMMENT '更新时间',
                            `del` int(10) NULL DEFAULT 0 COMMENT '删除标志:0-未删除.1;已删除',
                            `likes` int(11) NULL DEFAULT 0 COMMENT '点赞数',
                            PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT = '文章表';

-- ----------------------------
-- Table structure for yx_article_category
-- ----------------------------
DROP TABLE IF EXISTS `yx_article_category`;
CREATE TABLE `yx_article_category`  (
                                    `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '文章分类id',
                                    `name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分类名称',
                                    `sort` tinyint(1) NULL DEFAULT 0 COMMENT '排序',
                                    `is_show` tinyint(1) NULL DEFAULT 1 COMMENT '是否显示:1-是;0-否',
                                    `create_time` int(10) NULL DEFAULT NULL COMMENT '创建时间',
                                    `update_time` int(10) NULL DEFAULT NULL COMMENT '更新时间',
                                    `del` int(10) NULL DEFAULT 0 COMMENT '删除标志:0-未删除.1-已删除',
                                    PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT = '文章分类';

-- ----------------------------
-- Table structure for yx_cart
-- ----------------------------
DROP TABLE IF EXISTS `yx_cart`;
CREATE TABLE `yx_cart`  (
                            `id` int(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '购物车表',
                            `user_id` int(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户id',
                            `goods_id` int(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '商品id',
                            `goods_num` smallint(5) UNSIGNED NULL DEFAULT 0 COMMENT '购买数量',
                            `item_id` int(11) NULL DEFAULT 0 COMMENT '规格ID',
                            `selected` tinyint(1) NULL DEFAULT 1 COMMENT '选中状态;1-选中;0-未选中',
                            `create_time` int(10) NULL DEFAULT NULL COMMENT '创建时间',
                            `update_time` int(10) NULL DEFAULT NULL COMMENT '修改时间',
                            PRIMARY KEY (`id`) USING BTREE,
                            INDEX `user_id`(`user_id`) USING BTREE,
                            INDEX `goods_id`(`goods_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT = '购物车表';

-- ----------------------------
-- Table structure for yx_config
-- ----------------------------
DROP TABLE IF EXISTS `yx_config`;
CREATE TABLE `yx_config`  (
                            `id` int(11) NOT NULL AUTO_INCREMENT,
                            `type` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型',
                            `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
                            `value` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '值',
                            `update_time` int(10) NULL DEFAULT NULL COMMENT '更新时间',
                            PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT = '配置表';

-- ----------------------------
-- Records of yx_config
-- ----------------------------
BEGIN;
INSERT INTO `yx_config` VALUES (9, 'test', 't1', '3344', 1583131665);
INSERT INTO `yx_config` VALUES (10, 'test', 't2', '33434344', NULL);
INSERT INTO `yx_config` VALUES (11, 'test', 't3', '[1,2,3,4,5]', 1583131896);
INSERT INTO `yx_config` VALUES (14, 'sites', 'name', '344', NULL);
INSERT INTO `yx_config` VALUES (15, 'website', 'name', 'LikeShop管理后台', 1606718581);
INSERT INTO `yx_config` VALUES (17, 'website', 'keyword', '偶偶哦', 1606718581);
INSERT INTO `yx_config` VALUES (18, 'website', 'slogan_status', '1', 1606718581);
INSERT INTO `yx_config` VALUES (19, 'website', 'slogan', '/static/common/image/default/slogan.png', 1606718581);
INSERT INTO `yx_config` VALUES (20, 'website', 'backstage_logo', '/static/common/image/default/backstage_logo.png', 1606718581);
INSERT INTO `yx_config` VALUES (22, 'website', 'admin_title', 'LIKE Shop 后台登录', 1606718581);
INSERT INTO `yx_config` VALUES (24, 'website', 'partner_title', 'LIKE 机构后台登录', 1606718581);
INSERT INTO `yx_config` VALUES (25, 'website', 'user_image', '/static/common/image/default/user.png', 1606718581);
INSERT INTO `yx_config` VALUES (26, 'copyright', 'company_name', '广州好象科技有限公司', 1597671395);
INSERT INTO `yx_config` VALUES (27, 'copyright', 'number', '京ICP证000000号', 1597671395);
INSERT INTO `yx_config` VALUES (28, 'copyright', 'link', 'http://www.beian.gov.cn/portal/index.do', 1597671395);
INSERT INTO `yx_config` VALUES (29, 'mnp', 'name', 'LikeMall', 1603425733);
INSERT INTO `yx_config` VALUES (30, 'mnp', 'original_id', '', 1603425733);
INSERT INTO `yx_config` VALUES (31, 'mnp', 'qr_code', '', 1603425733);
INSERT INTO `yx_config` VALUES (32, 'mnp', 'app_id', 'wx12345678', 1603425733);
INSERT INTO `yx_config` VALUES (33, 'mnp', 'secret', 'wx12345678', 1603425733);
INSERT INTO `yx_config` VALUES (34, 'mnp', 'business_domain', '', 1603425733);
INSERT INTO `yx_config` VALUES (35, 'mnp', 'url', '', 1603425733);
INSERT INTO `yx_config` VALUES (36, 'mnp', 'token', '', 1603425733);
INSERT INTO `yx_config` VALUES (37, 'mnp', 'encoding_ses_key', '', 1603425733);
INSERT INTO `yx_config` VALUES (38, 'mnp', 'encryption_type', '', 1603425733);
INSERT INTO `yx_config` VALUES (39, 'mnp', 'data_type', '', 1603425733);
INSERT INTO `yx_config` VALUES (40, 'trading', 'order_cancel', '1', 1606473342);
INSERT INTO `yx_config` VALUES (41, 'trading', 'order_finish', '7', 1606473343);
INSERT INTO `yx_config` VALUES (42, 'after_sale', 'refund_days', '7', 1606473343);
INSERT INTO `yx_config` VALUES (43, 'trading', 'deduct_type', '1', 1606473343);
INSERT INTO `yx_config` VALUES (44, 'shop', 'contact', '小明', 1606473343);
INSERT INTO `yx_config` VALUES (45, 'shop', 'mobile', '13411003866', 1606473343);
INSERT INTO `yx_config` VALUES (46, 'shop', 'province_id', '440000', 1606473343);
INSERT INTO `yx_config` VALUES (47, 'shop', 'city_id', '440100', 1606473343);
INSERT INTO `yx_config` VALUES (48, 'shop', 'district_id', '440105', 1606473343);
INSERT INTO `yx_config` VALUES (49, 'shop', 'address', '隔壁小区1102', 1606473343);
INSERT INTO `yx_config` VALUES (50, 'sign_rule', 'instructions', '1.每天签到可以获得每天签到奖励；\n2.每日最多可签到1次，断签则会重新计算连签天数，达到连续天数后即可获得连续奖励；\n3.活动以及奖励最终解释权归商家所有。', 1607074260);
INSERT INTO `yx_config` VALUES (51, 'recharge', 'give_integral', '2', 1606704451);
INSERT INTO `yx_config` VALUES (52, 'recharge', 'give_growth', '2', 1606704451);
INSERT INTO `yx_config` VALUES (53, 'recharge', 'min_money', '10', 1606704451);
INSERT INTO `yx_config` VALUES (54, 'oa', 'name', 'LikeShop', 1607071674);
INSERT INTO `yx_config` VALUES (55, 'oa', 'original_id', '', 1607071674);
INSERT INTO `yx_config` VALUES (56, 'oa', 'qr_code', '', 1607071674);
INSERT INTO `yx_config` VALUES (57, 'oa', 'app_id', 'wx688688688', 1607071674);
INSERT INTO `yx_config` VALUES (58, 'oa', 'secret', 'wx688688688', 1607071674);
INSERT INTO `yx_config` VALUES (59, 'oa', 'url', 'http://brboy.wicp.vip/api/wechat/api', 1607071674);
INSERT INTO `yx_config` VALUES (60, 'oa', 'token', '22', 1607071674);
INSERT INTO `yx_config` VALUES (61, 'oa', 'encoding_ses_key', '', 1607071674);
INSERT INTO `yx_config` VALUES (62, 'oa', 'encryption_type', '', 1607071674);
INSERT INTO `yx_config` VALUES (63, 'oa', 'business_domain', '', 1607071674);
INSERT INTO `yx_config` VALUES (64, 'oa', 'safety_domain', '', 1607071674);
INSERT INTO `yx_config` VALUES (65, 'oa', 'auth_domain', '', 1607071674);
INSERT INTO `yx_config` VALUES (66, 'website', 'shop_logo', '/uploads/images/background/20201116/ee6d0c035824f48773f94c3cd69d5e19.png', 1606718581);
INSERT INTO `yx_config` VALUES (67, 'website', 'goods_image', '/static/common/image/default/main.png', 1606718581);
INSERT INTO `yx_config` VALUES (68, 'kd100', 'appkey', '3833C699F50967179307310E67735609', 1605600478);
INSERT INTO `yx_config` VALUES (69, 'kd100', 'appsecret', 'B7EA9CAB2E55AC572E0D3467C1CD1815', 1605600478);
INSERT INTO `yx_config` VALUES (70, 'express', 'way', 'kdniao', 1605600478);
INSERT INTO `yx_config` VALUES (71, 'kdniao', 'appkey', 'test1460925', 1605600478);
INSERT INTO `yx_config` VALUES (72, 'kdniao', 'appsecret', '13af6f20-85e2-4aab-b0ac-81acf8cc4415', 1605600478);
INSERT INTO `yx_config` VALUES (73, 'policy', 'service', '服务协议', 1605687278);
INSERT INTO `yx_config` VALUES (74, 'policy', 'privacy', '隐私政策', 1605687278);
INSERT INTO `yx_config` VALUES (75, 'policy', 'after_sale', '', 1605687278);
INSERT INTO `yx_config` VALUES (76, 'withdraw', 'min_withdraw', '1', 1606361203);
INSERT INTO `yx_config` VALUES (77, 'withdraw', 'max_withdraw', '10', 1606361203);
INSERT INTO `yx_config` VALUES (78, 'withdraw', 'poundage', '10', 1606361203);
INSERT INTO `yx_config` VALUES (79, 'recharge', 'open_racharge', '1', 1606704451);
INSERT INTO `yx_config` VALUES (80, 'distribution', 'is_open', '1', 1606720913);
INSERT INTO `yx_config` VALUES (81, 'distribution', 'member_apply', '1', 1606720913);
INSERT INTO `yx_config` VALUES (83, 'marketing', 'order_award_integral', '20', 1607159785);
INSERT INTO `yx_config` VALUES (84, 'marketing', 'invited_award_integral', '2', NULL);
INSERT INTO `yx_config` VALUES (85, 'marketing', 'register_award_integral', '2', 1607074871);
INSERT INTO `yx_config` VALUES (86, 'marketing', 'register_award_coupon', '4', 1607074871);
INSERT INTO `yx_config` VALUES (93, 'marketing', 'register_award_integral_status', '0', 1607074871);
INSERT INTO `yx_config` VALUES (94, 'marketing', 'register_award_coupon_status', '1', 1607074871);
COMMIT;

-- ----------------------------
-- Table structure for yx_coupon
-- ----------------------------
DROP TABLE IF EXISTS `yx_coupon`;
CREATE TABLE `yx_coupon`  (
                            `id` int(11) NOT NULL AUTO_INCREMENT,
                            `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '优惠券名称',
                            `send_time_start` int(10) NOT NULL COMMENT '发放开始时间',
                            `send_time_end` int(10) NOT NULL COMMENT '发放结束时间',
                            `money` decimal(10, 2) NOT NULL COMMENT '优惠券面额(元)',
                            `condition_type` tinyint(1) NULL DEFAULT NULL COMMENT '使用条件类型：1-无门槛；2-订单满足金额',
                            `condition_money` decimal(10, 2) NULL DEFAULT NULL COMMENT '使用条件类型为2时：该字段为订单满足金额可使用',
                            `send_total_type` tinyint(1) NULL DEFAULT NULL COMMENT '发送总量类型：1-不限制；2-限制张数',
                            `send_total` int(10) NULL DEFAULT NULL COMMENT '发送总量类型为2时：该字段为限制的张数',
                            `use_time_type` tinyint(1) NULL DEFAULT NULL COMMENT '用券时间类型：1-固定时间；2-领券当天起；3-领券次日起',
                            `use_time_start` int(10) NULL DEFAULT NULL COMMENT '用券时间类型为1时：该字段为使用开始时间；',
                            `use_time_end` int(10) NULL DEFAULT NULL COMMENT '用券时间类型为1时：该字段为使用结束时间；',
                            `use_time` int(10) NULL DEFAULT NULL COMMENT '用券时间类型为2、3时：该字段为多少天内可用；',
                            `get_type` tinyint(1) NULL DEFAULT NULL COMMENT '领取类型：1-直接领取；2-平台赠送；3-活动赠送',
                            `get_num_type` tinyint(1) NULL DEFAULT NULL COMMENT '领取次数类型：1-不限制领取传次数；2-限制次数；3-每天限制数量',
                            `get_num` int(10) NULL DEFAULT NULL COMMENT '领取次数类型为：2、3时：该字段为领取限制的数量',
                            `use_goods_type` tinyint(1) NULL DEFAULT NULL COMMENT '适用商品类型:1-全部商品；2-指定商品；3-指定商品不可用',
                            `status` tinyint(255) NOT NULL DEFAULT 0 COMMENT '优惠券状态：1-进行中；0-关闭',
                            `create_time` int(10) NULL DEFAULT NULL COMMENT '创建时间',
                            `update_time` int(10) NULL DEFAULT NULL COMMENT '更新时间',
                            `del` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否删除；1-是；0-否',
                            PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT = '优惠券表';

-- ----------------------------
-- Table structure for yx_coupon_goods
-- ----------------------------
DROP TABLE IF EXISTS `yx_coupon_goods`;
CREATE TABLE `yx_coupon_goods`  (
                                `id` int(11) NOT NULL AUTO_INCREMENT,
                                `coupon_id` int(10) NOT NULL COMMENT '优惠券id',
                                `goods_id` int(10) NOT NULL COMMENT '商品id',
                                `create_time` int(10) NOT NULL COMMENT '创建时间',
                                PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT = '优惠券商品管理表';

-- ----------------------------
-- Table structure for yx_coupon_list
-- ----------------------------
DROP TABLE IF EXISTS `yx_coupon_list`;
CREATE TABLE `yx_coupon_list`  (
                                `id` int(10) NOT NULL AUTO_INCREMENT,
                                `user_id` int(10) NOT NULL COMMENT '用户id',
                                `coupon_id` int(10) NOT NULL COMMENT '优惠券id',
                                `coupon_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '优惠券券码',
                                `status` tinyint(1) NULL DEFAULT NULL COMMENT '状态；0-未使用;1-已使用',
                                `order_id` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '优惠券使用的订单id',
                                `use_time` int(10) NULL DEFAULT NULL COMMENT '使用时间',
                                `create_time` int(10) NOT NULL COMMENT '创建时间',
                                `update_time` int(10) NULL DEFAULT NULL COMMENT '更新时间',
                                `del` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否删除;1-是；0-否',
                                PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT = '用户优惠券';

-- ----------------------------
-- Table structure for yx_delivery
-- ----------------------------
DROP TABLE IF EXISTS `yx_delivery`;
CREATE TABLE `yx_delivery`  (
                                `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '发货单ID',
                                `order_id` int(11) UNSIGNED NOT NULL COMMENT '订单ID',
                                `order_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '订单编号',
                                `user_id` int(11) UNSIGNED NOT NULL COMMENT '用户ID',
                                `admin_id` int(11) UNSIGNED NULL DEFAULT 0 COMMENT '管理员ID',
                                `consignee` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '收货人',
                                `mobile` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '联系手机',
                                `province` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '省ID',
                                `city` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '市ID',
                                `district` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '区ID',
                                `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '地址',
                                `shipping_status` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '发货状态;0-未发货;1-已发货',
                                `shipping_id` int(10) NULL DEFAULT NULL COMMENT '物流公司id',
                                `shipping_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '快递名称',
                                `invoice_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '物流单号',
                                `send_type` tinyint(1) NULL DEFAULT 0 COMMENT '配送方式:1-快递配送;2-无需快递',
                                `create_time` int(11) NOT NULL COMMENT '创建时间',
                                `del` tinyint(1) NULL DEFAULT 0 COMMENT '是否删除',
                                PRIMARY KEY (`id`) USING BTREE,
                                INDEX `order_id`(`order_id`) USING BTREE,
                                INDEX `user_id`(`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT = '发货单表';

-- ----------------------------
-- Table structure for yx_dev_auth
-- ----------------------------
DROP TABLE IF EXISTS `yx_dev_auth`;
CREATE TABLE `yx_dev_auth`  (
                            `id` int(4) NOT NULL AUTO_INCREMENT,
                            `type` tinyint(1) NULL DEFAULT 1 COMMENT '1-菜单；2-权限',
                            `system` tinyint(1) NULL DEFAULT 0 COMMENT '是否为系统级菜单',
                            `pid` int(4) NOT NULL DEFAULT 0 COMMENT '分级id',
                            `name` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
                            `icon` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图标',
                            `uri` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '后台uri',
                            `sort` int(4) NULL DEFAULT 50 COMMENT '排序',
                            `disable` tinyint(1) NULL DEFAULT 0 COMMENT '状态：0-启用；1-禁用；',
                            `create_time` int(10) NULL DEFAULT NULL COMMENT '创建时间',
                            `update_time` int(10) NULL DEFAULT NULL COMMENT '修改时间',
                            `del` tinyint(10) NOT NULL DEFAULT 0 COMMENT '0为非删除状态，非0位删除时间',
                            `partner_id` int(11) NOT NULL DEFAULT 0 COMMENT '机构id',
                            PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT = '菜单表';

-- ----------------------------
-- Records of b2b2c_dev_auth
-- ----------------------------
BEGIN;
INSERT INTO `yx_dev_auth` VALUES (1, 1, 0, 18, '权限管理', 'layui-icon-auz', '', 50, 0, 1597593692, 1597636523, 0, 0);
INSERT INTO `yx_dev_auth` VALUES (2, 1, 0, 1, '菜单权限', 'layui-icon-align-left', 'auth/lists', 50, 0, 1597593762, 1597636524, 0, 0);
INSERT INTO `yx_dev_auth` VALUES (3, 2, 0, 2, '添加菜单', '', 'auth/add', 50, 0, 1597593846, 1597636533, 0, 0);
INSERT INTO `yx_dev_auth` VALUES (4, 2, 0, 2, '编辑菜单', '', 'auth/edit', 50, 0, 1597593909, 1597636533, 0, 0);
INSERT INTO `yx_dev_auth` VALUES (5, 2, 0, 2, '删除', '', 'auth/del', 50, 0, 1597594342, NULL, 0, 0);
INSERT INTO `yx_dev_auth` VALUES (6, 1, 0, 1, '管理员', 'layui-icon-username', 'admin/lists', 51, 0, 1597594526, 1597636523, 0, 0);
INSERT INTO `yx_dev_auth` VALUES (7, 2, 0, 6, '添加管理员', '', 'admin/add', 50, 0, 1597594556, NULL, 0, 0);
INSERT INTO `yx_dev_auth` VALUES (8, 2, 0, 6, '编辑管理员', '', 'admin/edit', 50, 0, 1597594595, 1597594610, 0, 0);
INSERT INTO `yx_dev_auth` VALUES (9, 2, 0, 6, '删除管理员', '', 'admin/del', 50, 0, 1597594639, NULL, 0, 0);
INSERT INTO `yx_dev_auth` VALUES (10, 1, 0, 1, '角色', 'layui-icon-friends', 'role/lists', 50, 0, 1597596178, 1597635420, 0, 0);
INSERT INTO `yx_dev_auth` VALUES (12, 2, 0, 6, '管理员列表', '', 'admin/lists', 51, 0, 1597631850, 1597636529, 0, 0);
INSERT INTO `yx_dev_auth` VALUES (13, 2, 0, 2, '菜单列表', '', 'menu/lists', 51, 0, 1597632028, 1597632039, 0, 0);
INSERT INTO `yx_dev_auth` VALUES (14, 2, 0, 10, '角色列表', '', 'role/lists', 50, 0, 1597632555, NULL, 0, 0);
INSERT INTO `yx_dev_auth` VALUES (15, 2, 0, 10, '添加角色', '', 'role/add', 50, 0, 1597632944, NULL, 0, 0);
INSERT INTO `yx_dev_auth` VALUES (16, 2, 0, 10, '编辑角色', '', 'role/edit', 50, 0, 1597632999, NULL, 0, 0);
INSERT INTO `yx_dev_auth` VALUES (17, 1, 0, 18, '基础设置', 'layui-icon-set-sm', '', 50, 0, 1597633276, 1597636706, 0, 0);
INSERT INTO `yx_dev_auth` VALUES (18, 1, 0, 0, '设置', 'layui-icon-set', '', 9, 0, 1597633295, 1606449769, 0, 0);
INSERT INTO `yx_dev_auth` VALUES (19, 1, 0, 0, '个人中心', 'layui-icon-friends', 'my/password', 110, 0, 1597633558, 1606448962, 0, 0);
INSERT INTO `yx_dev_auth` VALUES (20, 1, 0, 19, '修改密码', '', 'my/password', 100, 0, 1597633582, 1606442853, 0, 0);
INSERT INTO `yx_dev_auth` VALUES (21, 1, 0, 17, '网站设置', 'layui-icon-website', 'basic/website', 50, 0, 1597658026, NULL, 0, 0);
INSERT INTO `yx_dev_auth` VALUES (22, 1, 0, 17, '版权备案', 'layui-icon-ok-circle', 'basic/copyright', 50, 0, 1597658101, NULL, 0, 0);
INSERT INTO `yx_dev_auth` VALUES (23, 2, 0, 21, '查看网站设置', '', 'basic/copyright', 51, 0, 1597658275, 1597663235, 0, 0);
INSERT INTO `yx_dev_auth` VALUES (24, 2, 0, 21, '修改网站设置', '', 'basic/setWebsite', 50, 0, 1597663008, NULL, 0, 0);
INSERT INTO `yx_dev_auth` VALUES (25, 2, 0, 22, '查看版权备案', '', 'basic/copyright', 51, 0, 1597663176, 1597663223, 0, 0);
INSERT INTO `yx_dev_auth` VALUES (26, 2, 0, 22, '修改版权备案', '', 'basic/setCopyright', 50, 0, 1597663205, NULL, 0, 0);
INSERT INTO `yx_dev_auth` VALUES (27, 2, 0, 2, '设置菜单权限状态', '', 'auth/status', 50, 0, 1597663631, NULL, 0, 0);
INSERT INTO `yx_dev_auth` VALUES (28, 2, 0, 20, '修改密码', '', 'my/password', 50, 0, 1597668756, NULL, 0, 0);
INSERT INTO `yx_dev_auth` VALUES (29, 1, 0, 0, '商品', 'layui-icon-cart-simple', '', 90, 0, 1602555146, 1606449000, 0, 0);
INSERT INTO `yx_dev_auth` VALUES (30, 1, 0, 29, '品牌管理', 'layui-icon-rate', 'goodsBrand/lists', 50, 0, 1602555190, NULL, 0, 0);
INSERT INTO `yx_dev_auth` VALUES (31, 1, 0, 29, '分类管理', 'layui-icon-app', 'goodsCategory/lists', 50, 0, 1602555225, NULL, 0, 0);
INSERT INTO `yx_dev_auth` VALUES (32, 1, 0, 29, '供货商', '', 'supplier/lists', 50, 0, 1602559943, NULL, 0, 0);
INSERT INTO `yx_dev_auth` VALUES (33, 1, 0, 0, '会员', 'layui-icon-username', '', 80, 0, 1602570345, 1606449026, 0, 0);
INSERT INTO `yx_dev_auth` VALUES (34, 1, 0, 33, '会员管理', 'layui-icon-user', 'user/lists', 50, 0, 1602570372, 1605522382, 0, 0);
INSERT INTO `yx_dev_auth` VALUES (37, 1, 0, 0, '订单', 'layui-icon-notice', '', 100, 0, 1602576261, 1606448979, 0, 0);
INSERT INTO `yx_dev_auth` VALUES (38, 1, 0, 37, '订单列表', 'layui-icon-cart-simple', 'order/lists', 50, 0, 1602576521, 1605522434, 0, 0);
INSERT INTO `yx_dev_auth` VALUES (41, 1, 0, 29, '商品评价', '', 'goodsComment/lists', 50, 0, 1602647268, NULL, 0, 0);
INSERT INTO `yx_dev_auth` VALUES (42, 1, 0, 18, '配送设置', '', '', 50, 0, 1602665749, 1602666084, 1, 0);
INSERT INTO `yx_dev_auth` VALUES (43, 1, 0, 56, '配送管理', '', 'freight/lists', 50, 0, 1602666008, 1603525668, 0, 0);
INSERT INTO `yx_dev_auth` VALUES (44, 1, 0, 29, '商品管理', 'layui-icon-cart-simple', 'goods/lists', 50, 0, 1603159926, NULL, 0, 0);
INSERT INTO `yx_dev_auth` VALUES (45, 1, 0, 37, '售后退款', 'layui-icon-rmb', 'afterSale/lists', 50, 0, 1603160367, 1605522422, 0, 0);
INSERT INTO `yx_dev_auth` VALUES (46, 1, 0, 0, '系统维护', 'layui-icon-util', '', 8, 0, 1603176542, 1606449787, 0, 0);
INSERT INTO `yx_dev_auth` VALUES (47, 1, 0, 46, '系统日志', '', '', 49, 0, 1603176576, NULL, 0, 0);
INSERT INTO `yx_dev_auth` VALUES (48, 1, 0, 39, '优惠券', 'layui-icon-theme', 'coupon/lists', 50, 0, 1603338116, NULL, 0, 0);
INSERT INTO `yx_dev_auth` VALUES (49, 1, 0, 0, '微信', 'layui-icon-login-wechat', '', 30, 0, 1603417725, 1606449600, 0, 0);
INSERT INTO `yx_dev_auth` VALUES (50, 1, 0, 49, '微信公众号', 'layui-icon-senior', '', 50, 0, 1603417748, 1603417842, 0, 0);
INSERT INTO `yx_dev_auth` VALUES (51, 1, 0, 50, '公众号设置', '', 'oa/setoa', 50, 0, 1603417764, NULL, 0, 0);
INSERT INTO `yx_dev_auth` VALUES (52, 1, 0, 50, '菜单管理', '', 'oa/oamenu', 50, 0, 1603417789, NULL, 0, 0);
INSERT INTO `yx_dev_auth` VALUES (53, 1, 0, 49, '微信小程序', 'layui-icon-cellphone', '', 50, 0, 1603417800, 1603417852, 0, 0);
INSERT INTO `yx_dev_auth` VALUES (54, 1, 0, 53, '小程序设置', '', 'mnp/setmnp', 50, 0, 1603417818, NULL, 0, 0);
INSERT INTO `yx_dev_auth` VALUES (55, 1, 0, 39, '会员充值', 'layui-icon-add-circle', 'Recharge/lists', 50, 0, 1603511580, 1606963083, 0, 0);
INSERT INTO `yx_dev_auth` VALUES (56, 1, 0, 18, '商城设置', '', '', 50, 0, 1603524640, NULL, 0, 0);
INSERT INTO `yx_dev_auth` VALUES (57, 1, 0, 56, '交易设置', '', 'shopSetting/trading', 50, 0, 1603524686, NULL, 0, 0);
INSERT INTO `yx_dev_auth` VALUES (58, 1, 0, 56, '政策协议', '', 'shopSetting/policy', 50, 0, 1603524707, NULL, 0, 0);
INSERT INTO `yx_dev_auth` VALUES (59, 1, 0, 17, '支付设置', '', 'payConfig/lists', 50, 0, 1603779401, NULL, 0, 0);
INSERT INTO `yx_dev_auth` VALUES (60, 2, 0, 59, '支付设置列表', '', 'payConfig/lists', 50, 0, 1603779630, NULL, 0, 0);
INSERT INTO `yx_dev_auth` VALUES (61, 2, 0, 59, '编辑余额支付', '', 'payConfig/editBalance', 50, 0, 1603779649, NULL, 0, 0);
INSERT INTO `yx_dev_auth` VALUES (62, 2, 0, 59, '编辑公众号', '', 'payConfig/editOfficial', 50, 0, 1603779679, NULL, 0, 0);
INSERT INTO `yx_dev_auth` VALUES (63, 2, 0, 59, '编辑小程序', '', 'payConfig/editApplet', 50, 0, 1603779768, NULL, 0, 0);
INSERT INTO `yx_dev_auth` VALUES (64, 2, 0, 59, '编辑支付宝', '', 'payConfig/editAlipay', 50, 0, 1603779802, NULL, 0, 0);
INSERT INTO `yx_dev_auth` VALUES (65, 1, 0, 0, '内容', 'layui-icon-read', '', 60, 0, 1605172316, 1606449077, 0, 0);
INSERT INTO `yx_dev_auth` VALUES (66, 1, 0, 65, '广告', 'layui-icon-note', '', 50, 0, 1605172328, 1605522463, 0, 0);
INSERT INTO `yx_dev_auth` VALUES (67, 1, 0, 66, '广告管理', '', 'ad/lists', 50, 0, 1605172346, 1605172376, 0, 0);
INSERT INTO `yx_dev_auth` VALUES (68, 1, 0, 66, '广告位管理', '', 'adPosition/lists', 50, 0, 1605172428, NULL, 0, 0);
INSERT INTO `yx_dev_auth` VALUES (69, 1, 0, 65, '帮助', 'layui-icon-survey', '', 50, 0, 1605177392, 1605522474, 0, 0);
INSERT INTO `yx_dev_auth` VALUES (70, 1, 0, 69, '帮助管理', '', 'help/lists', 50, 0, 1605177427, NULL, 0, 0);
INSERT INTO `yx_dev_auth` VALUES (71, 1, 0, 69, '帮助分类', '', 'helpCategory/lists', 50, 0, 1605177450, NULL, 0, 0);
INSERT INTO `yx_dev_auth` VALUES (72, 1, 0, 39, '限时秒杀', 'layui-icon-release', 'seckill/lists', 50, 0, 1605238672, 1605238700, 0, 0);
INSERT INTO `yx_dev_auth` VALUES (73, 1, 0, 65, '文章', 'layui-icon-read', '', 50, 0, 1605250150, 1605522487, 0, 0);
INSERT INTO `yx_dev_auth` VALUES (74, 1, 0, 73, '文章管理', '', 'article/lists', 50, 0, 1605250172, NULL, 0, 0);
INSERT INTO `yx_dev_auth` VALUES (75, 1, 0, 73, '文章分类', '', 'articleCategory/lists', 50, 0, 1605250217, NULL, 0, 0);
INSERT INTO `yx_dev_auth` VALUES (76, 1, 0, 72, '限时秒杀', 'layui-icon-release', 'seckill/lists', 50, 0, 1605257233, NULL, 1, 0);
INSERT INTO `yx_dev_auth` VALUES (77, 1, 0, 56, '物流管理', 'layui-icon-find-fill', 'express/lists', 50, 0, 1605582713, 1605582751, 1, 0);
INSERT INTO `yx_dev_auth` VALUES (78, 1, 0, 17, '消息管理', 'layui-icon-notice', 'message/config', 50, 0, 1605602063, NULL, 1, 0);
INSERT INTO `yx_dev_auth` VALUES (79, 1, 0, 17, '消息管理', 'layui-icon-notice', 'message/config', 50, 0, 1605602385, NULL, 0, 0);
INSERT INTO `yx_dev_auth` VALUES (80, 1, 0, 17, '短信管理', 'layui-icon-auz', 'sms/lists', 50, 0, 1605603890, NULL, 0, 0);
INSERT INTO `yx_dev_auth` VALUES (81, 1, 0, 0, '财务', 'layui-icon-rmb', '', 20, 0, 1605664275, 1606449617, 0, 0);
INSERT INTO `yx_dev_auth` VALUES (83, 1, 0, 0, '财务', 'layui-icon-rmb', '', 50, 0, 1605671949, NULL, 1, 0);
INSERT INTO `yx_dev_auth` VALUES (84, 1, 0, 81, '资金记录', 'layui-icon-survey', 'accountLog/capitalList', 50, 0, 1605693585, 1605865218, 0, 0);
INSERT INTO `yx_dev_auth` VALUES (86, 1, 0, 85, '分销会员列表', '', 'distributionMember/index', 50, 0, 1605949513, 1605950702, 0, 0);
INSERT INTO `yx_dev_auth` VALUES (87, 1, 0, 81, '积分记录', 'layui-icon-templeate-1', 'accountLog/IntegralList', 50, 0, 1606098520, NULL, 0, 0);
INSERT INTO `yx_dev_auth` VALUES (89, 1, 0, 39, '专区活动', 'layui-icon-code-circle', 'Activity/Lists', 50, 0, 1606182362, 1606200704, 0, 0);
INSERT INTO `yx_dev_auth` VALUES (92, 1, 0, 0, '装修', 'layui-icon-cellphone', '', 50, 0, 1606449120, 1606792217, 0, 0);
INSERT INTO `yx_dev_auth` VALUES (93, 1, 0, 92, 'H5装修', 'layui-icon-cellphone', '', 100, 0, 1606449177, 1606792239, 0, 0);
INSERT INTO `yx_dev_auth` VALUES (96, 1, 0, 93, '首页导航装修', 'layui-icon-username', 'MenuDecorate/h5IndexList', 100, 0, 1606449403, 1606891059, 0, 0);
INSERT INTO `yx_dev_auth` VALUES (97, 1, 0, 93, '个人中心装修', 'layui-icon-cellphone', 'MenuDecorate/h5CenterList', 90, 0, 1606449425, 1606891046, 0, 0);
INSERT INTO `yx_dev_auth` VALUES (98, 1, 0, 94, '首页导航装修', 'layui-icon-username', 'MenuDecorate/mnpIndexList', 100, 0, 1606449451, 1606890579, 0, 0);
INSERT INTO `yx_dev_auth` VALUES (99, 1, 0, 94, '个人中心装修', 'layui-icon-cellphone', 'MenuDecorate/mnpCenterList', 90, 0, 1606449483, 1606890602, 0, 0);
INSERT INTO `yx_dev_auth` VALUES (100, 1, 0, 95, '首页导航装修', 'layui-icon-username', 'MenuDecorate/appIndexList', 100, 0, 1606449508, 1606890658, 0, 0);
INSERT INTO `yx_dev_auth` VALUES (101, 1, 0, 95, '个人中心装修', 'layui-icon-cellphone', 'MenuDecorate/appCenterList', 90, 0, 1606449534, 1606890646, 0, 0);
INSERT INTO `yx_dev_auth` VALUES (102, 1, 0, 0, '数据', 'layui-icon-website', '', 10, 0, 1606449677, 1606449891, 0, 0);
INSERT INTO `yx_dev_auth` VALUES (103, 1, 0, 102, '会员', '', '', 100, 0, 1606449697, NULL, 0, 0);
INSERT INTO `yx_dev_auth` VALUES (104, 1, 0, 102, '商品', '', '', 90, 0, 1606449713, NULL, 0, 0);
INSERT INTO `yx_dev_auth` VALUES (105, 1, 0, 102, '交易', '', '', 80, 0, 1606449733, NULL, 0, 0);
INSERT INTO `yx_dev_auth` VALUES (106, 1, 0, 102, '访问', '', '', 70, 0, 1606449750, NULL, 0, 0);
INSERT INTO `yx_dev_auth` VALUES (107, 1, 0, 85, '分销设置', '', 'distribution/setting', 50, 0, 1606459007, NULL, 0, 0);
INSERT INTO `yx_dev_auth` VALUES (108, 1, 0, 18, '系统任务', 'layui-icon-rate-solid', 'crontab/lists', 50, 0, 1606816642, NULL, 0, 0);
INSERT INTO `yx_dev_auth` VALUES (111, 1, 0, 50, '模板消息管理', '', 'oaMessage/lists', 50, 0, 1606960631, 1606964829, 0, 0);
INSERT INTO `yx_dev_auth` VALUES (112, 1, 0, 39, '邀请会员', 'layui-icon-radio', 'MarketingConfig/invitedAwardConfig', 50, 0, 1606962893, 1606962961, 0, 0);
INSERT INTO `yx_dev_auth` VALUES (113, 1, 0, 39, '下单奖励', 'layui-icon-radio', 'MarketingConfig/orderAwardConfig', 50, 0, 1606962912, 1606962981, 0, 0);
INSERT INTO `yx_dev_auth` VALUES (114, 1, 0, 39, '注册奖励', 'layui-icon-radio', 'MarketingConfig/registerAwardConfig', 50, 0, 1606962930, 1606963010, 0, 0);
INSERT INTO `yx_dev_auth` VALUES (115, 1, 0, 53, '订阅消息管理', '', 'mnpMessage/lists', 50, 0, 1607066949, NULL, 0, 0);
INSERT INTO `yx_dev_auth` VALUES (116, 1, 0, 50, '回复管理', 'layui-icon-reply-fill', 'WechatReply/lists', 50, 0, 1607139107, 1607151465, 0, 0);
INSERT INTO `yx_dev_auth` VALUES (117, 1, 0, 39, '积分抵扣', 'layui-icon-rate-half', 'marketingConfig/integralDeduction', 50, 0, 1607149356, 1607149390, 0, 0);
COMMIT;

-- ----------------------------
-- Table structure for yx_dev_crontab
-- ----------------------------
DROP TABLE IF EXISTS `yx_dev_crontab`;
CREATE TABLE `yx_dev_crontab`  (
                                `id` int(11) NOT NULL AUTO_INCREMENT,
                                `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
                                `type` tinyint(1) NULL DEFAULT NULL COMMENT '类型：1-定时任务；2-守护进程',
                                `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
                                `command` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '命令内容',
                                `parameter` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数',
                                `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '状态：1-运行；2-停止；3-错误；',
                                `expression` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '运行规则',
                                `error` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '运行失败原因',
                                `create_time` int(11) NULL DEFAULT NULL COMMENT '创建时间',
                                `update_time` int(11) NULL DEFAULT NULL COMMENT '最后执行时间',
                                `last_time` int(11) NULL DEFAULT NULL COMMENT '最后执行时间',
                                `time` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '实时执行时长',
                                `max_time` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '最大执行时长',
                                `system` tinyint(4) NULL DEFAULT 0 COMMENT '是否系统任务：0-否；1-是；',
                                PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yx_dev_crontab
-- ----------------------------
BEGIN;
INSERT INTO `yx_dev_crontab` VALUES (1, '更新会员分销信息', 1, '', 'docker exec -it like-php7.2.4 php /project-services/LikeShop-ser', '', 1, '*/5 * * * *', NULL, 1606816709, NULL, NULL, '0', '0', 0);
INSERT INTO `yx_dev_crontab` VALUES (2, '结算分销订单', 1, '', 'docker exec -it like-php7.2.4 php /project-services/LikeShop-ser', '', 1, '0 23 * * *', NULL, 1606817054, NULL, NULL, '0', '0', 0);
COMMIT;

-- ----------------------------
-- Table structure for yx_dev_message
-- ----------------------------
DROP TABLE IF EXISTS `yx_dev_message`;
CREATE TABLE `yx_dev_message`  (
                                `id` int(11) NOT NULL AUTO_INCREMENT,
                                `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '消息名称',
                                `key` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '消息key',
                                `dev_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '类型：1-会员消息；2-店铺消息',
                                `del` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否删除：1-是；0-否',
                                PRIMARY KEY (`id`) USING BTREE,
                                UNIQUE INDEX `key`(`key`) USING BTREE COMMENT '消息唯一标识'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT = '消息管理表';

-- ----------------------------
-- Records of b2b2c_dev_message
-- ----------------------------
BEGIN;
INSERT INTO `yx_dev_message` VALUES (1, '订单提交通知', 'DDTJTZ', 1, 0);
INSERT INTO `yx_dev_message` VALUES (2, '订单支付通知', 'DDZFTZ', 1, 0);
INSERT INTO `yx_dev_message` VALUES (3, '订单发货通知', 'DDFHTZ', 1, 0);
INSERT INTO `yx_dev_message` VALUES (4, '商家同意售后退款', 'SJTYSHTK', 1, 0);
INSERT INTO `yx_dev_message` VALUES (5, '商家拒绝售后退款', 'SJJJSHTK', 1, 0);
INSERT INTO `yx_dev_message` VALUES (6, '注册验证', 'ZCYZ', 1, 0);
INSERT INTO `yx_dev_message` VALUES (7, '找回密码', 'ZHMM', 1, 0);
INSERT INTO `yx_dev_message` VALUES (10, '验证码登录', 'YZMDL', 1, 0);
COMMIT;

-- ----------------------------
-- Table structure for yx_dev_message_extend
-- ----------------------------
DROP TABLE IF EXISTS `yx_dev_message_extend`;
CREATE TABLE `yx_dev_message_extend`  (
                                        `id` int(11) NOT NULL AUTO_INCREMENT,
                                        `message_id` int(11) NOT NULL COMMENT '信息管理id',
                                        `message_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '类型：1-短信',
                                        `template_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '模板',
                                        `variable` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '变量',
                                        `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '内容',
                                        `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '状态：0-关闭；1-开启',
                                        `del` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否删除：1-是；0-否',
                                        PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yx_dev_message_extend
-- ----------------------------
BEGIN;
INSERT INTO `yx_dev_message_extend` VALUES (1, 1, 1, 'SMS_186948179', '{\"nickname\":\"\\u4f1a\\u5458\\u6635\\u79f0\",\"order_sn\":\"\\u8ba2\\u5355\\u53f7\",\"order_money\":\"\\u8ba2\\u5355\\u91d1\\u989d\"}', '亲爱的{nickname}，您的订单已发货，订单号：{order_sn}，订单金额{order_money}元。', 1, 0);
INSERT INTO `yx_dev_message_extend` VALUES (2, 2, 1, 'SMS_186948179', '{\"nickname\":\"\\u4f1a\\u5458\\u6635\\u79f0\",\"order_sn\":\"\\u8ba2\\u5355\\u53f7\",\"order_money\":\"\\u8ba2\\u5355\\u91d1\\u989d\"}', '亲爱的{nickname}，您的订单已支付，订单号{order_sn}，订单金额{order_money}元。', 1, 0);
INSERT INTO `yx_dev_message_extend` VALUES (3, 3, 1, 'SMS_186948179', '{\"nickname\":\"\\u4f1a\\u5458\\u6635\\u79f0\",\"order_sn\":\"\\u8ba2\\u5355\\u53f7\"}', '亲爱的{nickname}，您的订单已发货，订单号{order_sn}。', 1, 0);
INSERT INTO `yx_dev_message_extend` VALUES (4, 4, 1, 'SMS_186948179', '{\"nickname\":\"\\u4f1a\\u5458\\u6635\\u79f0\",\"order_sn\":\"\\u8ba2\\u5355\\u53f7\"}', '亲爱的{nickname}，您的售后退款订单，订单号{order_sn}，商家同意退款。', 1, 0);
INSERT INTO `yx_dev_message_extend` VALUES (5, 5, 1, 'SMS_186948179', '{\"nickname\":\"\\u4f1a\\u5458\\u6635\\u79f0\",\"order_sn\":\"\\u8ba2\\u5355\\u53f7\"}', '亲爱的{nickname}，您的售后退款订单，退款单号{order_sn}，商家拒绝退款。', 1, 0);
INSERT INTO `yx_dev_message_extend` VALUES (6, 6, 1, 'SMS_175615071', '{\"code\":\"\\u9a8c\\u8bc1\\u7801\"}', '您的验证码为：{code}，正在进行注册验证，该验证码 5 分钟内有效，请勿泄漏于他人。', 1, 0);
INSERT INTO `yx_dev_message_extend` VALUES (7, 7, 1, 'SMS_175615071', '{\"code\":\"\\u9a8c\\u8bc1\\u7801\"}', '您的验证码为：{code}，正在进行找回密码，该验证码 5 分钟内有效，请勿泄漏于他人。', 1, 0);
INSERT INTO `yx_dev_message_extend` VALUES (10, 10, 1, 'SMS_175615071', '{\"code\":\"\\u9a8c\\u8bc1\\u7801\"}', '您的验证码为：{code}，该验证码 5 分钟内有效，请勿泄漏于他人。', 1, 0);
COMMIT;

-- ----------------------------
-- Table structure for yx_dev_message_template
-- ----------------------------
DROP TABLE IF EXISTS `yx_dev_message_template`;
CREATE TABLE `yx_dev_message_template`  (
                                        `id` int(4) NOT NULL AUTO_INCREMENT,
                                        `type` tinyint(1) NULL DEFAULT 1 COMMENT '1-公众号；2-小程序',
                                        `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '模板名称',
                                        `template_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '消息模板ID',
                                        `template_id_short` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '模板库ID',
                                        `keywords` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '关键词库(小程序端使用)',
                                        `msg_type` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '消息类型',
                                        `scene` tinyint(1) NOT NULL DEFAULT 1 COMMENT '消息场景',
                                        `disable` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态: 0-启用; 1-禁用;',
                                        `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '模板内容',
                                        PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='消息通知模板表' ;

-- ----------------------------
-- Records of yx_dev_message_template
-- ----------------------------
BEGIN;
INSERT INTO `yx_dev_message_template` VALUES (1, 2, '购买成功通知', 'GXFtj0H_jsRMRg6IbJQJqjeAkxoTzblzLklZCZ6BbpM', 'OPENTM417997194', '', '买家消息', 1, 0, '{{first.DATA}}\r\n订单号：{{keyword1.DATA}}\r\n购买数量：{{keyword2.DATA}}\r\n实付金额：{{keyword3.DATA}}\r\n下单时间：{{keyword4.DATA}}\r\n{{remark.DATA}}');
INSERT INTO `yx_dev_message_template` VALUES (2, 2, '发货提醒', '_SlhocRyvNOcqEMhXlAvTSssnj8IFNkWogfMG9fmwJc', 'OPENTM416317950', '', '买家消息', 2, 0, '{{first.DATA}}\r\n手机号：{{keyword1.DATA}}\r\n订单号：{{keyword2.DATA}}\r\n金额：{{keyword3.DATA}}\r\n{{remark.DATA}}');
INSERT INTO `yx_dev_message_template` VALUES (3, 2, '退款成功通知', '4OQyjTGQphpOVMXrsBwkQfjcr4qi1E2m4j6v0fkHHow', 'OPENTM202723917', '', '买家消息', 3, 0, '{{first.DATA}}\r\n订单编号：{{keyword1.DATA}}\r\n退款金额：{{keyword2.DATA}}\r\n{{remark.DATA}}');
INSERT INTO `yx_dev_message_template` VALUES (4, 1, '支付成功通知', '9Ln6PVfzOGdl9Lqlx1pscfhRMye__XHNosZLFxlAwOw', '6271', '1,2,3,4', '买家消息', 1, 0, '订单编号{{character_string1.DATA}}\r\n支付时间{{time2.DATA}}\r\n订单金额{{amount3.DATA}}\r\n商品名称{{thing4.DATA}}\r\n商家名称{{thing5.DATA}}');
INSERT INTO `yx_dev_message_template` VALUES (5, 1, '订单发货通知', 'aNesjOwY8s4ZiscRLX8OQpbEl8EoTbravuGJR7PI0qI', '3637', '1,2,3,4,5', '买家消息', 2, 0, '商品名称  {{thing1.DATA}}\r\n订单号    {{character_string2.DATA}}\r\n发货时间  {{date3.DATA}}\r\n快递公司  {{thing4.DATA}}\r\n快递单号  {{character_string5.DATA}}');
INSERT INTO `yx_dev_message_template` VALUES (6, 1, '退款成功通知', '_ixwyuowGUM1Sr214nfjN5a3YlbCVMPGji5jZj1f90M', '5668', '1,2,3,4', '买家消息', 3, 0, '退款金额 {{amount1.DATA}}\r\n商品名称 {{thing2.DATA}}\r\n订单编号 {{character_string3.DATA}}\r\n退款时间 {{date4.DATA}}');
COMMIT;

-- ----------------------------
-- Table structure for yx_dev_partner_auth
-- ----------------------------
DROP TABLE IF EXISTS `yx_dev_partner_auth`;
CREATE TABLE `yx_dev_partner_auth`  (
                                        `id` int(11) NOT NULL AUTO_INCREMENT,
                                        `pid` int(11) NOT NULL DEFAULT 0 COMMENT '父级id',
                                        `name` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '名字',
                                        `params` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '参数',
                                        `sort` tinyint(2) NOT NULL DEFAULT 50 COMMENT '排序：数字越大越靠前',
                                        `disable` tinyint(1) NOT NULL DEFAULT 0 COMMENT '失效：0-否；1-是；',
                                        `desc` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '描述',
                                        `partner_id` int(11) NOT NULL DEFAULT 0 COMMENT '机构id',
                                        PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT = '机构权限表（开发人员维护）';

-- ----------------------------
-- Records of yx_dev_partner_auth
-- ----------------------------
BEGIN;
INSERT INTO `yx_dev_partner_auth` VALUES (100, 0, '设置', '', 50, 0, '', 1);
INSERT INTO `yx_dev_partner_auth` VALUES (110, 100, '权限管理', '', 50, 0, '', 1);
INSERT INTO `yx_dev_partner_auth` VALUES (111, 110, '管理员', 'admin_lists,admin_add,admin_updte,admin_del', 50, 0, '', 1);
INSERT INTO `yx_dev_partner_auth` VALUES (112, 110, '角色', 'role_lists,role_add,role_update,role_del', 50, 0, '', 1);
INSERT INTO `yx_dev_partner_auth` VALUES (200, 0, '商品', '', 50, 0, '', 1);
INSERT INTO `yx_dev_partner_auth` VALUES (201, 200, '商品管理', 'good_lists', 50, 0, '', 1);
INSERT INTO `yx_dev_partner_auth` VALUES (202, 200, '订单管理', 'order_lists', 50, 0, '', 1);
COMMIT;

-- ----------------------------
-- Table structure for yx_dev_pay
-- ----------------------------
DROP TABLE IF EXISTS `yx_dev_pay`;
CREATE TABLE `yx_dev_pay`  (
                                `id` int(10) NOT NULL AUTO_INCREMENT,
                                `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付方式',
                                `icon` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图标',
                                `use` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '使用场景',
                                `commission` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手续费',
                                `pay_use` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '启用状态',
                                `abbreviation` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '简称',
                                `sort` int(11) NULL DEFAULT 0 COMMENT '排序',
                                `app_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
                                `app_secrect` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
                                `pay_sign_key` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
                                `mch_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
                                `apiclient_cert` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
                                `apiclient_key` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
                                `api_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
                                `private_key` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
                                `public_key` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
                                `alipay_public_key` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
                                `type` tinyint(2) NULL DEFAULT NULL COMMENT '1-余额 2-公众号 3-小程序 4-支付宝',
                                PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT = '支付配置';

-- ----------------------------
-- Records of yx_dev_pay
-- ----------------------------
BEGIN;
INSERT INTO `yx_dev_pay` VALUES (1, '微信小程序支付', '/static/common/image/pay/icon_wechatApplet.png', '微信小程序', '44', '1', '微信支付', 0, 'wx75faf8824586138a', '456a462d9d14e1b5693610733035c45c', '7059dea46c0f1310708b8d9e21cc3d1f', '1579289011', 'uploads/other/cert/20201027/e6aca7349c285a6bf7c7995b4931ce8b.pem', 'uploads/other/cert/20201027/19b3c7c187b4611e87ef780e0c0a5f01.pem', NULL, NULL, NULL, NULL, 3);
INSERT INTO `yx_dev_pay` VALUES (2, '微信公众号支付', '/static/common/image/pay/icon_weChatPublic.png', '微信公众号', '22', '1', '微信支付', 0, 'wx9d46fbcce2d26482', 'e367310924595ebe2b52be33c717e560', '7059dea46c0f1310708b8d9e21cc3d1f', '1579289011', 'uploads/other/cert/20200821/25dc0585f8ca5de36f98ff5d8f481691.pem', 'uploads/other/cert/20200821/ba1b79b288fee58d32df137c1d98db42.pem', NULL, NULL, NULL, NULL, 2);
INSERT INTO `yx_dev_pay` VALUES (3, '微信APP支付', '/static/common/image/pay/icon_wechatApplet.png', '微信APP', '44', '0', '微信支付', 0, 'wx2c8c025a752bebe4', '6e561b60fc93aa49ffe6a32c14d74acf', '7059dea46c0f1310708b8d9e21cc3d1f', '1579289011', 'uploads/other/cert/20200820/f9cf9799414f0aaccc83dcffb526c88e.pem', 'uploads/other/cert/20200820/e0f2cb4143389065b6719e1981e46b30.pem', NULL, NULL, NULL, NULL, 5);
COMMIT;

-- ----------------------------
-- Table structure for yx_dev_region
-- ----------------------------
DROP TABLE IF EXISTS `yx_dev_region`;
CREATE TABLE `yx_dev_region`  (
                                `id` int(10) NOT NULL DEFAULT 0 COMMENT '地区编号',
                                `parent_id` int(10) NOT NULL DEFAULT 0 COMMENT '父级地区编码',
                                `level` tinyint(1) NOT NULL DEFAULT 0 COMMENT '等级 0-国家；1-省份；2-地级市；3-县区',
                                `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
                                `short` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '简称',
                                `city_code` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地区编码',
                                `zip_code` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮政编码',
                                `gcj02_lng` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '纬度',
                                `gcj02_lat` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '经度',
                                `db09_lng` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '纬度',
                                `db09_lat` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '经度',
                                `remark1` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
                                `remark2` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
                                PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT = '地区表';

-- ----------------------------
-- Records of yx_dev_region
-- ----------------------------
BEGIN;
INSERT INTO `yx_dev_region` VALUES (100000, 0, 0, '中国', '中国', NULL, NULL, '116.3683244', '39.915085', '116.374821', '39.92105', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (110000, 100000, 1, '北京', '北京', NULL, NULL, '116.405285', '39.904989', '116.411665', '39.911323', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (110100, 110000, 2, '北京市', '北京', '010', '100000', '116.405285', '39.904989', '116.411665', '39.911323', '行政区', '直辖市');
INSERT INTO `yx_dev_region` VALUES (110101, 110100, 3, '东城区', '东城', '010', '100000', '116.41005', '39.93157', '116.416428', '39.937866', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (110102, 110100, 3, '西城区', '西城', '010', '100000', '116.36003', '39.9305', '116.366571', '39.936319', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (110105, 110100, 3, '朝阳区', '朝阳', '010', '100000', '116.48548', '39.9484', '116.491997', '39.954314', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (110106, 110100, 3, '丰台区', '丰台', '010', '100000', '116.28625', '39.8585', '116.292652', '39.864836', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (110107, 110100, 3, '石景山区', '石景山', '010', '100000', '116.2229', '39.90564', '116.229513', '39.911293', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (110108, 110100, 3, '海淀区', '海淀', '010', '100000', '116.29812', '39.95931', '116.304549', '39.965513', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (110109, 110100, 3, '门头沟区', '门头沟', '010', '102300', '116.10137', '39.94043', '116.107973', '39.946077', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (110111, 110100, 3, '房山区', '房山', '010', '102400', '116.14257', '39.74786', '116.149016', '39.75408', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (110112, 110100, 3, '通州区', '通州', '010', '101100', '116.65716', '39.90966', '116.663576', '39.915875', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (110113, 110100, 3, '顺义区', '顺义', '010', '101300', '116.65417', '40.1302', '116.660591', '40.136461', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (110114, 110100, 3, '昌平区', '昌平', '010', '102200', '116.2312', '40.22072', '116.237817', '40.226435', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (110115, 110100, 3, '大兴区', '大兴', '010', '102600', '116.34149', '39.72668', '116.348115', '39.732334', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (110116, 110100, 3, '怀柔区', '怀柔', '010', '101400', '116.63168', '40.31602', '116.638066', '40.322336', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (110117, 110100, 3, '平谷区', '平谷', '010', '101200', '117.12133', '40.14056', '117.127709', '40.14691', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (110118, 110100, 3, '密云区', '密云', '010', '101500', '116.84295', '40.37618', '116.849497', '40.382055', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (110119, 110100, 3, '延庆区', '延庆', '010', '102100', '115.97494', '40.45672', '115.981572', '40.462389', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (110120, 110100, 3, '中关村科技园区', '中关村科技园区', '010', '100190', '116.314569', '39.982578', '116.321115', '39.988501', NULL, '高新技术开发区');
INSERT INTO `yx_dev_region` VALUES (120000, 100000, 1, '天津', '天津', NULL, NULL, '117.190182', '39.125596', '117.196789', '39.131295', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (120100, 120000, 2, '天津市', '天津', '022', '300000', '117.190182', '39.125596', '117.196789', '39.131295', '行政区', '直辖市');
INSERT INTO `yx_dev_region` VALUES (120101, 120100, 3, '和平区', '和平', '022', '300000', '117.21456', '39.11718', '117.221029', '39.123262', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (120102, 120100, 3, '河东区', '河东', '022', '300000', '117.22562', '39.12318', '117.232038', '39.129438', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (120103, 120100, 3, '河西区', '河西', '022', '300000', '117.22327', '39.10959', '117.229685', '39.115812', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (120104, 120100, 3, '南开区', '南开', '022', '300000', '117.15074', '39.13821', '117.15726', '39.144202', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (120105, 120100, 3, '河北区', '河北', '022', '300000', '117.19697', '39.14816', '117.203563', '39.153945', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (120106, 120100, 3, '红桥区', '红桥', '022', '300000', '117.15145', '39.16715', '117.157971', '39.173127', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (120110, 120100, 3, '东丽区', '东丽', '022', '300000', '117.31436', '39.0863', '117.320927', '39.092037', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (120111, 120100, 3, '西青区', '西青', '022', '300000', '117.00927', '39.14123', '117.015683', '39.147546', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (120112, 120100, 3, '津南区', '津南', '022', '300000', '117.38537', '38.99139', '117.391834', '38.997472', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (120113, 120100, 3, '北辰区', '北辰', '022', '300000', '117.13217', '39.22131', '117.13856', '39.227587', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (120114, 120100, 3, '武清区', '武清', '022', '301700', '117.04443', '39.38415', '117.051029', '39.389915', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (120115, 120100, 3, '宝坻区', '宝坻', '022', '301800', '117.3103', '39.71761', '117.3169', '39.723307', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (120116, 120100, 3, '滨海新区', '滨海', '022', '300457', '117.70162', '39.02668', '117.708072', '39.032888', '行政区', '国家级新区');
INSERT INTO `yx_dev_region` VALUES (120117, 120100, 3, '宁河区', '宁河', '022', '301500', '117.8255', '39.33048', '117.831895', '39.33673', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (120118, 120100, 3, '静海区', '静海', '022', '301600', '116.97436', '38.94582', '116.980828', '38.951898', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (120119, 120100, 3, '蓟州区', '蓟州', '022', '301900', '117.40799', '40.04567', '117.414569', '40.051379', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (120120, 120100, 3, '滨海高新区', '滨海高新区', '022', '300000', '117.124791', '39.095212', '117.131159', '39.101546', NULL, '高新技术开发区');
INSERT INTO `yx_dev_region` VALUES (130000, 100000, 1, '河北省', '河北', NULL, NULL, '114.502461', '38.045474', '114.508922', '38.051608', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (130100, 130000, 2, '石家庄市', '石家庄', '0311', '050000', '114.502461', '38.045474', '114.508922', '38.051608', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (130102, 130100, 3, '长安区', '长安', '0311', '050000', '114.53906', '38.03665', '114.545671', '38.042306', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (130104, 130100, 3, '桥西区', '桥西', '0311', '050000', '114.46977', '38.03221', '114.476164', '38.038503', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (130105, 130100, 3, '新华区', '新华', '0311', '050000', '114.46326', '38.05088', '114.469697', '38.057103', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (130107, 130100, 3, '井陉矿区', '井陉矿区', '0311', '050100', '114.06518', '38.06705', '114.071809', '38.072727', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (130108, 130100, 3, '裕华区', '裕华', '0311', '050000', '114.53115', '38.00604', '114.537733', '38.011726', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (130109, 130100, 3, '藁城区', '藁城', '0311', '052160', '114.84671', '38.02162', '114.853087', '38.027938', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (130110, 130100, 3, '鹿泉区', '鹿泉', '0311', '050200', '114.31347', '38.08782', '114.320068', '38.093563', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (130111, 130100, 3, '栾城区', '栾城', '0311', '051430', '114.64834', '37.90022', '114.654917', '37.905933', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (130121, 130100, 3, '井陉县', '井陉', '0311', '050300', '114.14257', '38.03688', '114.149024', '38.043009', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (130123, 130100, 3, '正定县', '正定', '0311', '050800', '114.57296', '38.14445', '114.579429', '38.150498', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (130125, 130100, 3, '行唐县', '行唐', '0311', '050600', '114.55316', '38.43654', '114.559767', '38.442281', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (130126, 130100, 3, '灵寿县', '灵寿', '0311', '050500', '114.38259', '38.30845', '114.389065', '38.314586', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (130127, 130100, 3, '高邑县', '高邑', '0311', '051330', '114.61142', '37.61556', '114.617831', '37.621846', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (130128, 130100, 3, '深泽县', '深泽', '0311', '052500', '115.20358', '38.18353', '115.209985', '38.189875', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (130129, 130100, 3, '赞皇县', '赞皇', '0311', '051230', '114.38775', '37.66135', '114.394221', '37.667385', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (130130, 130100, 3, '无极县', '无极', '0311', '052460', '114.97509', '38.17653', '114.981524', '38.182778', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (130131, 130100, 3, '平山县', '平山', '0311', '050400', '114.186', '38.25994', '114.192593', '38.265609', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (130132, 130100, 3, '元氏县', '元氏', '0311', '051130', '114.52539', '37.76668', '114.531953', '37.772426', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (130133, 130100, 3, '赵县', '赵县', '0311', '051530', '114.77612', '37.75628', '114.782717', '37.761938', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (130181, 130100, 3, '辛集市', '辛集', '0311', '052360', '115.20626', '37.94079', '115.212669', '37.947123', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (130183, 130100, 3, '晋州市', '晋州', '0311', '052200', '115.04348', '38.03135', '115.05001', '38.037232', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (130184, 130100, 3, '新乐市', '新乐', '0311', '050700', '114.68985', '38.34417', '114.696347', '38.350166', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (130185, 130100, 3, '高新区', '高新区', '0311', '050000', '114.648171', '38.042413', '114.654766', '38.048134', NULL, '高新技术开发区');
INSERT INTO `yx_dev_region` VALUES (130186, 130100, 3, '经济开发区', '经济开发区', '0311', '052165', '114.65887', '38.021185', '114.665468', '38.026836', NULL, '经济技术开发区');
INSERT INTO `yx_dev_region` VALUES (130187, 130100, 3, '循环化工园区', '循环化工园区', '0311', '052160', '114.69369', '37.996725', '114.700154', '38.002786', NULL, '工业园区');
INSERT INTO `yx_dev_region` VALUES (130200, 130000, 2, '唐山市', '唐山', '0315', '063000', '118.175393', '39.635113', '118.181878', '39.641218', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (130202, 130200, 3, '路南区', '路南', '0315', '063000', '118.15431', '39.62505', '118.160915', '39.630797', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (130203, 130200, 3, '路北区', '路北', '0315', '063000', '118.20079', '39.62436', '118.207189', '39.63072', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (130204, 130200, 3, '古冶区', '古冶', '0315', '063100', '118.45803', '39.71993', '118.46446', '39.726138', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (130205, 130200, 3, '开平区', '开平', '0315', '063000', '118.26171', '39.67128', '118.268318', '39.676923', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (130207, 130200, 3, '丰南区', '丰南', '0315', '063300', '118.11282', '39.56483', '118.119319', '39.570772', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (130208, 130200, 3, '丰润区', '丰润', '0315', '063000', '118.12976', '39.8244', '118.136349', '39.830091', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (130209, 130200, 3, '曹妃甸区', '曹妃甸', '0315', '063200', '118.460379', '39.273070', '118.466841', '39.279248', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (130224, 130200, 3, '滦南县', '滦南', '0315', '063500', '118.6741', '39.5039', '118.680505', '39.510245', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (130225, 130200, 3, '乐亭县', '乐亭', '0315', '063600', '118.9125', '39.42561', '118.918885', '39.431938', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (130227, 130200, 3, '迁西县', '迁西', '0315', '064300', '118.31616', '40.14587', '118.322536', '40.152216', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (130229, 130200, 3, '玉田县', '玉田', '0315', '064100', '117.7388', '39.90049', '117.745233', '39.906685', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (130281, 130200, 3, '遵化市', '遵化', '0315', '064200', '117.96444', '40.18741', '117.970811', '40.19375', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (130283, 130200, 3, '迁安市', '迁安', '0315', '064400', '118.70068', '39.99833', '118.707141', '40.004503', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (130284, 130200, 3, '滦州市', '滦州', '0315', '063700', '118.70346', '39.74056', '118.709937', '39.746685', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (130291, 130200, 3, '高新区', '高新区', '0315', '063000', '118.16399', '39.682001', '118.17051', '39.687885', NULL, '高新技术开发区');
INSERT INTO `yx_dev_region` VALUES (130292, 130200, 3, '芦台开发区', '芦台开发区', '0315', '063000', '117.745097', '39.383531', '117.751585', '39.389627', NULL, '经济技术开发区');
INSERT INTO `yx_dev_region` VALUES (130293, 130200, 3, '海港经济开发区', '海港经济开发区', '0315', '063000', '119.003392', '39.231911', '119.009924', '39.237787', NULL, '经济技术开发区');
INSERT INTO `yx_dev_region` VALUES (130294, 130200, 3, '汉沽管理区', '汉沽管理区', '0315', '063000', '117.880958', '39.362451', '117.887525', '39.36826', NULL, '经济技术开发区');
INSERT INTO `yx_dev_region` VALUES (130300, 130000, 2, '秦皇岛市', '秦皇岛', '0335', '066000', '119.586579', '39.942531', '119.593177', '39.948188', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (130302, 130300, 3, '海港区', '海港', '0335', '066000', '119.61046', '39.9345', '119.616939', '39.940502', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (130303, 130300, 3, '山海关区', '山海关', '0335', '066200', '119.77563', '39.97869', '119.782064', '39.984941', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (130304, 130300, 3, '北戴河区', '北戴河', '0335', '066100', '119.48388', '39.83408', '119.490412', '39.839965', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (130306, 130300, 3, '抚宁区', '抚宁', '0335', '066300', '119.24487', '39.87538', '119.25142', '39.881291', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (130321, 130300, 3, '青龙满族自治县', '青龙', '0335', '066500', '118.95242', '40.40743', '118.958917', '40.413379', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (130322, 130300, 3, '昌黎县', '昌黎', '0335', '066600', '119.16595', '39.70884', '119.172326', '39.715177', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (130324, 130300, 3, '卢龙县', '卢龙', '0335', '066400', '118.89288', '39.89176', '118.89937', '39.897816', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (130371, 130300, 3, '经济技术开发区', '经济技术开发区', '0335', '066004', '119.556308', '39.925068', '119.562829', '39.930946', NULL, '经济技术开发区');
INSERT INTO `yx_dev_region` VALUES (130372, 130300, 3, '北戴河新区', '北戴河新区', '0335', '066311', '119.386541', '39.76748', '119.392962', '39.773757', NULL, '新区');
INSERT INTO `yx_dev_region` VALUES (130400, 130000, 2, '邯郸市', '邯郸', '0310', '056000', '114.490686', '36.612273', '114.497104', '36.618568', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (130402, 130400, 3, '邯山区', '邯山', '0310', '056000', '114.48375', '36.60006', '114.490142', '36.606397', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (130403, 130400, 3, '丛台区', '丛台', '0310', '056000', '114.49343', '36.61847', '114.499862', '36.624737', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (130404, 130400, 3, '复兴区', '复兴', '0310', '056000', '114.45928', '36.61134', '114.465739', '36.617504', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (130406, 130400, 3, '峰峰矿区', '峰峰矿区', '0310', '056200', '114.21148', '36.41937', '114.217972', '36.425397', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (130407, 130400, 3, '肥乡区', '肥乡', '0310', '057550', '114.79998', '36.54807', '114.806527', '36.553895', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (130408, 130400, 3, '永年区', '永年', '0310', '057150', '114.48925', '36.78356', '114.495649', '36.789863', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (130423, 130400, 3, '临漳县', '临漳', '0310', '056600', '114.6195', '36.33461', '114.625925', '36.340784', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (130424, 130400, 3, '成安县', '成安', '0310', '056700', '114.66995', '36.44411', '114.676527', '36.449806', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (130425, 130400, 3, '大名县', '大名', '0310', '056900', '115.15362', '36.27994', '115.160219', '36.285684', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (130426, 130400, 3, '涉县', '涉县', '0310', '056400', '113.69183', '36.58072', '113.698414', '36.586404', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (130427, 130400, 3, '磁县', '磁县', '0310', '056500', '114.37387', '36.37392', '114.380301', '36.380181', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (130430, 130400, 3, '邱县', '邱县', '0310', '057450', '115.17407', '36.82082', '115.180531', '36.826888', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (130431, 130400, 3, '鸡泽县', '鸡泽', '0310', '057350', '114.8742', '36.92374', '114.880706', '36.929659', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (130432, 130400, 3, '广平县', '广平', '0310', '057650', '114.94653', '36.48046', '114.952947', '36.486723', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (130433, 130400, 3, '馆陶县', '馆陶', '0310', '057750', '115.29913', '36.53719', '115.305582', '36.54335', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (130434, 130400, 3, '魏县', '魏县', '0310', '056800', '114.93518', '36.36171', '114.941652', '36.367803', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (130435, 130400, 3, '曲周县', '曲周', '0310', '057250', '114.95196', '36.77671', '114.958363', '36.783026', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (130481, 130400, 3, '武安市', '武安', '0310', '056300', '114.20153', '36.69281', '114.208058', '36.698657', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (130482, 130400, 3, '冀南新区', '冀南新区', '0310', '056046', '114.46507', '36.464565', '114.471479', '36.470804', NULL, '新区');
INSERT INTO `yx_dev_region` VALUES (130483, 130400, 3, '高新技术产业开发区', '高新技术产业开发区', '0310', '056000', '114.566033', '36.675235', '114.572542', '36.68116', NULL, '经济技术开发区');
INSERT INTO `yx_dev_region` VALUES (130500, 130000, 2, '邢台市', '邢台', '0319', '054000', '114.508851', '37.0682', '114.515333', '37.074217', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (130502, 130500, 3, '桥东区', '桥东', '0319', '054000', '114.50725', '37.06801', '114.513723', '37.074056', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (130503, 130500, 3, '桥西区', '桥西', '0319', '054000', '114.46803', '37.05984', '114.474423', '37.066113', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (130521, 130500, 3, '邢台县', '邢台', '0319', '054000', '114.56575', '37.0456', '114.572256', '37.051518', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (130522, 130500, 3, '临城县', '临城', '0319', '054300', '114.50387', '37.43977', '114.510334', '37.445878', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (130523, 130500, 3, '内丘县', '内丘', '0319', '054200', '114.51212', '37.28671', '114.518614', '37.292666', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (130524, 130500, 3, '柏乡县', '柏乡', '0319', '055450', '114.69332', '37.48242', '114.699816', '37.488484', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (130525, 130500, 3, '隆尧县', '隆尧', '0319', '055350', '114.77615', '37.35351', '114.782778', '37.359179', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (130526, 130500, 3, '任县', '任县', '0319', '055150', '114.6842', '37.12575', '114.690746', '37.131651', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (130527, 130500, 3, '南和县', '南和', '0319', '054400', '114.68371', '37.00488', '114.690259', '37.010773', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (130528, 130500, 3, '宁晋县', '宁晋', '0319', '055550', '114.92117', '37.61696', '114.927723', '37.622807', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (130529, 130500, 3, '巨鹿县', '巨鹿', '0319', '055250', '115.03524', '37.21801', '115.041833', '37.223774', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (130530, 130500, 3, '新河县', '新河', '0319', '051730', '115.24987', '37.52718', '115.256448', '37.532876', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (130531, 130500, 3, '广宗县', '广宗', '0319', '054600', '115.14254', '37.0746', '115.149145', '37.080256', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (130532, 130500, 3, '平乡县', '平乡', '0319', '054500', '115.03002', '37.06317', '115.036602', '37.068867', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (130533, 130500, 3, '威县', '威县', '0319', '054700', '115.2637', '36.9768', '115.270324', '36.982465', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (130534, 130500, 3, '清河县', '清河', '0319', '054800', '115.66479', '37.07122', '115.671204', '37.07746', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (130535, 130500, 3, '临西县', '临西', '0319', '054900', '115.50097', '36.87078', '115.5076', '36.87644', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (130581, 130500, 3, '南宫市', '南宫', '0319', '051800', '115.39068', '37.35799', '115.397292', '37.363702', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (130582, 130500, 3, '沙河市', '沙河', '0319', '054100', '114.4981', '36.8577', '114.504551', '36.863905', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (130583, 130500, 3, '经济开发区', '经济开发区', '0319', '054000', '114.902148', '37.627959', '114.908752', '37.633614', NULL, '经济技术开发区');
INSERT INTO `yx_dev_region` VALUES (130600, 130000, 2, '保定市', '保定', '0312', '071000', '115.482331', '38.867657', '115.48889', '38.873445', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (130602, 130600, 3, '竞秀区', '竞秀', '0312', '071052', '115.4587', '38.87751', '115.465132', '38.883702', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (130606, 130600, 3, '莲池区', '莲池', '0312', '071000', '115.49715', '38.88322', '115.503769', '38.888878', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (130607, 130600, 3, '满城区', '满城', '0312', '072150', '115.32296', '38.94972', '115.329335', '38.956059', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (130608, 130600, 3, '清苑区', '清苑', '0312', '071100', '115.49267', '38.76709', '115.499285', '38.772771', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (130609, 130600, 3, '徐水区', '徐水', '0312', '072550', '115.65829', '39.02099', '115.664758', '39.027142', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (130623, 130600, 3, '涞水县', '涞水', '0312', '074100', '115.71517', '39.39404', '115.72172', '39.399953', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (130624, 130600, 3, '阜平县', '阜平', '0312', '073200', '114.19683', '38.84763', '114.203385', '38.853406', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (130626, 130600, 3, '定兴县', '定兴', '0312', '072650', '115.80786', '39.26312', '115.81427', '39.269444', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (130627, 130600, 3, '唐县', '唐县', '0312', '072350', '114.98516', '38.74513', '114.991618', '38.751212', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (130628, 130600, 3, '高阳县', '高阳', '0312', '071500', '115.7788', '38.70003', '115.785248', '38.706184', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (130629, 130600, 3, '容城县', '容城', '0312', '071700', '115.87158', '39.0535', '115.878183', '39.059216', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (130630, 130600, 3, '涞源县', '涞源', '0312', '074300', '114.69128', '39.35388', '114.697766', '39.359901', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (130631, 130600, 3, '望都县', '望都', '0312', '072450', '115.1567', '38.70996', '115.163265', '38.715735', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (130632, 130600, 3, '安新县', '安新', '0312', '071600', '115.93557', '38.93532', '115.941995', '38.94156', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (130633, 130600, 3, '易县', '易县', '0312', '074200', '115.4981', '39.34885', '115.504707', '39.354502', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (130634, 130600, 3, '曲阳县', '曲阳', '0312', '073100', '114.70123', '38.62154', '114.70765', '38.627726', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (130635, 130600, 3, '蠡县', '蠡县', '0312', '071400', '115.57717', '38.48974', '115.583579', '38.495949', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (130636, 130600, 3, '顺平县', '顺平', '0312', '072250', '115.1347', '38.83854', '115.141296', '38.844203', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (130637, 130600, 3, '博野县', '博野', '0312', '071300', '115.47033', '38.4564', '115.476836', '38.462395', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (130638, 130600, 3, '雄县', '雄县', '0312', '071800', '116.10873', '38.99442', '116.11533', '39.000106', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (130681, 130600, 3, '涿州市', '涿州', '0312', '072750', '115.98062', '39.48622', '115.987244', '39.491874', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (130682, 130600, 3, '定州市', '定州', '0312', '073000', '114.9902', '38.51623', '114.996697', '38.522225', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (130683, 130600, 3, '安国市', '安国', '0312', '071200', '115.32321', '38.41391', '115.329609', '38.420255', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (130684, 130600, 3, '高碑店市', '高碑店', '0312', '074000', '115.87368', '39.32655', '115.88025', '39.332281', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (130685, 130600, 3, '雄安新区', '雄安新区', '0312', '071000', '115.976478', '38.995544', '115.983089', '39.0012', NULL, '国家级新区');
INSERT INTO `yx_dev_region` VALUES (130686, 130600, 3, '高新区', '高新区', '0312', '071000', '115.46533', '38.904525', '115.47182', '38.910615', NULL, '高新技术开发区');
INSERT INTO `yx_dev_region` VALUES (130687, 130600, 3, '白沟新城', '白沟新城', '0312', '071000', '116.045066', '39.128227', '116.051461', '39.134566', NULL, '经济技术开发区');
INSERT INTO `yx_dev_region` VALUES (130700, 130000, 2, '张家口市', '张家口', '0313', '075000', '114.884091', '40.811901', '114.890684', '40.817673', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (130702, 130700, 3, '桥东区', '桥东', '0313', '075000', '114.8943', '40.78844', '114.900906', '40.794107', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (130703, 130700, 3, '桥西区', '桥西', '0313', '075000', '114.86962', '40.81945', '114.876134', '40.825463', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (130705, 130700, 3, '宣化区', '宣化', '0313', '075000', '115.06543', '40.60957', '115.071852', '40.615823', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (130706, 130700, 3, '下花园区', '下花园', '0313', '075300', '115.28744', '40.50236', '115.293954', '40.508313', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (130708, 130700, 3, '万全区', '万全', '0313', '076250', '114.7405', '40.76694', '114.746923', '40.773098', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (130709, 130700, 3, '崇礼区', '崇礼', '0313', '076350', '115.27993', '40.97519', '115.286497', '40.981018', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (130722, 130700, 3, '张北县', '张北', '0313', '076450', '114.71432', '41.15977', '114.720702', '41.166099', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (130723, 130700, 3, '康保县', '康保', '0313', '076650', '114.60031', '41.85225', '114.606666', '41.858587', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (130724, 130700, 3, '沽源县', '沽源', '0313', '076550', '115.68859', '41.66959', '115.694996', '41.675909', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (130725, 130700, 3, '尚义县', '尚义', '0313', '076750', '113.97134', '41.07782', '113.977849', '41.08385', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (130726, 130700, 3, '蔚县', '蔚县', '0313', '075700', '114.58892', '39.84067', '114.595321', '39.846958', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (130727, 130700, 3, '阳原县', '阳原', '0313', '075800', '114.15051', '40.10361', '114.157031', '40.109607', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (130728, 130700, 3, '怀安县', '怀安', '0313', '076150', '114.38559', '40.67425', '114.392056', '40.680327', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (130730, 130700, 3, '怀来县', '怀来', '0313', '075400', '115.51773', '40.41536', '115.524285', '40.421146', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (130731, 130700, 3, '涿鹿县', '涿鹿', '0313', '075600', '115.22403', '40.37636', '115.230496', '40.382468', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (130732, 130700, 3, '赤城县', '赤城', '0313', '075500', '115.83187', '40.91438', '115.838377', '40.920344', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (130771, 130700, 3, '高新区', '高新区', '0313', '075000', '114.942453', '40.701163', '114.948896', '40.707378', NULL, '高新技术开发区');
INSERT INTO `yx_dev_region` VALUES (130772, 130700, 3, '察北管理区', '察北管理区', '0313', '075000', '114.952122', '41.420843', '114.958525', '41.427165', NULL, '经济技术开发区');
INSERT INTO `yx_dev_region` VALUES (130773, 130700, 3, '塞北管理区', '塞北管理区', '0313', '075000', '115.814552', '41.858266', '115.820944', '41.864511', NULL, '经济技术开发区');
INSERT INTO `yx_dev_region` VALUES (130800, 130000, 2, '承德市', '承德', '0314', '067000', '117.939152', '40.976204', '117.945599', '40.982368', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (130802, 130800, 3, '双桥区', '双桥', '0314', '067000', '117.9432', '40.97466', '117.949627', '40.980887', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (130803, 130800, 3, '双滦区', '双滦', '0314', '067000', '117.74487', '40.95375', '117.751356', '40.95985', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (130804, 130800, 3, '鹰手营子矿区', '鹰手营子矿区', '0314', '067200', '117.65985', '40.54744', '117.66646', '40.553083', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (130821, 130800, 3, '承德县', '承德', '0314', '067400', '118.17639', '40.76985', '118.182831', '40.77596', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (130822, 130800, 3, '兴隆县', '兴隆', '0314', '067300', '117.50073', '40.41709', '117.507156', '40.423248', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (130824, 130800, 3, '滦平县', '滦平', '0314', '068250', '117.33276', '40.94148', '117.339259', '40.947537', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (130825, 130800, 3, '隆化县', '隆化', '0314', '068150', '117.7297', '41.31412', '117.73611', '41.320435', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (130826, 130800, 3, '丰宁满族自治县', '丰宁', '0314', '068350', '116.6492', '41.20481', '116.655604', '41.211125', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (130827, 130800, 3, '宽城满族自治县', '宽城', '0314', '067600', '118.49176', '40.60829', '118.498382', '40.613971', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (130828, 130800, 3, '围场满族蒙古族自治县', '围场', '0314', '068450', '117.7601', '41.94368', '117.76666', '41.9495', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (130881, 130800, 3, '平泉市', '平泉', '0314', '067500', '118.70196', '41.01839', '118.708393', '41.02453', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (130882, 130800, 3, '高新区', '高新区', '0314', '067000', '117.95503', '40.922206', '117.961414', '40.928549', NULL, '高新技术开发区');
INSERT INTO `yx_dev_region` VALUES (130900, 130000, 2, '沧州市', '沧州', '0317', '061000', '116.857461', '38.310582', '116.863936', '38.316722', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (130902, 130900, 3, '新华区', '新华', '0317', '061000', '116.86643', '38.31438', '116.872861', '38.320652', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (130903, 130900, 3, '运河区', '运河', '0317', '061000', '116.85706', '38.31352', '116.863537', '38.319653', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (130921, 130900, 3, '沧县', '沧县', '0317', '061000', '116.87817', '38.29361', '116.884568', '38.299963', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (130922, 130900, 3, '青县', '青县', '0317', '062650', '116.80316', '38.58345', '116.80973', '38.589226', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (130923, 130900, 3, '东光县', '东光', '0317', '061600', '116.53668', '37.8857', '116.543088', '37.891919', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (130924, 130900, 3, '海兴县', '海兴', '0317', '061200', '117.49758', '38.13958', '117.503994', '38.145788', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (130925, 130900, 3, '盐山县', '盐山', '0317', '061300', '117.23092', '38.05647', '117.237333', '38.062787', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (130926, 130900, 3, '肃宁县', '肃宁', '0317', '062350', '115.82971', '38.42272', '115.836226', '38.428731', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (130927, 130900, 3, '南皮县', '南皮', '0317', '061500', '116.70224', '38.04109', '116.708854', '38.046743', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (130928, 130900, 3, '吴桥县', '吴桥', '0317', '061800', '116.3847', '37.62546', '116.391116', '37.631701', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (130929, 130900, 3, '献县', '献县', '0317', '062250', '116.12695', '38.19228', '116.133487', '38.198231', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (130930, 130900, 3, '孟村回族自治县', '孟村', '0317', '061400', '117.10412', '38.05338', '117.110555', '38.059621', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (130981, 130900, 3, '泊头市', '泊头', '0317', '062150', '116.57824', '38.08359', '116.584868', '38.089246', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (130982, 130900, 3, '任丘市', '任丘', '0317', '062550', '116.1033', '38.71124', '116.109904', '38.716893', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (130983, 130900, 3, '黄骅市', '黄骅', '0317', '061100', '117.33883', '38.3706', '117.34526', '38.376751', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (130984, 130900, 3, '河间市', '河间', '0317', '062450', '116.0993', '38.44549', '116.105928', '38.451146', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (130985, 130900, 3, '渤海新区', '渤海新区', '0317', '061100', '117.772562', '38.269508', '117.779158', '38.275178', NULL, '新区');
INSERT INTO `yx_dev_region` VALUES (130986, 130900, 3, '高新区', '高新区', '0317', '061000', '116.802042', '38.339873', '116.80861', '38.345666', NULL, '高新技术开发区');
INSERT INTO `yx_dev_region` VALUES (130987, 130900, 3, '临港开发区', '临港开发区', '0317', '061000', '117.520393', '38.356305', '117.526938', '38.362118', NULL, '经济技术开发区');
INSERT INTO `yx_dev_region` VALUES (131000, 130000, 2, '廊坊市', '廊坊', '0316', '065000', '116.713873', '39.529244', '116.720472', '39.534986', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (131002, 131000, 3, '安次区', '安次', '0316', '065000', '116.70308', '39.52057', '116.709713', '39.52623', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (131003, 131000, 3, '广阳区', '广阳', '0316', '065000', '116.71069', '39.52278', '116.717305', '39.528488', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (131022, 131000, 3, '固安县', '固安', '0316', '065500', '116.29916', '39.43833', '116.305581', '39.444512', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (131023, 131000, 3, '永清县', '永清', '0316', '065600', '116.50091', '39.32069', '116.507329', '39.326873', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (131024, 131000, 3, '香河县', '香河', '0316', '065400', '117.00634', '39.76133', '117.012743', '39.767667', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (131025, 131000, 3, '大城县', '大城', '0316', '065900', '116.65353', '38.70534', '116.659937', '38.711604', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (131026, 131000, 3, '文安县', '文安', '0316', '065800', '116.45846', '38.87325', '116.46507', '38.8789', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (131028, 131000, 3, '大厂回族自治县', '大厂', '0316', '065300', '116.98916', '39.88649', '116.995571', '39.89279', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (131081, 131000, 3, '霸州市', '霸州', '0316', '065700', '116.39154', '39.12569', '116.39794', '39.132007', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (131082, 131000, 3, '三河市', '三河', '0316', '065200', '117.07229', '39.98358', '117.078904', '39.989305', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (131083, 131000, 3, '经济技术开发区', '经济技术开发区', '0316', '065001', '116.758484', '39.56678', '116.764847', '39.573123', NULL, '经济技术开发区');
INSERT INTO `yx_dev_region` VALUES (131100, 130000, 2, '衡水市', '衡水', '0318', '053000', '115.665993', '37.735097', '115.672414', '37.741356', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (131102, 131100, 3, '桃城区', '桃城', '0318', '053000', '115.67529', '37.73499', '115.681685', '37.741328', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (131103, 131100, 3, '冀州区', '冀州', '0318', '053200', '115.57934', '37.55082', '115.585772', '37.557001', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (131121, 131100, 3, '枣强县', '枣强', '0318', '053100', '115.72576', '37.51027', '115.732333', '37.516012', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (131122, 131100, 3, '武邑县', '武邑', '0318', '053400', '115.88748', '37.80181', '115.893997', '37.807765', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (131123, 131100, 3, '武强县', '武强', '0318', '053300', '115.98226', '38.04138', '115.988875', '38.047035', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (131124, 131100, 3, '饶阳县', '饶阳', '0318', '053900', '115.72558', '38.23529', '115.73215', '38.241033', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (131125, 131100, 3, '安平县', '安平', '0318', '053600', '115.51876', '38.23388', '115.525311', '38.239683', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (131126, 131100, 3, '故城县', '故城', '0318', '253800', '115.97076', '37.34773', '115.977378', '37.353428', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (131127, 131100, 3, '景县', '景县', '0318', '053500', '116.26904', '37.6926', '116.275457', '37.698897', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (131128, 131100, 3, '阜城县', '阜城', '0318', '053700', '116.14431', '37.86881', '116.150724', '37.875045', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (131182, 131100, 3, '深州市', '深州', '0318', '053800', '115.55993', '38.00109', '115.566299', '38.007431', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (131183, 131100, 3, '经济开发区', '经济开发区', '0318', '053000', '115.638084', '37.730584', '115.644659', '37.736384', NULL, '经济技术开发区');
INSERT INTO `yx_dev_region` VALUES (131184, 131100, 3, '滨湖新区', '滨湖新区', '0318', '053000', '115.652541', '37.652507', '115.659007', '37.658547', NULL, '新区');
INSERT INTO `yx_dev_region` VALUES (140000, 100000, 1, '山西省', '山西', NULL, NULL, '112.549248', '37.857014', '112.555655', '37.863301', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (140100, 140000, 2, '太原市', '太原', '0351', '030000', '112.549248', '37.857014', '112.555655', '37.863301', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (140105, 140100, 3, '小店区', '小店', '0351', '030000', '112.56878', '37.73565', '112.575183', '37.741954', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (140106, 140100, 3, '迎泽区', '迎泽', '0351', '030000', '112.56338', '37.86326', '112.569765', '37.869591', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (140107, 140100, 3, '杏花岭区', '杏花岭', '0351', '030000', '112.56237', '37.88429', '112.568739', '37.890619', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (140108, 140100, 3, '尖草坪区', '尖草坪', '0351', '030000', '112.48709', '37.94193', '112.493696', '37.947673', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (140109, 140100, 3, '万柏林区', '万柏林', '0351', '030000', '112.51553', '37.85923', '112.522109', '37.864998', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (140110, 140100, 3, '晋源区', '晋源', '0351', '030000', '112.47985', '37.72479', '112.486419', '37.730628', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (140121, 140100, 3, '清徐县', '清徐', '0351', '030400', '112.35888', '37.60758', '112.365442', '37.613433', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (140122, 140100, 3, '阳曲县', '阳曲', '0351', '030100', '112.67861', '38.05989', '112.685012', '38.066233', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (140123, 140100, 3, '娄烦县', '娄烦', '0351', '030300', '111.79473', '38.06689', '111.801331', '38.072656', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (140181, 140100, 3, '古交市', '古交', '0351', '030200', '112.16918', '37.90983', '112.175675', '37.915812', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (140182, 140100, 3, '高新阳曲园区', '阳曲园区', '0351', '030100', '112.560066', '37.800816', '112.566453', '37.807154', NULL, '高新技术开发区');
INSERT INTO `yx_dev_region` VALUES (140183, 140100, 3, '高新汾东园区', '汾东园区', '0351', '030032', '112.580394', '37.704707', '112.586858', '37.710876', NULL, '高新技术开发区');
INSERT INTO `yx_dev_region` VALUES (140184, 140100, 3, '高新姚村园区', '姚村园区', '0351', '030054', '112.394774', '37.646479', '112.401336', '37.652232', NULL, '高新技术开发区');
INSERT INTO `yx_dev_region` VALUES (140200, 140000, 2, '大同市', '大同', '0352', '037000', '113.295259', '40.09031', '113.301685', '40.09655', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (140212, 140200, 3, '新荣区', '新荣', '0352', '037002', '113.13504', '40.25618', '113.141512', '40.26227', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (140213, 140200, 3, '平城区', '平城', '0352', '037008', '113.298027', '40.075667', '113.304452', '40.081865', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (140214, 140200, 3, '云冈区', '云冈', '0352', '037001', '113.149693', '40.005405', '113.156103', '40.011701', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (140215, 140200, 3, '云州区', '云州', '0352', '037300', '113.61244', '40.040295', '113.618908', '40.046333', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (140221, 140200, 3, '阳高县', '阳高', '0352', '038100', '113.75012', '40.36256', '113.75653', '40.368862', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (140222, 140200, 3, '天镇县', '天镇', '0352', '038200', '114.0931', '40.42299', '114.099566', '40.42904', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (140223, 140200, 3, '广灵县', '广灵', '0352', '037500', '114.28204', '39.76082', '114.288626', '39.766623', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (140224, 140200, 3, '灵丘县', '灵丘', '0352', '034400', '114.23672', '39.44043', '114.243087', '39.446762', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (140225, 140200, 3, '浑源县', '浑源', '0352', '037400', '113.69552', '39.69962', '113.702119', '39.705282', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (140226, 140200, 3, '左云县', '左云', '0352', '037100', '112.70266', '40.01336', '112.709121', '40.019489', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (140228, 140200, 3, '经济开发区', '经济开发区', '0352', '037000', '113.395224', '40.070492', '113.401599', '40.076818', NULL, '经济技术开发区');
INSERT INTO `yx_dev_region` VALUES (140300, 140000, 2, '阳泉市', '阳泉', '0353', '045000', '113.583285', '37.861188', '113.589896', '37.866852', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (140302, 140300, 3, '城区', '城区', '0353', '045000', '113.60069', '37.8474', '113.607255', '37.853244', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (140303, 140300, 3, '矿区', '矿区', '0353', '045000', '113.55677', '37.86895', '113.563301', '37.874829', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (140311, 140300, 3, '郊区', '郊区', '0353', '045000', '113.58539', '37.94139', '113.592016', '37.947068', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (140321, 140300, 3, '平定县', '平定', '0353', '045200', '113.65789', '37.78601', '113.66431', '37.792208', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (140322, 140300, 3, '盂县', '盂县', '0353', '045100', '113.41235', '38.08579', '113.418772', '38.092066', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (140400, 140000, 2, '长治市', '长治', '0355', '046000', '113.113556', '36.191112', '113.120128', '36.196851', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (140403, 140400, 3, '潞州区', '潞州', '0355', '046000', '113.110385', '36.213338', '113.116959', '36.219042', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (140404, 140400, 3, '上党区', '上党', '0355', '047100', '113.04791', '36.04722', '113.054323', '36.053534', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (140405, 140400, 3, '屯留区', '屯留', '0355', '046100', '112.89196', '36.31579', '112.898435', '36.32182', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (140406, 140400, 3, '潞城区', '潞城', '0355', '047500', '113.22888', '36.33414', '113.235459', '36.33983', '行政区', '县级');
INSERT INTO `yx_dev_region` VALUES (140423, 140400, 3, '襄垣县', '襄垣', '0355', '046200', '113.05157', '36.53527', '113.057985', '36.54155', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (140425, 140400, 3, '平顺县', '平顺', '0355', '047400', '113.43603', '36.20005', '113.442547', '36.205939', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (140426, 140400, 3, '黎城县', '黎城', '0355', '047600', '113.38766', '36.50301', '113.39409', '36.509287', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (140427, 140400, 3, '壶关县', '壶关', '0355', '047300', '113.207', '36.11301', '113.213577', '36.118744', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (140428, 140400, 3, '长子县', '长子', '0355', '046600', '112.87731', '36.12125', '112.883878', '36.127042', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (140429, 140400, 3, '武乡县', '武乡', '0355', '046300', '112.86343', '36.83687', '112.870036', '36.842536', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (140430, 140400, 3, '沁县', '沁县', '0355', '046400', '112.69863', '36.75628', '112.705086', '36.762475', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (140431, 140400, 3, '沁源县', '沁源', '0355', '046500', '112.33758', '36.50008', '112.34403', '36.506289', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (140500, 140000, 2, '晋城市', '晋城', '0356', '048000', '112.851274', '35.497553', '112.857852', '35.503244', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (140502, 140500, 3, '城区', '城区', '0356', '048000', '112.85319', '35.50175', '112.859774', '35.507428', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (140521, 140500, 3, '沁水县', '沁水', '0356', '048200', '112.1871', '35.69102', '112.193525', '35.697285', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (140522, 140500, 3, '阳城县', '阳城', '0356', '048100', '112.41485', '35.48614', '112.421305', '35.492219', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (140524, 140500, 3, '陵川县', '陵川', '0356', '048300', '113.2806', '35.77532', '113.287006', '35.781664', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (140525, 140500, 3, '泽州县', '泽州', '0356', '048000', '112.83947', '35.50789', '112.846009', '35.513725', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (140581, 140500, 3, '高平市', '高平', '0356', '048400', '112.92288', '35.79705', '112.929292', '35.803391', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (140582, 140500, 3, '经济开发区', '经济开发区', '0356', '048000', '112.882055', '35.497734', '112.88858', '35.503592', NULL, '经济技术开发区');
INSERT INTO `yx_dev_region` VALUES (140600, 140000, 2, '朔州市', '朔州', '0349', '036000', '112.433387', '39.331261', '112.439757', '39.337572', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (140602, 140600, 3, '朔城区', '朔城', '0349', '036002', '112.43189', '39.31982', '112.438266', '39.326122', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (140603, 140600, 3, '平鲁区', '平鲁', '0349', '036800', '112.28833', '39.51155', '112.294859', '39.517527', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (140621, 140600, 3, '山阴县', '山阴', '0349', '036900', '112.81662', '39.52697', '112.823055', '39.533192', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (140622, 140600, 3, '应县', '应县', '0349', '037600', '113.19052', '39.55279', '113.197012', '39.558777', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (140623, 140600, 3, '右玉县', '右玉', '0349', '037200', '112.46902', '39.99011', '112.475533', '39.996134', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (140681, 140600, 3, '怀仁市', '怀仁', '0349', '038300', '113.10009', '39.82806', '113.106698', '39.833717', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (140700, 140000, 2, '晋中市', '晋中', '0354', '030600', '112.736465', '37.696495', '112.743091', '37.702167', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (140702, 140700, 3, '榆次区', '榆次', '0354', '030600', '112.70788', '37.6978', '112.714383', '37.703843', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (140721, 140700, 3, '榆社县', '榆社', '0354', '031800', '112.97558', '37.0721', '112.982181', '37.077768', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (140722, 140700, 3, '左权县', '左权', '0354', '032600', '113.37918', '37.08235', '113.385631', '37.088508', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (140723, 140700, 3, '和顺县', '和顺', '0354', '032700', '113.56988', '37.32963', '113.576486', '37.335339', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (140724, 140700, 3, '昔阳县', '昔阳', '0354', '045300', '113.70517', '37.61863', '113.71178', '37.624302', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (140725, 140700, 3, '寿阳县', '寿阳', '0354', '045400', '113.17495', '37.88899', '113.18135', '37.895224', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (140726, 140700, 3, '太谷县', '太谷', '0354', '030800', '112.55246', '37.42161', '112.558841', '37.427917', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (140727, 140700, 3, '祁县', '祁县', '0354', '030900', '112.33358', '37.3579', '112.340012', '37.364161', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (140728, 140700, 3, '平遥县', '平遥', '0354', '031100', '112.17553', '37.1892', '112.181988', '37.195293', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (140729, 140700, 3, '灵石县', '灵石', '0354', '031300', '111.7774', '36.84814', '111.784017', '36.85381', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (140781, 140700, 3, '介休市', '介休', '0354', '032000', '111.91824', '37.02771', '111.924797', '37.033514', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (140800, 140000, 2, '运城市', '运城', '0359', '044000', '111.003957', '35.022778', '111.010339', '35.029099', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (140802, 140800, 3, '盐湖区', '盐湖', '0359', '044000', '110.99827', '35.0151', '111.004647', '35.021426', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (140821, 140800, 3, '临猗县', '临猗', '0359', '044100', '110.77432', '35.14455', '110.780729', '35.150789', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (140822, 140800, 3, '万荣县', '万荣', '0359', '044200', '110.83657', '35.41556', '110.843153', '35.421349', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (140823, 140800, 3, '闻喜县', '闻喜', '0359', '043800', '111.22265', '35.35553', '111.229071', '35.361731', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (140824, 140800, 3, '稷山县', '稷山', '0359', '043200', '110.97924', '35.59993', '110.985674', '35.60608', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (140825, 140800, 3, '新绛县', '新绛', '0359', '043100', '111.22509', '35.61566', '111.231496', '35.621891', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (140826, 140800, 3, '绛县', '绛县', '0359', '043600', '111.56668', '35.49096', '111.573179', '35.496896', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (140827, 140800, 3, '垣曲县', '垣曲', '0359', '043700', '111.67166', '35.29923', '111.678263', '35.304961', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (140828, 140800, 3, '夏县', '夏县', '0359', '044400', '111.21966', '35.14121', '111.226093', '35.147367', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (140829, 140800, 3, '平陆县', '平陆', '0359', '044300', '111.21704', '34.83772', '111.22352', '34.843846', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (140830, 140800, 3, '芮城县', '芮城', '0359', '044600', '110.69455', '34.69384', '110.701163', '34.699525', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (140881, 140800, 3, '永济市', '永济', '0359', '044500', '110.44537', '34.86556', '110.45194', '34.871319', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (140882, 140800, 3, '河津市', '河津', '0359', '043300', '110.7116', '35.59478', '110.718174', '35.600503', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (140900, 140000, 2, '忻州市', '忻州', '0350', '034000', '112.733538', '38.41769', '112.740162', '38.423376', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (140902, 140900, 3, '忻府区', '忻府', '0350', '034000', '112.74603', '38.40414', '112.752644', '38.40982', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (140921, 140900, 3, '定襄县', '定襄', '0350', '035400', '112.95733', '38.47387', '112.963861', '38.479739', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (140922, 140900, 3, '五台县', '五台', '0350', '035500', '113.25256', '38.72774', '113.259026', '38.733779', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (140923, 140900, 3, '代县', '代县', '0350', '034200', '112.95913', '39.06717', '112.965677', '39.073012', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (140924, 140900, 3, '繁峙县', '繁峙', '0350', '034300', '113.26303', '39.18886', '113.269447', '39.195071', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (140925, 140900, 3, '宁武县', '宁武', '0350', '036000', '112.30423', '39.00211', '112.310653', '39.008339', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (140926, 140900, 3, '静乐县', '静乐', '0350', '035100', '111.94158', '38.3602', '111.947998', '38.366386', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (140927, 140900, 3, '神池县', '神池', '0350', '036100', '112.20541', '39.09', '112.211779', '39.096317', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (140928, 140900, 3, '五寨县', '五寨', '0350', '036200', '111.8489', '38.90757', '111.855314', '38.913876', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (140929, 140900, 3, '岢岚县', '岢岚', '0350', '036300', '111.57388', '38.70452', '111.580352', '38.710586', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (140930, 140900, 3, '河曲县', '河曲', '0350', '036500', '111.13821', '39.38439', '111.14466', '39.390589', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (140931, 140900, 3, '保德县', '保德', '0350', '036600', '111.08656', '39.02248', '111.093098', '39.028426', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (140932, 140900, 3, '偏关县', '偏关', '0350', '036400', '111.50863', '39.43609', '111.515107', '39.442109', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (140981, 140900, 3, '原平市', '原平', '0350', '034100', '112.70584', '38.73181', '112.712296', '38.737877', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (141000, 140000, 2, '临汾市', '临汾', '0357', '041000', '111.517973', '36.08415', '111.524499', '36.090008', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (141002, 141000, 3, '尧都区', '尧都', '0357', '041000', '111.5787', '36.08298', '111.585135', '36.089122', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (141021, 141000, 3, '曲沃县', '曲沃', '0357', '043400', '111.47525', '35.64119', '111.481648', '35.647515', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (141022, 141000, 3, '翼城县', '翼城', '0357', '043500', '111.7181', '35.73881', '111.724476', '35.745138', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (141023, 141000, 3, '襄汾县', '襄汾', '0357', '041500', '111.44204', '35.87711', '111.448581', '35.882974', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (141024, 141000, 3, '洪洞县', '洪洞', '0357', '031600', '111.67501', '36.25425', '111.6816', '36.260017', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (141025, 141000, 3, '古县', '古县', '0357', '042400', '111.92041', '36.26688', '111.926981', '36.272724', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (141026, 141000, 3, '安泽县', '安泽', '0357', '042500', '112.24981', '36.14803', '112.256422', '36.153746', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (141027, 141000, 3, '浮山县', '浮山', '0357', '042600', '111.84744', '35.96854', '111.853821', '35.974844', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (141028, 141000, 3, '吉县', '吉县', '0357', '042200', '110.68148', '36.09873', '110.688024', '36.104537', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (141029, 141000, 3, '乡宁县', '乡宁', '0357', '042100', '110.84652', '35.97072', '110.853021', '35.976654', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (141030, 141000, 3, '大宁县', '大宁', '0357', '042300', '110.75216', '36.46624', '110.758547', '36.472541', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (141031, 141000, 3, '隰县', '隰县', '0357', '041300', '110.93881', '36.69258', '110.945401', '36.698242', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (141032, 141000, 3, '永和县', '永和', '0357', '041400', '110.63168', '36.7584', '110.638097', '36.764707', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (141033, 141000, 3, '蒲县', '蒲县', '0357', '041200', '111.09674', '36.41243', '111.10321', '36.418548', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (141034, 141000, 3, '汾西县', '汾西', '0357', '031500', '111.56811', '36.65063', '111.57463', '36.6566', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (141081, 141000, 3, '侯马市', '侯马', '0357', '043000', '111.37207', '35.61903', '111.378467', '35.625294', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (141082, 141000, 3, '霍州市', '霍州', '0357', '031400', '111.755', '36.5638', '111.76151', '36.569707', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (141100, 140000, 2, '吕梁市', '吕梁', '0358', '033000', '111.134335', '37.524366', '111.140735', '37.530604', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (141102, 141100, 3, '离石区', '离石', '0358', '033000', '111.15059', '37.5177', '111.157078', '37.523685', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (141121, 141100, 3, '文水县', '文水', '0358', '032100', '112.02829', '37.43841', '112.03489', '37.444105', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (141122, 141100, 3, '交城县', '交城', '0358', '030500', '112.1585', '37.5512', '112.165055', '37.557007', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (141123, 141100, 3, '兴县', '兴县', '0358', '033600', '111.12692', '38.46321', '111.133309', '38.469521', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (141124, 141100, 3, '临县', '临县', '0358', '033200', '110.99282', '37.95271', '110.999233', '37.959026', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (141125, 141100, 3, '柳林县', '柳林', '0358', '033300', '110.88922', '37.42932', '110.89561', '37.435611', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (141126, 141100, 3, '石楼县', '石楼', '0358', '032500', '110.8352', '36.99731', '110.841795', '37.003083', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (141127, 141100, 3, '岚县', '岚县', '0358', '035200', '111.67627', '38.27874', '111.682844', '38.284519', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (141128, 141100, 3, '方山县', '方山', '0358', '033100', '111.24011', '37.88979', '111.246477', '37.896117', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (141129, 141100, 3, '中阳县', '中阳', '0358', '033400', '111.1795', '37.35715', '111.18613', '37.362823', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (141130, 141100, 3, '交口县', '交口', '0358', '032400', '111.18103', '36.98213', '111.187658', '36.987803', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (141181, 141100, 3, '孝义市', '孝义', '0358', '032300', '111.77362', '37.14414', '111.780221', '37.149822', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (141182, 141100, 3, '汾阳市', '汾阳', '0358', '032200', '111.7882', '37.26605', '111.794796', '37.271743', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (150000, 100000, 1, '内蒙古自治区', '内蒙古', NULL, NULL, '111.670801', '40.818311', '111.67742', '40.824034', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (150100, 150000, 2, '呼和浩特市', '呼和浩特', '0471', '010000', '111.670801', '40.818311', '111.67742', '40.824034', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (150102, 150100, 3, '新城区', '新城', '0471', '010000', '111.66554', '40.85828', '111.672159', '40.86396', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (150103, 150100, 3, '回民区', '回民', '0471', '010000', '111.62402', '40.80827', '111.63049', '40.814376', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (150104, 150100, 3, '玉泉区', '玉泉', '0471', '010000', '111.67456', '40.75227', '111.681137', '40.758024', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (150105, 150100, 3, '赛罕区', '赛罕', '0471', '010020', '111.70224', '40.79207', '111.708659', '40.798268', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (150121, 150100, 3, '土默特左旗', '土左旗', '0471', '010100', '111.14898', '40.72229', '111.155489', '40.728313', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (150122, 150100, 3, '托克托县', '托克托', '0471', '010200', '111.19101', '40.27492', '111.197598', '40.280636', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (150123, 150100, 3, '和林格尔县', '和林格尔', '0471', '011500', '111.82205', '40.37892', '111.82848', '40.385118', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (150124, 150100, 3, '清水河县', '清水河', '0471', '011600', '111.68316', '39.9097', '111.689693', '39.915579', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (150125, 150100, 3, '武川县', '武川', '0471', '011700', '111.45785', '41.09289', '111.464308', '41.099026', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (150171, 150100, 3, '金海工业园区', '金海工业园区', '0471', '010000', '111.605784', '40.804354', '111.612171', '40.810675', NULL, '工业园区');
INSERT INTO `yx_dev_region` VALUES (150172, 150100, 3, '经济技术开发区', '经济开发区', '0471', '010000', '111.756774', '40.833734', '111.763335', '40.839624', NULL, '经济技术开发区');
INSERT INTO `yx_dev_region` VALUES (150200, 150000, 2, '包头市', '包头', '0472', '014000', '109.840405', '40.658168', '109.846951', '40.663991', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (150202, 150200, 3, '东河区', '东河', '0472', '014000', '110.0462', '40.58237', '110.052602', '40.588689', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (150203, 150200, 3, '昆都仑区', '昆都仑', '0472', '014010', '109.83862', '40.64175', '109.845156', '40.6476', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (150204, 150200, 3, '青山区', '青山', '0472', '014000', '109.90131', '40.64329', '109.907724', '40.649468', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (150205, 150200, 3, '石拐区', '石拐', '0472', '014070', '110.27322', '40.67297', '110.279599', '40.679278', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (150206, 150200, 3, '白云鄂博矿区', '白云矿区', '0472', '014080', '109.97367', '41.76968', '109.980298', '41.775371', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (150207, 150200, 3, '九原区', '九原', '0472', '014060', '109.96496', '40.60554', '109.971559', '40.611312', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (150221, 150200, 3, '土默特右旗', '土右旗', '0472', '014100', '110.52417', '40.5688', '110.53056', '40.575127', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (150222, 150200, 3, '固阳县', '固阳', '0472', '014200', '110.06372', '41.01851', '110.070163', '41.02461', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (150223, 150200, 3, '达尔罕茂明安联合旗', '达茂旗', '0472', '014500', '110.43258', '41.69875', '110.439098', '41.704706', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (150300, 150000, 2, '乌海市', '乌海', '0473', '016000', '106.825563', '39.673734', '106.832023', '39.679803', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (150302, 150300, 3, '海勃湾区', '海勃湾', '0473', '016000', '106.8222', '39.66955', '106.828644', '39.675674', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (150303, 150300, 3, '海南区', '海南', '0473', '016000', '106.88656', '39.44128', '106.893064', '39.447216', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (150304, 150300, 3, '乌达区', '乌达', '0473', '016000', '106.72723', '39.505', '106.733841', '39.510755', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (150400, 150000, 2, '赤峰市', '赤峰', '0476', '024000', '118.956806', '42.275317', '118.963368', '42.281199', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (150402, 150400, 3, '红山区', '红山', '0476', '024000', '118.95755', '42.24312', '118.964102', '42.248984', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (150403, 150400, 3, '元宝山区', '元宝山', '0476', '024000', '119.28921', '42.04005', '119.295615', '42.046373', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (150404, 150400, 3, '松山区', '松山', '0476', '024000', '118.9328', '42.28613', '118.939213', '42.292414', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (150421, 150400, 3, '阿鲁科尔沁旗', '阿旗', '0476', '025500', '120.06527', '43.87988', '120.07188', '43.885528', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (150422, 150400, 3, '巴林左旗', '左旗', '0476', '025450', '119.38012', '43.97031', '119.386562', '43.976494', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (150423, 150400, 3, '巴林右旗', '右旗', '0476', '025150', '118.66461', '43.53387', '118.671001', '43.54011', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (150424, 150400, 3, '林西县', '林西', '0476', '025250', '118.04733', '43.61165', '118.053856', '43.617604', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (150425, 150400, 3, '克什克腾旗', '克旗', '0476', '025350', '117.54562', '43.26501', '117.552239', '43.270671', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (150426, 150400, 3, '翁牛特旗', '翁旗', '0476', '024500', '119.03042', '42.93147', '119.036788', '42.937776', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (150428, 150400, 3, '喀喇沁旗', '喀旗', '0476', '024400', '118.70144', '41.92917', '118.707896', '41.935328', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (150429, 150400, 3, '宁城县', '宁城', '0476', '024200', '119.34375', '41.59661', '119.350358', '41.602254', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (150430, 150400, 3, '敖汉旗', '敖汉', '0476', '024300', '119.92163', '42.29071', '119.928211', '42.296507', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (150500, 150000, 2, '通辽市', '通辽', '0475', '028000', '122.263119', '43.617429', '122.269539', '43.623663', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (150502, 150500, 3, '科尔沁区', '科尔沁', '0475', '028000', '122.25573', '43.62257', '122.262189', '43.628677', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (150521, 150500, 3, '科尔沁左翼中旗', '科左中旗', '0475', '029300', '123.31912', '44.13014', '123.325673', '44.135934', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (150522, 150500, 3, '科尔沁左翼后旗', '科左后旗', '0475', '028100', '122.35745', '42.94897', '122.364018', '42.954742', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (150523, 150500, 3, '开鲁县', '开鲁', '0475', '028400', '121.31884', '43.60003', '121.325226', '43.606399', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (150524, 150500, 3, '库伦旗', '库伦', '0475', '028200', '121.776', '42.72998', '121.78247', '42.736096', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (150525, 150500, 3, '奈曼旗', '奈曼', '0475', '028300', '120.66348', '42.84527', '120.670112', '42.850916', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (150526, 150500, 3, '扎鲁特旗', '扎鲁特', '0475', '029100', '120.91507', '44.55592', '120.921682', '44.561671', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (150581, 150500, 3, '霍林郭勒市', '霍林郭勒', '0475', '029200', '119.65429', '45.53454', '119.660695', '45.540805', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (150600, 150000, 2, '鄂尔多斯市', '鄂尔多斯', '0477', '017000', '109.99029', '39.817179', '109.996875', '39.822889', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (150602, 150600, 3, '东胜区', '东胜', '0477', '017000', '109.96289', '39.82236', '109.96945', '39.828148', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (150603, 150600, 3, '康巴什区', '康巴什', '0477', '017000', '109.789197', '39.605387', '109.795602', '39.611667', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (150621, 150600, 3, '达拉特旗', '达拉特', '0477', '014300', '110.03317', '40.4001', '110.03954', '40.406403', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (150622, 150600, 3, '准格尔旗', '准格尔', '0477', '017100', '111.23645', '39.86783', '111.242851', '39.874165', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (150623, 150600, 3, '鄂托克前旗', '鄂前旗', '0477', '016200', '107.48403', '38.18396', '107.490583', '38.189867', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (150624, 150600, 3, '鄂托克旗', '鄂托克', '0477', '016100', '107.98226', '39.09456', '107.988672', '39.100747', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (150625, 150600, 3, '杭锦旗', '杭锦旗', '0477', '017400', '108.72934', '39.84023', '108.735735', '39.846518', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (150626, 150600, 3, '乌审旗', '乌审旗', '0477', '017300', '108.8461', '38.59092', '108.85248', '38.597226', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (150627, 150600, 3, '伊金霍洛旗', '伊金霍洛', '0477', '017200', '109.74908', '39.57393', '109.755667', '39.579631', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (150700, 150000, 2, '呼伦贝尔市', '呼伦贝尔', '0470', '021000', '119.758168', '49.215333', '119.764534', '49.221696', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (150702, 150700, 3, '海拉尔区', '海拉尔', '0470', '021000', '119.7364', '49.2122', '119.742862', '49.218323', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (150703, 150700, 3, '扎赉诺尔区', '扎赉诺尔', '0470', '021410', '117.792702', '49.486943', '117.79933', '49.49267', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (150721, 150700, 3, '阿荣旗', '阿荣旗', '0470', '162750', '123.45941', '48.12581', '123.465847', '48.131987', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (150722, 150700, 3, '莫力达瓦达斡尔族自治旗', '莫旗', '0470', '162850', '124.51498', '48.48055', '124.521583', '48.486286', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (150723, 150700, 3, '鄂伦春自治旗', '鄂伦春', '0470', '022450', '123.72604', '50.59777', '123.732381', '50.604117', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (150724, 150700, 3, '鄂温克族自治旗', '鄂温克旗', '0470', '021100', '119.7565', '49.14284', '119.762852', '49.149192', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (150725, 150700, 3, '陈巴尔虎旗', '陈旗', '0470', '021500', '119.42434', '49.32684', '119.430803', '49.332947', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (150726, 150700, 3, '新巴尔虎左旗', '新左旗', '0470', '021200', '118.26989', '48.21842', '118.276499', '48.224105', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (150727, 150700, 3, '新巴尔虎右旗', '新右旗', '0470', '021300', '116.82366', '48.66473', '116.830299', '48.670384', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (150781, 150700, 3, '满洲里市', '满洲里', '0470', '021400', '117.47946', '49.58272', '117.485828', '49.58908', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (150782, 150700, 3, '牙克石市', '牙克石', '0470', '022150', '120.7117', '49.2856', '120.718048', '49.291921', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (150783, 150700, 3, '扎兰屯市', '扎兰屯', '0470', '162650', '122.73757', '48.01363', '122.744027', '48.019777', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (150784, 150700, 3, '额尔古纳市', '额尔古纳', '0470', '022250', '120.19094', '50.24249', '120.19755', '50.24818', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (150785, 150700, 3, '根河市', '根河', '0470', '022350', '121.52197', '50.77996', '121.528548', '50.785818', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (150800, 150000, 2, '巴彦淖尔市', '巴彦淖尔', '0478', '015000', '107.416959', '40.757402', '107.423367', '40.7636', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (150802, 150800, 3, '临河区', '临河', '0478', '015000', '107.42668', '40.75827', '107.433144', '40.76432', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (150821, 150800, 3, '五原县', '五原', '0478', '015100', '108.26916', '41.09631', '108.275658', '41.102326', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (150822, 150800, 3, '磴口县', '磴口', '0478', '015200', '107.00936', '40.33062', '107.015874', '40.336613', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (150823, 150800, 3, '乌拉特前旗', '乌前旗', '0478', '014400', '108.65219', '40.73649', '108.658806', '40.742192', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (150824, 150800, 3, '乌拉特中旗', '乌中旗', '0478', '015300', '108.52587', '41.56789', '108.532473', '41.573654', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (150825, 150800, 3, '乌拉特后旗', '乌后旗', '0478', '015500', '106.98971', '41.43151', '106.996337', '41.437237', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (150826, 150800, 3, '杭锦后旗', '杭锦后旗', '0478', '015400', '107.15133', '40.88627', '107.157701', '40.892552', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (150900, 150000, 2, '乌兰察布市', '乌兰察布', '0474', '012000', '113.114543', '41.034126', '113.121126', '41.039878', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (150902, 150900, 3, '集宁区', '集宁', '0474', '012000', '113.11452', '41.0353', '113.121105', '41.041052', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (150921, 150900, 3, '卓资县', '卓资', '0474', '012300', '112.57757', '40.89414', '112.583977', '40.900338', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (150922, 150900, 3, '化德县', '化德', '0474', '013350', '114.01071', '41.90433', '114.017121', '41.910626', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (150923, 150900, 3, '商都县', '商都', '0474', '013400', '113.57772', '41.56213', '113.584359', '41.567797', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (150924, 150900, 3, '兴和县', '兴和', '0474', '013650', '113.83395', '40.87186', '113.84053', '40.877602', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (150925, 150900, 3, '凉城县', '凉城', '0474', '013750', '112.49569', '40.53346', '112.50229', '40.539124', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (150926, 150900, 3, '察哈尔右翼前旗', '察右前旗', '0474', '012200', '113.22131', '40.7788', '113.227915', '40.784455', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (150927, 150900, 3, '察哈尔右翼中旗', '察右中旗', '0474', '013500', '112.63537', '41.27742', '112.641953', '41.283185', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (150928, 150900, 3, '察哈尔右翼后旗', '察右后旗', '0474', '012400', '113.19216', '41.43554', '113.198692', '41.441508', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (150929, 150900, 3, '四子王旗', '四子王旗', '0474', '011800', '111.70654', '41.53312', '111.712957', '41.53938', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (150981, 150900, 3, '丰镇市', '丰镇', '0474', '012100', '113.10983', '40.4369', '113.116433', '40.442604', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (152200, 150000, 2, '兴安盟', '兴安盟', '0482', '137400', '122.070317', '46.076268', '122.076816', '46.082261', '行政区', '盟');
INSERT INTO `yx_dev_region` VALUES (152201, 152200, 3, '乌兰浩特市', '乌兰浩特', '0482', '137400', '122.06378', '46.06235', '122.070221', '46.068462', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (152202, 152200, 3, '阿尔山市', '阿尔山', '0482', '137400', '119.94317', '47.17716', '119.949824', '47.182811', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (152221, 152200, 3, '科尔沁右翼前旗', '科右前旗', '0482', '137400', '121.95269', '46.0795', '121.959209', '46.085448', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (152222, 152200, 3, '科尔沁右翼中旗', '科右中旗', '0482', '029400', '121.46807', '45.05605', '121.47456', '45.062088', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (152223, 152200, 3, '扎赉特旗', '扎赉特旗', '0482', '137600', '122.91229', '46.7267', '122.918819', '46.73266', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (152224, 152200, 3, '突泉县', '突泉', '0482', '137500', '121.59396', '45.38187', '121.600505', '45.387801', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (152500, 150000, 2, '锡林郭勒盟', '锡林郭勒盟', '0479', '026000', '116.090996', '43.944018', '116.097631', '43.949714', '行政区', '盟');
INSERT INTO `yx_dev_region` VALUES (152501, 152500, 3, '二连浩特市', '二连浩特', '0479', '012600', '111.98297', '43.65303', '111.989404', '43.659144', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (152502, 152500, 3, '锡林浩特市', '锡林浩特', '0479', '026000', '116.08603', '43.93341', '116.09264', '43.939155', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (152522, 152500, 3, '阿巴嘎旗', '阿巴嘎旗', '0479', '011400', '114.96826', '44.02174', '114.974625', '44.028047', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (152523, 152500, 3, '苏尼特左旗', '东苏旗', '0479', '011300', '113.6506', '43.85687', '113.656991', '43.863161', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (152524, 152500, 3, '苏尼特右旗', '西苏旗', '0479', '011200', '112.65741', '42.7469', '112.66388', '42.753035', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (152525, 152500, 3, '东乌珠穆沁旗', '东乌旗', '0479', '026300', '116.97293', '45.51108', '116.979428', '45.517141', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (152526, 152500, 3, '西乌珠穆沁旗', '西乌旗', '0479', '026200', '117.60983', '44.59623', '117.616199', '44.602532', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (152527, 152500, 3, '太仆寺旗', '太旗', '0479', '027000', '115.28302', '41.87727', '115.289562', '41.883145', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (152528, 152500, 3, '镶黄旗', '镶黄旗', '0479', '013250', '113.84472', '42.23927', '113.851254', '42.245177', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (152529, 152500, 3, '正镶白旗', '正镶白旗', '0479', '013800', '115.00067', '42.30712', '115.00723', '42.312935', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (152530, 152500, 3, '正蓝旗', '正蓝旗', '0479', '027200', '116.00363', '42.25229', '116.010183', '42.25818', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (152531, 152500, 3, '多伦县', '多伦', '0479', '027300', '116.48565', '42.203', '116.492161', '42.208915', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (152900, 150000, 2, '阿拉善盟', '阿拉善盟', '0483', '750300', '105.706422', '38.844814', '105.712816', '38.851048', '行政区', '盟');
INSERT INTO `yx_dev_region` VALUES (152921, 152900, 3, '阿拉善左旗', '阿左旗', '0483', '750300', '105.67532', '38.8293', '105.681892', '38.835076', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (152922, 152900, 3, '阿拉善右旗', '阿右旗', '0483', '737300', '101.66705', '39.21533', '101.673514', '39.22137', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (152923, 152900, 3, '额济纳旗', '额济纳', '0483', '735400', '101.06887', '41.96755', '101.075344', '41.97356', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (210000, 100000, 1, '辽宁省', '辽宁', NULL, NULL, '123.429096', '41.796767', '123.435725', '41.802444', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (210100, 210000, 2, '沈阳市', '沈阳', '024', '110000', '123.429096', '41.796767', '123.435725', '41.802444', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (210102, 210100, 3, '和平区', '和平', '024', '110000', '123.4204', '41.78997', '123.427044', '41.795606', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (210103, 210100, 3, '沈河区', '沈河', '024', '110000', '123.45871', '41.79625', '123.465173', '41.802419', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (210104, 210100, 3, '大东区', '大东', '024', '110000', '123.46997', '41.80539', '123.476375', '41.811715', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (210105, 210100, 3, '皇姑区', '皇姑', '024', '110000', '123.42527', '41.82035', '123.43189', '41.825994', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (210106, 210100, 3, '铁西区', '铁西', '024', '110020', '123.37675', '41.80269', '123.383185', '41.808932', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (210111, 210100, 3, '苏家屯区', '苏家屯', '024', '110101', '123.34405', '41.66475', '123.350484', '41.671004', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (210112, 210100, 3, '浑南区', '浑南区', '024', '110000', '123.457707', '41.719450', '123.464142', '41.72559', '行政区', '新区');
INSERT INTO `yx_dev_region` VALUES (210113, 210100, 3, '沈北新区', '沈北', '024', '110000', '123.52658', '42.05297', '123.533183', '42.05869', '行政区', '新区');
INSERT INTO `yx_dev_region` VALUES (210114, 210100, 3, '于洪区', '于洪', '024', '110000', '123.30807', '41.794', '123.314703', '41.799669', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (210115, 210100, 3, '辽中区', '辽中', '024', '110200', '122.72659', '41.51302', '122.733105', '41.518952', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (210123, 210100, 3, '康平县', '康平', '024', '110500', '123.35446', '42.75081', '123.360856', '42.757171', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (210124, 210100, 3, '法库县', '法库', '024', '110400', '123.41214', '42.50608', '123.418775', '42.511747', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (210181, 210100, 3, '新民市', '新民', '024', '110300', '122.82867', '41.99847', '122.835282', '42.004138', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (210182, 210100, 3, '高新区', '高新区', '024', '110000', '123.4466', '41.714636', '123.453109', '41.720566', NULL, '高新技术开发区');
INSERT INTO `yx_dev_region` VALUES (210200, 210000, 2, '大连市', '大连', '0411', '116000', '121.618622', '38.91459', '121.625257', '38.920232', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (210202, 210200, 3, '中山区', '中山', '0411', '116000', '121.64465', '38.91859', '121.651199', '38.924495', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (210203, 210200, 3, '西岗区', '西岗', '0411', '116000', '121.61238', '38.91469', '121.619006', '38.92036', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (210204, 210200, 3, '沙河口区', '沙河口', '0411', '116000', '121.58017', '38.90536', '121.586631', '38.911545', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (210211, 210200, 3, '甘井子区', '甘井子', '0411', '116000', '121.56567', '38.95017', '121.572049', '38.956516', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (210212, 210200, 3, '旅顺口区', '旅顺口', '0411', '116000', '121.26202', '38.85125', '121.268617', '38.856882', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (210213, 210200, 3, '金州区', '金州', '0411', '116000', '121.71893', '39.1004', '121.725467', '39.10623', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (210214, 210200, 3, '普兰店区', '普兰店', '0411', '116200', '121.96316', '39.39465', '121.969754', '39.400423', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (210224, 210200, 3, '长海县', '长海', '0411', '116500', '122.58859', '39.27274', '122.595215', '39.278415', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (210281, 210200, 3, '瓦房店市', '瓦房店', '0411', '116300', '121.98104', '39.62843', '121.987678', '39.634071', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (210283, 210200, 3, '庄河市', '庄河', '0411', '116400', '122.96725', '39.68815', '122.973748', '39.694091', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (210284, 210200, 3, '高新区', '高新区', '0411', '116000', '121.512402', '38.844665', '121.518977', '38.850369', NULL, '高新技术开发区');
INSERT INTO `yx_dev_region` VALUES (210285, 210200, 3, '经济开发区', '经济开发区', '0411', '116000', '121.863577', '39.063208', '121.870189', '39.068848', NULL, '经济技术开发区');
INSERT INTO `yx_dev_region` VALUES (210286, 210200, 3, '金普新区', '金普新区', '0411', '116100', '121.789627', '39.055451', '121.796031', '39.061765', NULL, '国家级新区');
INSERT INTO `yx_dev_region` VALUES (210300, 210000, 2, '鞍山市', '鞍山', '0412', '114000', '122.995632', '41.110626', '123.002002', '41.116982', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (210302, 210300, 3, '铁东区', '铁东', '0412', '114000', '122.99085', '41.08975', '122.99725', '41.096081', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (210303, 210300, 3, '铁西区', '铁西', '0412', '114000', '122.96967', '41.11977', '122.976156', '41.125758', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (210304, 210300, 3, '立山区', '立山', '0412', '114031', '123.02948', '41.15008', '123.035967', '41.156087', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (210311, 210300, 3, '千山区', '千山', '0412', '114000', '122.96048', '41.07507', '122.967057', '41.0809', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (210321, 210300, 3, '台安县', '台安', '0412', '114100', '122.43585', '41.41265', '122.442399', '41.418543', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (210323, 210300, 3, '岫岩满族自治县', '岫岩', '0412', '114300', '123.28875', '40.27996', '123.295334', '40.285647', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (210381, 210300, 3, '海城市', '海城', '0412', '114200', '122.68457', '40.88142', '122.691138', '40.88716', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (210382, 210300, 3, '高新区', '高新区', '0412', '114000', '123.052689', '41.105775', '123.059298', '41.111431', NULL, '高新技术开发区');
INSERT INTO `yx_dev_region` VALUES (210400, 210000, 2, '抚顺市', '抚顺', '024', '113000', '123.921109', '41.875956', '123.927661', '41.881788', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (210402, 210400, 3, '新抚区', '新抚', '024', '113000', '123.91264', '41.86205', '123.919224', '41.867752', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (210403, 210400, 3, '东洲区', '东洲', '024', '113000', '124.03759', '41.8519', '124.044147', '41.857669', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (210404, 210400, 3, '望花区', '望花', '024', '113000', '123.78283', '41.85532', '123.789436', '41.860947', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (210411, 210400, 3, '顺城区', '顺城', '024', '113000', '123.94506', '41.88321', '123.951474', '41.889475', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (210421, 210400, 3, '抚顺县', '抚顺', '024', '113100', '124.17755', '41.71217', '124.183991', '41.71831', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (210422, 210400, 3, '新宾满族自治县', '新宾', '024', '113200', '125.04049', '41.73409', '125.046846', '41.740459', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (210423, 210400, 3, '清原满族自治县', '清原', '024', '113300', '124.92807', '42.10221', '124.93444', '42.108547', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (210500, 210000, 2, '本溪市', '本溪', '024', '117000', '123.770519', '41.297909', '123.777143', '41.303588', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (210502, 210500, 3, '平山区', '平山', '024', '117000', '123.76892', '41.2997', '123.77554', '41.305395', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (210503, 210500, 3, '溪湖区', '溪湖', '024', '117000', '123.76764', '41.32921', '123.774249', '41.334917', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (210504, 210500, 3, '明山区', '明山', '024', '117000', '123.81746', '41.30827', '123.823932', '41.314418', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (210505, 210500, 3, '南芬区', '南芬', '024', '117000', '123.74523', '41.1006', '123.751699', '41.106692', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (210521, 210500, 3, '本溪满族自治县', '本溪', '024', '117100', '124.12741', '41.30059', '124.134025', '41.306301', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (210522, 210500, 3, '桓仁满族自治县', '桓仁', '024', '117200', '125.36062', '41.26798', '125.367167', '41.273799', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (210600, 210000, 2, '丹东市', '丹东', '0415', '118000', '124.383044', '40.124296', '124.389677', '40.129932', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (210602, 210600, 3, '元宝区', '元宝', '0415', '118000', '124.39575', '40.13651', '124.402335', '40.142258', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (210603, 210600, 3, '振兴区', '振兴', '0415', '118000', '124.36035', '40.10489', '124.36693', '40.110703', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (210604, 210600, 3, '振安区', '振安', '0415', '118000', '124.42816', '40.15826', '124.434546', '40.164559', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (210624, 210600, 3, '宽甸满族自治县', '宽甸', '0415', '118200', '124.78247', '40.73187', '124.788904', '40.7381', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (210681, 210600, 3, '东港市', '东港', '0415', '118300', '124.16287', '39.86256', '124.169431', '39.86843', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (210682, 210600, 3, '凤城市', '凤城', '0415', '118100', '124.06671', '40.45302', '124.073129', '40.45931', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (210700, 210000, 2, '锦州市', '锦州', '0416', '121000', '121.135742', '41.119269', '121.142346', '41.124909', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (210702, 210700, 3, '古塔区', '古塔', '0416', '121000', '121.12832', '41.11725', '121.134906', '41.122947', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (210703, 210700, 3, '凌河区', '凌河', '0416', '121000', '121.15089', '41.11496', '121.15748', '41.12065', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (210711, 210700, 3, '太和区', '太和', '0416', '121000', '121.10354', '41.10929', '121.10999', '41.115408', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (210726, 210700, 3, '黑山县', '黑山', '0416', '121400', '122.12081', '41.69417', '122.127374', '41.700002', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (210727, 210700, 3, '义县', '义县', '0416', '121100', '121.24035', '41.53458', '121.246927', '41.540397', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (210781, 210700, 3, '凌海市', '凌海', '0416', '121200', '121.35705', '41.1737', '121.363607', '41.179573', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (210782, 210700, 3, '北镇市', '北镇', '0416', '121300', '121.79858', '41.59537', '121.804942', '41.60173', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (210783, 210700, 3, '松山新区', '松山新区', '0416', '121221', '121.128876', '41.08964', '121.135489', '41.09534', NULL, '新区');
INSERT INTO `yx_dev_region` VALUES (210784, 210700, 3, '龙栖湾新区', '龙栖湾新区', '0416', '121007', '121.212807', '40.950883', '121.21923', '40.957174', NULL, '新区');
INSERT INTO `yx_dev_region` VALUES (210785, 210700, 3, '经济技术开发区', '经济技术开发区', '0416', '121007', '121.065822', '40.843928', '121.072246', '40.8502', NULL, '经济技术开发区');
INSERT INTO `yx_dev_region` VALUES (210800, 210000, 2, '营口市', '营口', '0417', '115000', '122.235151', '40.667432', '122.241725', '40.673171', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (210802, 210800, 3, '站前区', '站前', '0417', '115000', '122.25896', '40.67266', '122.265398', '40.678823', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (210803, 210800, 3, '西市区', '西市', '0417', '115000', '122.20641', '40.6664', '122.21299', '40.672118', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (210804, 210800, 3, '鲅鱼圈区', '鲅鱼圈', '0417', '115000', '122.13266', '40.26865', '122.139135', '40.274698', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (210811, 210800, 3, '老边区', '老边', '0417', '115000', '122.37996', '40.6803', '122.386399', '40.686483', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (210881, 210800, 3, '盖州市', '盖州', '0417', '115200', '122.35464', '40.40446', '122.361209', '40.41019', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (210882, 210800, 3, '大石桥市', '大石桥', '0417', '115100', '122.50927', '40.64567', '122.515648', '40.651975', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (210900, 210000, 2, '阜新市', '阜新', '0418', '123000', '121.648962', '42.011796', '121.65548', '42.01778', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (210902, 210900, 3, '海州区', '海州', '0418', '123000', '121.65626', '42.01336', '121.662732', '42.019482', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (210903, 210900, 3, '新邱区', '新邱', '0418', '123000', '121.79251', '42.09181', '121.798874', '42.098141', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (210904, 210900, 3, '太平区', '太平', '0418', '123000', '121.67865', '42.01065', '121.685034', '42.017018', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (210905, 210900, 3, '清河门区', '清河门', '0418', '123000', '121.4161', '41.78309', '121.422578', '41.78921', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (210911, 210900, 3, '细河区', '细河', '0418', '123000', '121.68013', '42.02533', '121.686522', '42.031701', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (210921, 210900, 3, '阜新蒙古族自治县', '阜新', '0418', '123100', '121.75787', '42.0651', '121.76444', '42.070882', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (210922, 210900, 3, '彰武县', '彰武', '0418', '123200', '122.54022', '42.38625', '122.546676', '42.392437', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (211000, 210000, 2, '辽阳市', '辽阳', '0419', '111000', '123.18152', '41.269402', '123.188133', '41.27503', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (211002, 211000, 3, '白塔区', '白塔', '0419', '111000', '123.1747', '41.27025', '123.18131', '41.275892', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (211003, 211000, 3, '文圣区', '文圣', '0419', '111000', '123.18521', '41.26267', '123.191814', '41.268309', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (211004, 211000, 3, '宏伟区', '宏伟', '0419', '111000', '123.1929', '41.21852', '123.199498', '41.224232', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (211005, 211000, 3, '弓长岭区', '弓长岭', '0419', '111000', '123.41963', '41.15181', '123.426246', '41.157437', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (211011, 211000, 3, '太子河区', '太子河', '0419', '111000', '123.18182', '41.25337', '123.188425', '41.258996', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (211021, 211000, 3, '辽阳县', '辽阳', '0419', '111200', '123.10574', '41.20542', '123.112162', '41.211695', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (211081, 211000, 3, '灯塔市', '灯塔', '0419', '111300', '123.33926', '41.42612', '123.345721', '41.432299', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (211100, 210000, 2, '盘锦市', '盘锦', '0427', '124000', '122.06957', '41.124484', '122.076049', '41.130486', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (211102, 211100, 3, '双台子区', '双台子', '0427', '124000', '122.06011', '41.1906', '122.066568', '41.196788', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (211103, 211100, 3, '兴隆台区', '兴隆台', '0427', '124000', '122.07529', '41.12402', '122.081806', '41.129914', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (211104, 211100, 3, '大洼区', '大洼', '0427', '124200', '122.08239', '41.00244', '122.088947', '41.008213', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (211122, 211100, 3, '盘山县', '盘山', '0427', '124100', '121.99777', '41.23805', '122.004329', '41.243826', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (211200, 210000, 2, '铁岭市', '铁岭', '024', '112000', '123.844279', '42.290585', '123.850664', '42.29695', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (211202, 211200, 3, '银州区', '银州', '024', '112000', '123.8573', '42.29507', '123.863727', '42.301301', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (211204, 211200, 3, '清河区', '清河', '024', '112000', '124.15911', '42.54679', '124.165672', '42.552587', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (211221, 211200, 3, '铁岭县', '铁岭', '024', '112600', '123.77325', '42.22498', '123.779855', '42.230627', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (211223, 211200, 3, '西丰县', '西丰', '024', '112400', '124.7304', '42.73756', '124.737027', '42.743237', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (211224, 211200, 3, '昌图县', '昌图', '024', '112500', '124.11206', '42.78428', '124.11857', '42.790238', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (211281, 211200, 3, '调兵山市', '调兵山', '024', '112700', '123.56689', '42.4675', '123.573399', '42.473436', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (211282, 211200, 3, '开原市', '开原', '024', '112300', '124.03945', '42.54585', '124.046011', '42.551653', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (211300, 210000, 2, '朝阳市', '朝阳', '0421', '122000', '120.451176', '41.576758', '120.457672', '41.582781', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (211302, 211300, 3, '双塔区', '双塔', '0421', '122000', '120.45385', '41.566', '120.460338', '41.572077', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (211303, 211300, 3, '龙城区', '龙城', '0421', '122000', '120.43719', '41.59264', '120.443756', '41.598411', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (211321, 211300, 3, '朝阳县', '朝阳', '0421', '122000', '120.17401', '41.4324', '120.180647', '41.438064', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (211322, 211300, 3, '建平县', '建平', '0421', '122400', '119.64392', '41.40315', '119.650302', '41.409502', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (211324, 211300, 3, '喀喇沁左翼蒙古族自治县', '喀喇沁左翼', '0421', '122300', '119.74185', '41.12801', '119.748259', '41.134212', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (211381, 211300, 3, '北票市', '北票', '0421', '122100', '120.76977', '41.80196', '120.776393', '41.807654', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (211382, 211300, 3, '凌源市', '凌源', '0421', '122500', '119.40148', '41.24558', '119.407838', '41.251931', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (211400, 210000, 2, '葫芦岛市', '葫芦岛', '0429', '125000', '120.856394', '40.755572', '120.8628', '40.761804', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (211402, 211400, 3, '连山区', '连山', '0429', '125000', '120.86393', '40.75554', '120.870378', '40.761649', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (211403, 211400, 3, '龙港区', '龙港', '0429', '125000', '120.94866', '40.71919', '120.955076', '40.725496', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (211404, 211400, 3, '南票区', '南票', '0429', '125000', '120.74978', '41.10707', '120.756272', '41.113072', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (211421, 211400, 3, '绥中县', '绥中', '0429', '125200', '120.34451', '40.32552', '120.350932', '40.33177', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (211422, 211400, 3, '建昌县', '建昌', '0429', '125300', '119.8377', '40.82448', '119.844292', '40.83027', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (211481, 211400, 3, '兴城市', '兴城', '0429', '125100', '120.72537', '40.61492', '120.731758', '40.62127', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (220000, 100000, 1, '吉林省', '吉林', NULL, NULL, '125.3245', '43.886841', '125.331072', '43.892576', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (220100, 220000, 2, '长春市', '长春', '0431', '130000', '125.3245', '43.886841', '125.331072', '43.892576', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (220102, 220100, 3, '南关区', '南关', '0431', '130000', '125.35035', '43.86401', '125.356959', '43.869686', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (220103, 220100, 3, '宽城区', '宽城', '0431', '130000', '125.32635', '43.90182', '125.332934', '43.907531', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (220104, 220100, 3, '朝阳区', '朝阳', '0431', '130000', '125.2883', '43.83339', '125.294699', '43.839737', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (220105, 220100, 3, '二道区', '二道', '0431', '130000', '125.37429', '43.86501', '125.380756', '43.871092', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (220106, 220100, 3, '绿园区', '绿园', '0431', '130000', '125.25582', '43.88045', '125.262264', '43.886557', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (220112, 220100, 3, '双阳区', '双阳', '0431', '130600', '125.65631', '43.52803', '125.662705', '43.534271', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (220113, 220100, 3, '九台区', '九台', '0431', '130500', '125.8395', '44.15163', '125.846061', '44.15743', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (220122, 220100, 3, '农安县', '农安', '0431', '130200', '125.18481', '44.43265', '125.191293', '44.438757', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (220182, 220100, 3, '榆树市', '榆树', '0431', '130400', '126.55688', '44.82523', '126.56346', '44.830987', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (220183, 220100, 3, '德惠市', '德惠', '0431', '130300', '125.70538', '44.53719', '125.712023', '44.542833', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (220184, 220100, 3, '长春新区', '长春新区', '0431', '130000', '125.338898', '43.870426', '125.34552', '43.876047', NULL, '国家级新区');
INSERT INTO `yx_dev_region` VALUES (220185, 220100, 3, '高新区', '高新区', '0431', '130000', '125.256516', '43.820958', '125.262989', '43.82709', NULL, '高新技术开发区');
INSERT INTO `yx_dev_region` VALUES (220186, 220100, 3, '经济技术开发区', '经济技术开发区', '0431', '130000', '125.41748', '43.86745', '125.423893', '43.873677', NULL, '经济技术开发区');
INSERT INTO `yx_dev_region` VALUES (220187, 220100, 3, '汽车产业开发区', '汽车产业开发区', '0431', '130000', '125.226804', '43.846775', '125.233439', '43.852427', NULL, '经济技术开发区');
INSERT INTO `yx_dev_region` VALUES (220188, 220100, 3, '兴隆综合保税区', '兴隆综合保税区', '0431', '130000', '125.484296', '43.954453', '125.490853', '43.960349', NULL, '经济技术开发区');
INSERT INTO `yx_dev_region` VALUES (220200, 220000, 2, '吉林市', '吉林', '0432', '132000', '126.55302', '43.843577', '126.559636', '43.849287', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (220202, 220200, 3, '昌邑区', '昌邑', '0432', '132000', '126.57424', '43.88183', '126.580694', '43.887908', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (220203, 220200, 3, '龙潭区', '龙潭', '0432', '132000', '126.56213', '43.91054', '126.568674', '43.916385', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (220204, 220200, 3, '船营区', '船营', '0432', '132000', '126.54096', '43.83344', '126.54761', '43.839067', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (220211, 220200, 3, '丰满区', '丰满', '0432', '132000', '126.56237', '43.82236', '126.568939', '43.828218', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (220221, 220200, 3, '永吉县', '永吉', '0432', '132100', '126.4963', '43.67197', '126.502706', '43.678217', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (220281, 220200, 3, '蛟河市', '蛟河', '0432', '132500', '127.34426', '43.72696', '127.350733', '43.733077', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (220282, 220200, 3, '桦甸市', '桦甸', '0432', '132400', '126.74624', '42.97206', '126.752726', '42.978138', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (220283, 220200, 3, '舒兰市', '舒兰', '0432', '132600', '126.9653', '44.40582', '126.971678', '44.412188', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (220284, 220200, 3, '磐石市', '磐石', '0432', '132300', '126.0625', '42.94628', '126.069115', '42.951901', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (220285, 220200, 3, '高新区', '高新区', '0432', '132000', '126.546936', '43.824666', '126.553577', '43.830317', NULL, '高新技术开发区');
INSERT INTO `yx_dev_region` VALUES (220300, 220000, 2, '四平市', '四平', '0434', '136000', '124.370785', '43.170344', '124.377381', '43.176007', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (220302, 220300, 3, '铁西区', '铁西', '0434', '136000', '124.37369', '43.17456', '124.380294', '43.180201', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (220303, 220300, 3, '铁东区', '铁东', '0434', '136000', '124.40976', '43.16241', '124.416244', '43.168399', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (220322, 220300, 3, '梨树县', '梨树', '0434', '136500', '124.33563', '43.30717', '124.342029', '43.313421', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (220323, 220300, 3, '伊通满族自治县', '伊通', '0434', '130700', '125.30596', '43.34434', '125.312451', '43.350425', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (220381, 220300, 3, '公主岭市', '公主岭', '0434', '136100', '124.82266', '43.50453', '124.829107', '43.510669', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (220382, 220300, 3, '双辽市', '双辽', '0434', '136400', '123.50106', '43.52099', '123.507484', '43.527151', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (220400, 220000, 2, '辽源市', '辽源', '0437', '136200', '125.145349', '42.902692', '125.151754', '42.908961', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (220402, 220400, 3, '龙山区', '龙山', '0437', '136200', '125.13641', '42.89714', '125.14287', '42.903265', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (220403, 220400, 3, '西安区', '西安', '0437', '136200', '125.14904', '42.927', '125.155413', '42.933309', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (220421, 220400, 3, '东丰县', '东丰', '0437', '136300', '125.53244', '42.6783', '125.538823', '42.684594', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (220422, 220400, 3, '东辽县', '东辽', '0437', '136600', '124.98596', '42.92492', '124.992564', '42.930557', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (220500, 220000, 2, '通化市', '通化', '0435', '134000', '125.936501', '41.721177', '125.943107', '41.7268', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (220502, 220500, 3, '东昌区', '东昌', '0435', '134000', '125.9551', '41.72849', '125.961669', '41.734218', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (220503, 220500, 3, '二道江区', '二道江', '0435', '134000', '126.04257', '41.7741', '126.049159', '41.779873', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (220521, 220500, 3, '通化县', '通化', '0435', '134100', '125.75936', '41.67928', '125.765752', '41.685663', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (220523, 220500, 3, '辉南县', '辉南', '0435', '135100', '126.04684', '42.68497', '126.053421', '42.690672', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (220524, 220500, 3, '柳河县', '柳河', '0435', '135300', '125.74475', '42.28468', '125.751175', '42.290948', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (220581, 220500, 3, '梅河口市', '梅河口', '0435', '135000', '125.71041', '42.53828', '125.717021', '42.543958', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (220582, 220500, 3, '集安市', '集安', '0435', '134200', '126.18829', '41.12268', '126.194884', '41.128331', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (220600, 220000, 2, '白山市', '白山', '0439', '134300', '126.427839', '41.942505', '126.434452', '41.948156', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (220602, 220600, 3, '浑江区', '浑江', '0439', '134300', '126.422342', '41.945656', '126.428961', '41.951278', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (220605, 220600, 3, '江源区', '江源', '0439', '134700', '126.59079', '42.05664', '126.597182', '42.062978', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (220621, 220600, 3, '抚松县', '抚松', '0439', '134500', '127.2803', '42.34198', '127.286846', '42.347789', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (220622, 220600, 3, '靖宇县', '靖宇', '0439', '135200', '126.81308', '42.38863', '126.819579', '42.394697', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (220623, 220600, 3, '长白朝鲜族自治县', '长白', '0439', '134400', '128.20047', '41.41996', '128.207051', '41.425765', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (220681, 220600, 3, '临江市', '临江', '0439', '134600', '126.91751', '41.81142', '126.924095', '41.817191', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (220700, 220000, 2, '松原市', '松原', '0438', '138000', '124.823608', '45.118243', '124.830062', '45.124365', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (220702, 220700, 3, '宁江区', '宁江', '0438', '138000', '124.81689', '45.17175', '124.823312', '45.17799', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (220721, 220700, 3, '前郭尔罗斯蒙古族自治县', '前郭尔罗斯', '0438', '131100', '124.82351', '45.11726', '124.829962', '45.123384', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (220722, 220700, 3, '长岭县', '长岭', '0438', '131500', '123.96725', '44.27581', '123.973623', '44.282154', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (220723, 220700, 3, '乾安县', '乾安', '0438', '131400', '124.02737', '45.01068', '124.034005', '45.016339', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (220781, 220700, 3, '扶余市', '扶余', '0438', '131200', '126.042758', '44.986199', '126.049329', '44.99196', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (220800, 220000, 2, '白城市', '白城', '0436', '137000', '122.841114', '45.619026', '122.847691', '45.624867', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (220802, 220800, 3, '洮北区', '洮北', '0436', '137000', '122.85104', '45.62167', '122.85755', '45.627696', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (220821, 220800, 3, '镇赉县', '镇赉', '0436', '137300', '123.19924', '45.84779', '123.205821', '45.853595', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (220822, 220800, 3, '通榆县', '通榆', '0436', '137200', '123.08761', '44.81388', '123.094133', '44.819836', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (220881, 220800, 3, '洮南市', '洮南', '0436', '137100', '122.78772', '45.33502', '122.794186', '45.341057', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (220882, 220800, 3, '大安市', '大安', '0436', '131300', '124.29519', '45.50846', '124.301672', '45.514567', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (222400, 220000, 2, '延边朝鲜族自治州', '延边', '0433', '133000', '129.513228', '42.904823', '129.519745', '42.910756', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (222401, 222400, 3, '延吉市', '延吉', '0433', '133000', '129.51357', '42.90682', '129.520087', '42.912746', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (222402, 222400, 3, '图们市', '图们', '0433', '133100', '129.84381', '42.96801', '129.850191', '42.974394', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (222403, 222400, 3, '敦化市', '敦化', '0433', '133700', '128.23242', '43.37304', '128.23903', '43.378736', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (222404, 222400, 3, '珲春市', '珲春', '0433', '133300', '130.36572', '42.86242', '130.372332', '42.868139', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (222405, 222400, 3, '龙井市', '龙井', '0433', '133400', '129.42584', '42.76804', '129.432473', '42.773673', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (222406, 222400, 3, '和龙市', '和龙', '0433', '133500', '129.01077', '42.5464', '129.017156', '42.552725', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (222424, 222400, 3, '汪清县', '汪清', '0433', '133200', '129.77121', '43.31278', '129.777819', '43.318429', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (222426, 222400, 3, '安图县', '安图', '0433', '133600', '128.90625', '43.11533', '128.912743', '43.121412', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (230000, 100000, 1, '黑龙江省', '黑龙江', NULL, NULL, '126.642464', '45.756967', '126.649065', '45.762743', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (230100, 230000, 2, '哈尔滨市', '哈尔滨', '0451', '150000', '126.642464', '45.756967', '126.649065', '45.762743', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (230102, 230100, 3, '道里区', '道里', '0451', '150000', '126.61705', '45.75586', '126.623482', '45.762105', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (230103, 230100, 3, '南岗区', '南岗', '0451', '150000', '126.66854', '45.75996', '126.67518', '45.765623', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (230104, 230100, 3, '道外区', '道外', '0451', '150000', '126.64938', '45.79187', '126.655986', '45.797543', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (230108, 230100, 3, '平房区', '平房', '0451', '150000', '126.63729', '45.59777', '126.643839', '45.603628', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (230109, 230100, 3, '松北区', '松北', '0451', '150000', '126.56276', '45.80831', '126.569292', '45.814163', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (230110, 230100, 3, '香坊区', '香坊', '0451', '150000', '126.67968', '45.72383', '126.686254', '45.729636', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (230111, 230100, 3, '呼兰区', '呼兰', '0451', '150500', '126.58792', '45.88895', '126.594319', '45.89526', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (230112, 230100, 3, '阿城区', '阿城', '0451', '150000', '126.97525', '45.54144', '126.981653', '45.547705', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (230113, 230100, 3, '双城区', '双城', '0451', '150100', '126.308784', '45.377942', '126.315421', '45.383608', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (230123, 230100, 3, '依兰县', '依兰', '0451', '154800', '129.56817', '46.3247', '129.574688', '46.330664', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (230124, 230100, 3, '方正县', '方正', '0451', '150800', '128.82952', '45.85162', '128.836152', '45.857284', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (230125, 230100, 3, '宾县', '宾县', '0451', '150400', '127.48675', '45.75504', '127.493374', '45.760752', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (230126, 230100, 3, '巴彦县', '巴彦', '0451', '151800', '127.40799', '46.08148', '127.414506', '46.08744', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (230127, 230100, 3, '木兰县', '木兰', '0451', '151900', '128.0448', '45.94944', '128.051157', '45.955809', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (230128, 230100, 3, '通河县', '通河', '0451', '150900', '128.74603', '45.99007', '128.752446', '45.996364', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (230129, 230100, 3, '延寿县', '延寿', '0451', '150700', '128.33419', '45.4554', '128.340802', '45.461026', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (230183, 230100, 3, '尚志市', '尚志', '0451', '150600', '127.96191', '45.21736', '127.968472', '45.22313', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (230184, 230100, 3, '五常市', '五常', '0451', '150200', '127.16751', '44.93184', '127.174035', '44.937793', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (230185, 230100, 3, '哈尔滨新区', '哈尔滨新区', '0451', '150000', '126.642464', '45.756967', '126.649065', '45.762743', NULL, '国家级新区');
INSERT INTO `yx_dev_region` VALUES (230186, 230100, 3, '高新区', '高新区', '0451', '150000', '126.498275', '45.791498', '126.504685', '45.797713', NULL, '高新技术开发区');
INSERT INTO `yx_dev_region` VALUES (230200, 230000, 2, '齐齐哈尔市', '齐齐哈尔', '0452', '161000', '123.953486', '47.348079', '123.959844', '47.354427', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (230202, 230200, 3, '龙沙区', '龙沙', '0452', '161000', '123.95752', '47.31776', '123.963896', '47.324135', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (230203, 230200, 3, '建华区', '建华', '0452', '161000', '124.0133', '47.36718', '124.019915', '47.372824', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (230204, 230200, 3, '铁锋区', '铁锋', '0452', '161000', '123.97821', '47.34075', '123.984627', '47.346965', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (230205, 230200, 3, '昂昂溪区', '昂昂溪', '0452', '161000', '123.82229', '47.15513', '123.8287', '47.161351', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (230206, 230200, 3, '富拉尔基区', '富拉尔基', '0452', '161000', '123.62918', '47.20884', '123.635684', '47.21486', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (230207, 230200, 3, '碾子山区', '碾子山', '0452', '161000', '122.88183', '47.51662', '122.888185', '47.522986', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (230208, 230200, 3, '梅里斯达斡尔族区', '梅里斯', '0452', '161000', '123.75274', '47.30946', '123.759279', '47.315414', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (230221, 230200, 3, '龙江县', '龙江', '0452', '161100', '123.20532', '47.33868', '123.211856', '47.344591', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (230223, 230200, 3, '依安县', '依安', '0452', '161500', '125.30896', '47.8931', '125.315464', '47.899125', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (230224, 230200, 3, '泰来县', '泰来', '0452', '162400', '123.42285', '46.39386', '123.429475', '46.399489', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (230225, 230200, 3, '甘南县', '甘南', '0452', '162100', '123.50317', '47.92437', '123.509633', '47.930505', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (230227, 230200, 3, '富裕县', '富裕', '0452', '161200', '124.47457', '47.77431', '124.481117', '47.780226', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (230229, 230200, 3, '克山县', '克山', '0452', '161600', '125.87396', '48.03265', '125.880342', '48.039016', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (230230, 230200, 3, '克东县', '克东', '0452', '164800', '126.24917', '48.03828', '126.255559', '48.044622', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (230231, 230200, 3, '拜泉县', '拜泉', '0452', '164700', '126.09167', '47.60817', '126.098139', '47.614196', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (230281, 230200, 3, '讷河市', '讷河', '0452', '161300', '124.87713', '48.48388', '124.883725', '48.489648', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (230282, 230200, 3, '高新区', '高新区', '0452', '161000', '123.9552', '47.308258', '123.961581', '47.314625', NULL, '高新技术开发区');
INSERT INTO `yx_dev_region` VALUES (230300, 230000, 2, '鸡西市', '鸡西', '0467', '158100', '130.975966', '45.300046', '130.982599', '45.305662', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (230302, 230300, 3, '鸡冠区', '鸡冠', '0467', '158100', '130.98139', '45.30396', '130.988022', '45.309567', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (230303, 230300, 3, '恒山区', '恒山', '0467', '158100', '130.90493', '45.21071', '130.911316', '45.21698', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (230304, 230300, 3, '滴道区', '滴道', '0467', '158100', '130.84841', '45.35109', '130.855013', '45.356765', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (230305, 230300, 3, '梨树区', '梨树', '0467', '158100', '130.69848', '45.09037', '130.704884', '45.096586', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (230306, 230300, 3, '城子河区', '城子河', '0467', '158100', '131.01132', '45.33689', '131.017793', '45.342911', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (230307, 230300, 3, '麻山区', '麻山', '0467', '158100', '130.47811', '45.21209', '130.484647', '45.217922', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (230321, 230300, 3, '鸡东县', '鸡东', '0467', '158200', '131.12423', '45.26025', '131.130787', '45.266139', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (230381, 230300, 3, '虎林市', '虎林', '0467', '158400', '132.93679', '45.76291', '132.943257', '45.769054', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (230382, 230300, 3, '密山市', '密山', '0467', '158300', '131.84625', '45.5297', '131.852786', '45.535626', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (230400, 230000, 2, '鹤岗市', '鹤岗', '0468', '154100', '130.277487', '47.332085', '130.284081', '47.33785', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (230402, 230400, 3, '向阳区', '向阳', '0468', '154100', '130.2943', '47.34247', '130.300766', '47.348556', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (230403, 230400, 3, '工农区', '工农', '0468', '154100', '130.27468', '47.31869', '130.281299', '47.324415', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (230404, 230400, 3, '南山区', '南山', '0468', '154100', '130.27676', '47.31404', '130.283369', '47.319797', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (230405, 230400, 3, '兴安区', '兴安', '0468', '154100', '130.23965', '47.2526', '130.2462', '47.258404', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (230406, 230400, 3, '东山区', '东山', '0468', '154100', '130.31706', '47.33853', '130.323421', '47.344917', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (230407, 230400, 3, '兴山区', '兴山', '0468', '154100', '130.29271', '47.35776', '130.299175', '47.36381', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (230421, 230400, 3, '萝北县', '萝北', '0468', '154200', '130.83346', '47.57959', '130.839986', '47.585519', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (230422, 230400, 3, '绥滨县', '绥滨', '0468', '156200', '131.86029', '47.2903', '131.866727', '47.296506', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (230500, 230000, 2, '双鸭山市', '双鸭山', '0469', '155100', '131.157304', '46.643442', '131.163648', '46.649825', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (230502, 230500, 3, '尖山区', '尖山', '0469', '155100', '131.15841', '46.64635', '131.164752', '46.652736', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (230503, 230500, 3, '岭东区', '岭东', '0469', '155100', '131.16473', '46.59043', '131.171113', '46.596818', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (230505, 230500, 3, '四方台区', '四方台', '0469', '155100', '131.33593', '46.59499', '131.342585', '46.600611', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (230506, 230500, 3, '宝山区', '宝山', '0469', '155100', '131.4016', '46.57718', '131.407976', '46.583578', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (230521, 230500, 3, '集贤县', '集贤', '0469', '155900', '131.14053', '46.72678', '131.146969', '46.73299', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (230522, 230500, 3, '友谊县', '友谊', '0469', '155800', '131.80789', '46.76739', '131.814484', '46.773065', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (230523, 230500, 3, '宝清县', '宝清', '0469', '155600', '132.19695', '46.32716', '132.203545', '46.332912', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (230524, 230500, 3, '饶河县', '饶河', '0469', '155700', '134.01986', '46.79899', '134.02629', '46.805188', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (230600, 230000, 2, '大庆市', '大庆', '0459', '163000', '125.11272', '46.590734', '125.119349', '46.596446', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (230602, 230600, 3, '萨尔图区', '萨尔图', '0459', '163000', '125.08792', '46.59359', '125.094551', '46.599294', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (230603, 230600, 3, '龙凤区', '龙凤', '0459', '163000', '125.11657', '46.53273', '125.123142', '46.53848', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (230604, 230600, 3, '让胡路区', '让胡路', '0459', '163000', '124.87075', '46.6522', '124.87735', '46.657876', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (230605, 230600, 3, '红岗区', '红岗', '0459', '163000', '124.89248', '46.40128', '124.898945', '46.407322', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (230606, 230600, 3, '大同区', '大同', '0459', '163000', '124.81591', '46.03295', '124.822305', '46.039198', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (230621, 230600, 3, '肇州县', '肇州', '0459', '166400', '125.27059', '45.70414', '125.276955', '45.710466', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (230622, 230600, 3, '肇源县', '肇源', '0459', '166500', '125.08456', '45.52032', '125.09117', '45.526067', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (230623, 230600, 3, '林甸县', '林甸', '0459', '166300', '124.87564', '47.18601', '124.882255', '47.191761', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (230624, 230600, 3, '杜尔伯特蒙古族自治县', '杜尔伯特', '0459', '166200', '124.44937', '46.86507', '124.455741', '46.871397', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (230625, 230600, 3, '高新区', '高新区', '0459', '163000', '125.15074', '46.58099', '125.157133', '46.587328', NULL, '高新技术开发区');
INSERT INTO `yx_dev_region` VALUES (230700, 230000, 2, '伊春市', '伊春', '0458', '153000', '128.899396', '47.724775', '128.905802', '47.730972', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (230702, 230700, 3, '伊春区', '伊春', '0458', '153000', '128.90752', '47.728', '128.913983', '47.734043', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (230703, 230700, 3, '南岔区', '南岔', '0458', '153000', '129.28362', '47.13897', '129.290196', '47.14471', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (230704, 230700, 3, '友好区', '友好', '0458', '153000', '128.84039', '47.85371', '128.846941', '47.859517', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (230705, 230700, 3, '西林区', '西林', '0458', '153000', '129.31201', '47.48103', '129.318608', '47.48671', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (230706, 230700, 3, '翠峦区', '翠峦', '0458', '153000', '128.66729', '47.72503', '128.673752', '47.731078', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (230707, 230700, 3, '新青区', '新青', '0458', '153000', '129.53653', '48.29067', '129.543181', '48.296291', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (230708, 230700, 3, '美溪区', '美溪', '0458', '153000', '129.13708', '47.63513', '129.143486', '47.641371', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (230709, 230700, 3, '金山屯区', '金山屯', '0458', '153000', '129.43768', '47.41349', '129.444278', '47.419261', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (230710, 230700, 3, '五营区', '五营', '0458', '153000', '129.24545', '48.10791', '129.2518', '48.114278', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (230711, 230700, 3, '乌马河区', '乌马河', '0458', '153000', '128.79672', '47.728', '128.803251', '47.73386', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (230712, 230700, 3, '汤旺河区', '汤旺河', '0458', '153000', '129.57226', '48.45182', '129.578724', '48.457859', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (230713, 230700, 3, '带岭区', '带岭', '0458', '153000', '129.02352', '47.02553', '129.02996', '47.031654', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (230714, 230700, 3, '乌伊岭区', '乌伊岭', '0458', '153000', '129.43981', '48.59602', '129.44638', '48.601821', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (230715, 230700, 3, '红星区', '红星', '0458', '153000', '129.3887', '48.23944', '129.39519', '48.245466', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (230716, 230700, 3, '上甘岭区', '上甘岭', '0458', '153000', '129.02447', '47.97522', '129.030911', '47.981324', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (230722, 230700, 3, '嘉荫县', '嘉荫', '0458', '153200', '130.39825', '48.8917', '130.404843', '48.897477', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (230781, 230700, 3, '铁力市', '铁力', '0458', '152500', '128.0317', '46.98571', '128.038067', '46.992056', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (230800, 230000, 2, '佳木斯市', '佳木斯', '0454', '154000', '130.361634', '46.809606', '130.368223', '46.815385', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (230803, 230800, 3, '向阳区', '向阳', '0454', '154000', '130.36519', '46.80778', '130.371798', '46.813503', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (230804, 230800, 3, '前进区', '前进', '0454', '154000', '130.37497', '46.81401', '130.381618', '46.819637', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (230805, 230800, 3, '东风区', '东风', '0454', '154000', '130.40366', '46.82257', '130.410223', '46.828449', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (230811, 230800, 3, '郊区', '郊区', '0454', '154000', '130.32731', '46.80958', '130.333689', '46.815946', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (230822, 230800, 3, '桦南县', '桦南', '0454', '154400', '130.55361', '46.23921', '130.559996', '46.245586', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (230826, 230800, 3, '桦川县', '桦川', '0454', '154300', '130.71893', '47.02297', '130.725479', '47.028788', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (230828, 230800, 3, '汤原县', '汤原', '0454', '154700', '129.90966', '46.72755', '129.916294', '46.733213', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (230881, 230800, 3, '同江市', '同江', '0454', '156400', '132.51095', '47.64211', '132.517459', '47.648091', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (230882, 230800, 3, '富锦市', '富锦', '0454', '156100', '132.03707', '47.25132', '132.043602', '47.25717', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (230883, 230800, 3, '抚远市', '抚远', '0454', '156500', '134.29595', '48.36794', '134.30236', '48.374213', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (230900, 230000, 2, '七台河市', '七台河', '0464', '154600', '131.015584', '45.771266', '131.022053', '45.777382', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (230902, 230900, 3, '新兴区', '新兴', '0464', '154600', '130.93212', '45.81624', '130.938491', '45.82255', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (230903, 230900, 3, '桃山区', '桃山', '0464', '154600', '131.01786', '45.76782', '131.024316', '45.773981', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (230904, 230900, 3, '茄子河区', '茄子河', '0464', '154600', '131.06807', '45.78519', '131.074551', '45.791228', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (230921, 230900, 3, '勃利县', '勃利', '0464', '154500', '130.59179', '45.755', '130.598321', '45.76097', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (231000, 230000, 2, '牡丹江市', '牡丹江', '0453', '157000', '129.618602', '44.582962', '129.625024', '44.58918', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (231002, 231000, 3, '东安区', '东安', '0453', '157000', '129.62665', '44.58133', '129.633125', '44.587397', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (231003, 231000, 3, '阳明区', '阳明', '0453', '157000', '129.63547', '44.59603', '129.641994', '44.601915', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (231004, 231000, 3, '爱民区', '爱民', '0453', '157000', '129.59077', '44.59648', '129.597137', '44.602819', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (231005, 231000, 3, '西安区', '西安', '0453', '157000', '129.61616', '44.57766', '129.622574', '44.583919', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (231025, 231000, 3, '林口县', '林口', '0453', '157600', '130.28393', '45.27809', '130.29049', '45.283974', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (231081, 231000, 3, '绥芬河市', '绥芬河', '0453', '157300', '131.15139', '44.41249', '131.157782', '44.418848', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (231083, 231000, 3, '海林市', '海林', '0453', '157100', '129.38156', '44.59', '129.387993', '44.596163', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (231084, 231000, 3, '宁安市', '宁安', '0453', '157400', '129.48303', '44.34016', '129.489398', '44.346544', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (231085, 231000, 3, '穆棱市', '穆棱', '0453', '157500', '130.52465', '44.919', '130.531204', '44.924898', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (231086, 231000, 3, '东宁市', '东宁', '0453', '157200', '131.12793', '44.0661', '131.134463', '44.072064', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (231100, 230000, 2, '黑河市', '黑河', '0456', '164300', '127.499023', '50.249585', '127.505655', '50.255196', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (231102, 231100, 3, '爱辉区', '爱辉', '0456', '164300', '127.50074', '50.25202', '127.507372', '50.25763', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (231121, 231100, 3, '嫩江县', '嫩江', '0456', '161400', '125.22607', '49.17844', '125.232693', '49.184077', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (231123, 231100, 3, '逊克县', '逊克', '0456', '164400', '128.47882', '49.57983', '128.485418', '49.585623', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (231124, 231100, 3, '孙吴县', '孙吴', '0456', '164200', '127.33599', '49.42539', '127.342378', '49.431641', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (231181, 231100, 3, '北安市', '北安', '0456', '164000', '126.48193', '48.23872', '126.488285', '48.245097', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (231182, 231100, 3, '五大连池市', '五大连池', '0456', '164100', '126.20294', '48.51507', '126.209511', '48.52094', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (231200, 230000, 2, '绥化市', '绥化', '0455', '152000', '126.99293', '46.637393', '126.999437', '46.643329', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (231202, 231200, 3, '北林区', '北林', '0455', '152000', '126.98564', '46.63735', '126.992094', '46.643431', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (231221, 231200, 3, '望奎县', '望奎', '0455', '152100', '126.48187', '46.83079', '126.488249', '46.837175', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (231222, 231200, 3, '兰西县', '兰西', '0455', '151500', '126.28994', '46.2525', '126.296567', '46.258175', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (231223, 231200, 3, '青冈县', '青冈', '0455', '151600', '126.11325', '46.68534', '126.119624', '46.691697', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (231224, 231200, 3, '庆安县', '庆安', '0455', '152400', '127.50753', '46.88016', '127.514144', '46.885801', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (231225, 231200, 3, '明水县', '明水', '0455', '151700', '125.90594', '47.17327', '125.912422', '47.179354', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (231226, 231200, 3, '绥棱县', '绥棱', '0455', '152200', '127.11584', '47.24267', '127.122365', '47.248549', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (231281, 231200, 3, '安达市', '安达', '0455', '151400', '125.34375', '46.4177', '125.350369', '46.423325', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (231282, 231200, 3, '肇东市', '肇东', '0455', '151100', '125.96243', '46.05131', '125.968965', '46.057157', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (231283, 231200, 3, '海伦市', '海伦', '0455', '152300', '126.9682', '47.46093', '126.97457', '47.467276', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (232700, 230000, 2, '大兴安岭地区', '大兴安岭', '0457', '165000', '124.711526', '52.335262', '124.718052', '52.341238', '行政区', '地区');
INSERT INTO `yx_dev_region` VALUES (232701, 232700, 3, '漠河市', '漠河', '0457', '165300', '122.53759', '52.97003', '122.544003', '52.976256', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (232721, 232700, 3, '呼玛县', '呼玛', '0457', '165100', '126.66174', '51.73112', '126.668405', '51.736746', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (232722, 232700, 3, '塔河县', '塔河', '0457', '165200', '124.70999', '52.33431', '124.716502', '52.340315', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (232761, 232700, 3, '加格达奇区', '加格达奇', '0457', '165000', '124.30954', '51.98144', '124.315923', '51.987765', NULL, '政企合一');
INSERT INTO `yx_dev_region` VALUES (232762, 232700, 3, '松岭区', '松岭', '0457', '165020', '124.189713', '51.985453', '124.196097', '51.99178', NULL, '政企合一');
INSERT INTO `yx_dev_region` VALUES (232763, 232700, 3, '新林区', '新林', '0457', '165010', '124.397983', '51.67341', '124.404562', '51.679185', NULL, '政企合一');
INSERT INTO `yx_dev_region` VALUES (232764, 232700, 3, '呼中区', '呼中', '0457', '165030', '123.60009', '52.03346', '123.606422', '52.039826', NULL, '政企合一');
INSERT INTO `yx_dev_region` VALUES (310000, 100000, 1, '上海', '上海', NULL, NULL, '121.472644', '31.231706', '121.479176', '31.237661', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (310100, 310000, 2, '上海市', '上海', '021', '200000', '121.472644', '31.231706', '121.479176', '31.237661', '行政区', '直辖市');
INSERT INTO `yx_dev_region` VALUES (310101, 310100, 3, '黄浦区', '黄浦', '021', '200001', '121.49295', '31.22337', '121.499556', '31.229035', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (310104, 310100, 3, '徐汇区', '徐汇', '021', '200030', '121.43676', '31.18831', '121.443157', '31.194666', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (310105, 310100, 3, '长宁区', '长宁', '021', '200050', '121.42462', '31.22036', '121.431072', '31.226617', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (310106, 310100, 3, '静安区', '静安', '021', '200040', '121.4444', '31.22884', '121.450828', '31.2352', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (310107, 310100, 3, '普陀区', '普陀', '021', '200333', '121.39703', '31.24951', '121.403599', '31.255284', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (310109, 310100, 3, '虹口区', '虹口', '021', '200080', '121.48162', '31.27788', '121.488158', '31.283668', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (310110, 310100, 3, '杨浦区', '杨浦', '021', '200082', '121.526', '31.2595', '121.53252', '31.265424', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (310112, 310100, 3, '闵行区', '闵行', '021', '201100', '121.38162', '31.11246', '121.388232', '31.118102', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (310113, 310100, 3, '宝山区', '宝山', '021', '201900', '121.4891', '31.4045', '121.495661', '31.410188', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (310114, 310100, 3, '嘉定区', '嘉定', '021', '201800', '121.2655', '31.37473', '121.272096', '31.380383', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (310115, 310100, 3, '浦东新区', '浦东', '021', '200120', '121.5447', '31.22249', '121.551153', '31.228748', '行政区', '国家级新区');
INSERT INTO `yx_dev_region` VALUES (310116, 310100, 3, '金山区', '金山', '021', '201500', '121.34164', '30.74163', '121.348118', '30.747789', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (310117, 310100, 3, '松江区', '松江', '021', '201600', '121.22879', '31.03222', '121.235273', '31.03824', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (310118, 310100, 3, '青浦区', '青浦', '021', '201700', '121.12417', '31.14974', '121.130724', '31.155492', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (310120, 310100, 3, '奉贤区', '奉贤', '021', '201400', '121.47412', '30.9179', '121.480624', '30.923818', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (310151, 310100, 3, '崇明区', '崇明', '021', '202150', '121.39758', '31.62278', '121.404135', '31.628559', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (310231, 310100, 3, '张江高新区', '张江高新区', '021', '201203', '121.635208', '31.219398', '121.64179', '31.225147', NULL, '高新技术开发区');
INSERT INTO `yx_dev_region` VALUES (310232, 310100, 3, '紫竹高新区', '紫竹高新区', '021', '200336', '121.448504', '31.021826', '121.454918', '31.028154', NULL, '高新技术开发区');
INSERT INTO `yx_dev_region` VALUES (310233, 310100, 3, '漕河泾开发区', '漕河泾开发区', '021', '200233', '121.397823', '31.170624', '121.404359', '31.176402', NULL, '经济技术开发区');
INSERT INTO `yx_dev_region` VALUES (320000, 100000, 1, '江苏省', '江苏', NULL, NULL, '118.767413', '32.041544', '118.773928', '32.047496', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (320100, 320000, 2, '南京市', '南京', '025', '210000', '118.767413', '32.041544', '118.773928', '32.047496', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (320102, 320100, 3, '玄武区', '玄武', '025', '210000', '118.79772', '32.04856', '118.804133', '32.054916', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (320104, 320100, 3, '秦淮区', '秦淮', '025', '210000', '118.79815', '32.01112', '118.804535', '32.01747', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (320105, 320100, 3, '建邺区', '建邺', '025', '210000', '118.76641', '32.03096', '118.772919', '32.036891', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (320106, 320100, 3, '鼓楼区', '鼓楼', '025', '210000', '118.76974', '32.06632', '118.77626', '32.07232', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (320111, 320100, 3, '浦口区', '浦口', '025', '210000', '118.62802', '32.05881', '118.634624', '32.064489', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (320113, 320100, 3, '栖霞区', '栖霞', '025', '210000', '118.88064', '32.11352', '118.887173', '32.119349', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (320114, 320100, 3, '雨花台区', '雨花台', '025', '210000', '118.7799', '31.99202', '118.786341', '31.998193', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (320115, 320100, 3, '江宁区', '江宁', '025', '211100', '118.8399', '31.95263', '118.846467', '31.958459', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (320116, 320100, 3, '六合区', '六合', '025', '211500', '118.8413', '32.34222', '118.847852', '32.348021', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (320117, 320100, 3, '溧水区', '溧水', '025', '211200', '119.028732', '31.653061', '119.035134', '31.659353', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (320118, 320100, 3, '高淳区', '高淳', '025', '211300', '118.87589', '31.327132', '118.88246', '31.332894', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (320119, 320100, 3, '江北新区', '江北新区', '025', '211500', '118.808899', '32.169219', '118.815322', '32.17554', NULL, '国家级新区');
INSERT INTO `yx_dev_region` VALUES (320120, 320100, 3, '高新区', '高新区', '025', '210000', '118.712815', '32.171025', '118.71934', '32.176976', NULL, '高新技术开发区');
INSERT INTO `yx_dev_region` VALUES (320200, 320000, 2, '无锡市', '无锡', '0510', '214000', '120.301663', '31.574729', '120.308271', '31.580373', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (320205, 320200, 3, '锡山区', '锡山', '0510', '214000', '120.35699', '31.5886', '120.363416', '31.594962', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (320206, 320200, 3, '惠山区', '惠山', '0510', '214000', '120.29849', '31.68088', '120.305086', '31.68652', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (320211, 320200, 3, '滨湖区', '滨湖', '0510', '214123', '120.29461', '31.52162', '120.301183', '31.527269', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (320213, 320200, 3, '梁溪区', '梁溪', '0510', '214002', '120.29975', '31.58002', '120.306361', '31.585664', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (320214, 320200, 3, '新吴区', '新吴', '0510', '214028', '120.363601', '31.490762', '120.370017', '31.497119', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (320281, 320200, 3, '江阴市', '江阴', '0510', '214400', '120.2853', '31.91996', '120.291869', '31.925701', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (320282, 320200, 3, '宜兴市', '宜兴', '0510', '214200', '119.82357', '31.33978', '119.830179', '31.345431', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (320300, 320000, 2, '徐州市', '徐州', '0516', '221000', '117.184811', '34.261792', '117.191409', '34.267451', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (320302, 320300, 3, '鼓楼区', '鼓楼', '0516', '221005', '117.18559', '34.28851', '117.192169', '34.294168', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (320303, 320300, 3, '云龙区', '云龙', '0516', '221007', '117.23053', '34.24895', '117.23695', '34.255262', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (320305, 320300, 3, '贾汪区', '贾汪', '0516', '221003', '117.45346', '34.44264', '117.459944', '34.448704', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (320311, 320300, 3, '泉山区', '泉山', '0516', '221006', '117.19378', '34.24418', '117.200371', '34.24992', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (320312, 320300, 3, '铜山区', '铜山', '0516', '221106', '117.183894', '34.19288', '117.190487', '34.198534', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (320321, 320300, 3, '丰县', '丰县', '0516', '221700', '116.59957', '34.69972', '116.606141', '34.705543', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (320322, 320300, 3, '沛县', '沛县', '0516', '221600', '116.93743', '34.72163', '116.944049', '34.727287', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (320324, 320300, 3, '睢宁县', '睢宁', '0516', '221200', '117.94104', '33.91269', '117.947473', '33.91888', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (320381, 320300, 3, '新沂市', '新沂', '0516', '221400', '118.35452', '34.36942', '118.361054', '34.37534', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (320382, 320300, 3, '邳州市', '邳州', '0516', '221300', '117.95858', '34.33329', '117.96499', '34.339646', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (320383, 320300, 3, '经济技术开发区', '经济技术开发区', '0516', '221000', '117.278725', '34.265385', '117.285265', '34.271228', NULL, '经济技术开发区');
INSERT INTO `yx_dev_region` VALUES (320384, 320300, 3, '高新区', '高新区', '0516', '221100', '117.180932', '34.162716', '117.187517', '34.16836', NULL, '高新技术开发区');
INSERT INTO `yx_dev_region` VALUES (320385, 320300, 3, '软件园', '软件园', '0516', '221100', '117.202215', '34.226085', '117.208775', '34.231951', NULL, '高新技术开发区');
INSERT INTO `yx_dev_region` VALUES (320400, 320000, 2, '常州市', '常州', '0519', '213000', '119.946973', '31.772752', '119.953543', '31.778411', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (320402, 320400, 3, '天宁区', '天宁', '0519', '213000', '119.95132', '31.75211', '119.957888', '31.757808', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (320404, 320400, 3, '钟楼区', '钟楼', '0519', '213000', '119.90178', '31.80221', '119.908242', '31.808361', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (320411, 320400, 3, '新北区', '新北', '0519', '213022', '119.97131', '31.83046', '119.977823', '31.83649', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (320412, 320400, 3, '武进区', '武进', '0519', '213100', '119.94244', '31.70086', '119.949051', '31.706508', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (320413, 320400, 3, '金坛区', '金坛', '0519', '213200', '119.57757', '31.74043', '119.584164', '31.746074', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (320481, 320400, 3, '溧阳市', '溧阳', '0519', '213300', '119.4837', '31.41538', '119.490212', '31.421259', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (320482, 320400, 3, '高新区', '高新区', '0519', '213000', '119.973139', '31.82896', '119.979643', '31.835024', NULL, '高新技术开发区');
INSERT INTO `yx_dev_region` VALUES (320500, 320000, 2, '苏州市', '苏州', '0512', '215000', '120.619585', '31.299379', '120.626019', '31.305562', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (320505, 320500, 3, '虎丘区', '虎丘', '0512', '215000', '120.57345', '31.2953', '120.579915', '31.30136', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (320506, 320500, 3, '吴中区', '吴中', '0512', '215100', '120.63211', '31.26226', '120.638618', '31.26822', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (320507, 320500, 3, '相城区', '相城', '0512', '215100', '120.64239', '31.36889', '120.648957', '31.374674', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (320508, 320500, 3, '姑苏区', '姑苏', '0512', '215031', '120.619585', '31.299379', '120.626019', '31.305562', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (320509, 320500, 3, '吴江区', '吴江', '0512', '215200', '120.638317', '31.159815', '120.64484', '31.165658', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (320581, 320500, 3, '常熟市', '常熟', '0512', '215500', '120.75225', '31.65374', '120.758742', '31.659692', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (320582, 320500, 3, '张家港市', '张家港', '0512', '215600', '120.55538', '31.87532', '120.561932', '31.881066', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (320583, 320500, 3, '昆山市', '昆山', '0512', '215300', '120.98074', '31.38464', '120.987191', '31.390808', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (320585, 320500, 3, '太仓市', '太仓', '0512', '215400', '121.10891', '31.4497', '121.115414', '31.455723', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (320586, 320500, 3, '苏州新区', '苏州新区', '0512', '215010', '120.524139', '31.372399', '120.53071', '31.378157', NULL, '新区');
INSERT INTO `yx_dev_region` VALUES (320587, 320500, 3, '工业园区', '工业园区', '0512', '215000', '120.671629', '31.317985', '120.678204', '31.323688', NULL, '工业园区');
INSERT INTO `yx_dev_region` VALUES (320588, 320500, 3, '高新区', '高新区', '0512', '215010', '120.434418', '31.327552', '120.440994', '31.333291', NULL, '高新技术开发区');
INSERT INTO `yx_dev_region` VALUES (320600, 320000, 2, '南通市', '南通', '0513', '226000', '120.864608', '32.016212', '120.871063', '32.022308', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (320602, 320600, 3, '崇川区', '崇川', '0513', '226000', '120.8573', '32.0098', '120.863721', '32.016019', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (320611, 320600, 3, '港闸区', '港闸', '0513', '226000', '120.81778', '32.03163', '120.824234', '32.037771', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (320612, 320600, 3, '通州区', '通州', '0513', '226300', '121.07293', '32.0676', '121.079359', '32.073944', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (320623, 320600, 3, '如东县', '如东', '0513', '226400', '121.18942', '32.31439', '121.195856', '32.320704', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (320681, 320600, 3, '启东市', '启东', '0513', '226200', '121.65985', '31.81083', '121.666313', '31.817013', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (320682, 320600, 3, '如皋市', '如皋', '0513', '226500', '120.55969', '32.37597', '120.566222', '32.381779', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (320684, 320600, 3, '海门市', '海门', '0513', '226100', '121.16995', '31.89422', '121.176431', '31.900214', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (320685, 320600, 3, '海安市', '海安', '0513', '226600', '120.45852', '32.54514', '120.464997', '32.551301', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (320686, 320600, 3, '经济技术开发区', '经济技术开发区', '0513', '226000', '120.957568', '31.924721', '120.963978', '31.931082', NULL, '经济技术开发区');
INSERT INTO `yx_dev_region` VALUES (320700, 320000, 2, '连云港市', '连云港', '0518', '222000', '119.178821', '34.600018', '119.18528', '34.60622', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (320703, 320700, 3, '连云区', '连云', '0518', '222000', '119.37304', '34.75293', '119.379511', '34.758983', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (320706, 320700, 3, '海州区', '海州', '0518', '222000', '119.13128', '34.56986', '119.137783', '34.575887', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (320707, 320700, 3, '赣榆区', '赣榆', '0518', '222100', '119.128774', '34.839154', '119.135298', '34.845136', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (320722, 320700, 3, '东海县', '东海', '0518', '222300', '118.77145', '34.54215', '118.777927', '34.548173', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (320723, 320700, 3, '灌云县', '灌云', '0518', '222200', '119.23925', '34.28391', '119.245787', '34.289714', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (320724, 320700, 3, '灌南县', '灌南', '0518', '223500', '119.35632', '34.09', '119.362897', '34.095768', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (320725, 320700, 3, '新海新区', '新海新区', '0518', '222006', '119.23295', '34.637054', '119.239516', '34.642771', NULL, '新区');
INSERT INTO `yx_dev_region` VALUES (320726, 320700, 3, '连云新城', '连云新城', '0518', '222000', '119.343458', '34.755267', '119.350047', '34.760911', NULL, '新区');
INSERT INTO `yx_dev_region` VALUES (320727, 320700, 3, '徐圩新区', '徐圩新区', '0518', '222000', '119.52352', '34.619731', '119.529918', '34.626084', NULL, '新区');
INSERT INTO `yx_dev_region` VALUES (320728, 320700, 3, '济技术开发区', '济技术开发区', '0518', '222000', '119.344495', '34.694934', '119.35111', '34.70059', NULL, '经济技术开发区');
INSERT INTO `yx_dev_region` VALUES (320800, 320000, 2, '淮安市', '淮安', '0517', '223000', '119.021265', '33.597506', '119.027706', '33.603704', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (320803, 320800, 3, '淮安区', '淮安', '0517', '223200', '119.021265', '33.597506', '119.027706', '33.603704', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (320804, 320800, 3, '淮阴区', '淮阴', '0517', '223300', '119.03485', '33.63171', '119.041272', '33.63806', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (320812, 320800, 3, '清江浦区', '清江浦', '0517', '223001', '119.00778', '33.59949', '119.014291', '33.605448', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (320813, 320800, 3, '洪泽区', '洪泽', '0517', '223100', '118.87344', '33.29429', '118.880022', '33.30002', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (320826, 320800, 3, '涟水县', '涟水', '0517', '223400', '119.26083', '33.78094', '119.267275', '33.787132', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (320830, 320800, 3, '盱眙县', '盱眙', '0517', '211700', '118.54495', '33.01086', '118.551391', '33.017114', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (320831, 320800, 3, '金湖县', '金湖', '0517', '211600', '119.02307', '33.02219', '119.029525', '33.028421', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (320832, 320800, 3, '经济开发区', '经济开发区', '0517', '223005', '119.02307', '33.02219', '119.029525', '33.028421', NULL, '经济技术开发区');
INSERT INTO `yx_dev_region` VALUES (320900, 320000, 2, '盐城市', '盐城', '0515', '224000', '120.139998', '33.377631', '120.146463', '33.383816', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (320902, 320900, 3, '亭湖区', '亭湖', '0515', '224005', '120.16583', '33.37825', '120.17242', '33.383989', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (320903, 320900, 3, '盐都区', '盐都', '0515', '224000', '120.15441', '33.3373', '120.160915', '33.343213', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (320904, 320900, 3, '大丰区', '大丰', '0515', '224100', '120.46594', '33.19893', '120.47235', '33.205193', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (320921, 320900, 3, '响水县', '响水', '0515', '224600', '119.56985', '34.20513', '119.576444', '34.210822', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (320922, 320900, 3, '滨海县', '滨海', '0515', '224500', '119.82058', '33.98972', '119.827201', '33.995366', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (320923, 320900, 3, '阜宁县', '阜宁', '0515', '224400', '119.80175', '33.78228', '119.808306', '33.788072', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (320924, 320900, 3, '射阳县', '射阳', '0515', '224300', '120.26043', '33.77636', '120.266885', '33.782534', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (320925, 320900, 3, '建湖县', '建湖', '0515', '224700', '119.79852', '33.47241', '119.805056', '33.478253', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (320981, 320900, 3, '东台市', '东台', '0515', '224200', '120.32376', '32.85078', '120.330272', '32.856659', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (321000, 320000, 2, '扬州市', '扬州', '0514', '225000', '119.421003', '32.393159', '119.427452', '32.39932', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (321002, 321000, 3, '广陵区', '广陵', '0514', '225000', '119.43186', '32.39472', '119.438364', '32.400684', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (321003, 321000, 3, '邗江区', '邗江', '0514', '225100', '119.39816', '32.3765', '119.404545', '32.382852', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (321012, 321000, 3, '江都区', '江都', '0514', '225200', '119.567481', '32.426564', '119.574077', '32.432285', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (321023, 321000, 3, '宝应县', '宝应', '0514', '225800', '119.31213', '33.23549', '119.318637', '33.241449', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (321081, 321000, 3, '仪征市', '仪征', '0514', '211400', '119.18432', '32.27197', '119.190784', '32.278073', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (321084, 321000, 3, '高邮市', '高邮', '0514', '225600', '119.45965', '32.78135', '119.466266', '32.786996', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (321100, 320000, 2, '镇江市', '镇江', '0511', '212000', '119.452753', '32.204402', '119.459357', '32.210073', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (321102, 321100, 3, '京口区', '京口', '0511', '212000', '119.46947', '32.19809', '119.476073', '32.20378', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (321111, 321100, 3, '润州区', '润州', '0511', '212000', '119.41134', '32.19523', '119.417779', '32.201532', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (321112, 321100, 3, '丹徒区', '丹徒', '0511', '212100', '119.43383', '32.13183', '119.44033', '32.137753', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (321181, 321100, 3, '丹阳市', '丹阳', '0511', '212300', '119.57525', '31.99121', '119.581832', '31.996859', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (321182, 321100, 3, '扬中市', '扬中', '0511', '212200', '119.79718', '32.2363', '119.803701', '32.242164', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (321183, 321100, 3, '句容市', '句容', '0511', '212400', '119.16482', '31.95591', '119.171246', '31.962261', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (321184, 321100, 3, '镇江新区', '镇江新区', '0511', '212000', '119.674455', '32.167915', '119.680985', '32.173834', NULL, '新区');
INSERT INTO `yx_dev_region` VALUES (321185, 321100, 3, '镇江新区', '丹徒新区', '0511', '212000', '119.434367', '32.127634', '119.44087', '32.133548', NULL, '新区');
INSERT INTO `yx_dev_region` VALUES (321186, 321100, 3, '经济开发区', '经济开发区', '0511', '212000', '119.665126', '32.16869', '119.67161', '32.174783', NULL, '经济技术开发区');
INSERT INTO `yx_dev_region` VALUES (321200, 320000, 2, '泰州市', '泰州', '0523', '225300', '119.915176', '32.484882', '119.921683', '32.490781', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (321202, 321200, 3, '海陵区', '海陵', '0523', '225300', '119.91942', '32.49101', '119.925947', '32.496834', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (321203, 321200, 3, '高港区', '高港', '0523', '225300', '119.88089', '32.31833', '119.887311', '32.324694', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (321204, 321200, 3, '姜堰区', '姜堰', '0523', '225500', '120.148208', '32.508483', '120.154688', '32.514514', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (321281, 321200, 3, '兴化市', '兴化', '0523', '225700', '119.85238', '32.90944', '119.858887', '32.91549', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (321282, 321200, 3, '靖江市', '靖江', '0523', '214500', '120.27291', '32.01595', '120.279406', '32.02189', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (321283, 321200, 3, '泰兴市', '泰兴', '0523', '225400', '120.05194', '32.17187', '120.058539', '32.177544', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (321300, 320000, 2, '宿迁市', '宿迁', '0527', '223800', '118.293328', '33.945154', '118.299797', '33.951212', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (321302, 321300, 3, '宿城区', '宿城', '0527', '223800', '118.29141', '33.94219', '118.297887', '33.948212', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (321311, 321300, 3, '宿豫区', '宿豫', '0527', '223800', '118.32922', '33.94673', '118.335617', '33.953041', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (321322, 321300, 3, '沭阳县', '沭阳', '0527', '223600', '118.76873', '34.11446', '118.775256', '34.120442', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (321323, 321300, 3, '泗阳县', '泗阳', '0527', '223700', '118.7033', '33.72096', '118.709766', '33.727083', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (321324, 321300, 3, '泗洪县', '泗洪', '0527', '223900', '118.21716', '33.45996', '118.223581', '33.466176', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (321325, 321300, 3, '高新区', '高新区', '0527', '223800', '118.267378', '33.892135', '118.27398', '33.897809', NULL, '高新技术开发区');
INSERT INTO `yx_dev_region` VALUES (330000, 100000, 1, '浙江省', '浙江', NULL, NULL, '120.153576', '30.287459', '120.160105', '30.293395', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (330100, 330000, 2, '杭州市', '杭州', '0571', '310000', '120.153576', '30.287459', '120.160105', '30.293395', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (330102, 330100, 3, '上城区', '上城', '0571', '310000', '120.16922', '30.24255', '120.175799', '30.248246', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (330103, 330100, 3, '下城区', '下城', '0571', '310000', '120.18096', '30.28153', '120.187567', '30.287174', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (330104, 330100, 3, '江干区', '江干', '0571', '310000', '120.20517', '30.2572', '120.211708', '30.263114', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (330105, 330100, 3, '拱墅区', '拱墅', '0571', '310000', '120.14209', '30.31968', '120.148537', '30.325821', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (330106, 330100, 3, '西湖区', '西湖', '0571', '310000', '120.12979', '30.25949', '120.136227', '30.265808', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (330108, 330100, 3, '滨江区', '滨江', '0571', '310000', '120.21194', '30.20835', '120.218411', '30.214382', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (330109, 330100, 3, '萧山区', '萧山', '0571', '311200', '120.26452', '30.18505', '120.270989', '30.191151', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (330110, 330100, 3, '余杭区', '余杭', '0571', '311100', '120.29986', '30.41829', '120.306453', '30.42393', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (330111, 330100, 3, '富阳区', '富阳', '0571', '311400', '119.96041', '30.04878', '119.966964', '30.054609', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (330112, 330100, 3, '临安区', '临安', '0571', '311300', '119.72473', '30.23447', '119.731249', '30.240371', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (330122, 330100, 3, '桐庐县', '桐庐', '0571', '311500', '119.68853', '29.79779', '119.695122', '29.803498', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (330127, 330100, 3, '淳安县', '淳安', '0571', '311700', '119.04257', '29.60988', '119.048963', '29.616229', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (330182, 330100, 3, '建德市', '建德', '0571', '311600', '119.28158', '29.47603', '119.287977', '29.482383', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (330186, 330100, 3, '高新区', '高新区', '0571', '310000', '120.20424', '30.187273', '120.21076', '30.193164', NULL, '高新技术开发区');
INSERT INTO `yx_dev_region` VALUES (330200, 330000, 2, '宁波市', '宁波', '0574', '315000', '121.549792', '29.868388', '121.556204', '29.874699', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (330203, 330200, 3, '海曙区', '海曙', '0574', '315000', '121.55106', '29.85977', '121.557463', '29.866091', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (330205, 330200, 3, '江北区', '江北', '0574', '315000', '121.55681', '29.88776', '121.563229', '29.894121', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (330206, 330200, 3, '北仑区', '北仑', '0574', '315800', '121.84408', '29.90069', '121.850657', '29.906448', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (330211, 330200, 3, '镇海区', '镇海', '0574', '315200', '121.71615', '29.94893', '121.72267', '29.954812', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (330212, 330200, 3, '鄞州区', '鄞州', '0574', '315100', '121.54754', '29.81614', '121.553973', '29.822431', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (330213, 330200, 3, '奉化区', '奉化', '0574', '315500', '121.41003', '29.65537', '121.416544', '29.661374', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (330225, 330200, 3, '象山县', '象山', '0574', '315700', '121.86917', '29.47758', '121.875733', '29.483252', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (330226, 330200, 3, '宁海县', '宁海', '0574', '315600', '121.43072', '29.2889', '121.437151', '29.295224', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (330281, 330200, 3, '余姚市', '余姚', '0574', '315400', '121.15341', '30.03867', '121.159996', '30.044397', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (330282, 330200, 3, '慈溪市', '慈溪', '0574', '315300', '121.26641', '30.16959', '121.273006', '30.175249', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (330284, 330200, 3, '杭州湾新区', '杭州湾新区', '0574', '315336', '121.314262', '30.291298', '121.320684', '30.297648', NULL, '新区');
INSERT INTO `yx_dev_region` VALUES (330285, 330200, 3, '高新区', '高新区', '0574', '315000', '121.659487', '29.889258', '121.665953', '29.895434', NULL, '高新技术开发区');
INSERT INTO `yx_dev_region` VALUES (330300, 330000, 2, '温州市', '温州', '0577', '325000', '120.672111', '28.000575', '120.678695', '28.006287', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (330302, 330300, 3, '鹿城区', '鹿城', '0577', '325000', '120.65505', '28.01489', '120.661636', '28.020541', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (330303, 330300, 3, '龙湾区', '龙湾', '0577', '325000', '120.83053', '27.91284', '120.836944', '27.919156', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (330304, 330300, 3, '瓯海区', '瓯海', '0577', '325000', '120.63751', '28.00714', '120.644054', '28.013004', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (330305, 330300, 3, '洞头区', '洞头', '0577', '325700', '121.15606', '27.83634', '121.162612', '27.842097', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (330324, 330300, 3, '永嘉县', '永嘉', '0577', '325100', '120.69317', '28.15456', '120.699643', '28.160617', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (330326, 330300, 3, '平阳县', '平阳', '0577', '325400', '120.56506', '27.66245', '120.571579', '27.668357', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (330327, 330300, 3, '苍南县', '苍南', '0577', '325800', '120.42608', '27.51739', '120.432676', '27.523051', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (330328, 330300, 3, '文成县', '文成', '0577', '325300', '120.09063', '27.78678', '120.09712', '27.79279', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (330329, 330300, 3, '泰顺县', '泰顺', '0577', '325500', '119.7182', '27.55694', '119.724733', '27.562728', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (330381, 330300, 3, '瑞安市', '瑞安', '0577', '325200', '120.65466', '27.78041', '120.66124', '27.786062', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (330382, 330300, 3, '乐清市', '乐清', '0577', '325600', '120.9617', '28.12404', '120.96813', '28.130405', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (330400, 330000, 2, '嘉兴市', '嘉兴', '0573', '314000', '120.750865', '30.762653', '120.757384', '30.76864', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (330402, 330400, 3, '南湖区', '南湖', '0573', '314051', '120.78524', '30.74865', '120.791848', '30.754306', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (330411, 330400, 3, '秀洲区', '秀洲', '0573', '314031', '120.70867', '30.76454', '120.715108', '30.770844', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (330421, 330400, 3, '嘉善县', '嘉善', '0573', '314100', '120.92559', '30.82993', '120.932101', '30.835844', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (330424, 330400, 3, '海盐县', '海盐', '0573', '314300', '120.9457', '30.52547', '120.952146', '30.531739', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (330481, 330400, 3, '海宁市', '海宁', '0573', '314400', '120.6813', '30.5097', '120.68786', '30.515546', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (330482, 330400, 3, '平湖市', '平湖', '0573', '314200', '121.02166', '30.69618', '121.028233', '30.701814', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (330483, 330400, 3, '桐乡市', '桐乡', '0573', '314500', '120.56485', '30.6302', '120.571394', '30.636109', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (330500, 330000, 2, '湖州市', '湖州', '0572', '313000', '120.102398', '30.867198', '120.108861', '30.873421', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (330502, 330500, 3, '吴兴区', '吴兴', '0572', '313000', '120.12548', '30.85752', '120.131907', '30.86387', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (330503, 330500, 3, '南浔区', '南浔', '0572', '313000', '120.42038', '30.86686', '120.426992', '30.872504', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (330521, 330500, 3, '德清县', '德清', '0572', '313200', '119.97836', '30.53369', '119.984827', '30.539844', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (330522, 330500, 3, '长兴县', '长兴', '0572', '313100', '119.90783', '31.00606', '119.914332', '31.012104', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (330523, 330500, 3, '安吉县', '安吉', '0572', '313300', '119.68158', '30.63798', '119.68815', '30.64378', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (330600, 330000, 2, '绍兴市', '绍兴', '0575', '312000', '120.582112', '29.997117', '120.588556', '30.003331', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (330602, 330600, 3, '越城区', '越城', '0575', '312000', '120.5819', '29.98895', '120.588337', '29.995158', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (330603, 330600, 3, '柯桥区', '柯桥', '0575', '312030', '120.492736', '30.08763', '120.499146', '30.093909', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (330604, 330600, 3, '上虞区', '上虞', '0575', '312300', '120.476075', '30.078038', '120.482471', '30.084388', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (330624, 330600, 3, '新昌县', '新昌', '0575', '312500', '120.90435', '29.49991', '120.910919', '29.505553', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (330681, 330600, 3, '诸暨市', '诸暨', '0575', '311800', '120.23629', '29.71358', '120.24269', '29.719931', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (330683, 330600, 3, '嵊州市', '嵊州', '0575', '312400', '120.82174', '29.58854', '120.82818', '29.594747', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (330700, 330000, 2, '金华市', '金华', '0579', '321000', '119.649506', '29.089524', '119.655939', '29.095842', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (330702, 330700, 3, '婺城区', '婺城', '0579', '321000', '119.57135', '29.09521', '119.577933', '29.100889', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (330703, 330700, 3, '金东区', '金东', '0579', '321000', '119.69302', '29.0991', '119.699602', '29.104765', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (330723, 330700, 3, '武义县', '武义', '0579', '321200', '119.8164', '28.89331', '119.822966', '28.898952', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (330726, 330700, 3, '浦江县', '浦江', '0579', '322200', '119.89181', '29.45353', '119.898244', '29.459825', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (330727, 330700, 3, '磐安县', '磐安', '0579', '322300', '120.45022', '29.05733', '120.456734', '29.063338', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (330781, 330700, 3, '兰溪市', '兰溪', '0579', '321100', '119.45965', '29.20841', '119.466249', '29.214054', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (330782, 330700, 3, '义乌市', '义乌', '0579', '322000', '120.0744', '29.30558', '120.080983', '29.311322', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (330783, 330700, 3, '东阳市', '东阳', '0579', '322100', '120.24185', '29.28942', '120.248272', '29.295781', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (330784, 330700, 3, '永康市', '永康', '0579', '321300', '120.04727', '28.88844', '120.053819', '28.894152', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (330800, 330000, 2, '衢州市', '衢州', '0570', '324000', '118.87263', '28.941708', '118.879216', '28.947431', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (330802, 330800, 3, '柯城区', '柯城', '0570', '324000', '118.87109', '28.96858', '118.877674', '28.974285', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (330803, 330800, 3, '衢江区', '衢江', '0570', '324000', '118.9598', '28.97977', '118.966343', '28.985595', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (330822, 330800, 3, '常山县', '常山', '0570', '324200', '118.51025', '28.90191', '118.516809', '28.907601', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (330824, 330800, 3, '开化县', '开化', '0570', '324300', '118.41616', '29.13785', '118.422614', '29.143958', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (330825, 330800, 3, '龙游县', '龙游', '0570', '324400', '119.17221', '29.02823', '119.178629', '29.034514', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (330881, 330800, 3, '江山市', '江山', '0570', '324100', '118.62674', '28.7386', '118.633322', '28.744266', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (330900, 330000, 2, '舟山市', '舟山', '0580', '316000', '122.106863', '30.016028', '122.113462', '30.021689', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (330902, 330900, 3, '定海区', '定海', '0580', '316000', '122.10677', '30.01985', '122.113371', '30.025511', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (330903, 330900, 3, '普陀区', '普陀', '0580', '316100', '122.30278', '29.94908', '122.309238', '29.955213', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (330921, 330900, 3, '岱山县', '岱山', '0580', '316200', '122.20486', '30.24385', '122.211428', '30.249594', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (330922, 330900, 3, '嵊泗县', '嵊泗', '0580', '202450', '122.45129', '30.72678', '122.45788', '30.732452', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (331000, 330000, 2, '台州市', '台州', '0576', '318000', '121.428599', '28.661378', '121.435012', '28.667675', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (331002, 331000, 3, '椒江区', '椒江', '0576', '317700', '121.44287', '28.67301', '121.449278', '28.679369', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (331003, 331000, 3, '黄岩区', '黄岩', '0576', '318020', '121.25891', '28.65077', '121.265476', '28.656402', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (331004, 331000, 3, '路桥区', '路桥', '0576', '318000', '121.37381', '28.58016', '121.380408', '28.585819', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (331022, 331000, 3, '三门县', '三门', '0576', '317100', '121.3937', '29.1051', '121.400261', '29.110824', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (331023, 331000, 3, '天台县', '天台', '0576', '317200', '121.00848', '29.1429', '121.015037', '29.148597', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (331024, 331000, 3, '仙居县', '仙居', '0576', '317300', '120.72872', '28.84672', '120.735155', '28.853048', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (331081, 331000, 3, '温岭市', '温岭', '0576', '317500', '121.38595', '28.37176', '121.392539', '28.377415', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (331082, 331000, 3, '临海市', '临海', '0576', '317000', '121.13885', '28.85603', '121.14544', '28.861668', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (331083, 331000, 3, '玉环市', '玉环', '0576', '317600', '121.23242', '28.13637', '121.238934', '28.142325', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (331100, 330000, 2, '丽水市', '丽水', '0578', '323000', '119.921786', '28.451993', '119.928347', '28.457788', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (331102, 331100, 3, '莲都区', '莲都', '0578', '323000', '119.9127', '28.44583', '119.919218', '28.451781', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (331121, 331100, 3, '青田县', '青田', '0578', '323900', '120.29028', '28.13897', '120.296855', '28.144655', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (331122, 331100, 3, '缙云县', '缙云', '0578', '321400', '120.09036', '28.65944', '120.096841', '28.665443', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (331123, 331100, 3, '遂昌县', '遂昌', '0578', '323300', '119.27606', '28.59291', '119.282495', '28.599265', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (331124, 331100, 3, '松阳县', '松阳', '0578', '323400', '119.48199', '28.4494', '119.488534', '28.455256', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (331125, 331100, 3, '云和县', '云和', '0578', '323600', '119.57287', '28.11643', '119.579467', '28.1221', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (331126, 331100, 3, '庆元县', '庆元', '0578', '323800', '119.06256', '27.61842', '119.069045', '27.624559', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (331127, 331100, 3, '景宁畲族自治县', '景宁', '0578', '323500', '119.63839', '27.97393', '119.644819', '27.980291', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (331181, 331100, 3, '龙泉市', '龙泉', '0578', '323700', '119.14163', '28.0743', '119.148076', '28.080503', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (331200, 330000, 2, '舟山群岛新区', '舟山新区', '0580', '316000', '122.317657', '29.813242', '122.324199', '29.8191', NULL, '国家级新区');
INSERT INTO `yx_dev_region` VALUES (331201, 331200, 3, '金塘岛', '金塘', '0580', '316000', '121.893373', '30.040641', '121.899874', '30.046709', NULL, '新区');
INSERT INTO `yx_dev_region` VALUES (331202, 331200, 3, '六横岛', '六横', '0580', '316000', '122.14265', '29.662938', '122.149113', '29.669168', NULL, '新区');
INSERT INTO `yx_dev_region` VALUES (331203, 331200, 3, '衢山岛', '衢山', '0580', '316000', '122.358425', '30.442642', '122.364959', '30.448428', NULL, '新区');
INSERT INTO `yx_dev_region` VALUES (331204, 331200, 3, '舟山本岛西北部', '舟山', '0580', '316000', '122.03064', '30.140377', '122.037077', '30.146704', NULL, '新区');
INSERT INTO `yx_dev_region` VALUES (331205, 331200, 3, '岱山岛西南部', '岱山', '0580', '316000', '122.180123', '30.277269', '122.186596', '30.283455', NULL, '新区');
INSERT INTO `yx_dev_region` VALUES (331206, 331200, 3, '泗礁岛', '泗礁', '0580', '316000', '122.45803', '30.725112', '122.464627', '30.730748', NULL, '新区');
INSERT INTO `yx_dev_region` VALUES (331207, 331200, 3, '朱家尖岛', '朱家尖', '0580', '316000', '122.390636', '29.916303', '122.397075', '29.922631', NULL, '新区');
INSERT INTO `yx_dev_region` VALUES (331208, 331200, 3, '洋山岛', '洋山', '0580', '316000', '121.995891', '30.094637', '122.002433', '30.100386', NULL, '新区');
INSERT INTO `yx_dev_region` VALUES (331209, 331200, 3, '长涂岛', '长涂', '0580', '316000', '122.284681', '30.24888', '122.291102', '30.255238', NULL, '新区');
INSERT INTO `yx_dev_region` VALUES (331210, 331200, 3, '虾峙岛', '虾峙', '0580', '316000', '122.244686', '29.752941', '122.251203', '29.758839', NULL, '新区');
INSERT INTO `yx_dev_region` VALUES (340000, 100000, 1, '安徽省', '安徽', NULL, NULL, '117.283042', '31.86119', '117.289601', '31.866968', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (340100, 340000, 2, '合肥市', '合肥', '0551', '230000', '117.283042', '31.86119', '117.289601', '31.866968', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (340102, 340100, 3, '瑶海区', '瑶海', '0551', '230000', '117.30947', '31.85809', '117.316056', '31.863781', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (340103, 340100, 3, '庐阳区', '庐阳', '0551', '230000', '117.26452', '31.87874', '117.270977', '31.884835', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (340104, 340100, 3, '蜀山区', '蜀山', '0551', '230000', '117.26104', '31.85117', '117.267505', '31.857331', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (340111, 340100, 3, '包河区', '包河', '0551', '230000', '117.30984', '31.79502', '117.316418', '31.800712', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (340121, 340100, 3, '长丰县', '长丰', '0551', '231100', '117.16549', '32.47959', '117.172044', '32.485331', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (340122, 340100, 3, '肥东县', '肥东', '0551', '230000', '117.47128', '31.88525', '117.477675', '31.891561', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (340123, 340100, 3, '肥西县', '肥西', '0551', '231200', '117.16845', '31.72143', '117.175044', '31.727145', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (340124, 340100, 3, '庐江县', '庐江', '0551', '231500', '117.289844', '31.251488', '117.296433', '31.257187', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (340181, 340100, 3, '巢湖市', '巢湖', '0551', '238000', '117.874155', '31.600518', '117.880692', '31.606446', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (340184, 340100, 3, '经济开发区', '经济开发区', '0551', '230000', '117.208822', '31.778893', '117.215311', '31.784867', NULL, '经济技术开发区');
INSERT INTO `yx_dev_region` VALUES (340185, 340100, 3, '高新区', '高新区', '0551', '230000', '117.13579', '31.83128', '117.142245', '31.837523', NULL, '高新技术开发区');
INSERT INTO `yx_dev_region` VALUES (340186, 340100, 3, '北城新区', '北城新区', '0551', '230000', '117.247121', '32.030226', '117.253522', '32.036551', NULL, '新区');
INSERT INTO `yx_dev_region` VALUES (340187, 340100, 3, '滨湖新区', '滨湖新区', '0551', '230000', '117.287986', '31.732268', '117.294571', '31.737986', NULL, '新区');
INSERT INTO `yx_dev_region` VALUES (340188, 340100, 3, '政务文化新区', '政务文化新区', '0551', '230000', '117.212659', '31.80348', '117.219149', '31.80953', NULL, '新区');
INSERT INTO `yx_dev_region` VALUES (340189, 340100, 3, '新站综合开发试验区', '新站综合开发试验区', '0551', '230000', '117.378188', '31.939811', '117.384649', '31.94602', NULL, '经济技术开发区');
INSERT INTO `yx_dev_region` VALUES (340200, 340000, 2, '芜湖市', '芜湖', '0553', '241000', '118.376451', '31.326319', '118.38305', '31.331972', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (340202, 340200, 3, '镜湖区', '镜湖', '0553', '241000', '118.38525', '31.34038', '118.391857', '31.346043', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (340203, 340200, 3, '弋江区', '弋江', '0553', '241000', '118.37265', '31.31178', '118.379229', '31.317449', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (340207, 340200, 3, '鸠江区', '鸠江', '0553', '241000', '118.39215', '31.36928', '118.398736', '31.374997', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (340208, 340200, 3, '三山区', '三山', '0553', '241000', '118.22509', '31.20703', '118.231573', '31.213122', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (340221, 340200, 3, '芜湖县', '芜湖', '0553', '241100', '118.57525', '31.13476', '118.58169', '31.14101', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (340222, 340200, 3, '繁昌县', '繁昌', '0553', '241200', '118.19982', '31.08319', '118.20623', '31.089545', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (340223, 340200, 3, '南陵县', '南陵', '0553', '242400', '118.33688', '30.91969', '118.343305', '30.925911', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (340225, 340200, 3, '无为县', '无为', '0553', '238300', '117.911432', '31.303075', '117.917995', '31.308779', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (340226, 340200, 3, '经济开发区', '经济开发区', '0553', '241000', '118.373839', '31.408279', '118.380409', '31.413937', NULL, '经济技术开发区');
INSERT INTO `yx_dev_region` VALUES (340227, 340200, 3, '城东新区', '城东新区', '0553', '241000', '118.33688', '30.91969', '118.343305', '30.925911', NULL, '新区');
INSERT INTO `yx_dev_region` VALUES (340300, 340000, 2, '蚌埠市', '蚌埠', '0552', '233000', '117.36237', '32.934037', '117.368778', '32.940388', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (340302, 340300, 3, '龙子湖区', '龙子湖', '0552', '233000', '117.39379', '32.94301', '117.400306', '32.94894', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (340303, 340300, 3, '蚌山区', '蚌山', '0552', '233000', '117.36767', '32.94411', '117.374075', '32.950433', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (340304, 340300, 3, '禹会区', '禹会', '0552', '233000', '117.35315', '32.93336', '117.359564', '32.939691', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (340311, 340300, 3, '淮上区', '淮上', '0552', '233000', '117.35983', '32.96423', '117.366213', '32.970577', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (340321, 340300, 3, '怀远县', '怀远', '0552', '233400', '117.20507', '32.97007', '117.211576', '32.975975', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (340322, 340300, 3, '五河县', '五河', '0552', '233300', '117.89144', '33.14457', '117.898048', '33.150256', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (340323, 340300, 3, '固镇县', '固镇', '0552', '233700', '117.31558', '33.31803', '117.322133', '33.323784', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (340324, 340300, 3, '高新区', '高新区', '0552', '233000', '117.320938', '32.908142', '117.327502', '32.913987', NULL, '高新技术开发区');
INSERT INTO `yx_dev_region` VALUES (340400, 340000, 2, '淮南市', '淮南', '0554', '232000', '117.025449', '32.645947', '117.031932', '32.652032', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (340402, 340400, 3, '大通区', '大通', '0554', '232000', '117.05255', '32.63265', '117.059133', '32.638323', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (340403, 340400, 3, '田家庵区', '田家庵', '0554', '232000', '117.01739', '32.64697', '117.023837', '32.653187', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (340404, 340400, 3, '谢家集区', '谢家集', '0554', '232000', '116.86377', '32.59818', '116.87019', '32.604407', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (340405, 340400, 3, '八公山区', '八公山', '0554', '232000', '116.83694', '32.62941', '116.843492', '32.635186', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (340406, 340400, 3, '潘集区', '潘集', '0554', '232000', '116.81622', '32.78287', '116.822834', '32.788531', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (340421, 340400, 3, '凤台县', '凤台', '0554', '232100', '116.71569', '32.70752', '116.722249', '32.713279', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (340422, 340400, 3, '寿县', '寿县', '0554', '232200', '116.78466', '32.57653', '116.791137', '32.582628', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (340423, 340400, 3, '山南新区', '山南新区', '0554', '232000', '117.025449', '32.645947', '117.031932', '32.652032', NULL, '新区');
INSERT INTO `yx_dev_region` VALUES (340424, 340400, 3, '毛集实验区', '毛集实验区', '0554', '232180', '116.63552', '32.65471', '116.641938', '32.661054', NULL, '实验区');
INSERT INTO `yx_dev_region` VALUES (340425, 340400, 3, '经济开发区', '经济开发区', '0554', '232000', '117.063845', '32.660271', '117.070458', '32.665932', NULL, '经济技术开发区');
INSERT INTO `yx_dev_region` VALUES (340500, 340000, 2, '马鞍山市', '马鞍山', '0555', '243000', '118.507906', '31.689362', '118.514502', '31.695039', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (340503, 340500, 3, '花山区', '花山', '0555', '243000', '118.51231', '31.7001', '118.518903', '31.70582', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (340504, 340500, 3, '雨山区', '雨山', '0555', '243000', '118.49869', '31.68219', '118.505287', '31.687836', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (340506, 340500, 3, '博望区', '博望', '0555', '243131', '118.844387', '31.561871', '118.850954', '31.567628', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (340521, 340500, 3, '当涂县', '当涂', '0555', '243100', '118.49786', '31.57098', '118.504465', '31.57663', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (340522, 340500, 3, '含山县', '含山', '0555', '238100', '118.105545', '31.727758', '118.112035', '31.733843', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (340523, 340500, 3, '和县', '和县', '0555', '238200', '118.351405', '31.741794', '118.35791', '31.747767', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (340600, 340000, 2, '淮北市', '淮北', '0561', '235000', '116.794664', '33.971707', '116.8012', '33.977625', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (340602, 340600, 3, '杜集区', '杜集', '0561', '235000', '116.82998', '33.99363', '116.836587', '33.999332', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (340603, 340600, 3, '相山区', '相山', '0561', '235000', '116.79464', '33.95979', '116.801164', '33.965706', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (340604, 340600, 3, '烈山区', '烈山', '0561', '235000', '116.81448', '33.89355', '116.821084', '33.899216', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (340621, 340600, 3, '濉溪县', '濉溪', '0561', '235100', '116.76785', '33.91455', '116.774243', '33.920867', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (340700, 340000, 2, '铜陵市', '铜陵', '0562', '244000', '117.816576', '30.929935', '117.823025', '30.936049', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (340705, 340700, 3, '铜官区', '铜官', '0562', '244000', '117.81525', '30.93423', '117.821706', '30.940321', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (340706, 340700, 3, '义安区', '义安', '0562', '244100', '117.79113', '30.95365', '117.797701', '30.959353', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (340711, 340700, 3, '郊区', '郊区', '0562', '244000', '117.80868', '30.91976', '117.81517', '30.925731', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (340722, 340700, 3, '枞阳县', '枞阳', '0562', '246700', '117.22015', '30.69956', '117.226586', '30.705734', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (340800, 340000, 2, '安庆市', '安庆', '0556', '246000', '117.053571', '30.524816', '117.060171', '30.530488', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (340802, 340800, 3, '迎江区', '迎江', '0556', '246001', '117.0493', '30.50421', '117.055896', '30.509917', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (340803, 340800, 3, '大观区', '大观', '0556', '246002', '117.03426', '30.51216', '117.040799', '30.518087', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (340811, 340800, 3, '宜秀区', '宜秀', '0556', '246003', '117.06127', '30.50783', '117.067881', '30.513485', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (340822, 340800, 3, '怀宁县', '怀宁', '0556', '246100', '116.82968', '30.73376', '116.836273', '30.739457', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (340825, 340800, 3, '太湖县', '太湖', '0556', '246400', '116.3088', '30.4541', '116.315275', '30.460117', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (340826, 340800, 3, '宿松县', '宿松', '0556', '246500', '116.12915', '30.1536', '116.135673', '30.159589', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (340827, 340800, 3, '望江县', '望江', '0556', '246200', '116.68814', '30.12585', '116.694719', '30.131567', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (340828, 340800, 3, '岳西县', '岳西', '0556', '246600', '116.35995', '30.84983', '116.366506', '30.855657', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (340881, 340800, 3, '桐城市', '桐城', '0556', '231400', '116.95071', '31.05216', '116.95727', '31.057858', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (340882, 340800, 3, '潜山市', '潜山', '0556', '246300', '116.57574', '30.63037', '116.582349', '30.636034', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (341000, 340000, 2, '黄山市', '黄山', '0559', '242700', '118.317325', '29.709239', '118.323728', '29.715588', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (341002, 341000, 3, '屯溪区', '屯溪', '0559', '245000', '118.33368', '29.71138', '118.340102', '29.717645', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (341003, 341000, 3, '黄山区', '黄山', '0559', '242700', '118.1416', '30.2729', '118.14821', '30.278552', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (341004, 341000, 3, '徽州区', '徽州', '0559', '245061', '118.33654', '29.82784', '118.342974', '29.834068', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (341021, 341000, 3, '歙县', '歙县', '0559', '245200', '118.43676', '29.86745', '118.44316', '29.873797', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (341022, 341000, 3, '休宁县', '休宁', '0559', '245400', '118.18136', '29.78607', '118.187829', '29.792273', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (341023, 341000, 3, '黟县', '黟县', '0559', '245500', '117.94137', '29.92588', '117.947833', '29.932082', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (341024, 341000, 3, '祁门县', '祁门', '0559', '245600', '117.71847', '29.85723', '117.724863', '29.863577', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (341100, 340000, 2, '滁州市', '滁州', '0550', '239000', '118.316264', '32.303627', '118.322687', '32.30998', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (341102, 341100, 3, '琅琊区', '琅琊', '0550', '239000', '118.30538', '32.29521', '118.311824', '32.30147', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (341103, 341100, 3, '南谯区', '南谯', '0550', '239000', '118.31222', '32.31861', '118.318648', '32.324941', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (341122, 341100, 3, '来安县', '来安', '0550', '239200', '118.43438', '32.45176', '118.440795', '32.458102', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (341124, 341100, 3, '全椒县', '全椒', '0550', '239500', '118.27291', '32.08524', '118.279499', '32.090967', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (341125, 341100, 3, '定远县', '定远', '0550', '233200', '117.68035', '32.52488', '117.686902', '32.53071', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (341126, 341100, 3, '凤阳县', '凤阳', '0550', '233100', '117.56454', '32.86507', '117.571054', '32.870967', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (341181, 341100, 3, '天长市', '天长', '0550', '239300', '118.99868', '32.69124', '119.005243', '32.697043', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (341182, 341100, 3, '明光市', '明光', '0550', '239400', '117.99093', '32.77819', '117.99745', '32.784177', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (341200, 340000, 2, '阜阳市', '阜阳', '0558', '236000', '115.819729', '32.896969', '115.826193', '32.903151', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (341202, 341200, 3, '颍州区', '颍州', '0558', '236000', '115.80694', '32.88346', '115.813351', '32.889786', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (341203, 341200, 3, '颍东区', '颍东', '0558', '236000', '115.85659', '32.91296', '115.863206', '32.918623', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (341204, 341200, 3, '颍泉区', '颍泉', '0558', '236000', '115.80712', '32.9249', '115.813542', '32.931227', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (341221, 341200, 3, '临泉县', '临泉', '0558', '236400', '115.26232', '33.06758', '115.268911', '33.073235', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (341222, 341200, 3, '太和县', '太和', '0558', '236600', '115.62191', '33.16025', '115.628526', '33.16591', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (341225, 341200, 3, '阜南县', '阜南', '0558', '236300', '115.58563', '32.63551', '115.592103', '32.641587', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (341226, 341200, 3, '颍上县', '颍上', '0558', '236200', '116.26458', '32.62998', '116.271003', '32.636218', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (341282, 341200, 3, '界首市', '界首', '0558', '236500', '115.37445', '33.25714', '115.381061', '33.262813', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (341283, 341200, 3, '经济开发区', '经济开发区', '0558', '236000', '115.857371', '32.865142', '115.863955', '32.870794', NULL, '经济技术开发区');
INSERT INTO `yx_dev_region` VALUES (341284, 341200, 3, '苏滁现代产业园', '苏滁产业园', '0558', '236000', '118.384896', '32.27793', '118.391488', '32.283586', NULL, '经济技术开发区');
INSERT INTO `yx_dev_region` VALUES (341300, 340000, 2, '宿州市', '宿州', '0557', '234000', '116.984084', '33.633891', '116.990535', '33.640132', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (341302, 341300, 3, '埇桥区', '埇桥', '0557', '234000', '116.97731', '33.64058', '116.983789', '33.646716', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (341321, 341300, 3, '砀山县', '砀山', '0557', '235300', '116.35363', '34.42356', '116.360194', '34.429292', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (341322, 341300, 3, '萧县', '萧县', '0557', '235200', '116.94546', '34.1879', '116.952047', '34.19356', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (341323, 341300, 3, '灵璧县', '灵璧', '0557', '234200', '117.55813', '33.54339', '117.564685', '33.549184', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (341324, 341300, 3, '泗县', '泗县', '0557', '234300', '117.91033', '33.48295', '117.916919', '33.488648', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (341325, 341300, 3, '经济开发区', '经济开发区', '0557', '234000', '117.010215', '33.59863', '117.016627', '33.604932', NULL, '经济技术开发区');
INSERT INTO `yx_dev_region` VALUES (341371, 341300, 3, '宿马现代产业园', '宿马现代产业园', '0557', '234000', '117.238752', '33.67529', '117.245137', '33.681637', NULL, '经济技术开发区');
INSERT INTO `yx_dev_region` VALUES (341500, 340000, 2, '六安市', '六安', '0564', '237000', '116.507676', '31.752889', '116.514088', '31.759165', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (341502, 341500, 3, '金安区', '金安', '0564', '237000', '116.50912', '31.75573', '116.515526', '31.76202', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (341503, 341500, 3, '裕安区', '裕安', '0564', '237000', '116.47985', '31.73787', '116.4864', '31.743693', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (341504, 341500, 3, '叶集区', '叶集', '0564', '237431', '115.94795', '31.863', '115.954437', '31.869036', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (341522, 341500, 3, '霍邱县', '霍邱', '0564', '237400', '116.27795', '32.353', '116.284341', '32.359343', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (341523, 341500, 3, '舒城县', '舒城', '0564', '231300', '116.94491', '31.46413', '116.95152', '31.469796', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (341524, 341500, 3, '金寨县', '金寨', '0564', '237300', '115.93463', '31.7351', '115.941066', '31.741352', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (341525, 341500, 3, '霍山县', '霍山', '0564', '237200', '116.33291', '31.3929', '116.339486', '31.398572', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (341600, 340000, 2, '亳州市', '亳州', '0558', '236000', '115.782939', '33.869338', '115.789394', '33.875561', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (341602, 341600, 3, '谯城区', '谯城', '0558', '236800', '115.77941', '33.87532', '115.78588', '33.88149', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (341621, 341600, 3, '涡阳县', '涡阳', '0558', '233600', '116.21682', '33.50911', '116.223438', '33.514772', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (341622, 341600, 3, '蒙城县', '蒙城', '0558', '233500', '116.5646', '33.26477', '116.571188', '33.270533', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (341623, 341600, 3, '利辛县', '利辛', '0558', '236700', '116.208', '33.14198', '116.214598', '33.147703', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (341700, 340000, 2, '池州市', '池州', '0566', '247100', '117.489157', '30.656037', '117.495579', '30.662351', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (341702, 341700, 3, '贵池区', '贵池', '0566', '247100', '117.48722', '30.65283', '117.493642', '30.659159', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (341721, 341700, 3, '东至县', '东至', '0566', '247200', '117.02719', '30.0969', '117.033659', '30.102947', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (341722, 341700, 3, '石台县', '石台', '0566', '245100', '117.48666', '30.21042', '117.493055', '30.216746', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (341723, 341700, 3, '青阳县', '青阳', '0566', '242800', '117.84744', '30.63932', '117.853872', '30.645651', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (341800, 340000, 2, '宣城市', '宣城', '0563', '242000', '118.757995', '30.945667', '118.764536', '30.951454', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (341802, 341800, 3, '宣州区', '宣州', '0563', '242000', '118.75462', '30.94439', '118.761173', '30.950129', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (341821, 341800, 3, '郎溪县', '郎溪', '0563', '242100', '119.17923', '31.12599', '119.185693', '31.132184', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (341822, 341800, 3, '广德县', '广德', '0563', '242200', '119.41769', '30.89371', '119.424141', '30.899927', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (341823, 341800, 3, '泾县', '泾县', '0563', '242500', '118.41964', '30.69498', '118.426077', '30.701147', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (341824, 341800, 3, '绩溪县', '绩溪', '0563', '245300', '118.59765', '30.07069', '118.604175', '30.076549', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (341825, 341800, 3, '旌德县', '旌德', '0563', '242600', '118.54299', '30.28898', '118.549443', '30.295206', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (341881, 341800, 3, '宁国市', '宁国', '0563', '242300', '118.98349', '30.6238', '118.990099', '30.629454', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (350000, 100000, 1, '福建省', '福建', NULL, NULL, '119.306239', '26.075302', '119.312742', '26.081376', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (350100, 350000, 2, '福州市', '福州', '0591', '350000', '119.306239', '26.075302', '119.312742', '26.081376', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (350102, 350100, 3, '鼓楼区', '鼓楼', '0591', '350000', '119.30384', '26.08225', '119.310331', '26.088367', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (350103, 350100, 3, '台江区', '台江', '0591', '350000', '119.30899', '26.06204', '119.315504', '26.068063', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (350104, 350100, 3, '仓山区', '仓山', '0591', '350000', '119.31543', '26.04335', '119.321955', '26.04925', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (350105, 350100, 3, '马尾区', '马尾', '0591', '350000', '119.4555', '25.98942', '119.462067', '25.99507', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (350111, 350100, 3, '晋安区', '晋安', '0591', '350000', '119.32828', '26.0818', '119.33486', '26.087511', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (350112, 350100, 3, '长乐区', '长乐', '0591', '350200', '119.52313', '25.96276', '119.529568', '25.969117', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (350121, 350100, 3, '闽侯县', '闽侯', '0591', '350100', '119.13388', '26.15014', '119.140355', '26.15621', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (350122, 350100, 3, '连江县', '连江', '0591', '350500', '119.53433', '26.19466', '119.540791', '26.200926', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (350123, 350100, 3, '罗源县', '罗源', '0591', '350600', '119.5509', '26.48752', '119.557384', '26.493499', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (350124, 350100, 3, '闽清县', '闽清', '0591', '350800', '118.8623', '26.21901', '118.868879', '26.224656', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (350125, 350100, 3, '永泰县', '永泰', '0591', '350700', '118.936', '25.86816', '118.94244', '25.874397', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (350128, 350100, 3, '平潭县', '平潭', '0591', '350400', '119.791197', '25.503672', '119.797698', '25.509649', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (350181, 350100, 3, '福清市', '福清', '0591', '350300', '119.38507', '25.72086', '119.391532', '25.727118', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (350183, 350100, 3, '福州新区', '福州新区', '0591', '350000', '119.266079', '26.050692', '119.272531', '26.056961', NULL, '国家级新区');
INSERT INTO `yx_dev_region` VALUES (350200, 350000, 2, '厦门市', '厦门', '0592', '361000', '118.11022', '24.490474', '118.116731', '24.496472', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (350203, 350200, 3, '思明区', '思明', '0592', '361000', '118.08233', '24.44543', '118.088738', '24.451778', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (350205, 350200, 3, '海沧区', '海沧', '0592', '361000', '118.03289', '24.48461', '118.039452', '24.490335', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (350206, 350200, 3, '湖里区', '湖里', '0592', '361000', '118.14621', '24.51253', '118.152799', '24.518198', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (350211, 350200, 3, '集美区', '集美', '0592', '361000', '118.09719', '24.57584', '118.103626', '24.582056', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (350212, 350200, 3, '同安区', '同安', '0592', '361100', '118.15197', '24.72308', '118.158533', '24.728794', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (350213, 350200, 3, '翔安区', '翔安', '0592', '361100', '118.24783', '24.61863', '118.254406', '24.624348', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (350300, 350000, 2, '莆田市', '莆田', '0594', '351100', '119.007558', '25.431011', '119.014059', '25.436964', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (350302, 350300, 3, '城厢区', '城厢', '0594', '351100', '118.99462', '25.41872', '119.001157', '25.424459', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (350303, 350300, 3, '涵江区', '涵江', '0594', '351100', '119.11621', '25.45876', '119.122777', '25.464527', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (350304, 350300, 3, '荔城区', '荔城', '0594', '351100', '119.01339', '25.43369', '119.01987', '25.439752', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (350305, 350300, 3, '秀屿区', '秀屿', '0594', '351100', '119.10553', '25.31831', '119.112101', '25.323967', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (350322, 350300, 3, '仙游县', '仙游', '0594', '351200', '118.69177', '25.36214', '118.698224', '25.368434', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (350400, 350000, 2, '三明市', '三明', '0598', '365000', '117.635001', '26.265444', '117.641508', '26.27135', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (350402, 350400, 3, '梅列区', '梅列', '0598', '365000', '117.64585', '26.27171', '117.6524', '26.277448', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (350403, 350400, 3, '三元区', '三元', '0598', '365000', '117.60788', '26.23372', '117.614295', '26.24004', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (350421, 350400, 3, '明溪县', '明溪', '0598', '365200', '117.20498', '26.35294', '117.211488', '26.358846', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (350423, 350400, 3, '清流县', '清流', '0598', '365300', '116.8146', '26.17144', '116.821186', '26.177106', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (350424, 350400, 3, '宁化县', '宁化', '0598', '365400', '116.66101', '26.25874', '116.667457', '26.264895', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (350425, 350400, 3, '大田县', '大田', '0598', '366100', '117.8471', '25.6926', '117.85354', '25.698932', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (350426, 350400, 3, '尤溪县', '尤溪', '0598', '365100', '118.19049', '26.17002', '118.196931', '26.176334', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (350427, 350400, 3, '沙县', '沙县', '0598', '365500', '117.79266', '26.39615', '117.799219', '26.401871', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (350428, 350400, 3, '将乐县', '将乐', '0598', '353300', '117.47317', '26.72837', '117.479575', '26.734696', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (350429, 350400, 3, '泰宁县', '泰宁', '0598', '354400', '117.17578', '26.9001', '117.182376', '26.905761', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (350430, 350400, 3, '建宁县', '建宁', '0598', '354500', '116.84603', '26.83091', '116.852536', '26.836835', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (350481, 350400, 3, '永安市', '永安', '0598', '366000', '117.36517', '25.94136', '117.371613', '25.947703', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (350500, 350000, 2, '泉州市', '泉州', '0595', '362000', '118.589421', '24.908853', '118.59591', '24.914862', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (350502, 350500, 3, '鲤城区', '鲤城', '0595', '362000', '118.56591', '24.88741', '118.572351', '24.893751', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (350503, 350500, 3, '丰泽区', '丰泽', '0595', '362000', '118.61328', '24.89119', '118.619859', '24.896858', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (350504, 350500, 3, '洛江区', '洛江', '0595', '362000', '118.67111', '24.93984', '118.677526', '24.946155', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (350505, 350500, 3, '泉港区', '泉港', '0595', '362800', '118.91586', '25.12005', '118.922303', '25.126402', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (350521, 350500, 3, '惠安县', '惠安', '0595', '362100', '118.79687', '25.03059', '118.803286', '25.036939', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (350524, 350500, 3, '安溪县', '安溪', '0595', '362400', '118.18719', '25.05627', '118.193613', '25.062544', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (350525, 350500, 3, '永春县', '永春', '0595', '362600', '118.29437', '25.32183', '118.300855', '25.327911', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (350526, 350500, 3, '德化县', '德化', '0595', '362500', '118.24176', '25.49224', '118.248312', '25.498037', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (350527, 350500, 3, '金门县', '金门', '0595', '362000', '118.32263', '24.42922', '118.329048', '24.43557', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (350581, 350500, 3, '石狮市', '石狮', '0595', '362700', '118.64779', '24.73242', '118.65431', '24.738381', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (350582, 350500, 3, '晋江市', '晋江', '0595', '362200', '118.55194', '24.78141', '118.558371', '24.787734', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (350583, 350500, 3, '南安市', '南安', '0595', '362300', '118.38589', '24.96055', '118.392462', '24.966212', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (350584, 350500, 3, '台商投资区', '台商投资区', '0595', '362000', '118.756072', '24.885957', '118.762635', '24.891722', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (350585, 350500, 3, '经济技术开发区', '经济开发区', '0595', '362000', '118.548114', '24.865094', '118.554572', '24.871387', NULL, '经济技术开发区');
INSERT INTO `yx_dev_region` VALUES (350586, 350500, 3, '高新区', '高新区', '0595', '362000', '118.545131', '24.904931', '118.551573', '24.911183', NULL, '高新技术开发区');
INSERT INTO `yx_dev_region` VALUES (350587, 350500, 3, '综合保税区', '综合保税区', '0595', '362000', '118.680447', '24.887735', '118.686884', '24.894093', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (350600, 350000, 2, '漳州市', '漳州', '0596', '363000', '117.661801', '24.510897', '117.668394', '24.51655', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (350602, 350600, 3, '芗城区', '芗城', '0596', '363000', '117.65402', '24.51081', '117.66061', '24.516478', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (350603, 350600, 3, '龙文区', '龙文', '0596', '363000', '117.70971', '24.50323', '117.716165', '24.509537', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (350622, 350600, 3, '云霄县', '云霄', '0596', '363300', '117.34051', '23.95534', '117.346958', '23.961521', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (350623, 350600, 3, '漳浦县', '漳浦', '0596', '363200', '117.61367', '24.11706', '117.620112', '24.123326', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (350624, 350600, 3, '诏安县', '诏安', '0596', '363500', '117.17501', '23.71148', '117.181568', '23.717138', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (350625, 350600, 3, '长泰县', '长泰', '0596', '363900', '117.75924', '24.62526', '117.765793', '24.6311', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (350626, 350600, 3, '东山县', '东山', '0596', '363400', '117.42822', '23.70109', '117.434783', '23.70677', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (350627, 350600, 3, '南靖县', '南靖', '0596', '363600', '117.35736', '24.51448', '117.363806', '24.520833', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (350628, 350600, 3, '平和县', '平和', '0596', '363700', '117.3124', '24.36395', '117.318962', '24.369671', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (350629, 350600, 3, '华安县', '华安', '0596', '363800', '117.54077', '25.00563', '117.547358', '25.011281', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (350681, 350600, 3, '龙海市', '龙海', '0596', '363100', '117.81802', '24.44655', '117.824471', '24.45269', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (350700, 350000, 2, '南平市', '南平', '0599', '353000', '118.178459', '26.635627', '118.18492', '26.641778', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (350702, 350700, 3, '延平区', '延平', '0599', '353000', '118.18189', '26.63745', '118.188341', '26.643656', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (350703, 350700, 3, '建阳区', '建阳', '0599', '354200', '118.12267', '27.332067', '118.129201', '27.337844', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (350721, 350700, 3, '顺昌县', '顺昌', '0599', '353200', '117.8103', '26.79298', '117.816818', '26.79899', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (350722, 350700, 3, '浦城县', '浦城', '0599', '353400', '118.54007', '27.91888', '118.546512', '27.925055', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (350723, 350700, 3, '光泽县', '光泽', '0599', '354100', '117.33346', '27.54231', '117.339943', '27.548373', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (350724, 350700, 3, '松溪县', '松溪', '0599', '353500', '118.78533', '27.52624', '118.791783', '27.532499', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (350725, 350700, 3, '政和县', '政和', '0599', '353600', '118.85571', '27.36769', '118.862298', '27.373344', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (350781, 350700, 3, '邵武市', '邵武', '0599', '354000', '117.4924', '27.34033', '117.498818', '27.346607', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (350782, 350700, 3, '武夷山市', '武夷山', '0599', '354300', '118.03665', '27.75543', '118.043222', '27.761207', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (350783, 350700, 3, '建瓯市', '建瓯', '0599', '353100', '118.29766', '27.02301', '118.304147', '27.029153', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (350800, 350000, 2, '龙岩市', '龙岩', '0597', '364000', '117.02978', '25.091603', '117.03629', '25.097609', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (350802, 350800, 3, '新罗区', '新罗', '0597', '364000', '117.03693', '25.09834', '117.043473', '25.104219', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (350803, 350800, 3, '永定区', '永定', '0597', '364100', '116.73199', '24.72302', '116.738485', '24.729057', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (350821, 350800, 3, '长汀县', '长汀', '0597', '366300', '116.35888', '25.82773', '116.365442', '25.833542', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (350823, 350800, 3, '上杭县', '上杭', '0597', '364200', '116.42022', '25.04943', '116.426664', '25.055597', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (350824, 350800, 3, '武平县', '武平', '0597', '364300', '116.10229', '25.09244', '116.108877', '25.098097', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (350825, 350800, 3, '连城县', '连城', '0597', '366200', '116.75454', '25.7103', '116.760986', '25.71664', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (350881, 350800, 3, '漳平市', '漳平', '0597', '364400', '117.41992', '25.29109', '117.426476', '25.296734', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (350900, 350000, 2, '宁德市', '宁德', '0593', '352000', '119.527082', '26.65924', '119.533524', '26.665578', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (350902, 350900, 3, '蕉城区', '蕉城', '0593', '352000', '119.52643', '26.66048', '119.532872', '26.666822', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (350921, 350900, 3, '霞浦县', '霞浦', '0593', '355100', '119.99893', '26.88578', '120.005355', '26.892141', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (350922, 350900, 3, '古田县', '古田', '0593', '352200', '118.74688', '26.57682', '118.753458', '26.582487', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (350923, 350900, 3, '屏南县', '屏南', '0593', '352300', '118.98861', '26.91099', '118.995202', '26.916673', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (350924, 350900, 3, '寿宁县', '寿宁', '0593', '355500', '119.5039', '27.45996', '119.510328', '27.466195', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (350925, 350900, 3, '周宁县', '周宁', '0593', '355400', '119.33837', '27.10664', '119.344938', '27.11228', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (350926, 350900, 3, '柘荣县', '柘荣', '0593', '355300', '119.89971', '27.23543', '119.906163', '27.241614', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (350981, 350900, 3, '福安市', '福安', '0593', '355000', '119.6495', '27.08673', '119.655909', '27.093041', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (350982, 350900, 3, '福鼎市', '福鼎', '0593', '355200', '120.21664', '27.3243', '120.223093', '27.330419', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (350983, 350900, 3, '东侨开发区', '东侨开发区', '0593', '352000', '119.541299', '26.65991', '119.547781', '26.666072', NULL, '经济技术开发区');
INSERT INTO `yx_dev_region` VALUES (360000, 100000, 1, '江西省', '江西', NULL, NULL, '115.892151', '28.676493', '115.898638', '28.682531', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (360100, 360000, 2, '南昌市', '南昌', '0791', '330000', '115.892151', '28.676493', '115.898638', '28.682531', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (360102, 360100, 3, '东湖区', '东湖', '0791', '330000', '115.8988', '28.68505', '115.905267', '28.691206', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (360103, 360100, 3, '西湖区', '西湖', '0791', '330000', '115.87728', '28.65688', '115.883815', '28.662661', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (360104, 360100, 3, '青云谱区', '青云谱', '0791', '330000', '115.915', '28.63199', '115.921406', '28.638323', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (360105, 360100, 3, '湾里区', '湾里', '0791', '330000', '115.73104', '28.71529', '115.737636', '28.720985', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (360111, 360100, 3, '青山湖区', '青山湖', '0791', '330029', '115.9617', '28.68206', '115.968252', '28.68786', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (360112, 360100, 3, '新建区', '新建', '0791', '330100', '115.81546', '28.69248', '115.821912', '28.698723', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (360121, 360100, 3, '南昌县', '南昌', '0791', '330200', '115.94393', '28.54559', '115.95039', '28.551695', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (360123, 360100, 3, '安义县', '安义', '0791', '330500', '115.54879', '28.84602', '115.555231', '28.852312', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (360124, 360100, 3, '进贤县', '进贤', '0791', '331700', '116.24087', '28.37679', '116.247412', '28.38263', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (360125, 360100, 3, '红谷滩新区', '红谷滩新区', '0791', '330038', '115.858055', '28.698165', '115.864656', '28.703823', NULL, '新区');
INSERT INTO `yx_dev_region` VALUES (360126, 360100, 3, '高新区', '高新区', '0791', '330000', '115.959991', '28.682062', '115.966536', '28.687889', NULL, '高新技术开发区');
INSERT INTO `yx_dev_region` VALUES (360127, 360100, 3, '经济开发区', '经济开发区', '0791', '330000', '115.840792', '28.734856', '115.847343', '28.740671', NULL, '经济技术开发区');
INSERT INTO `yx_dev_region` VALUES (360128, 360100, 3, '小蓝开发区', '小蓝开发区', '0791', '330052', '115.891874', '28.540863', '115.898349', '28.546893', NULL, '经济技术开发区');
INSERT INTO `yx_dev_region` VALUES (360129, 360100, 3, '桑海开发区', '桑海开发区', '0791', '330115', '115.836578', '28.912213', '115.8431', '28.918094', NULL, '经济技术开发区');
INSERT INTO `yx_dev_region` VALUES (360130, 360100, 3, '望城新区', '望城新区', '0791', '330103', '115.734924', '28.631338', '115.741496', '28.637', NULL, '新区');
INSERT INTO `yx_dev_region` VALUES (360131, 360100, 3, '赣江新区', '赣江新区', '0791', '330029', '115.897644', '28.716998', '115.904129', '28.723138', NULL, '国家级新区');
INSERT INTO `yx_dev_region` VALUES (360200, 360000, 2, '景德镇市', '景德镇', '0798', '333000', '117.214664', '29.29256', '117.221155', '29.298648', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (360202, 360200, 3, '昌江区', '昌江', '0798', '333000', '117.18359', '29.27321', '117.19017', '29.278863', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (360203, 360200, 3, '珠山区', '珠山', '0798', '333000', '117.20233', '29.30127', '117.208882', '29.307137', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (360222, 360200, 3, '浮梁县', '浮梁', '0798', '333400', '117.21517', '29.35156', '117.221635', '29.357651', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (360281, 360200, 3, '乐平市', '乐平', '0798', '333300', '117.12887', '28.96295', '117.135307', '28.969268', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (360300, 360000, 2, '萍乡市', '萍乡', '0799', '337000', '113.852186', '27.622946', '113.858695', '27.628989', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (360302, 360300, 3, '安源区', '安源', '0799', '337000', '113.89135', '27.61653', '113.897796', '27.622817', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (360313, 360300, 3, '湘东区', '湘东', '0799', '337000', '113.73294', '27.64007', '113.739444', '27.646126', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (360321, 360300, 3, '莲花县', '莲花', '0799', '337100', '113.96142', '27.12866', '113.967964', '27.134514', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (360322, 360300, 3, '上栗县', '上栗', '0799', '337000', '113.79403', '27.87467', '113.800566', '27.880603', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (360323, 360300, 3, '芦溪县', '芦溪', '0799', '337000', '114.02951', '27.63063', '114.036027', '27.636643', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (360400, 360000, 2, '九江市', '九江', '0792', '332000', '115.992811', '29.712034', '115.999369', '29.717758', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (360402, 360400, 3, '濂溪区', '濂溪', '0792', '332900', '115.98904', '29.67177', '115.995639', '29.677465', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (360403, 360400, 3, '浔阳区', '浔阳', '0792', '332000', '115.98986', '29.72786', '115.996418', '29.733552', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (360404, 360400, 3, '柴桑区', '柴桑', '0792', '332100', '115.91128', '29.60852', '115.917681', '29.614827', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (360423, 360400, 3, '武宁县', '武宁', '0792', '332300', '115.10061', '29.2584', '115.107051', '29.264559', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (360424, 360400, 3, '修水县', '修水', '0792', '332400', '114.54684', '29.02539', '114.553408', '29.031065', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (360425, 360400, 3, '永修县', '永修', '0792', '330300', '115.80911', '29.02093', '115.815516', '29.027235', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (360426, 360400, 3, '德安县', '德安', '0792', '330400', '115.75601', '29.31341', '115.762588', '29.319183', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (360428, 360400, 3, '都昌县', '都昌', '0792', '332600', '116.20401', '29.27327', '116.210562', '29.279035', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (360429, 360400, 3, '湖口县', '湖口', '0792', '332500', '116.21853', '29.73818', '116.225101', '29.743828', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (360430, 360400, 3, '彭泽县', '彭泽', '0792', '332700', '116.55011', '29.89589', '116.556625', '29.901892', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (360481, 360400, 3, '瑞昌市', '瑞昌', '0792', '332200', '115.66705', '29.67183', '115.6735', '29.678105', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (360482, 360400, 3, '共青城市', '共青城', '0792', '332020', '115.801939', '29.238785', '115.808336', '29.245127', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (360483, 360400, 3, '庐山市', '庐山', '0792', '332800', '116.04492', '29.44608', '116.051347', '29.45242', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (360484, 360400, 3, '经济技术开发区', '经济开发区', '0792', '332000', '115.952224', '29.702546', '115.958732', '29.708505', NULL, '经济技术开发区');
INSERT INTO `yx_dev_region` VALUES (360485, 360400, 3, '八里湖新区', '八里湖新区', '0792', '332000', '115.953481', '29.671747', '115.960016', '29.677689', NULL, '新区');
INSERT INTO `yx_dev_region` VALUES (360486, 360400, 3, '庐山风景名胜区', '庐山风景名胜区', '0792', '332800', '115.994609', '29.555576', '116.001192', '29.56133', NULL, '风景名胜区');
INSERT INTO `yx_dev_region` VALUES (360500, 360000, 2, '新余市', '新余', '0790', '338000', '114.930835', '27.810834', '114.937312', '27.816844', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (360502, 360500, 3, '渝水区', '渝水', '0790', '338000', '114.944', '27.80098', '114.950427', '27.807207', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (360521, 360500, 3, '分宜县', '分宜', '0790', '336600', '114.69189', '27.81475', '114.698363', '27.820779', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (360600, 360000, 2, '鹰潭市', '鹰潭', '0701', '335000', '117.033838', '28.238638', '117.040372', '28.244572', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (360602, 360600, 3, '月湖区', '月湖', '0701', '335000', '117.03732', '28.23913', '117.043869', '28.245003', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (360603, 360600, 3, '余江区', '余江', '0701', '335200', '116.81851', '28.21034', '116.825104', '28.215993', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (360681, 360600, 3, '贵溪市', '贵溪', '0701', '335400', '117.24246', '28.2926', '117.248857', '28.298944', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (360682, 360600, 3, '高新区', '高新区', '0701', '338000', '117.000029', '28.21554', '117.006458', '28.221894', NULL, '高新技术开发区');
INSERT INTO `yx_dev_region` VALUES (360700, 360000, 2, '赣州市', '赣州', '0797', '341000', '114.940278', '25.85097', '114.946747', '25.857149', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (360702, 360700, 3, '章贡区', '章贡', '0797', '341000', '114.94284', '25.8624', '114.949289', '25.868614', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (360703, 360700, 3, '南康区', '南康', '0797', '341400', '114.756933', '25.661721', '114.763444', '25.667595', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (360704, 360700, 3, '赣县区', '赣县', '0797', '341100', '115.01171', '25.86149', '115.018279', '25.867177', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (360722, 360700, 3, '信丰县', '信丰', '0797', '341600', '114.92279', '25.38612', '114.929312', '25.391992', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (360723, 360700, 3, '大余县', '大余', '0797', '341500', '114.35757', '25.39561', '114.36398', '25.401947', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (360724, 360700, 3, '上犹县', '上犹', '0797', '341200', '114.54138', '25.79567', '114.547953', '25.801326', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (360725, 360700, 3, '崇义县', '崇义', '0797', '341300', '114.30835', '25.68186', '114.314922', '25.68755', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (360726, 360700, 3, '安远县', '安远', '0797', '342100', '115.39483', '25.1371', '115.401387', '25.142854', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (360727, 360700, 3, '龙南县', '龙南', '0797', '341700', '114.78994', '24.91086', '114.796494', '24.916559', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (360728, 360700, 3, '定南县', '定南', '0797', '341900', '115.02713', '24.78395', '115.033695', '24.789628', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (360729, 360700, 3, '全南县', '全南', '0797', '341800', '114.5292', '24.74324', '114.535781', '24.748954', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (360730, 360700, 3, '宁都县', '宁都', '0797', '342800', '116.01565', '26.47227', '116.022115', '26.478369', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (360731, 360700, 3, '于都县', '于都', '0797', '342300', '115.41415', '25.95257', '115.420653', '25.958649', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (360732, 360700, 3, '兴国县', '兴国', '0797', '342400', '115.36309', '26.33776', '115.369642', '26.343541', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (360733, 360700, 3, '会昌县', '会昌', '0797', '342600', '115.78555', '25.60068', '115.792011', '25.606936', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (360734, 360700, 3, '寻乌县', '寻乌', '0797', '342200', '115.64852', '24.95513', '115.655021', '24.961102', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (360735, 360700, 3, '石城县', '石城', '0797', '342700', '116.3442', '26.32617', '116.35079', '26.331832', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (360781, 360700, 3, '瑞金市', '瑞金', '0797', '342500', '116.02703', '25.88557', '116.033451', '25.891837', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (360782, 360700, 3, '章康新区', '章康新区', '0797', '341000', '114.93503', '25.831829', '114.941529', '25.837923', NULL, '新区');
INSERT INTO `yx_dev_region` VALUES (360800, 360000, 2, '吉安市', '吉安', '0796', '343000', '114.986373', '27.111699', '114.992849', '27.117762', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (360802, 360800, 3, '吉州区', '吉州', '0796', '343000', '114.97598', '27.10669', '114.982413', '27.112918', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (360803, 360800, 3, '青原区', '青原', '0796', '343000', '115.01747', '27.10577', '115.024037', '27.111425', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (360821, 360800, 3, '吉安县', '吉安', '0796', '343100', '114.90695', '27.04048', '114.913542', '27.046162', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (360822, 360800, 3, '吉水县', '吉水', '0796', '331600', '115.1343', '27.21071', '115.140859', '27.216375', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (360823, 360800, 3, '峡江县', '峡江', '0796', '331400', '115.31723', '27.576', '115.32363', '27.582338', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (360824, 360800, 3, '新干县', '新干', '0796', '331300', '115.39306', '27.74092', '115.399642', '27.746656', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (360825, 360800, 3, '永丰县', '永丰', '0796', '331500', '115.44238', '27.31785', '115.448783', '27.32419', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (360826, 360800, 3, '泰和县', '泰和', '0796', '343700', '114.90789', '26.79113', '114.914483', '26.796819', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (360827, 360800, 3, '遂川县', '遂川', '0796', '343900', '114.51629', '26.32598', '114.522829', '26.331872', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (360828, 360800, 3, '万安县', '万安', '0796', '343800', '114.78659', '26.45931', '114.793165', '26.464986', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (360829, 360800, 3, '安福县', '安福', '0796', '343200', '114.61956', '27.39276', '114.626037', '27.398943', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (360830, 360800, 3, '永新县', '永新', '0796', '343400', '114.24246', '26.94488', '114.248875', '26.951219', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (360881, 360800, 3, '井冈山市', '井冈山', '0796', '343600', '114.28949', '26.74804', '114.296047', '26.753745', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (360900, 360000, 2, '宜春市', '宜春', '0795', '336000', '114.391136', '27.8043', '114.397622', '27.810275', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (360902, 360900, 3, '袁州区', '袁州', '0795', '336000', '114.38246', '27.79649', '114.388913', '27.802618', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (360921, 360900, 3, '奉新县', '奉新', '0795', '330700', '115.40036', '28.6879', '115.406909', '28.693735', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (360922, 360900, 3, '万载县', '万载', '0795', '336100', '114.4458', '28.10656', '114.452338', '28.11249', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (360923, 360900, 3, '上高县', '上高', '0795', '336400', '114.92459', '28.23423', '114.931133', '28.240138', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (360924, 360900, 3, '宜丰县', '宜丰', '0795', '336300', '114.7803', '28.38555', '114.78688', '28.391204', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (360925, 360900, 3, '靖安县', '靖安', '0795', '330600', '115.36279', '28.86167', '115.369342', '28.867455', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (360926, 360900, 3, '铜鼓县', '铜鼓', '0795', '336200', '114.37036', '28.52311', '114.376769', '28.529399', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (360981, 360900, 3, '丰城市', '丰城', '0795', '331100', '115.77114', '28.15918', '115.777619', '28.165197', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (360982, 360900, 3, '樟树市', '樟树', '0795', '331200', '115.5465', '28.05332', '115.552917', '28.059579', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (360983, 360900, 3, '高安市', '高安', '0795', '330800', '115.3753', '28.4178', '115.381865', '28.42346', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (361000, 360000, 2, '抚州市', '抚州', '0794', '344000', '116.358351', '27.98385', '116.364918', '27.989654', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (361002, 361000, 3, '临川区', '临川', '0794', '344100', '116.35919', '27.97721', '116.36575', '27.983026', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (361003, 361000, 3, '东乡区', '东乡', '0794', '331800', '116.59039', '28.23614', '116.596981', '28.241845', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (361021, 361000, 3, '南城县', '南城', '0794', '344700', '116.64419', '27.55381', '116.650596', '27.560149', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (361022, 361000, 3, '黎川县', '黎川', '0794', '344600', '116.90771', '27.28232', '116.914216', '27.288366', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (361023, 361000, 3, '南丰县', '南丰', '0794', '344500', '116.5256', '27.21842', '116.532004', '27.224751', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (361024, 361000, 3, '崇仁县', '崇仁', '0794', '344200', '116.06021', '27.75962', '116.066686', '27.765795', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (361025, 361000, 3, '乐安县', '乐安', '0794', '344300', '115.83108', '27.42812', '115.837577', '27.434098', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (361026, 361000, 3, '宜黄县', '宜黄', '0794', '344400', '116.23626', '27.55487', '116.242801', '27.560637', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (361027, 361000, 3, '金溪县', '金溪', '0794', '344800', '116.77392', '27.90753', '116.78035', '27.91379', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (361028, 361000, 3, '资溪县', '资溪', '0794', '335300', '117.06939', '27.70493', '117.075949', '27.710617', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (361030, 361000, 3, '广昌县', '广昌', '0794', '344900', '116.32547', '26.8341', '116.332015', '26.839844', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (361100, 360000, 2, '上饶市', '上饶', '0793', '334000', '117.971185', '28.44442', '117.977618', '28.450716', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (361102, 361100, 3, '信州区', '信州', '0793', '334000', '117.96682', '28.43121', '117.973231', '28.437539', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (361103, 361100, 3, '广丰区', '广丰', '0793', '334600', '118.19158', '28.43766', '118.198', '28.44398', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (361121, 361100, 3, '上饶县', '上饶', '0793', '334100', '117.90884', '28.44856', '117.915425', '28.454246', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (361123, 361100, 3, '玉山县', '玉山', '0793', '334700', '118.24462', '28.6818', '118.251181', '28.687555', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (361124, 361100, 3, '铅山县', '铅山', '0793', '334500', '117.70996', '28.31549', '117.716382', '28.321794', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (361125, 361100, 3, '横峰县', '横峰', '0793', '334300', '117.5964', '28.40716', '117.602797', '28.413502', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (361126, 361100, 3, '弋阳县', '弋阳', '0793', '334400', '117.45929', '28.37451', '117.465756', '28.380676', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (361127, 361100, 3, '余干县', '余干', '0793', '335100', '116.69555', '28.70206', '116.702152', '28.707724', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (361128, 361100, 3, '鄱阳县', '鄱阳', '0793', '333100', '116.69967', '29.0118', '116.706238', '29.017445', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (361129, 361100, 3, '万年县', '万年', '0793', '335500', '117.06884', '28.69537', '117.075431', '28.701059', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (361130, 361100, 3, '婺源县', '婺源', '0793', '333200', '117.86105', '29.24841', '117.867491', '29.254565', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (361181, 361100, 3, '德兴市', '德兴', '0793', '334200', '117.57919', '28.94736', '117.585669', '28.953528', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (370000, 100000, 1, '山东省', '山东', NULL, NULL, '117.000923', '36.675807', '117.007299', '36.682153', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (370100, 370000, 2, '济南市', '济南', '0531', '250000', '117.000923', '36.675807', '117.007299', '36.682153', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (370102, 370100, 3, '历下区', '历下', '0531', '250014', '117.0768', '36.66661', '117.083364', '36.672384', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (370103, 370100, 3, '市中区', '市中', '0531', '250001', '116.99741', '36.65101', '117.00381', '36.65736', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (370104, 370100, 3, '槐荫区', '槐荫', '0531', '250117', '116.90075', '36.65136', '116.907207', '36.657526', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (370105, 370100, 3, '天桥区', '天桥', '0531', '250031', '116.98749', '36.67801', '116.993887', '36.684283', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (370112, 370100, 3, '历城区', '历城', '0531', '250100', '117.06509', '36.67995', '117.07168', '36.685606', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (370113, 370100, 3, '长清区', '长清', '0531', '250300', '116.75192', '36.55352', '116.758308', '36.559835', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (370114, 370100, 3, '章丘区', '章丘', '0531', '250200', '117.53677', '36.71392', '117.543373', '36.719571', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (370115, 370100, 3, '济阳区', '济阳', '0531', '251400', '117.17327', '36.97845', '117.17989', '36.984125', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (370116, 370100, 3, '莱芜区', '莱芜', '0634', '271100', '117.65986', '36.2032', '117.666451', '36.208842', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (370117, 370100, 3, '钢城区', '钢城', '0634', '271104', '117.8049', '36.06319', '117.811425', '36.069096', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (370124, 370100, 3, '平阴县', '平阴', '0531', '250400', '116.45587', '36.28955', '116.462486', '36.295212', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (370126, 370100, 3, '商河县', '商河', '0531', '251600', '117.15722', '37.31119', '117.163753', '37.317058', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (370182, 370100, 3, '高新区', '高新区', '0531', '250000', '117.128033', '36.681553', '117.134415', '36.687868', NULL, '高新技术开发区');
INSERT INTO `yx_dev_region` VALUES (370200, 370000, 2, '青岛市', '青岛', '0532', '266000', '120.369557', '36.094406', '120.375943', '36.100717', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (370202, 370200, 3, '市南区', '市南', '0532', '266000', '120.38773', '36.06671', '120.394211', '36.072751', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (370203, 370200, 3, '市北区', '市北', '0532', '266000', '120.37469', '36.08734', '120.381093', '36.093594', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (370211, 370200, 3, '黄岛区', '黄岛', '0532', '266000', '120.19775', '35.96065', '120.204298', '35.966429', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (370212, 370200, 3, '崂山区', '崂山', '0532', '266100', '120.46923', '36.10717', '120.475627', '36.113472', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (370213, 370200, 3, '李沧区', '李沧', '0532', '266000', '120.43286', '36.14502', '120.439463', '36.150743', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (370214, 370200, 3, '城阳区', '城阳', '0532', '266000', '120.39621', '36.30735', '120.402738', '36.313232', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (370215, 370200, 3, '即墨区', '即墨', '0532', '266200', '120.44699', '36.38907', '120.453526', '36.395019', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (370281, 370200, 3, '胶州市', '胶州', '0532', '266300', '120.0335', '36.26442', '120.040038', '36.27036', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (370283, 370200, 3, '平度市', '平度', '0532', '266700', '119.95996', '36.78688', '119.966509', '36.792697', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (370285, 370200, 3, '莱西市', '莱西', '0532', '266600', '120.51773', '36.88804', '120.524285', '36.893901', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (370286, 370200, 3, '西海岸新区', '西海岸新区', '0532', '266500', '120.19775', '35.96065', '120.204298', '35.966429', NULL, '国家级新区');
INSERT INTO `yx_dev_region` VALUES (370287, 370200, 3, '高新区', '高新区', '0532', '266000', '120.459095', '36.136192', '120.46556', '36.142362', NULL, '高新技术开发区');
INSERT INTO `yx_dev_region` VALUES (370300, 370000, 2, '淄博市', '淄博', '0533', '255000', '118.047648', '36.814939', '118.054143', '36.82089', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (370302, 370300, 3, '淄川区', '淄川', '0533', '255100', '117.96655', '36.64339', '117.972961', '36.649728', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (370303, 370300, 3, '张店区', '张店', '0533', '255000', '118.01788', '36.80676', '118.024471', '36.812402', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (370304, 370300, 3, '博山区', '博山', '0533', '255200', '117.86166', '36.49469', '117.868127', '36.500844', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (370305, 370300, 3, '临淄区', '临淄', '0533', '255400', '118.30966', '36.8259', '118.316052', '36.8322', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (370306, 370300, 3, '周村区', '周村', '0533', '255300', '117.86969', '36.80322', '117.87617', '36.80922', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (370321, 370300, 3, '桓台县', '桓台', '0533', '256400', '118.09698', '36.96036', '118.10341', '36.966583', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (370322, 370300, 3, '高青县', '高青', '0533', '256300', '117.82708', '37.17197', '117.833474', '37.17824', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (370323, 370300, 3, '沂源县', '沂源', '0533', '256100', '118.17105', '36.18536', '118.177539', '36.191378', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (370324, 370300, 3, '高新区', '高新区', '0533', '255000', '118.050957', '36.840995', '118.057452', '36.847013', NULL, '高新技术开发区');
INSERT INTO `yx_dev_region` VALUES (370400, 370000, 2, '枣庄市', '枣庄', '0632', '277000', '117.557964', '34.856424', '117.564529', '34.862217', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (370402, 370400, 3, '市中区', '市中', '0632', '277000', '117.55603', '34.86391', '117.562596', '34.869673', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (370403, 370400, 3, '薛城区', '薛城', '0632', '277000', '117.26318', '34.79498', '117.269639', '34.801101', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (370404, 370400, 3, '峄城区', '峄城', '0632', '277300', '117.59057', '34.77225', '117.596959', '34.778555', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (370405, 370400, 3, '台儿庄区', '台儿庄', '0632', '277400', '117.73452', '34.56363', '117.740948', '34.569887', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (370406, 370400, 3, '山亭区', '山亭', '0632', '277200', '117.4663', '35.09541', '117.472725', '35.101677', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (370481, 370400, 3, '滕州市', '滕州', '0632', '277500', '117.165', '35.10534', '117.171569', '35.11109', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (370482, 370400, 3, '高新区', '高新区', '0632', '277800', '117.27369', '34.809098', '117.280219', '34.815033', NULL, '高新技术开发区');
INSERT INTO `yx_dev_region` VALUES (370500, 370000, 2, '东营市', '东营', '0546', '257000', '118.4963', '37.461266', '118.502927', '37.466923', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (370502, 370500, 3, '东营区', '东营', '0546', '257100', '118.5816', '37.44875', '118.588061', '37.454904', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (370503, 370500, 3, '河口区', '河口', '0546', '257200', '118.5249', '37.88541', '118.531411', '37.89131', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (370505, 370500, 3, '垦利区', '垦利', '0546', '257500', '118.54815', '37.58825', '118.554577', '37.594545', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (370522, 370500, 3, '利津县', '利津', '0546', '257400', '118.25637', '37.49157', '118.262989', '37.497224', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (370523, 370500, 3, '广饶县', '广饶', '0546', '257300', '118.40704', '37.05381', '118.413538', '37.059749', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (370600, 370000, 2, '烟台市', '烟台', '0535', '264000', '121.391382', '37.539297', '121.397958', '37.54499', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (370602, 370600, 3, '芝罘区', '芝罘', '0535', '264000', '121.40023', '37.54064', '121.406769', '37.546457', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (370611, 370600, 3, '福山区', '福山', '0535', '265500', '121.26812', '37.49841', '121.274724', '37.504079', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (370612, 370600, 3, '牟平区', '牟平', '0535', '264100', '121.60067', '37.38846', '121.607221', '37.394264', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (370613, 370600, 3, '莱山区', '莱山', '0535', '264000', '121.44512', '37.51165', '121.451501', '37.517998', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (370634, 370600, 3, '长岛县', '长岛', '0535', '265800', '120.738', '37.91754', '120.744431', '37.923752', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (370681, 370600, 3, '龙口市', '龙口', '0535', '265700', '120.50634', '37.64064', '120.512802', '37.646704', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (370682, 370600, 3, '莱阳市', '莱阳', '0535', '265200', '120.71066', '36.98012', '120.717079', '36.986445', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (370683, 370600, 3, '莱州市', '莱州', '0535', '261400', '119.94137', '37.17806', '119.947964', '37.183696', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (370684, 370600, 3, '蓬莱市', '蓬莱', '0535', '265600', '120.75988', '37.81119', '120.766447', '37.817014', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (370685, 370600, 3, '招远市', '招远', '0535', '265400', '120.40481', '37.36269', '120.411404', '37.368442', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (370686, 370600, 3, '栖霞市', '栖霞', '0535', '265300', '120.85025', '37.33571', '120.856668', '37.342026', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (370687, 370600, 3, '海阳市', '海阳', '0535', '265100', '121.15976', '36.77622', '121.16632', '36.782035', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (370688, 370600, 3, '高新区', '高新区', '0535', '264003', '121.484124', '37.448924', '121.490708', '37.454681', NULL, '高新技术开发区');
INSERT INTO `yx_dev_region` VALUES (370689, 370600, 3, '经济开发区', '经济开发区', '0535', '264003', '121.253459', '37.563178', '121.260068', '37.568836', NULL, '经济技术开发区');
INSERT INTO `yx_dev_region` VALUES (370700, 370000, 2, '潍坊市', '潍坊', '0536', '261000', '119.107078', '36.70925', '119.11367', '36.714914', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (370702, 370700, 3, '潍城区', '潍城', '0536', '261000', '119.10582', '36.7139', '119.112419', '36.719557', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (370703, 370700, 3, '寒亭区', '寒亭', '0536', '261100', '119.21832', '36.77504', '119.224935', '36.780685', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (370704, 370700, 3, '坊子区', '坊子', '0536', '261200', '119.16476', '36.65218', '119.171161', '36.658529', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (370705, 370700, 3, '奎文区', '奎文', '0536', '261000', '119.12532', '36.70723', '119.131835', '36.71314', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (370724, 370700, 3, '临朐县', '临朐', '0536', '262600', '118.544', '36.51216', '118.550446', '36.518404', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (370725, 370700, 3, '昌乐县', '昌乐', '0536', '262400', '118.83017', '36.7078', '118.83666', '36.713793', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (370781, 370700, 3, '青州市', '青州', '0536', '262500', '118.47915', '36.68505', '118.485682', '36.69088', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (370782, 370700, 3, '诸城市', '诸城', '0536', '262200', '119.40988', '35.99662', '119.416283', '36.00293', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (370783, 370700, 3, '寿光市', '寿光', '0536', '262700', '118.74047', '36.88128', '118.747096', '36.886929', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (370784, 370700, 3, '安丘市', '安丘', '0536', '262100', '119.2189', '36.47847', '119.225508', '36.484112', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (370785, 370700, 3, '高密市', '高密', '0536', '261500', '119.75701', '36.38397', '119.76342', '36.39033', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (370786, 370700, 3, '昌邑市', '昌邑', '0536', '261300', '119.39767', '36.86008', '119.404077', '36.866441', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (370787, 370700, 3, '高新区', '高新区', '0536', '261000', '119.21585', '36.71218', '119.22245', '36.717828', NULL, '高新技术开发区');
INSERT INTO `yx_dev_region` VALUES (370800, 370000, 2, '济宁市', '济宁', '0537', '272000', '116.587245', '35.415393', '116.593857', '35.421072', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (370811, 370800, 3, '任城区', '任城', '0537', '272000', '116.59504', '35.40659', '116.601621', '35.412345', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (370812, 370800, 3, '兖州区', '兖州', '0537', '272000', '116.826546', '35.552305', '116.833165', '35.557981', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (370826, 370800, 3, '微山县', '微山', '0537', '277600', '117.12875', '34.80712', '117.135163', '34.813437', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (370827, 370800, 3, '鱼台县', '鱼台', '0537', '272300', '116.64761', '34.99674', '116.653999', '35.003058', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (370828, 370800, 3, '金乡县', '金乡', '0537', '272200', '116.31146', '35.065', '116.317987', '35.070979', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (370829, 370800, 3, '嘉祥县', '嘉祥', '0537', '272400', '116.34249', '35.40836', '116.349103', '35.414016', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (370830, 370800, 3, '汶上县', '汶上', '0537', '272500', '116.48742', '35.73295', '116.493916', '35.738897', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (370831, 370800, 3, '泗水县', '泗水', '0537', '273200', '117.27948', '35.66113', '117.286048', '35.666968', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (370832, 370800, 3, '梁山县', '梁山', '0537', '272600', '116.09683', '35.80322', '116.103451', '35.808881', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (370881, 370800, 3, '曲阜市', '曲阜', '0537', '273100', '116.98645', '35.58091', '116.992868', '35.587176', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (370883, 370800, 3, '邹城市', '邹城', '0537', '273500', '116.97335', '35.40531', '116.979837', '35.411373', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (370884, 370800, 3, '高新区', '高新区', '0537', '272000', '116.629511', '35.429776', '116.635939', '35.43608', NULL, '高新技术开发区');
INSERT INTO `yx_dev_region` VALUES (370900, 370000, 2, '泰安市', '泰安', '0538', '271000', '117.129063', '36.194968', '117.135453', '36.201276', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (370902, 370900, 3, '泰山区', '泰山', '0538', '271000', '117.13446', '36.19411', '117.140868', '36.200361', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (370911, 370900, 3, '岱岳区', '岱岳', '0538', '271000', '117.04174', '36.1875', '117.048295', '36.193295', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (370921, 370900, 3, '宁阳县', '宁阳', '0538', '271400', '116.80542', '35.7599', '116.811997', '35.765647', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (370923, 370900, 3, '东平县', '东平', '0538', '271500', '116.47113', '35.93792', '116.477722', '35.943629', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (370982, 370900, 3, '新泰市', '新泰', '0538', '271200', '117.76959', '35.90887', '117.776201', '35.914574', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (370983, 370900, 3, '肥城市', '肥城', '0538', '271600', '116.76815', '36.18247', '116.774549', '36.188788', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (371000, 370000, 2, '威海市', '威海', '0631', '264200', '122.116394', '37.509691', '122.122958', '37.515449', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (371002, 371000, 3, '环翠区', '环翠', '0631', '264200', '122.12344', '37.50199', '122.129976', '37.507866', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (371003, 371000, 3, '文登区', '文登', '0631', '266440', '122.057139', '37.196211', '122.063566', '37.202438', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (371082, 371000, 3, '荣成市', '荣成', '0631', '264300', '122.48773', '37.1652', '122.494225', '37.171151', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (371083, 371000, 3, '乳山市', '乳山', '0631', '264500', '121.53814', '36.91918', '121.544578', '36.925326', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (371084, 371000, 3, '火炬高新区', '火炬高新区', '0631', '264200', '122.034306', '37.521629', '122.040681', '37.527974', NULL, '高新技术开发区');
INSERT INTO `yx_dev_region` VALUES (371085, 371000, 3, '经济技术开发区', '经济开发区', '0631', '264200', '121.53814', '36.91918', '121.544578', '36.925326', NULL, '经济技术开发区');
INSERT INTO `yx_dev_region` VALUES (371086, 371000, 3, '临港经济技术开发区', '临港区', '0631', '264211', '122.142849', '37.34263', '122.149297', '37.348864', NULL, '经济技术开发区');
INSERT INTO `yx_dev_region` VALUES (371100, 370000, 2, '日照市', '日照', '0633', '276800', '119.461208', '35.428588', '119.467833', '35.434236', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (371102, 371100, 3, '东港区', '东港', '0633', '276800', '119.46237', '35.42541', '119.468994', '35.43106', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (371103, 371100, 3, '岚山区', '岚山', '0633', '276800', '119.31884', '35.12203', '119.32537', '35.127865', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (371121, 371100, 3, '五莲县', '五莲', '0633', '262300', '119.207', '35.75004', '119.213574', '35.755759', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (371122, 371100, 3, '莒县', '莒县', '0633', '276500', '118.83789', '35.58054', '118.844432', '35.586397', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (371300, 370000, 2, '临沂市', '临沂', '0539', '276000', '118.326443', '35.065282', '118.332862', '35.071622', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (371302, 371300, 3, '兰山区', '兰山', '0539', '276000', '118.34817', '35.06872', '118.354679', '35.07476', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (371311, 371300, 3, '罗庄区', '罗庄', '0539', '276000', '118.28466', '34.99627', '118.291175', '35.002168', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (371312, 371300, 3, '河东区', '河东', '0539', '276000', '118.41055', '35.08803', '118.417058', '35.094044', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (371321, 371300, 3, '沂南县', '沂南', '0539', '276300', '118.47061', '35.55131', '118.477133', '35.557304', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (371322, 371300, 3, '郯城县', '郯城', '0539', '276100', '118.36712', '34.61354', '118.373707', '34.619264', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (371323, 371300, 3, '沂水县', '沂水', '0539', '276400', '118.63009', '35.78731', '118.636702', '35.793008', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (371324, 371300, 3, '兰陵县', '兰陵', '0539', '277700', '117.856592', '34.738315', '117.863026', '34.744544', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (371325, 371300, 3, '费县', '费县', '0539', '273400', '117.97836', '35.26562', '117.984786', '35.271819', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (371326, 371300, 3, '平邑县', '平邑', '0539', '273300', '117.63867', '35.50573', '117.645204', '35.511571', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (371327, 371300, 3, '莒南县', '莒南', '0539', '276600', '118.83227', '35.17539', '118.838796', '35.181352', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (371328, 371300, 3, '蒙阴县', '蒙阴', '0539', '276200', '117.94592', '35.70996', '117.952331', '35.716219', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (371329, 371300, 3, '临沭县', '临沭', '0539', '276700', '118.65267', '34.92091', '118.659156', '34.92696', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (371400, 370000, 2, '德州市', '德州', '0534', '253000', '116.307428', '37.453968', '116.313926', '37.460019', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (371402, 371400, 3, '德城区', '德城', '0534', '253000', '116.29943', '37.45126', '116.305882', '37.457447', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (371403, 371400, 3, '陵城区', '陵城', '0534', '253500', '116.57601', '37.33571', '116.582634', '37.341372', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (371422, 371400, 3, '宁津县', '宁津', '0534', '253400', '116.79702', '37.65301', '116.803542', '37.658878', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (371423, 371400, 3, '庆云县', '庆云', '0534', '253700', '117.38635', '37.77616', '117.39281', '37.782221', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (371424, 371400, 3, '临邑县', '临邑', '0534', '251500', '116.86547', '37.19053', '116.87188', '37.196781', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (371425, 371400, 3, '齐河县', '齐河', '0534', '251100', '116.75515', '36.79532', '116.761529', '36.801655', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (371426, 371400, 3, '平原县', '平原', '0534', '253100', '116.43432', '37.16632', '116.440826', '37.172236', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (371427, 371400, 3, '夏津县', '夏津', '0534', '253200', '116.0017', '36.94852', '116.008236', '36.95437', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (371428, 371400, 3, '武城县', '武城', '0534', '253300', '116.07009', '37.21403', '116.076603', '37.220032', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (371481, 371400, 3, '乐陵市', '乐陵', '0534', '253600', '117.23141', '37.73164', '117.237816', '37.737959', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (371482, 371400, 3, '禹城市', '禹城', '0534', '251200', '116.64309', '36.93444', '116.649462', '36.940779', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (371500, 370000, 2, '聊城市', '聊城', '0635', '252000', '115.980367', '36.456013', '115.986958', '36.461659', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (371502, 371500, 3, '东昌府区', '东昌府', '0635', '252000', '115.97383', '36.44458', '115.980415', '36.450244', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (371521, 371500, 3, '阳谷县', '阳谷', '0635', '252300', '115.79126', '36.11444', '115.797657', '36.12075', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (371522, 371500, 3, '莘县', '莘县', '0635', '252400', '115.6697', '36.23423', '115.676101', '36.240526', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (371523, 371500, 3, '茌平县', '茌平', '0635', '252100', '116.25491', '36.57969', '116.261365', '36.585773', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (371524, 371500, 3, '东阿县', '东阿', '0635', '252200', '116.25012', '36.33209', '116.2566', '36.338086', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (371525, 371500, 3, '冠县', '冠县', '0635', '252500', '115.44195', '36.48429', '115.448345', '36.490636', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (371526, 371500, 3, '高唐县', '高唐', '0635', '252800', '116.23172', '36.86535', '116.238329', '36.871071', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (371581, 371500, 3, '临清市', '临清', '0635', '252600', '115.70629', '36.83945', '115.712768', '36.845517', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (371600, 370000, 2, '滨州市', '滨州', '0543', '256600', '118.016974', '37.383542', '118.023581', '37.389191', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (371602, 371600, 3, '滨城区', '滨城', '0543', '256600', '118.02026', '37.38524', '118.026867', '37.390884', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (371603, 371600, 3, '沾化区', '沾化', '0543', '256800', '118.13214', '37.69832', '118.138759', '37.704', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (371621, 371600, 3, '惠民县', '惠民', '0543', '251700', '117.51113', '37.49013', '117.517646', '37.496112', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (371622, 371600, 3, '阳信县', '阳信', '0543', '251800', '117.58139', '37.64198', '117.587809', '37.648173', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (371623, 371600, 3, '无棣县', '无棣', '0543', '251900', '117.61395', '37.74009', '117.620366', '37.746353', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (371625, 371600, 3, '博兴县', '博兴', '0543', '256500', '118.1336', '37.14316', '118.140202', '37.148824', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (371681, 371600, 3, '邹平市', '邹平', '0543', '256200', '117.74307', '36.86295', '117.749549', '36.869081', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (371682, 371600, 3, '北海新区', '北海新区', '0543', '256200', '118.016974', '37.383542', '118.023581', '37.389191', NULL, '经济技术开发区');
INSERT INTO `yx_dev_region` VALUES (371700, 370000, 2, '菏泽市', '菏泽', '0530', '274000', '115.469381', '35.246531', '115.475859', '35.252536', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (371702, 371700, 3, '牡丹区', '牡丹', '0530', '274000', '115.41662', '35.25091', '115.423065', '35.257022', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (371703, 371700, 3, '定陶区', '定陶', '0530', '274100', '115.57287', '35.07118', '115.579307', '35.077457', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (371721, 371700, 3, '曹县', '曹县', '0530', '274400', '115.54226', '34.82659', '115.548716', '34.832803', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (371722, 371700, 3, '单县', '单县', '0530', '274300', '116.08703', '34.79514', '116.093606', '34.800868', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (371723, 371700, 3, '成武县', '成武', '0530', '274200', '115.8897', '34.95332', '115.896221', '34.95932', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (371724, 371700, 3, '巨野县', '巨野', '0530', '274900', '116.09497', '35.39788', '116.10157', '35.403543', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (371725, 371700, 3, '郓城县', '郓城', '0530', '274700', '115.94439', '35.60044', '115.950842', '35.606536', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (371726, 371700, 3, '鄄城县', '鄄城', '0530', '274600', '115.50997', '35.56412', '115.516577', '35.569824', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (371728, 371700, 3, '东明县', '东明', '0530', '274500', '115.09079', '35.28906', '115.097209', '35.295354', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (371772, 371700, 3, '高新开发区', '高新开发区', '0530', '274000', '115.388931', '35.24164', '115.395508', '35.247326', NULL, '高新技术开发区');
INSERT INTO `yx_dev_region` VALUES (410000, 100000, 1, '河南省', '河南', NULL, NULL, '113.665412', '34.757975', '113.671872', '34.764051', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (410100, 410000, 2, '郑州市', '郑州', '0371', '450000', '113.665412', '34.757975', '113.671872', '34.764051', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (410102, 410100, 3, '中原区', '中原', '0371', '450000', '113.61333', '34.74827', '113.619804', '34.754327', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (410103, 410100, 3, '二七区', '二七', '0371', '450000', '113.63931', '34.72336', '113.645721', '34.729705', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (410104, 410100, 3, '管城回族区', '管城', '0371', '450000', '113.67734', '34.75383', '113.683866', '34.759698', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (410105, 410100, 3, '金水区', '金水', '0371', '450000', '113.66057', '34.80028', '113.667021', '34.806442', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (410106, 410100, 3, '上街区', '上街', '0371', '450041', '113.30897', '34.80276', '113.315467', '34.808779', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (410108, 410100, 3, '惠济区', '惠济', '0371', '450053', '113.61688', '34.86735', '113.623336', '34.873468', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (410122, 410100, 3, '中牟县', '中牟', '0371', '451450', '113.97619', '34.71899', '113.982674', '34.725104', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (410181, 410100, 3, '巩义市', '巩义', '0371', '451200', '113.022', '34.74794', '113.028431', '34.754137', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (410182, 410100, 3, '荥阳市', '荥阳', '0371', '450100', '113.38345', '34.78759', '113.389871', '34.793807', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (410183, 410100, 3, '新密市', '新密', '0371', '452370', '113.3869', '34.53704', '113.393302', '34.543298', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (410184, 410100, 3, '新郑市', '新郑', '0371', '451100', '113.73645', '34.3955', '113.742902', '34.401609', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (410185, 410100, 3, '登封市', '登封', '0371', '452470', '113.05023', '34.45345', '113.056654', '34.459745', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (410186, 410100, 3, '郑东新区', '郑东新区', '0371', '450018', '113.728667', '34.769628', '113.735155', '34.775598', NULL, '新区');
INSERT INTO `yx_dev_region` VALUES (410187, 410100, 3, '郑汴新区', '郑汴新区', '0371', '451100', '113.692694', '34.747034', '113.699284', '34.752715', NULL, '新区');
INSERT INTO `yx_dev_region` VALUES (410188, 410100, 3, '高新开发区', '高新开发区', '0371', '450000', '113.567406', '34.81207', '113.574', '34.817804', NULL, '高新技术开发区');
INSERT INTO `yx_dev_region` VALUES (410189, 410100, 3, '经济开发区', '经济开发区', '0371', '450000', '113.743089', '34.72195', '113.749539', '34.728171', NULL, '经济技术开发区');
INSERT INTO `yx_dev_region` VALUES (410190, 410100, 3, '航空港区', '航空港区', '0371', '450019', '113.827254', '34.536742', '113.833832', '34.542419', NULL, '经济技术开发区');
INSERT INTO `yx_dev_region` VALUES (410200, 410000, 2, '开封市', '开封', '0371', '475000', '114.341447', '34.797049', '114.347885', '34.803242', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (410202, 410200, 3, '龙亭区', '龙亭', '0371', '475000', '114.35484', '34.79995', '114.361239', '34.806281', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (410203, 410200, 3, '顺河回族区', '顺河', '0371', '475000', '114.36123', '34.79586', '114.367622', '34.802201', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (410204, 410200, 3, '鼓楼区', '鼓楼', '0371', '475000', '114.35559', '34.79517', '114.361984', '34.801503', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (410205, 410200, 3, '禹王台区', '禹王台', '0371', '475000', '114.34787', '34.77693', '114.354268', '34.783201', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (410212, 410200, 3, '祥符区', '祥符', '0371', '475100', '114.43859', '34.75874', '114.445133', '34.764542', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (410221, 410200, 3, '杞县', '杞县', '0371', '475200', '114.7828', '34.55033', '114.789393', '34.555987', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (410222, 410200, 3, '通许县', '通许', '0371', '475400', '114.46716', '34.47522', '114.473598', '34.481494', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (410223, 410200, 3, '尉氏县', '尉氏', '0371', '475500', '114.19284', '34.41223', '114.199402', '34.417956', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (410225, 410200, 3, '兰考县', '兰考', '0371', '475300', '114.81961', '34.8235', '114.826078', '34.829672', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (410226, 410200, 3, '经济技术开发区', '经济开发区', '0371', '475000', '114.292303', '34.786812', '114.298887', '34.792493', NULL, '经济技术开发区');
INSERT INTO `yx_dev_region` VALUES (410300, 410000, 2, '洛阳市', '洛阳', '0379', '471000', '112.434468', '34.663041', '112.440854', '34.66936', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (410302, 410300, 3, '老城区', '老城', '0379', '471000', '112.46902', '34.68364', '112.475518', '34.689658', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (410303, 410300, 3, '西工区', '西工', '0379', '471000', '112.4371', '34.67', '112.443488', '34.67633', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (410304, 410300, 3, '瀍河回族区', '瀍河', '0379', '471002', '112.50018', '34.67985', '112.506784', '34.685512', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (410305, 410300, 3, '涧西区', '涧西', '0379', '471000', '112.39588', '34.65823', '112.402433', '34.663997', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (410306, 410300, 3, '吉利区', '吉利', '0379', '471000', '112.58905', '34.90088', '112.595529', '34.906892', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (410311, 410300, 3, '洛龙区', '洛龙', '0379', '471000', '112.46412', '34.61866', '112.47059', '34.624763', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (410322, 410300, 3, '孟津县', '孟津', '0379', '471100', '112.44351', '34.826', '112.449926', '34.832337', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (410323, 410300, 3, '新安县', '新安', '0379', '471800', '112.13238', '34.72814', '112.138987', '34.733833', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (410324, 410300, 3, '栾川县', '栾川', '0379', '471500', '111.61779', '33.78576', '111.624224', '33.791958', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (410325, 410300, 3, '嵩县', '嵩县', '0379', '471400', '112.08526', '34.13466', '112.091667', '34.140985', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (410326, 410300, 3, '汝阳县', '汝阳', '0379', '471200', '112.47314', '34.15387', '112.479644', '34.159811', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (410327, 410300, 3, '宜阳县', '宜阳', '0379', '471600', '112.17907', '34.51523', '112.185509', '34.52138', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (410328, 410300, 3, '洛宁县', '洛宁', '0379', '471700', '111.65087', '34.38913', '111.657453', '34.39483', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (410329, 410300, 3, '伊川县', '伊川', '0379', '471300', '112.42947', '34.42205', '112.435867', '34.428333', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (410381, 410300, 3, '偃师市', '偃师', '0379', '471900', '112.7922', '34.7281', '112.798616', '34.734414', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (410382, 410300, 3, '洛阳新区', '洛阳新区', '0379', '471000', '112.48219', '34.609795', '112.488762', '34.615597', NULL, '新区');
INSERT INTO `yx_dev_region` VALUES (410383, 410300, 3, '高新区', '高新区', '0379', '471000', '112.371729', '34.64226', '112.378306', '34.647949', NULL, '高新技术开发区');
INSERT INTO `yx_dev_region` VALUES (410400, 410000, 2, '平顶山市', '平顶山', '0375', '467000', '113.307718', '33.735241', '113.31422', '33.741286', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (410402, 410400, 3, '新华区', '新华', '0375', '467000', '113.29402', '33.7373', '113.30046', '33.743557', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (410403, 410400, 3, '卫东区', '卫东', '0375', '467000', '113.33511', '33.73472', '113.341721', '33.740395', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (410404, 410400, 3, '石龙区', '石龙', '0375', '467000', '112.89879', '33.89878', '112.905246', '33.904931', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (410411, 410400, 3, '湛河区', '湛河', '0375', '467000', '113.29252', '33.7362', '113.298954', '33.742474', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (410421, 410400, 3, '宝丰县', '宝丰', '0375', '467400', '113.05493', '33.86916', '113.061377', '33.875406', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (410422, 410400, 3, '叶县', '叶县', '0375', '467200', '113.35104', '33.62225', '113.357642', '33.62797', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (410423, 410400, 3, '鲁山县', '鲁山', '0375', '467300', '112.9057', '33.73879', '112.912142', '33.745043', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (410425, 410400, 3, '郏县', '郏县', '0375', '467100', '113.21588', '33.97072', '113.22249', '33.976391', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (410481, 410400, 3, '舞钢市', '舞钢', '0375', '462500', '113.52417', '33.2938', '113.530579', '33.300134', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (410482, 410400, 3, '汝州市', '汝州', '0375', '467500', '112.84301', '34.16135', '112.849557', '34.167132', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (410483, 410400, 3, '高新区', '高新区', '0375', '467000', '113.387607', '33.732271', '113.394038', '33.738545', NULL, '高新技术开发区');
INSERT INTO `yx_dev_region` VALUES (410484, 410400, 3, '新城区', '新城区', '0375', '467000', '113.211864', '33.76905', '113.218467', '33.774744', NULL, '新区');
INSERT INTO `yx_dev_region` VALUES (410500, 410000, 2, '安阳市', '安阳', '0372', '455000', '114.352482', '36.103442', '114.358867', '36.109754', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (410502, 410500, 3, '文峰区', '文峰', '0372', '455000', '114.35708', '36.09046', '114.363454', '36.096793', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (410503, 410500, 3, '北关区', '北关', '0372', '455000', '114.35735', '36.11872', '114.363741', '36.125059', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (410505, 410500, 3, '殷都区', '殷都', '0372', '455000', '114.3034', '36.1099', '114.309997', '36.115559', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (410506, 410500, 3, '龙安区', '龙安', '0372', '455000', '114.34814', '36.11904', '114.354551', '36.125319', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (410522, 410500, 3, '安阳县', '安阳', '0372', '455100', '114.36605', '36.06695', '114.37244', '36.073274', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (410523, 410500, 3, '汤阴县', '汤阴', '0372', '456150', '114.35839', '35.92152', '114.364798', '35.927867', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (410526, 410500, 3, '滑县', '滑县', '0372', '456400', '114.52066', '35.5807', '114.527216', '35.586518', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (410527, 410500, 3, '内黄县', '内黄', '0372', '456300', '114.90673', '35.95269', '114.913319', '35.958363', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (410581, 410500, 3, '林州市', '林州', '0372', '456500', '113.81558', '36.07804', '113.82217', '36.083703', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (410582, 410500, 3, '安阳新区', '安阳新区', '0372', '456500', '114.45282', '36.083928', '114.459286', '36.089973', NULL, '新区');
INSERT INTO `yx_dev_region` VALUES (410600, 410000, 2, '鹤壁市', '鹤壁', '0392', '458000', '114.295444', '35.748236', '114.302037', '35.753899', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (410602, 410600, 3, '鹤山区', '鹤山', '0392', '458000', '114.16336', '35.95458', '114.169916', '35.960355', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (410603, 410600, 3, '山城区', '山城', '0392', '458000', '114.18443', '35.89773', '114.19105', '35.903401', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (410611, 410600, 3, '淇滨区', '淇滨', '0392', '458000', '114.29867', '35.74127', '114.305261', '35.746923', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (410621, 410600, 3, '浚县', '浚县', '0392', '456250', '114.54879', '35.67085', '114.555405', '35.676548', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (410622, 410600, 3, '淇县', '淇县', '0392', '456750', '114.1976', '35.60782', '114.204146', '35.613607', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (410700, 410000, 2, '新乡市', '新乡', '0373', '453000', '113.883991', '35.302616', '113.890405', '35.308956', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (410702, 410700, 3, '红旗区', '红旗', '0373', '453000', '113.87523', '35.30367', '113.881645', '35.310007', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (410703, 410700, 3, '卫滨区', '卫滨', '0373', '453000', '113.86578', '35.30211', '113.87222', '35.308367', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (410704, 410700, 3, '凤泉区', '凤泉', '0373', '453011', '113.91507', '35.38399', '113.921584', '35.389896', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (410711, 410700, 3, '牧野区', '牧野', '0373', '453002', '113.9086', '35.3149', '113.915111', '35.320931', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (410721, 410700, 3, '新乡县', '新乡', '0373', '453700', '113.80511', '35.19075', '113.811704', '35.196513', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (410724, 410700, 3, '获嘉县', '获嘉', '0373', '453800', '113.66159', '35.26521', '113.668032', '35.271351', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (410725, 410700, 3, '原阳县', '原阳', '0373', '453500', '113.93994', '35.06565', '113.946564', '35.071314', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (410726, 410700, 3, '延津县', '延津', '0373', '453200', '114.20266', '35.14327', '114.209185', '35.149137', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (410727, 410700, 3, '封丘县', '封丘', '0373', '453300', '114.41915', '35.04166', '114.425757', '35.047318', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (410728, 410700, 3, '长垣县', '长垣', '0373', '453400', '114.66882', '35.20046', '114.675431', '35.206157', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (410781, 410700, 3, '卫辉市', '卫辉', '0373', '453100', '114.06454', '35.39843', '114.071142', '35.404097', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (410782, 410700, 3, '辉县市', '辉县', '0373', '453600', '113.8067', '35.46307', '113.813279', '35.468807', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (410800, 410000, 2, '焦作市', '焦作', '0391', '454000', '113.238266', '35.23904', '113.244811', '35.244839', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (410802, 410800, 3, '解放区', '解放', '0391', '454150', '113.22933', '35.24023', '113.235907', '35.245925', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (410803, 410800, 3, '中站区', '中站', '0391', '454150', '113.18315', '35.23665', '113.189598', '35.242765', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (410804, 410800, 3, '马村区', '马村', '0391', '454150', '113.3187', '35.26908', '113.325236', '35.274927', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (410811, 410800, 3, '山阳区', '山阳', '0391', '454150', '113.25464', '35.21436', '113.26112', '35.220443', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (410821, 410800, 3, '修武县', '修武', '0391', '454350', '113.44775', '35.22357', '113.454331', '35.229296', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (410822, 410800, 3, '博爱县', '博爱', '0391', '454450', '113.06698', '35.16943', '113.073472', '35.175486', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (410823, 410800, 3, '武陟县', '武陟', '0391', '454950', '113.39718', '35.09505', '113.403581', '35.101388', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (410825, 410800, 3, '温县', '温县', '0391', '454850', '113.08065', '34.94022', '113.087222', '34.946046', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (410882, 410800, 3, '沁阳市', '沁阳', '0391', '454550', '112.94494', '35.08935', '112.951423', '35.095442', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (410883, 410800, 3, '孟州市', '孟州', '0391', '454750', '112.79138', '34.9071', '112.797774', '34.913401', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (410900, 410000, 2, '濮阳市', '濮阳', '0393', '457000', '115.041299', '35.768234', '115.047854', '35.774085', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (410902, 410900, 3, '华龙区', '华龙', '0393', '457001', '115.07446', '35.77736', '115.080872', '35.783695', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (410922, 410900, 3, '清丰县', '清丰', '0393', '457300', '115.10415', '35.88507', '115.110623', '35.891176', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (410923, 410900, 3, '南乐县', '南乐', '0393', '457400', '115.20639', '36.07686', '115.212773', '36.083182', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (410926, 410900, 3, '范县', '范县', '0393', '457500', '115.50405', '35.85178', '115.510636', '35.857435', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (410927, 410900, 3, '台前县', '台前', '0393', '457600', '115.87158', '35.96923', '115.87815', '35.974938', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (410928, 410900, 3, '濮阳县', '濮阳', '0393', '457100', '115.03057', '35.70745', '115.037154', '35.713154', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (411000, 410000, 2, '许昌市', '许昌', '0374', '461000', '113.826063', '34.022956', '113.832657', '34.028631', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (411002, 411000, 3, '魏都区', '魏都', '0374', '461000', '113.8227', '34.02544', '113.829296', '34.0311', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (411003, 411000, 3, '建安区', '建安', '0374', '461100', '113.84707', '34.00406', '113.8536', '34.010012', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (411024, 411000, 3, '鄢陵县', '鄢陵', '0374', '461200', '114.18795', '34.10317', '114.194562', '34.108862', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (411025, 411000, 3, '襄城县', '襄城', '0374', '452670', '113.48196', '33.84928', '113.48851', '33.855144', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (411081, 411000, 3, '禹州市', '禹州', '0374', '461670', '113.48803', '34.14054', '113.49454', '34.146505', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (411082, 411000, 3, '长葛市', '长葛', '0374', '461500', '113.77328', '34.21846', '113.779717', '34.224727', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (411100, 410000, 2, '漯河市', '漯河', '0395', '462000', '114.026405', '33.575855', '114.032868', '33.581914', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (411102, 411100, 3, '源汇区', '源汇', '0395', '462000', '114.00647', '33.55627', '114.012861', '33.562588', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (411103, 411100, 3, '郾城区', '郾城', '0395', '462300', '114.00694', '33.58723', '114.013334', '33.593546', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (411104, 411100, 3, '召陵区', '召陵', '0395', '462300', '114.09399', '33.58601', '114.100456', '33.592077', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (411121, 411100, 3, '舞阳县', '舞阳', '0395', '462400', '113.59848', '33.43243', '113.605025', '33.438233', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (411122, 411100, 3, '临颍县', '临颍', '0395', '462600', '113.93661', '33.81123', '113.943191', '33.816888', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (411200, 410000, 2, '三门峡市', '三门峡', '0398', '472000', '111.194099', '34.777338', '111.200658', '34.783086', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (411202, 411200, 3, '湖滨区', '湖滨', '0398', '472000', '111.20006', '34.77872', '111.206595', '34.784549', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (411203, 411200, 3, '陕州区', '陕州', '0398', '472100', '111.10333', '34.72052', '111.109779', '34.726739', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (411221, 411200, 3, '渑池县', '渑池', '0398', '472400', '111.76184', '34.76725', '111.768382', '34.773049', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (411224, 411200, 3, '卢氏县', '卢氏', '0398', '472200', '111.04782', '34.05436', '111.054383', '34.060087', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (411281, 411200, 3, '义马市', '义马', '0398', '472300', '111.87445', '34.74721', '111.880967', '34.75313', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (411282, 411200, 3, '灵宝市', '灵宝', '0398', '472500', '110.8945', '34.51682', '110.90091', '34.523057', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (411300, 410000, 2, '南阳市', '南阳', '0377', '473000', '112.540918', '32.999082', '112.547364', '33.005264', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (411302, 411300, 3, '宛城区', '宛城', '0377', '473000', '112.53955', '33.00378', '112.546006', '33.009943', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (411303, 411300, 3, '卧龙区', '卧龙', '0377', '473000', '112.53479', '32.98615', '112.541253', '32.99223', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (411321, 411300, 3, '南召县', '南召', '0377', '474650', '112.43194', '33.49098', '112.438359', '33.497291', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (411322, 411300, 3, '方城县', '方城', '0377', '473200', '113.01269', '33.25453', '113.019189', '33.260581', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (411323, 411300, 3, '西峡县', '西峡', '0377', '474550', '111.48187', '33.29772', '111.488273', '33.304054', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (411324, 411300, 3, '镇平县', '镇平', '0377', '474250', '112.2398', '33.03629', '112.246367', '33.04213', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (411325, 411300, 3, '内乡县', '内乡', '0377', '474350', '111.84957', '33.04671', '111.855995', '33.053008', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (411326, 411300, 3, '淅川县', '淅川', '0377', '474450', '111.48663', '33.13708', '111.493051', '33.143399', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (411327, 411300, 3, '社旗县', '社旗', '0377', '473300', '112.94656', '33.05503', '112.953047', '33.061092', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (411328, 411300, 3, '唐河县', '唐河', '0377', '473400', '112.83609', '32.69453', '112.842626', '32.700425', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (411329, 411300, 3, '新野县', '新野', '0377', '473500', '112.36151', '32.51698', '112.368062', '32.522788', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (411330, 411300, 3, '桐柏县', '桐柏', '0377', '474750', '113.42886', '32.37917', '113.435337', '32.385185', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (411381, 411300, 3, '邓州市', '邓州', '0377', '474150', '112.0896', '32.68577', '112.096027', '32.692068', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (411400, 410000, 2, '商丘市', '商丘', '0370', '476000', '115.650497', '34.437054', '115.656991', '34.443062', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (411402, 411400, 3, '梁园区', '梁园', '0370', '476000', '115.64487', '34.44341', '115.651401', '34.449319', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (411403, 411400, 3, '睢阳区', '睢阳', '0370', '476000', '115.65338', '34.38804', '115.659854', '34.394099', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (411421, 411400, 3, '民权县', '民权', '0370', '476800', '115.14621', '34.64931', '115.152789', '34.654977', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (411422, 411400, 3, '睢县', '睢县', '0370', '476900', '115.07168', '34.44539', '115.078092', '34.451705', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (411423, 411400, 3, '宁陵县', '宁陵', '0370', '476700', '115.30511', '34.45463', '115.31155', '34.46088', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (411424, 411400, 3, '柘城县', '柘城', '0370', '476200', '115.30538', '34.0911', '115.311817', '34.097353', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (411425, 411400, 3, '虞城县', '虞城', '0370', '476300', '115.86337', '34.40189', '115.869954', '34.407543', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (411426, 411400, 3, '夏邑县', '夏邑', '0370', '476400', '116.13348', '34.23242', '116.13998', '34.238489', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (411481, 411400, 3, '永城市', '永城', '0370', '476600', '116.44943', '33.92911', '116.455997', '33.934807', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (411500, 410000, 2, '信阳市', '信阳', '0376', '464000', '114.075031', '32.123274', '114.081581', '32.129027', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (411502, 411500, 3, '浉河区', '浉河', '0376', '464000', '114.05871', '32.1168', '114.065291', '32.122454', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (411503, 411500, 3, '平桥区', '平桥', '0376', '464000', '114.12435', '32.10095', '114.130755', '32.107283', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (411521, 411500, 3, '罗山县', '罗山', '0376', '464200', '114.5314', '32.20277', '114.538002', '32.208465', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (411522, 411500, 3, '光山县', '光山', '0376', '465450', '114.91873', '32.00992', '114.925264', '32.015723', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (411523, 411500, 3, '新县', '新县', '0376', '465550', '114.87924', '31.64386', '114.885766', '31.649695', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (411524, 411500, 3, '商城县', '商城', '0376', '465350', '115.40856', '31.79986', '115.415067', '31.805834', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (411525, 411500, 3, '固始县', '固始', '0376', '465200', '115.68298', '32.18011', '115.689401', '32.186457', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (411526, 411500, 3, '潢川县', '潢川', '0376', '465150', '115.04696', '32.13763', '115.053458', '32.14357', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (411527, 411500, 3, '淮滨县', '淮滨', '0376', '464400', '115.4205', '32.46614', '115.426943', '32.472319', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (411528, 411500, 3, '息县', '息县', '0376', '464300', '114.7402', '32.34279', '114.74665', '32.348958', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (411600, 410000, 2, '周口市', '周口', '0394', '466000', '114.649653', '33.620357', '114.656256', '33.626067', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (411602, 411600, 3, '川汇区', '川汇', '0394', '466000', '114.64202', '33.6256', '114.648598', '33.631403', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (411621, 411600, 3, '扶沟县', '扶沟', '0394', '461300', '114.39477', '34.05999', '114.401279', '34.0659', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (411622, 411600, 3, '西华县', '西华', '0394', '466600', '114.52279', '33.78548', '114.529347', '33.791265', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (411623, 411600, 3, '商水县', '商水', '0394', '466100', '114.60604', '33.53912', '114.612445', '33.545447', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (411624, 411600, 3, '沈丘县', '沈丘', '0394', '466300', '115.09851', '33.40936', '115.104963', '33.415558', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (411625, 411600, 3, '郸城县', '郸城', '0394', '477150', '115.17715', '33.64485', '115.183627', '33.65098', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (411626, 411600, 3, '淮阳县', '淮阳', '0394', '466700', '114.88848', '33.73211', '114.895075', '33.737829', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (411627, 411600, 3, '太康县', '太康', '0394', '475400', '114.83773', '34.06376', '114.844114', '34.070098', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (411628, 411600, 3, '鹿邑县', '鹿邑', '0394', '477200', '115.48553', '33.85931', '115.49212', '33.865063', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (411681, 411600, 3, '项城市', '项城', '0394', '466200', '114.87558', '33.4672', '114.882097', '33.473097', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (411682, 411600, 3, '东新区', '东新区', '0394', '466000', '114.707844', '33.65107', '114.714271', '33.657349', NULL, '新区');
INSERT INTO `yx_dev_region` VALUES (411683, 411600, 3, '经济开发区', '经济开发区', '0394', '466000', '114.677582', '33.58664', '114.684131', '33.592428', NULL, '经济技术开发区');
INSERT INTO `yx_dev_region` VALUES (411700, 410000, 2, '驻马店市', '驻马店', '0396', '463000', '114.024736', '32.980169', '114.031193', '32.986257', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (411702, 411700, 3, '驿城区', '驿城', '0396', '463000', '113.99377', '32.97316', '114.000157', '32.979478', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (411721, 411700, 3, '西平县', '西平', '0396', '463900', '114.02322', '33.3845', '114.029704', '33.390624', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (411722, 411700, 3, '上蔡县', '上蔡', '0396', '463800', '114.26825', '33.26825', '114.27476', '33.274287', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (411723, 411700, 3, '平舆县', '平舆', '0396', '463400', '114.63552', '32.95727', '114.642033', '32.963168', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (411724, 411700, 3, '正阳县', '正阳', '0396', '463600', '114.38952', '32.6039', '114.395999', '32.609903', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (411725, 411700, 3, '确山县', '确山', '0396', '463200', '114.02917', '32.80281', '114.035681', '32.808829', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (411726, 411700, 3, '泌阳县', '泌阳', '0396', '463700', '113.32681', '32.71781', '113.33337', '32.723543', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (411727, 411700, 3, '汝南县', '汝南', '0396', '463300', '114.36138', '33.00461', '114.367786', '33.010954', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (411728, 411700, 3, '遂平县', '遂平', '0396', '463100', '114.01297', '33.14571', '114.019411', '33.151982', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (411729, 411700, 3, '新蔡县', '新蔡', '0396', '463500', '114.98199', '32.7502', '114.988441', '32.756338', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (411771, 411700, 3, '经济开发区', '经济开发区', '0396', '463000', '114.014862', '33.001686', '114.021293', '33.00793', NULL, '经济技术开发区');
INSERT INTO `yx_dev_region` VALUES (419001, 410000, 2, '济源市', '济源', '0391', '454650', '112.590047', '35.090378', '112.596556', '35.09638', '行政区', '直辖县级市');
INSERT INTO `yx_dev_region` VALUES (419011, 419001, 3, '沁园街道', '沁园街道', '0391', '459000', '112.57206', '35.08187', '112.578491', '35.088147', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (419012, 419001, 3, '济水街道', '济水街道', '0391', '459001', '112.588928', '35.091632', '112.59543', '35.097653', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (419013, 419001, 3, '北海街道', '北海街道', '0391', '459003', '112.593234', '35.097409', '112.599754', '35.103353', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (419014, 419001, 3, '天坛街道', '天坛街道', '0391', '459004', '112.565589', '35.094593', '112.571994', '35.100918', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (419015, 419001, 3, '玉泉街道', '玉泉街道', '0391', '459002', '112.615469', '35.092599', '112.622079', '35.098273', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (419016, 419001, 3, '克井镇', '克井镇', '0391', '459010', '112.543031', '35.1603', '112.549465', '35.166513', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (419017, 419001, 3, '五龙口镇', '五龙口镇', '0391', '459011', '112.68937', '35.135041', '112.695759', '35.141333', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (419018, 419001, 3, '梨林镇', '梨林镇', '0391', '459018', '112.713501', '35.07768', '112.720038', '35.083624', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (419019, 419001, 3, '轵城镇', '轵城镇', '0391', '459005', '112.60099', '35.046131', '112.607553', '35.051949', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (419020, 419001, 3, '承留镇', '承留镇', '0391', '459007', '112.499271', '35.077716', '112.505894', '35.083384', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (419021, 419001, 3, '坡头镇', '坡头镇', '0391', '459016', '112.524757', '34.928431', '112.531294', '34.934342', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (419022, 419001, 3, '大峪镇', '大峪镇', '0391', '459017', '112.396154', '34.937623', '112.402739', '34.943404', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (419023, 419001, 3, '邵原镇', '邵原镇', '0391', '459014', '112.133535', '35.160964', '112.140135', '35.166647', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (419024, 419001, 3, '思礼镇', '思礼镇', '0391', '459006', '112.507286', '35.101133', '112.513883', '35.106819', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (419025, 419001, 3, '王屋镇', '王屋镇', '0391', '459013', '112.272475', '35.113912', '112.279046', '35.119641', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (419026, 419001, 3, '下冶镇', '下冶镇', '0391', '459015', '112.20023', '35.032836', '112.206618', '35.03917', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (420000, 100000, 1, '湖北省', '湖北', NULL, NULL, '114.298572', '30.584355', '114.305149', '30.590009', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (420100, 420000, 2, '武汉市', '武汉', '027', '430000', '114.298572', '30.584355', '114.305149', '30.590009', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (420102, 420100, 3, '江岸区', '江岸', '027', '430014', '114.30943', '30.59982', '114.316011', '30.605518', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (420103, 420100, 3, '江汉区', '江汉', '027', '430000', '114.27093', '30.60146', '114.277436', '30.607444', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (420104, 420100, 3, '硚口区', '硚口', '027', '430000', '114.26422', '30.56945', '114.270673', '30.575547', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (420105, 420100, 3, '汉阳区', '汉阳', '027', '430050', '114.27478', '30.54915', '114.281294', '30.555063', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (420106, 420100, 3, '武昌区', '武昌', '027', '430000', '114.31589', '30.55389', '114.322439', '30.559656', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (420107, 420100, 3, '青山区', '青山', '027', '430080', '114.39117', '30.63427', '114.397694', '30.640254', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (420111, 420100, 3, '洪山区', '洪山', '027', '430070', '114.34375', '30.49989', '114.350206', '30.506121', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (420112, 420100, 3, '东西湖区', '东西湖', '027', '430040', '114.13708', '30.61989', '114.143539', '30.626109', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (420113, 420100, 3, '汉南区', '汉南', '027', '430090', '114.08462', '30.30879', '114.091137', '30.314693', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (420114, 420100, 3, '蔡甸区', '蔡甸', '027', '430100', '114.02929', '30.58197', '114.035771', '30.587979', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (420115, 420100, 3, '江夏区', '江夏', '027', '430200', '114.31301', '30.34653', '114.319568', '30.35226', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (420116, 420100, 3, '黄陂区', '黄陂', '027', '432200', '114.37512', '30.88151', '114.381571', '30.887755', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (420117, 420100, 3, '新洲区', '新洲', '027', '431400', '114.80136', '30.84145', '114.807902', '30.8473', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (420118, 420100, 3, '经济技术开发区', '经济技术开发区', '027', '430056', '114.159156', '30.488929', '114.165707', '30.494773', NULL, '经济技术开发区');
INSERT INTO `yx_dev_region` VALUES (420200, 420000, 2, '黄石市', '黄石', '0714', '435000', '115.077048', '30.220074', '115.083442', '30.226411', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (420202, 420200, 3, '黄石港区', '黄石港', '0714', '435000', '115.06604', '30.22279', '115.072457', '30.229043', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (420203, 420200, 3, '西塞山区', '西塞山', '0714', '435001', '115.11016', '30.20487', '115.116642', '30.210862', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (420204, 420200, 3, '下陆区', '下陆', '0714', '435000', '114.96112', '30.17368', '114.967536', '30.180026', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (420205, 420200, 3, '铁山区', '铁山', '0714', '435000', '114.90109', '30.20678', '114.907661', '30.212431', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (420222, 420200, 3, '阳新县', '阳新', '0714', '435200', '115.21527', '29.83038', '115.221698', '29.836618', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (420281, 420200, 3, '大冶市', '大冶', '0714', '435100', '114.97174', '30.09438', '114.978147', '30.100657', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (420282, 420200, 3, '经济开发区', '经济开发区', '0714', '435003', '115.029566', '30.135938', '115.03616', '30.141639', NULL, '经济技术开发区');
INSERT INTO `yx_dev_region` VALUES (420300, 420000, 2, '十堰市', '十堰', '0719', '442000', '110.785239', '32.647017', '110.791722', '32.653101', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (420302, 420300, 3, '茅箭区', '茅箭', '0719', '442000', '110.81341', '32.59153', '110.819991', '32.597214', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (420303, 420300, 3, '张湾区', '张湾', '0719', '442000', '110.77067', '32.65195', '110.777098', '32.658235', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (420304, 420300, 3, '郧阳区', '郧阳', '0719', '442500', '110.81854', '32.83593', '110.825124', '32.841594', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (420322, 420300, 3, '郧西县', '郧西', '0719', '442600', '110.42556', '32.99349', '110.432031', '32.999564', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (420323, 420300, 3, '竹山县', '竹山', '0719', '442200', '110.23071', '32.22536', '110.237287', '32.231078', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (420324, 420300, 3, '竹溪县', '竹溪', '0719', '442300', '109.71798', '32.31901', '109.724536', '32.324881', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (420325, 420300, 3, '房县', '房县', '0719', '442100', '110.74386', '32.05794', '110.750312', '32.064165', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (420381, 420300, 3, '丹江口市', '丹江口', '0719', '442700', '111.51525', '32.54085', '111.521794', '32.546764', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (420500, 420000, 2, '宜昌市', '宜昌', '0717', '443000', '111.290843', '30.702636', '111.29741', '30.708336', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (420502, 420500, 3, '西陵区', '西陵', '0717', '443000', '111.28573', '30.71077', '111.292289', '30.716523', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (420503, 420500, 3, '伍家岗区', '伍家岗', '0717', '443000', '111.3609', '30.64434', '111.367322', '30.650678', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (420504, 420500, 3, '点军区', '点军', '0717', '443000', '111.26828', '30.6934', '111.274753', '30.699425', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (420505, 420500, 3, '猇亭区', '猇亭', '0717', '443000', '111.44079', '30.52663', '111.447345', '30.532478', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (420506, 420500, 3, '夷陵区', '夷陵', '0717', '443100', '111.3262', '30.76881', '111.332729', '30.774747', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (420525, 420500, 3, '远安县', '远安', '0717', '444200', '111.6416', '31.05989', '111.648136', '31.065694', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (420526, 420500, 3, '兴山县', '兴山', '0717', '443700', '110.74951', '31.34686', '110.755949', '31.353149', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (420527, 420500, 3, '秭归县', '秭归', '0717', '443600', '110.98156', '30.82702', '110.987995', '30.833206', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (420528, 420500, 3, '长阳土家族自治县', '长阳', '0717', '443500', '111.20105', '30.47052', '111.207582', '30.476367', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (420529, 420500, 3, '五峰土家族自治县', '五峰', '0717', '443400', '110.6748', '30.19856', '110.681307', '30.204473', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (420581, 420500, 3, '宜都市', '宜都', '0717', '443000', '111.45025', '30.37807', '111.456764', '30.384079', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (420582, 420500, 3, '当阳市', '当阳', '0717', '444100', '111.78912', '30.8208', '111.795686', '30.826498', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (420583, 420500, 3, '枝江市', '枝江', '0717', '443200', '111.76855', '30.42612', '111.775119', '30.431842', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (420584, 420500, 3, '宜昌新区', '宜昌新区', '0717', '443000', '111.406174', '30.711733', '111.412735', '30.71748', NULL, '新区');
INSERT INTO `yx_dev_region` VALUES (420600, 420000, 2, '襄阳市', '襄阳', '0710', '441000', '112.144146', '32.042426', '112.150742', '32.048098', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (420602, 420600, 3, '襄城区', '襄城', '0710', '441000', '112.13372', '32.01017', '112.140292', '32.015846', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (420606, 420600, 3, '樊城区', '樊城', '0710', '441000', '112.13546', '32.04482', '112.142058', '32.050494', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (420607, 420600, 3, '襄州区', '襄州', '0710', '441100', '112.150327', '32.015088', '112.156891', '32.020794', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (420624, 420600, 3, '南漳县', '南漳', '0710', '441500', '111.84603', '31.77653', '111.852421', '31.782844', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (420625, 420600, 3, '谷城县', '谷城', '0710', '441700', '111.65267', '32.26377', '111.659245', '32.269455', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (420626, 420600, 3, '保康县', '保康', '0710', '441600', '111.26138', '31.87874', '111.267822', '31.884881', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (420682, 420600, 3, '老河口市', '老河口', '0710', '441800', '111.67117', '32.38476', '111.677737', '32.390477', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (420683, 420600, 3, '枣阳市', '枣阳', '0710', '441200', '112.77444', '32.13142', '112.780899', '32.137492', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (420684, 420600, 3, '宜城市', '宜城', '0710', '441400', '112.25772', '31.71972', '112.264331', '31.72539', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (420685, 420600, 3, '高新区', '高新区', '0710', '441000', '112.121736', '32.080276', '112.128308', '32.086087', NULL, '高新技术开发区');
INSERT INTO `yx_dev_region` VALUES (420686, 420600, 3, '经济开发区', '经济开发区', '0710', '441000', '112.260933', '32.132094', '112.26751', '32.137752', NULL, '经济技术开发区');
INSERT INTO `yx_dev_region` VALUES (420700, 420000, 2, '鄂州市', '鄂州', '0711', '436000', '114.890593', '30.396536', '114.897192', '30.402237', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (420702, 420700, 3, '梁子湖区', '梁子湖', '0711', '436000', '114.68463', '30.10003', '114.691138', '30.10593', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (420703, 420700, 3, '华容区', '华容', '0711', '436000', '114.73568', '30.53328', '114.742124', '30.539516', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (420704, 420700, 3, '鄂城区', '鄂城', '0711', '436000', '114.89158', '30.40024', '114.898179', '30.405933', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (420800, 420000, 2, '荆门市', '荆门', '0724', '448000', '112.204251', '31.03542', '112.210646', '31.041744', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (420802, 420800, 3, '东宝区', '东宝', '0724', '448000', '112.20147', '31.05192', '112.207858', '31.05825', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (420804, 420800, 3, '掇刀区', '掇刀', '0724', '448000', '112.208', '30.97316', '112.214427', '30.979471', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (420822, 420800, 3, '沙洋县', '沙洋', '0724', '448200', '112.58853', '30.70916', '112.595013', '30.715183', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (420881, 420800, 3, '钟祥市', '钟祥', '0724', '431900', '112.58932', '31.1678', '112.595798', '31.173807', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (420882, 420800, 3, '京山市', '京山', '0724', '431800', '113.11074', '31.0224', '113.117316', '31.028112', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (420900, 420000, 2, '孝感市', '孝感', '0712', '432000', '113.926655', '30.926423', '113.933207', '30.932156', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (420902, 420900, 3, '孝南区', '孝南', '0712', '432100', '113.91111', '30.9168', '113.917601', '30.922776', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (420921, 420900, 3, '孝昌县', '孝昌', '0712', '432900', '113.99795', '31.25799', '114.004359', '31.264331', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (420922, 420900, 3, '大悟县', '大悟', '0712', '432800', '114.12564', '31.56176', '114.132051', '31.568088', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (420923, 420900, 3, '云梦县', '云梦', '0712', '432500', '113.75289', '31.02093', '113.759302', '31.027248', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (420981, 420900, 3, '应城市', '应城', '0712', '432400', '113.57287', '30.92834', '113.579437', '30.934018', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (420982, 420900, 3, '安陆市', '安陆', '0712', '432600', '113.68557', '31.25693', '113.692141', '31.262683', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (420984, 420900, 3, '汉川市', '汉川', '0712', '432300', '113.83898', '30.66117', '113.845529', '30.666983', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (421000, 420000, 2, '荆州市', '荆州', '0716', '434000', '112.23813', '30.326857', '112.244649', '30.332713', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (421002, 421000, 3, '沙市区', '沙市', '0716', '434000', '112.25543', '30.31107', '112.262008', '30.31674', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (421003, 421000, 3, '荆州区', '荆州', '0716', '434020', '112.19006', '30.35264', '112.196474', '30.35893', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (421022, 421000, 3, '公安县', '公安', '0716', '434300', '112.23242', '30.05902', '112.238932', '30.064978', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (421023, 421000, 3, '监利县', '监利', '0716', '433300', '112.89462', '29.81494', '112.901104', '29.821022', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (421024, 421000, 3, '江陵县', '江陵', '0716', '434100', '112.42468', '30.04174', '112.431133', '30.047979', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (421081, 421000, 3, '石首市', '石首', '0716', '434400', '112.42636', '29.72127', '112.432775', '29.72752', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (421083, 421000, 3, '洪湖市', '洪湖', '0716', '433200', '113.47598', '29.827', '113.482533', '29.83277', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (421087, 421000, 3, '松滋市', '松滋', '0716', '434200', '111.76739', '30.16965', '111.773971', '30.175388', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (421100, 420000, 2, '黄冈市', '黄冈', '0713', '438000', '114.879365', '30.447711', '114.885889', '30.453544', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (421102, 421100, 3, '黄州区', '黄州', '0713', '438000', '114.88008', '30.43436', '114.886613', '30.440183', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (421121, 421100, 3, '团风县', '团风', '0713', '438000', '114.87228', '30.64359', '114.878806', '30.649553', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (421122, 421100, 3, '红安县', '红安', '0713', '438400', '114.6224', '31.28668', '114.628845', '31.292808', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (421123, 421100, 3, '罗田县', '罗田', '0713', '438600', '115.39971', '30.78255', '115.406255', '30.788372', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (421124, 421100, 3, '英山县', '英山', '0713', '438700', '115.68142', '30.73516', '115.687842', '30.74151', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (421125, 421100, 3, '浠水县', '浠水', '0713', '438200', '115.26913', '30.45265', '115.275692', '30.458338', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (421126, 421100, 3, '蕲春县', '蕲春', '0713', '435300', '115.43615', '30.22613', '115.442548', '30.232466', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (421127, 421100, 3, '黄梅县', '黄梅', '0713', '435500', '115.94427', '30.07033', '115.950733', '30.07643', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (421181, 421100, 3, '麻城市', '麻城', '0713', '438300', '115.00988', '31.17228', '115.016442', '31.177977', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (421182, 421100, 3, '武穴市', '武穴', '0713', '435400', '115.55975', '29.84446', '115.566142', '29.850802', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (421183, 421100, 3, '城东新区', '城东新区', '0713', '438000', '114.927276', '30.475739', '114.933785', '30.481689', NULL, '新区');
INSERT INTO `yx_dev_region` VALUES (421200, 420000, 2, '咸宁市', '咸宁', '0715', '437000', '114.328963', '29.832798', '114.335456', '29.838776', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (421202, 421200, 3, '咸安区', '咸安', '0715', '437000', '114.29872', '29.8529', '114.30529', '29.858553', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (421221, 421200, 3, '嘉鱼县', '嘉鱼', '0715', '437200', '113.93927', '29.97054', '113.945841', '29.976193', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (421222, 421200, 3, '通城县', '通城', '0715', '437400', '113.81582', '29.24568', '113.822387', '29.251342', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (421223, 421200, 3, '崇阳县', '崇阳', '0715', '437500', '114.03982', '29.55564', '114.046382', '29.561477', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (421224, 421200, 3, '通山县', '通山', '0715', '437600', '114.48239', '29.6063', '114.488783', '29.612636', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (421281, 421200, 3, '赤壁市', '赤壁', '0715', '437300', '113.90039', '29.72454', '113.906828', '29.7307', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (421300, 420000, 2, '随州市', '随州', '0722', '441300', '113.37377', '31.717497', '113.380269', '31.723569', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (421303, 421300, 3, '曾都区', '曾都', '0722', '441300', '113.37128', '31.71614', '113.377792', '31.722168', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (421321, 421300, 3, '随县', '随县', '0722', '441309', '113.82663', '31.6179', '113.833221', '31.623579', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (421381, 421300, 3, '广水市', '广水', '0722', '432700', '113.82663', '31.6179', '113.833221', '31.623579', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (422800, 420000, 2, '恩施土家族苗族自治州', '恩施', '0718', '445000', '109.48699', '30.283114', '109.493575', '30.288863', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (422801, 422800, 3, '恩施市', '恩施', '0718', '445000', '109.47942', '30.29502', '109.485968', '30.300866', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (422802, 422800, 3, '利川市', '利川', '0718', '445400', '108.93591', '30.29117', '108.942391', '30.297272', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (422822, 422800, 3, '建始县', '建始', '0718', '445300', '109.72207', '30.60209', '109.728626', '30.607896', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (422823, 422800, 3, '巴东县', '巴东', '0718', '444300', '110.34066', '31.04233', '110.347235', '31.047994', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (422825, 422800, 3, '宣恩县', '宣恩', '0718', '445500', '109.49179', '29.98714', '109.49836', '29.992838', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (422826, 422800, 3, '咸丰县', '咸丰', '0718', '445600', '109.152', '29.67983', '109.158589', '29.68557', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (422827, 422800, 3, '来凤县', '来凤', '0718', '445700', '109.40716', '29.49373', '109.413654', '29.499676', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (422828, 422800, 3, '鹤峰县', '鹤峰', '0718', '445800', '110.03091', '29.89072', '110.037341', '29.897016', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (429004, 420000, 2, '仙桃市', '仙桃', '0728', '433000', '113.453974', '30.364953', '113.460566', '30.370631', '行政区', '直辖县级市');
INSERT INTO `yx_dev_region` VALUES (429005, 420000, 2, '潜江市', '潜江', '0728', '433100', '112.896866', '30.421215', '112.903333', '30.427334', '行政区', '直辖县级市');
INSERT INTO `yx_dev_region` VALUES (429006, 420000, 2, '天门市', '天门', '0728', '431700', '113.165862', '30.653061', '113.172281', '30.659386', '行政区', '直辖县级市');
INSERT INTO `yx_dev_region` VALUES (429021, 420000, 2, '神农架林区', '神农架', '0719', '442400', '110.671525', '31.744449', '110.678028', '31.750421', '行政区', '林区');
INSERT INTO `yx_dev_region` VALUES (429022, 429021, 3, '松柏镇', '松柏镇', '0719', '442499', '110.661631', '31.746937', '110.668084', '31.753076', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (429023, 429021, 3, '阳日镇', '阳日镇', '0719', '442411', '110.81953', '31.737393', '110.826128', '31.743061', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (429024, 429021, 3, '木鱼镇', '木鱼镇', '0719', '442421', '110.482912', '31.401419', '110.489429', '31.407294', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (429025, 429021, 3, '红坪镇', '红坪镇', '0719', '442416', '110.429295', '31.672835', '110.435784', '31.678845', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (429026, 429021, 3, '新华镇', '新华镇', '0719', '442412', '110.891543', '31.592996', '110.897984', '31.599275', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (429027, 429021, 3, '大九湖', '大九湖', '0719', '442417', '110.054278', '31.472687', '110.060728', '31.478935', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (429028, 429021, 3, '宋洛', '宋洛', '0719', '442414', '110.607962', '31.660861', '110.614456', '31.666821', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (429029, 429021, 3, '下谷坪乡', '下谷坪乡', '0719', '442417', '110.244807', '31.366248', '110.251345', '31.372163', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (429401, 429004, 3, '沙嘴街道', '沙嘴街道', '0728', '433099', '113.450661', '30.357622', '113.457239', '30.363321', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (429402, 429004, 3, '干河街道', '干河街道', '0728', '433000', '113.434771', '30.377964', '113.441309', '30.383884', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (429403, 429004, 3, '龙华山街道', '龙华山街道', '0728', '433099', '113.461332', '30.36951', '113.467932', '30.375173', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (429404, 429004, 3, '郑场镇', '郑场镇', '0728', '433009', '113.033681', '30.487221', '113.040102', '30.493544', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (429405, 429004, 3, '毛嘴镇', '毛嘴镇', '0728', '433008', '113.03534', '30.417311', '113.041754', '30.423641', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (429406, 429004, 3, '豆河镇', '豆河镇', '0728', '433006', '113.086727', '30.342125', '113.093281', '30.34786', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (429407, 429004, 3, '三伏潭镇', '三伏潭镇', '0728', '433005', '113.201557', '30.375224', '113.208123', '30.381035', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (429408, 429004, 3, '胡场镇', '胡场镇', '0728', '433004', '113.308093', '30.377514', '113.314599', '30.383552', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (429409, 429004, 3, '长埫口镇', '长埫口镇', '0728', '433000', '113.56446', '30.400802', '113.571039', '30.406572', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (429410, 429004, 3, '西流河镇', '西流河镇', '0728', '433023', '113.677657', '30.314503', '113.684179', '30.320366', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (429411, 429004, 3, '沙湖镇', '沙湖镇', '0728', '433019', '113.675143', '30.169342', '113.681677', '30.175254', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (429412, 429004, 3, '杨林尾镇', '杨林尾镇', '0728', '433021', '113.509285', '30.137065', '113.515724', '30.143357', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (429413, 429004, 3, '彭场镇', '彭场镇', '0728', '433018', '113.506437', '30.263346', '113.512886', '30.269609', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (429414, 429004, 3, '张沟镇', '张沟镇', '0728', '433012', '113.380563', '30.250125', '113.387025', '30.256306', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (429415, 429004, 3, '郭河镇', '郭河镇', '0728', '433013', '113.293617', '30.240358', '113.300049', '30.246615', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (429416, 429004, 3, '沔城镇', '沔城镇', '0728', '433014', '113.230883', '30.19298', '113.237447', '30.198691', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (429417, 429004, 3, '通海口镇', '通海口镇', '0728', '433015', '113.153304', '30.198232', '113.159703', '30.204547', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (429418, 429004, 3, '陈场镇', '陈场镇', '0728', '433016', '113.087722', '30.235173', '113.09429', '30.2409', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (429419, 429004, 3, '高新区', '高新区', '0728', '433000', '113.461174', '30.368949', '113.467774', '30.374612', NULL, '高新技术开发区');
INSERT INTO `yx_dev_region` VALUES (429420, 429004, 3, '经济开发区', '经济开发区', '0728', '433000', '113.482741', '30.364754', '113.48928', '30.370629', NULL, '经济技术开发区');
INSERT INTO `yx_dev_region` VALUES (429421, 429004, 3, '工业园区', '工业园区', '0728', '433001', '113.413655', '30.337322', '113.420068', '30.343574', NULL, '工业园区');
INSERT INTO `yx_dev_region` VALUES (429422, 429004, 3, '九合垸原种场', '九合垸原种场', '0728', '433032', '113.01493', '30.253517', '113.021419', '30.259607', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (429423, 429004, 3, '沙湖原种场', '沙湖原种场', '0728', '433019', '113.662273', '30.158672', '113.668755', '30.164811', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (429424, 429004, 3, '排湖渔场', '排湖渔场', '0728', '433025', '113.239273', '30.293313', '113.245828', '30.299134', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (429425, 429004, 3, '五湖渔场', '五湖渔场', '0728', '433019', '113.790478', '30.200202', '113.796963', '30.206189', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (429426, 429004, 3, '赵西垸林场', '赵西垸林场', '0728', '433000', '113.017429', '30.294689', '113.0239', '30.300819', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (429427, 429004, 3, '刘家垸林场', '刘家垸林场', '0728', '433029', '113.568221', '30.212263', '113.574776', '30.21798', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (429428, 429004, 3, '畜禽良种场', '畜禽良种场', '0728', '433019', '113.768018', '30.180304', '113.774435', '30.186616', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (429501, 429005, 3, '园林', '园林', '0728', '433199', '112.766411', '30.402724', '112.772943', '30.408665', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (429502, 429005, 3, '广华', '广华', '0728', '433124', '112.70196', '30.43727', '112.708408', '30.443404', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (429503, 429005, 3, '杨市', '杨市', '0728', '433133', '112.909641', '30.368142', '112.916071', '30.374434', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (429504, 429005, 3, '周矶', '周矶', '0728', '433114', '112.802664', '30.412837', '112.809081', '30.419174', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (429505, 429005, 3, '泽口', '泽口', '0728', '433132', '112.877209', '30.476885', '112.883763', '30.482674', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (429506, 429005, 3, '泰丰', '泰丰', '0728', '433199', '112.90701', '30.406384', '112.913452', '30.412651', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (429507, 429005, 3, '高场', '高场', '0728', '433115', '112.732892', '30.404486', '112.739491', '30.410175', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (429508, 429005, 3, '熊口镇', '熊口镇', '0728', '433136', '112.781307', '30.306017', '112.78775', '30.312204', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (429509, 429005, 3, '竹根滩镇', '竹根滩镇', '0728', '433131', '112.906645', '30.493506', '112.913088', '30.499769', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (429510, 429005, 3, '高石碑镇', '高石碑镇', '0728', '433126', '112.673268', '30.547511', '112.679675', '30.553826', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (429511, 429005, 3, '老新镇', '老新镇', '0728', '433111', '112.85718', '30.188775', '112.863761', '30.194438', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (429512, 429005, 3, '王场镇', '王场镇', '0728', '433122', '112.774326', '30.504891', '112.780824', '30.510972', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (429513, 429005, 3, '渔洋镇', '渔洋镇', '0728', '433138', '112.908916', '30.172422', '112.915348', '30.178707', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (429514, 429005, 3, '龙湾镇', '龙湾镇', '0728', '433139', '112.716927', '30.229398', '112.723449', '30.235275', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (429515, 429005, 3, '浩口镇', '浩口镇', '0728', '433116', '112.649998', '30.378737', '112.656514', '30.384741', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (429516, 429005, 3, '积玉口镇', '积玉口镇', '0728', '433128', '112.602848', '30.445452', '112.609386', '30.451236', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (429517, 429005, 3, '张金镇', '张金镇', '0728', '433140', '112.596542', '30.191927', '112.603061', '30.197811', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (429518, 429005, 3, '白鹭湖管理区', '白鹭湖管理区', '0728', '433100', '112.76611', '30.107631', '112.772617', '30.113559', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (429519, 429005, 3, '总口管理区', '总口管理区', '0728', '433100', '112.920845', '30.288729', '112.927265', '30.29507', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (429520, 429005, 3, '熊口农场管理区', '熊口农场管理区', '0728', '433100', '112.775832', '30.29538', '112.782309', '30.301483', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (429521, 429005, 3, '运粮湖管理区', '运粮湖管理区', '0728', '433100', '112.5278', '30.28441', '112.534325', '30.290375', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (429522, 429005, 3, '后湖管理区', '后湖管理区', '0728', '433100', '112.725628', '30.397626', '112.732212', '30.403384', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (429523, 429005, 3, '周矶管理区', '周矶管理区', '0728', '433100', '112.789016', '30.457597', '112.795422', '30.463876', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (429524, 429005, 3, '经济开发区', '经济开发区', '0728', '433100', '112.873731', '30.465897', '112.880287', '30.471639', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (429601, 429006, 3, '竟陵街道', '竟陵街道', '0728', '431700', '113.16709', '30.64568', '113.173517', '30.652', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (429602, 429006, 3, '杨林街道', '杨林街道', '0728', '431732', '113.194881', '30.639918', '113.201421', '30.645837', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (429603, 429006, 3, '佛子山镇', '佛子山镇', '0728', '431707', '113.011283', '30.752449', '113.017796', '30.758477', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (429604, 429006, 3, '多宝镇', '多宝镇', '0728', '431722', '112.697685', '30.668136', '112.704122', '30.674337', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (429605, 429006, 3, '拖市镇', '拖市镇', '0728', '43171', '112.839027', '30.727011', '112.845576', '30.732859', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (429606, 429006, 3, '张港镇', '张港镇', '0728', '431726', '112.881476', '30.567657', '112.887996', '30.573506', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (429607, 429006, 3, '蒋场镇', '蒋场镇', '0728', '431716', '112.945059', '30.605891', '112.951541', '30.611979', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (429608, 429006, 3, '汪场镇', '汪场镇', '0728', '431717', '113.041017', '30.613778', '113.047438', '30.62012', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (429609, 429006, 3, '渔薪镇', '渔薪镇', '0728', '431709', '112.990563', '30.675337', '112.997127', '30.681045', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (429610, 429006, 3, '黄潭镇', '黄潭镇', '0728', '431708', '113.090808', '30.659423', '113.09739', '30.665122', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (429611, 429006, 3, '岳口镇', '岳口镇', '0728', '431702', '113.093583', '30.507149', '113.100188', '30.512834', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (429612, 429006, 3, '横林镇', '横林镇', '0728', '431720', '113.188342', '30.536738', '113.194837', '30.542768', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (429613, 429006, 3, '彭市镇', '彭市镇', '0728', '431718', '113.187885', '30.456585', '113.194357', '30.462618', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (429614, 429006, 3, '麻洋镇', '麻洋镇', '0728', '431727', '113.267874', '30.435305', '113.274287', '30.441575', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (429615, 429006, 3, '多祥镇', '多祥镇', '0728', '431728', '113.36706', '30.427416', '113.373567', '30.433362', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (429616, 429006, 3, '干驿镇', '干驿镇', '0728', '431714', '113.386194', '30.543403', '113.392622', '30.549657', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (429617, 429006, 3, '马湾镇', '马湾镇', '0728', '431715', '113.334657', '30.573308', '113.341226', '30.578976', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (429618, 429006, 3, '卢市镇', '卢市镇', '0728', '431729', '113.33228', '30.668136', '113.338857', '30.673821', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (429619, 429006, 3, '小板镇', '小板镇', '0728', '431731', '113.224974', '30.608035', '113.231571', '30.613709', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (429620, 429006, 3, '九真镇', '九真镇', '0728', '431705', '113.220015', '30.741711', '113.226625', '30.747376', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (429621, 429006, 3, '皂市镇', '皂市镇', '0728', '431703', '113.349357', '30.856178', '113.355953', '30.861882', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (429622, 429006, 3, '胡市镇', '胡市镇', '0728', '431713', '113.389702', '30.779672', '113.396123', '30.785964', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (429623, 429006, 3, '石河镇', '石河镇', '0728', '431706', '113.086015', '30.75847', '113.092601', '30.764222', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (429624, 429006, 3, '净潭乡', '净潭乡', '0728', '431730', '113.400548', '30.655127', '113.406961', '30.661468', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (429625, 429006, 3, '蒋湖农场', '蒋湖农场', '0728', '431725', '112.85411', '30.636486', '112.860716', '30.642168', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (429626, 429006, 3, '白茅湖农场', '白茅湖农场', '0728', '431719', '113.101479', '30.60746', '113.108078', '30.613124', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (429627, 429006, 3, '沉湖林业科技示范区', '沉湖林业科技示范区', '0728', '431700', '113.165862', '30.653061', '113.172281', '30.659386', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (429628, 429006, 3, '天门工业园', '天门工业园', '0728', '431700', '113.446422', '30.402596', '113.453006', '30.408342', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (429629, 429006, 3, '侨乡街道开发区', '侨乡街道开发区', '0728', '431700', '113.15723', '30.634943', '113.163658', '30.641284', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (430000, 100000, 1, '湖南省', '湖南', NULL, NULL, '112.982279', '28.19409', '112.988857', '28.199752', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (430100, 430000, 2, '长沙市', '长沙', '0731', '410000', '112.982279', '28.19409', '112.988857', '28.199752', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (430102, 430100, 3, '芙蓉区', '芙蓉', '0731', '410000', '113.03176', '28.1844', '113.038169', '28.190704', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (430103, 430100, 3, '天心区', '天心', '0731', '410000', '112.98991', '28.1127', '112.996502', '28.11841', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (430104, 430100, 3, '岳麓区', '岳麓', '0731', '410000', '112.93133', '28.2351', '112.937778', '28.241386', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (430105, 430100, 3, '开福区', '开福', '0731', '410000', '112.98623', '28.25585', '112.992814', '28.26153', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (430111, 430100, 3, '雨花区', '雨花', '0731', '410000', '113.03567', '28.13541', '113.042092', '28.141742', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (430112, 430100, 3, '望城区', '望城', '0731', '410200', '112.819549', '28.347458', '112.826024', '28.353639', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (430121, 430100, 3, '长沙县', '长沙', '0731', '410100', '113.08071', '28.24595', '113.087268', '28.251773', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (430181, 430100, 3, '浏阳市', '浏阳', '0731', '410300', '113.64312', '28.16375', '113.649518', '28.170082', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (430182, 430100, 3, '宁乡市', '宁乡', '0731', '410600', '112.55749', '28.25358', '112.563912', '28.259916', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (430183, 430100, 3, '湘江新区', '湘江新区', '0731', '410005', '112.93769', '28.140266', '112.944139', '28.14647', NULL, '国家级新区');
INSERT INTO `yx_dev_region` VALUES (430200, 430000, 2, '株洲市', '株洲', '0731', '412000', '113.151737', '27.835806', '113.158157', '27.842113', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (430202, 430200, 3, '荷塘区', '荷塘', '0731', '412000', '113.17315', '27.85569', '113.1796', '27.861956', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (430203, 430200, 3, '芦淞区', '芦淞', '0731', '412000', '113.15562', '27.78525', '113.162034', '27.791579', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (430204, 430200, 3, '石峰区', '石峰', '0731', '412000', '113.11776', '27.87552', '113.124329', '27.881322', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (430211, 430200, 3, '天元区', '天元', '0731', '412000', '113.12335', '27.83103', '113.12987', '27.836912', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (430212, 430200, 3, '渌口区', '渌口', '0731', '412000', '113.14428', '27.69826', '113.150706', '27.704486', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (430223, 430200, 3, '攸县', '攸县', '0731', '412300', '113.34365', '27.00352', '113.350233', '27.009187', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (430224, 430200, 3, '茶陵县', '茶陵', '0731', '412400', '113.54364', '26.7915', '113.550133', '26.797616', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (430225, 430200, 3, '炎陵县', '炎陵', '0731', '412500', '113.77163', '26.48818', '113.778045', '26.494455', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (430281, 430200, 3, '醴陵市', '醴陵', '0731', '412200', '113.49704', '27.64615', '113.503523', '27.652276', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (430300, 430000, 2, '湘潭市', '湘潭', '0731', '411100', '112.925083', '27.846725', '112.931509', '27.853053', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (430302, 430300, 3, '雨湖区', '雨湖', '0731', '411100', '112.90399', '27.86859', '112.910453', '27.874821', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (430304, 430300, 3, '岳塘区', '岳塘', '0731', '411100', '112.9606', '27.85784', '112.96716', '27.863665', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (430321, 430300, 3, '湘潭县', '湘潭', '0731', '411200', '112.9508', '27.77893', '112.957305', '27.784916', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (430381, 430300, 3, '湘乡市', '湘乡', '0731', '411400', '112.53512', '27.73543', '112.541612', '27.741523', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (430382, 430300, 3, '韶山市', '韶山', '0731', '411300', '112.52655', '27.91503', '112.533051', '27.920966', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (430383, 430300, 3, '高新区', '高新区', '0731', '411100', '112.939865', '27.822804', '112.946308', '27.828972', NULL, '高新技术开发区');
INSERT INTO `yx_dev_region` VALUES (430400, 430000, 2, '衡阳市', '衡阳', '0734', '421000', '112.607693', '26.900358', '112.614275', '26.906092', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (430405, 430400, 3, '珠晖区', '珠晖', '0734', '421000', '112.62054', '26.89361', '112.627133', '26.899275', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (430406, 430400, 3, '雁峰区', '雁峰', '0734', '421000', '112.61654', '26.88866', '112.623128', '26.89433', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (430407, 430400, 3, '石鼓区', '石鼓', '0734', '421000', '112.61069', '26.90232', '112.617279', '26.908026', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (430408, 430400, 3, '蒸湘区', '蒸湘', '0734', '421000', '112.6033', '26.89651', '112.609867', '26.902297', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (430412, 430400, 3, '南岳区', '南岳', '0734', '421000', '112.7384', '27.23262', '112.744974', '27.238281', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (430421, 430400, 3, '衡阳县', '衡阳', '0734', '421200', '112.37088', '26.9706', '112.377432', '26.976296', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (430422, 430400, 3, '衡南县', '衡南', '0734', '421100', '112.67788', '26.73828', '112.684283', '26.744612', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (430423, 430400, 3, '衡山县', '衡山', '0734', '421300', '112.86776', '27.23134', '112.874327', '27.237027', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (430424, 430400, 3, '衡东县', '衡东', '0734', '421400', '112.94833', '27.08093', '112.954806', '27.086955', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (430426, 430400, 3, '祁东县', '祁东', '0734', '421600', '112.09039', '26.79964', '112.096838', '26.805932', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (430481, 430400, 3, '耒阳市', '耒阳', '0734', '421800', '112.85998', '26.42132', '112.866577', '26.426986', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (430482, 430400, 3, '常宁市', '常宁', '0734', '421500', '112.4009', '26.40692', '112.407443', '26.412767', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (430483, 430400, 3, '高新区', '高新区', '0734', '421000', '112.572172', '26.892209', '112.578619', '26.898483', NULL, '高新技术开发区');
INSERT INTO `yx_dev_region` VALUES (430484, 430400, 3, '综合保税区', '综合保税区', '0734', '421000', '112.606334', '26.826799', '112.612888', '26.832542', NULL, '经济技术开发区');
INSERT INTO `yx_dev_region` VALUES (430500, 430000, 2, '邵阳市', '邵阳', '0739', '422000', '111.46923', '27.237842', '111.475659', '27.244124', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (430502, 430500, 3, '双清区', '双清', '0739', '422000', '111.49715', '27.23291', '111.503592', '27.239117', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (430503, 430500, 3, '大祥区', '大祥', '0739', '422000', '111.45412', '27.23332', '111.460596', '27.23939', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (430511, 430500, 3, '北塔区', '北塔', '0739', '422000', '111.45219', '27.24648', '111.458687', '27.25252', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (430521, 430500, 3, '邵东县', '邵东', '0739', '422800', '111.74441', '27.2584', '111.750902', '27.264501', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (430522, 430500, 3, '新邵县', '新邵', '0739', '422900', '111.46066', '27.32169', '111.467099', '27.327863', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (430523, 430500, 3, '邵阳县', '邵阳', '0739', '422100', '111.27459', '26.99143', '111.281101', '26.997348', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (430524, 430500, 3, '隆回县', '隆回', '0739', '422200', '111.03216', '27.10937', '111.038659', '27.11533', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (430525, 430500, 3, '洞口县', '洞口', '0739', '422300', '110.57388', '27.05462', '110.580462', '27.060306', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (430527, 430500, 3, '绥宁县', '绥宁', '0739', '422600', '110.15576', '26.58636', '110.162176', '26.592681', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (430528, 430500, 3, '新宁县', '新宁', '0739', '422700', '110.85131', '26.42936', '110.857824', '26.435387', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (430529, 430500, 3, '城步苗族自治县', '城步', '0739', '422500', '110.3222', '26.39048', '110.328738', '26.39628', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (430581, 430500, 3, '武冈市', '武冈', '0739', '422400', '110.63281', '26.72817', '110.639216', '26.734474', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (430600, 430000, 2, '岳阳市', '岳阳', '0730', '414000', '113.132855', '29.37029', '113.139323', '29.376336', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (430602, 430600, 3, '岳阳楼区', '岳阳楼', '0730', '414000', '113.12942', '29.3719', '113.135903', '29.377885', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (430603, 430600, 3, '云溪区', '云溪', '0730', '414000', '113.27713', '29.47357', '113.28353', '29.479903', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (430611, 430600, 3, '君山区', '君山', '0730', '414000', '113.00439', '29.45941', '113.010916', '29.465312', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (430621, 430600, 3, '岳阳县', '岳阳', '0730', '414100', '113.11987', '29.14314', '113.126399', '29.148964', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (430623, 430600, 3, '华容县', '华容', '0730', '414200', '112.54089', '29.53019', '112.547352', '29.536375', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (430624, 430600, 3, '湘阴县', '湘阴', '0730', '410500', '112.90911', '28.68922', '112.915547', '28.695507', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (430626, 430600, 3, '平江县', '平江', '0730', '410400', '113.58105', '28.70664', '113.587655', '28.712305', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (430681, 430600, 3, '汨罗市', '汨罗', '0730', '414400', '113.06707', '28.80631', '113.073563', '28.812363', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (430682, 430600, 3, '临湘市', '临湘', '0730', '414300', '113.4501', '29.47701', '113.456662', '29.48271', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (430700, 430000, 2, '常德市', '常德', '0736', '415000', '111.691347', '29.040225', '111.697841', '29.046249', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (430702, 430700, 3, '武陵区', '武陵', '0736', '415000', '111.69791', '29.02876', '111.704364', '29.034892', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (430703, 430700, 3, '鼎城区', '鼎城', '0736', '415100', '111.68078', '29.01859', '111.687303', '29.02443', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (430721, 430700, 3, '安乡县', '安乡', '0736', '415600', '112.16732', '29.41326', '112.173845', '29.419216', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (430722, 430700, 3, '汉寿县', '汉寿', '0736', '415900', '111.96691', '28.90299', '111.973314', '28.9093', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (430723, 430700, 3, '澧县', '澧县', '0736', '415500', '111.75866', '29.63317', '111.765192', '29.639021', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (430724, 430700, 3, '临澧县', '临澧', '0736', '415200', '111.65161', '29.44163', '111.658206', '29.447331', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (430725, 430700, 3, '桃源县', '桃源', '0736', '415700', '111.48892', '28.90474', '111.495329', '28.911035', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (430726, 430700, 3, '石门县', '石门', '0736', '415300', '111.37966', '29.58424', '111.38611', '29.590411', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (430781, 430700, 3, '津市市', '津市', '0736', '415400', '111.87756', '29.60563', '111.884075', '29.611496', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (430800, 430000, 2, '张家界市', '张家界', '0744', '427000', '110.479921', '29.127401', '110.486446', '29.133229', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (430802, 430800, 3, '永定区', '永定', '0744', '427000', '110.47464', '29.13387', '110.481184', '29.139626', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (430811, 430800, 3, '武陵源区', '武陵源', '0744', '427400', '110.55026', '29.34574', '110.556755', '29.351734', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (430821, 430800, 3, '慈利县', '慈利', '0744', '427200', '111.13946', '29.42989', '111.145933', '29.43607', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (430822, 430800, 3, '桑植县', '桑植', '0744', '427100', '110.16308', '29.39815', '110.169491', '29.404476', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (430900, 430000, 2, '益阳市', '益阳', '0737', '413000', '112.355042', '28.570066', '112.361574', '28.575981', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (430902, 430900, 3, '资阳区', '资阳', '0737', '413000', '112.32447', '28.59095', '112.330906', '28.597283', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (430903, 430900, 3, '赫山区', '赫山', '0737', '413000', '112.37265', '28.57425', '112.379243', '28.579941', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (430921, 430900, 3, '南县', '南县', '0737', '413200', '112.3963', '29.36159', '112.40284', '29.367364', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (430922, 430900, 3, '桃江县', '桃江', '0737', '413400', '112.1557', '28.51814', '112.162242', '28.523907', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (430923, 430900, 3, '安化县', '安化', '0737', '413500', '111.21298', '28.37424', '111.219473', '28.380293', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (430981, 430900, 3, '沅江市', '沅江', '0737', '413100', '112.35427', '28.84403', '112.360804', '28.849959', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (431000, 430000, 2, '郴州市', '郴州', '0735', '423000', '113.032067', '25.793589', '113.03849', '25.799898', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (431002, 431000, 3, '北湖区', '北湖', '0735', '423000', '113.01103', '25.78405', '113.017511', '25.790065', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (431003, 431000, 3, '苏仙区', '苏仙', '0735', '423000', '113.04226', '25.80045', '113.048684', '25.806787', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (431021, 431000, 3, '桂阳县', '桂阳', '0735', '424400', '112.73364', '25.75406', '112.7402', '25.759737', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (431022, 431000, 3, '宜章县', '宜章', '0735', '424200', '112.95147', '25.39931', '112.957959', '25.40528', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (431023, 431000, 3, '永兴县', '永兴', '0735', '423300', '113.11242', '26.12646', '113.118963', '26.132185', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (431024, 431000, 3, '嘉禾县', '嘉禾', '0735', '424500', '112.36935', '25.58795', '112.375935', '25.593668', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (431025, 431000, 3, '临武县', '临武', '0735', '424300', '112.56369', '25.27602', '112.570101', '25.282348', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (431026, 431000, 3, '汝城县', '汝城', '0735', '424100', '113.68582', '25.55204', '113.692369', '25.557787', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (431027, 431000, 3, '桂东县', '桂东', '0735', '423500', '113.9468', '26.07987', '113.95339', '26.085553', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (431028, 431000, 3, '安仁县', '安仁', '0735', '423600', '113.26944', '26.70931', '113.275863', '26.715597', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (431081, 431000, 3, '资兴市', '资兴', '0735', '423400', '113.23724', '25.97668', '113.243792', '25.98247', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (431100, 430000, 2, '永州市', '永州', '0746', '425000', '111.608019', '26.434516', '111.614466', '26.440826', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (431102, 431100, 3, '零陵区', '零陵', '0746', '425000', '111.62103', '26.22109', '111.627493', '26.227241', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (431103, 431100, 3, '冷水滩区', '冷水滩', '0746', '425000', '111.59214', '26.46107', '111.598566', '26.467377', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (431121, 431100, 3, '祁阳县', '祁阳', '0746', '426100', '111.84011', '26.58009', '111.84653', '26.586425', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (431122, 431100, 3, '东安县', '东安', '0746', '425900', '111.3164', '26.39202', '111.322944', '26.3978', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (431123, 431100, 3, '双牌县', '双牌', '0746', '425200', '111.65927', '25.95988', '111.665865', '25.965549', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (431124, 431100, 3, '道县', '道县', '0746', '425300', '111.60195', '25.52766', '111.608354', '25.533989', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (431125, 431100, 3, '江永县', '江永', '0746', '425400', '111.34082', '25.27233', '111.347268', '25.278507', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (431126, 431100, 3, '宁远县', '宁远', '0746', '425600', '111.94625', '25.56913', '111.952701', '25.575385', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (431127, 431100, 3, '蓝山县', '蓝山', '0746', '425800', '112.19363', '25.36794', '112.20007', '25.374261', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (431128, 431100, 3, '新田县', '新田', '0746', '425700', '112.22103', '25.9095', '112.227485', '25.91565', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (431129, 431100, 3, '江华瑶族自治县', '江华', '0746', '425500', '111.58847', '25.1845', '111.594894', '25.190772', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (431200, 430000, 2, '怀化市', '怀化', '0745', '418000', '109.97824', '27.550082', '109.984813', '27.555751', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (431202, 431200, 3, '鹤城区', '鹤城', '0745', '418000', '109.96509', '27.54942', '109.97164', '27.555183', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (431221, 431200, 3, '中方县', '中方', '0745', '418000', '109.94497', '27.43988', '109.951432', '27.445962', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (431222, 431200, 3, '沅陵县', '沅陵', '0745', '419600', '110.39633', '28.45548', '110.40276', '28.461809', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (431223, 431200, 3, '辰溪县', '辰溪', '0745', '419500', '110.18942', '28.00406', '110.195932', '28.010074', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (431224, 431200, 3, '溆浦县', '溆浦', '0745', '419300', '110.59384', '27.90836', '110.600394', '27.91411', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (431225, 431200, 3, '会同县', '会同', '0745', '418300', '109.73568', '26.88716', '109.742266', '26.892841', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (431226, 431200, 3, '麻阳苗族自治县', '麻阳', '0745', '419400', '109.80194', '27.866', '109.808376', '27.872333', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (431227, 431200, 3, '新晃侗族自治县', '新晃', '0745', '419200', '109.17166', '27.35937', '109.178152', '27.365398', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (431228, 431200, 3, '芷江侗族自治县', '芷江', '0745', '419100', '109.6849', '27.44297', '109.691302', '27.449284', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (431229, 431200, 3, '靖州苗族侗族自治县', '靖州', '0745', '418400', '109.69821', '26.57651', '109.704667', '26.582701', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (431230, 431200, 3, '通道侗族自治县', '通道', '0745', '418500', '109.78515', '26.1571', '109.791591', '26.163334', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (431281, 431200, 3, '洪江市', '洪江', '0745', '418200', '109.83651', '27.20922', '109.843018', '27.215105', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (431300, 430000, 2, '娄底市', '娄底', '0738', '417000', '112.008497', '27.728136', '112.015074', '27.733861', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (431302, 431300, 3, '娄星区', '娄星', '0738', '417000', '112.00193', '27.72992', '112.008488', '27.735726', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (431321, 431300, 3, '双峰县', '双峰', '0738', '417700', '112.19921', '27.45418', '112.205609', '27.460512', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (431322, 431300, 3, '新化县', '新化', '0738', '417600', '111.32739', '27.7266', '111.333908', '27.732556', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (431381, 431300, 3, '冷水江市', '冷水江', '0738', '417500', '111.43554', '27.68147', '111.44208', '27.687236', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (431382, 431300, 3, '涟源市', '涟源', '0738', '417100', '111.67233', '27.68831', '111.678877', '27.694038', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (433100, 430000, 2, '湘西土家族苗族自治州', '湘西', '0743', '416000', '109.739735', '28.314296', '109.746314', '28.319965', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (433101, 433100, 3, '吉首市', '吉首', '0743', '416000', '109.69799', '28.26247', '109.704438', '28.268663', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (433122, 433100, 3, '泸溪县', '泸溪', '0743', '416100', '110.21682', '28.2205', '110.223421', '28.226178', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (433123, 433100, 3, '凤凰县', '凤凰', '0743', '416200', '109.60156', '27.94822', '109.608096', '27.95403', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (433124, 433100, 3, '花垣县', '花垣', '0743', '416400', '109.48217', '28.5721', '109.488732', '28.577908', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (433125, 433100, 3, '保靖县', '保靖', '0743', '416500', '109.66049', '28.69997', '109.666962', '28.706146', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (433126, 433100, 3, '古丈县', '古丈', '0743', '416300', '109.94812', '28.61944', '109.954612', '28.625473', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (433127, 433100, 3, '永顺县', '永顺', '0743', '416700', '109.85266', '29.00103', '109.859223', '29.00672', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (433130, 433100, 3, '龙山县', '龙山', '0743', '416800', '109.4432', '29.45693', '109.449616', '29.463255', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (440000, 100000, 1, '广东省', '广东', NULL, NULL, '113.280637', '23.125178', '113.287049', '23.131514', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (440100, 440000, 2, '广州市', '广州', '020', '510000', '113.280637', '23.125178', '113.287049', '23.131514', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (440103, 440100, 3, '荔湾区', '荔湾', '020', '510000', '113.2442', '23.12592', '113.250702', '23.131814', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (440104, 440100, 3, '越秀区', '越秀', '020', '510000', '113.26683', '23.12897', '113.273257', '23.135228', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (440105, 440100, 3, '海珠区', '海珠', '020', '510000', '113.26197', '23.10379', '113.268425', '23.109989', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (440106, 440100, 3, '天河区', '天河', '020', '510000', '113.36112', '23.12467', '113.367632', '23.130514', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (440111, 440100, 3, '白云区', '白云', '020', '510000', '113.27307', '23.15787', '113.279503', '23.164187', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (440112, 440100, 3, '黄埔区', '黄埔', '020', '510700', '113.45895', '23.10642', '113.465513', '23.112079', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (440113, 440100, 3, '番禺区', '番禺', '020', '511400', '113.38397', '22.93599', '113.390439', '22.94222', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (440114, 440100, 3, '花都区', '花都', '020', '510800', '113.22033', '23.40358', '113.226904', '23.409241', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (440115, 440100, 3, '南沙区', '南沙', '020', '511458', '113.60845', '22.77144', '113.614936', '22.777408', '行政区', '国家级新区');
INSERT INTO `yx_dev_region` VALUES (440117, 440100, 3, '从化区', '从化', '020', '510900', '113.587386', '23.545283', '113.59397', '23.550971', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (440118, 440100, 3, '增城区', '增城', '020', '511300', '113.829579', '23.290497', '113.836151', '23.2962', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (440200, 440000, 2, '韶关市', '韶关', '0751', '512000', '113.591544', '24.801322', '113.598088', '24.807038', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (440203, 440200, 3, '武江区', '武江', '0751', '512000', '113.58767', '24.79264', '113.594226', '24.798324', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (440204, 440200, 3, '浈江区', '浈江', '0751', '512000', '113.61109', '24.80438', '113.617567', '24.810395', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (440205, 440200, 3, '曲江区', '曲江', '0751', '512100', '113.60165', '24.67915', '113.608165', '24.685002', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (440222, 440200, 3, '始兴县', '始兴', '0751', '512500', '114.06799', '24.94759', '114.074547', '24.953275', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (440224, 440200, 3, '仁化县', '仁化', '0751', '512300', '113.74737', '25.08742', '113.753818', '25.093691', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (440229, 440200, 3, '翁源县', '翁源', '0751', '512600', '114.13385', '24.3495', '114.140285', '24.355754', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (440232, 440200, 3, '乳源瑶族自治县', '乳源', '0751', '512600', '113.27734', '24.77803', '113.283768', '24.784367', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (440233, 440200, 3, '新丰县', '新丰', '0751', '511100', '114.20788', '24.05924', '114.214389', '24.065202', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (440281, 440200, 3, '乐昌市', '乐昌', '0751', '512200', '113.35653', '25.12799', '113.36309', '25.133772', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (440282, 440200, 3, '南雄市', '南雄', '0751', '512400', '114.30966', '25.11706', '114.316244', '25.122764', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (440300, 440000, 2, '深圳市', '深圳', '0755', '518000', '114.085947', '22.547', '114.092449', '22.552925', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (440303, 440300, 3, '罗湖区', '罗湖', '0755', '518000', '114.13116', '22.54836', '114.137592', '22.554643', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (440304, 440300, 3, '福田区', '福田', '0755', '518000', '114.05571', '22.52245', '114.062258', '22.528113', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (440305, 440300, 3, '南山区', '南山', '0755', '518000', '113.93029', '22.53291', '113.93683', '22.538608', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (440306, 440300, 3, '宝安区', '宝安', '0755', '518100', '113.88311', '22.55371', '113.889537', '22.560046', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (440307, 440300, 3, '龙岗区', '龙岗', '0755', '518116', '114.24771', '22.71986', '114.254164', '22.726179', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (440308, 440300, 3, '盐田区', '盐田', '0755', '518000', '114.23733', '22.5578', '114.243761', '22.564139', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (440309, 440300, 3, '龙华区', '龙华', '0755', '518109', '114.036585', '22.68695', '114.043115', '22.692836', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (440310, 440300, 3, '坪山区', '坪山', '0755', '518118', '114.34637', '22.690529', '114.352829', '22.69679', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (440311, 440300, 3, '光明区', '光明', '0755', '518106', '113.896026', '22.777292', '113.902462', '22.783517', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (440312, 440300, 3, '大鹏新区', '大鹏新区', '0755', '518116', '114.479901', '22.587862', '114.486353', '22.594209', NULL, '新区');
INSERT INTO `yx_dev_region` VALUES (440400, 440000, 2, '珠海市', '珠海', '0756', '519000', '113.552724', '22.255899', '113.559238', '22.261851', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (440402, 440400, 3, '香洲区', '香洲', '0756', '519000', '113.5435', '22.26654', '113.549971', '22.272652', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (440403, 440400, 3, '斗门区', '斗门', '0756', '519100', '113.29644', '22.20898', '113.302905', '22.215203', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (440404, 440400, 3, '金湾区', '金湾', '0756', '519090', '113.36361', '22.14691', '113.370125', '22.152797', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (440405, 440400, 3, '横琴新区', '横琴新区', '0756', '519000', '113.531427', '22.095899', '113.537887', '22.102183', NULL, '新区');
INSERT INTO `yx_dev_region` VALUES (440406, 440400, 3, '经济开发区', '经济开发区', '0756', '519000', '113.223872', '21.915144', '113.230422', '21.920809', NULL, '经济技术开发区');
INSERT INTO `yx_dev_region` VALUES (440500, 440000, 2, '汕头市', '汕头', '0754', '515000', '116.708463', '23.37102', '116.715007', '23.3767', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (440507, 440500, 3, '龙湖区', '龙湖', '0754', '515000', '116.71641', '23.37166', '116.722936', '23.377427', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (440511, 440500, 3, '金平区', '金平', '0754', '515000', '116.70364', '23.36637', '116.71019', '23.372022', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (440512, 440500, 3, '濠江区', '濠江', '0754', '515000', '116.72659', '23.28588', '116.733108', '23.291819', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (440513, 440500, 3, '潮阳区', '潮阳', '0754', '515100', '116.6015', '23.26485', '116.608016', '23.270697', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (440514, 440500, 3, '潮南区', '潮南', '0754', '515100', '116.43188', '23.25', '116.438367', '23.255962', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (440515, 440500, 3, '澄海区', '澄海', '0754', '515800', '116.75589', '23.46728', '116.762314', '23.473621', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (440523, 440500, 3, '南澳县', '南澳', '0754', '515900', '117.01889', '23.4223', '117.025369', '23.428497', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (440600, 440000, 2, '佛山市', '佛山', '0757', '528000', '113.122717', '23.028762', '113.129232', '23.034633', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (440604, 440600, 3, '禅城区', '禅城', '0757', '528000', '113.1228', '23.00842', '113.129306', '23.014291', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (440605, 440600, 3, '南海区', '南海', '0757', '528200', '113.14299', '23.02877', '113.149436', '23.034981', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (440606, 440600, 3, '顺德区', '顺德', '0757', '528300', '113.29394', '22.80452', '113.300394', '22.810774', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (440607, 440600, 3, '三水区', '三水', '0757', '528100', '112.89703', '23.15564', '112.903501', '23.161761', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (440608, 440600, 3, '高明区', '高明', '0757', '528500', '112.89254', '22.90022', '112.899014', '22.906261', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (440700, 440000, 2, '江门市', '江门', '0750', '529000', '113.094942', '22.590431', '113.101527', '22.596107', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (440703, 440700, 3, '蓬江区', '蓬江', '0750', '529000', '113.07849', '22.59515', '113.085038', '22.601008', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (440704, 440700, 3, '江海区', '江海', '0750', '529000', '113.11099', '22.56024', '113.117547', '22.565955', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (440705, 440700, 3, '新会区', '新会', '0750', '529100', '113.03225', '22.45876', '113.038704', '22.465075', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (440781, 440700, 3, '台山市', '台山', '0750', '529200', '112.79382', '22.2515', '112.800265', '22.257822', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (440783, 440700, 3, '开平市', '开平', '0750', '529300', '112.69842', '22.37622', '112.704886', '22.382413', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (440784, 440700, 3, '鹤山市', '鹤山', '0750', '529700', '112.96429', '22.76523', '112.970817', '22.770996', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (440785, 440700, 3, '恩平市', '恩平', '0750', '529400', '112.30496', '22.18288', '112.311398', '22.189115', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (440800, 440000, 2, '湛江市', '湛江', '0759', '524000', '110.405529', '21.195338', '110.411954', '21.201653', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (440802, 440800, 3, '赤坎区', '赤坎', '0759', '524000', '110.36592', '21.26606', '110.372453', '21.271994', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (440803, 440800, 3, '霞山区', '霞山', '0759', '524000', '110.39822', '21.19181', '110.404645', '21.198138', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (440804, 440800, 3, '坡头区', '坡头', '0759', '524000', '110.45533', '21.24472', '110.461897', '21.250399', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (440811, 440800, 3, '麻章区', '麻章', '0759', '524000', '110.3342', '21.26333', '110.340779', '21.269018', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (440823, 440800, 3, '遂溪县', '遂溪', '0759', '524300', '110.25003', '21.37721', '110.256545', '21.383214', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (440825, 440800, 3, '徐闻县', '徐闻', '0759', '524100', '110.17379', '20.32812', '110.180256', '20.33437', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (440881, 440800, 3, '廉江市', '廉江', '0759', '524400', '110.28442', '21.60917', '110.290866', '21.615494', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (440882, 440800, 3, '雷州市', '雷州', '0759', '524200', '110.10092', '20.91428', '110.107502', '20.919954', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (440883, 440800, 3, '吴川市', '吴川', '0759', '524500', '110.77703', '21.44584', '110.78347', '21.452045', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (440884, 440800, 3, '经济开发区', '经济开发区', '0759', '524001', '110.325459', '21.012065', '110.332016', '21.017828', NULL, '经济技术开发区');
INSERT INTO `yx_dev_region` VALUES (440900, 440000, 2, '茂名市', '茂名', '0668', '525000', '110.919229', '21.659751', '110.925759', '21.665596', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (440902, 440900, 3, '茂南区', '茂南', '0668', '525000', '110.9187', '21.64103', '110.925245', '21.646887', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (440904, 440900, 3, '电白区', '电白', '0668', '525400', '111.007264', '21.507219', '111.013724', '21.513532', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (440981, 440900, 3, '高州市', '高州', '0668', '525200', '110.85519', '21.92057', '110.861655', '21.926656', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (440982, 440900, 3, '化州市', '化州', '0668', '525100', '110.63949', '21.66394', '110.645921', '21.670271', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (440983, 440900, 3, '信宜市', '信宜', '0668', '525300', '110.94647', '22.35351', '110.953053', '22.3592', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (441200, 440000, 2, '肇庆市', '肇庆', '0758', '526000', '112.472529', '23.051546', '112.479049', '23.057504', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (441202, 441200, 3, '端州区', '端州', '0758', '526000', '112.48495', '23.0519', '112.49151', '23.057664', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (441203, 441200, 3, '鼎湖区', '鼎湖', '0758', '526000', '112.56643', '23.15846', '112.572863', '23.164778', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (441204, 441200, 3, '高要区', '高要', '0758', '526100', '112.45834', '23.02577', '112.464787', '23.031961', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (441223, 441200, 3, '广宁县', '广宁', '0758', '526300', '112.44064', '23.6346', '112.447064', '23.640936', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (441224, 441200, 3, '怀集县', '怀集', '0758', '526400', '112.18396', '23.90918', '112.190432', '23.915409', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (441225, 441200, 3, '封开县', '封开', '0758', '526500', '111.50332', '23.43571', '111.509815', '23.441829', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (441226, 441200, 3, '德庆县', '德庆', '0758', '526600', '111.78555', '23.14371', '111.792102', '23.149386', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (441284, 441200, 3, '四会市', '四会', '0758', '526200', '112.73416', '23.32686', '112.740739', '23.33254', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (441300, 440000, 2, '惠州市', '惠州', '0752', '516000', '114.412599', '23.079404', '114.41918', '23.08509', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (441302, 441300, 3, '惠城区', '惠城', '0752', '516000', '114.3828', '23.08377', '114.389289', '23.089899', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (441303, 441300, 3, '惠阳区', '惠阳', '0752', '516200', '114.45639', '22.78845', '114.462856', '22.794561', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (441322, 441300, 3, '博罗县', '博罗', '0752', '516100', '114.28964', '23.17307', '114.296212', '23.178779', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (441323, 441300, 3, '惠东县', '惠东', '0752', '516300', '114.72009', '22.98484', '114.726516', '22.991183', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (441324, 441300, 3, '龙门县', '龙门', '0752', '516800', '114.25479', '23.72758', '114.26122', '23.733821', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (441325, 441300, 3, '大亚湾区', '大亚湾', '0752', '516000', '114.537616', '22.739381', '114.544184', '22.74504', NULL, '经济技术开发区');
INSERT INTO `yx_dev_region` VALUES (441400, 440000, 2, '梅州市', '梅州', '0753', '514000', '116.117582', '24.299112', '116.124127', '24.304901', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (441402, 441400, 3, '梅江区', '梅江', '0753', '514000', '116.11663', '24.31062', '116.123167', '24.316393', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (441403, 441400, 3, '梅县区', '梅县', '0753', '514787', '116.097753', '24.286739', '116.104338', '24.292396', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (441422, 441400, 3, '大埔县', '大埔', '0753', '514200', '116.69662', '24.35325', '116.703185', '24.358904', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (441423, 441400, 3, '丰顺县', '丰顺', '0753', '514300', '116.18219', '23.74094', '116.188645', '23.747075', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (441424, 441400, 3, '五华县', '五华', '0753', '514400', '115.77893', '23.92417', '115.785412', '23.93033', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (441426, 441400, 3, '平远县', '平远', '0753', '514600', '115.89556', '24.57116', '115.902019', '24.577256', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (441427, 441400, 3, '蕉岭县', '蕉岭', '0753', '514100', '116.17089', '24.65732', '116.17733', '24.663614', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (441481, 441400, 3, '兴宁市', '兴宁', '0753', '514500', '115.73141', '24.14001', '115.737992', '24.145701', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (441500, 440000, 2, '汕尾市', '汕尾', '0660', '516600', '115.364238', '22.774485', '115.370765', '22.780246', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (441502, 441500, 3, '城区', '城区', '0660', '516600', '115.36503', '22.7789', '115.371561', '22.784651', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (441521, 441500, 3, '海丰县', '海丰', '0660', '516400', '115.32336', '22.96653', '115.329805', '22.972873', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (441523, 441500, 3, '陆河县', '陆河', '0660', '516700', '115.65597', '23.30365', '115.662467', '23.30976', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (441581, 441500, 3, '陆丰市', '陆丰', '0660', '516500', '115.64813', '22.94335', '115.654655', '22.94932', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (441600, 440000, 2, '河源市', '河源', '0762', '517000', '114.697802', '23.746266', '114.704261', '23.7524', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (441602, 441600, 3, '源城区', '源城', '0762', '517000', '114.70242', '23.7341', '114.708858', '23.740304', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (441621, 441600, 3, '紫金县', '紫金', '0762', '517400', '115.18365', '23.63867', '115.190102', '23.644896', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (441622, 441600, 3, '龙川县', '龙川', '0762', '517300', '115.26025', '24.10142', '115.266806', '24.107071', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (441623, 441600, 3, '连平县', '连平', '0762', '517100', '114.49026', '24.37156', '114.496708', '24.377857', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (441624, 441600, 3, '和平县', '和平', '0762', '517200', '114.93841', '24.44319', '114.94486', '24.449333', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (441625, 441600, 3, '东源县', '东源', '0762', '517500', '114.74633', '23.78835', '114.752836', '23.79442', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (441700, 440000, 2, '阳江市', '阳江', '0662', '529500', '111.975107', '21.859222', '111.981577', '21.865461', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (441702, 441700, 3, '江城区', '江城', '0662', '529500', '111.95488', '21.86193', '111.961335', '21.868257', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (441704, 441700, 3, '阳东区', '阳东', '0662', '529900', '112.01467', '21.87398', '112.021252', '21.879661', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (441721, 441700, 3, '阳西县', '阳西', '0662', '529800', '111.61785', '21.75234', '111.624331', '21.758543', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (441781, 441700, 3, '阳春市', '阳春', '0662', '529600', '111.78854', '22.17232', '111.795081', '22.178014', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (441800, 440000, 2, '清远市', '清远', '0763', '511500', '113.036779', '23.704188', '113.043205', '23.710521', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (441802, 441800, 3, '清城区', '清城', '0763', '511500', '113.06265', '23.69784', '113.069126', '23.703968', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (441803, 441800, 3, '清新区', '清新', '0763', '511810', '113.015203', '23.736949', '113.021666', '23.743036', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (441821, 441800, 3, '佛冈县', '佛冈', '0763', '511600', '113.53286', '23.87231', '113.539296', '23.878575', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (441823, 441800, 3, '阳山县', '阳山', '0763', '513100', '112.64129', '24.46516', '112.647809', '24.471008', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (441825, 441800, 3, '连山壮族瑶族自治县', '连山', '0763', '513200', '112.0802', '24.56807', '112.086607', '24.574402', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (441826, 441800, 3, '连南瑶族自治县', '连南', '0763', '513300', '112.28842', '24.71726', '112.294923', '24.723232', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (441881, 441800, 3, '英德市', '英德', '0763', '513000', '113.415', '24.18571', '113.421443', '24.191949', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (441882, 441800, 3, '连州市', '连州', '0763', '513400', '112.38153', '24.77913', '112.388105', '24.784794', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (441900, 440000, 2, '东莞市', '东莞', '0769', '523000', '113.760234', '23.048884', '113.766674', '23.055227', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (441901, 441900, 3, '莞城区', '莞城', '0769', '523128', '113.751043', '23.053412', '113.757494', '23.059719', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (441902, 441900, 3, '南城区', '南城', '0769', '523617', '113.752125', '23.02018', '113.758545', '23.026489', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (441903, 441900, 3, '东城区', '东城', '0769', '402560', '113.772563', '22.981492', '113.779007', '22.987762', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (441904, 441900, 3, '万江区', '万江', '0769', '523039', '113.739053', '23.043842', '113.745525', '23.049999', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (441905, 441900, 3, '石碣镇', '石碣', '0769', '523290', '113.80217', '23.09899', '113.808712', '23.104787', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (441906, 441900, 3, '石龙镇', '石龙', '0769', '523326', '113.876381', '23.107444', '113.882805', '23.113778', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (441907, 441900, 3, '茶山镇', '茶山', '0769', '523380', '113.883526', '23.062375', '113.889976', '23.068715', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (441908, 441900, 3, '石排镇', '石排', '0769', '523346', '113.919859', '23.0863', '113.926406', '23.092134', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (441909, 441900, 3, '企石镇', '企石', '0769', '523507', '114.013233', '23.066044', '114.019699', '23.072311', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (441910, 441900, 3, '横沥镇', '横沥', '0769', '523471', '113.957436', '23.025732', '113.963965', '23.03152', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (441911, 441900, 3, '桥头镇', '桥头', '0769', '523520', '114.01385', '22.939727', '114.020315', '22.945986', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (441912, 441900, 3, '谢岗镇', '谢岗', '0769', '523592', '114.141396', '22.959664', '114.147883', '22.965817', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (441913, 441900, 3, '东坑镇', '东坑', '0769', '523451', '113.939835', '22.992804', '113.946392', '22.99846', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (441914, 441900, 3, '常平镇', '常平', '0769', '523560', '114.029627', '23.016116', '114.036107', '23.022119', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (441915, 441900, 3, '寮步镇', '寮步', '0769', '523411', '113.884745', '22.991738', '113.891167', '22.998067', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (441916, 441900, 3, '大朗镇', '大朗', '0769', '523770', '113.9271', '22.965748', '113.933667', '22.971484', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (441917, 441900, 3, '麻涌镇', '麻涌', '0769', '523143', '113.546177', '23.045315', '113.552669', '23.051384', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (441918, 441900, 3, '中堂镇', '中堂', '0769', '523233', '113.654422', '23.090164', '113.660881', '23.096414', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (441919, 441900, 3, '高埗镇', '高埗', '0769', '523282', '113.735917', '23.068415', '113.742415', '23.074523', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (441920, 441900, 3, '樟木头镇', '樟木头', '0769', '523619', '114.066298', '22.956682', '114.072882', '22.962362', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (441921, 441900, 3, '大岭山镇', '大岭山', '0769', '523835', '113.782955', '22.885366', '113.789411', '22.891485', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (441922, 441900, 3, '望牛墩镇', '望牛墩', '0769', '523203', '113.658847', '23.055018', '113.665323', '23.061209', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (441923, 441900, 3, '黄江镇', '黄江', '0769', '523755', '113.992635', '22.877536', '113.999056', '22.88385', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (441924, 441900, 3, '洪梅镇', '洪梅', '0769', '523163', '113.613081', '22.992675', '113.619558', '22.998727', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (441925, 441900, 3, '清溪镇', '清溪', '0769', '523660', '114.155796', '22.844456', '114.162331', '22.850357', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (441926, 441900, 3, '沙田镇', '沙田', '0769', '523988', '113.760234', '23.048884', '113.766674', '23.055227', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (441927, 441900, 3, '道滘镇', '道滘', '0769', '523171', '113.760234', '23.048884', '113.766674', '23.055227', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (441928, 441900, 3, '塘厦镇', '塘厦', '0769', '523713', '114.10765', '22.822862', '114.114114', '22.829139', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (441929, 441900, 3, '虎门镇', '虎门', '0769', '523932', '113.71118', '22.82615', '113.717756', '22.83187', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (441930, 441900, 3, '厚街镇', '厚街', '0769', '523960', '113.67301', '22.940815', '113.679538', '22.946765', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (441931, 441900, 3, '凤岗镇', '凤岗', '0769', '523690', '114.141194', '22.744598', '114.147659', '22.750749', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (441932, 441900, 3, '长安镇', '长安', '0769', '523850', '113.803939', '22.816644', '113.8105', '22.822419', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (441933, 441900, 3, '松山湖高新区', '松山湖高新区', '0769', '523808', '113.882849', '22.927549', '113.889289', '22.933888', NULL, '高新技术开发区');
INSERT INTO `yx_dev_region` VALUES (442000, 440000, 2, '中山市', '中山', '0760', '528400', '113.382391', '22.521113', '113.388833', '22.527315', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (442001, 442000, 3, '石岐区', '石岐', '0760', '528400', '113.378835', '22.52522', '113.385286', '22.531368', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (442002, 442000, 3, '东区', '东区', '0760', '528403', '113.416716', '22.509903', '113.423163', '22.516119', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (442003, 442000, 3, '西区', '东区', '0760', '528400', '113.342281', '22.553845', '113.348842', '22.559506', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (442004, 442000, 3, '南区', '南区', '0760', '528400', '113.355896', '22.486568', '113.362454', '22.492342', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (442005, 442000, 3, '五桂山区', '五桂山', '0760', '528458', '113.41079', '22.51968', '113.417216', '22.525964', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (442006, 442000, 3, '火炬开发区', '火炬', '0760', '528437', '113.480523', '22.566082', '113.487061', '22.571921', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (442007, 442000, 3, '黄圃镇', '黄圃', '0760', '528429', '113.342359', '22.715116', '113.348946', '22.720782', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (442008, 442000, 3, '南头镇', '南头', '0760', '528421', '113.296358', '22.713907', '113.302833', '22.720134', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (442009, 442000, 3, '东凤镇', '东凤', '0760', '528425', '113.26114', '22.68775', '113.26761', '22.693939', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (442010, 442000, 3, '阜沙镇', '阜沙', '0760', '528434', '113.353024', '22.666364', '113.359564', '22.672097', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (442011, 442000, 3, '小榄镇', '小榄', '0760', '528415', '113.244235', '22.666951', '113.250743', '22.672848', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (442012, 442000, 3, '东升镇', '东升', '0760', '528400', '113.296298', '22.614003', '113.302759', '22.620228', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (442013, 442000, 3, '古镇镇', '古镇', '0760', '528422', '113.179745', '22.611019', '113.186219', '22.617194', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (442014, 442000, 3, '横栏镇', '横栏', '0760', '528478', '113.265845', '22.523202', '113.272277', '22.529449', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (442015, 442000, 3, '三角镇', '三角', '0760', '528422', '113.423624', '22.677033', '113.430099', '22.683144', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (442016, 442000, 3, '民众镇', '民众', '0760', '528441', '113.486025', '22.623468', '113.492535', '22.629397', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (442017, 442000, 3, '南朗镇', '南朗', '0760', '528454', '113.533939', '22.492378', '113.540396', '22.498633', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (442018, 442000, 3, '港口镇', '港口', '0760', '528447', '113.382391', '22.521113', '113.388833', '22.527315', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (442019, 442000, 3, '大涌镇', '大涌', '0760', '528476', '113.291708', '22.467712', '113.298172', '22.473994', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (442020, 442000, 3, '沙溪镇', '沙溪', '0760', '528471', '113.328369', '22.526325', '113.334905', '22.532042', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (442021, 442000, 3, '三乡镇', '三乡', '0760', '528463', '113.4334', '22.352494', '113.439931', '22.358438', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (442022, 442000, 3, '板芙镇', '板芙', '0760', '528459', '113.320346', '22.415674', '113.326862', '22.421495', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (442023, 442000, 3, '神湾镇', '神湾', '0760', '528462', '113.359387', '22.312476', '113.365915', '22.318295', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (442024, 442000, 3, '坦洲镇', '坦洲', '0760', '528467', '113.485677', '22.261269', '113.492191', '22.267192', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (445100, 440000, 2, '潮州市', '潮州', '0768', '521000', '116.632301', '23.661701', '116.638753', '23.668026', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (445102, 445100, 3, '湘桥区', '湘桥', '0768', '521000', '116.62805', '23.67451', '116.634511', '23.680797', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (445103, 445100, 3, '潮安区', '潮安', '0768', '515638', '116.592895', '23.643656', '116.599454', '23.649384', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (445122, 445100, 3, '饶平县', '饶平', '0768', '515700', '117.00692', '23.66994', '117.013373', '23.676272', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (445200, 440000, 2, '揭阳市', '揭阳', '0663', '522000', '116.355733', '23.543778', '116.3623', '23.549545', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (445202, 445200, 3, '榕城区', '榕城', '0663', '522000', '116.3671', '23.52508', '116.373616', '23.531028', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (445203, 445200, 3, '揭东区', '揭东', '0663', '515500', '116.412947', '23.569887', '116.419402', '23.576161', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (445222, 445200, 3, '揭西县', '揭西', '0663', '515400', '115.83883', '23.42714', '115.845381', '23.432989', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (445224, 445200, 3, '惠来县', '惠来', '0663', '515200', '116.29599', '23.03289', '116.302437', '23.039122', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (445281, 445200, 3, '普宁市', '普宁', '0663', '515300', '116.16564', '23.29732', '116.172089', '23.303657', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (445300, 440000, 2, '云浮市', '云浮', '0766', '527300', '112.044439', '22.929801', '112.050968', '22.935706', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (445302, 445300, 3, '云城区', '云城', '0766', '527300', '112.03908', '22.92996', '112.045627', '22.93578', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (445303, 445300, 3, '云安区', '云安', '0766', '527500', '112.00936', '23.07779', '112.015937', '23.083508', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (445321, 445300, 3, '新兴县', '新兴', '0766', '527400', '112.23019', '22.69734', '112.236706', '22.70334', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (445322, 445300, 3, '郁南县', '郁南', '0766', '527100', '111.53387', '23.23307', '111.540424', '23.23875', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (445381, 445300, 3, '罗定市', '罗定', '0766', '527200', '111.56979', '22.76967', '111.576271', '22.775662', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (450000, 100000, 1, '广西壮族自治区', '广西', NULL, NULL, '108.320004', '22.82402', '108.326557', '22.829862', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (450100, 450000, 2, '南宁市', '南宁', '0771', '530000', '108.320004', '22.82402', '108.326557', '22.829862', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (450102, 450100, 3, '兴宁区', '兴宁', '0771', '530000', '108.36694', '22.85355', '108.373382', '22.859855', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (450103, 450100, 3, '青秀区', '青秀', '0771', '530000', '108.49545', '22.78511', '108.501889', '22.791332', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (450105, 450100, 3, '江南区', '江南', '0771', '530000', '108.27325', '22.78127', '108.279745', '22.787212', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (450107, 450100, 3, '西乡塘区', '西乡塘', '0771', '530000', '108.31347', '22.83386', '108.320041', '22.839617', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (450108, 450100, 3, '良庆区', '良庆', '0771', '530200', '108.41284', '22.74914', '108.419394', '22.754835', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (450109, 450100, 3, '邕宁区', '邕宁', '0771', '530200', '108.48684', '22.75628', '108.493261', '22.762582', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (450110, 450100, 3, '武鸣区', '武鸣', '0771', '530100', '108.27719', '23.15643', '108.283712', '23.16231', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (450123, 450100, 3, '隆安县', '隆安', '0771', '532700', '107.69192', '23.17336', '107.698496', '23.179068', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (450124, 450100, 3, '马山县', '马山', '0771', '530600', '108.17697', '23.70931', '108.183531', '23.714988', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (450125, 450100, 3, '上林县', '上林', '0771', '530500', '108.60522', '23.432', '108.611672', '23.438318', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (450126, 450100, 3, '宾阳县', '宾阳', '0771', '530400', '108.81185', '23.2196', '108.818344', '23.225632', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (450127, 450100, 3, '横县', '横县', '0771', '530300', '109.26608', '22.68448', '109.272649', '22.69017', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (450128, 450100, 3, '埌东新区', '埌东', '0771', '530000', '108.419094', '22.812976', '108.425675', '22.818654', NULL, '新区');
INSERT INTO `yx_dev_region` VALUES (450200, 450000, 2, '柳州市', '柳州', '0772', '545000', '109.411703', '24.314617', '109.418183', '24.320643', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (450202, 450200, 3, '城中区', '城中', '0772', '545000', '109.41082', '24.31543', '109.417303', '24.321441', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (450203, 450200, 3, '鱼峰区', '鱼峰', '0772', '545000', '109.4533', '24.31868', '109.459728', '24.324928', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (450204, 450200, 3, '柳南区', '柳南', '0772', '545000', '109.38548', '24.33599', '109.392031', '24.341671', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (450205, 450200, 3, '柳北区', '柳北', '0772', '545000', '109.40202', '24.36267', '109.408552', '24.368537', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (450206, 450200, 3, '柳江区', '柳江', '0772', '545100', '109.33273', '24.25596', '109.339187', '24.262221', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (450222, 450200, 3, '柳城县', '柳城', '0772', '545200', '109.23877', '24.64951', '109.245313', '24.655367', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (450223, 450200, 3, '鹿寨县', '鹿寨', '0772', '545600', '109.75177', '24.47306', '109.758323', '24.47879', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (450224, 450200, 3, '融安县', '融安', '0772', '545400', '109.39761', '25.22465', '109.404174', '25.230456', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (450225, 450200, 3, '融水苗族自治县', '融水', '0772', '545300', '109.25634', '25.06628', '109.262901', '25.071955', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (450226, 450200, 3, '三江侗族自治县', '三江', '0772', '545500', '109.60446', '25.78428', '109.610999', '25.790051', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (450227, 450200, 3, '柳东新区', '柳东', '0772', '545000', '109.437053', '24.329204', '109.443461', '24.335524', NULL, '新区');
INSERT INTO `yx_dev_region` VALUES (450300, 450000, 2, '桂林市', '桂林', '0773', '541000', '110.299121', '25.274215', '110.305567', '25.28039', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (450302, 450300, 3, '秀峰区', '秀峰', '0773', '541000', '110.28915', '25.28249', '110.295565', '25.288779', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (450303, 450300, 3, '叠彩区', '叠彩', '0773', '541000', '110.30195', '25.31381', '110.308413', '25.319944', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (450304, 450300, 3, '象山区', '象山', '0773', '541000', '110.28108', '25.26168', '110.287503', '25.26801', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (450305, 450300, 3, '七星区', '七星', '0773', '541000', '110.31793', '25.2525', '110.324468', '25.258368', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (450311, 450300, 3, '雁山区', '雁山', '0773', '541000', '110.30911', '25.06038', '110.31559', '25.066392', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (450312, 450300, 3, '临桂区', '临桂', '0773', '541100', '110.205487', '25.246257', '110.212055', '25.25202', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (450321, 450300, 3, '阳朔县', '阳朔', '0773', '541900', '110.49475', '24.77579', '110.501236', '24.781873', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (450323, 450300, 3, '灵川县', '灵川', '0773', '541200', '110.32949', '25.41292', '110.336036', '25.418633', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (450324, 450300, 3, '全州县', '全州', '0773', '541500', '111.07211', '25.92799', '111.078681', '25.933723', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (450325, 450300, 3, '兴安县', '兴安', '0773', '541300', '110.67144', '25.61167', '110.677954', '25.617647', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (450326, 450300, 3, '永福县', '永福', '0773', '541800', '109.98333', '24.98004', '109.989921', '24.985719', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (450327, 450300, 3, '灌阳县', '灌阳', '0773', '541600', '111.15954', '25.48803', '111.166088', '25.493873', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (450328, 450300, 3, '龙胜各族自治县', '龙胜', '0773', '541700', '110.01226', '25.79614', '110.018747', '25.802178', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (450329, 450300, 3, '资源县', '资源', '0773', '541400', '110.65255', '26.04237', '110.658991', '26.048633', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (450330, 450300, 3, '平乐县', '平乐', '0773', '542400', '110.64175', '24.63242', '110.648196', '24.638755', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (450332, 450300, 3, '恭城瑶族自治县', '恭城', '0773', '542500', '110.83035', '24.83286', '110.836907', '24.838574', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (450381, 450300, 3, '荔浦市', '荔浦', '0773', '546600', '110.3971', '24.49589', '110.403542', '24.502221', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (450400, 450000, 2, '梧州市', '梧州', '0774', '543000', '111.316229', '23.472309', '111.322764', '23.478086', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (450403, 450400, 3, '万秀区', '万秀', '0774', '543000', '111.32052', '23.47298', '111.327041', '23.478818', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (450405, 450400, 3, '长洲区', '长洲', '0774', '543000', '111.27494', '23.48573', '111.281439', '23.491641', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (450406, 450400, 3, '龙圩区', '龙圩', '0774', '543002', '111.316229', '23.472309', '111.322764', '23.478086', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (450421, 450400, 3, '苍梧县', '苍梧', '0774', '543100', '111.24533', '23.42049', '111.25178', '23.426814', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (450422, 450400, 3, '藤县', '藤县', '0774', '543300', '110.91418', '23.37605', '110.920677', '23.381974', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (450423, 450400, 3, '蒙山县', '蒙山', '0774', '546700', '110.52221', '24.20168', '110.52862', '24.208005', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (450481, 450400, 3, '岑溪市', '岑溪', '0774', '543200', '110.99594', '22.9191', '111.002372', '22.925425', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (450500, 450000, 2, '北海市', '北海', '0779', '536000', '109.119254', '21.473343', '109.125777', '21.479189', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (450502, 450500, 3, '海城区', '海城', '0779', '536000', '109.11744', '21.47501', '109.123959', '21.480885', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (450503, 450500, 3, '银海区', '银海', '0779', '536000', '109.13029', '21.4783', '109.136845', '21.484014', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (450512, 450500, 3, '铁山港区', '铁山港', '0779', '536000', '109.45578', '21.59661', '109.462233', '21.602832', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (450521, 450500, 3, '合浦县', '合浦', '0779', '536100', '109.20068', '21.66601', '109.207109', '21.672336', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (450600, 450000, 2, '防城港市', '防城港', '0770', '538000', '108.345478', '21.614631', '108.351945', '21.620869', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (450602, 450600, 3, '港口区', '港口', '0770', '538000', '108.38022', '21.64342', '108.386703', '21.649582', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (450603, 450600, 3, '防城区', '防城', '0770', '538000', '108.35726', '21.76464', '108.36371', '21.770965', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (450621, 450600, 3, '上思县', '上思', '0770', '535500', '107.9823', '22.14957', '107.988751', '22.155763', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (450681, 450600, 3, '东兴市', '东兴', '0770', '538100', '107.97204', '21.54713', '107.978526', '21.553163', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (450700, 450000, 2, '钦州市', '钦州', '0777', '535000', '108.624175', '21.967127', '108.630662', '21.973226', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (450702, 450700, 3, '钦南区', '钦南', '0777', '535000', '108.61775', '21.95137', '108.624202', '21.957563', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (450703, 450700, 3, '钦北区', '钦北', '0777', '535000', '108.63037', '21.95127', '108.636863', '21.957262', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (450721, 450700, 3, '灵山县', '灵山', '0777', '535400', '109.29153', '22.4165', '109.298006', '22.422522', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (450722, 450700, 3, '浦北县', '浦北', '0777', '535300', '109.55572', '22.26888', '109.562146', '22.275199', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (450800, 450000, 2, '贵港市', '贵港', '0775', '537100', '109.602146', '23.0936', '109.608694', '23.099406', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (450802, 450800, 3, '港北区', '港北', '0775', '537100', '109.57224', '23.11153', '109.578673', '23.117791', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (450803, 450800, 3, '港南区', '港南', '0775', '537100', '109.60617', '23.07226', '109.612741', '23.078018', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (450804, 450800, 3, '覃塘区', '覃塘', '0775', '537100', '109.44293', '23.12677', '109.449342', '23.13309', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (450821, 450800, 3, '平南县', '平南', '0775', '537300', '110.39062', '23.54201', '110.397076', '23.548306', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (450881, 450800, 3, '桂平市', '桂平', '0775', '537200', '110.08105', '23.39339', '110.087582', '23.399208', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (450900, 450000, 2, '玉林市', '玉林', '0775', '537000', '110.154393', '22.63136', '110.160817', '22.637674', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (450902, 450900, 3, '玉州区', '玉州', '0775', '537000', '110.15114', '22.6281', '110.157571', '22.634394', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (450903, 450900, 3, '福绵区', '福绵', '0775', '537023', '110.064816', '22.583057', '110.071316', '22.589149', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (450921, 450900, 3, '容县', '容县', '0775', '537500', '110.55593', '22.85701', '110.562454', '22.862909', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (450922, 450900, 3, '陆川县', '陆川', '0775', '537700', '110.26413', '22.32454', '110.270589', '22.330764', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (450923, 450900, 3, '博白县', '博白', '0775', '537600', '109.97744', '22.27286', '109.983994', '22.278531', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (450924, 450900, 3, '兴业县', '兴业', '0775', '537800', '109.87612', '22.74237', '109.882663', '22.74815', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (450981, 450900, 3, '北流市', '北流', '0775', '537400', '110.35302', '22.70817', '110.359592', '22.713917', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (450982, 450900, 3, '玉东新区', '玉东', '0775', '537000', '110.154393', '22.63136', '110.160817', '22.637674', NULL, '新区');
INSERT INTO `yx_dev_region` VALUES (450983, 450900, 3, '高新区', '高新区', '0775', '537000', '110.19582', '22.647947', '110.202321', '22.653844', NULL, '高新技术开发区');
INSERT INTO `yx_dev_region` VALUES (451000, 450000, 2, '百色市', '百色', '0776', '533000', '106.616285', '23.897742', '106.622871', '23.903432', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (451002, 451000, 3, '右江区', '右江', '0776', '533000', '106.61764', '23.9009', '106.624228', '23.906586', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (451021, 451000, 3, '田阳县', '田阳', '0776', '533600', '106.91558', '23.73535', '106.921992', '23.741658', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (451022, 451000, 3, '田东县', '田东', '0776', '531500', '107.12432', '23.60003', '107.130824', '23.605932', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (451023, 451000, 3, '平果县', '平果', '0776', '531400', '107.59045', '23.32969', '107.59702', '23.335417', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (451024, 451000, 3, '德保县', '德保', '0776', '533700', '106.61917', '23.32515', '106.625754', '23.330833', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (451026, 451000, 3, '那坡县', '那坡', '0776', '533900', '105.84191', '23.40649', '105.848347', '23.412807', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (451027, 451000, 3, '凌云县', '凌云', '0776', '533100', '106.56155', '24.34747', '106.567965', '24.353786', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (451028, 451000, 3, '乐业县', '乐业', '0776', '533200', '106.56124', '24.78295', '106.567663', '24.789268', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (451029, 451000, 3, '田林县', '田林', '0776', '533300', '106.22882', '24.29207', '106.235323', '24.298091', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (451030, 451000, 3, '西林县', '西林', '0776', '533500', '105.09722', '24.48966', '105.103702', '24.495779', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (451031, 451000, 3, '隆林各族自治县', '隆林', '0776', '533400', '105.34295', '24.77036', '105.349413', '24.77656', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (451081, 451000, 3, '靖西市', '靖西', '0776', '533800', '106.41766', '23.13425', '106.424114', '23.14037', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (451100, 450000, 2, '贺州市', '贺州', '0774', '542800', '111.552056', '24.414141', '111.558621', '24.419872', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (451102, 451100, 3, '八步区', '八步', '0774', '542800', '111.55225', '24.41179', '111.558817', '24.417524', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (451103, 451100, 3, '平桂区', '平桂', '0774', '542800', '111.485651', '24.458041', '111.492063', '24.464357', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (451121, 451100, 3, '昭平县', '昭平', '0774', '546800', '110.81082', '24.1701', '110.817394', '24.175807', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (451122, 451100, 3, '钟山县', '钟山', '0774', '542600', '111.30459', '24.52482', '111.311175', '24.530499', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (451123, 451100, 3, '富川瑶族自治县', '富川', '0774', '542700', '111.27767', '24.81431', '111.28418', '24.820175', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (451200, 450000, 2, '河池市', '河池', '0778', '547000', '108.062105', '24.695899', '108.06866', '24.701573', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (451202, 451200, 3, '金城江区', '金城江', '0778', '547000', '108.03727', '24.6897', '108.043778', '24.695575', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (451203, 451200, 3, '宜州区', '宜州', '0778', '546300', '108.65304', '24.49391', '108.659622', '24.499608', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (451221, 451200, 3, '南丹县', '南丹', '0778', '547200', '107.54562', '24.9776', '107.552118', '24.983677', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (451222, 451200, 3, '天峨县', '天峨', '0778', '547300', '107.17205', '24.99593', '107.178508', '25.002194', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (451223, 451200, 3, '凤山县', '凤山', '0778', '547600', '107.04892', '24.54215', '107.055352', '24.548436', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (451224, 451200, 3, '东兰县', '东兰', '0778', '547400', '107.37527', '24.51053', '107.381769', '24.516622', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (451225, 451200, 3, '罗城仫佬族自治县', '罗城', '0778', '546499', '108.90777', '24.77923', '108.914339', '24.78493', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (451226, 451200, 3, '环江毛南族自治县', '环江', '0778', '547100', '108.26055', '24.82916', '108.267004', '24.835312', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (451227, 451200, 3, '巴马瑶族自治县', '巴马', '0778', '547500', '107.25308', '24.14135', '107.259586', '24.147406', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (451228, 451200, 3, '都安瑶族自治县', '都安', '0778', '530700', '108.10116', '23.93245', '108.107628', '23.938631', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (451229, 451200, 3, '大化瑶族自治县', '大化', '0778', '530800', '107.9985', '23.74487', '108.004915', '23.75119', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (451300, 450000, 2, '来宾市', '来宾', '0772', '546100', '109.229772', '23.733766', '109.236252', '23.739766', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (451302, 451300, 3, '兴宾区', '兴宾', '0772', '546100', '109.23471', '23.72731', '109.241208', '23.733226', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (451321, 451300, 3, '忻城县', '忻城', '0772', '546200', '108.66357', '24.06862', '108.670132', '24.074298', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (451322, 451300, 3, '象州县', '象州', '0772', '545800', '109.6994', '23.97355', '109.705843', '23.979719', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (451323, 451300, 3, '武宣县', '武宣', '0772', '545900', '109.66284', '23.59474', '109.669282', '23.600942', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (451324, 451300, 3, '金秀瑶族自治县', '金秀', '0772', '545700', '110.19079', '24.12929', '110.197302', '24.135278', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (451381, 451300, 3, '合山市', '合山', '0772', '546500', '108.88586', '23.80619', '108.892426', '23.811952', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (451400, 450000, 2, '崇左市', '崇左', '0771', '532200', '107.353926', '22.404108', '107.360457', '22.409864', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (451402, 451400, 3, '江州区', '江州', '0771', '532299', '107.34747', '22.41135', '107.354013', '22.417048', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (451421, 451400, 3, '扶绥县', '扶绥', '0771', '532100', '107.90405', '22.63413', '107.910516', '22.640226', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (451422, 451400, 3, '宁明县', '宁明', '0771', '532500', '107.07299', '22.13655', '107.079504', '22.142501', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (451423, 451400, 3, '龙州县', '龙州', '0771', '532400', '106.85415', '22.33937', '106.860731', '22.345068', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (451424, 451400, 3, '大新县', '大新', '0771', '532300', '107.19821', '22.83412', '107.204758', '22.83999', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (451425, 451400, 3, '天等县', '天等', '0771', '532800', '107.13998', '23.077', '107.146464', '23.083164', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (451481, 451400, 3, '凭祥市', '凭祥', '0771', '532600', '106.75534', '22.10573', '106.761905', '22.111512', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (460000, 100000, 1, '海南省', '海南', NULL, NULL, '110.33119', '20.031971', '110.337736', '20.037673', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (460100, 460000, 2, '海口市', '海口', '0898', '570000', '110.33119', '20.031971', '110.337736', '20.037673', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (460105, 460100, 3, '秀英区', '秀英', '0898', '570300', '110.29345', '20.00752', '110.299885', '20.013769', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (460106, 460100, 3, '龙华区', '龙华', '0898', '570100', '110.30194', '20.02866', '110.308404', '20.034794', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (460107, 460100, 3, '琼山区', '琼山', '0898', '571199', '110.35418', '20.00321', '110.360706', '20.008963', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (460108, 460100, 3, '美兰区', '美兰', '0898', '570203', '110.36908', '20.02864', '110.375572', '20.034622', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (460109, 460100, 3, '江东新区', '江东新区', '0898', '570000', '110.36908', '20.02864', '110.375572', '20.034622', NULL, '新区');
INSERT INTO `yx_dev_region` VALUES (460200, 460000, 2, '三亚市', '三亚', '0898', '572000', '109.508268', '18.247872', '109.514826', '18.253575', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (460202, 460200, 3, '海棠区', '海棠', '0898', '572000', '109.508268', '18.247872', '109.514826', '18.253575', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (460203, 460200, 3, '吉阳区', '吉阳', '0898', '572000', '109.508268', '18.247872', '109.514826', '18.253575', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (460204, 460200, 3, '天涯区', '天涯', '0898', '572000', '109.508268', '18.247872', '109.514826', '18.253575', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (460205, 460200, 3, '崖州区', '崖州', '0898', '572000', '109.508268', '18.247872', '109.514826', '18.253575', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (460300, 460000, 2, '三沙市', '三沙', '0898', '573199', '112.34882', '16.831039', '112.355337', '16.837063', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (460321, 460300, 3, '西沙群岛', '西沙', '0898', '573199', '112.025528', '16.331342', '112.032086', '16.337022', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (460322, 460300, 3, '南沙群岛', '南沙', '0898', '573199', '116.749998', '11.471888', '116.756457', '11.47819', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (460323, 460300, 3, '中沙群岛', '中沙', '0898', '573199', '117.740071', '15.112856', '117.746541', '15.119031', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (460400, 460000, 2, '儋州市', '儋州', '0898', '571700', '109.576782', '19.517486', '109.583229', '19.523693', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (460401, 460400, 3, '洋浦经济开发区', '洋浦', '0898', '578001', '109.199224', '19.734908', '109.20567', '19.741236', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (460402, 460400, 3, '那大镇', '那大', '0898', '571799', '109.546409', '19.514878', '109.552851', '19.521124', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (460403, 460400, 3, '南丰镇', '南丰', '0898', '571724', '109.555934', '19.409409', '109.562357', '19.415727', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (460404, 460400, 3, '雅星镇', '雅星', '0898', '571729', '109.269116', '19.444077', '109.275672', '19.449787', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (460405, 460400, 3, '和庆镇', '和庆', '0898', '571721', '109.640856', '19.525399', '109.647364', '19.531244', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (460406, 460400, 3, '大成镇', '大成', '0898', '571736', '109.399019', '19.508129', '109.405543', '19.513949', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (460407, 460400, 3, '新州镇', '新州', '0898', '571749', '109.316166', '19.71431', '109.322627', '19.720635', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (460408, 460400, 3, '光村镇', '光村', '0898', '571752', '109.486552', '19.813635', '109.49311', '19.819387', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (460409, 460400, 3, '东成镇', '东成', '0898', '571763', '109.461304', '19.703738', '109.467797', '19.709886', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (460410, 460400, 3, '中和镇', '中和', '0898', '571747', '109.354985', '19.739661', '109.361501', '19.745576', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (460411, 460400, 3, '峨蔓镇', '峨蔓', '0898', '571745', '109.266778', '19.854774', '109.273339', '19.860468', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (460412, 460400, 3, '兰洋镇', '兰洋', '0898', '571722', '109.664392', '19.460397', '109.670869', '19.466625', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (460413, 460400, 3, '王五镇', '王五', '0898', '571739', '109.299551', '19.652264', '109.306003', '19.658418', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (460414, 460400, 3, '排浦镇', '排浦', '0898', '571741', '109.163254', '19.63881', '109.169758', '19.644694', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (460415, 460400, 3, '海头镇', '海头', '0898', '571732', '108.953393', '19.503315', '108.959835', '19.509622', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (460416, 460400, 3, '木棠镇', '木棠', '0898', '571746', '109.350255', '19.803926', '109.35676', '19.809922', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (460417, 460400, 3, '白马井镇', '白马井', '0898', '571742', '109.218735', '19.696407', '109.225217', '19.702592', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (460418, 460400, 3, '三都镇', '三都', '0898', '571744', '109.223369', '19.785945', '109.229836', '19.792054', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (460419, 460400, 3, '西培农场', '西培农场', '0898', '571725', '109.455554', '19.476422', '109.462032', '19.482651', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (460420, 460400, 3, '西联农场', '西联农场', '0898', '571756', '109.561827', '19.568148', '109.568277', '19.574477', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (460421, 460400, 3, '蓝洋农场', '蓝洋农场', '0898', '571756', '109.670722', '19.458983', '109.677187', '19.465277', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (460422, 460400, 3, '八一农场', '八一农场', '0898', '571727', '109.294493', '19.433909', '109.300973', '19.439984', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (460423, 460400, 3, '西华农场', '西华农场', '0898', '571735', '109.339232', '19.522628', '109.345682', '19.5288', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (460424, 460400, 3, '西庆农场', '西庆农场', '0898', '571738', '109.466186', '19.534709', '109.472655', '19.540771', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (460425, 460400, 3, '西流农场', '西流农场', '0898', '571758', '109.640914', '19.565919', '109.647447', '19.571769', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (460426, 460400, 3, '新盈农场', '新盈农场', '0898', '571753', '109.561667', '19.774501', '109.568089', '19.780825', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (460427, 460400, 3, '龙山农场', '龙山农场', '0898', '571757', '109.180752', '19.601523', '109.187237', '19.607701', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (460428, 460400, 3, '红岭农场', '红岭农场', '0898', '571733', '109.098479', '19.49571', '109.10495', '19.501896', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469001, 460000, 2, '五指山市', '五指山', '0898', '572200', '109.516662', '18.776921', '109.523201', '18.78271', '行政区', '直辖县级市');
INSERT INTO `yx_dev_region` VALUES (469002, 460000, 2, '琼海市', '琼海', '0898', '571400', '110.466785', '19.246011', '110.473352', '19.251703', '行政区', '直辖县级市');
INSERT INTO `yx_dev_region` VALUES (469005, 460000, 2, '文昌市', '文昌', '0898', '571300', '110.753975', '19.612986', '110.760426', '19.619303', '行政区', '直辖县级市');
INSERT INTO `yx_dev_region` VALUES (469006, 460000, 2, '万宁市', '万宁', '0898', '571500', '110.388793', '18.796216', '110.395231', '18.802489', '行政区', '直辖县级市');
INSERT INTO `yx_dev_region` VALUES (469007, 460000, 2, '东方市', '东方', '0898', '572600', '108.653789', '19.10198', '108.660361', '19.107674', '行政区', '直辖县级市');
INSERT INTO `yx_dev_region` VALUES (469021, 460000, 2, '定安县', '定安', '0898', '571200', '110.323959', '19.699211', '110.330515', '19.704993', '行政区', '省直辖县');
INSERT INTO `yx_dev_region` VALUES (469022, 460000, 2, '屯昌县', '屯昌', '0898', '571600', '110.102773', '19.362916', '110.109346', '19.368592', '行政区', '省直辖县');
INSERT INTO `yx_dev_region` VALUES (469023, 460000, 2, '澄迈县', '澄迈', '0898', '571900', '110.007147', '19.737095', '110.013659', '19.743046', '行政区', '省直辖县');
INSERT INTO `yx_dev_region` VALUES (469024, 460000, 2, '临高县', '临高', '0898', '571800', '109.687697', '19.908293', '109.694131', '19.914594', '行政区', '省直辖县');
INSERT INTO `yx_dev_region` VALUES (469025, 460000, 2, '白沙黎族自治县', '白沙', '0898', '572800', '109.452606', '19.224584', '109.459079', '19.230847', '行政区', '省直辖县');
INSERT INTO `yx_dev_region` VALUES (469026, 460000, 2, '昌江黎族自治县', '昌江', '0898', '572700', '109.053351', '19.260968', '109.05984', '19.267025', '行政区', '省直辖县');
INSERT INTO `yx_dev_region` VALUES (469027, 460000, 2, '乐东黎族自治县', '乐东', '0898', '572500', '109.175444', '18.74758', '109.181948', '18.753675', '行政区', '省直辖县');
INSERT INTO `yx_dev_region` VALUES (469028, 460000, 2, '陵水黎族自治县', '陵水', '0898', '572400', '110.037218', '18.505006', '110.043682', '18.511336', '行政区', '省直辖县');
INSERT INTO `yx_dev_region` VALUES (469029, 460000, 2, '保亭黎族苗族自治县', '保亭', '0898', '572300', '109.70245', '18.636371', '109.708947', '18.642501', '行政区', '省直辖县');
INSERT INTO `yx_dev_region` VALUES (469030, 460000, 2, '琼中黎族苗族自治县', '琼中', '0898', '572900', '109.839996', '19.03557', '109.84651', '19.041403', '行政区', '省直辖县');
INSERT INTO `yx_dev_region` VALUES (469101, 469001, 3, '通什镇', '通什镇', '0898', '572299', '109.517189', '18.780692', '109.523723', '18.786488', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469102, 469001, 3, '南圣镇', '南圣镇', '0898', '572219', '109.592708', '18.738438', '109.599232', '18.744394', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469103, 469001, 3, '毛阳镇', '毛阳镇', '0898', '572214', '109.50804', '18.936964', '109.514573', '18.942661', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469104, 469001, 3, '番阳镇', '番阳镇', '0898', '572213', '109.39785', '18.874421', '109.404403', '18.880229', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469105, 469001, 3, '畅好乡', '畅好乡', '0898', '572218', '109.487407', '18.733684', '109.493964', '18.739427', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469106, 469001, 3, '毛道乡', '毛道乡', '0898', '572217', '109.410699', '18.791255', '109.417186', '18.797265', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469107, 469001, 3, '水满乡', '水满乡', '0898', '572215', '109.667011', '18.881007', '109.673483', '18.887266', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469201, 469002, 3, '嘉积镇', '嘉积镇', '0898', '571400', '110.485992', '19.242966', '110.492519', '19.2489', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469202, 469002, 3, '万泉镇', '万泉镇', '0898', '571421', '110.409471', '19.243028', '110.415936', '19.249322', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469203, 469002, 3, '石壁镇', '石壁镇', '0898', '571400', '110.308525', '19.163306', '110.315002', '19.169328', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469204, 469002, 3, '中原镇', '中原镇', '0898', '571447', '110.468484', '19.151827', '110.475024', '19.157526', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469205, 469002, 3, '博鳌镇', '博鳌镇', '0898', '571434', '110.586613', '19.159782', '110.59315', '19.165467', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469206, 469002, 3, '阳江镇', '阳江镇', '0898', '571441', '110.352241', '19.096958', '110.358802', '19.102695', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469207, 469002, 3, '龙江镇', '龙江镇', '0898', '571446', '110.324964', '19.146787', '110.331498', '19.152552', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469208, 469002, 3, '潭门镇', '潭门镇', '0898', '571431', '110.616959', '19.241715', '110.623455', '19.247836', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469209, 469002, 3, '塔洋镇', '塔洋镇', '0898', '571427', '110.508274', '19.288197', '110.514707', '19.294465', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469210, 469002, 3, '长坡镇', '长坡镇', '0898', '571429', '110.606779', '19.335589', '110.613303', '19.341536', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469211, 469002, 3, '大路镇', '大路镇', '0898', '571425', '110.476469', '19.381023', '110.483006', '19.386807', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469212, 469002, 3, '会山镇', '会山镇', '0898', '571444', '110.269379', '19.067147', '110.275818', '19.073426', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469213, 469002, 3, '东太农场', '东太农场', '0898', '571445', '110.219783', '19.122067', '110.226356', '19.127739', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469214, 469002, 3, '东红农场', '东红农场', '0898', '571445', '110.448472', '19.400257', '110.455003', '19.405981', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469215, 469002, 3, '东升农场', '东升农场', '0898', '571422', '110.408028', '19.297574', '110.414457', '19.303873', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469216, 469002, 3, '南俸农场', '南俸农场', '0898', '571448', '110.22289', '19.173099', '110.229427', '19.178769', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469217, 469002, 3, '彬村山华侨农场', '彬村山华侨农场', '0898', '571400', '110.571208', '19.309458', '110.57775', '19.315159', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469501, 469005, 3, '文城镇', '文城镇', '0898', '571399', '110.753868', '19.613781', '110.760318', '19.620097', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469502, 469005, 3, '重兴镇', '重兴镇', '0898', '571344', '110.59676', '19.411623', '110.603278', '19.417408', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469503, 469005, 3, '蓬莱镇', '蓬莱镇', '0898', '571345', '110.541209', '19.536766', '110.547664', '19.54291', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469504, 469005, 3, '会文镇', '会文镇', '0898', '571343', '110.731756', '19.462573', '110.738269', '19.468607', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469505, 469005, 3, '东路镇', '东路镇', '0898', '571348', '110.706497', '19.791949', '110.713045', '19.797634', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469506, 469005, 3, '潭牛镇', '潭牛镇', '0898', '571349', '110.735357', '19.710084', '110.74186', '19.716179', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469507, 469005, 3, '东阁镇', '东阁镇', '0898', '571336', '110.849212', '19.656873', '110.855696', '19.662856', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469508, 469005, 3, '文教镇', '文教镇', '0898', '571335', '110.914491', '19.66635', '110.920992', '19.67227', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469509, 469005, 3, '东郊镇', '东郊镇', '0898', '571334', '110.851718', '19.573169', '110.858225', '19.579201', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469510, 469005, 3, '龙楼镇', '龙楼镇', '0898', '571333', '110.968601', '19.653286', '110.975086', '19.659258', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469511, 469005, 3, '昌洒镇', '昌洒镇', '0898', '571332', '110.900496', '19.76179', '110.90695', '19.767946', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469512, 469005, 3, '翁田镇', '翁田镇', '0898', '571328', '110.880134', '19.931466', '110.886585', '19.937801', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469513, 469005, 3, '抱罗镇', '抱罗镇', '0898', '571326', '110.748934', '19.843477', '110.755399', '19.849758', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469514, 469005, 3, '冯坡镇', '冯坡镇', '0898', '571327', '110.783952', '19.96465', '110.790448', '19.970756', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469515, 469005, 3, '锦山镇', '锦山镇', '0898', '571323', '110.69774', '19.995546', '110.704285', '20.001214', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469516, 469005, 3, '铺前镇', '铺前镇', '0898', '571322', '110.580003', '20.023731', '110.586548', '20.029397', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469517, 469005, 3, '公坡镇', '公坡镇', '0898', '571331', '110.808679', '19.789147', '110.815218', '19.794869', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469518, 469005, 3, '迈号镇', '迈号镇', '0898', '571341', '110.750639', '19.536094', '110.757069', '19.542384', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469519, 469005, 3, '清谰镇', '清谰镇', '0898', '571300', '110.819324', '19.562616', '110.825885', '19.568284', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469520, 469005, 3, '南阳镇', '南阳镇', '0898', '571300', '110.651269', '19.58414', '110.657739', '19.590419', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469521, 469005, 3, '新桥镇', '新桥镇', '0898', '571347', '110.685505', '19.654715', '110.692029', '19.660471', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469522, 469005, 3, '头苑镇', '头苑镇', '0898', '571338', '110.78784', '19.63677', '110.794318', '19.642805', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469523, 469005, 3, '宝芳乡', '宝芳乡', '0898', '571337', '110.82032', '19.71475', '110.826898', '19.720421', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469524, 469005, 3, '龙马乡', '龙马乡', '0898', '571329', '110.955913', '19.867553', '110.962445', '19.873328', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469525, 469005, 3, '湖山乡', '湖山乡', '0898', '571325', '110.7073', '19.92081', '110.713856', '19.926502', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469526, 469005, 3, '东路农场', '东路农场', '0898', '571300', '110.680672', '19.735311', '110.687208', '19.741136', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469527, 469005, 3, '南阳农场', '南阳农场', '0898', '571300', '110.653592', '19.564403', '110.660052', '19.570655', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469528, 469005, 3, '罗豆农场', '罗豆农场', '0898', '571300', '110.641659', '19.972489', '110.648107', '19.978821', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469601, 469006, 3, '万城镇', '万城镇', '0898', '571599', '110.397028', '18.794435', '110.403459', '18.80076', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469602, 469006, 3, '龙滚镇', '龙滚镇', '0898', '571521', '110.519208', '19.058665', '110.525633', '19.064993', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469603, 469006, 3, '和乐镇', '和乐镇', '0898', '571523', '110.477642', '18.903521', '110.484173', '18.909321', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469604, 469006, 3, '后安镇', '后安镇', '0898', '571525', '110.4437', '18.868013', '110.450257', '18.873799', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469605, 469006, 3, '大茂镇', '大茂镇', '0898', '571541', '110.39644', '18.848965', '110.402893', '18.855292', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469606, 469006, 3, '东澳镇', '东澳镇', '0898', '571528', '110.40168', '18.714824', '110.408119', '18.721153', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469607, 469006, 3, '礼纪镇', '礼纪镇', '0898', '571529', '110.317591', '18.750439', '110.324132', '18.756314', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469608, 469006, 3, '长丰镇', '长丰镇', '0898', '571535', '110.331725', '18.799832', '110.338259', '18.805529', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469609, 469006, 3, '山根镇', '山根镇', '0898', '571522', '110.483442', '18.963334', '110.489965', '18.969223', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469610, 469006, 3, '北大镇', '北大镇', '0898', '571539', '110.33561', '18.917983', '110.342149', '18.923658', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469611, 469006, 3, '南桥镇', '南桥镇', '0898', '571532', '110.15279', '18.680257', '110.159221', '18.686561', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469612, 469006, 3, '三更罗镇', '三更罗镇', '0898', '571536', '110.18663', '18.8612', '110.193138', '18.867261', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469613, 469006, 3, '东岭农场', '东岭农场', '0898', '571544', '110.382013', '18.979333', '110.388496', '18.985531', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469614, 469006, 3, '南林农场', '南林农场', '0898', '571532', '110.158181', '18.682322', '110.164607', '18.688648', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469615, 469006, 3, '东兴农场', '东兴农场', '0898', '571539', '110.33422', '18.928903', '110.340755', '18.934584', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469616, 469006, 3, '东和农场', '东和农场', '0898', '571534', '110.261509', '18.780627', '110.267976', '18.786814', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469617, 469006, 3, '新中农场', '新中农场', '0898', '571536', '110.194651', '18.853817', '110.201178', '18.85974', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469618, 469006, 3, '兴隆华侨农场', '兴隆华侨农场', '0898', '571533', '110.211072', '18.74816', '110.217642', '18.753868', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469701, 469007, 3, '八所镇', '八所镇', '0898', '572699', '108.670604', '19.092246', '108.677164', '19.097971', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469702, 469007, 3, '东河镇', '东河镇', '0898', '572626', '108.938223', '19.04824', '108.94468', '19.054373', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469703, 469007, 3, '大田镇', '大田镇', '0898', '572624', '108.874903', '19.16498', '108.881399', '19.170894', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469704, 469007, 3, '感城镇', '感城镇', '0898', '572633', '108.647432', '18.847602', '108.653984', '18.853345', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469705, 469007, 3, '板桥镇', '板桥镇', '0898', '572634', '108.688613', '18.794859', '108.695103', '18.800833', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469706, 469007, 3, '三家镇', '三家镇', '0898', '572623', '108.758458', '19.24124', '108.764999', '19.247103', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469707, 469007, 3, '四更镇', '四更镇', '0898', '572622', '108.682123', '19.225622', '108.688665', '19.231495', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469708, 469007, 3, '新龙镇', '新龙镇', '0898', '572632', '108.684546', '18.952031', '108.691054', '18.957938', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469709, 469007, 3, '天安乡', '天安乡', '0898', '572626', '108.912755', '19.017447', '108.919302', '19.023191', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469710, 469007, 3, '江边乡', '江边乡', '0898', '572628', '108.977135', '18.894377', '108.983605', '18.900582', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469711, 469007, 3, '广坝农场', '广坝农场', '0898', '572626', '108.945609', '19.043627', '108.952049', '19.049862', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469712, 469007, 3, '东方华侨农场', '东方华侨农场', '0898', '572632', '108.690697', '18.982529', '108.697213', '18.988544', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469801, 469021, 3, '定城镇', '定城镇', '0898', '571299', '110.368429', '19.680305', '110.374934', '19.686278', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469802, 469021, 3, '新竹镇', '新竹镇', '0898', '571236', '110.208963', '19.617783', '110.215515', '19.623506', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469803, 469021, 3, '龙湖镇', '龙湖镇', '0898', '571222', '110.401099', '19.573183', '110.407553', '19.579516', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469804, 469021, 3, '雷鸣镇', '雷鸣镇', '0898', '571225', '110.326015', '19.553654', '110.332552', '19.559407', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469805, 469021, 3, '龙门镇', '龙门镇', '0898', '571226', '110.328023', '19.43916', '110.334569', '19.444892', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469806, 469021, 3, '龙河镇', '龙河镇', '0898', '571231', '110.219091', '19.381868', '110.225647', '19.387537', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469807, 469021, 3, '岭口镇', '岭口镇', '0898', '571227', '110.308233', '19.342639', '110.314746', '19.348673', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469808, 469021, 3, '翰林镇', '翰林镇', '0898', '571228', '110.264731', '19.333758', '110.271204', '19.339991', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469809, 469021, 3, '富文镇', '富文镇', '0898', '571234', '110.2625', '19.551144', '110.268955', '19.557344', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469810, 469021, 3, '黄竹镇', '黄竹镇', '0898', '571224', '110.446722', '19.472782', '110.453286', '19.478531', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469811, 469021, 3, '金鸡岭农场', '金鸡岭农场', '0898', '571200', '110.260688', '19.593328', '110.267176', '19.599507', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469812, 469021, 3, '中瑞农场', '中瑞农场', '0898', '571200', '110.307332', '19.250472', '110.313833', '19.25652', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469813, 469021, 3, '南海农场', '南海农场', '0898', '571200', '110.446606', '19.471486', '110.45317', '19.477236', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469814, 469021, 3, '城区', '城区', '0898', '571200', '110.358891', '19.681434', '110.365425', '19.687252', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469821, 469022, 3, '屯城镇', '屯城镇', '0898', '571699', '110.104886', '19.371561', '110.111451', '19.377243', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469822, 469022, 3, '新兴镇', '新兴镇', '0898', '571621', '110.182802', '19.506743', '110.189274', '19.512863', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469823, 469022, 3, '枫木镇', '枫木镇', '0898', '571627', '110.019489', '19.214453', '110.025975', '19.220613', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469824, 469022, 3, '乌坡镇', '乌坡镇', '0898', '571626', '110.075965', '19.180023', '110.082466', '19.185919', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469825, 469022, 3, '南吕镇', '南吕镇', '0898', '571625', '110.08538', '19.247382', '110.091934', '19.253146', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469826, 469022, 3, '南坤镇', '南坤镇', '0898', '571632', '109.948276', '19.318366', '109.954769', '19.324395', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469827, 469022, 3, '坡心镇', '坡心镇', '0898', '571629', '110.08987', '19.30706', '110.096408', '19.312773', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469828, 469022, 3, '西昌镇', '西昌镇', '0898', '571636', '110.0455', '19.433661', '110.051938', '19.439976', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469829, 469022, 3, '中建农场', '中建农场', '0898', '571624', '110.170496', '19.284146', '110.176928', '19.290425', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469830, 469022, 3, '中坤农场', '中坤农场', '0898', '571600', '109.950409', '19.316375', '109.956907', '19.322367', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469831, 469022, 3, '县城内', '县城内', '0898', '571600', '110.10296', '19.360948', '110.109534', '19.366625', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469841, 469023, 3, '金江镇', '金江镇', '0898', '571999', '110.010211', '19.736761', '110.016714', '19.742765', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469842, 469023, 3, '老城镇', '老城镇', '0898', '571924', '110.125883', '19.961858', '110.132412', '19.96779', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469843, 469023, 3, '瑞溪镇', '瑞溪镇', '0898', '571933', '110.134169', '19.731674', '110.140664', '19.737747', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469844, 469023, 3, '永发镇', '永发镇', '0898', '571929', '110.19532', '19.747359', '110.201829', '19.753267', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469845, 469023, 3, '加乐镇', '加乐镇', '0898', '571938', '110.001059', '19.584998', '110.007605', '19.590852', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469846, 469023, 3, '文儒镇', '文儒镇', '0898', '571937', '110.053169', '19.53708', '110.059605', '19.543331', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469847, 469023, 3, '中兴镇', '中兴镇', '0898', '571944', '109.861281', '19.564772', '109.867844', '19.570444', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469848, 469023, 3, '仁兴镇', '仁兴镇', '0898', '571941', '109.882645', '19.492122', '109.889175', '19.498', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469849, 469023, 3, '福山镇', '福山镇', '0898', '571921', '109.930084', '19.830219', '109.936552', '19.836507', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469850, 469023, 3, '桥头镇', '桥头镇', '0898', '571922', '109.933531', '19.954138', '109.940005', '19.960392', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469851, 469023, 3, '大丰镇', '大丰镇', '0898', '571926', '110.038147', '19.855536', '110.044592', '19.861865', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469852, 469023, 3, '红光农场', '红光农场', '0898', '571921', '109.920632', '19.837845', '109.927091', '19.844178', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469853, 469023, 3, '西达农场', '西达农场', '0898', '571941', '109.88532', '19.483568', '109.891849', '19.489491', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469854, 469023, 3, '金安农场', '金安农场', '0898', '571932', '110.108668', '19.766615', '110.115202', '19.772315', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469855, 469023, 3, '城区', '城区', '0898', '571900', '110.006755', '19.738521', '110.013267', '19.744465', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469861, 469024, 3, '临城镇', '临城镇', '0898', '571899', '109.696445', '19.896521', '109.702888', '19.902732', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469862, 469024, 3, '波莲镇', '波莲镇', '0898', '571834', '109.648489', '19.868223', '109.654985', '19.874196', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469863, 469024, 3, '东英镇', '东英镇', '0898', '571837', '109.648634', '19.959022', '109.655156', '19.965002', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469864, 469024, 3, '博厚镇', '博厚镇', '0898', '571821', '109.745591', '19.88374', '109.752129', '19.889421', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469865, 469024, 3, '皇桐镇', '皇桐镇', '0898', '571823', '109.849709', '19.832893', '109.85628', '19.838614', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469866, 469024, 3, '多文镇', '多文镇', '0898', '571825', '109.771058', '19.773837', '109.777535', '19.779852', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469867, 469024, 3, '和舍镇', '和舍镇', '0898', '571831', '109.727556', '19.596267', '109.734121', '19.602009', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469868, 469024, 3, '南宝镇', '南宝镇', '0898', '571832', '109.599542', '19.680483', '109.606071', '19.686326', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469869, 469024, 3, '新盈镇', '新盈镇', '0898', '571835', '109.536349', '19.89513', '109.542811', '19.901234', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469870, 469024, 3, '调楼镇', '调楼镇', '0898', '571836', '109.544414', '19.935063', '109.550887', '19.941291', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469871, 469024, 3, '加来镇', '加来镇', '0898', '571833', '109.699213', '19.709921', '109.705701', '19.716101', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469872, 469024, 3, '红华农场', '红华农场', '0898', '571825', '109.774558', '19.774451', '109.781025', '19.780525', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469873, 469024, 3, '加来农场', '加来农场', '0898', '571833', '109.700217', '19.705881', '109.706707', '19.712046', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469874, 469024, 3, '城区', '城区', '0898', '571800', '109.690508', '19.912026', '109.696949', '19.918305', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469881, 469025, 3, '牙叉镇', '牙叉镇', '0898', '572800', '109.445361', '19.212209', '109.451817', '19.218527', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469882, 469025, 3, '七坊镇', '七坊镇', '0898', '572818', '109.244488', '19.295347', '109.251009', '19.301118', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469883, 469025, 3, '邦溪镇', '邦溪镇', '0898', '572821', '109.103545', '19.369532', '109.110036', '19.375642', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469884, 469025, 3, '打安镇', '打安镇', '0898', '572828', '109.373669', '19.283888', '109.380205', '19.289574', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469885, 469025, 3, '细水乡', '细水乡', '0898', '572811', '109.568501', '19.206414', '109.574955', '19.212712', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469886, 469025, 3, '元门乡', '元门乡', '0898', '572813', '109.486456', '19.158071', '109.492984', '19.163819', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469887, 469025, 3, '南开乡', '南开乡', '0898', '572814', '109.418377', '19.076943', '109.42485', '19.083082', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469888, 469025, 3, '阜龙乡', '阜龙乡', '0898', '572829', '109.460783', '19.322591', '109.467259', '19.328744', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469889, 469025, 3, '青松乡', '青松乡', '0898', '572816', '109.277198', '19.154446', '109.28372', '19.16024', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469890, 469025, 3, '金波乡', '金波乡', '0898', '572817', '109.178467', '19.236611', '109.184961', '19.242755', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469891, 469025, 3, '荣邦乡', '荣邦乡', '0898', '572823', '109.170729', '19.413953', '109.177208', '19.419962', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469892, 469025, 3, '白沙农场', '白沙农场', '0898', '572899', '109.475216', '19.195136', '109.481727', '19.201047', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469893, 469025, 3, '龙江农场', '龙江农场', '0898', '572818', '109.2424', '19.299394', '109.248918', '19.305193', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469894, 469025, 3, '邦溪农场', '邦溪农场', '0898', '572821', '109.127062', '19.403143', '109.133589', '19.408885', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469895, 469025, 3, '城区', '城区', '0898', '572800', '109.451484', '19.224823', '109.457955', '19.231097', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469901, 469026, 3, '石碌镇', '石碌镇', '0898', '572799', '109.055817', '19.277558', '109.062284', '19.283653', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469902, 469026, 3, '叉河镇', '叉河镇', '0898', '572724', '108.957345', '19.238934', '108.963805', '19.245261', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469903, 469026, 3, '十月田镇', '十月田镇', '0898', '572726', '108.95223', '19.328115', '108.958685', '19.334417', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469904, 469026, 3, '乌烈镇', '乌烈镇', '0898', '572728', '108.792331', '19.288583', '108.798858', '19.294319', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469905, 469026, 3, '海尾镇', '海尾镇', '0898', '572732', '108.820294', '19.42556', '108.826751', '19.431725', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469906, 469026, 3, '南罗镇', '南罗镇', '0898', '572733', '108.95497', '19.4647', '108.961433', '19.471019', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469907, 469026, 3, '太坡镇', '太坡镇', '0898', '572799', '109.040275', '19.405817', '109.046784', '19.411654', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469908, 469026, 3, '昌化镇', '昌化镇', '0898', '572731', '108.685077', '19.32924', '108.691601', '19.335159', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469909, 469026, 3, '七叉镇', '七叉镇', '0898', '572722', '109.051284', '19.114807', '109.057799', '19.120832', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469910, 469026, 3, '保平乡', '保平乡', '0898', '572726', '108.889608', '19.299437', '108.89614', '19.305154', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469911, 469026, 3, '昌城乡', '昌城乡', '0898', '572731', '108.700489', '19.309607', '108.706949', '19.315775', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469912, 469026, 3, '王下乡', '王下乡', '0898', '572722', '109.150473', '19.003399', '109.157037', '19.009122', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469913, 469026, 3, '霸王岭林场', '霸王岭林场', '0898', '572722', '109.146257', '19.069097', '109.152801', '19.074785', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469914, 469026, 3, '红林农场', '红林农场', '0898', '572724', '109.057676', '19.262656', '109.064151', '19.268784', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469915, 469026, 3, '城区', '城区', '0898', '572700', '109.054957', '19.260863', '109.061441', '19.266947', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469920, 469027, 3, '抱由镇', '抱由镇', '0898', '572599', '109.179537', '18.744783', '109.186029', '18.750943', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469921, 469027, 3, '万冲镇', '万冲镇', '0898', '572521', '109.322862', '18.844718', '109.329311', '18.851043', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469922, 469027, 3, '大安镇', '大安镇', '0898', '572523', '109.214756', '18.691329', '109.221196', '18.69756', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469923, 469027, 3, '志仲镇', '志仲镇', '0898', '572524', '109.265118', '18.629242', '109.271692', '18.634929', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469924, 469027, 3, '千家镇', '千家镇', '0898', '572531', '109.086133', '18.565576', '109.092561', '18.571883', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469925, 469027, 3, '九所镇', '九所镇', '0898', '572533', '108.953917', '18.453489', '108.960345', '18.459796', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469926, 469027, 3, '利国镇', '利国镇', '0898', '572534', '108.897393', '18.472259', '108.90394', '18.477934', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469927, 469027, 3, '黄流镇', '黄流镇', '0898', '572536', '108.793131', '18.504591', '108.799693', '18.510342', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469928, 469027, 3, '佛罗镇', '佛罗镇', '0898', '572541', '108.736289', '18.578496', '108.742735', '18.584708', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469929, 469027, 3, '尖峰镇', '尖峰镇', '0898', '572542', '108.792492', '18.690418', '108.799017', '18.696156', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469930, 469027, 3, '莺歌海镇', '莺歌海镇', '0898', '572539', '108.697351', '18.510156', '108.70385', '18.516282', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469931, 469027, 3, '乐中农场', '乐中农场', '0898', '572522', '109.324863', '18.848094', '109.331316', '18.854413', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469932, 469027, 3, '山荣农场', '山荣农场', '0898', '572501', '109.16416', '18.769503', '109.170687', '18.775406', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469933, 469027, 3, '乐光农场', '乐光农场', '0898', '572529', '109.115741', '18.624696', '109.122277', '18.630602', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469934, 469027, 3, '报伦农场', '报伦农场', '0898', '572543', '109.050489', '18.591113', '109.056979', '18.59712', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469935, 469027, 3, '福报农场', '福报农场', '0898', '572532', '109.071416', '18.528763', '109.077877', '18.53506', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469936, 469027, 3, '保国农场', '保国农场', '0898', '572525', '109.290247', '18.571222', '109.296727', '18.577223', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469937, 469027, 3, '保显农场', '保显农场', '0898', '572526', '109.317726', '18.616826', '109.324186', '18.623154', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469938, 469027, 3, '尖峰岭林业', '尖峰岭林业', '0898', '572500', '108.814636', '18.697903', '108.821104', '18.703978', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469939, 469027, 3, '莺歌海盐场', '莺歌海盐场', '0898', '572500', '108.740872', '18.497727', '108.747362', '18.50388', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469940, 469027, 3, '城区', '城区', '0898', '572500', '109.177751', '18.74347', '109.184247', '18.749602', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469941, 469028, 3, '椰林镇', '椰林镇', '0898', '572499', '110.036325', '18.506138', '110.04279', '18.512465', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469942, 469028, 3, '光坡镇', '光坡镇', '0898', '572422', '110.048782', '18.543389', '110.055229', '18.549684', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469943, 469028, 3, '三才镇', '三才镇', '0898', '572424', '110.003298', '18.474577', '110.009812', '18.480463', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469944, 469028, 3, '英州镇', '英州镇', '0898', '572427', '109.859217', '18.427082', '109.865765', '18.432752', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469945, 469028, 3, '隆广镇', '隆广镇', '0898', '572429', '109.907152', '18.501217', '109.913626', '18.507478', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469946, 469028, 3, '文罗镇', '文罗镇', '0898', '572429', '109.962258', '18.514064', '109.968811', '18.51987', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469947, 469028, 3, '本号镇', '本号镇', '0898', '572434', '109.966776', '18.608373', '109.973327', '18.61412', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469948, 469028, 3, '新村镇', '新村镇', '0898', '572426', '109.971328', '18.412445', '109.977885', '18.41815', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469949, 469028, 3, '黎安镇', '黎安镇', '0898', '572423', '110.069642', '18.437315', '110.076125', '18.443319', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469950, 469028, 3, '提蒙乡', '提蒙乡', '0898', '572435', '110.013019', '18.564801', '110.019491', '18.57085', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469951, 469028, 3, '群英乡', '群英乡', '0898', '572431', '109.880073', '18.581531', '109.886584', '18.587365', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469952, 469028, 3, '岭门农场', '岭门农场', '0898', '572421', '110.03747', '18.601755', '110.043916', '18.608083', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469953, 469028, 3, '南平农场', '南平农场', '0898', '572431', '109.926915', '18.607889', '109.933371', '18.614199', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469954, 469028, 3, '城区', '城区', '0898', '572400', '110.036263', '18.507074', '110.042728', '18.513401', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469961, 469029, 3, '保城镇', '保城镇', '0898', '572399', '109.703534', '18.641564', '109.710032', '18.647676', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469962, 469029, 3, '什玲镇', '什玲镇', '0898', '572312', '109.787782', '18.661954', '109.794235', '18.668218', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469963, 469029, 3, '加茂镇', '加茂镇', '0898', '572313', '109.707284', '18.55223', '109.713764', '18.558275', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469964, 469029, 3, '响水镇', '响水镇', '0898', '572319', '109.61628', '18.592227', '109.622827', '18.597903', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469965, 469029, 3, '新政镇', '新政镇', '0898', '572318', '109.628923', '18.541697', '109.635471', '18.547403', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469966, 469029, 3, '三道镇', '三道镇', '0898', '572316', '109.668671', '18.464575', '109.675111', '18.470845', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469967, 469029, 3, '六弓乡', '六弓乡', '0898', '572314', '109.790856', '18.539494', '109.797307', '18.545786', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469968, 469029, 3, '南林乡', '南林乡', '0898', '572317', '109.617456', '18.405242', '109.624024', '18.410918', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469969, 469029, 3, '毛感乡', '毛感乡', '0898', '572322', '109.512415', '18.611051', '109.51897', '18.616791', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469970, 469029, 3, '新星农场', '新星农场', '0898', '572399', '109.695472', '18.653413', '109.70194', '18.659641', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469971, 469029, 3, '金江农场', '金江农场', '0898', '572319', '109.603133', '18.561246', '109.609651', '18.567034', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469972, 469029, 3, '三道农场', '三道农场', '0898', '572316', '109.683653', '18.440149', '109.690082', '18.446469', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469981, 469030, 3, '营根镇', '营根镇', '0898', '572999', '109.831638', '19.036091', '109.838128', '19.04206', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469982, 469030, 3, '湾岭镇', '湾岭镇', '0898', '572912', '109.900496', '19.141306', '109.906965', '19.147478', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469983, 469030, 3, '黎母山镇', '黎母山镇', '0898', '572929', '109.792761', '19.266226', '109.799201', '19.272531', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469984, 469030, 3, '和平镇', '和平镇', '0898', '572918', '110.029212', '18.897423', '110.035667', '18.903702', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469985, 469030, 3, '长征镇', '长征镇', '0898', '572917', '109.878212', '18.958753', '109.884744', '18.964562', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469986, 469030, 3, '红毛镇', '红毛镇', '0898', '572933', '109.689915', '19.030678', '109.696355', '19.036962', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469987, 469030, 3, '中平镇', '中平镇', '0898', '572915', '110.062058', '19.058532', '110.068517', '19.064662', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469988, 469030, 3, '上安乡', '上安乡', '0898', '572919', '109.83728', '18.876827', '109.84382', '18.882708', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469989, 469030, 3, '什运乡', '什运乡', '0898', '572923', '109.607968', '18.992016', '109.614534', '18.997754', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469990, 469030, 3, '吊罗山乡', '吊罗山乡', '0898', '572921', '109.878143', '18.792633', '109.884664', '18.798439', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469991, 469030, 3, '阳江农场', '阳江农场', '0898', '572928', '109.720008', '19.345067', '109.726556', '19.350906', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469992, 469030, 3, '乌石农场', '乌石农场', '0898', '572911', '109.86306', '19.124241', '109.869631', '19.129918', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469993, 469030, 3, '加钗农场', '加钗农场', '0898', '572925', '109.779899', '19.038332', '109.786355', '19.044492', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469994, 469030, 3, '长征农场', '长征农场', '0898', '572917', '109.880077', '18.959379', '109.886605', '18.965215', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (469995, 469030, 3, '城区', '城区', '0898', '572900', '109.854855', '19.037385', '109.861394', '19.043065', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (500000, 100000, 1, '重庆', '重庆', NULL, NULL, '106.504962', '29.533155', '106.51156', '29.53885', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (500100, 500000, 2, '重庆市', '重庆', '023', '400000', '106.504962', '29.533155', '106.51156', '29.53885', '行政区', '直辖市');
INSERT INTO `yx_dev_region` VALUES (500101, 500100, 3, '万州区', '万州', '023', '404100', '108.40869', '30.80788', '108.415248', '30.813605', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (500102, 500100, 3, '涪陵区', '涪陵', '023', '408000', '107.39007', '29.70292', '107.39649', '29.709199', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (500103, 500100, 3, '渝中区', '渝中', '023', '400000', '106.56901', '29.55279', '106.57545', '29.55908', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (500104, 500100, 3, '大渡口区', '大渡口', '023', '400000', '106.48262', '29.48447', '106.489156', '29.490269', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (500105, 500100, 3, '江北区', '江北', '023', '400000', '106.57434', '29.60658', '106.580756', '29.612808', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (500106, 500100, 3, '沙坪坝区', '沙坪坝', '023', '400000', '106.45752', '29.54113', '106.463983', '29.547329', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (500107, 500100, 3, '九龙坡区', '九龙坡', '023', '400000', '106.51107', '29.50197', '106.517628', '29.507698', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (500108, 500100, 3, '南岸区', '南岸', '023', '400000', '106.56347', '29.52311', '106.569886', '29.529425', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (500109, 500100, 3, '北碚区', '北碚', '023', '400700', '106.39614', '29.80574', '106.402712', '29.811532', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (500110, 500100, 3, '綦江区', '綦江', '023', '400800', '106.926779', '28.960656', '106.933214', '28.966961', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (500111, 500100, 3, '大足区', '大足', '023', '400900', '105.768121', '29.484025', '105.774675', '29.489762', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (500112, 500100, 3, '渝北区', '渝北', '023', '401120', '106.6307', '29.7182', '106.63726', '29.723925', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (500113, 500100, 3, '巴南区', '巴南', '023', '401320', '106.52365', '29.38311', '106.530164', '29.389002', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (500114, 500100, 3, '黔江区', '黔江', '023', '409000', '108.7709', '29.5332', '108.777491', '29.538913', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (500115, 500100, 3, '长寿区', '长寿', '023', '401220', '107.08166', '29.85359', '107.088192', '29.859401', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (500116, 500100, 3, '江津区', '江津', '023', '402260', '106.25912', '29.29008', '106.265717', '29.295764', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (500117, 500100, 3, '合川区', '合川', '023', '401520', '106.27633', '29.97227', '106.28287', '29.978055', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (500118, 500100, 3, '永川区', '永川', '023', '402160', '105.927', '29.35593', '105.9335', '29.361876', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (500119, 500100, 3, '南川区', '南川', '023', '408400', '107.09936', '29.15751', '107.105945', '29.163188', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (500120, 500100, 3, '璧山区', '璧山', '023', '402760', '106.231126', '29.593581', '106.237619', '29.599559', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (500151, 500100, 3, '铜梁区', '铜梁', '023', '402560', '106.054948', '29.839944', '106.061408', '29.846021', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (500152, 500100, 3, '潼南区', '潼南', '023', '402660', '105.84005', '30.1912', '105.846449', '30.197514', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (500153, 500100, 3, '荣昌区', '荣昌', '023', '402460', '105.59442', '29.40488', '105.60084', '29.411185', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (500154, 500100, 3, '开州区', '开州', '023', '405400', '108.39306', '31.16095', '108.399558', '31.166893', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (500155, 500100, 3, '梁平区', '梁平', '023', '405200', '107.79998', '30.67545', '107.806512', '30.681285', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (500156, 500100, 3, '武隆区', '武隆', '023', '408500', '107.7601', '29.32548', '107.766525', '29.331807', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (500229, 500100, 3, '城口县', '城口', '023', '405900', '108.66513', '31.94801', '108.671741', '31.953701', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (500230, 500100, 3, '丰都县', '丰都', '023', '408200', '107.73098', '29.86348', '107.737461', '29.869493', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (500231, 500100, 3, '垫江县', '垫江', '023', '408300', '107.35446', '30.33359', '107.361007', '30.339351', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (500233, 500100, 3, '忠县', '忠县', '023', '404300', '108.03689', '30.28898', '108.043433', '30.294869', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (500235, 500100, 3, '云阳县', '云阳', '023', '404500', '108.69726', '30.93062', '108.703706', '30.936736', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (500236, 500100, 3, '奉节县', '奉节', '023', '404600', '109.46478', '31.01825', '109.471257', '31.024339', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (500237, 500100, 3, '巫山县', '巫山', '023', '404700', '109.87814', '31.07458', '109.884689', '31.080387', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (500238, 500100, 3, '巫溪县', '巫溪', '023', '405800', '109.63128', '31.39756', '109.637843', '31.403282', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (500240, 500100, 3, '石柱土家族自治县', '石柱', '023', '409100', '108.11389', '30.00054', '108.120305', '30.006848', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (500241, 500100, 3, '秀山土家族苗族自治县', '秀山', '023', '409900', '108.98861', '28.45062', '108.995114', '28.456646', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (500242, 500100, 3, '酉阳土家族苗族自治县', '酉阳', '023', '409800', '108.77212', '28.8446', '108.778713', '28.850305', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (500243, 500100, 3, '彭水苗族土家族自治县', '彭水', '023', '409600', '108.16638', '29.29516', '108.17296', '29.300918', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (500300, 500100, 3, '两江新区', '两江新区', '023', '401147', '106.463344', '29.729153', '106.469794', '29.735257', NULL, '国家级新区');
INSERT INTO `yx_dev_region` VALUES (500301, 500100, 3, '高新区', '高新区', '023', '400039', '106.480492', '29.524916', '106.487043', '29.530751', NULL, '高新技术开发区');
INSERT INTO `yx_dev_region` VALUES (500302, 500100, 3, '璧山高新区', '璧山高新区', '023', '402760', '106.214128', '29.574009', '106.220568', '29.580246', NULL, '高新技术开发区');
INSERT INTO `yx_dev_region` VALUES (510000, 100000, 1, '四川省', '四川', NULL, NULL, '104.065735', '30.659462', '104.072215', '30.665531', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (510100, 510000, 2, '成都市', '成都', '028', '610000', '104.065735', '30.659462', '104.072215', '30.665531', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (510104, 510100, 3, '锦江区', '锦江', '028', '610000', '104.08347', '30.65614', '104.090033', '30.661939', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (510105, 510100, 3, '青羊区', '青羊', '028', '610000', '104.06151', '30.67387', '104.067958', '30.68', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (510106, 510100, 3, '金牛区', '金牛', '028', '610000', '104.05114', '30.69126', '104.057544', '30.697515', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (510107, 510100, 3, '武侯区', '武侯', '028', '610000', '104.04303', '30.64235', '104.049455', '30.648663', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (510108, 510100, 3, '成华区', '成华', '028', '610000', '104.10193', '30.65993', '104.108522', '30.665619', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (510112, 510100, 3, '龙泉驿区', '龙泉驿', '028', '610100', '104.27462', '30.55658', '104.281017', '30.562876', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (510113, 510100, 3, '青白江区', '青白江', '028', '610300', '104.251', '30.87841', '104.257512', '30.884432', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (510114, 510100, 3, '新都区', '新都', '028', '610500', '104.15921', '30.82314', '104.165603', '30.829448', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (510115, 510100, 3, '温江区', '温江', '028', '611130', '103.84881', '30.68444', '103.855368', '30.690175', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (510116, 510100, 3, '双流区', '双流', '028', '610200', '103.92373', '30.57444', '103.930121', '30.58074', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (510117, 510100, 3, '郫都区', '郫都', '028', '611730', '103.88717', '30.81054', '103.893664', '30.816488', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (510121, 510100, 3, '金堂县', '金堂', '028', '610400', '104.41195', '30.86195', '104.418392', '30.868209', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (510129, 510100, 3, '大邑县', '大邑', '028', '611300', '103.52075', '30.58738', '103.527281', '30.593232', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (510131, 510100, 3, '蒲江县', '蒲江', '028', '611600', '103.50616', '30.19667', '103.512731', '30.202371', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (510132, 510100, 3, '新津县', '新津', '028', '611400', '103.8114', '30.40983', '103.817834', '30.41609', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (510181, 510100, 3, '都江堰市', '都江堰', '028', '611800', '103.61941', '30.99825', '103.62602', '31.003944', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (510182, 510100, 3, '彭州市', '彭州', '028', '611900', '103.958', '30.99011', '103.964557', '30.995989', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (510183, 510100, 3, '邛崃市', '邛崃', '028', '611500', '103.46283', '30.41489', '103.469302', '30.421005', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (510184, 510100, 3, '崇州市', '崇州', '028', '611200', '103.67285', '30.63014', '103.679284', '30.636435', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (510185, 510100, 3, '简阳市', '简阳', '028', '641400', '104.54864', '30.3904', '104.555153', '30.396428', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (510186, 510100, 3, '天府新区', '天府新区', '028', '610000', '104.069469', '30.523771', '104.075981', '30.529784', NULL, '国家级新区');
INSERT INTO `yx_dev_region` VALUES (510187, 510100, 3, '高新南区', '高新南区', '028', '610041', '104.067125', '30.595067', '104.073606', '30.601112', NULL, '高新技术开发区');
INSERT INTO `yx_dev_region` VALUES (510188, 510100, 3, '高新西区', '高新西区', '028', '611731', '103.930357', '30.766486', '103.93679', '30.772757', NULL, '高新技术开发区');
INSERT INTO `yx_dev_region` VALUES (510300, 510000, 2, '自贡市', '自贡', '0813', '643000', '104.773447', '29.352765', '104.779868', '29.359001', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (510302, 510300, 3, '自流井区', '自流井', '0813', '643000', '104.77719', '29.33745', '104.783638', '29.343646', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (510303, 510300, 3, '贡井区', '贡井', '0813', '643020', '104.71536', '29.34576', '104.721915', '29.35154', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (510304, 510300, 3, '大安区', '大安', '0813', '643010', '104.77383', '29.36364', '104.780246', '29.36987', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (510311, 510300, 3, '沿滩区', '沿滩', '0813', '643030', '104.88012', '29.26611', '104.886519', '29.272421', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (510321, 510300, 3, '荣县', '荣县', '0813', '643100', '104.4176', '29.44445', '104.424061', '29.450643', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (510322, 510300, 3, '富顺县', '富顺', '0813', '643200', '104.97491', '29.18123', '104.981405', '29.187315', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (510323, 510300, 3, '高新区', '高新区', '0813', '643000', '104.777732', '29.338939', '104.78418', '29.345128', NULL, '高新技术开发区');
INSERT INTO `yx_dev_region` VALUES (510400, 510000, 2, '攀枝花市', '攀枝花', '0812', '617000', '101.716007', '26.580446', '101.72256', '26.586242', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (510402, 510400, 3, '东区', '东区', '0812', '617000', '101.7052', '26.54677', '101.711796', '26.552481', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (510403, 510400, 3, '西区', '西区', '0812', '617000', '101.63058', '26.59753', '101.636994', '26.603795', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (510411, 510400, 3, '仁和区', '仁和', '0812', '617000', '101.73812', '26.49841', '101.74457', '26.504531', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (510421, 510400, 3, '米易县', '米易', '0812', '617200', '102.11132', '26.88718', '102.117755', '26.893457', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (510422, 510400, 3, '盐边县', '盐边', '0812', '617100', '101.85446', '26.68847', '101.860952', '26.694544', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (510500, 510000, 2, '泸州市', '泸州', '0830', '646000', '105.443348', '28.889138', '105.449858', '28.895025', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (510502, 510500, 3, '江阳区', '江阳', '0830', '646000', '105.45336', '28.88934', '105.459826', '28.89539', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (510503, 510500, 3, '纳溪区', '纳溪', '0830', '646300', '105.37255', '28.77343', '105.378963', '28.779675', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (510504, 510500, 3, '龙马潭区', '龙马潭', '0830', '646000', '105.43774', '28.91308', '105.444285', '28.918889', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (510521, 510500, 3, '泸县', '泸县', '0830', '646100', '105.38192', '29.15041', '105.388375', '29.156537', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (510522, 510500, 3, '合江县', '合江', '0830', '646200', '105.8352', '28.81005', '105.841626', '28.81636', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (510524, 510500, 3, '叙永县', '叙永', '0830', '646400', '105.44473', '28.15586', '105.451239', '28.16177', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (510525, 510500, 3, '古蔺县', '古蔺', '0830', '646500', '105.81347', '28.03867', '105.819939', '28.044723', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (510600, 510000, 2, '德阳市', '德阳', '0838', '618000', '104.398651', '31.127991', '104.405069', '31.134307', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (510603, 510600, 3, '旌阳区', '旌阳', '0838', '618000', '104.39367', '31.13906', '104.400083', '31.145356', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (510604, 510600, 3, '罗江区', '罗江', '0838', '618500', '104.51025', '31.31665', '104.516665', '31.322923', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (510623, 510600, 3, '中江县', '中江', '0838', '618100', '104.67861', '31.03297', '104.685139', '31.03883', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (510681, 510600, 3, '广汉市', '广汉', '0838', '618300', '104.28234', '30.97686', '104.288763', '30.983175', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (510682, 510600, 3, '什邡市', '什邡', '0838', '618400', '104.16754', '31.1264', '104.173966', '31.132692', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (510683, 510600, 3, '绵竹市', '绵竹', '0838', '618200', '104.22076', '31.33772', '104.227369', '31.343412', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (510700, 510000, 2, '绵阳市', '绵阳', '0816', '621000', '104.741722', '31.46402', '104.748186', '31.470206', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (510703, 510700, 3, '涪城区', '涪城', '0816', '621000', '104.75719', '31.45522', '104.76361', '31.461535', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (510704, 510700, 3, '游仙区', '游仙', '0816', '621000', '104.77092', '31.46574', '104.777359', '31.47201', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (510705, 510700, 3, '安州区', '安州', '0816', '622650', '104.56738', '31.53487', '104.573936', '31.540617', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (510722, 510700, 3, '三台县', '三台', '0816', '621100', '105.09079', '31.09179', '105.097297', '31.097806', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (510723, 510700, 3, '盐亭县', '盐亭', '0816', '621600', '105.3898', '31.22176', '105.396316', '31.227768', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (510725, 510700, 3, '梓潼县', '梓潼', '0816', '622150', '105.16183', '31.6359', '105.168371', '31.641713', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (510726, 510700, 3, '北川羌族自治县', '北川', '0816', '622750', '104.46408', '31.83286', '104.470692', '31.838559', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (510727, 510700, 3, '平武县', '平武', '0816', '622550', '104.52862', '32.40791', '104.53504', '32.414195', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (510781, 510700, 3, '江油市', '江油', '0816', '621700', '104.74539', '31.77775', '104.751804', '31.783971', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (510782, 510700, 3, '高新区', '高新区', '0816', '621000', '104.663939', '31.466187', '104.670428', '31.472291', NULL, '高新技术开发区');
INSERT INTO `yx_dev_region` VALUES (510783, 510700, 3, '经开区', '经开区', '0816', '621000', '104.78534', '31.415073', '104.791799', '31.421143', NULL, '经济技术开发区');
INSERT INTO `yx_dev_region` VALUES (510800, 510000, 2, '广元市', '广元', '0839', '628000', '105.829757', '32.433668', '105.836192', '32.439947', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (510802, 510800, 3, '利州区', '利州', '0839', '628017', '105.826194', '32.432276', '105.83264', '32.43852', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (510811, 510800, 3, '昭化区', '昭化', '0839', '628017', '105.640491', '32.386518', '105.647029', '32.392349', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (510812, 510800, 3, '朝天区', '朝天', '0839', '628000', '105.89273', '32.64398', '105.899325', '32.649686', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (510821, 510800, 3, '旺苍县', '旺苍', '0839', '628200', '106.29022', '32.22845', '106.296711', '32.234451', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (510822, 510800, 3, '青川县', '青川', '0839', '628100', '105.2391', '32.58563', '105.245497', '32.591944', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (510823, 510800, 3, '剑阁县', '剑阁', '0839', '628300', '105.5252', '32.28845', '105.531777', '32.294226', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (510824, 510800, 3, '苍溪县', '苍溪', '0839', '628400', '105.936', '31.73209', '105.942478', '31.738191', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (510900, 510000, 2, '遂宁市', '遂宁', '0825', '629000', '105.571331', '30.513311', '105.577844', '30.519339', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (510903, 510900, 3, '船山区', '船山', '0825', '629000', '105.5809', '30.49991', '105.587367', '30.506086', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (510904, 510900, 3, '安居区', '安居', '0825', '629000', '105.46402', '30.35778', '105.470457', '30.363991', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (510921, 510900, 3, '蓬溪县', '蓬溪', '0825', '629100', '105.70752', '30.75775', '105.713964', '30.764007', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (510922, 510900, 3, '射洪县', '射洪', '0825', '629200', '105.38922', '30.87203', '105.395735', '30.878048', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (510923, 510900, 3, '大英县', '大英', '0825', '629300', '105.24346', '30.59434', '105.249864', '30.600649', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (510924, 510900, 3, '经济技术开发区', '经济技术开发区', '0825', '629000', '105.565462', '30.543002', '105.571981', '30.548927', NULL, '经济技术开发区');
INSERT INTO `yx_dev_region` VALUES (511000, 510000, 2, '内江市', '内江', '0832', '641000', '105.066138', '29.58708', '105.072715', '29.592779', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (511002, 511000, 3, '市中区', '市中', '0832', '641000', '105.0679', '29.58709', '105.074474', '29.592799', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (511011, 511000, 3, '东兴区', '东兴', '0832', '641100', '105.07554', '29.59278', '105.082089', '29.59856', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (511024, 511000, 3, '威远县', '威远', '0832', '642450', '104.66955', '29.52823', '104.676056', '29.53424', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (511025, 511000, 3, '资中县', '资中', '0832', '641200', '104.85205', '29.76409', '104.858545', '29.770125', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (511083, 511000, 3, '隆昌市', '隆昌', '0832', '642150', '105.28738', '29.33937', '105.29395', '29.345121', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (511100, 510000, 2, '乐山市', '乐山', '0833', '614000', '103.761263', '29.582024', '103.7678', '29.587886', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (511102, 511100, 3, '市中区', '市中', '0833', '614000', '103.76159', '29.55543', '103.768146', '29.561303', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (511111, 511100, 3, '沙湾区', '沙湾', '0833', '614900', '103.54873', '29.41194', '103.555168', '29.418201', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (511112, 511100, 3, '五通桥区', '五通桥', '0833', '614800', '103.82345', '29.40344', '103.829924', '29.409546', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (511113, 511100, 3, '金口河区', '金口河', '0833', '614700', '103.07858', '29.24578', '103.084974', '29.252083', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (511123, 511100, 3, '犍为县', '犍为', '0833', '614400', '103.94989', '29.20973', '103.956399', '29.215735', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (511124, 511100, 3, '井研县', '井研', '0833', '613100', '104.07019', '29.65228', '104.076702', '29.65828', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (511126, 511100, 3, '夹江县', '夹江', '0833', '614100', '103.57199', '29.73868', '103.578401', '29.744927', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (511129, 511100, 3, '沐川县', '沐川', '0833', '614500', '103.90353', '28.95646', '103.909992', '28.962668', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (511132, 511100, 3, '峨边彝族自治县', '峨边', '0833', '614300', '103.26339', '29.23004', '103.269967', '29.235732', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (511133, 511100, 3, '马边彝族自治县', '马边', '0833', '614600', '103.54617', '28.83593', '103.552624', '28.842168', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (511181, 511100, 3, '峨眉山市', '峨眉山', '0833', '614200', '103.4844', '29.60117', '103.490944', '29.606953', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (511300, 510000, 2, '南充市', '南充', '0817', '637000', '106.082974', '30.795281', '106.089369', '30.801591', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (511302, 511300, 3, '顺庆区', '顺庆', '0817', '637000', '106.09216', '30.79642', '106.098571', '30.802672', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (511303, 511300, 3, '高坪区', '高坪', '0817', '637100', '106.11894', '30.78162', '106.12548', '30.787476', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (511304, 511300, 3, '嘉陵区', '嘉陵', '0817', '637500', '106.07141', '30.75848', '106.077844', '30.764772', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (511321, 511300, 3, '南部县', '南部', '0817', '637300', '106.06738', '31.35451', '106.073824', '31.360767', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (511322, 511300, 3, '营山县', '营山', '0817', '637700', '106.56637', '31.07747', '106.572779', '31.083771', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (511323, 511300, 3, '蓬安县', '蓬安', '0817', '637800', '106.41262', '31.02964', '106.419098', '31.035681', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (511324, 511300, 3, '仪陇县', '仪陇', '0817', '637600', '106.29974', '31.27628', '106.30618', '31.282431', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (511325, 511300, 3, '西充县', '西充', '0817', '637200', '105.89996', '30.9969', '105.906571', '31.002588', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (511381, 511300, 3, '阆中市', '阆中', '0817', '637400', '106.00494', '31.55832', '106.011505', '31.564095', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (511400, 510000, 2, '眉山市', '眉山', '028', '620000', '103.831788', '30.048318', '103.838307', '30.054292', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (511402, 511400, 3, '东坡区', '东坡', '028', '620000', '103.832', '30.04219', '103.838525', '30.048162', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (511403, 511400, 3, '彭山区', '彭山', '028', '620860', '103.87268', '30.19283', '103.879239', '30.198581', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (511421, 511400, 3, '仁寿县', '仁寿', '028', '620500', '104.13412', '29.99599', '104.140597', '30.002056', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (511423, 511400, 3, '洪雅县', '洪雅', '028', '620300', '103.37313', '29.90661', '103.379733', '29.912325', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (511424, 511400, 3, '丹棱县', '丹棱', '028', '620200', '103.51339', '30.01562', '103.519973', '30.021387', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (511425, 511400, 3, '青神县', '青神', '028', '620400', '103.84771', '29.83235', '103.85427', '29.838097', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (511500, 510000, 2, '宜宾市', '宜宾', '0831', '644000', '104.630825', '28.760189', '104.637232', '28.766463', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (511502, 511500, 3, '翠屏区', '翠屏', '0831', '644000', '104.61978', '28.76566', '104.626219', '28.771809', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (511503, 511500, 3, '南溪区', '南溪', '0831', '644100', '104.981133', '28.839806', '104.987602', '28.845984', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (511504, 511500, 3, '叙州区', '叙州', '0831', '644600', '104.53314', '28.68996', '104.539583', '28.696205', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (511523, 511500, 3, '江安县', '江安', '0831', '644200', '105.06683', '28.72385', '105.073425', '28.729559', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (511524, 511500, 3, '长宁县', '长宁', '0831', '644300', '104.9252', '28.57777', '104.931777', '28.583549', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (511525, 511500, 3, '高县', '高县', '0831', '645150', '104.51754', '28.43619', '104.523952', '28.4425', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (511526, 511500, 3, '珙县', '珙县', '0831', '644500', '104.71398', '28.44512', '104.720549', '28.450888', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (511527, 511500, 3, '筠连县', '筠连', '0831', '645250', '104.51217', '28.16495', '104.518574', '28.171233', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (511528, 511500, 3, '兴文县', '兴文', '0831', '644400', '105.23675', '28.3044', '105.243152', '28.310707', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (511529, 511500, 3, '屏山县', '屏山', '0831', '645350', '104.16293', '28.64369', '104.169327', '28.649994', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (511600, 510000, 2, '广安市', '广安', '0826', '638000', '106.633369', '30.456398', '106.639921', '30.462148', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (511602, 511600, 3, '广安区', '广安', '0826', '638550', '106.64163', '30.47389', '106.648163', '30.479753', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (511603, 511600, 3, '前锋区', '前锋', '0826', '638019', '106.893537', '30.494572', '106.900033', '30.500635', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (511621, 511600, 3, '岳池县', '岳池', '0826', '638300', '106.44079', '30.53918', '106.447199', '30.545499', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (511622, 511600, 3, '武胜县', '武胜', '0826', '638400', '106.29592', '30.34932', '106.302382', '30.355414', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (511623, 511600, 3, '邻水县', '邻水', '0826', '638500', '106.92968', '30.33449', '106.936082', '30.340765', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (511681, 511600, 3, '华蓥市', '华蓥', '0826', '409800', '106.78466', '30.39007', '106.791116', '30.396298', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (511700, 510000, 2, '达州市', '达州', '0818', '635000', '107.502262', '31.209484', '107.508715', '31.21568', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (511702, 511700, 3, '通川区', '通川', '0818', '635000', '107.50456', '31.21469', '107.511009', '31.220917', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (511703, 511700, 3, '达川区', '达川', '0818', '635000', '107.502262', '31.209484', '107.508715', '31.21568', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (511722, 511700, 3, '宣汉县', '宣汉', '0818', '636150', '107.72775', '31.35516', '107.73428', '31.361127', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (511723, 511700, 3, '开江县', '开江', '0818', '636250', '107.86889', '31.0841', '107.875316', '31.090372', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (511724, 511700, 3, '大竹县', '大竹', '0818', '635100', '107.20855', '30.74147', '107.215143', '30.747209', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (511725, 511700, 3, '渠县', '渠县', '0818', '635200', '106.97381', '30.8376', '106.980395', '30.843295', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (511781, 511700, 3, '万源市', '万源', '0818', '636350', '108.03598', '32.08091', '108.042526', '32.086815', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (511800, 510000, 2, '雅安市', '雅安', '0835', '625000', '103.001033', '29.987722', '103.007571', '29.99355', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (511802, 511800, 3, '雨城区', '雨城', '0835', '625000', '103.03305', '30.00531', '103.039625', '30.011072', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (511803, 511800, 3, '名山区', '名山', '0835', '625100', '103.112214', '30.084718', '103.118706', '30.090677', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (511822, 511800, 3, '荥经县', '荥经', '0835', '625200', '102.84652', '29.79402', '102.852955', '29.800316', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (511823, 511800, 3, '汉源县', '汉源', '0835', '625300', '102.6784', '29.35168', '102.684939', '29.357501', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (511824, 511800, 3, '石棉县', '石棉', '0835', '625400', '102.35943', '29.22796', '102.365835', '29.234265', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (511825, 511800, 3, '天全县', '天全', '0835', '625500', '102.75906', '30.06754', '102.765594', '30.073397', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (511826, 511800, 3, '芦山县', '芦山', '0835', '625600', '102.92791', '30.14369', '102.934438', '30.149662', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (511827, 511800, 3, '宝兴县', '宝兴', '0835', '625700', '102.81555', '30.36836', '102.822032', '30.374451', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (511900, 510000, 2, '巴中市', '巴中', '0827', '636600', '106.753669', '31.858809', '106.760242', '31.864568', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (511902, 511900, 3, '巴州区', '巴州', '0827', '636600', '106.76889', '31.85125', '106.775404', '31.857234', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (511903, 511900, 3, '恩阳区', '恩阳', '0827', '636064', '106.753669', '31.858809', '106.760242', '31.864568', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (511921, 511900, 3, '通江县', '通江', '0827', '636700', '107.24398', '31.91294', '107.250503', '31.918838', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (511922, 511900, 3, '南江县', '南江', '0827', '635600', '106.84164', '32.35335', '106.848183', '32.359163', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (511923, 511900, 3, '平昌县', '平昌', '0827', '636400', '107.10424', '31.5594', '107.110832', '31.565086', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (512000, 510000, 2, '资阳市', '资阳', '028', '641300', '104.641917', '30.122211', '104.648329', '30.128524', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (512002, 512000, 3, '雁江区', '雁江', '028', '641300', '104.65216', '30.11525', '104.658583', '30.121501', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (512021, 512000, 3, '安岳县', '安岳', '028', '642350', '105.3363', '30.09786', '105.342753', '30.103957', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (512022, 512000, 3, '乐至县', '乐至', '028', '641500', '105.03207', '30.27227', '105.038599', '30.278241', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (513200, 510000, 2, '阿坝藏族羌族自治州', '阿坝', '0837', '624000', '102.221374', '31.899792', '102.227804', '31.905959', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (513201, 513200, 3, '马尔康市', '马尔康', '0837', '624000', '102.20625', '31.90584', '102.212756', '31.911776', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (513221, 513200, 3, '汶川县', '汶川', '0837', '623000', '103.59079', '31.47326', '103.597313', '31.479253', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (513222, 513200, 3, '理县', '理县', '0837', '623100', '103.17175', '31.43603', '103.178237', '31.442057', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (513223, 513200, 3, '茂县', '茂县', '0837', '623200', '103.85372', '31.682', '103.860312', '31.687706', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (513224, 513200, 3, '松潘县', '松潘', '0837', '623300', '103.59924', '32.63871', '103.605784', '32.644565', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (513225, 513200, 3, '九寨沟县', '九寨沟', '0837', '623400', '104.23672', '33.26318', '104.243302', '33.268985', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (513226, 513200, 3, '金川县', '金川', '0837', '624100', '102.06555', '31.47623', '102.072159', '31.481942', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (513227, 513200, 3, '小金县', '小金', '0837', '624200', '102.36499', '30.99934', '102.371417', '31.005642', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (513228, 513200, 3, '黑水县', '黑水', '0837', '623500', '102.99176', '32.06184', '102.998286', '32.067817', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (513230, 513200, 3, '壤塘县', '壤塘', '0837', '624300', '100.9783', '32.26578', '100.984884', '32.271474', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (513231, 513200, 3, '阿坝县', '阿坝', '0837', '624600', '101.70632', '32.90301', '101.712931', '32.908727', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (513232, 513200, 3, '若尔盖县', '若尔盖', '0837', '624500', '102.9598', '33.57432', '102.966181', '33.580623', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (513233, 513200, 3, '红原县', '红原', '0837', '624400', '102.54525', '32.78989', '102.551864', '32.7956', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (513300, 510000, 2, '甘孜藏族自治州', '甘孜', '0836', '626000', '101.963815', '30.050663', '101.970353', '30.056568', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (513301, 513300, 3, '康定市', '康定', '0836', '626000', '101.96487', '30.05532', '101.971399', '30.06124', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (513322, 513300, 3, '泸定县', '泸定', '0836', '626100', '102.23507', '29.91475', '102.241502', '29.921052', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (513323, 513300, 3, '丹巴县', '丹巴', '0836', '626300', '101.88424', '30.87656', '101.890668', '30.882864', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (513324, 513300, 3, '九龙县', '九龙', '0836', '616200', '101.50848', '29.00091', '101.514891', '29.007156', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (513325, 513300, 3, '雅江县', '雅江', '0836', '627450', '101.01492', '30.03281', '101.021416', '30.038893', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (513326, 513300, 3, '道孚县', '道孚', '0836', '626400', '101.12554', '30.98046', '101.132078', '30.986395', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (513327, 513300, 3, '炉霍县', '炉霍', '0836', '626500', '100.67681', '31.3917', '100.683206', '31.397994', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (513328, 513300, 3, '甘孜县', '甘孜', '0836', '626700', '99.99307', '31.62672', '99.999579', '31.63267', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (513329, 513300, 3, '新龙县', '新龙', '0836', '626800', '100.3125', '30.94067', '100.318898', '30.946943', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (513330, 513300, 3, '德格县', '德格', '0836', '627250', '98.58078', '31.80615', '98.587381', '31.811856', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (513331, 513300, 3, '白玉县', '白玉', '0836', '627150', '98.82568', '31.20902', '98.832278', '31.214739', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (513332, 513300, 3, '石渠县', '石渠', '0836', '627350', '98.10156', '32.97884', '98.108142', '32.984541', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (513333, 513300, 3, '色达县', '色达', '0836', '626600', '100.33224', '32.26839', '100.338652', '32.274628', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (513334, 513300, 3, '理塘县', '理塘', '0836', '624300', '100.27005', '29.99674', '100.276625', '30.002479', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (513335, 513300, 3, '巴塘县', '巴塘', '0836', '627650', '99.10409', '30.00423', '99.110534', '30.010431', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (513336, 513300, 3, '乡城县', '乡城', '0836', '627850', '99.79943', '28.93554', '99.80599', '28.941387', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (513337, 513300, 3, '稻城县', '稻城', '0836', '627750', '100.29809', '29.0379', '100.304552', '29.044023', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (513338, 513300, 3, '得荣县', '得荣', '0836', '627950', '99.28628', '28.71297', '99.292864', '28.718751', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (513400, 510000, 2, '凉山彝族自治州', '凉山', '0834', '615000', '102.258746', '27.886762', '102.265212', '27.892936', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (513401, 513400, 3, '西昌市', '西昌', '0834', '615000', '102.26413', '27.89524', '102.270609', '27.901334', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (513422, 513400, 3, '木里藏族自治县', '木里', '0834', '615800', '101.2796', '27.92875', '101.285997', '27.935048', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (513423, 513400, 3, '盐源县', '盐源', '0834', '615700', '101.5097', '27.42177', '101.516128', '27.428031', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (513424, 513400, 3, '德昌县', '德昌', '0834', '615500', '102.18017', '27.40482', '102.186766', '27.410517', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (513425, 513400, 3, '会理县', '会理', '0834', '615100', '102.24539', '26.65627', '102.251828', '26.662568', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (513426, 513400, 3, '会东县', '会东', '0834', '615200', '102.57815', '26.63429', '102.584611', '26.640416', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (513427, 513400, 3, '宁南县', '宁南', '0834', '615400', '102.76116', '27.06567', '102.767699', '27.071498', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (513428, 513400, 3, '普格县', '普格', '0834', '615300', '102.54055', '27.37485', '102.547146', '27.380546', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (513429, 513400, 3, '布拖县', '布拖', '0834', '615350', '102.81234', '27.7079', '102.818818', '27.713935', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (513430, 513400, 3, '金阳县', '金阳', '0834', '616250', '103.24774', '27.69698', '103.254289', '27.702727', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (513431, 513400, 3, '昭觉县', '昭觉', '0834', '616150', '102.84661', '28.01155', '102.853039', '28.017842', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (513432, 513400, 3, '喜德县', '喜德', '0834', '616750', '102.41336', '28.30739', '102.419928', '28.313098', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (513433, 513400, 3, '冕宁县', '冕宁', '0834', '615600', '102.17108', '28.55161', '102.177648', '28.557334', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (513434, 513400, 3, '越西县', '越西', '0834', '616650', '102.5079', '28.64133', '102.514373', '28.647359', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (513435, 513400, 3, '甘洛县', '甘洛', '0834', '616850', '102.77154', '28.96624', '102.778131', '28.971965', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (513436, 513400, 3, '美姑县', '美姑', '0834', '616450', '103.13116', '28.32596', '103.137742', '28.331685', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (513437, 513400, 3, '雷波县', '雷波', '0834', '616550', '103.57287', '28.26407', '103.5793', '28.270312', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (520000, 100000, 1, '贵州省', '贵州', NULL, NULL, '106.713478', '26.578343', '106.719994', '26.584285', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (520100, 520000, 2, '贵阳市', '贵阳', '0851', '550000', '106.713478', '26.578343', '106.719994', '26.584285', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (520102, 520100, 3, '南明区', '南明', '0851', '550000', '106.7145', '26.56819', '106.72103', '26.574118', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (520103, 520100, 3, '云岩区', '云岩', '0851', '550000', '106.72485', '26.60484', '106.731387', '26.610611', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (520111, 520100, 3, '花溪区', '花溪', '0851', '550000', '106.67688', '26.43343', '106.683321', '26.439751', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (520112, 520100, 3, '乌当区', '乌当', '0851', '550000', '106.7521', '26.6302', '106.758655', '26.63594', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (520113, 520100, 3, '白云区', '白云', '0851', '550000', '106.63088', '26.68284', '106.637463', '26.688574', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (520115, 520100, 3, '观山湖区', '观山湖', '0851', '550009', '106.625442', '26.618209', '106.632001', '26.623898', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (520121, 520100, 3, '开阳县', '开阳', '0851', '550300', '106.9692', '27.05533', '106.975773', '27.06106', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (520122, 520100, 3, '息烽县', '息烽', '0851', '551100', '106.738', '27.09346', '106.744562', '27.099137', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (520123, 520100, 3, '修文县', '修文', '0851', '550200', '106.59487', '26.83783', '106.601375', '26.843745', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (520181, 520100, 3, '清镇市', '清镇', '0851', '551400', '106.46862', '26.55261', '106.475133', '26.558638', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (520182, 520100, 3, '贵安新区', '贵安新区', '0851', '550003', '106.630154', '26.647661', '106.63673', '26.653387', NULL, '国家级新区');
INSERT INTO `yx_dev_region` VALUES (520183, 520100, 3, '高新区', '高新区', '0851', '550003', '106.645697', '26.620716', '106.652198', '26.62664', NULL, '高新技术开发区');
INSERT INTO `yx_dev_region` VALUES (520200, 520000, 2, '六盘水市', '六盘水', '0858', '553000', '104.846743', '26.584643', '104.853252', '26.590588', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (520201, 520200, 3, '钟山区', '钟山', '0858', '553000', '104.87848', '26.57699', '104.884904', '26.583304', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (520203, 520200, 3, '六枝特区', '六枝', '0858', '553400', '105.48062', '26.20117', '105.487058', '26.20749', '行政区', '特区');
INSERT INTO `yx_dev_region` VALUES (520221, 520200, 3, '水城县', '水城', '0858', '553600', '104.95764', '26.54785', '104.964207', '26.553665', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (520281, 520200, 3, '盘州市', '盘州', '0858', '553500', '104.47061', '25.7136', '104.477195', '25.719338', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (520300, 520000, 2, '遵义市', '遵义', '0851', '563000', '106.937265', '27.706626', '106.943701', '27.712821', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (520302, 520300, 3, '红花岗区', '红花岗', '0851', '563000', '106.89404', '27.64471', '106.900536', '27.650781', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (520303, 520300, 3, '汇川区', '汇川', '0851', '563000', '106.9393', '27.70625', '106.945743', '27.712417', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (520304, 520300, 3, '播州区', '播州', '0851', '563100', '106.83331', '27.53772', '106.839827', '27.543665', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (520322, 520300, 3, '桐梓县', '桐梓', '0851', '563200', '106.82568', '28.13806', '106.832163', '28.144132', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (520323, 520300, 3, '绥阳县', '绥阳', '0851', '563300', '107.19064', '27.94702', '107.197131', '27.953006', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (520324, 520300, 3, '正安县', '正安', '0851', '563400', '107.44357', '28.5512', '107.450117', '28.556987', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (520325, 520300, 3, '道真仡佬族苗族自治县', '道真', '0851', '563500', '107.61152', '28.864', '107.618009', '28.870025', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (520326, 520300, 3, '务川仡佬族苗族自治县', '务川', '0851', '564300', '107.88935', '28.52227', '107.895757', '28.528551', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (520327, 520300, 3, '凤冈县', '凤冈', '0851', '564200', '107.71682', '27.95461', '107.723368', '27.960403', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (520328, 520300, 3, '湄潭县', '湄潭', '0851', '564100', '107.48779', '27.76676', '107.494312', '27.772726', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (520329, 520300, 3, '余庆县', '余庆', '0851', '564400', '107.88821', '27.22532', '107.894622', '27.231611', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (520330, 520300, 3, '习水县', '习水', '0851', '564600', '106.21267', '28.31976', '106.219103', '28.326011', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (520381, 520300, 3, '赤水市', '赤水', '0851', '564700', '105.69845', '28.58921', '105.704933', '28.595351', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (520382, 520300, 3, '仁怀市', '仁怀', '0851', '564500', '106.40152', '27.79231', '106.408044', '27.79817', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (520400, 520000, 2, '安顺市', '安顺', '0851', '561000', '105.932188', '26.245544', '105.93866', '26.251576', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (520402, 520400, 3, '西秀区', '西秀', '0851', '561000', '105.96585', '26.24491', '105.972256', '26.251208', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (520403, 520400, 3, '平坝区', '平坝', '0851', '561100', '106.25683', '26.40543', '106.263414', '26.411117', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (520422, 520400, 3, '普定县', '普定', '0851', '562100', '105.74285', '26.30141', '105.749339', '26.30753', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (520423, 520400, 3, '镇宁布依族苗族自治县', '镇宁', '0851', '561200', '105.76513', '26.05533', '105.7717', '26.061108', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (520424, 520400, 3, '关岭布依族苗族自治县', '关岭', '0851', '561300', '105.61883', '25.94248', '105.625305', '25.948659', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (520425, 520400, 3, '紫云苗族布依族自治县', '紫云', '0851', '550800', '106.08364', '25.75258', '106.090052', '25.75889', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (520500, 520000, 2, '毕节市', '毕节', '0857', '551700', '105.28501', '27.301693', '105.291566', '27.307469', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (520502, 520500, 3, '七星关区', '七星关', '0857', '551700', '104.9497', '27.153556', '104.95629', '27.159286', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (520521, 520500, 3, '大方县', '大方', '0857', '551600', '105.609254', '27.143521', '105.6157', '27.149806', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (520522, 520500, 3, '黔西县', '黔西', '0857', '551500', '106.038299', '27.024923', '106.044864', '27.030745', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (520523, 520500, 3, '金沙县', '金沙', '0857', '551800', '106.222103', '27.459693', '106.228553', '27.465817', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (520524, 520500, 3, '织金县', '织金', '0857', '552100', '105.768997', '26.668497', '105.775583', '26.674236', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (520525, 520500, 3, '纳雍县', '纳雍', '0857', '553300', '105.375322', '26.769875', '105.381776', '26.776097', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (520526, 520500, 3, '威宁彝族回族苗族自治县', '威宁', '0857', '553100', '104.286523', '26.859099', '104.29293', '26.865389', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (520527, 520500, 3, '赫章县', '赫章', '0857', '553200', '104.726438', '27.119243', '104.732952', '27.125185', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (520600, 520000, 2, '铜仁市', '铜仁', '0856', '554300', '109.191555', '27.718346', '109.197978', '27.724642', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (520602, 520600, 3, '碧江区', '碧江', '0856', '554300', '109.191555', '27.718346', '109.197978', '27.724642', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (520603, 520600, 3, '万山区', '万山', '0856', '554200', '109.21199', '27.51903', '109.21844', '27.5253', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (520621, 520600, 3, '江口县', '江口', '0856', '554400', '108.848427', '27.691904', '108.854833', '27.698194', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (520622, 520600, 3, '玉屏侗族自治县', '玉屏', '0856', '554004', '108.917882', '27.238024', '108.924428', '27.24383', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (520623, 520600, 3, '石阡县', '石阡', '0856', '555100', '108.229854', '27.519386', '108.2363', '27.52567', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (520624, 520600, 3, '思南县', '思南', '0856', '565100', '108.255827', '27.941331', '108.262254', '27.947546', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (520625, 520600, 3, '印江土家族苗族自治县', '印江', '0856', '555200', '108.405517', '27.997976', '108.412096', '28.003744', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (520626, 520600, 3, '德江县', '德江', '0856', '565200', '108.117317', '28.26094', '108.123732', '28.267261', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (520627, 520600, 3, '沿河土家族自治县', '沿河', '0856', '565300', '108.495746', '28.560487', '108.502188', '28.566708', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (520628, 520600, 3, '松桃苗族自治县', '松桃', '0856', '554100', '109.202627', '28.165419', '109.209024', '28.171739', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (522300, 520000, 2, '黔西南布依族苗族自治州', '黔西南', '0859', '562400', '104.897971', '25.08812', '104.904435', '25.094307', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (522301, 522300, 3, '兴义市 ', '兴义', '0859', '562400', '104.89548', '25.09205', '104.90194', '25.09827', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (522302, 522300, 3, '兴仁市', '兴仁', '0859', '562300', '105.18652', '25.43282', '105.193085', '25.438521', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (522323, 522300, 3, '普安县', '普安', '0859', '561500', '104.95529', '25.78603', '104.961831', '25.791808', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (522324, 522300, 3, '晴隆县', '晴隆', '0859', '561400', '105.2192', '25.83522', '105.225683', '25.841371', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (522325, 522300, 3, '贞丰县', '贞丰', '0859', '562200', '105.65454', '25.38464', '105.661108', '25.390335', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (522326, 522300, 3, '望谟县', '望谟', '0859', '552300', '106.09957', '25.17822', '106.106013', '25.184381', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (522327, 522300, 3, '册亨县', '册亨', '0859', '552200', '105.8124', '24.98376', '105.818909', '24.989804', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (522328, 522300, 3, '安龙县', '安龙', '0859', '552400', '105.44268', '25.09818', '105.449224', '25.104065', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (522600, 520000, 2, '黔东南苗族侗族自治州', '黔东南', '0855', '556000', '107.977488', '26.583352', '107.983954', '26.589475', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (522601, 522600, 3, '凯里市', '凯里', '0855', '556000', '107.98132', '26.56689', '107.987788', '26.573074', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (522622, 522600, 3, '黄平县', '黄平', '0855', '556100', '107.90179', '26.89573', '107.908271', '26.901868', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (522623, 522600, 3, '施秉县', '施秉', '0855', '556200', '108.12597', '27.03495', '108.132412', '27.041263', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (522624, 522600, 3, '三穗县', '三穗', '0855', '556500', '108.67132', '26.94765', '108.677879', '26.953378', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (522625, 522600, 3, '镇远县', '镇远', '0855', '557700', '108.42721', '27.04933', '108.433796', '27.05503', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (522626, 522600, 3, '岑巩县', '岑巩', '0855', '557800', '108.81884', '27.17539', '108.825308', '27.181537', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (522627, 522600, 3, '天柱县', '天柱', '0855', '556600', '109.20718', '26.90781', '109.213624', '26.914119', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (522628, 522600, 3, '锦屏县', '锦屏', '0855', '556700', '109.19982', '26.67635', '109.206258', '26.682682', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (522629, 522600, 3, '剑河县', '剑河', '0855', '556400', '108.5913', '26.6525', '108.59774', '26.658795', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (522630, 522600, 3, '台江县', '台江', '0855', '556300', '108.31814', '26.66916', '108.324706', '26.674976', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (522631, 522600, 3, '黎平县', '黎平', '0855', '557300', '109.13607', '26.23114', '109.142636', '26.236817', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (522632, 522600, 3, '榕江县', '榕江', '0855', '557200', '108.52072', '25.92421', '108.527266', '25.930038', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (522633, 522600, 3, '从江县', '从江', '0855', '557400', '108.90527', '25.75415', '108.911831', '25.759833', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (522634, 522600, 3, '雷山县', '雷山', '0855', '557100', '108.07745', '26.38385', '108.083984', '26.389648', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (522635, 522600, 3, '麻江县', '麻江', '0855', '557600', '107.59155', '26.49235', '107.598096', '26.49808', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (522636, 522600, 3, '丹寨县', '丹寨', '0855', '557500', '107.79718', '26.19816', '107.803727', '26.204046', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (522700, 520000, 2, '黔南布依族苗族自治州', '黔南', '0854', '558000', '107.517156', '26.258219', '107.52356', '26.264534', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (522701, 522700, 3, '都匀市', '都匀', '0854', '558000', '107.51872', '26.2594', '107.525124', '26.265718', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (522702, 522700, 3, '福泉市', '福泉', '0854', '550500', '107.51715', '26.67989', '107.523588', '26.686213', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (522722, 522700, 3, '荔波县', '荔波', '0854', '558400', '107.88592', '25.4139', '107.892328', '25.420204', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (522723, 522700, 3, '贵定县', '贵定', '0854', '551300', '107.23654', '26.57812', '107.243094', '26.583912', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (522725, 522700, 3, '瓮安县', '瓮安', '0854', '550400', '107.4757', '27.06813', '107.482247', '27.073909', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (522726, 522700, 3, '独山县', '独山', '0854', '558200', '107.54101', '25.8245', '107.547494', '25.830651', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (522727, 522700, 3, '平塘县', '平塘', '0854', '558300', '107.32428', '25.83294', '107.330852', '25.838726', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (522728, 522700, 3, '罗甸县', '罗甸', '0854', '550100', '106.75186', '25.42586', '106.758409', '25.431596', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (522729, 522700, 3, '长顺县', '长顺', '0854', '550700', '106.45217', '26.02299', '106.458592', '26.029243', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (522730, 522700, 3, '龙里县', '龙里', '0854', '551200', '106.97662', '26.45076', '106.983207', '26.456446', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (522731, 522700, 3, '惠水县', '惠水', '0854', '550600', '106.65911', '26.13389', '106.665555', '26.140032', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (522732, 522700, 3, '三都水族自治县', '三都', '0854', '558100', '107.87464', '25.98562', '107.881059', '25.99193', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (530000, 100000, 1, '云南省', '云南', NULL, NULL, '102.712251', '25.040609', '102.718665', '25.046888', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (530100, 530000, 2, '昆明市', '昆明', '0871', '650000', '102.712251', '25.040609', '102.718665', '25.046888', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (530102, 530100, 3, '五华区', '五华', '0871', '650000', '102.70786', '25.03521', '102.714286', '25.041455', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (530103, 530100, 3, '盘龙区', '盘龙', '0871', '650000', '102.71994', '25.04053', '102.726348', '25.046834', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (530111, 530100, 3, '官渡区', '官渡', '0871', '650200', '102.74362', '25.01497', '102.7501', '25.021072', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (530112, 530100, 3, '西山区', '西山', '0871', '650100', '102.66464', '25.03796', '102.671197', '25.043657', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (530113, 530100, 3, '东川区', '东川', '0871', '654100', '103.18832', '26.083', '103.194771', '26.089257', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (530114, 530100, 3, '呈贡区', '呈贡', '0871', '650500', '102.801382', '24.889275', '102.807925', '24.895143', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (530115, 530100, 3, '晋宁区', '晋宁', '0871', '650600', '102.59393', '24.6665', '102.600353', '24.672791', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (530124, 530100, 3, '富民县', '富民', '0871', '650400', '102.4985', '25.22119', '102.504975', '25.227368', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (530125, 530100, 3, '宜良县', '宜良', '0871', '652100', '103.14117', '24.91705', '103.147729', '24.922737', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (530126, 530100, 3, '石林彝族自治县', '石林', '0871', '652200', '103.27148', '24.75897', '103.278059', '24.764719', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (530127, 530100, 3, '嵩明县', '嵩明', '0871', '651700', '103.03729', '25.33986', '103.043854', '25.345673', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (530128, 530100, 3, '禄劝彝族苗族自治县', '禄劝', '0871', '651500', '102.4671', '25.55387', '102.473534', '25.560108', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (530129, 530100, 3, '寻甸回族彝族自治县 ', '寻甸', '0871', '655200', '103.2557', '25.55961', '103.262274', '25.565308', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (530181, 530100, 3, '安宁市', '安宁', '0871', '650300', '102.46972', '24.91652', '102.476141', '24.92278', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (530182, 530100, 3, '滇中新区', '滇中新区', '0871', '650000', '102.712251', '25.040609', '102.718665', '25.046888', NULL, '国家级新区');
INSERT INTO `yx_dev_region` VALUES (530183, 530100, 3, '高新区', '高新区', '0871', '650000', '102.653544', '25.072794', '102.660108', '25.078502', NULL, '高新技术开发区');
INSERT INTO `yx_dev_region` VALUES (530300, 530000, 2, '曲靖市', '曲靖', '0874', '655000', '103.797851', '25.501557', '103.804273', '25.507866', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (530302, 530300, 3, '麒麟区', '麒麟', '0874', '655000', '103.80504', '25.49515', '103.811471', '25.501452', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (530303, 530300, 3, '沾益区', '沾益', '0874', '655331', '103.82135', '25.60715', '103.827828', '25.613289', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (530304, 530300, 3, '马龙区', '马龙', '0874', '655100', '103.57873', '25.42521', '103.585174', '25.43138', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (530322, 530300, 3, '陆良县', '陆良', '0874', '655600', '103.6665', '25.02335', '103.67294', '25.029586', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (530323, 530300, 3, '师宗县', '师宗', '0874', '655700', '103.99084', '24.82822', '103.997392', '24.833954', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (530324, 530300, 3, '罗平县', '罗平', '0874', '655800', '104.30859', '24.88444', '104.315099', '24.890466', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (530325, 530300, 3, '富源县', '富源', '0874', '655500', '104.25387', '25.66587', '104.260341', '25.67193', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (530326, 530300, 3, '会泽县', '会泽', '0874', '654200', '103.30017', '26.41076', '103.30664', '26.41692', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (530381, 530300, 3, '宣威市', '宣威', '0874', '655400', '104.10409', '26.2173', '104.11067', '26.222996', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (530400, 530000, 2, '玉溪市', '玉溪', '0877', '653100', '102.543907', '24.350461', '102.550469', '24.356158', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (530402, 530400, 3, '红塔区', '红塔', '0877', '653100', '102.5449', '24.35411', '102.551465', '24.359811', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (530403, 530400, 3, '江川区', '江川', '0877', '652600', '102.75412', '24.28863', '102.760647', '24.294567', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (530422, 530400, 3, '澄江县', '澄江', '0877', '652500', '102.90817', '24.67376', '102.914725', '24.679476', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (530423, 530400, 3, '通海县', '通海', '0877', '652700', '102.76641', '24.11362', '102.772958', '24.119385', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (530424, 530400, 3, '华宁县', '华宁', '0877', '652800', '102.92831', '24.1926', '102.934804', '24.19857', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (530425, 530400, 3, '易门县', '易门', '0877', '651100', '102.16354', '24.67122', '102.170077', '24.677018', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (530426, 530400, 3, '峨山彝族自治县', '峨山', '0877', '653200', '102.40576', '24.16904', '102.412324', '24.174817', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (530427, 530400, 3, '新平彝族傣族自治县', '新平', '0877', '653400', '101.98895', '24.06886', '101.995381', '24.075114', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (530428, 530400, 3, '元江哈尼族彝族傣族自治县', '元江', '0877', '653300', '101.99812', '23.59655', '102.004535', '23.602851', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (530500, 530000, 2, '保山市', '保山', '0875', '678000', '99.167133', '25.111802', '99.173711', '25.117574', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (530502, 530500, 3, '隆阳区', '隆阳', '0875', '678000', '99.16334', '25.11163', '99.169908', '25.117444', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (530521, 530500, 3, '施甸县', '施甸', '0875', '678200', '99.18768', '24.72418', '99.194252', '24.729907', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (530523, 530500, 3, '龙陵县', '龙陵', '0875', '678300', '98.69024', '24.58746', '98.696792', '24.593199', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (530524, 530500, 3, '昌宁县', '昌宁', '0875', '678100', '99.6036', '24.82763', '99.610015', '24.833921', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (530581, 530500, 3, '腾冲市', '腾冲', '0875', '679100', '98.49414', '25.02539', '98.500618', '25.031452', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (530600, 530000, 2, '昭通市', '昭通', '0870', '657000', '103.717216', '27.336999', '103.723728', '27.342879', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (530602, 530600, 3, '昭阳区', '昭阳', '0870', '657000', '103.70654', '27.31998', '103.713008', '27.326032', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (530621, 530600, 3, '鲁甸县', '鲁甸', '0870', '657100', '103.54721', '27.19238', '103.553634', '27.19862', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (530622, 530600, 3, '巧家县', '巧家', '0870', '654600', '102.92416', '26.91237', '102.930704', '26.918282', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (530623, 530600, 3, '盐津县', '盐津', '0870', '657500', '104.23461', '28.10856', '104.24119', '28.11434', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (530624, 530600, 3, '大关县', '大关', '0870', '657400', '103.89254', '27.7488', '103.899048', '27.754846', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (530625, 530600, 3, '永善县', '永善', '0870', '657300', '103.63504', '28.2279', '103.641619', '28.233686', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (530626, 530600, 3, '绥江县', '绥江', '0870', '657700', '103.94937', '28.59661', '103.955885', '28.602625', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (530627, 530600, 3, '镇雄县', '镇雄', '0870', '657200', '104.87258', '27.43981', '104.878987', '27.446097', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (530628, 530600, 3, '彝良县', '彝良', '0870', '657600', '104.04983', '27.62809', '104.056277', '27.634367', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (530629, 530600, 3, '威信县', '威信', '0870', '657900', '105.04754', '27.84065', '105.054107', '27.8464', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (530681, 530600, 3, '水富市', '水富', '0870', '657800', '104.4158', '28.62986', '104.422232', '28.636069', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (530700, 530000, 2, '丽江市', '丽江', '0888', '674100', '100.233026', '26.872108', '100.239531', '26.878058', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (530702, 530700, 3, '古城区', '古城', '0888', '674100', '100.2257', '26.87697', '100.232179', '26.883036', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (530721, 530700, 3, '玉龙纳西族自治县', '玉龙', '0888', '674100', '100.2369', '26.82149', '100.243427', '26.827383', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (530722, 530700, 3, '永胜县', '永胜', '0888', '674200', '100.74667', '26.68591', '100.753258', '26.691629', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (530723, 530700, 3, '华坪县', '华坪', '0888', '674800', '101.26562', '26.62967', '101.272052', '26.635889', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (530724, 530700, 3, '宁蒗彝族自治县', '宁蒗', '0888', '674300', '100.8507', '27.28179', '100.857288', '27.287527', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (530800, 530000, 2, '普洱市', '普洱', '0879', '665000', '100.972344', '22.777321', '100.978889', '22.783038', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (530802, 530800, 3, '思茅区', '思茅', '0879', '665000', '100.97716', '22.78691', '100.983715', '22.792608', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (530821, 530800, 3, '宁洱哈尼族彝族自治县', '宁洱', '0879', '665100', '101.04653', '23.06341', '101.052983', '23.0697', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (530822, 530800, 3, '墨江哈尼族自治县', '墨江', '0879', '654800', '101.69171', '23.43214', '101.698293', '23.437868', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (530823, 530800, 3, '景东彝族自治县', '景东', '0879', '676200', '100.83599', '24.44791', '100.842493', '24.453812', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (530824, 530800, 3, '景谷傣族彝族自治县', '景谷', '0879', '666400', '100.70251', '23.49705', '100.708965', '23.503161', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (530825, 530800, 3, '镇沅彝族哈尼族拉祜族自治县', '镇沅', '0879', '666500', '101.10675', '24.00557', '101.113323', '24.011287', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (530826, 530800, 3, '江城哈尼族彝族自治县', '江城', '0879', '665900', '101.85788', '22.58424', '101.864371', '22.590367', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (530827, 530800, 3, '孟连傣族拉祜族佤族自治县', '孟连', '0879', '665800', '99.58424', '22.32922', '99.590704', '22.335425', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (530828, 530800, 3, '澜沧拉祜族自治县', '澜沧', '0879', '665600', '99.93591', '22.55474', '99.942384', '22.56083', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (530829, 530800, 3, '西盟佤族自治县', '西盟', '0879', '665700', '99.59869', '22.64774', '99.605103', '22.654034', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (530900, 530000, 2, '临沧市', '临沧', '0883', '677000', '100.08697', '23.886567', '100.09341', '23.892849', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (530902, 530900, 3, '临翔区', '临翔', '0883', '677000', '100.08242', '23.89497', '100.088863', '23.901271', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (530921, 530900, 3, '凤庆县', '凤庆', '0883', '675900', '99.92837', '24.58034', '99.93486', '24.58631', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (530922, 530900, 3, '云县', '云县', '0883', '675800', '100.12808', '24.44675', '100.13462', '24.452502', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (530923, 530900, 3, '永德县', '永德', '0883', '677600', '99.25326', '24.0276', '99.259724', '24.033833', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (530924, 530900, 3, '镇康县', '镇康', '0883', '677700', '98.8255', '23.76241', '98.832071', '23.768126', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (530925, 530900, 3, '双江拉祜族佤族布朗族傣族自治县', '双江', '0883', '677300', '99.82769', '23.47349', '99.834121', '23.479726', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (530926, 530900, 3, '耿马傣族佤族自治县', '耿马', '0883', '677500', '99.39785', '23.53776', '99.404394', '23.543645', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (530927, 530900, 3, '沧源佤族自治县', '沧源', '0883', '677400', '99.24545', '23.14821', '99.251872', '23.154493', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (532300, 530000, 2, '楚雄彝族自治州', '楚雄', '0878', '675000', '101.546046', '25.041988', '101.552513', '25.048046', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (532301, 532300, 3, '楚雄市', '楚雄', '0878', '675000', '101.54615', '25.0329', '101.552623', '25.038958', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (532322, 532300, 3, '双柏县', '双柏', '0878', '675100', '101.64205', '24.68882', '101.648457', '24.695118', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (532323, 532300, 3, '牟定县', '牟定', '0878', '675500', '101.54', '25.31551', '101.546458', '25.321661', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (532324, 532300, 3, '南华县', '南华', '0878', '675200', '101.27313', '25.19293', '101.279552', '25.199213', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (532325, 532300, 3, '姚安县', '姚安', '0878', '675300', '101.24279', '25.50467', '101.249314', '25.510557', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (532326, 532300, 3, '大姚县', '大姚', '0878', '675400', '101.32397', '25.72218', '101.330537', '25.727981', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (532327, 532300, 3, '永仁县', '永仁', '0878', '651400', '101.6716', '26.05794', '101.678122', '26.063918', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (532328, 532300, 3, '元谋县', '元谋', '0878', '651300', '101.87728', '25.70438', '101.883722', '25.710687', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (532329, 532300, 3, '武定县', '武定', '0878', '651600', '102.4038', '25.5295', '102.410331', '25.535292', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (532331, 532300, 3, '禄丰县', '禄丰', '0878', '651200', '102.07797', '25.14815', '102.084506', '25.153968', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (532500, 530000, 2, '红河哈尼族彝族自治州', '红河', '0873', '661400', '103.384182', '23.366775', '103.390731', '23.372468', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (532501, 532500, 3, '个旧市', '个旧', '0873', '661000', '103.15966', '23.35894', '103.16618', '23.364777', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (532502, 532500, 3, '开远市', '开远', '0873', '661600', '103.26986', '23.71012', '103.276412', '23.715848', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (532503, 532500, 3, '蒙自市', '蒙自', '0873', '661101', '103.385005', '23.366843', '103.391553', '23.372539', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (532504, 532500, 3, '弥勒市', '弥勒', '0873', '652300', '103.436988', '24.40837', '103.443427', '24.414679', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (532523, 532500, 3, '屏边苗族自治县', '屏边', '0873', '661200', '103.68554', '22.98425', '103.69197', '22.990547', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (532524, 532500, 3, '建水县', '建水', '0873', '654300', '102.82656', '23.63472', '102.833001', '23.640954', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (532525, 532500, 3, '石屏县', '石屏', '0873', '662200', '102.49408', '23.71441', '102.500514', '23.720635', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (532527, 532500, 3, '泸西县', '泸西', '0873', '652400', '103.76373', '24.52854', '103.770265', '24.534442', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (532528, 532500, 3, '元阳县', '元阳', '0873', '662400', '102.83261', '23.22281', '102.839043', '23.229095', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (532529, 532500, 3, '红河县', '红河县', '0873', '654400', '102.42059', '23.36767', '102.427141', '23.373358', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (532530, 532500, 3, '金平苗族瑶族傣族自治县', '金平', '0873', '661500', '103.22651', '22.77959', '103.23298', '22.785642', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (532531, 532500, 3, '绿春县', '绿春', '0873', '662500', '102.39672', '22.99371', '102.403231', '22.999601', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (532532, 532500, 3, '河口瑶族自治县', '河口', '0873', '661300', '103.93936', '22.52929', '103.945805', '22.535451', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (532600, 530000, 2, '文山壮族苗族自治州', '文山', '0876', '663000', '104.24401', '23.36951', '104.250512', '23.375409', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (532601, 532600, 3, '文山市', '文山', '0876', '663000', '104.244277', '23.369216', '104.250778', '23.375119', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (532622, 532600, 3, '砚山县', '砚山', '0876', '663100', '104.33306', '23.60723', '104.339607', '23.612933', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (532623, 532600, 3, '西畴县', '西畴', '0876', '663500', '104.67419', '23.43941', '104.680722', '23.445346', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (532624, 532600, 3, '麻栗坡县', '麻栗坡', '0876', '663600', '104.70132', '23.12028', '104.707872', '23.125963', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (532625, 532600, 3, '马关县', '马关', '0876', '663700', '104.39514', '23.01293', '104.401554', '23.019229', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (532626, 532600, 3, '丘北县', '丘北', '0876', '663200', '104.19256', '24.03957', '104.199087', '24.045532', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (532627, 532600, 3, '广南县', '广南', '0876', '663300', '105.05511', '24.0464', '105.061693', '24.052098', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (532628, 532600, 3, '富宁县', '富宁', '0876', '663400', '105.63085', '23.62536', '105.63734', '23.631343', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (532800, 530000, 2, '西双版纳傣族自治州', '西双版纳', '0691', '666100', '100.797941', '22.001724', '100.804391', '22.008028', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (532801, 532800, 3, '景洪市', '景洪', '0691', '666100', '100.79977', '22.01071', '100.806213', '22.017014', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (532822, 532800, 3, '勐海县', '勐海', '0691', '666200', '100.44931', '21.96175', '100.455754', '21.968017', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (532823, 532800, 3, '勐腊县', '勐腊', '0691', '666300', '101.56488', '21.48162', '101.571427', '21.487406', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (532900, 530000, 2, '大理白族自治州', '大理', '0872', '671000', '100.240037', '25.592765', '100.246595', '25.598619', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (532901, 532900, 3, '大理市', '大理', '0872', '671000', '100.22998', '25.59157', '100.236499', '25.597575', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (532922, 532900, 3, '漾濞彝族自治县', '漾濞', '0872', '672500', '99.95474', '25.6652', '99.961152', '25.671485', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (532923, 532900, 3, '祥云县', '祥云', '0872', '672100', '100.55761', '25.47342', '100.564053', '25.479724', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (532924, 532900, 3, '宾川县', '宾川', '0872', '671600', '100.57666', '25.83144', '100.583129', '25.837639', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (532925, 532900, 3, '弥渡县', '弥渡', '0872', '675600', '100.49075', '25.34179', '100.497335', '25.347528', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (532926, 532900, 3, '南涧彝族自治县', '南涧', '0872', '675700', '100.50964', '25.04349', '100.516187', '25.049222', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (532927, 532900, 3, '巍山彝族回族自治县', '巍山', '0872', '672400', '100.30612', '25.23197', '100.312583', '25.2382', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (532928, 532900, 3, '永平县', '永平', '0872', '672600', '99.54095', '25.46451', '99.547545', '25.470216', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (532929, 532900, 3, '云龙县', '云龙', '0872', '672700', '99.37255', '25.88505', '99.37897', '25.891281', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (532930, 532900, 3, '洱源县', '洱源', '0872', '671200', '99.94903', '26.10829', '99.955456', '26.11454', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (532931, 532900, 3, '剑川县', '剑川', '0872', '671300', '99.90545', '26.53688', '99.912041', '26.542596', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (532932, 532900, 3, '鹤庆县', '鹤庆', '0872', '671500', '100.17697', '26.55798', '100.183459', '26.564092', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (533100, 530000, 2, '德宏傣族景颇族自治州', '德宏', '0692', '678400', '98.578363', '24.436694', '98.584921', '24.442396', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (533102, 533100, 3, '瑞丽市', '瑞丽', '0692', '678600', '97.85183', '24.01277', '97.858408', '24.018506', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (533103, 533100, 3, '芒市', '芒市', '0692', '678400', '98.588641', '24.433735', '98.595194', '24.439466', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (533122, 533100, 3, '梁河县', '梁河', '0692', '679200', '98.29705', '24.80658', '98.303484', '24.81276', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (533123, 533100, 3, '盈江县', '盈江', '0692', '679300', '97.93179', '24.70579', '97.938216', '24.712026', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (533124, 533100, 3, '陇川县', '陇川', '0692', '678700', '97.79199', '24.18302', '97.798421', '24.189287', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (533300, 530000, 2, '怒江傈僳族自治州', '怒江', '0886', '673100', '98.854304', '25.850949', '98.860796', '25.857018', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (533301, 533300, 3, '泸水市', '泸水', '0886', '673200', '98.85534', '25.83772', '98.861836', '25.843806', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (533323, 533300, 3, '福贡县', '福贡', '0886', '673400', '98.86969', '26.90366', '98.876139', '26.909919', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (533324, 533300, 3, '贡山独龙族怒族自治县', '贡山', '0886', '673500', '98.66583', '27.74088', '98.672329', '27.746949', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (533325, 533300, 3, '兰坪白族普米族自治县', '兰坪', '0886', '671400', '99.41891', '26.45251', '99.425497', '26.458214', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (533400, 530000, 2, '迪庆藏族自治州', '迪庆', '0887', '674400', '99.706463', '27.826853', '99.712887', '27.833077', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (533401, 533400, 3, '香格里拉市', '香格里拉', '0887', '674400', '99.70601', '27.82308', '99.712433', '27.829298', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (533422, 533400, 3, '德钦县', '德钦', '0887', '674500', '98.91082', '28.4863', '98.917336', '28.492291', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (533423, 533400, 3, '维西傈僳族自治县', '维西', '0887', '674600', '99.28402', '27.1793', '99.290575', '27.185101', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (540000, 100000, 1, '西藏自治区', '西藏', NULL, NULL, '91.132212', '29.660361', '91.13881', '29.666115', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (540100, 540000, 2, '拉萨市', '拉萨', '0891', '850000', '91.132212', '29.660361', '91.13881', '29.666115', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (540102, 540100, 3, '城关区', '城关', '0891', '850000', '91.13859', '29.65312', '91.145191', '29.658851', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (540103, 540100, 3, '堆龙德庆区', '堆龙德庆', '0891', '851400', '91.00033', '29.65002', '91.006885', '29.655883', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (540104, 540100, 3, '达孜区', '达孜', '0891', '850100', '91.35757', '29.6722', '91.364123', '29.6781', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (540121, 540100, 3, '林周县', '林周', '0891', '851600', '91.2586', '29.89445', '91.265202', '29.900181', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (540122, 540100, 3, '当雄县', '当雄', '0891', '851500', '91.10076', '30.48309', '91.107221', '30.489218', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (540123, 540100, 3, '尼木县', '尼木', '0891', '851600', '90.16378', '29.43353', '90.170357', '29.439357', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (540124, 540100, 3, '曲水县', '曲水', '0891', '850600', '90.73187', '29.35636', '90.738284', '29.362577', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (540127, 540100, 3, '墨竹工卡县', '墨竹工卡', '0891', '850200', '91.72814', '29.83614', '91.734699', '29.841912', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (540171, 540100, 3, '格尔木藏青工业园区', '格尔木藏青工业园区', '0891', '850000', '95.089653', '36.339019', '95.09623', '36.344768', NULL, '工业园区');
INSERT INTO `yx_dev_region` VALUES (540173, 540100, 3, '西藏文化旅游创意园区', '西藏文化旅游创意园区', '0891', '850000', '91.141571', '29.615196', '91.148141', '29.620918', NULL, '经济技术开发区');
INSERT INTO `yx_dev_region` VALUES (540174, 540100, 3, '达孜工业园区', '达孜工业园区', '0891', '850000', '91.333133', '29.667394', '91.339583', '29.673612', NULL, '工业园区');
INSERT INTO `yx_dev_region` VALUES (540200, 540000, 2, '日喀则市', '日喀则', '0892', '857000', '88.884874', '29.263792', '88.891383', '29.269717', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (540202, 540200, 3, '桑珠孜区', '桑珠孜', '0892', '857000', '88.880367', '29.269565', '88.8869', '29.275433', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (540221, 540200, 3, '南木林县', '南木林', '0892', '857100', '89.09686', '29.68206', '89.103463', '29.687801', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (540222, 540200, 3, '江孜县', '江孜', '0892', '857400', '89.60263', '28.91744', '89.60916', '28.923338', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (540223, 540200, 3, '定日县', '定日', '0892', '858200', '87.12176', '28.66129', '87.128159', '28.667545', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (540224, 540200, 3, '萨迦县', '萨迦', '0892', '857800', '88.02191', '28.90299', '88.028482', '28.908722', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (540225, 540200, 3, '拉孜县', '拉孜', '0892', '858100', '87.63412', '29.085', '87.640652', '29.090948', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (540226, 540200, 3, '昂仁县', '昂仁', '0892', '858500', '87.23858', '29.29496', '87.245006', '29.301225', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (540227, 540200, 3, '谢通门县', '谢通门', '0892', '858900', '88.26242', '29.43337', '88.269026', '29.439114', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (540228, 540200, 3, '白朗县', '白朗', '0892', '857300', '89.26205', '29.10553', '89.268493', '29.111686', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (540229, 540200, 3, '仁布县', '仁布', '0892', '857200', '89.84228', '29.2301', '89.848805', '29.235991', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (540230, 540200, 3, '康马县', '康马', '0892', '857500', '89.68527', '28.5567', '89.691828', '28.562506', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (540231, 540200, 3, '定结县', '定结', '0892', '857900', '87.77255', '28.36403', '87.779143', '28.369791', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (540232, 540200, 3, '仲巴县', '仲巴', '0892', '858800', '84.02951', '29.76595', '84.036013', '29.771959', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (540233, 540200, 3, '亚东县', '亚东', '0892', '857600', '88.90802', '27.4839', '88.914457', '27.490117', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (540234, 540200, 3, '吉隆县', '吉隆', '0892', '858700', '85.29846', '28.85382', '85.304929', '28.859932', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (540235, 540200, 3, '聂拉木县', '聂拉木', '0892', '858300', '85.97998', '28.15645', '85.98655', '28.162187', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (540236, 540200, 3, '萨嘎县', '萨嘎', '0892', '857800', '85.23413', '29.32936', '85.240659', '29.335309', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (540237, 540200, 3, '岗巴县', '岗巴', '0892', '857700', '88.52069', '28.27504', '88.527216', '28.280911', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (540300, 540000, 2, '昌都市', '昌都', '0895', '854000', '97.178452', '31.136875', '97.184915', '31.143001', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (540302, 540300, 3, '卡若区', '卡若', '0895', '854000', '97.18043', '31.1385', '97.186883', '31.144652', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (540321, 540300, 3, '江达县', '江达', '0895', '854100', '98.21865', '31.50343', '98.225241', '31.509135', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (540322, 540300, 3, '贡觉县', '贡觉', '0895', '854200', '98.27163', '30.85941', '98.278062', '30.865682', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (540323, 540300, 3, '类乌齐县', '类乌齐', '0895', '855600', '96.60015', '31.21207', '96.606568', '31.218363', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (540324, 540300, 3, '丁青县', '丁青', '0895', '855700', '95.59362', '31.41621', '95.600173', '31.421987', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (540325, 540300, 3, '察雅县', '察雅', '0895', '854300', '97.56521', '30.65336', '97.571628', '30.659644', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (540326, 540300, 3, '八宿县', '八宿', '0895', '854600', '96.9176', '30.05346', '96.924161', '30.059286', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (540327, 540300, 3, '左贡县', '左贡', '0895', '854400', '97.84429', '29.67108', '97.85087', '29.676886', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (540328, 540300, 3, '芒康县', '芒康', '0895', '854500', '98.59378', '29.67946', '98.600364', '29.685243', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (540329, 540300, 3, '洛隆县', '洛隆', '0895', '855400', '95.82644', '30.74049', '95.833044', '30.746224', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (540330, 540300, 3, '边坝县', '边坝', '0895', '855500', '94.70687', '30.93434', '94.713336', '30.94038', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (540400, 540000, 2, '林芝市', '林芝', '0894', '860000', '94.362348', '29.654693', '94.368915', '29.660527', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (540402, 540400, 3, '巴宜区', '巴宜', '0894', '860100', '94.48391', '29.57562', '94.490473', '29.581433', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (540421, 540400, 3, '工布江达县', '工布江达', '0894', '860200', '93.2452', '29.88576', '93.251619', '29.892031', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (540422, 540400, 3, '米林县', '米林', '0894', '860500', '94.21316', '29.21535', '94.219597', '29.22157', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (540423, 540400, 3, '墨脱县', '墨脱', '0894', '860700', '95.3316', '29.32698', '95.338192', '29.332725', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (540424, 540400, 3, '波密县', '波密', '0894', '860300', '95.77096', '29.85907', '95.777368', '29.865306', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (540425, 540400, 3, '察隅县', '察隅', '0894', '860600', '97.46679', '28.6618', '97.47326', '28.667844', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (540426, 540400, 3, '朗县', '朗县', '0894', '860400', '93.0754', '29.04549', '93.081966', '29.051298', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (540500, 540000, 2, '山南市', '山南', '0893', '856000', '91.766529', '29.236023', '91.773031', '29.241969', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (540502, 540500, 3, '乃东区', '乃东', '0893', '856100', '91.76153', '29.2249', '91.768063', '29.23078', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (540521, 540500, 3, '扎囊县', '扎囊', '0893', '850800', '91.33288', '29.2399', '91.339295', '29.246109', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (540522, 540500, 3, '贡嘎县', '贡嘎', '0893', '850700', '90.98867', '29.29408', '90.995177', '29.300103', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (540523, 540500, 3, '桑日县', '桑日', '0893', '856200', '92.02005', '29.26643', '92.026493', '29.272565', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (540524, 540500, 3, '琼结县', '琼结', '0893', '856800', '91.68093', '29.02632', '91.687331', '29.032591', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (540525, 540500, 3, '曲松县', '曲松', '0893', '856300', '92.20263', '29.06412', '92.209202', '29.069956', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (540526, 540500, 3, '措美县', '措美', '0893', '856900', '91.43237', '28.43794', '91.438789', '28.444192', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (540527, 540500, 3, '洛扎县', '洛扎', '0893', '851200', '90.86035', '28.3872', '90.866802', '28.39333', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (540528, 540500, 3, '加查县', '加查', '0893', '856400', '92.57702', '29.13973', '92.58359', '29.14545', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (540529, 540500, 3, '隆子县', '隆子', '0893', '856600', '92.46148', '28.40797', '92.468046', '28.413688', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (540530, 540500, 3, '错那县', '错那', '0893', '856700', '91.95752', '27.99224', '91.964071', '27.99814', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (540531, 540500, 3, '浪卡子县', '浪卡子', '0893', '851100', '90.40002', '28.96948', '90.406574', '28.975347', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (540600, 540000, 2, '那曲市', '那曲', '0896', '852000', '92.060214', '31.476004', '92.066686', '31.482146', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (540602, 540600, 3, '色尼区', '色尼', '0896', '852000', '92.0535', '31.46964', '92.059947', '31.475856', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (540621, 540600, 3, '嘉黎县', '嘉黎', '0896', '852400', '93.24987', '30.64233', '93.256305', '30.648578', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (540622, 540600, 3, '比如县', '比如', '0896', '852300', '93.68685', '31.4779', '93.693383', '31.48386', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (540623, 540600, 3, '聂荣县', '聂荣', '0896', '853500', '92.29574', '32.11193', '92.302164', '32.118114', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (540624, 540600, 3, '安多县', '安多', '0896', '853400', '91.6795', '32.26125', '91.685888', '32.267519', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (540625, 540600, 3, '申扎县', '申扎', '0896', '853100', '88.70776', '30.92995', '88.71423', '30.935975', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (540626, 540600, 3, '索县', '索县', '0896', '852200', '93.78295', '31.88427', '93.789526', '31.889986', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (540627, 540600, 3, '班戈县', '班戈', '0896', '852500', '90.01907', '31.36149', '90.025535', '31.367642', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (540628, 540600, 3, '巴青县', '巴青', '0896', '852100', '94.05316', '31.91833', '94.059643', '31.924376', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (540629, 540600, 3, '尼玛县', '尼玛', '0896', '853200', '87.25256', '31.79654', '87.258981', '31.802746', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (540630, 540600, 3, '双湖县', '双湖', '0896', '852600', '88.837776', '33.189032', '88.844307', '33.194923', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (542500, 540000, 2, '阿里地区', '阿里', '0897', '859000', '80.105498', '32.503187', '80.112077', '32.508951', '行政区', '地区');
INSERT INTO `yx_dev_region` VALUES (542521, 542500, 3, '普兰县', '普兰', '0897', '859500', '81.177', '30.30002', '81.18359', '30.305779', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (542522, 542500, 3, '札达县', '札达', '0897', '859600', '79.80255', '31.48345', '79.808971', '31.489693', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (542523, 542500, 3, '噶尔县', '噶尔', '0897', '859000', '80.09579', '32.50024', '80.102369', '32.505999', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (542524, 542500, 3, '日土县', '日土', '0897', '859700', '79.7131', '33.38741', '79.719634', '33.393379', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (542525, 542500, 3, '革吉县', '革吉', '0897', '859100', '81.151', '32.3964', '81.157502', '32.402386', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (542526, 542500, 3, '改则县', '改则', '0897', '859200', '84.06295', '32.30446', '84.069564', '32.310218', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (542527, 542500, 3, '措勤县', '措勤', '0897', '859300', '85.16616', '31.02095', '85.172678', '31.026899', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (610000, 100000, 1, '陕西省', '陕西', NULL, NULL, '108.948024', '34.263161', '108.954438', '34.269425', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (610100, 610000, 2, '西安市', '西安', '029', '710000', '108.948024', '34.263161', '108.954438', '34.269425', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (610102, 610100, 3, '新城区', '新城', '029', '710000', '108.9608', '34.26641', '108.967191', '34.272735', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (610103, 610100, 3, '碑林区', '碑林', '029', '710000', '108.93426', '34.2304', '108.940756', '34.236478', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (610104, 610100, 3, '莲湖区', '莲湖', '029', '710000', '108.9401', '34.26709', '108.946541', '34.273253', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (610111, 610100, 3, '灞桥区', '灞桥', '029', '710000', '109.06451', '34.27264', '109.070927', '34.278862', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (610112, 610100, 3, '未央区', '未央', '029', '710000', '108.94683', '34.29296', '108.953232', '34.299206', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (610113, 610100, 3, '雁塔区', '雁塔', '029', '710000', '108.94866', '34.22245', '108.955093', '34.228726', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (610114, 610100, 3, '阎良区', '阎良', '029', '710000', '109.22616', '34.66221', '109.232624', '34.668271', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (610115, 610100, 3, '临潼区', '临潼', '029', '710600', '109.21417', '34.36665', '109.220606', '34.372895', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (610116, 610100, 3, '长安区', '长安', '029', '710100', '108.94586', '34.15559', '108.95227', '34.161827', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (610117, 610100, 3, '高陵区', '高陵', '029', '710200', '109.08816', '34.53483', '109.094547', '34.541122', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (610118, 610100, 3, '鄠邑区', '鄠邑', '029', '710300', '108.60513', '34.10856', '108.61155', '34.11488', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (610122, 610100, 3, '蓝田县', '蓝田', '029', '710500', '109.32339', '34.15128', '109.329779', '34.157599', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (610124, 610100, 3, '周至县', '周至', '029', '710400', '108.22207', '34.16337', '108.228492', '34.169556', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (610125, 610100, 3, '西咸新区', '西咸新区', '029', '712000', '108.810654', '34.307144', '108.817139', '34.313151', NULL, '国家级新区');
INSERT INTO `yx_dev_region` VALUES (610127, 610100, 3, '曲江新区', '曲江新区', '029', '710061', '108.773575', '34.187666', '108.78016', '34.193354', NULL, '新区');
INSERT INTO `yx_dev_region` VALUES (610128, 610100, 3, '高新区', '高新区', '029', '710000', '108.890974', '34.193388', '108.897559', '34.199095', NULL, '高新技术开发区');
INSERT INTO `yx_dev_region` VALUES (610200, 610000, 2, '铜川市', '铜川', '0919', '727000', '108.963122', '34.90892', '108.969508', '34.915239', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (610202, 610200, 3, '王益区', '王益', '0919', '727000', '109.07564', '35.06896', '109.082057', '35.075285', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (610203, 610200, 3, '印台区', '印台', '0919', '727007', '109.10208', '35.1169', '109.108523', '35.123027', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (610204, 610200, 3, '耀州区', '耀州', '0919', '727100', '108.98556', '34.91308', '108.992029', '34.919153', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (610222, 610200, 3, '宜君县', '宜君', '0919', '727200', '109.11813', '35.40108', '109.124675', '35.406945', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (610300, 610000, 2, '宝鸡市', '宝鸡', '0917', '721000', '107.14487', '34.369315', '107.151308', '34.375544', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (610302, 610300, 3, '渭滨区', '渭滨', '0917', '721000', '107.14991', '34.37116', '107.156329', '34.37744', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (610303, 610300, 3, '金台区', '金台', '0917', '721000', '107.14691', '34.37612', '107.153334', '34.38237', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (610304, 610300, 3, '陈仓区', '陈仓', '0917', '721300', '107.38742', '34.35451', '107.393857', '34.360771', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (610322, 610300, 3, '凤翔县', '凤翔', '0917', '721400', '107.39645', '34.52321', '107.40283', '34.529521', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (610323, 610300, 3, '岐山县', '岐山', '0917', '722400', '107.62173', '34.44378', '107.628174', '34.449967', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (610324, 610300, 3, '扶风县', '扶风', '0917', '722200', '107.90017', '34.37524', '107.906624', '34.381401', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (610326, 610300, 3, '眉县', '眉县', '0917', '722300', '107.75079', '34.27569', '107.757185', '34.281972', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (610327, 610300, 3, '陇县', '陇县', '0917', '721200', '106.85946', '34.89404', '106.866046', '34.899713', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (610328, 610300, 3, '千阳县', '千阳', '0917', '721100', '107.13043', '34.64219', '107.13691', '34.648192', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (610329, 610300, 3, '麟游县', '麟游', '0917', '721500', '107.79623', '34.67844', '107.802762', '34.684336', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (610330, 610300, 3, '凤县', '凤县', '0917', '721700', '106.52356', '33.91172', '106.530083', '33.917611', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (610331, 610300, 3, '太白县', '太白', '0917', '721600', '107.31646', '34.06207', '107.322979', '34.067958', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (610332, 610300, 3, '高新区', '高新区', '0917', '721013', '107.231584', '34.348635', '107.238188', '34.354377', NULL, '高新技术开发区');
INSERT INTO `yx_dev_region` VALUES (610400, 610000, 2, '咸阳市', '咸阳', '029', '712000', '108.705117', '34.333439', '108.711556', '34.339675', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (610402, 610400, 3, '秦都区', '秦都', '029', '712000', '108.71493', '34.33804', '108.721346', '34.34436', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (610403, 610400, 3, '杨陵区', '杨陵', '029', '712100', '108.083481', '34.270434', '108.090006', '34.276322', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (610404, 610400, 3, '渭城区', '渭城', '029', '712000', '108.72227', '34.33198', '108.728679', '34.338307', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (610422, 610400, 3, '三原县', '三原', '029', '713800', '108.93194', '34.61556', '108.938434', '34.621595', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (610423, 610400, 3, '泾阳县', '泾阳', '029', '713700', '108.84259', '34.52705', '108.848969', '34.533368', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (610424, 610400, 3, '乾县', '乾县', '029', '713300', '108.24231', '34.52946', '108.248688', '34.535776', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (610425, 610400, 3, '礼泉县', '礼泉', '029', '713200', '108.4263', '34.48455', '108.432912', '34.490247', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (610426, 610400, 3, '永寿县', '永寿', '029', '713400', '108.14474', '34.69081', '108.151222', '34.696902', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (610428, 610400, 3, '长武县', '长武', '029', '713600', '107.7951', '35.2067', '107.80164', '35.212619', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (610429, 610400, 3, '旬邑县', '旬邑', '029', '711300', '108.3341', '35.11338', '108.340565', '35.119445', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (610430, 610400, 3, '淳化县', '淳化', '029', '711200', '108.58026', '34.79886', '108.586705', '34.805026', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (610431, 610400, 3, '武功县', '武功', '029', '712200', '108.20434', '34.26003', '108.21087', '34.265935', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (610481, 610400, 3, '兴平市', '兴平', '029', '713100', '108.49057', '34.29785', '108.496965', '34.304121', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (610482, 610400, 3, '彬州市', '彬州', '029', '713500', '108.08468', '35.0342', '108.091203', '35.040109', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (610483, 610400, 3, '高新区', '高新区', '029', '712000', '108.664746', '34.319917', '108.671346', '34.325601', NULL, '高新技术开发区');
INSERT INTO `yx_dev_region` VALUES (610500, 610000, 2, '渭南市', '渭南', '0913', '714000', '109.502882', '34.499381', '109.509485', '34.505056', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (610502, 610500, 3, '临渭区', '临渭', '0913', '714000', '109.49296', '34.49822', '109.499558', '34.503914', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (610503, 610500, 3, '华州区', '华州', '0913', '714100', '109.77185', '34.51255', '109.778328', '34.518578', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (610522, 610500, 3, '潼关县', '潼关', '0913', '714300', '110.24362', '34.54284', '110.250139', '34.548727', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (610523, 610500, 3, '大荔县', '大荔', '0913', '715100', '109.94216', '34.79565', '109.948614', '34.80178', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (610524, 610500, 3, '合阳县', '合阳', '0913', '715300', '110.14862', '35.23805', '110.155017', '35.244319', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (610525, 610500, 3, '澄城县', '澄城', '0913', '715200', '109.93444', '35.18396', '109.940881', '35.190206', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (610526, 610500, 3, '蒲城县', '蒲城', '0913', '715500', '109.5903', '34.9568', '109.59682', '34.962801', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (610527, 610500, 3, '白水县', '白水', '0913', '715600', '109.59286', '35.17863', '109.599392', '35.184586', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (610528, 610500, 3, '富平县', '富平', '0913', '711700', '109.1802', '34.75109', '109.186636', '34.757253', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (610581, 610500, 3, '韩城市', '韩城', '0913', '715400', '110.44238', '35.47926', '110.448928', '35.485055', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (610582, 610500, 3, '华阴市', '华阴', '0913', '714200', '110.08752', '34.56608', '110.094108', '34.57182', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (610600, 610000, 2, '延安市', '延安', '0911', '716000', '109.49081', '36.596537', '109.497404', '36.602245', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (610602, 610600, 3, '宝塔区', '宝塔', '0911', '716000', '109.49336', '36.59154', '109.499955', '36.597228', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (610603, 610600, 3, '安塞区', '安塞', '0911', '717400', '109.32708', '36.86507', '109.333495', '36.871382', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (610621, 610600, 3, '延长县', '延长', '0911', '717100', '110.01083', '36.57904', '110.017308', '36.585049', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (610622, 610600, 3, '延川县', '延川', '0911', '717200', '110.19415', '36.87817', '110.200691', '36.884105', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (610623, 610600, 3, '子长县', '子长', '0911', '717300', '109.67532', '37.14253', '109.681709', '37.148848', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (610625, 610600, 3, '志丹县', '志丹', '0911', '717500', '108.76815', '36.82177', '108.774724', '36.827499', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (610626, 610600, 3, '吴起县', '吴起', '0911', '717600', '108.17611', '36.92785', '108.1827', '36.933526', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (610627, 610600, 3, '甘泉县', '甘泉', '0911', '716100', '109.35012', '36.27754', '109.356638', '36.283544', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (610628, 610600, 3, '富县', '富县', '0911', '727500', '109.37927', '35.98803', '109.385867', '35.993698', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (610629, 610600, 3, '洛川县', '洛川', '0911', '727400', '109.43286', '35.76076', '109.439261', '35.767066', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (610630, 610600, 3, '宜川县', '宜川', '0911', '716200', '110.17196', '36.04732', '110.178384', '36.053592', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (610631, 610600, 3, '黄龙县', '黄龙', '0911', '715700', '109.84259', '35.58349', '109.849152', '35.589287', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (610632, 610600, 3, '黄陵县', '黄陵', '0911', '727300', '109.26333', '35.58357', '109.269932', '35.589246', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (610700, 610000, 2, '汉中市', '汉中', '0916', '723000', '107.028621', '33.077668', '107.035024', '33.083929', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (610702, 610700, 3, '汉台区', '汉台', '0916', '723000', '107.03187', '33.06774', '107.038272', '33.07403', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (610703, 610700, 3, '南郑区', '南郑', '0916', '723100', '106.94024', '33.00299', '106.946695', '33.009148', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (610722, 610700, 3, '城固县', '城固', '0916', '723200', '107.33367', '33.15661', '107.340282', '33.162311', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (610723, 610700, 3, '洋县', '洋县', '0916', '723300', '107.54672', '33.22102', '107.553187', '33.22707', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (610724, 610700, 3, '西乡县', '西乡', '0916', '723500', '107.76867', '32.98411', '107.775067', '32.990396', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (610725, 610700, 3, '勉县', '勉县', '0916', '724200', '106.67584', '33.15273', '106.682262', '33.159048', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (610726, 610700, 3, '宁强县', '宁强', '0916', '724400', '106.25958', '32.82881', '106.26617', '32.834489', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (610727, 610700, 3, '略阳县', '略阳', '0916', '724300', '106.15399', '33.33009', '106.160545', '33.335847', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (610728, 610700, 3, '镇巴县', '镇巴', '0916', '723600', '107.89648', '32.53487', '107.90293', '32.541085', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (610729, 610700, 3, '留坝县', '留坝', '0916', '724100', '106.92233', '33.61606', '106.928744', '33.622383', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (610730, 610700, 3, '佛坪县', '佛坪', '0916', '723400', '107.98974', '33.52496', '107.996167', '33.531243', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (610800, 610000, 2, '榆林市', '榆林', '0912', '719000', '109.741193', '38.290162', '109.747817', '38.295837', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (610802, 610800, 3, '榆阳区', '榆阳', '0912', '719000', '109.73473', '38.27843', '109.741339', '38.284113', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (610803, 610800, 3, '横山区', '横山', '0912', '719200', '109.29568', '37.958', '109.302164', '37.964102', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (610822, 610800, 3, '府谷县', '府谷', '0912', '719400', '111.06723', '39.02805', '111.073858', '39.033747', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (610824, 610800, 3, '靖边县', '靖边', '0912', '718500', '108.79412', '37.59938', '108.80072', '37.605145', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (610825, 610800, 3, '定边县', '定边', '0912', '718600', '107.59793', '37.59037', '107.604515', '37.596186', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (610826, 610800, 3, '绥德县', '绥德', '0912', '718000', '110.26126', '37.49778', '110.2677', '37.503965', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (610827, 610800, 3, '米脂县', '米脂', '0912', '718100', '110.18417', '37.75529', '110.190622', '37.761385', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (610828, 610800, 3, '佳县', '佳县', '0912', '719200', '110.49362', '38.02248', '110.500083', '38.028537', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (610829, 610800, 3, '吴堡县', '吴堡', '0912', '718200', '110.74533', '37.45709', '110.751764', '37.463334', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (610830, 610800, 3, '清涧县', '清涧', '0912', '718300', '110.12173', '37.08854', '110.128285', '37.094404', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (610831, 610800, 3, '子洲县', '子洲', '0912', '718400', '110.03488', '37.61238', '110.041279', '37.618701', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (610881, 610800, 3, '神木市', '神木', '0912', '719300', '110.4989', '38.84234', '110.50533', '38.848483', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (610900, 610000, 2, '安康市', '安康', '0915', '725000', '109.029273', '32.6903', '109.035869', '32.696014', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (610902, 610900, 3, '汉滨区', '汉滨', '0915', '725000', '109.02683', '32.69517', '109.033427', '32.700865', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (610921, 610900, 3, '汉阴县', '汉阴', '0915', '725100', '108.51098', '32.89129', '108.517496', '32.897277', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (610922, 610900, 3, '石泉县', '石泉', '0915', '725200', '108.24755', '33.03971', '108.253975', '33.046015', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (610923, 610900, 3, '宁陕县', '宁陕', '0915', '711600', '108.31515', '33.31726', '108.321705', '33.323027', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (610924, 610900, 3, '紫阳县', '紫阳', '0915', '725300', '108.5368', '32.52115', '108.543397', '32.526829', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (610925, 610900, 3, '岚皋县', '岚皋', '0915', '725400', '108.90289', '32.30794', '108.909505', '32.313623', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (610926, 610900, 3, '平利县', '平利', '0915', '725500', '109.35775', '32.39111', '109.36428', '32.396978', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (610927, 610900, 3, '镇坪县', '镇坪', '0915', '725600', '109.52456', '31.8833', '109.531069', '31.889202', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (610928, 610900, 3, '旬阳县', '旬阳', '0915', '725700', '109.3619', '32.83207', '109.368446', '32.837875', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (610929, 610900, 3, '白河县', '白河', '0915', '725800', '110.11315', '32.80955', '110.119736', '32.815298', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (611000, 610000, 2, '商洛市', '商洛', '0914', '726000', '109.939776', '33.868319', '109.946243', '33.874493', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (611002, 611000, 3, '商州区', '商州', '0914', '726000', '109.94126', '33.8627', '109.947733', '33.868851', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (611021, 611000, 3, '洛南县', '洛南', '0914', '726100', '110.14645', '34.08994', '110.152882', '34.096194', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (611022, 611000, 3, '丹凤县', '丹凤', '0914', '726200', '110.33486', '33.69468', '110.341439', '33.700355', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (611023, 611000, 3, '商南县', '商南', '0914', '726300', '110.88375', '33.52581', '110.890164', '33.53214', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (611024, 611000, 3, '山阳县', '山阳', '0914', '726400', '109.88784', '33.52931', '109.894362', '33.535276', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (611025, 611000, 3, '镇安县', '镇安', '0914', '711500', '109.15374', '33.42366', '109.160312', '33.429413', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (611026, 611000, 3, '柞水县', '柞水', '0914', '711400', '109.11105', '33.6831', '109.117538', '33.689076', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (620000, 100000, 1, '甘肃省', '甘肃', NULL, NULL, '103.823557', '36.058039', '103.830023', '36.064143', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (620100, 620000, 2, '兰州市', '兰州', '0931', '730000', '103.823557', '36.058039', '103.830023', '36.064143', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (620102, 620100, 3, '城关区', '城关', '0931', '730030', '103.8252', '36.05725', '103.831676', '36.063328', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (620103, 620100, 3, '七里河区', '七里河', '0931', '730050', '103.78564', '36.06585', '103.792055', '36.072075', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (620104, 620100, 3, '西固区', '西固', '0931', '730060', '103.62811', '36.08858', '103.63469', '36.09429', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (620105, 620100, 3, '安宁区', '安宁', '0931', '730070', '103.7189', '36.10384', '103.725435', '36.109695', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (620111, 620100, 3, '红古区', '红古', '0931', '730080', '102.85955', '36.34537', '102.86598', '36.351526', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (620121, 620100, 3, '永登县', '永登', '0931', '730300', '103.26055', '36.73522', '103.267174', '36.740915', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (620122, 620100, 3, '皋兰县', '皋兰', '0931', '730200', '103.94506', '36.33215', '103.951513', '36.338223', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (620123, 620100, 3, '榆中县', '榆中', '0931', '730100', '104.1145', '35.84415', '104.12106', '35.849917', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (620124, 620100, 3, '兰州新区', '兰州新区', '0931', '730000', '103.628725', '36.492791', '103.635335', '36.498516', NULL, '国家级新区');
INSERT INTO `yx_dev_region` VALUES (620125, 620100, 3, '高新区', '高新区', '0931', '730000', '103.893943', '36.053037', '103.900428', '36.059103', NULL, '高新技术开发区');
INSERT INTO `yx_dev_region` VALUES (620126, 620100, 3, '经济开发区', '经济开发区', '0931', '730000', '103.71609', '36.095017', '103.722606', '36.100913', NULL, '经济技术开发区');
INSERT INTO `yx_dev_region` VALUES (620200, 620000, 2, '嘉峪关市', '嘉峪关', '0937', '735100', '98.277304', '39.786529', '98.28368', '39.792818', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (620201, 620200, 3, '雄关区', '雄关', '0937', '735100', '98.277398', '39.77925', '98.28378', '39.785542', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (620202, 620200, 3, '长城区', '长城', '0937', '735106', '98.273523', '39.787431', '98.279903', '39.793706', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (620203, 620200, 3, '镜铁区', '镜铁', '0937', '735100', '98.277304', '39.786529', '98.28368', '39.792818', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (620300, 620000, 2, '金昌市', '金昌', '0935', '737100', '102.187888', '38.514238', '102.194488', '38.519955', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (620302, 620300, 3, '金川区', '金川', '0935', '737100', '102.19376', '38.52101', '102.200348', '38.52678', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (620321, 620300, 3, '永昌县', '永昌', '0935', '737200', '101.97222', '38.24711', '101.978688', '38.253139', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (620400, 620000, 2, '白银市', '白银', '0943', '730900', '104.173606', '36.54568', '104.180017', '36.551915', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (620402, 620400, 3, '白银区', '白银', '0943', '730900', '104.17355', '36.54411', '104.179963', '36.550346', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (620403, 620400, 3, '平川区', '平川', '0943', '730913', '104.82498', '36.7277', '104.831594', '36.733399', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (620421, 620400, 3, '靖远县', '靖远', '0943', '730600', '104.68325', '36.56602', '104.689802', '36.571813', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (620422, 620400, 3, '会宁县', '会宁', '0943', '730700', '105.05297', '35.69626', '105.059574', '35.701967', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (620423, 620400, 3, '景泰县', '景泰', '0943', '730400', '104.06295', '37.18359', '104.069395', '37.189698', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (620500, 620000, 2, '天水市', '天水', '0938', '741000', '105.724998', '34.578529', '105.731413', '34.584841', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (620502, 620500, 3, '秦州区', '秦州', '0938', '741000', '105.72421', '34.58089', '105.730626', '34.587205', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (620503, 620500, 3, '麦积区', '麦积', '0938', '741020', '105.89013', '34.57069', '105.89673', '34.576417', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (620521, 620500, 3, '清水县', '清水', '0938', '741400', '106.13671', '34.75032', '106.143303', '34.756003', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (620522, 620500, 3, '秦安县', '秦安', '0938', '741600', '105.66955', '34.85894', '105.676143', '34.864662', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (620523, 620500, 3, '甘谷县', '甘谷', '0938', '741200', '105.33291', '34.73665', '105.339397', '34.742699', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (620524, 620500, 3, '武山县', '武山', '0938', '741300', '104.88382', '34.72123', '104.890234', '34.727544', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (620525, 620500, 3, '张家川回族自治县', '张家川', '0938', '741500', '106.21582', '34.99582', '106.222235', '35.002031', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (620600, 620000, 2, '武威市', '武威', '0935', '733000', '102.634697', '37.929996', '102.641234', '37.935925', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (620602, 620600, 3, '凉州区', '凉州', '0935', '733000', '102.64203', '37.92832', '102.648605', '37.934142', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (620621, 620600, 3, '民勤县', '民勤', '0935', '733300', '103.09011', '38.62487', '103.096497', '38.631132', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (620622, 620600, 3, '古浪县', '古浪', '0935', '733100', '102.89154', '37.46508', '102.89816', '37.470808', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (620623, 620600, 3, '天祝藏族自治县', '天祝', '0935', '733200', '103.1361', '36.97715', '103.142723', '36.982852', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (620700, 620000, 2, '张掖市', '张掖', '0936', '734000', '100.455472', '38.932897', '100.461898', '38.939107', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (620702, 620700, 3, '甘州区', '甘州', '0936', '734000', '100.4527', '38.92947', '100.459118', '38.935711', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (620721, 620700, 3, '肃南裕固族自治县', '肃南', '0936', '734400', '99.61407', '38.83776', '99.620469', '38.843976', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (620722, 620700, 3, '民乐县', '民乐', '0936', '734500', '100.81091', '38.43479', '100.817331', '38.441051', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (620723, 620700, 3, '临泽县', '临泽', '0936', '734200', '100.16445', '39.15252', '100.171002', '39.158441', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (620724, 620700, 3, '高台县', '高台', '0936', '734300', '99.81918', '39.37829', '99.825641', '39.384434', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (620725, 620700, 3, '山丹县', '山丹', '0936', '734100', '101.09359', '38.78468', '101.100218', '38.790401', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (620800, 620000, 2, '平凉市', '平凉', '0933', '744000', '106.684691', '35.54279', '106.691105', '35.549106', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (620802, 620800, 3, '崆峒区', '崆峒', '0933', '744000', '106.67483', '35.54262', '106.681245', '35.548934', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (620821, 620800, 3, '泾川县', '泾川', '0933', '744300', '107.36581', '35.33223', '107.372341', '35.338162', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (620822, 620800, 3, '灵台县', '灵台', '0933', '744400', '107.6174', '35.06768', '107.623879', '35.073808', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (620823, 620800, 3, '崇信县', '崇信', '0933', '744200', '107.03738', '35.30344', '107.043793', '35.309764', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (620825, 620800, 3, '庄浪县', '庄浪', '0933', '744600', '106.03662', '35.20235', '106.043203', '35.20815', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (620826, 620800, 3, '静宁县', '静宁', '0933', '743400', '105.72723', '35.51991', '105.733631', '35.526205', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (620881, 620800, 3, '华亭市', '华亭', '0933', '744100', '106.65463', '35.2183', '106.661106', '35.224377', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (620900, 620000, 2, '酒泉市', '酒泉', '0937', '735000', '98.510795', '39.744023', '98.517207', '39.750292', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (620902, 620900, 3, '肃州区', '肃州', '0937', '735000', '98.50775', '39.74506', '98.514172', '39.751304', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (620921, 620900, 3, '金塔县', '金塔', '0937', '735300', '98.90002', '39.97733', '98.906475', '39.983484', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (620922, 620900, 3, '瓜州县', '瓜州', '0937', '736100', '95.78271', '40.51548', '95.789151', '40.521581', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (620923, 620900, 3, '肃北蒙古族自治县', '肃北', '0937', '736300', '94.87649', '39.51214', '94.883085', '39.517963', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (620924, 620900, 3, '阿克塞哈萨克族自治县', '阿克塞', '0937', '736400', '94.34097', '39.63435', '94.347434', '39.640486', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (620981, 620900, 3, '玉门市', '玉门', '0937', '735200', '97.04538', '40.29172', '97.051891', '40.297643', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (620982, 620900, 3, '敦煌市', '敦煌', '0937', '736200', '94.66159', '40.14211', '94.668019', '40.148271', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (621000, 620000, 2, '庆阳市', '庆阳', '0934', '745000', '107.638372', '35.734218', '107.644747', '35.740534', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (621002, 621000, 3, '西峰区', '西峰', '0934', '745000', '107.65107', '35.73065', '107.657461', '35.736914', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (621021, 621000, 3, '庆城县', '庆城', '0934', '745100', '107.88272', '36.01507', '107.889127', '36.021395', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (621022, 621000, 3, '环县', '环县', '0934', '745700', '107.30835', '36.56846', '107.314822', '36.574481', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (621023, 621000, 3, '华池县', '华池', '0934', '745600', '107.9891', '36.46108', '107.995492', '36.467347', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (621024, 621000, 3, '合水县', '合水', '0934', '745400', '108.02032', '35.81911', '108.026769', '35.825268', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (621025, 621000, 3, '正宁县', '正宁', '0934', '745300', '108.36007', '35.49174', '108.366445', '35.498059', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (621026, 621000, 3, '宁县', '宁县', '0934', '745200', '107.92517', '35.50164', '107.93173', '35.507404', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (621027, 621000, 3, '镇原县', '镇原', '0934', '744500', '107.199', '35.67712', '107.205566', '35.68298', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (621100, 620000, 2, '定西市', '定西', '0932', '743000', '104.626294', '35.579578', '104.632714', '35.585815', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (621102, 621100, 3, '安定区', '安定', '0932', '744300', '104.6106', '35.58066', '104.617096', '35.58667', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (621121, 621100, 3, '通渭县', '通渭', '0932', '743300', '105.24224', '35.21101', '105.248644', '35.217326', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (621122, 621100, 3, '陇西县', '陇西', '0932', '748100', '104.63446', '35.00238', '104.640842', '35.008675', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (621123, 621100, 3, '渭源县', '渭源', '0932', '748200', '104.21435', '35.13649', '104.220933', '35.142185', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (621124, 621100, 3, '临洮县', '临洮', '0932', '730500', '103.86196', '35.3751', '103.868547', '35.380784', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (621125, 621100, 3, '漳县', '漳县', '0932', '748300', '104.46704', '34.84977', '104.473647', '34.855481', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (621126, 621100, 3, '岷县', '岷县', '0932', '748400', '104.03772', '34.43444', '104.044112', '34.440748', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (621200, 620000, 2, '陇南市', '陇南', '0939', '742500', '104.929379', '33.388598', '104.935983', '33.394337', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (621202, 621200, 3, '武都区', '武都', '0939', '746000', '104.92652', '33.39239', '104.933115', '33.398156', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (621221, 621200, 3, '成县', '成县', '0939', '742500', '105.72586', '33.73925', '105.73228', '33.745558', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (621222, 621200, 3, '文县', '文县', '0939', '746400', '104.68362', '32.94337', '104.690181', '32.949163', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (621223, 621200, 3, '宕昌县', '宕昌', '0939', '748500', '104.39349', '34.04732', '104.399875', '34.053609', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (621224, 621200, 3, '康县', '康县', '0939', '746500', '105.60711', '33.32912', '105.613498', '33.335409', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (621225, 621200, 3, '西和县', '西和', '0939', '742100', '105.30099', '34.01432', '105.307597', '34.020006', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (621226, 621200, 3, '礼县', '礼县', '0939', '742200', '105.17785', '34.18935', '105.184442', '34.195033', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (621227, 621200, 3, '徽县', '徽县', '0939', '742300', '106.08529', '33.76898', '106.091703', '33.775289', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (621228, 621200, 3, '两当县', '两当', '0939', '742400', '106.30484', '33.9096', '106.311259', '33.915821', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (622900, 620000, 2, '临夏回族自治州', '临夏', '0930', '731100', '103.212006', '35.599446', '103.218404', '35.605691', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (622901, 622900, 3, '临夏市', '临夏', '0930', '731100', '103.21', '35.59916', '103.216392', '35.605423', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (622921, 622900, 3, '临夏县', '临夏', '0930', '731800', '102.9938', '35.49519', '103.000303', '35.501123', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (622922, 622900, 3, '康乐县', '康乐', '0930', '731500', '103.71093', '35.37219', '103.717416', '35.378168', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (622923, 622900, 3, '永靖县', '永靖', '0930', '731600', '103.32043', '35.93835', '103.326824', '35.94466', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (622924, 622900, 3, '广河县', '广河', '0930', '731300', '103.56933', '35.48097', '103.575719', '35.487239', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (622925, 622900, 3, '和政县', '和政', '0930', '731200', '103.34936', '35.42592', '103.355875', '35.431937', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (622926, 622900, 3, '东乡族自治县', '东乡族', '0930', '731400', '103.39477', '35.66471', '103.401365', '35.670494', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (622927, 622900, 3, '积石山保安族东乡族撒拉族自治县', '积石山', '0930', '731700', '102.87374', '35.7182', '102.880245', '35.724135', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (623000, 620000, 2, '甘南藏族自治州', '甘南', '0941', '747000', '102.911008', '34.986354', '102.91759', '34.992093', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (623001, 623000, 3, '合作市', '合作', '0941', '747000', '102.91082', '35.00016', '102.917392', '35.005894', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (623021, 623000, 3, '临潭县', '临潭', '0941', '747500', '103.35287', '34.69515', '103.359399', '34.701108', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (623022, 623000, 3, '卓尼县', '卓尼', '0941', '747600', '103.50811', '34.58919', '103.514724', '34.594913', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (623023, 623000, 3, '舟曲县', '舟曲', '0941', '746300', '104.37155', '33.78468', '104.378037', '33.790704', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (623024, 623000, 3, '迭部县', '迭部', '0941', '747400', '103.22274', '34.05623', '103.229184', '34.062339', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (623025, 623000, 3, '玛曲县', '玛曲', '0941', '747300', '102.0754', '33.997', '102.081988', '34.002794', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (623026, 623000, 3, '碌曲县', '碌曲', '0941', '747200', '102.49176', '34.58872', '102.498194', '34.594977', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (623027, 623000, 3, '夏河县', '夏河', '0941', '747100', '102.52215', '35.20487', '102.528726', '35.210692', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (630000, 100000, 1, '青海省', '青海', NULL, NULL, '101.778916', '36.623178', '101.785373', '36.629352', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (630100, 630000, 2, '西宁市', '西宁', '0971', '810000', '101.778916', '36.623178', '101.785373', '36.629352', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (630102, 630100, 3, '城东区', '城东', '0971', '810000', '101.80373', '36.59969', '101.810302', '36.605489', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (630103, 630100, 3, '城中区', '城中', '0971', '810000', '101.78394', '36.62279', '101.790423', '36.628892', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (630104, 630100, 3, '城西区', '城西', '0971', '810000', '101.76588', '36.62828', '101.772294', '36.634578', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (630105, 630100, 3, '城北区', '城北', '0971', '810000', '101.7662', '36.65014', '101.772605', '36.656433', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (630121, 630100, 3, '大通回族土族自治县', '大通', '0971', '810100', '101.70236', '36.93489', '101.708952', '36.940581', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (630122, 630100, 3, '湟中县', '湟中', '0971', '811600', '101.57159', '36.50083', '101.578206', '36.50656', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (630123, 630100, 3, '湟源县', '湟源', '0971', '812100', '101.25643', '36.68243', '101.262876', '36.688524', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (630200, 630000, 2, '海东市', '海东', '0972', '810600', '102.10327', '36.502916', '102.109717', '36.509118', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (630202, 630200, 3, '乐都区', '乐都', '0972', '810700', '102.402431', '36.480291', '102.408998', '36.486105', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (630203, 630200, 3, '平安区', '平安', '0972', '810600', '102.104295', '36.502714', '102.110738', '36.508929', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (630222, 630200, 3, '民和回族土族自治县', '民和', '0972', '810800', '102.804209', '36.329451', '102.810723', '36.335352', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (630223, 630200, 3, '互助土族自治县', '互助', '0972', '810500', '101.956734', '36.83994', '101.963305', '36.845744', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (630224, 630200, 3, '化隆回族自治县', '化隆', '0972', '810900', '102.262329', '36.098322', '102.26877', '36.104436', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (630225, 630200, 3, '循化撒拉族自治县', '循化', '0972', '811100', '102.486534', '35.847247', '102.492914', '35.85353', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (632200, 630000, 2, '海北藏族自治州', '海北', '0970', '812200', '100.901059', '36.959435', '100.907498', '36.9656', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (632221, 632200, 3, '门源回族自治县', '门源', '0970', '810300', '101.62228', '37.37611', '101.628717', '37.382294', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (632222, 632200, 3, '祁连县', '祁连', '0970', '810400', '100.24618', '38.17901', '100.252782', '38.184791', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (632223, 632200, 3, '海晏县', '海晏', '0970', '812200', '100.9927', '36.89902', '100.999288', '36.904782', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (632224, 632200, 3, '刚察县', '刚察', '0970', '812300', '100.14675', '37.32161', '100.153357', '37.327329', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (632300, 630000, 2, '黄南藏族自治州', '黄南', '0973', '811300', '102.019988', '35.517744', '102.026432', '35.523896', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (632321, 632300, 3, '同仁县', '同仁', '0973', '811300', '102.0184', '35.51603', '102.024835', '35.522203', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (632322, 632300, 3, '尖扎县', '尖扎', '0973', '811200', '102.03411', '35.93947', '102.040634', '35.945405', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (632323, 632300, 3, '泽库县', '泽库', '0973', '811400', '101.46444', '35.03519', '101.471038', '35.040892', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (632324, 632300, 3, '河南蒙古族自治县', '河南', '0973', '811500', '101.60864', '34.73476', '101.615153', '34.74074', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (632500, 630000, 2, '海南藏族自治州', '海南', '0974', '813000', '100.619542', '36.280353', '100.626167', '36.286057', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (632521, 632500, 3, '共和县', '共和', '0974', '813000', '100.62003', '36.2841', '100.626653', '36.289803', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (632522, 632500, 3, '同德县', '同德', '0974', '813200', '100.57159', '35.25488', '100.577985', '35.261121', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (632523, 632500, 3, '贵德县', '贵德', '0974', '811700', '101.432', '36.044', '101.438525', '36.049973', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (632524, 632500, 3, '兴海县', '兴海', '0974', '813300', '99.98846', '35.59031', '99.994942', '35.596331', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (632525, 632500, 3, '贵南县', '贵南', '0974', '813100', '100.74716', '35.58667', '100.753753', '35.592386', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (632600, 630000, 2, '果洛藏族自治州', '果洛', '0975', '814000', '100.242143', '34.4736', '100.248723', '34.479428', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (632621, 632600, 3, '玛沁县', '玛沁', '0975', '814000', '100.23901', '34.47746', '100.245574', '34.483329', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (632622, 632600, 3, '班玛县', '班玛', '0975', '814300', '100.73745', '32.93253', '100.744055', '32.938233', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (632623, 632600, 3, '甘德县', '甘德', '0975', '814100', '99.90246', '33.96838', '99.909069', '33.974086', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (632624, 632600, 3, '达日县', '达日', '0975', '814200', '99.65179', '33.75193', '99.658401', '33.757665', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (632625, 632600, 3, '久治县', '久治', '0975', '624700', '101.48342', '33.42989', '101.489944', '33.435784', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (632626, 632600, 3, '玛多县', '玛多', '0975', '813500', '98.20996', '34.91567', '98.216546', '34.921414', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (632700, 630000, 2, '玉树藏族自治州', '玉树', '0976', '815000', '97.008522', '33.004049', '97.015108', '33.00981', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (632701, 632700, 3, '玉树市', '玉树', '0976', '815000', '97.008762', '33.00393', '97.015348', '33.009689', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (632722, 632700, 3, '杂多县', '杂多', '0976', '815300', '95.29864', '32.89318', '95.305097', '32.899344', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (632723, 632700, 3, '称多县', '称多', '0976', '815100', '97.10788', '33.36899', '97.114377', '33.375025', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (632724, 632700, 3, '治多县', '治多', '0976', '815400', '95.61572', '33.8528', '95.622202', '33.858889', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (632725, 632700, 3, '囊谦县', '囊谦', '0976', '815200', '96.47753', '32.20359', '96.483949', '32.209882', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (632726, 632700, 3, '曲麻莱县', '曲麻莱', '0976', '815500', '95.79757', '34.12609', '95.804122', '34.131984', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (632800, 630000, 2, '海西蒙古族藏族自治州', '海西', '0977', '817000', '97.370785', '37.374663', '97.377389', '37.380406', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (632801, 632800, 3, '格尔木市', '格尔木', '0979', '816000', '94.90329', '36.40236', '94.909735', '36.408548', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (632802, 632800, 3, '德令哈市', '德令哈', '0977', '817000', '97.36084', '37.36946', '97.36741', '37.375307', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (632803, 632800, 3, '茫崖市', '茫崖', '0977', '817400', '90.858981', '38.250344', '90.8654', '38.256485', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (632821, 632800, 3, '乌兰县', '乌兰', '0977', '817100', '98.48196', '36.93471', '98.488487', '36.940582', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (632822, 632800, 3, '都兰县', '都兰', '0977', '816100', '98.09228', '36.30135', '98.098879', '36.307079', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (632823, 632800, 3, '天峻县', '天峻', '0977', '817200', '99.02453', '37.30326', '99.030984', '37.309339', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (640000, 100000, 1, '宁夏回族自治区', '宁夏', NULL, NULL, '106.278179', '38.46637', '106.28474', '38.472183', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (640100, 640000, 2, '银川市', '银川', '0951', '750000', '106.278179', '38.46637', '106.28474', '38.472183', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (640104, 640100, 3, '兴庆区', '兴庆', '0951', '750000', '106.28872', '38.47392', '106.295215', '38.479894', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (640105, 640100, 3, '西夏区', '西夏', '0951', '750000', '106.15023', '38.49137', '106.156811', '38.497089', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (640106, 640100, 3, '金凤区', '金凤', '0951', '750000', '106.24261', '38.47294', '106.249169', '38.47874', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (640121, 640100, 3, '永宁县', '永宁', '0951', '750100', '106.2517', '38.27559', '106.2583', '38.281299', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (640122, 640100, 3, '贺兰县', '贺兰', '0951', '750200', '106.34982', '38.5544', '106.356337', '38.56041', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (640181, 640100, 3, '灵武市', '灵武', '0951', '751400', '106.33999', '38.10266', '106.34643', '38.108819', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (640182, 640100, 3, '经济开发区', '经济开发区', '0951', '750000', '106.223199', '38.479626', '106.229643', '38.485731', NULL, '经济技术开发区');
INSERT INTO `yx_dev_region` VALUES (640200, 640000, 2, '石嘴山市', '石嘴山', '0952', '753000', '106.376173', '39.01333', '106.3828', '39.019022', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (640202, 640200, 3, '大武口区', '大武口', '0952', '753000', '106.37717', '39.01226', '106.383797', '39.017948', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (640205, 640200, 3, '惠农区', '惠农', '0952', '753600', '106.71145', '39.13193', '106.71797', '39.13791', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (640221, 640200, 3, '平罗县', '平罗', '0952', '753400', '106.54538', '38.90429', '106.551814', '38.910527', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (640222, 640200, 3, '经济开发区', '经济开发区', '0952', '753000', '106.3157', '38.954601', '106.322073', '38.960907', NULL, '经济技术开发区');
INSERT INTO `yx_dev_region` VALUES (640300, 640000, 2, '吴忠市', '吴忠', '0953', '751100', '106.199409', '37.986165', '106.205789', '37.992481', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (640302, 640300, 3, '利通区', '利通', '0953', '751100', '106.20311', '37.98512', '106.209493', '37.991433', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (640303, 640300, 3, '红寺堡区', '红寺堡', '0953', '751900', '106.19822', '37.99747', '106.204592', '38.003782', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (640323, 640300, 3, '盐池县', '盐池', '0953', '751500', '107.40707', '37.7833', '107.41345', '37.789595', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (640324, 640300, 3, '同心县', '同心', '0953', '751300', '105.91418', '36.98116', '105.920779', '36.986932', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (640381, 640300, 3, '青铜峡市', '青铜峡', '0953', '751600', '106.07489', '38.02004', '106.081264', '38.026341', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (640400, 640000, 2, '固原市', '固原', '0954', '756000', '106.285241', '36.004561', '106.291772', '36.010484', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (640402, 640400, 3, '原州区', '原州', '0954', '756000', '106.28778', '36.00374', '106.294296', '36.009704', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (640422, 640400, 3, '西吉县', '西吉', '0954', '756200', '105.73107', '35.96616', '105.737461', '35.972419', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (640423, 640400, 3, '隆德县', '隆德', '0954', '756300', '106.12426', '35.61718', '106.130815', '35.622958', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (640424, 640400, 3, '泾源县', '泾源', '0954', '756400', '106.33902', '35.49072', '106.345443', '35.496887', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (640425, 640400, 3, '彭阳县', '彭阳', '0954', '756500', '106.64462', '35.85076', '106.651131', '35.856665', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (640500, 640000, 2, '中卫市', '中卫', '0955', '755000', '105.189568', '37.514951', '105.196153', '37.520669', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (640502, 640500, 3, '沙坡头区', '沙坡头', '0955', '755000', '105.18962', '37.51044', '105.196209', '37.51616', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (640521, 640500, 3, '中宁县', '中宁', '0955', '755100', '105.68515', '37.49149', '105.691686', '37.497413', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (640522, 640500, 3, '海原县', '海原', '0955', '755200', '105.64712', '36.56498', '105.653687', '36.570726', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (650000, 100000, 1, '新疆维吾尔自治区', '新疆', NULL, NULL, '87.617733', '43.792818', '87.624148', '43.798972', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (650100, 650000, 2, '乌鲁木齐市', '乌鲁木齐', '0991', '830000', '87.617733', '43.792818', '87.624148', '43.798972', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (650102, 650100, 3, '天山区', '天山', '0991', '830000', '87.63167', '43.79439', '87.638176', '43.800364', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (650103, 650100, 3, '沙依巴克区', '沙依巴克', '0991', '830000', '87.59788', '43.80118', '87.604251', '43.807442', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (650104, 650100, 3, '新市区', '新市', '0991', '830000', '87.57406', '43.84348', '87.580546', '43.849542', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (650105, 650100, 3, '水磨沟区', '水磨沟', '0991', '830000', '87.64249', '43.83247', '87.649088', '43.838319', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (650106, 650100, 3, '头屯河区', '头屯河', '0991', '830000', '87.29138', '43.85487', '87.298003', '43.860637', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (650107, 650100, 3, '达坂城区', '达坂城', '0991', '830039', '88.30697', '43.35797', '88.313385', '43.364184', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (650109, 650100, 3, '米东区', '米东', '0991', '830019', '87.68583', '43.94739', '87.692376', '43.953342', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (650121, 650100, 3, '乌鲁木齐县', '乌鲁木齐', '0991', '830000', '87.40939', '43.47125', '87.416019', '43.477036', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (650171, 650100, 3, '经济技术开发区', '经济开发区', '0991', '830000', '87.509399', '43.836413', '87.515912', '43.84243', NULL, '济技术开发区');
INSERT INTO `yx_dev_region` VALUES (650172, 650100, 3, '高新区', '高新区', '0991', '830000', '87.593147', '43.892697', '87.599506', '43.898934', NULL, '高新技术开发区经');
INSERT INTO `yx_dev_region` VALUES (650200, 650000, 2, '克拉玛依市', '克拉玛依', '0990', '834000', '84.873946', '45.595886', '84.88047', '45.601832', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (650202, 650200, 3, '独山子区', '独山子', '0992', '833600', '84.88671', '44.32867', '84.893322', '44.33448', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (650203, 650200, 3, '克拉玛依区', '克拉玛依', '0990', '834000', '84.86225', '45.59089', '84.868688', '45.596986', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (650204, 650200, 3, '白碱滩区', '白碱滩', '0990', '834008', '85.13244', '45.68768', '85.139049', '45.693435', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (650205, 650200, 3, '乌尔禾区', '乌尔禾', '0990', '834014', '85.69143', '46.09006', '85.697825', '46.096277', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (650400, 650000, 2, '吐鲁番市', '吐鲁番', '0995', '838000', '89.184078', '42.947613', '89.190528', '42.953689', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (650402, 650400, 3, '高昌区', '高昌', '0995', '838000', '89.18579', '42.93505', '89.192244', '42.9411', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (650421, 650400, 3, '鄯善县', '鄯善', '0995', '838200', '90.21402', '42.8635', '90.22051', '42.869565', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (650422, 650400, 3, '托克逊县', '托克逊', '0995', '838100', '88.65823', '42.79231', '88.664666', '42.798416', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (650500, 650000, 2, '哈密市', '哈密', '0902', '839000', '93.51316', '42.833248', '93.519675', '42.839199', '行政区', '地级市');
INSERT INTO `yx_dev_region` VALUES (650502, 650500, 3, '伊州区', '哈密', '0902', '839000', '93.514797', '42.827255', '93.521318', '42.83318', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (650521, 650500, 3, '巴里坤哈萨克自治县', '巴里坤', '0902', '839200', '93.01236', '43.59993', '93.018771', '43.60616', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (650522, 650500, 3, '伊吾县', '伊吾', '0902', '839300', '94.69403', '43.2537', '94.70044', '43.259914', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (652300, 650000, 2, '昌吉回族自治州', '昌吉', '0994', '831100', '87.304012', '44.014577', '87.310624', '44.020312', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (652301, 652300, 3, '昌吉市', '昌吉', '0994', '831100', '87.30249', '44.01267', '87.309103', '44.018401', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (652302, 652300, 3, '阜康市', '阜康', '0994', '831500', '87.98529', '44.1584', '87.991756', '44.164464', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (652323, 652300, 3, '呼图壁县', '呼图壁', '0994', '831200', '86.89892', '44.18977', '86.905365', '44.195922', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (652324, 652300, 3, '玛纳斯县', '玛纳斯', '0994', '832200', '86.2145', '44.30438', '86.221144', '44.310141', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (652325, 652300, 3, '奇台县', '奇台', '0994', '831800', '89.5932', '44.02221', '89.599787', '44.027996', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (652327, 652300, 3, '吉木萨尔县', '吉木萨尔', '0994', '831700', '89.18078', '44.00048', '89.187203', '44.006596', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (652328, 652300, 3, '木垒哈萨克自治县', '木垒', '0994', '831900', '90.28897', '43.83508', '90.295598', '43.840861', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (652700, 650000, 2, '博尔塔拉蒙古自治州', '博尔塔拉', '0909', '833400', '82.074778', '44.903258', '82.081165', '44.909504', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (652701, 652700, 3, '博乐市', '博乐', '0909', '833400', '82.0713', '44.90052', '82.077694', '44.90675', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (652702, 652700, 3, '阿拉山口市', '阿拉山口', '0909', '833400', '82.567721', '45.170616', '82.574105', '45.176848', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (652722, 652700, 3, '精河县', '精河', '0909', '833300', '82.89419', '44.60774', '82.900643', '44.613785', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (652723, 652700, 3, '温泉县', '温泉', '0909', '833500', '81.03134', '44.97373', '81.037832', '44.979703', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (652800, 650000, 2, '巴音郭楞蒙古自治州', '巴音郭楞', '0996', '841000', '86.150969', '41.768552', '86.157365', '41.774786', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (652801, 652800, 3, '库尔勒市', '库尔勒', '0996', '841000', '86.15528', '41.76602', '86.161664', '41.772273', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (652822, 652800, 3, '轮台县', '轮台', '0996', '841600', '84.26101', '41.77642', '84.267467', '41.782541', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (652823, 652800, 3, '尉犁县', '尉犁', '0996', '841500', '86.25903', '41.33632', '86.265477', '41.342439', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (652824, 652800, 3, '若羌县', '若羌', '0996', '841800', '88.16812', '39.0179', '88.174646', '39.023881', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (652825, 652800, 3, '且末县', '且末', '0996', '841900', '85.52975', '38.14534', '85.536239', '38.151331', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (652826, 652800, 3, '焉耆回族自治县', '焉耆', '0996', '841100', '86.5744', '42.059', '86.581022', '42.064752', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (652827, 652800, 3, '和静县', '和静', '0996', '841300', '86.39611', '42.31838', '86.402471', '42.324627', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (652828, 652800, 3, '和硕县', '和硕', '0996', '841200', '86.86392', '42.26814', '86.870353', '42.274322', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (652829, 652800, 3, '博湖县', '博湖', '0996', '841400', '86.63333', '41.98014', '86.639696', '41.986377', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (652871, 652800, 3, '库尔勒开发区', '库尔勒开发区', '0996', '841000', '86.243095', '41.711313', '86.249629', '41.717217', NULL, '经济技术开发区');
INSERT INTO `yx_dev_region` VALUES (652900, 650000, 2, '阿克苏地区', '阿克苏', '0997', '843000', '80.265068', '41.170712', '80.27149', '41.176888', '行政区', '地区');
INSERT INTO `yx_dev_region` VALUES (652901, 652900, 3, '阿克苏市', '阿克苏', '0997', '843000', '80.26338', '41.16754', '80.269807', '41.173699', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (652922, 652900, 3, '温宿县', '温宿', '0997', '843100', '80.24173', '41.27679', '80.248279', '41.282687', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (652923, 652900, 3, '库车县', '库车', '0997', '842000', '82.96209', '41.71793', '82.96865', '41.723776', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (652924, 652900, 3, '沙雅县', '沙雅', '0997', '842200', '82.78131', '41.22497', '82.787736', '41.231106', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (652925, 652900, 3, '新和县', '新和', '0997', '842100', '82.61053', '41.54964', '82.617158', '41.555431', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (652926, 652900, 3, '拜城县', '拜城', '0997', '842300', '81.87564', '41.79801', '81.882193', '41.803947', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (652927, 652900, 3, '乌什县', '乌什', '0997', '843400', '79.22937', '41.21569', '79.23587', '41.2217', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (652928, 652900, 3, '阿瓦提县', '阿瓦提', '0997', '843200', '80.38336', '40.63926', '80.389766', '40.645408', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (652929, 652900, 3, '柯坪县', '柯坪', '0997', '843600', '79.04751', '40.50585', '79.05402', '40.511816', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (653000, 650000, 2, '克孜勒苏柯尔克孜自治州', '克孜勒苏', '0908', '845350', '76.172825', '39.713431', '76.179301', '39.719462', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (653001, 653000, 3, '阿图什市', '阿图什', '0908', '845350', '76.16827', '39.71615', '76.174777', '39.722127', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (653022, 653000, 3, '阿克陶县', '阿克陶', '0908', '845550', '75.94692', '39.14892', '75.953347', '39.155106', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (653023, 653000, 3, '阿合奇县', '阿合奇', '0997', '843500', '78.44848', '40.93947', '78.455005', '40.945459', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (653024, 653000, 3, '乌恰县', '乌恰', '0908', '845450', '75.25839', '39.71984', '75.264822', '39.725969', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (653100, 650000, 2, '喀什地区', '喀什', '0998', '844000', '75.989138', '39.467664', '75.995622', '39.473669', '行政区', '地区');
INSERT INTO `yx_dev_region` VALUES (653101, 653100, 3, '喀什市', '喀什', '0998', '844000', '75.99379', '39.46768', '76.000303', '39.47363', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (653121, 653100, 3, '疏附县', '疏附', '0998', '844100', '75.86029', '39.37534', '75.866745', '39.381457', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (653122, 653100, 3, '疏勒县', '疏勒', '0998', '844200', '76.05398', '39.40625', '76.060467', '39.412303', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (653123, 653100, 3, '英吉沙县', '英吉沙', '0998', '844500', '76.17565', '38.92968', '76.182125', '38.935751', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (653124, 653100, 3, '泽普县', '泽普', '0998', '844800', '77.27145', '38.18935', '77.277865', '38.195568', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (653125, 653100, 3, '莎车县', '莎车', '0998', '844700', '77.24316', '38.41601', '77.249714', '38.421935', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (653126, 653100, 3, '叶城县', '叶城', '0998', '844900', '77.41659', '37.88324', '77.423', '37.889382', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (653127, 653100, 3, '麦盖提县', '麦盖提', '0998', '844600', '77.64224', '38.89662', '77.648638', '38.902858', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (653128, 653100, 3, '岳普湖县', '岳普湖', '0998', '844400', '76.77233', '39.23561', '76.778812', '39.241636', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (653129, 653100, 3, '伽师县', '伽师', '0998', '844300', '76.72372', '39.48801', '76.730305', '39.493862', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (653130, 653100, 3, '巴楚县', '巴楚', '0998', '843800', '78.54888', '39.7855', '78.555482', '39.791287', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (653131, 653100, 3, '塔什库尔干塔吉克自治县', '塔什库尔干塔吉克', '0998', '845250', '75.23196', '37.77893', '75.238341', '37.785128', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (653200, 650000, 2, '和田地区', '和田', '0903', '848000', '79.92533', '37.110687', '79.931741', '37.116926', '行政区', '地区');
INSERT INTO `yx_dev_region` VALUES (653201, 653200, 3, '和田市', '和田市', '0903', '848000', '79.91353', '37.11214', '79.919943', '37.118374', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (653221, 653200, 3, '和田县', '和田县', '0903', '848000', '79.82874', '37.08922', '79.835241', '37.09524', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (653222, 653200, 3, '墨玉县', '墨玉', '0903', '848100', '79.74035', '37.27248', '79.746951', '37.278236', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (653223, 653200, 3, '皮山县', '皮山', '0903', '845150', '78.28125', '37.62007', '78.287813', '37.625939', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (653224, 653200, 3, '洛浦县', '洛浦', '0903', '848200', '80.18536', '37.07364', '80.191827', '37.079695', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (653225, 653200, 3, '策勒县', '策勒', '0903', '848300', '80.80999', '36.99843', '80.816603', '37.004228', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (653226, 653200, 3, '于田县', '于田', '0903', '848400', '81.66717', '36.854', '81.673785', '36.859778', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (653227, 653200, 3, '民丰县', '民丰', '0903', '848500', '82.68444', '37.06577', '82.690819', '37.072006', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (654000, 650000, 2, '伊犁哈萨克自治州', '伊犁', '0999', '835000', '81.317946', '43.92186', '81.324525', '43.927717', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (654002, 654000, 3, '伊宁市', '伊宁', '0999', '835000', '81.32932', '43.91294', '81.335818', '43.918928', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (654003, 654000, 3, '奎屯市', '奎屯', '0992', '833200', '84.90228', '44.425', '84.908929', '44.430756', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (654004, 654000, 3, '霍尔果斯市', '霍尔果斯', '0999', '835221', '80.418189', '44.205778', '80.424624', '44.211924', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (654021, 654000, 3, '伊宁县', '伊宁', '0999', '835100', '81.52764', '43.97863', '81.534247', '43.984436', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (654022, 654000, 3, '察布查尔锡伯自治县', '察布查尔锡伯', '0999', '835300', '81.14956', '43.84023', '81.156072', '43.846244', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (654023, 654000, 3, '霍城县', '霍城', '0999', '835200', '80.87826', '44.0533', '80.88464', '44.059548', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (654024, 654000, 3, '巩留县', '巩留', '0999', '835400', '82.22851', '43.48429', '82.235013', '43.490316', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (654025, 654000, 3, '新源县', '新源', '0999', '835800', '83.26095', '43.4284', '83.267369', '43.43453', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (654026, 654000, 3, '昭苏县', '昭苏', '0999', '835600', '81.1307', '43.15828', '81.137076', '43.164479', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (654027, 654000, 3, '特克斯县', '特克斯', '0999', '835500', '81.84005', '43.21938', '81.846435', '43.225633', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (654028, 654000, 3, '尼勒克县', '尼勒克', '0999', '835700', '82.51184', '43.79901', '82.518446', '43.804808', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (654200, 650000, 2, '塔城地区', '塔城', '0901', '834700', '82.985732', '46.746301', '82.99236', '46.75206', '行政区', '地区');
INSERT INTO `yx_dev_region` VALUES (654201, 654200, 3, '塔城市', '塔城', '0901', '834700', '82.97892', '46.74852', '82.985553', '46.754267', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (654202, 654200, 3, '乌苏市', '乌苏', '0992', '833000', '84.68258', '44.43729', '84.689147', '44.443202', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (654221, 654200, 3, '额敏县', '额敏', '0901', '834600', '83.62872', '46.5284', '83.635087', '46.534599', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (654223, 654200, 3, '沙湾县', '沙湾', '0993', '832100', '85.61932', '44.33144', '85.625961', '44.337187', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (654224, 654200, 3, '托里县', '托里', '0901', '834500', '83.60592', '45.93623', '83.612433', '45.942168', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (654225, 654200, 3, '裕民县', '裕民', '0901', '834800', '82.99002', '46.20377', '82.996643', '46.209556', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (654226, 654200, 3, '和布克赛尔蒙古自治县', '和布克赛尔', '0990', '834400', '85.72662', '46.79362', '85.733222', '46.79942', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (654300, 650000, 2, '阿勒泰地区', '阿勒泰', '0906', '836500', '88.13963', '47.848393', '88.146256', '47.854119', '行政区', '地区');
INSERT INTO `yx_dev_region` VALUES (654301, 654300, 3, '阿勒泰市', '阿勒泰', '0906', '836500', '88.13913', '47.8317', '88.145763', '47.83743', '行政区', '县级市');
INSERT INTO `yx_dev_region` VALUES (654321, 654300, 3, '布尔津县', '布尔津', '0906', '836600', '86.85751', '47.70062', '86.863955', '47.70672', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (654322, 654300, 3, '富蕴县', '富蕴', '0906', '836100', '89.52679', '46.99444', '89.533146', '47.000685', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (654323, 654300, 3, '福海县', '福海', '0906', '836400', '87.49508', '47.11065', '87.501471', '47.11683', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (654324, 654300, 3, '哈巴河县', '哈巴河', '0906', '836700', '86.42092', '48.06046', '86.427354', '48.066578', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (654325, 654300, 3, '青河县', '青河', '0906', '836200', '90.38305', '46.67382', '90.389495', '46.679914', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (654326, 654300, 3, '吉木乃县', '吉木乃', '0906', '836800', '85.87814', '47.43359', '85.88474', '47.43945', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (659001, 650000, 2, '石河子市', '石河子', '0993', '832000', '86.041075', '44.305886', '86.04746', '44.312153', '行政区', '直辖县级市');
INSERT INTO `yx_dev_region` VALUES (659002, 650000, 2, '阿拉尔市', '阿拉尔', '0997', '843300', '81.285884', '40.541914', '81.292459', '40.547727', '行政区', '直辖县级市');
INSERT INTO `yx_dev_region` VALUES (659003, 650000, 2, '图木舒克市', '图木舒克', '0998', '843806', '79.077978', '39.867316', '79.084377', '39.873561', '行政区', '直辖县级市');
INSERT INTO `yx_dev_region` VALUES (659004, 650000, 2, '五家渠市', '五家渠', '0994', '831300', '87.526884', '44.167401', '87.533493', '44.173201', '行政区', '直辖县级市');
INSERT INTO `yx_dev_region` VALUES (659005, 650000, 2, '北屯市', '北屯', '0906', '836000', '87.808456', '47.362308', '87.814951', '47.368278', '行政区', '直辖县级市');
INSERT INTO `yx_dev_region` VALUES (659006, 650000, 2, '铁门关市', '铁门关', '0906', '836000', '86.194687', '41.811007', '86.201226', '41.816948', '行政区', '直辖县级市');
INSERT INTO `yx_dev_region` VALUES (659007, 650000, 2, '双河市', '双河', '0909', '833408', '82.353656', '44.840524', '82.360166', '44.846469', '行政区', '直辖县级市');
INSERT INTO `yx_dev_region` VALUES (659008, 650000, 2, '可克达拉市', '可克达拉', '0999', '835213', '80.624235', '44.126966', '80.630628', '44.133121', '行政区', '直辖县级市');
INSERT INTO `yx_dev_region` VALUES (659009, 650000, 2, '昆玉市', '昆玉', '0903', '848000', '79.918141', '37.096411', '79.924544', '37.102656', '行政区', '直辖县级市');
INSERT INTO `yx_dev_region` VALUES (659101, 659001, 3, '新城街道', '新城街道', '0993', '832000', '86.027642', '44.29313', '86.034047', '44.299342', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (659102, 659001, 3, '向阳街道', '向阳街道', '0993', '832000', '86.054413', '44.307129', '86.060834', '44.313326', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (659103, 659001, 3, '红山街道', '红山街道', '0993', '832000', '86.044978', '44.29856', '86.051364', '44.304817', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (659104, 659001, 3, '老街街道', '老街街道', '0993', '832000', '86.039023', '44.316702', '86.045407', '44.322968', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (659105, 659001, 3, '东城街道', '东城街道', '0993', '832000', '86.09183', '44.310211', '86.098469', '44.315985', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (659106, 659001, 3, '北泉镇', '北泉镇', '0993', '832011', '86.016731', '44.333841', '86.023191', '44.339933', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (659107, 659001, 3, '石河子乡', '石河子乡', '0993', '832099', '86.035442', '44.286537', '86.041819', '44.292791', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (659108, 659001, 3, '一五二团', '一五二团', '0993', '832099', '86.047665', '44.289252', '86.054051', '44.295494', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (659201, 659002, 3, '幸福路街道', '阿拉尔', '0997', '843302', '81.285043', '40.544189', '81.291616', '40.55001', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (659202, 659002, 3, '金银川路街道', '金银川路街道', '0997', '843300', '81.2758', '40.548049', '81.282326', '40.553971', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (659203, 659002, 3, '青松路街道', '青松路街道', '0997', '843300', '81.265448', '40.551269', '81.271911', '40.557323', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (659204, 659002, 3, '南口街道', '南口街道', '0997', '843301', '81.308342', '40.506414', '81.314946', '40.51219', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (659205, 659002, 3, '托喀依乡', '托喀依乡', '0997', '843300', '81.120055', '40.538677', '81.126417', '40.544912', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (659206, 659002, 3, '金银川镇', '阿拉尔', '0997', '843008', '79.958753', '40.745954', '79.965302', '40.751845', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (659301, 659003, 3, '图木舒克市区', '图木舒克市区', '0998', '843806', '79.072007', '39.868673', '79.078416', '39.874899', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (659302, 659003, 3, '兵团四十四团', '兵团四十四团', '0998', '843806', '79.137663', '39.827301', '79.144271', '39.83306', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (659303, 659003, 3, '兵团四十九团', '兵团四十九团', '0998', '843806', '78.917058', '39.705154', '78.92362', '39.710999', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (659304, 659003, 3, '兵团五十团', '兵团五十团', '0998', '843806', '79.242827', '39.946008', '79.24939', '39.951854', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (659305, 659003, 3, '兵团五十一团', '兵团五十一团', '0998', '843806', '79.143243', '39.978939', '79.149876', '39.984713', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (659306, 659003, 3, '兵团五十二团', '兵团五十二团', '0998', '843806', '79.10236', '39.879874', '79.108829', '39.885974', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (659307, 659003, 3, '兵团五十三团', '兵团五十三团', '0998', '843806', '79.420571', '40.030333', '79.426999', '40.036454', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (659308, 659003, 3, '喀拉拜勒镇', '喀拉拜勒', '0998', '843806', '78.8737', '39.68535', '78.880206', '39.691296', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (659309, 659003, 3, '永安坝', '永安坝', '0998', '843806', '79.021035', '39.846305', '79.02766', '39.852071', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (659401, 659004, 3, '城区', '城区', '0994', '831300', '87.53521', '44.129486', '87.54182', '44.135223', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (659402, 659004, 3, '一零一团', '一零一团', '0994', '831300', '87.528515', '44.162252', '87.535126', '44.168037', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (659403, 659004, 3, '一零二团', '一零二团', '0994', '831300', '87.648592', '44.266388', '87.65519', '44.272165', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (659404, 659004, 3, '一零三团', '一零三团', '0994', '831300', '87.528519', '44.527921', '87.535136', '44.533708', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (659501, 659005, 3, '新城区', '新城', '0906', '836000', '87.800338', '47.354533', '87.806895', '47.360399', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (659502, 659005, 3, '老城区', '老城', '0906', '836000', '87.808456', '47.362308', '87.814951', '47.368278', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (659503, 659005, 3, '工业园区', '工业园', '0906', '836000', '87.780612', '47.231226', '87.787244', '47.236958', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (659504, 659005, 3, '海川镇', '海川', '0906', '836000', '87.790949', '47.343443', '87.797565', '47.34922', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (659505, 659005, 3, '丰庆镇', '丰庆', '0906', '836000', '87.992437', '47.273735', '87.998949', '47.279698', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (659506, 659005, 3, '锡伯渡镇', '锡伯渡', '0906', '836000', '88.095016', '47.260134', '88.101401', '47.266313', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (659601, 659006, 3, '二十九团场', '二十九团场', '0906', '836000', '85.659021', '41.819144', '85.665465', '41.825261', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (659602, 659006, 3, '库西经济工业园', '库西经济工业园', '0906', '836000', '85.712205', '41.854188', '85.718702', '41.86015', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (659603, 659006, 3, '博古其镇', '博古其镇', '0906', '836000', '86.029663', '41.793293', '86.036073', '41.799523', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (659604, 659006, 3, '双丰镇', '双丰镇', '0906', '836000', '85.501779', '41.826156', '85.508398', '41.831898', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (659701, 659007, 3, '八十一团', '八十一团', '0909', '833408', '82.440002', '44.78414', '82.446384', '44.790396', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (659702, 659007, 3, '八十四团', '八十四团', '0909', '833408', '82.06305', '44.995778', '82.069461', '45.001931', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (659703, 659007, 3, '八十五团', '八十五团', '0909', '833408', '82.14409', '44.830917', '82.150712', '44.836671', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (659704, 659007, 3, '八十六团', '八十六团', '0909', '833408', '82.193835', '44.888208', '82.200215', '44.894446', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (659705, 659007, 3, '八十九团', '八十九团', '0909', '833408', '82.44737', '44.849095', '82.453728', '44.855315', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (659706, 659007, 3, '九十团', '九十团', '0909', '833408', '82.595543', '44.822492', '82.602079', '44.82842', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (659801, 659008, 3, '63团', '63团', '0999', '835213', '80.544984', '43.968611', '80.55146', '43.974679', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (659802, 659008, 3, '64团', '64团', '0999', '835213', '80.643848', '44.127782', '80.650201', '44.13401', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (659803, 659008, 3, '66团', '66团', '0999', '835213', '81.043819', '43.943968', '81.050423', '43.949816', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (659804, 659008, 3, '67团', '67团', '0999', '835213', '80.757732', '43.802029', '80.764103', '43.808271', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (659805, 659008, 3, '68团', '68团', '0999', '835213', '80.624235', '44.126966', '80.630628', '44.133121', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (659901, 659009, 3, '皮山农场', '皮山农场', '0903', '848000', '77.794153', '37.226445', '77.800695', '37.232403', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (659902, 659009, 3, '二二四团', '二二四团', '0903', '848000', '79.290212', '37.211706', '79.296721', '37.217714', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (659903, 659009, 3, '四十七团', '四十七团', '0903', '848000', '79.648416', '37.510671', '79.654916', '37.516647', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (659904, 659009, 3, '一牧场', '一牧场', '0903', '848000', '81.033128', '36.263196', '81.039663', '36.269164', NULL, '拓展');
INSERT INTO `yx_dev_region` VALUES (710000, 100000, 1, '台湾', '台湾', NULL, NULL, '121.509062', '25.044332', '121.51561', '25.050004', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710100, 710000, 2, '台北市', '台北', '02', '1', '121.565170', '25.037798', '121.571582', '25.044146', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710101, 710100, 3, '松山区', '松山', '02', '105', '121.577206', '25.049698', '121.58364', '25.05592', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710102, 710100, 3, '信义区', '信义', '02', '110', '121.751381', '25.129407', '121.757954', '25.135107', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710103, 710100, 3, '大安区', '大安', '02', '106', '121.534648', '25.026406', '121.541123', '25.032493', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710104, 710100, 3, '中山区', '中山', '02', '104', '121.533468', '25.064361', '121.53994', '25.070424', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710105, 710100, 3, '中正区', '中正', '02', '100', '121.518267', '25.032361', '121.524798', '25.038148', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710106, 710100, 3, '大同区', '大同', '02', '103', '121.515514', '25.065986', '121.522053', '25.071733', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710107, 710100, 3, '万华区', '万华', '02', '108', '121.499332', '25.031933', '121.505896', '25.037566', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710108, 710100, 3, '文山区', '文山', '02', '116', '121.570458', '24.989786', '121.576914', '24.996101', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710109, 710100, 3, '南港区', '南港', '02', '115', '121.606858', '25.054656', '121.613397', '25.06037', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710110, 710100, 3, '内湖区', '内湖', '02', '114', '121.588998', '25.069664', '121.595484', '25.075681', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710111, 710100, 3, '士林区', '士林', '02', '111', '121.519874', '25.092822', '121.526424', '25.09864', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710112, 710100, 3, '北投区', '北投', '02', '112', '121.501379', '25.132419', '121.507962', '25.138057', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710200, 710000, 2, '高雄市', '高雄', '07', '8', '120.311922', '22.620856', '120.318476', '22.626563', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710201, 710200, 3, '盐埕区', '盐埕', '07', '803', '120.286795', '22.624666', '120.293343', '22.630387', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710202, 710200, 3, '鼓山区', '鼓山', '07', '804', '120.281154', '22.636797', '120.287676', '22.642595', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710203, 710200, 3, '左营区', '左营', '07', '813', '120.294958', '22.690124', '120.301534', '22.695777', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710204, 710200, 3, '楠梓区', '楠梓', '07', '811', '120.326314', '22.728401', '120.332838', '22.734334', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710205, 710200, 3, '三民区', '三民', '07', '807', '120.299622', '22.647695', '120.30617', '22.65333', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710206, 710200, 3, '新兴区', '新兴', '07', '800', '120.309535', '22.631147', '120.316084', '22.636828', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710207, 710200, 3, '前金区', '前金', '07', '801', '120.294159', '22.627421', '120.300716', '22.633075', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710208, 710200, 3, '苓雅区', '苓雅', '07', '802', '120.312347', '22.621770', '120.318899', '22.627482', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710209, 710200, 3, '前镇区', '前镇', '07', '806', '120.318583', '22.586425', '120.32514', '22.592225', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710210, 710200, 3, '旗津区', '旗津', '07', '805', '120.284429', '22.590565', '120.290995', '22.596321', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710211, 710200, 3, '小港区', '小港', '07', '812', '120.337970', '22.565354', '120.344448', '22.571501', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710212, 710200, 3, '凤山区', '凤山', '07', '830', '120.356892', '22.626945', '120.363318', '22.6333', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710213, 710200, 3, '林园区', '林园', '07', '832', '120.395977', '22.501490', '120.402496', '22.507379', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710214, 710200, 3, '大寮区', '大寮', '07', '831', '120.395422', '22.605386', '120.401955', '22.611287', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710215, 710200, 3, '大树区', '大树', '07', '840', '120.433095', '22.693394', '120.43966', '22.699117', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710216, 710200, 3, '大社区', '大社', '07', '815', '120.346635', '22.729966', '120.353093', '22.736244', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710217, 710200, 3, '仁武区', '仁武', '07', '814', '120.347779', '22.701901', '120.354242', '22.708194', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710218, 710200, 3, '鸟松区', '鸟松', '07', '833', '120.364402', '22.659340', '120.370818', '22.665688', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710219, 710200, 3, '冈山区', '冈山', '07', '820', '120.295820', '22.796762', '120.302383', '22.802409', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710220, 710200, 3, '桥头区', '桥头', '07', '825', '120.305741', '22.757501', '120.312291', '22.763153', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710221, 710200, 3, '燕巢区', '燕巢', '07', '824', '120.361956', '22.793370', '120.368381', '22.799728', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710222, 710200, 3, '田寮区', '田寮', '07', '823', '120.359636', '22.869307', '120.366058', '22.875666', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710223, 710200, 3, '阿莲区', '阿莲', '07', '822', '120.327036', '22.883703', '120.333528', '22.889644', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710224, 710200, 3, '路竹区', '路竹', '07', '821', '120.261828', '22.856851', '120.268303', '22.863001', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710225, 710200, 3, '湖内区', '湖内', '07', '829', '120.211530', '22.908188', '120.218013', '22.914215', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710226, 710200, 3, '茄萣区', '茄萣', '07', '852', '120.182815', '22.906556', '120.18937', '22.912197', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710227, 710200, 3, '永安区', '永安', '07', '828', '120.225308', '22.818580', '120.231775', '22.824842', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710228, 710200, 3, '弥陀区', '弥陀', '07', '827', '120.247344', '22.782879', '120.253765', '22.78921', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710229, 710200, 3, '梓官区', '梓官', '07', '826', '120.267322', '22.760475', '120.273795', '22.766522', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710230, 710200, 3, '旗山区', '旗山', '07', '842', '120.483550', '22.888491', '120.489963', '22.894843', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710231, 710200, 3, '美浓区', '美浓', '07', '843', '120.541530', '22.897880', '120.54808', '22.903516', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710232, 710200, 3, '六龟区', '六龟', '07', '844', '120.633418', '22.997914', '120.639914', '23.003847', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710233, 710200, 3, '甲仙区', '甲仙', '07', '847', '120.591185', '23.084688', '120.597637', '23.091015', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710234, 710200, 3, '杉林区', '杉林', '07', '846', '120.538980', '22.970712', '120.545558', '22.976353', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710235, 710200, 3, '内门区', '内门', '07', '845', '120.462351', '22.943437', '120.468828', '22.949658', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710236, 710200, 3, '茂林区', '茂林', '07', '851', '120.663217', '22.886248', '120.669765', '22.891887', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710237, 710200, 3, '桃源区', '桃源', '07', '848', '120.760049', '23.159137', '120.766583', '23.164955', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710238, 710200, 3, '那玛夏区', '那玛夏', '07', '849', '120.692799', '23.216964', '120.699292', '23.223017', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710300, 710000, 2, '基隆市', '基隆', '02', '2', '121.746248', '25.130741', '121.752829', '25.136397', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710301, 710300, 3, '中正区', '中正', '02', '202', '121.518267', '25.032361', '121.524798', '25.038148', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710302, 710300, 3, '七堵区', '七堵', '02', '206', '121.713032', '25.095739', '121.719558', '25.101684', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710303, 710300, 3, '暖暖区', '暖暖', '02', '205', '121.736102', '25.099777', '121.742693', '25.105423', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710304, 710300, 3, '仁爱区', '仁爱', '02', '200', '121.740940', '25.127526', '121.747527', '25.133164', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710305, 710300, 3, '中山区', '中山', '02', '203', '121.739132', '25.133991', '121.745713', '25.139627', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710306, 710300, 3, '安乐区', '安乐', '02', '204', '121.723203', '25.120910', '121.729768', '25.126681', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710307, 710300, 3, '信义区', '信义', '02', '201', '121.751381', '25.129407', '121.757954', '25.135107', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710400, 710000, 2, '台中市', '台中', '04', '4', '120.679040', '24.138620', '120.685596', '24.144427', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710401, 710400, 3, '中区', '中区', '04', '400', '120.679510', '24.143830', '120.686066', '24.149645', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710402, 710400, 3, '东区', '东区', '04', '401', '120.704', '24.13662', '120.710467', '24.142865', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710403, 710400, 3, '南区', '南区', '04', '402', '120.188648', '22.960944', '120.195226', '22.966623', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710404, 710400, 3, '西区', '西区', '04', '403', '120.67104', '24.14138', '120.677618', '24.14708', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710405, 710400, 3, '北区', '北区', '04', '404', '120.682410', '24.166040', '120.688951', '24.171902', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710406, 710400, 3, '西屯区', '西屯', '04', '407', '120.639820', '24.181340', '120.646354', '24.187162', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710407, 710400, 3, '南屯区', '南屯', '04', '408', '120.643080', '24.138270', '120.649642', '24.144044', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710408, 710400, 3, '北屯区', '北屯', '04', '406', '120.686250', '24.182220', '120.692762', '24.188149', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710409, 710400, 3, '丰原区', '丰原', '04', '420', '120.718460', '24.242190', '120.72489', '24.248551', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710410, 710400, 3, '东势区', '东势', '04', '423', '120.827770', '24.258610', '120.834228', '24.264904', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710411, 710400, 3, '大甲区', '大甲', '04', '437', '120.622390', '24.348920', '120.628851', '24.355058', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710412, 710400, 3, '清水区', '清水', '04', '436', '120.559780', '24.268650', '120.566337', '24.27447', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710413, 710400, 3, '沙鹿区', '沙鹿', '04', '433', '120.565700', '24.233480', '120.57221', '24.239398', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710414, 710400, 3, '梧栖区', '梧栖', '04', '435', '120.531520', '24.254960', '120.5381', '24.260636', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710415, 710400, 3, '后里区', '后里', '04', '421', '120.710710', '24.304910', '120.717141', '24.311229', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710416, 710400, 3, '神冈区', '神冈', '04', '429', '120.661550', '24.257770', '120.668138', '24.263412', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710417, 710400, 3, '潭子区', '潭子', '04', '427', '120.705160', '24.209530', '120.711589', '24.215784', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710418, 710400, 3, '大雅区', '大雅', '04', '428', '120.647780', '24.229230', '120.654328', '24.234938', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710419, 710400, 3, '新社区', '新社', '04', '426', '120.809500', '24.234140', '120.815996', '24.240129', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710420, 710400, 3, '石冈区', '石冈', '04', '422', '120.780410', '24.274980', '120.787002', '24.280622', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710421, 710400, 3, '外埔区', '外埔', '04', '438', '120.654370', '24.332010', '120.66092', '24.33766', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710422, 710400, 3, '大安区', '大安', '04', '439', '120.58652', '24.34607', '120.592951', '24.352343', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710423, 710400, 3, '乌日区', '乌日', '04', '414', '120.623810', '24.104500', '120.630273', '24.110612', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710424, 710400, 3, '大肚区', '大肚', '04', '432', '120.540960', '24.153660', '120.547552', '24.159303', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710425, 710400, 3, '龙井区', '龙井', '04', '434', '120.545940', '24.192710', '120.552497', '24.198363', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710426, 710400, 3, '雾峰区', '雾峰', '04', '413', '120.700200', '24.061520', '120.706662', '24.067704', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710427, 710400, 3, '太平区', '太平', '04', '411', '120.718523', '24.126472', '120.724957', '24.132834', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710428, 710400, 3, '大里区', '大里', '04', '412', '120.677860', '24.099390', '120.684386', '24.105172', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710429, 710400, 3, '和平区', '和平', '04', '424', '120.88349', '24.17477', '120.890042', '24.180536', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710500, 710000, 2, '台南市', '台南', '06', '7', '120.279363', '23.172478', '120.285908', '23.17831', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710501, 710500, 3, '东区', '东区', '06', '701', '120.224198', '22.980072', '120.230651', '22.986316', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710502, 710500, 3, '南区', '南区', '06', '702', '120.188648', '22.960944', '120.195226', '22.966623', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710504, 710500, 3, '北区', '北区', '06', '704', '120.682410', '24.166040', '120.688951', '24.171902', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710506, 710500, 3, '安南区', '安南', '06', '709', '120.184617', '23.047230', '120.191191', '23.052881', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710507, 710500, 3, '安平区', '安平', '06', '708', '120.166810', '23.000763', '120.173346', '23.006482', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710508, 710500, 3, '中西区', '中西', '06', '700', '120.205957', '22.992152', '120.21246', '22.998074', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710509, 710500, 3, '新营区', '新营', '06', '730', '120.316698', '23.310274', '120.323262', '23.316046', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710510, 710500, 3, '盐水区', '盐水', '06', '737', '120.266398', '23.319828', '120.272902', '23.325899', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710511, 710500, 3, '白河区', '白河', '06', '732', '120.415810', '23.351221', '120.422367', '23.356866', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710512, 710500, 3, '柳营区', '柳营', '06', '736', '120.311286', '23.278133', '120.317842', '23.283833', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710513, 710500, 3, '后壁区', '后壁', '06', '731', '120.362726', '23.366721', '120.369137', '23.373075', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710514, 710500, 3, '东山区', '东山', '06', '733', '120.403984', '23.326092', '120.410544', '23.331853', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710515, 710500, 3, '麻豆区', '麻豆', '06', '721', '120.248179', '23.181680', '120.254634', '23.188012', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710516, 710500, 3, '下营区', '下营', '06', '735', '120.264484', '23.235413', '120.27095', '23.241513', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710517, 710500, 3, '六甲区', '六甲', '06', '734', '120.347600', '23.231931', '120.354033', '23.238216', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710518, 710500, 3, '官田区', '官田', '06', '720', '120.314374', '23.194652', '120.320944', '23.200392', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710519, 710500, 3, '大内区', '大内', '06', '742', '120.348853', '23.119460', '120.355278', '23.125758', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710520, 710500, 3, '佳里区', '佳里', '06', '722', '120.177211', '23.165121', '120.183785', '23.170765', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710521, 710500, 3, '学甲区', '学甲', '06', '726', '120.180255', '23.232348', '120.186813', '23.237985', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710522, 710500, 3, '西港区', '西港', '06', '723', '120.203618', '23.123057', '120.210122', '23.128935', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710523, 710500, 3, '七股区', '七股', '06', '724', '120.140003', '23.140545', '120.146452', '23.146722', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710524, 710500, 3, '将军区', '将军', '06', '725', '120.156871', '23.199543', '120.163413', '23.205419', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710525, 710500, 3, '北门区', '北门', '06', '727', '120.125821', '23.267148', '120.132242', '23.273489', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710526, 710500, 3, '新化区', '新化', '06', '712', '120.310807', '23.038533', '120.317364', '23.044228', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710527, 710500, 3, '善化区', '善化', '06', '741', '120.296895', '23.132261', '120.303444', '23.137901', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710528, 710500, 3, '新市区', '新市', '06', '744', '120.295138', '23.07897', '120.301723', '23.084624', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710529, 710500, 3, '安定区', '安定', '06', '745', '120.237083', '23.121498', '120.243497', '23.127851', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710530, 710500, 3, '山上区', '山上', '06', '743', '120.352908', '23.103223', '120.35934', '23.109559', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710531, 710500, 3, '玉井区', '玉井', '06', '714', '120.460110', '23.123859', '120.466556', '23.130038', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710532, 710500, 3, '楠西区', '楠西', '06', '715', '120.485396', '23.173454', '120.491842', '23.179804', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710533, 710500, 3, '南化区', '南化', '06', '716', '120.477116', '23.042614', '120.48355', '23.048972', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710534, 710500, 3, '左镇区', '左镇', '06', '713', '120.407309', '23.057955', '120.413879', '23.063674', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710535, 710500, 3, '仁德区', '仁德', '06', '717', '120.251520', '22.972212', '120.257971', '22.978511', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710536, 710500, 3, '归仁区', '归仁', '06', '711', '120.293791', '22.967081', '120.300369', '22.972741', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710537, 710500, 3, '关庙区', '关庙', '06', '718', '120.327689', '22.962949', '120.334213', '22.968908', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710538, 710500, 3, '龙崎区', '龙崎', '06', '719', '120.360824', '22.965681', '120.367269', '22.972044', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710539, 710500, 3, '永康区', '永康', '06', '710', '120.257069', '23.026061', '120.263513', '23.032285', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710600, 710000, 2, '新竹市', '新竹', '03', '3', '120.968798', '24.806738', '120.975212', '24.813059', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710601, 710600, 3, '东区', '东区', '03', '300', '120.970239', '24.801337', '120.976657', '24.807645', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710602, 710600, 3, '北区', '北区', '03', NULL, '120.682410', '24.166040', '120.688951', '24.171902', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710603, 710600, 3, '香山区', '香山', '03', NULL, '120.956679', '24.768933', '120.963117', '24.775293', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710700, 710000, 2, '嘉义市', '嘉义', '05', '6', '120.452538', '23.481568', '120.459011', '23.487612', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710701, 710700, 3, '东区', '东区', '05', '600', '120.458009', '23.486213', '120.464461', '23.492356', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710702, 710700, 3, '西区', '西区', '05', '600', '120.437493', '23.473029', '120.444024', '23.478807', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710800, 710000, 2, '新北市', '新北', '02', '2', '121.465746', '25.012366', '121.472237', '25.018448', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710801, 710800, 3, '板桥区', '板桥', '02', '220', '121.459084', '25.009578', '121.465554', '25.015777', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710802, 710800, 3, '三重区', '三重', '02', '241', '121.488102', '25.061486', '121.494647', '25.067187', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710803, 710800, 3, '中和区', '中和', '02', '235', '121.498980', '24.999397', '121.505572', '25.005037', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710804, 710800, 3, '永和区', '永和', '02', '234', '121.513660', '25.007802', '121.520228', '25.013529', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710805, 710800, 3, '新庄区', '新庄', '02', '242', '121.450413', '25.035947', '121.456834', '25.042256', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710806, 710800, 3, '新店区', '新店', '02', '231', '121.541750', '24.967558', '121.548214', '24.97377', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710807, 710800, 3, '树林区', '树林', '02', '238', '121.420533', '24.990706', '121.427013', '24.996901', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710808, 710800, 3, '莺歌区', '莺歌', '02', '239', '121.354573', '24.955413', '121.361086', '24.961326', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710809, 710800, 3, '三峡区', '三峡', '02', '237', '121.368905', '24.934339', '121.375448', '24.940031', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710810, 710800, 3, '淡水区', '淡水', '02', '251', '121.440915', '25.169452', '121.44732', '25.175812', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710811, 710800, 3, '汐止区', '汐止', '02', '221', '121.629470', '25.062999', '121.636021', '25.068675', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710812, 710800, 3, '瑞芳区', '瑞芳', '02', '224', '121.810061', '25.108895', '121.816515', '25.115215', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710813, 710800, 3, '土城区', '土城', '02', '236', '121.443348', '24.972201', '121.449786', '24.978562', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710814, 710800, 3, '芦洲区', '芦洲', '02', '247', '121.473700', '25.084923', '121.480219', '25.090854', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710815, 710800, 3, '五股区', '五股', '02', '248', '121.438156', '25.082743', '121.444584', '25.089106', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710816, 710800, 3, '泰山区', '泰山', '02', '243', '121.430811', '25.058864', '121.437227', '25.065183', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710817, 710800, 3, '林口区', '林口', '02', '244', '121.391602', '25.077531', '121.398161', '25.083231', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710818, 710800, 3, '深坑区', '深坑', '02', '222', '121.615670', '25.002329', '121.622259', '25.007977', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710819, 710800, 3, '石碇区', '石碇', '02', '223', '121.658567', '24.991679', '121.665054', '24.997841', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710820, 710800, 3, '坪林区', '坪林', '02', '232', '121.711185', '24.937388', '121.717671', '24.943362', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710821, 710800, 3, '三芝区', '三芝', '02', '252', '121.500866', '25.258047', '121.507444', '25.263683', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710822, 710800, 3, '石门区', '石门', '02', '253', '121.568491', '25.290412', '121.574903', '25.296737', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710823, 710800, 3, '八里区', '八里', '02', '249', '121.398227', '25.146680', '121.404764', '25.152468', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710824, 710800, 3, '平溪区', '平溪', '02', '226', '121.738255', '25.025725', '121.744824', '25.03136', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710825, 710800, 3, '双溪区', '双溪', '02', '227', '121.865676', '25.033409', '121.872235', '25.039057', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710826, 710800, 3, '贡寮区', '贡寮', '02', '228', '121.908185', '25.022388', '121.914621', '25.028685', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710827, 710800, 3, '金山区', '金山', '02', '208', '121.636427', '25.221883', '121.642994', '25.227649', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710828, 710800, 3, '万里区', '万里', '02', '207', '121.688687', '25.181234', '121.695103', '25.187559', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (710829, 710800, 3, '乌来区', '乌来', '02', '233', '121.550531', '24.865296', '121.556984', '24.871621', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (712200, 710000, 2, '宜兰县', '宜兰', '03', '2', '121.500000', '24.600000', '121.506574', '24.605635', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (712201, 712200, 3, '宜兰市', '宜兰', '03', '260', '121.753476', '24.751682', '121.760052', '24.757408', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (712221, 712200, 3, '罗东镇', '罗东', '03', '265', '121.766919', '24.677033', '121.773416', '24.682971', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (712222, 712200, 3, '苏澳镇', '苏澳', '03', '270', '121.842656', '24.594622', '121.849196', '24.600396', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (712223, 712200, 3, '头城镇', '头城', '03', '261', '121.823307', '24.859217', '121.829798', '24.865346', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (712224, 712200, 3, '礁溪乡', '礁溪', '03', '262', '121.766680', '24.822345', '121.773177', '24.828279', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (712225, 712200, 3, '壮围乡', '壮围', '03', '263', '121.781619', '24.744949', '121.788095', '24.751162', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (712226, 712200, 3, '员山乡', '员山', '03', '264', '121.721733', '24.741771', '121.728294', '24.747564', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (712227, 712200, 3, '冬山乡', '冬山', '03', '269', '121.792280', '24.634514', '121.798731', '24.640854', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (712228, 712200, 3, '五结乡', '五结', '03', '268', '121.798297', '24.684640', '121.804704', '24.691', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (712229, 712200, 3, '三星乡', '三星', '03', '266', '121.003418', '23.775291', '121.009978', '23.781059', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (712230, 712200, 3, '大同乡', '大同', '03', '267', '121.605557', '24.675997', '121.612096', '24.681729', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (712231, 712200, 3, '南澳乡', '南澳', '03', '272', '121.799810', '24.465393', '121.806223', '24.471756', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (712300, 710000, 2, '桃园市', '桃园', '03', '3', '121.083000', '25.000000', '121.089443', '25.006362', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (712301, 712300, 3, '桃园市', '桃园', '03', '330', '121.301337', '24.993777', '121.307814', '24.999985', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (712302, 712300, 3, '中坜市', '中坜', '03', '320', '121.224926', '24.965353', '121.231412', '24.97145', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (712303, 712300, 3, '平镇市', '平镇', '03', '324', '121.218359', '24.945752', '121.224803', '24.951957', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (712304, 712300, 3, '八德市', '八德', '03', '334', '121.284655', '24.928651', '121.291156', '24.934546', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (712305, 712300, 3, '杨梅市', '杨梅', '03', '326', '121.145873', '24.907575', '121.152437', '24.913227', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (712306, 712300, 3, '芦竹市', '芦竹', '03', '338', '121.292064', '25.045392', '121.298537', '25.051427', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (712321, 712300, 3, '大溪镇', '大溪', '03', '335', '121.286962', '24.880584', '121.29349', '24.88653', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (712324, 712300, 3, '大园乡', '大园', '03', '337', '121.196292', '25.064471', '121.202704', '25.070825', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (712325, 712300, 3, '龟山乡', '龟山', '03', '333', '121.337767', '24.992517', '121.344242', '24.998739', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (712327, 712300, 3, '龙潭乡', '龙潭', '03', '325', '121.216392', '24.863851', '121.222862', '24.870093', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (712329, 712300, 3, '新屋乡', '新屋', '03', '327', '121.105801', '24.972203', '121.112296', '24.978285', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (712330, 712300, 3, '观音乡', '观音', '03', '328', '121.077519', '25.033303', '121.083932', '25.039661', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (712331, 712300, 3, '复兴乡', '复兴', '03', '336', '121.352613', '24.820908', '121.359107', '24.826855', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (712400, 710000, 2, '新竹县', '新竹', '03', '3', '121.160000', '24.600000', '121.166537', '24.605818', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (712401, 712400, 3, '竹北市', '竹北', '03', '302', '121.004317', '24.839652', '121.010867', '24.845405', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (712421, 712400, 3, '竹东镇', '竹东', '03', '310', '121.086418', '24.733601', '121.092861', '24.739947', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (712422, 712400, 3, '新埔镇', '新埔', '03', '305', '121.072804', '24.824820', '121.079221', '24.831155', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (712423, 712400, 3, '关西镇', '关西', '03', '306', '121.177301', '24.788842', '121.183765', '24.794976', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (712424, 712400, 3, '湖口乡', '湖口', '03', '303', '121.043691', '24.903943', '121.050211', '24.909824', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (712425, 712400, 3, '新丰乡', '新丰', '03', '304', '120.983006', '24.899600', '120.98948', '24.90573', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (712426, 712400, 3, '芎林乡', '芎林', '03', '307', '121.076924', '24.774436', '121.083356', '24.780796', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (712427, 712400, 3, '横山乡', '横山', '03', '312', '121.116244', '24.720807', '121.122769', '24.72669', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (712428, 712400, 3, '北埔乡', '北埔', '03', '314', '121.053156', '24.697126', '121.059626', '24.703182', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (712429, 712400, 3, '宝山乡', '宝山', '03', '308', '120.985752', '24.760975', '120.992252', '24.767058', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (712430, 712400, 3, '峨眉乡', '峨眉', '03', '315', '121.015291', '24.686127', '121.021844', '24.691771', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (712431, 712400, 3, '尖石乡', '尖石', '03', '313', '121.197802', '24.704360', '121.204214', '24.710718', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (712432, 712400, 3, '五峰乡', '五峰', '03', '311', '121.003418', '23.775291', '121.009978', '23.781059', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (712500, 710000, 2, '苗栗县', '苗栗', '037', '3', '120.750000', '24.500000', '120.756517', '24.506003', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (712501, 712500, 3, '苗栗市', '苗栗', '037', '360', '120.818869', '24.561472', '120.825318', '24.567631', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (712521, 712500, 3, '苑里镇', '苑里', '037', '358', '120.648907', '24.441750', '120.65545', '24.447444', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (712522, 712500, 3, '通霄镇', '通霄', '037', '357', '120.676700', '24.489087', '120.683256', '24.494857', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (712523, 712500, 3, '竹南镇', '竹南', '037', '350', '120.872641', '24.685513', '120.879132', '24.691459', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (712524, 712500, 3, '头份市', '头份', '037', '351', '120.895188', '24.687993', '120.90174', '24.693638', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (712525, 712500, 3, '后龙镇', '后龙', '037', '356', '120.786480', '24.612617', '120.793062', '24.618278', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (712526, 712500, 3, '卓兰镇', '卓兰', '037', '369', '120.823441', '24.309509', '120.829884', '24.315742', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (712527, 712500, 3, '大湖乡', '大湖', '037', '364', '120.863641', '24.422547', '120.870114', '24.428665', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (712528, 712500, 3, '公馆乡', '公馆', '037', '363', '120.822983', '24.499108', '120.829453', '24.505339', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (712529, 712500, 3, '铜锣乡', '铜锣', '037', '366', '121.003418', '23.775291', '121.009978', '23.781059', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (712530, 712500, 3, '南庄乡', '南庄', '037', '353', '120.994957', '24.596835', '121.001473', '24.602741', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (712531, 712500, 3, '头屋乡', '头屋', '037', '362', '120.846616', '24.574249', '120.853028', '24.580586', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (712532, 712500, 3, '三义乡', '三义', '037', '367', '120.742340', '24.350270', '120.748802', '24.356409', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (712533, 712500, 3, '西湖乡', '西湖', '037', '368', '121.003418', '23.775291', '121.009978', '23.781059', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (712534, 712500, 3, '造桥乡', '造桥', '037', '361', '120.862399', '24.637537', '120.868888', '24.643681', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (712535, 712500, 3, '三湾乡', '三湾', '037', '352', '120.951484', '24.651051', '120.957926', '24.65738', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (712536, 712500, 3, '狮潭乡', '狮潭', '037', '354', '120.918024', '24.540004', '120.924567', '24.545791', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (712537, 712500, 3, '泰安乡', '泰安', '037', '365', '120.904441', '24.442600', '120.910994', '24.448243', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (712700, 710000, 2, '彰化县', '彰化', '04', '5', '120.416000', '24.000000', '120.42257', '24.005647', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (712701, 712700, 3, '彰化市', '彰化市', '04', '500', '120.542294', '24.080911', '120.548848', '24.086548', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (712721, 712700, 3, '鹿港镇', '鹿港', '04', '505', '120.435392', '24.056937', '120.441945', '24.062687', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (712722, 712700, 3, '和美镇', '和美', '04', '508', '120.500265', '24.110904', '120.506721', '24.117079', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (712723, 712700, 3, '线西乡', '线西', '04', '507', '120.465921', '24.128653', '120.472376', '24.134922', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (712724, 712700, 3, '伸港乡', '伸港', '04', '509', '120.484224', '24.146081', '120.490673', '24.152437', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (712725, 712700, 3, '福兴乡', '福兴', '04', '506', '120.443682', '24.047883', '120.450217', '24.053768', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (712726, 712700, 3, '秀水乡', '秀水', '04', '504', '120.502658', '24.035267', '120.50915', '24.041406', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (712727, 712700, 3, '花坛乡', '花坛', '04', '503', '120.538403', '24.029399', '120.544994', '24.035043', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (712728, 712700, 3, '芬园乡', '芬园', '04', '502', '120.629024', '24.013658', '120.635533', '24.019679', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (712729, 712700, 3, '员林市', '员林', '04', '510', '120.574625', '23.958999', '120.581091', '23.965082', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (712730, 712700, 3, '溪湖镇', '溪湖', '04', '514', '120.479144', '23.962315', '120.485554', '23.968672', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (712731, 712700, 3, '田中镇', '田中', '04', '520', '120.580629', '23.861718', '120.587075', '23.867906', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (712732, 712700, 3, '大村乡', '大村', '04', '515', '120.540713', '23.993726', '120.547279', '23.999363', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (712733, 712700, 3, '埔盐乡', '埔盐', '04', '516', '120.464044', '24.000346', '120.470496', '24.006589', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (712734, 712700, 3, '埔心乡', '埔心', '04', '513', '120.543568', '23.953019', '120.550126', '23.958661', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (712735, 712700, 3, '永靖乡', '永靖', '04', '512', '120.547775', '23.924703', '120.554355', '23.930374', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (712736, 712700, 3, '社头乡', '社头', '04', '511', '120.582681', '23.896686', '120.589152', '23.902912', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (712737, 712700, 3, '二水乡', '二水', '04', '530', '120.618788', '23.806995', '120.625261', '23.813198', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (712738, 712700, 3, '北斗镇', '北斗', '04', '521', '120.520449', '23.870911', '120.526977', '23.876721', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (712739, 712700, 3, '二林镇', '二林', '04', '526', '120.374468', '23.899751', '120.380933', '23.906017', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (712740, 712700, 3, '田尾乡', '田尾', '04', '522', '120.524717', '23.890735', '120.531277', '23.896485', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (712741, 712700, 3, '埤头乡', '埤头', '04', '523', '120.462599', '23.891324', '120.469066', '23.897548', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (712742, 712700, 3, '芳苑乡', '芳苑', '04', '528', '120.320329', '23.924222', '120.326878', '23.93005', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (712743, 712700, 3, '大城乡', '大城', '04', '527', '120.320934', '23.852382', '120.327447', '23.858213', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (712744, 712700, 3, '竹塘乡', '竹塘', '04', '525', '120.427499', '23.860112', '120.434048', '23.865775', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (712745, 712700, 3, '溪州乡', '溪州', '04', '524', '120.498706', '23.851229', '120.505147', '23.857427', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (712800, 710000, 2, '南投县', '南投', '049', '5', '120.830000', '23.830000', '120.836428', '23.836312', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (712801, 712800, 3, '南投市', '南投市', '049', '540', '120.683706', '23.909956', '120.690249', '23.915843', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (712821, 712800, 3, '埔里镇', '埔里', '049', '545', '120.964648', '23.964789', '120.971059', '23.971137', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (712822, 712800, 3, '草屯镇', '草屯', '049', '542', '120.680343', '23.973947', '120.686859', '23.979768', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (712823, 712800, 3, '竹山镇', '竹山', '049', '557', '120.672007', '23.757655', '120.678562', '23.763362', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (712824, 712800, 3, '集集镇', '集集', '049', '552', '120.783673', '23.829013', '120.790234', '23.834656', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (712825, 712800, 3, '名间乡', '名间', '049', '551', '120.702797', '23.838427', '120.709236', '23.844649', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (712826, 712800, 3, '鹿谷乡', '鹿谷', '049', '558', '120.752796', '23.744471', '120.759292', '23.750415', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (712827, 712800, 3, '中寮乡', '中寮', '049', '541', '120.766654', '23.878935', '120.773208', '23.884657', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (712828, 712800, 3, '鱼池乡', '鱼池', '049', '555', '120.936060', '23.896356', '120.942552', '23.902472', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (712829, 712800, 3, '国姓乡', '国姓', '049', '544', '120.858541', '24.042298', '120.865016', '24.048506', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (712830, 712800, 3, '水里乡', '水里', '049', '553', '120.855912', '23.812086', '120.862372', '23.818331', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (712831, 712800, 3, '信义乡', '信义', '049', '556', '120.855257', '23.699922', '120.861707', '23.706175', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (712832, 712800, 3, '仁爱乡', '仁爱', '049', '546', '121.133543', '24.024429', '121.14013', '24.03009', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (712900, 710000, 2, '云林县', '云林', '05', '6', '120.250000', '23.750000', '120.256428', '23.75631', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (712901, 712900, 3, '斗六市', '斗六', '05', '640', '120.527360', '23.697651', '120.533918', '23.703366', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (712921, 712900, 3, '斗南镇', '斗南', '05', '630', '120.479075', '23.679731', '120.485521', '23.686095', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (712922, 712900, 3, '虎尾镇', '虎尾', '05', '632', '120.445339', '23.708182', '120.451848', '23.714093', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (712923, 712900, 3, '西螺镇', '西螺', '05', '648', '120.466010', '23.797984', '120.472475', '23.804256', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (712924, 712900, 3, '土库镇', '土库', '05', '633', '120.392572', '23.677822', '120.3991', '23.683777', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (712925, 712900, 3, '北港镇', '北港', '05', '651', '120.302393', '23.575525', '120.308968', '23.581168', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (712926, 712900, 3, '古坑乡', '古坑', '05', '646', '120.562043', '23.642568', '120.568574', '23.648422', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (712927, 712900, 3, '大埤乡', '大埤', '05', '631', '120.430516', '23.645908', '120.437082', '23.651601', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (712928, 712900, 3, '莿桐乡', '莿桐', '05', '647', '120.502374', '23.760784', '120.508847', '23.766925', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (712929, 712900, 3, '林内乡', '林内', '05', '643', '120.611365', '23.758712', '120.617805', '23.765011', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (712930, 712900, 3, '二仑乡', '二仑', '05', '649', '120.415077', '23.771273', '120.421657', '23.776926', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (712931, 712900, 3, '仑背乡', '仑背', '05', '637', '120.353895', '23.758840', '120.360326', '23.765183', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (712932, 712900, 3, '麦寮乡', '麦寮', '05', '638', '120.252043', '23.753841', '120.258479', '23.760131', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (712933, 712900, 3, '东势乡', '东势', '05', '635', '120.252672', '23.674679', '120.259135', '23.680967', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (712934, 712900, 3, '褒忠乡', '褒忠', '05', '634', '120.310488', '23.694245', '120.317054', '23.699938', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (712935, 712900, 3, '台西乡', '台西', '05', '636', '120.196141', '23.702819', '120.202685', '23.708579', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (712936, 712900, 3, '元长乡', '元长', '05', '655', '120.315124', '23.649458', '120.321683', '23.655206', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (712937, 712900, 3, '四湖乡', '四湖', '05', '654', '120.225741', '23.637740', '120.232187', '23.644004', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (712938, 712900, 3, '口湖乡', '口湖', '05', '653', '120.185370', '23.582406', '120.191936', '23.588059', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (712939, 712900, 3, '水林乡', '水林', '05', '652', '120.245948', '23.572634', '120.252388', '23.578979', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (713000, 710000, 2, '嘉义县', '嘉义', '05', '6', '120.300000', '23.500000', '120.306554', '23.505636', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (713001, 713000, 3, '太保市', '太保', '05', '612', '120.332876', '23.459647', '120.339366', '23.465701', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (713002, 713000, 3, '朴子市', '朴子', '05', '613', '120.247014', '23.464961', '120.253443', '23.471297', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (713023, 713000, 3, '布袋镇', '布袋', '05', '625', '120.166936', '23.377979', '120.173472', '23.383696', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (713024, 713000, 3, '大林镇', '大林', '05', '622', '120.471336', '23.603815', '120.477754', '23.610136', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (713025, 713000, 3, '民雄乡', '民雄', '05', '621', '120.428577', '23.551456', '120.43516', '23.557134', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (713026, 713000, 3, '溪口乡', '溪口', '05', '623', '120.393822', '23.602223', '120.400318', '23.608148', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (713027, 713000, 3, '新港乡', '新港', '05', '616', '120.347647', '23.551806', '120.35411', '23.558098', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (713028, 713000, 3, '六脚乡', '六脚', '05', '615', '120.291083', '23.493942', '120.297627', '23.499616', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (713029, 713000, 3, '东石乡', '东石', '05', '614', '120.153822', '23.459235', '120.160337', '23.465163', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (713030, 713000, 3, '义竹乡', '义竹', '05', '624', '120.243423', '23.336277', '120.249858', '23.342633', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (713031, 713000, 3, '鹿草乡', '鹿草', '05', '611', '120.308370', '23.410784', '120.314944', '23.416459', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (713032, 713000, 3, '水上乡', '水上', '05', '608', '120.397936', '23.428104', '120.404484', '23.433962', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (713033, 713000, 3, '中埔乡', '中埔', '05', '606', '120.522948', '23.425148', '120.529511', '23.430925', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (713034, 713000, 3, '竹崎乡', '竹崎', '05', '604', '120.551466', '23.523184', '120.558027', '23.528886', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (713035, 713000, 3, '梅山乡', '梅山', '05', '603', '120.557192', '23.584915', '120.563731', '23.590689', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (713036, 713000, 3, '番路乡', '番路', '05', '602', '120.555043', '23.465222', '120.561587', '23.470966', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (713037, 713000, 3, '大埔乡', '大埔', '05', '607', '120.593795', '23.296715', '120.600244', '23.303061', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (713038, 713000, 3, '阿里山乡', '阿里山', '05', '605', '120.732520', '23.467950', '120.738956', '23.474236', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (713300, 710000, 2, '屏东县', '屏东', '08', '9', '120.487928', '22.682802', '120.494369', '22.689133', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (713301, 713300, 3, '屏东市', '屏东', '08', '900', '120.488465', '22.669723', '120.494893', '22.676048', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (713321, 713300, 3, '潮州镇', '潮州', '08', '920', '120.542854', '22.550536', '120.549412', '22.556177', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (713322, 713300, 3, '东港镇', '东港', '08', '928', '120.454489', '22.466626', '120.460993', '22.472714', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (713323, 713300, 3, '恒春镇', '恒春', '08', '946', '120.745451', '22.002373', '120.751951', '22.008461', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (713324, 713300, 3, '万丹乡', '万丹', '08', '913', '120.484533', '22.589839', '120.490987', '22.596194', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (713325, 713300, 3, '长治乡', '长治', '08', '908', '120.527614', '22.677062', '120.534165', '22.682773', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (713326, 713300, 3, '麟洛乡', '麟洛', '08', '909', '120.527283', '22.650604', '120.533817', '22.656316', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (713327, 713300, 3, '九如乡', '九如', '08', '904', '120.490142', '22.739778', '120.496583', '22.74609', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (713328, 713300, 3, '里港乡', '里港', '08', '905', '120.494490', '22.779220', '120.500923', '22.785479', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (713329, 713300, 3, '盐埔乡', '盐埔', '08', '907', '120.572849', '22.754783', '120.579325', '22.760834', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (713330, 713300, 3, '高树乡', '高树', '08', '906', '120.600214', '22.826789', '120.606665', '22.833154', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (713331, 713300, 3, '万峦乡', '万峦', '08', '923', '120.566477', '22.571965', '120.573001', '22.577901', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (713332, 713300, 3, '内埔乡', '内埔', '08', '912', '120.566865', '22.611967', '120.573384', '22.617909', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (713333, 713300, 3, '竹田乡', '竹田', '08', '911', '120.544038', '22.584678', '120.550623', '22.590328', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (713334, 713300, 3, '新埤乡', '新埤', '08', '925', '120.549546', '22.469976', '120.556125', '22.475662', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (713335, 713300, 3, '枋寮乡', '枋寮', '08', '940', '120.593438', '22.365560', '120.599888', '22.371903', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (713336, 713300, 3, '新园乡', '新园', '08', '932', '120.461739', '22.543952', '120.468185', '22.550158', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (713337, 713300, 3, '崁顶乡', '崁顶', '08', '924', '120.514571', '22.514795', '120.521073', '22.520707', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (713338, 713300, 3, '林边乡', '林边', '08', '927', '120.515091', '22.434015', '120.521603', '22.439919', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (713339, 713300, 3, '南州乡', '南州', '08', '926', '120.509808', '22.490192', '120.516317', '22.496197', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (713340, 713300, 3, '佳冬乡', '佳冬', '08', '931', '120.551544', '22.417653', '120.558081', '22.423352', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (713341, 713300, 3, '琉球乡', '琉球', '08', '929', '120.369020', '22.342366', '120.375478', '22.348691', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (713342, 713300, 3, '车城乡', '车城', '08', '944', '120.710979', '22.072077', '120.717412', '22.078398', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (713343, 713300, 3, '满州乡', '满州', '08', '947', '120.838843', '22.020853', '120.845276', '22.027215', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (713344, 713300, 3, '枋山乡', '枋山', '08', '941', '120.656356', '22.260338', '120.662921', '22.265983', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (713345, 713300, 3, '三地门乡', '三地门', '08', '901', '120.654486', '22.713877', '120.661071', '22.719534', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (713346, 713300, 3, '雾台乡', '雾台', '08', '902', '120.732318', '22.744877', '120.738759', '22.751166', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (713347, 713300, 3, '玛家乡', '玛家', '08', '903', '120.644130', '22.706718', '120.650695', '22.712478', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (713348, 713300, 3, '泰武乡', '泰武', '08', '921', '120.632856', '22.591819', '120.639386', '22.597769', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (713349, 713300, 3, '来义乡', '来义', '08', '922', '120.633601', '22.525866', '120.640094', '22.531795', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (713350, 713300, 3, '春日乡', '春日', '08', '942', '120.628793', '22.370672', '120.635298', '22.376697', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (713351, 713300, 3, '狮子乡', '狮子', '08', '943', '120.704617', '22.201917', '120.711073', '22.208168', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (713352, 713300, 3, '牡丹乡', '牡丹', '08', '945', '120.770108', '22.125687', '120.776679', '22.131375', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (713400, 710000, 2, '台东县', '台东', '089', '9', '120.916000', '23.000000', '120.922529', '23.005754', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (713401, 713400, 3, '台东市', '台东', '089', '950', '121.145654', '22.756045', '121.152205', '22.761695', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (713421, 713400, 3, '成功镇', '成功', '089', '961', '121.379571', '23.100223', '121.38614', '23.105859', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (713422, 713400, 3, '关山镇', '关山', '089', '956', '121.163134', '23.047450', '121.169666', '23.053324', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (713423, 713400, 3, '卑南乡', '卑南', '089', '954', '121.083503', '22.786039', '121.089923', '22.792394', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (713424, 713400, 3, '鹿野乡', '鹿野', '089', '955', '121.135982', '22.913951', '121.142543', '22.919594', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (713425, 713400, 3, '池上乡', '池上', '089', '958', '121.215139', '23.122393', '121.221572', '23.128645', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (713426, 713400, 3, '东河乡', '东河', '089', '959', '121.300334', '22.969934', '121.306808', '22.976123', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (713427, 713400, 3, '长滨乡', '长滨', '089', '962', '121.451522', '23.315041', '121.457983', '23.321345', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (713428, 713400, 3, '太麻里乡', '太麻里', '089', '963', '121.007394', '22.615383', '121.013952', '22.621097', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (713429, 713400, 3, '大武乡', '大武', '089', '965', '120.889938', '22.339919', '120.896513', '22.345609', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (713430, 713400, 3, '绿岛乡', '绿岛', '089', '951', '121.492596', '22.661676', '121.499143', '22.667336', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (713431, 713400, 3, '海端乡', '海端', '089', '957', '121.172008', '23.101074', '121.1785', '23.107112', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (713432, 713400, 3, '延平乡', '延平', '089', '953', '121.084499', '22.902358', '121.090917', '22.908708', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (713433, 713400, 3, '金峰乡', '金峰', '089', '964', '120.971292', '22.595511', '120.977755', '22.601816', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (713434, 713400, 3, '达仁乡', '达仁', '089', '966', '120.884131', '22.294869', '120.890657', '22.300621', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (713435, 713400, 3, '兰屿乡', '兰屿', '089', '952', '121.532473', '22.056736', '121.538946', '22.06278', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (713500, 710000, 2, '花莲县', '花莲', '03', '9', '121.300000', '23.830000', '121.306454', '23.83618', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (713501, 713500, 3, '花莲市', '花莲', '03', '970', '121.606810', '23.982074', '121.61335', '23.98779', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (713521, 713500, 3, '凤林镇', '凤林', '03', '975', '121.451687', '23.744648', '121.458115', '23.750943', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (713522, 713500, 3, '玉里镇', '玉里', '03', '981', '121.316445', '23.336509', '121.32288', '23.342867', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (713523, 713500, 3, '新城乡', '新城', '03', '971', '121.640512', '24.128133', '121.647055', '24.133961', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (713524, 713500, 3, '吉安乡', '吉安', '03', '973', '121.568005', '23.961635', '121.574422', '23.967965', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (713525, 713500, 3, '寿丰乡', '寿丰', '03', '974', '121.508955', '23.870680', '121.51551', '23.876353', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (713526, 713500, 3, '光复乡', '光复', '03', '976', '121.423496', '23.669084', '121.42997', '23.675324', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (713527, 713500, 3, '丰滨乡', '丰滨', '03', '977', '121.518639', '23.597080', '121.525163', '23.602873', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (713528, 713500, 3, '瑞穗乡', '瑞穗', '03', '978', '121.375992', '23.496817', '121.382543', '23.502457', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (713529, 713500, 3, '富里乡', '富里', '03', '983', '121.250124', '23.179984', '121.256701', '23.185671', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (713530, 713500, 3, '秀林乡', '秀林', '03', '972', '121.620381', '24.116642', '121.62695', '24.122277', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (713531, 713500, 3, '万荣乡', '万荣', '03', '979', '121.407493', '23.715346', '121.413988', '23.721296', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (713532, 713500, 3, '卓溪乡', '卓溪', '03', '982', '121.303422', '23.346369', '121.30987', '23.352603', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (713600, 710000, 2, '澎湖县', '澎湖', '06', '8', '119.566417', '23.569733', '119.572981', '23.575463', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (713601, 713600, 3, '马公市', '马公', '06', '880', '119.566499', '23.565845', '119.573066', '23.571575', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (713621, 713600, 3, '湖西乡', '湖西', '06', '885', '119.659666', '23.583358', '119.666126', '23.589542', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (713622, 713600, 3, '白沙乡', '白沙', '06', '884', '119.597919', '23.666060', '119.60448', '23.671852', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (713623, 713600, 3, '西屿乡', '西屿', '06', '881', '119.506974', '23.600836', '119.513402', '23.607111', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (713624, 713600, 3, '望安乡', '望安', '06', '882', '119.500538', '23.357531', '119.506986', '23.363716', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (713625, 713600, 3, '七美乡', '七美', '06', '883', '119.423929', '23.206018', '119.43042', '23.212133', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (713700, 710000, 2, '金门县', '金门', '082', '8', '118.317089', '24.432706', '118.323504', '24.439054', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (713701, 713700, 3, '金城镇', '金城', '082', '893', '118.316667', '24.416667', '118.323098', '24.423017', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (713702, 713700, 3, '金湖镇', '金湖', '082', '891', '118.419743', '24.438633', '118.426191', '24.444803', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (713703, 713700, 3, '金沙镇', '金沙', '082', '890', '118.427993', '24.481109', '118.434435', '24.487397', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (713704, 713700, 3, '金宁乡', '金宁', '082', '892', '118.334506', '24.45672', '118.340934', '24.462974', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (713705, 713700, 3, '烈屿乡', '烈屿', '082', '894', '118.247255', '24.433102', '118.2538', '24.438821', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (713706, 713700, 3, '乌丘乡', '乌丘', '082', '896', '118.319578', '24.435038', '118.325991', '24.44139', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (713800, 710000, 2, '连江县', '连江', '0836', '2', '119.539704', '26.197364', '119.546182', '26.203552', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (713801, 713800, 3, '南竿乡', '南竿', '0836', '209', '119.944267', '26.144035', '119.950829', '26.149681', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (713802, 713800, 3, '北竿乡', '北竿', '0836', '210', '120.000572', '26.221983', '120.006991', '26.228342', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (713803, 713800, 3, '莒光乡', '莒光', '0836', '211', '119.940405', '25.976256', '119.946987', '25.981897', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (713804, 713800, 3, '东引乡', '东引', '0836', '212', '120.493955', '26.366164', '120.500377', '26.372429', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (810000, 100000, 1, '香港特别行政区', '香港', NULL, NULL, '114.173355', '22.320048', '114.179918', '22.325726', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (810100, 810000, 2, '香港岛', '香港岛', '00852', '999077', '114.177314', '22.266416', '114.183874', '22.272076', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (810101, 810100, 3, '中西区', '中西区', '00852', '999077', '114.154374', '22.281981', '114.160871', '22.2879', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (810102, 810100, 3, '湾仔区', '湾仔区', '00852', '999077', '114.182915', '22.276389', '114.189466', '22.282048', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (810103, 810100, 3, '东区', '东区', '00852', '999077', '114.255993', '22.262755', '114.262445', '22.268984', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (810104, 810100, 3, '南区', '南区', '00852', '999077', '114.174134', '22.24676', '114.18071', '22.252436', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (810200, 810000, 2, '九龙', '九龙', '00852', '999077', '114.17495', '22.327115', '114.181522', '22.332786', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (810201, 810200, 3, '油尖旺区', '油尖旺', '00852', '999077', '114.173332', '22.311704', '114.179887', '22.317381', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (810202, 810200, 3, '深水埗区', '深水埗', '00852', '999077', '114.16721', '22.328171', '114.173771', '22.333904', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (810203, 810200, 3, '九龙城区', '九龙城', '00852', '999077', '114.195053', '22.32673', '114.201607', '22.33249', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (810204, 810200, 3, '黄大仙区', '黄大仙', '00852', '999077', '114.19924', '22.336313', '114.205791', '22.342133', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (810205, 810200, 3, '观塘区', '观塘', '00852', '999077', '114.231268', '22.30943', '114.237698', '22.315735', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (810300, 810000, 2, '新界', '新界', '00852', '999077', '114.202408', '22.341766', '114.208952', '22.347637', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (810301, 810300, 3, '荃湾区', '荃湾', '00852', '999077', '114.122952', '22.370973', '114.129395', '22.377313', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (810302, 810300, 3, '屯门区', '屯门', '00852', '999077', '113.977416', '22.391047', '113.98388', '22.397174', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (810303, 810300, 3, '元朗区', '元朗', '00852', '999077', '114.039796', '22.443342', '114.046332', '22.449175', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (810304, 810300, 3, '北区', '北区', '00852', '999077', '114.148959', '22.494086', '114.155461', '22.500106', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (810305, 810300, 3, '大埔区', '大埔', '00852', '999077', '114.171743', '22.445653', '114.17831', '22.451343', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (810306, 810300, 3, '西贡区', '西贡', '00852', '999077', '114.27854', '22.37944', '114.28507', '22.385292', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (810307, 810300, 3, '沙田区', '沙田', '00852', '999077', '114.191941', '22.379294', '114.198496', '22.385016', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (810308, 810300, 3, '葵青区', '葵青', '00852', '999077', '114.13932', '22.363877', '114.145799', '22.370062', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (810309, 810300, 3, '离岛区', '离岛', '00852', '999077', '113.945842', '22.281508', '113.952388', '22.287179', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (820000, 100000, 1, '澳门特别行政区', '澳门', NULL, NULL, '113.54909', '22.198951', '113.555586', '22.204967', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (820100, 820000, 2, '澳门半岛', '澳门半岛', '00853', '999078', '113.549134', '22.198751', '113.55563', '22.204766', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (820101, 820100, 3, '花地玛堂区', '花地玛堂区', '00853', '999078', '113.552284', '22.208067', '113.5588', '22.214028', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (820102, 820100, 3, '圣安多尼堂区', '圣安多尼堂区', '00853', '999078', '113.564301', '22.12381', '113.570861', '22.129581', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (820103, 820100, 3, '大堂区', '大堂', '00853', '999078', '113.552971', '22.188359', '113.55947', '22.194304', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (820104, 820100, 3, '望德堂区', '望德堂区', '00853', '999078', '113.550568', '22.194081', '113.557064', '22.20007', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (820105, 820100, 3, '风顺堂区', '风顺堂区', '00853', '999078', '113.541928', '22.187368', '113.548389', '22.193505', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (820200, 820000, 2, '氹仔岛', '氹仔岛', '00853', '999078', '113.577669', '22.156838', '113.58422', '22.162497', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (820201, 820200, 3, '嘉模堂区', '嘉模堂区', '00853', '999078', '113.565303', '22.149029', '113.571842', '22.154783', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (820300, 820000, 2, '路环岛', '路环岛', '00853', '999078', '113.564857', '22.116226', '113.571422', '22.121991', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (820301, 820300, 3, '圣方济各堂区', '圣方济各堂区', '00853', '999078', '113.559954', '22.123486', '113.566502', '22.129319', '行政区', NULL);
INSERT INTO `yx_dev_region` VALUES (900000, 100000, 1, '钓鱼岛', '钓鱼岛', NULL, NULL, '123.478088', '25.742385', '123.484509', '25.748753', '行政区', NULL);
COMMIT;

-- ----------------------------
-- Table structure for yx_distribution_member_apply
-- ----------------------------
DROP TABLE IF EXISTS `yx_distribution_member_apply`;
CREATE TABLE `yx_distribution_member_apply`  (
                                                `id` int(11) NOT NULL AUTO_INCREMENT,
                                                `user_id` int(11) NOT NULL COMMENT '用户id',
                                                `real_name` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '真实姓名',
                                                `mobile` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '手机号码',
                                                `province` int(11) UNSIGNED NULL DEFAULT 0 COMMENT '省份',
                                                `city` int(11) UNSIGNED NULL DEFAULT 0 COMMENT '城市',
                                                `district` int(11) UNSIGNED NULL DEFAULT 0 COMMENT '县区',
                                                `reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '申请原因',
                                                `status` tinyint(1) NULL DEFAULT 0 COMMENT '状态：0-待审核；1-审核通过；2-审核不通过',
                                                `create_time` int(10) NOT NULL COMMENT '创建时间',
                                                `update_time` int(10) NULL DEFAULT NULL COMMENT '更新时间',
                                                PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for yx_distribution_order_goods
-- ----------------------------
DROP TABLE IF EXISTS `yx_distribution_order_goods`;
CREATE TABLE `yx_distribution_order_goods`  (
                                                `id` int(11) NOT NULL AUTO_INCREMENT,
                                                `sn` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '记录编号',
                                                `user_id` int(11) NOT NULL COMMENT '用户id',
                                                `real_name` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '真实姓名',
                                                `order_goods_id` int(11) NOT NULL COMMENT '订单商品id',
                                                `goods_num` int(10) NOT NULL DEFAULT 1 COMMENT '商品数量',
                                                `money` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '佣金',
                                                `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态：1-待返佣；2-已结算；3-已失效；',
                                                `create_time` int(10) NOT NULL COMMENT '创建时间',
                                                `update_time` int(10) NULL DEFAULT NULL COMMENT '更新时间',
                                                PRIMARY KEY (`id`) USING BTREE,
                                                INDEX `user_id_source_id`(`user_id`) USING BTREE COMMENT '一个用户只有一个订单商品的分佣订单'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for yx_express
-- ----------------------------
DROP TABLE IF EXISTS `yx_express`;
CREATE TABLE `yx_express`  (
                                `id` int(11) NOT NULL AUTO_INCREMENT,
                                `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '快递公司',
                                `icon` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '快递图标',
                                `website` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公司网址',
                                `code` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '快递编码',
                                `code100` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '快递100编码',
                                `sort` int(10) NOT NULL DEFAULT 0 COMMENT '排序',
                                `codebird` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '快递鸟编码',
                                `del` tinyint(1) NULL DEFAULT 0 COMMENT '是否删除,0-未删除,1-已删除',
                                `create_time` int(11) NULL DEFAULT NULL COMMENT '创建时间',
                                `update_time` int(11) NULL DEFAULT NULL COMMENT '修改时间',
                                PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for yx_file
-- ----------------------------
DROP TABLE IF EXISTS `yx_file`;
CREATE TABLE `yx_file`  (
                            `id` int(11) NOT NULL AUTO_INCREMENT,
                            `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文件名',
                            `cate_id` int(10) NULL DEFAULT 0 COMMENT '分类id',
                            `type` tinyint(1) NOT NULL COMMENT '类型',
                            `uri` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文件相对路径',
                            `create_time` int(10) NOT NULL COMMENT '创建时间',
                            `del` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否删除：0-否；1-是；',
                            `partner_id` int(11) NOT NULL DEFAULT 0 COMMENT '机构id',
                            PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT = '文件表';

-- ----------------------------
-- Table structure for yx_file_cate
-- ----------------------------
DROP TABLE IF EXISTS `yx_file_cate`;
CREATE TABLE `yx_file_cate`  (
                                `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
                                `partner_id` int(11) NOT NULL DEFAULT 0 COMMENT '店铺id',
                                `name` varchar(90) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分类名称',
                                `pid` int(11) NOT NULL COMMENT '父级id',
                                `level` tinyint(1) NULL DEFAULT NULL COMMENT '等级',
                                `sort` int(11) NULL DEFAULT 0 COMMENT '排序',
                                `create_time` int(10) NULL DEFAULT NULL COMMENT '创建时间',
                                `update_time` int(10) NULL DEFAULT NULL COMMENT '更新时间',
                                `del` tinyint(1) NULL DEFAULT 0 COMMENT '0-未删除;1-已删除',
                                PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT = '文件分类表';

-- ----------------------------
-- Table structure for yx_freight
-- ----------------------------
DROP TABLE IF EXISTS `yx_freight`;
CREATE TABLE `yx_freight`  (
                                `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '表id',
                                `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '模板名称',
                                `charge_way` tinyint(1) NULL DEFAULT 0 COMMENT '计费方式:1-重量计费;2-体积计费;3-件数计费',
                                `remark` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
                                `create_time` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '添加时间',
                                `update_time` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '更新时间',
                                PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT = '运费模板表';

-- ----------------------------
-- Table structure for yx_freight_config
-- ----------------------------
DROP TABLE IF EXISTS `yx_freight_config`;
CREATE TABLE `yx_freight_config`  (
                                    `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '表id',
                                    `freight_id` int(11) NULL DEFAULT NULL COMMENT '模板id',
                                    `first_unit` int(10) NULL DEFAULT NULL COMMENT '首重/件',
                                    `first_money` decimal(10, 0) NULL DEFAULT NULL COMMENT '首重/件价格',
                                    `continue_unit` int(10) NULL DEFAULT NULL COMMENT '续重/件',
                                    `continue_money` decimal(10, 0) NULL DEFAULT NULL COMMENT '首重/件价格',
                                    `region` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '地区id',
                                    `create_time` int(10) NULL DEFAULT NULL COMMENT '创建时间',
                                    PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT = '运费模板配置表';

-- ----------------------------
-- Table structure for yx_goods
-- ----------------------------
DROP TABLE IF EXISTS `yx_goods`;
CREATE TABLE `yx_goods`  (
                            `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品状态；；0-下架1-上架',
                            `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品名称',
                            `code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品编码',
                            `first_category_id` int(11) NOT NULL COMMENT '一级分类id',
                            `second_category_id` int(11) NOT NULL COMMENT '二级分类id',
                            `third_category_id` int(11) NOT NULL COMMENT '三级分类id',
                            `brand_id` int(11) NULL DEFAULT NULL COMMENT '品牌id',
                            `supplier_id` int(11) NULL DEFAULT NULL COMMENT '供应商id',
                            `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '商品状态:-1-回收站；0-下架；1-上架',
                            `image` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品主图',
                            `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '商品简介',
                            `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '商品详细描述',
                            `sort` int(10) NULL DEFAULT 0 COMMENT '排序',
                            `sales_sum` int(10) NULL DEFAULT 0 COMMENT '商品销量',
                            `virtual_sales_sum` int(10) NULL DEFAULT 0 COMMENT '虚拟销量',
                            `click_count` int(10) NULL DEFAULT 0 COMMENT '商品点击量',
                            `spec_type` tinyint(1) NULL DEFAULT NULL COMMENT '商品规格:1-统一规格；2-多规格；',
                            `max_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '最高价格',
                            `min_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '最低价格',
                            `market_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '市场价（sku中最高的市场价）',
                            `stock` int(10) NULL DEFAULT 0 COMMENT '总库存',
                            `stock_warn` int(10) NULL DEFAULT 0 COMMENT '库存预警',
                            `is_show_stock` tinyint(1) NOT NULL COMMENT '是否显示库存：1-是；0-否',
                            `free_shipping_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '运费类型：1-包邮；2-统一运费；3-运费模板',
                            `free_shipping` decimal(10, 2) NULL DEFAULT NULL COMMENT '统一运费金额',
                            `free_shipping_template_id` int(11) NULL DEFAULT NULL COMMENT '运费模板',
                            `is_commission` tinyint(1) NOT NULL DEFAULT 0 COMMENT '分销佣金：1-开启；0-不开启',
                            `first_ratio` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '一级分销比例',
                            `second_ratio` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '二级分销比例',
                            `three_ratio` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '三级分销比例',
                            `is_share_bouns` tinyint(1) NOT NULL DEFAULT 0 COMMENT '区域股东分红：1-开启；0-不开启',
                            `region_ratio` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区域分红比例',
                            `shareholder_ratio` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '股东分红比例',
                            `is_new` tinyint(1) NULL DEFAULT 0 COMMENT '新品推荐：1-是；0-否',
                            `is_best` tinyint(1) NULL DEFAULT 0 COMMENT '好物优选：1-是；0-否',
                            `is_like` tinyint(1) NULL DEFAULT 0 COMMENT '猜你喜欢：1-是；0-否',
                            `create_time` int(10) NULL DEFAULT NULL COMMENT '商品创建时间',
                            `update_time` int(10) NULL DEFAULT NULL COMMENT '商品更新时间',
                            `del` tinyint(1) NULL DEFAULT 0 COMMENT '是否删除：1-是；0-否',
                            PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT = '商品主表';

-- ----------------------------
-- Table structure for yx_goods_brand
-- ----------------------------
DROP TABLE IF EXISTS `yx_goods_brand`;
CREATE TABLE `yx_goods_brand`  (
                                    `id` int(10) NOT NULL AUTO_INCREMENT,
                                    `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '品牌名称',
                                    `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '品牌图片',
                                    `initial` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '品牌首字母',
                                    `is_show` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否显示:1-是.0-否',
                                    `sort` int(5) NULL DEFAULT 0 COMMENT '排序',
                                    `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '品牌描述',
                                    `create_time` int(10) NULL DEFAULT NULL COMMENT '创建时间',
                                    `update_time` int(10) NULL DEFAULT NULL COMMENT '修改时间',
                                    `del` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否删除,0-未删除,1-已删除',
                                    PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT = '商品品牌';

-- ----------------------------
-- Table structure for yx_goods_category
-- ----------------------------
DROP TABLE IF EXISTS `yx_goods_category`;
CREATE TABLE `yx_goods_category`  (
                                    `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
                                    `name` varchar(90) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分类名称',
                                    `pid` int(11) NOT NULL COMMENT '父级id',
                                    `level` tinyint(1) NULL DEFAULT NULL COMMENT '等级',
                                    `sort` int(11) NULL DEFAULT 0 COMMENT '排序',
                                    `is_show` tinyint(1) NULL DEFAULT 1 COMMENT '是否显示:1-是;0-否',
                                    `image` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '分类图片',
                                    `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分类描述',
                                    `create_time` int(10) NULL DEFAULT NULL COMMENT '创建时间',
                                    `update_time` int(10) NULL DEFAULT NULL COMMENT '更新时间',
                                    `del` tinyint(10) NULL DEFAULT 0 COMMENT '删除标志:1-是；0-否',
                                    PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT = '商品分类';

-- ----------------------------
-- Table structure for yx_goods_collect
-- ----------------------------
DROP TABLE IF EXISTS `yx_goods_collect`;
CREATE TABLE `yx_goods_collect`  (
                                    `id` int(11) NOT NULL AUTO_INCREMENT,
                                    `user_id` int(11) NOT NULL COMMENT '用户id',
                                    `goods_id` int(11) NOT NULL COMMENT '产品id',
                                    `create_time` int(11) NOT NULL COMMENT '创建时间',
                                    PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for yx_goods_comment
-- ----------------------------
DROP TABLE IF EXISTS `yx_goods_comment`;
CREATE TABLE `yx_goods_comment`  (
                                    `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品评论id',
                                    `goods_id` int(128) NULL DEFAULT NULL COMMENT '商品id',
                                    `item_id` int(128) NULL DEFAULT NULL COMMENT '规格id',
                                    `user_id` int(11) NOT NULL COMMENT '用户id',
                                    `order_goods_id` int(11) NOT NULL COMMENT '订单商品表id',
                                    `goods_comment` tinyint(1) NULL DEFAULT NULL COMMENT '商品评论星级 1 一星 2 二星 3三星 4四星 5五星',
                                    `service_comment` tinyint(1) NULL DEFAULT NULL COMMENT '服务评论星级 1 一星 2 二星 3三星 4四星 5五星',
                                    `express_comment` tinyint(1) NULL DEFAULT NULL COMMENT '物流评论星级 1 一星 2 二星 3三星 4四星 5五星',
                                    `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品评论',
                                    `create_time` int(11) NOT NULL COMMENT '创建时间',
                                    `update_time` int(11) NULL DEFAULT NULL COMMENT '更新时间',
                                    `del` int(10) NULL DEFAULT 0 COMMENT '删除标志:0-未删除.1-删除',
                                    `description_comment` tinyint(1) NULL DEFAULT NULL COMMENT '描述相符星级1 一星 2 二星 3三星 4四星 5五星',
                                    `status` tinyint(2) NULL DEFAULT 1 COMMENT '显示状态 0-隐藏 1-显示 ',
                                    `reply` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商家回复',
                                    PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT = '商品评论表';

-- ----------------------------
-- Table structure for yx_goods_comment_image
-- ----------------------------
DROP TABLE IF EXISTS `yx_goods_comment_image`;
CREATE TABLE `yx_goods_comment_image`  (
                                        `id` int(10) NOT NULL AUTO_INCREMENT,
                                        `goods_comment_id` int(10) NOT NULL COMMENT '商品评价id',
                                        `uri` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片',
                                        PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for yx_goods_image
-- ----------------------------
DROP TABLE IF EXISTS `yx_goods_image`;
CREATE TABLE `yx_goods_image`  (
                                `id` int(10) NOT NULL AUTO_INCREMENT,
                                `goods_id` int(10) NULL DEFAULT NULL COMMENT '商品id',
                                `uri` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片',
                                PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT = '商品轮播图表';

-- ----------------------------
-- Table structure for yx_goods_item
-- ----------------------------
DROP TABLE IF EXISTS `yx_goods_item`;
CREATE TABLE `yx_goods_item`  (
                                `id` int(11) NOT NULL AUTO_INCREMENT,
                                `image` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品图',
                                `goods_id` int(11) NOT NULL COMMENT '商品主表id',
                                `spec_value_ids` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '多个规格id，隔开',
                                `spec_value_str` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '多个规格名称，隔开',
                                `market_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '市场价',
                                `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '价格',
                                `cost_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '成本价',
                                `stock` int(10) NULL DEFAULT NULL COMMENT '库存',
                                `volume` int(10) NULL DEFAULT NULL COMMENT '体积',
                                `weight` int(10) NULL DEFAULT NULL COMMENT '重量',
                                `bar_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '条码',
                                PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT = '商品的SKU';

-- ----------------------------
-- Table structure for yx_goods_spec
-- ----------------------------
DROP TABLE IF EXISTS `yx_goods_spec`;
CREATE TABLE `yx_goods_spec`  (
                                `id` int(11) NOT NULL AUTO_INCREMENT,
                                `goods_id` int(11) NOT NULL COMMENT '商品主表id',
                                `name` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '规格名称',
                                PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT = '商品规格';

-- ----------------------------
-- Table structure for yx_goods_spec_value
-- ----------------------------
DROP TABLE IF EXISTS `yx_goods_spec_value`;
CREATE TABLE `yx_goods_spec_value`  (
                                        `id` int(11) NOT NULL AUTO_INCREMENT,
                                        `goods_id` int(11) NOT NULL COMMENT '商品id',
                                        `spec_id` int(11) NOT NULL COMMENT '规格id',
                                        `value` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '规格属性值',
                                        PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT = '商品规格属性值表';

-- ----------------------------
-- Table structure for yx_help
-- ----------------------------
DROP TABLE IF EXISTS `yx_help`;
CREATE TABLE `yx_help`  (
                            `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '帮助id',
                            `cid` int(11) NULL DEFAULT NULL COMMENT '帮助分类',
                            `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '帮助标题',
                            `synopsis` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '帮助简介',
                            `image` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '帮助封面图',
                            `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '帮助内容',
                            `visit` int(11) NULL DEFAULT 0 COMMENT '浏览人数',
                            `sort` int(11) NULL DEFAULT 0 COMMENT '排序',
                            `is_show` tinyint(1) NULL DEFAULT 1 COMMENT '帮助状态:1-显示.0-否',
                            `create_time` int(11) NULL DEFAULT NULL COMMENT '创建时间',
                            `update_time` int(11) NULL DEFAULT NULL COMMENT '更新时间',
                            `del` int(10) NULL DEFAULT 0 COMMENT '删除标志:0-未删除.1-已删除',
                            `likes` int(11) NULL DEFAULT 0 COMMENT '点赞数',
                            PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT = '帮助表';

-- ----------------------------
-- Table structure for yx_help_category
-- ----------------------------
DROP TABLE IF EXISTS `yx_help_category`;
CREATE TABLE `yx_help_category`  (
                                    `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '帮助分类id',
                                    `name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分类名称',
                                    `is_show` tinyint(1) NULL DEFAULT 1 COMMENT '是否显示:1-是;0-否',
                                    `create_time` int(10) NULL DEFAULT NULL COMMENT '创建时间',
                                    `update_time` int(10) NULL DEFAULT NULL COMMENT '更新时间',
                                    `del` int(10) NULL DEFAULT 0 COMMENT '删除标志:0-未删除.1;已删除',
                                    PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT = '帮助分类表';

-- ----------------------------
-- Table structure for yx_menu_decorate
-- ----------------------------
DROP TABLE IF EXISTS `yx_menu_decorate`;
CREATE TABLE `yx_menu_decorate`  (
                                    `id` int(10) NOT NULL AUTO_INCREMENT,
                                    `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名称',
                                    `client_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '终端类型：1-小程序；2-H5；3-APP',
                                    `decorate_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '菜单类型：1-首页导航；2-个人中心',
                                    `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单图标',
                                    `link_type` tinyint(1) NOT NULL COMMENT '链接类型：1-商场模块；2-自定义链接',
                                    `link_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '链接地址',
                                    `sort` int(10) NULL DEFAULT 0 COMMENT '菜单排序',
                                    `is_show` tinyint(1) NULL DEFAULT 1 COMMENT '是否显示；1-是；0-否',
                                    `create_time` int(10) NULL DEFAULT NULL COMMENT '创建时间',
                                    `update_time` int(10) NULL DEFAULT NULL COMMENT '更新时间',
                                    `del` tinyint(1) NULL DEFAULT 0 COMMENT '是否删除；0-否；1-是',
                                    PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT = '菜单表';

-- ----------------------------
-- Table structure for yx_order
-- ----------------------------
DROP TABLE IF EXISTS `yx_order`;
CREATE TABLE `yx_order`  (
                            `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '订单id',
                            `order_sn` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '订单编号',
                            `user_id` int(8) UNSIGNED NULL DEFAULT 0 COMMENT '用户id',
                            `order_type` tinyint(1) NULL DEFAULT 0 COMMENT '订单类型;0-普通订单;1-秒杀订单;2-拼团订单;3-砍价订单',
                            `order_source` tinyint(1) NULL DEFAULT 1 COMMENT '订单来源;1-小程序;2-h5;3-ios;4-安卓',
                            `order_status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '订单状态;0-待付款;1-待发货;2-待收货;3-已完成;4-已关闭',
                            `pay_status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '支付状态;0-待支付;1-已支付;2-已退款;3-拒绝退款',
                            `pay_way` tinyint(2) NULL DEFAULT 1 COMMENT '1-微信支付  2-支付宝支付 3-余额支付',
                            `pay_time` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '支付时间',
                            `consignee` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '收货人',
                            `province` int(11) UNSIGNED NULL DEFAULT 0 COMMENT '省份',
                            `city` int(11) UNSIGNED NULL DEFAULT 0 COMMENT '城市',
                            `district` int(11) UNSIGNED NULL DEFAULT 0 COMMENT '县区',
                            `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '地址',
                            `mobile` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机',
                            `delivery_type` tinyint(1) NULL DEFAULT 1 COMMENT '配送方式;1-快递发货;2-上门自提;3-同城配送',
                            `goods_price` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '订单商品总价',
                            `order_amount` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '应付款金额',
                            `discount_amount` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '优惠金额',
                            `integral_amount` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '积分抵扣金额',
                            `total_amount` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '订单总价',
                            `total_num` int(10) NULL DEFAULT 0 COMMENT '订单商品数量',
                            `shipping_status` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '发货状态',
                            `shipping_price` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '运费',
                            `shipping_time` int(11) NULL DEFAULT 0 COMMENT '最后新发货时间',
                            `transaction_id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '第三方平台交易流水号',
                            `user_remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户备注',
                            `confirm_take_time` int(10) NULL DEFAULT NULL COMMENT '确认收货时间',
                            `cancel_time` int(10) NULL DEFAULT NULL COMMENT '订单取消时间',
                            `refund_status` tinyint(1) NULL DEFAULT 0 COMMENT '退款状态：0-未退款；1-部分退款；2-全部退款',
                            `settle_id` int(11) NULL DEFAULT 0 COMMENT '结算id；0-未结算',
                            `settle_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '结算金额',
                            `refund_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '退款金额',
                            `platform_commission` decimal(10, 2) NULL DEFAULT NULL COMMENT '平台抽成',
                            `del` tinyint(1) NULL DEFAULT 0 COMMENT '删除标识;1-删除;0-未删除',
                            `create_time` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '下单时间',
                            `update_time` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '更新时间',
                            `coupon_list_id` int(10) NULL DEFAULT NULL COMMENT '用户优惠券id',
                            PRIMARY KEY (`id`) USING BTREE,
                            UNIQUE INDEX `order_sn`(`order_sn`) USING BTREE,
                            INDEX `user_id`(`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT = '订单表';

-- ----------------------------
-- Table structure for yx_order_goods
-- ----------------------------
DROP TABLE IF EXISTS `yx_order_goods`;
CREATE TABLE `yx_order_goods`  (
                                `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'id',
                                `order_id` int(10) NULL DEFAULT 0 COMMENT '订单id',
                                `goods_id` int(10) NULL DEFAULT 0 COMMENT '商品id',
                                `item_id` int(10) NULL DEFAULT 0 COMMENT '规格id',
                                `goods_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品名称',
                                `goods_num` int(10) NULL DEFAULT 0 COMMENT '商品数量',
                                `goods_price` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '商品价格',
                                `total_price` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '商品总价',
                                `total_pay_price` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '实际支付商品金额',
                                `discount_price` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '优惠金额',
                                `spec_value_ids` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品规格id',
                                `delivery_id` int(11) NULL DEFAULT 0 COMMENT '发货单ID',
                                `refund_status` tinyint(1) NULL DEFAULT 0 COMMENT '售后状态;0-未申请退款;1-申请退款;2-等待退款;3-退款成功;',
                                `is_comment` tinyint(1) NULL DEFAULT 0 COMMENT '是否已评论；0-否；1-是',
                                `commission_ratio` decimal(10, 0) NULL DEFAULT NULL COMMENT '抽成比例',
                                `is_seckill` tinyint(1) NULL DEFAULT 0 COMMENT '秒杀商品;0-不是;1-是',
                                `create_time` int(10) NULL DEFAULT 0 COMMENT '创建时间',
                                PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT = '订单商品表';

-- ----------------------------
-- Table structure for yx_order_log
-- ----------------------------
DROP TABLE IF EXISTS `yx_order_log`;
CREATE TABLE `yx_order_log`  (
                                `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'id',
                                `type` tinyint(1) NULL DEFAULT 0 COMMENT '操作类型;0-会员;1-门店',
                                `channel` smallint(5) UNSIGNED NULL DEFAULT 0 COMMENT '渠道编号。变动方式。',
                                `order_id` int(10) NULL DEFAULT NULL COMMENT '订单id',
                                `handle_id` int(10) NULL DEFAULT NULL COMMENT '操作人id',
                                `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日志内容',
                                `create_time` int(10) NULL DEFAULT NULL COMMENT '创建时间',
                                PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT = '订单日志表';

-- ----------------------------
-- Table structure for yx_order_refund
-- ----------------------------
DROP TABLE IF EXISTS `yx_order_refund`;
CREATE TABLE `yx_order_refund`  (
                                    `id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
                                    `order_id` int(1) UNSIGNED NULL DEFAULT 0 COMMENT '订单id',
                                    `user_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '下单用户id，冗余字段',
                                    `refund_sn` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '退款单号，一个订单分多次退款则有多个退款单号',
                                    `order_amount` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '订单总的应付款金额，冗余字段',
                                    `refund_amount` decimal(10, 2) UNSIGNED NULL DEFAULT 0.00 COMMENT '本次退款金额',
                                    `transaction_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '第三方平台交易流水号',
                                    `refund_status` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '退款状态，0退款中，1完成退款，2退款失败，3退款异常（人工去后台查询）',
                                    `refund_way` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '退款方式，0原路退',
                                    `refund_at` int(1) UNSIGNED NULL DEFAULT 0 COMMENT '退款时间',
                                    `wechat_refund_id` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信返回退款id',
                                    `refund_msg` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '微信返回信息',
                                    `create_time` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '创建时间',
                                    `update_time` int(10) NULL DEFAULT NULL COMMENT '更新时间',
                                    PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT = '订单退款表';

-- ----------------------------
-- Table structure for yx_partner
-- ----------------------------
DROP TABLE IF EXISTS `yx_partner`;
CREATE TABLE `yx_partner`  (
                            `id` int(11) NOT NULL AUTO_INCREMENT,
                            `name` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '机构名称',
                            `del` tinyint(1) NULL DEFAULT 0 COMMENT '是否删除：0-否；1-是；',
                            PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT = '机构表';

-- ----------------------------
-- Table structure for yx_partner_admin
-- ----------------------------
DROP TABLE IF EXISTS `yx_partner_admin`;
CREATE TABLE `yx_partner_admin`  (
                                    `id` int(11) NOT NULL AUTO_INCREMENT,
                                    `root` tinyint(1) NULL DEFAULT 0 COMMENT '0-非超级管理员；1-超级管理；',
                                    `name` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '名称',
                                    `type` tinyint(4) NULL DEFAULT 0 COMMENT '账号类型：0-默认管理后台；其他根据业务再定',
                                    `account` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '账号',
                                    `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
                                    `salt` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '密码盐',
                                    `role_id` int(11) NOT NULL DEFAULT 0 COMMENT '角色id',
                                    `create_time` int(10) NULL DEFAULT NULL COMMENT '创建时间',
                                    `update_time` int(10) NULL DEFAULT NULL COMMENT '修改时间',
                                    `login_time` int(10) NULL DEFAULT NULL COMMENT '最后登录时间',
                                    `login_ip` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '最后登录ip',
                                    `disable` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否禁用：0-否；1-是；',
                                    `del` tinyint(10) NOT NULL DEFAULT 0 COMMENT '0为非删除状态，非0位删除时间',
                                    `partner_id` int(11) NOT NULL DEFAULT 0 COMMENT '机构id',
                                    PRIMARY KEY (`id`) USING BTREE,
                                    UNIQUE INDEX `account`(`account`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT = '机构后台管理员表';

-- ----------------------------
-- Table structure for yx_partner_role
-- ----------------------------
DROP TABLE IF EXISTS `yx_partner_role`;
CREATE TABLE `yx_partner_role`  (
                                    `id` int(11) NOT NULL AUTO_INCREMENT,
                                    `name` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '父级id',
                                    `auth_ids` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '权限',
                                    `desc` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '描述',
                                    `del` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否删除：0-否；1-是；',
                                    `create_time` int(10) NULL DEFAULT NULL COMMENT '创建时间',
                                    `update_time` int(10) NULL DEFAULT NULL COMMENT '更新时间',
                                    `partner_id` int(11) NOT NULL DEFAULT 0 COMMENT '机构id',
                                    PRIMARY KEY (`id`, `del`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT = '机构角色表';

-- ----------------------------
-- Table structure for yx_recharge_order
-- ----------------------------
DROP TABLE IF EXISTS `yx_recharge_order`;
CREATE TABLE `yx_recharge_order`  (
                                    `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
                                    `order_sn` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单编号',
                                    `transaction_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '第三方平台交易流水号',
                                    `order_source` tinyint(1) NULL DEFAULT 1 COMMENT '订单来源：1-小程序;2-h5;3-ios;4-安卓',
                                    `pay_way` tinyint(2) NOT NULL DEFAULT 1 COMMENT '支付方式：1-微信支付  2-支付宝支付 3-余额支付',
                                    `pay_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '支付状态：0-待支付；1-已支付',
                                    `pay_time` int(10) NULL DEFAULT NULL COMMENT '支付时间',
                                    `user_id` int(11) NOT NULL COMMENT '用户id',
                                    `template_id` int(11) NULL DEFAULT NULL COMMENT '模板id',
                                    `order_amount` decimal(10, 2) NOT NULL COMMENT '充值金额',
                                    `give_money` decimal(10, 2) NULL DEFAULT NULL COMMENT '赠送金额',
                                    `give_integral` int(10) NULL DEFAULT NULL COMMENT '赠送积分',
                                    `give_growth` int(10) NULL DEFAULT NULL COMMENT '赠送成长值',
                                    `create_time` int(10) NOT NULL COMMENT '创建时间',
                                    PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT = '充值订单表';

-- ----------------------------
-- Table structure for yx_recharge_template
-- ----------------------------
DROP TABLE IF EXISTS `yx_recharge_template`;
CREATE TABLE `yx_recharge_template`  (
                                        `id` int(11) NOT NULL AUTO_INCREMENT,
                                        `money` decimal(10, 2) NOT NULL COMMENT '充值金额',
                                        `give_money` decimal(10, 2) NULL DEFAULT NULL COMMENT '赠送金额',
                                        `sort` int(10) NULL DEFAULT NULL COMMENT '排序',
                                        `is_recommend` tinyint(1) NULL DEFAULT 0 COMMENT '是否推荐：1-是；0-否',
                                        `create_time` int(10) NOT NULL COMMENT '创建时间',
                                        `update_time` int(10) NULL DEFAULT NULL COMMENT '更新时间',
                                        `del` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否删除：1-是；0-否',
                                        PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT = '充值模板';

-- ----------------------------
-- Table structure for yx_role
-- ----------------------------
DROP TABLE IF EXISTS `yx_role`;
CREATE TABLE `yx_role`  (
                            `id` int(11) NOT NULL AUTO_INCREMENT,
                            `name` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '父级id',
                            `auth_ids` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '权限',
                            `desc` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '描述',
                            `del` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否删除：0-否；1-是；',
                            `create_time` int(10) NULL DEFAULT NULL COMMENT '创建时间',
                            `update_time` int(10) NULL DEFAULT NULL COMMENT '更新时间',
                            PRIMARY KEY (`id`, `del`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT = '角色表';

-- ----------------------------
-- Table structure for yx_role_dev_auth_index
-- ----------------------------
DROP TABLE IF EXISTS `yx_role_dev_auth_index`;
CREATE TABLE `yx_role_dev_auth_index`  (
                                        `role_id` int(11) NOT NULL,
                                        `menu_auth_id` int(11) NOT NULL,
                                        PRIMARY KEY (`role_id`, `menu_auth_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for yx_search_record
-- ----------------------------
DROP TABLE IF EXISTS `yx_search_record`;
CREATE TABLE `yx_search_record`  (
                                    `id` int(20) NOT NULL AUTO_INCREMENT,
                                    `user_id` int(11) NULL DEFAULT 0 COMMENT '用户id',
                                    `keyword` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '关键字',
                                    `update_time` int(11) NULL DEFAULT 0 COMMENT '更新时间',
                                    `count` int(11) NULL DEFAULT 1 COMMENT '次数',
                                    `del` tinyint(1) NULL DEFAULT 0 COMMENT '是否已删除,0-未删除,1-已删除',
                                    PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT = '用户热门搜索';

-- ----------------------------
-- Table structure for yx_seckill_goods
-- ----------------------------
DROP TABLE IF EXISTS `yx_seckill_goods`;
CREATE TABLE `yx_seckill_goods`  (
                                    `id` int(10) NOT NULL AUTO_INCREMENT,
                                    `seckill_id` int(10) NOT NULL COMMENT '秒杀时间id',
                                    `goods_id` int(10) NOT NULL COMMENT '参与秒杀商品的id',
                                    `item_id` int(11) NULL DEFAULT NULL COMMENT '参与秒杀规格id',
                                    `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '秒杀活动价',
                                    `sales_sum` int(10) NULL DEFAULT 0 COMMENT '销量',
                                    `create_time` int(10) NULL DEFAULT NULL COMMENT '创建时间',
                                    `update_time` int(10) NULL DEFAULT NULL COMMENT '更新时间',
                                    `del` tinyint(1) NULL DEFAULT NULL COMMENT '是否删除；1-是；0-否',
                                    PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for yx_seckill_time
-- ----------------------------
DROP TABLE IF EXISTS `yx_seckill_time`;
CREATE TABLE `yx_seckill_time`  (
                                    `id` int(10) NOT NULL AUTO_INCREMENT,
                                    `start_time` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '开始时间',
                                    `end_time` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '结束时间',
                                    `create_time` int(10) NOT NULL COMMENT '创建时间',
                                    `update_time` int(10) NULL DEFAULT NULL COMMENT '更新时间',
                                    `del` tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除时间；1-是；0-否',
                                    PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for yx_session
-- ----------------------------
DROP TABLE IF EXISTS `yx_session`;
CREATE TABLE `yx_session`  (
                            `id` int(11) NOT NULL AUTO_INCREMENT,
                            `user_id` int(11) NOT NULL COMMENT '用户id',
                            `token` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '令牌',
                            `client` tinyint(1) NOT NULL COMMENT '客户端类型：1-微信小程序；2-h5；3-ios；4-android',
                            `update_time` int(10) NOT NULL COMMENT '更新时间',
                            `expire_time` int(10) NOT NULL COMMENT '到期时间',
                            PRIMARY KEY (`id`) USING BTREE,
                            UNIQUE INDEX `user_id_client`(`user_id`, `client`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT = '会话表';

-- ----------------------------
-- Table structure for yx_sign_daily
-- ----------------------------
DROP TABLE IF EXISTS `yx_sign_daily`;
CREATE TABLE `yx_sign_daily`  (
                                `id` int(10) NOT NULL AUTO_INCREMENT,
                                `type` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型',
                                `integral` int(10) NULL DEFAULT NULL COMMENT '赠送积分',
                                `integral_status` tinyint(1) NULL DEFAULT NULL COMMENT '赠送积分状态：1-是；0-否；',
                                `growth_status` tinyint(1) NULL DEFAULT NULL COMMENT '赠送优惠劵状态：1-是；0-否；',
                                `days` int(24) NULL DEFAULT 1 COMMENT '连续签到天数',
                                `create_time` int(10) NULL DEFAULT NULL COMMENT '创建时间',
                                `update_time` int(10) NULL DEFAULT NULL COMMENT '更新时间',
                                `del` tinyint(1) NOT NULL COMMENT '是否删除：0-否；1-是；',
                                `growth` int(16) NULL DEFAULT NULL COMMENT '成长值',
                                PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for yx_sms_config
-- ----------------------------
DROP TABLE IF EXISTS `yx_sms_config`;
CREATE TABLE `yx_sms_config`  (
                                `id` int(11) NOT NULL AUTO_INCREMENT,
                                `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '短信通道',
                                `describe` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
                                `sign` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '签名',
                                `app_key` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'app_key',
                                `secret_key` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'secret_key',
                                `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '状态：0-关闭；1-开启',
                                `del` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否删除；0-否；1-是',
                                PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for yx_sms_log
-- ----------------------------
DROP TABLE IF EXISTS `yx_sms_log`;
CREATE TABLE `yx_sms_log`  (
                            `id` int(11) NOT NULL AUTO_INCREMENT,
                            `message_key` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '消息key',
                            `mobile` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '手机号码',
                            `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '发送内容',
                            `code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发送关键字（注册、找回密码）',
                            `is_verify` tinyint(1) NULL DEFAULT 0 COMMENT '是否已验证；0-否；1-是',
                            `send_status` tinyint(1) NOT NULL COMMENT '发送状态：0-发送中；1-发送成功；2-发送失败',
                            `send_time` int(10) NOT NULL COMMENT '发送时间',
                            `results` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '短信结果',
                            `create_time` int(10) NOT NULL COMMENT '创建时间',
                            `update_time` int(10) NULL DEFAULT NULL COMMENT '更新时间',
                            PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT = '短信发送记录表';

-- ----------------------------
-- Table structure for yx_stat
-- ----------------------------
DROP TABLE IF EXISTS `yx_stat`;
CREATE TABLE `yx_stat`  (
                            `id` int(10) NOT NULL AUTO_INCREMENT,
                            `today_user_pv` int(10) NULL DEFAULT 0 COMMENT '今日用户访问量',
                            `create_time` int(10) UNSIGNED NOT NULL COMMENT '变动时间',
                            PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT = '统计表';

-- ----------------------------
-- Table structure for yx_supplier
-- ----------------------------
DROP TABLE IF EXISTS `yx_supplier`;
CREATE TABLE `yx_supplier`  (
                                `id` int(11) NOT NULL AUTO_INCREMENT,
                                `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
                                `del` tinyint(2) NULL DEFAULT 0 COMMENT '删除,0-未删除,1-已删除',
                                `create_time` int(11) NULL DEFAULT NULL COMMENT '创建时间',
                                `update_time` int(11) NULL DEFAULT NULL COMMENT '更新时间',
                                `tel` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
                                `contact` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人',
                                `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '备注',
                                `province_id` int(11) NULL DEFAULT NULL COMMENT '省',
                                `city_id` int(11) NULL DEFAULT NULL COMMENT '市',
                                `district_id` int(11) NULL DEFAULT NULL COMMENT '区',
                                `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细地址',
                                PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT = '供货商表';

-- ----------------------------
-- Table structure for yx_system_log
-- ----------------------------
DROP TABLE IF EXISTS `yx_system_log`;
CREATE TABLE `yx_system_log`  (
                                `id` int(11) NOT NULL AUTO_INCREMENT,
                                `admin_id` int(11) NOT NULL COMMENT '管理员',
                                `name` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '管理员名称',
                                `account` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '管理员账号',
                                `create_time` int(10) NULL DEFAULT NULL COMMENT '创建时间',
                                `uri` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '访问链接',
                                `type` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '请求方式',
                                `param` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '请求数据',
                                `ip` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'Ip地址',
                                PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for yx_temp
-- ----------------------------
DROP TABLE IF EXISTS `yx_temp`;
CREATE TABLE `yx_temp`  (
                            `id` int(11) NOT NULL AUTO_INCREMENT,
                            `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
                            PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for yx_user
-- ----------------------------
DROP TABLE IF EXISTS `yx_user`;
CREATE TABLE `yx_user`  (
                            `id` int(11) NOT NULL AUTO_INCREMENT,
                            `sn` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '会员码',
                            `root` tinyint(255) NULL DEFAULT 0 COMMENT '是否为超级管理：0-否；1-是；',
                            `nickname` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户昵称',
                            `avatar` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户头像',
                            `mobile` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号码',
                            `level` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '等级',
                            `group_id` int(11) NULL DEFAULT NULL COMMENT '所属分组id',
                            `sex` tinyint(1) NULL DEFAULT 0 COMMENT '性别:0-未知；1-男；2-女',
                            `birthday` int(11) NULL DEFAULT NULL COMMENT '生日',
                            `user_money` decimal(10, 2) UNSIGNED NULL DEFAULT 0.00 COMMENT '用户余额',
                            `user_integral` int(10) NULL DEFAULT 0 COMMENT '用户积分',
                            `total_order_amount` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '消费累计额度',
                            `total_recharge_amount` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '累计充值金额',
                            `account` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '账号',
                            `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
                            `pay_password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付密码',
                            `salt` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '密码盐',
                            `first_leader` int(11) NULL DEFAULT 0 COMMENT '第一个上级',
                            `second_leader` int(11) NULL DEFAULT 0 COMMENT '第二个上级',
                            `third_leader` int(11) NULL DEFAULT 0 COMMENT '第三个上级',
                            `ancestor_relation` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '所有的上级关系链',
                            `is_distribution` tinyint(1) NULL DEFAULT 0 COMMENT '是否分销会员：1-是；0-否；',
                            `freeze_distribution` tinyint(1) NULL DEFAULT 0 COMMENT '冻结分销资格: 1-冻结; 0-正常',
                            `distribution_h5_qr_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '分销h5二维码\n',
                            `distribution_mnp_qr_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '分销小程序二维码\n',
                            `distribution_app_qr_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '分销app二维码\n',
                            `distribution_code` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分销码',
                            `create_time` int(10) NULL DEFAULT NULL COMMENT '创建时间',
                            `update_time` int(10) NULL DEFAULT NULL COMMENT '修改时间',
                            `login_time` int(10) NULL DEFAULT NULL COMMENT '最后登录时间',
                            `login_ip` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '最后登录ip',
                            `disable` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否禁用：0-否；1-是；',
                            `del` tinyint(10) NOT NULL DEFAULT 0 COMMENT '0为非删除状态，非0位删除时间',
                            `user_growth` int(128) NULL DEFAULT 0 COMMENT '用户成长值',
                            `earnings` float(10, 2) NULL DEFAULT 0.00 COMMENT '佣金收益',
                            PRIMARY KEY (`id`) USING BTREE,
                            UNIQUE INDEX `distribution_code`(`distribution_code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT = '用户表';

-- ----------------------------
-- Table structure for yx_user_address
-- ----------------------------
DROP TABLE IF EXISTS `yx_user_address`;
CREATE TABLE `yx_user_address`  (
                                    `id` int(11) NOT NULL AUTO_INCREMENT,
                                    `user_id` int(10) UNSIGNED NOT NULL COMMENT '用户id',
                                    `contact` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人',
                                    `telephone` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '联系方式',
                                    `province_id` int(11) NOT NULL COMMENT '省',
                                    `city_id` int(11) NULL DEFAULT NULL COMMENT '市',
                                    `district_id` int(11) NULL DEFAULT NULL COMMENT '区',
                                    `address` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细地址',
                                    `post_code` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '邮编',
                                    `longitude` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '经度',
                                    `latitude` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '纬度',
                                    `is_default` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '是否默认(1为默认)',
                                    `create_time` int(11) NULL DEFAULT NULL COMMENT '创建时间',
                                    `update_time` int(11) NULL DEFAULT NULL COMMENT '修改时间',
                                    `del` tinyint(1) NULL DEFAULT 0 COMMENT '删除,0-未删除,1-已删除',
                                    PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT = '用户地址表';

-- ----------------------------
-- Table structure for yx_user_auth
-- ----------------------------
DROP TABLE IF EXISTS `yx_user_auth`;
CREATE TABLE `yx_user_auth`  (
                                `id` int(11) NOT NULL AUTO_INCREMENT,
                                `user_id` int(11) NOT NULL COMMENT '用户id',
                                `openid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '微信openid',
                                `unionid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '微信unionid',
                                `create_time` int(10) NULL DEFAULT NULL COMMENT '创建时间',
                                `update_time` int(10) NULL DEFAULT NULL COMMENT '更新时间',
                                `client` tinyint(1) NOT NULL COMMENT '客户端类型：1-微信小程序；2-h5；3-ios；4-android',
                                PRIMARY KEY (`id`) USING BTREE,
                                UNIQUE INDEX `openid`(`openid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT = '用户授权表';

-- ----------------------------
-- Table structure for yx_user_distribution
-- ----------------------------
DROP TABLE IF EXISTS `yx_user_distribution`;
CREATE TABLE `yx_user_distribution`  (
                                        `id` int(11) NOT NULL AUTO_INCREMENT,
                                        `user_id` int(10) NULL DEFAULT NULL COMMENT '会员id',
                                        `distribution_order_num` int(10) NULL DEFAULT 0 COMMENT '分销订单数量',
                                        `distribution_money` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '分销金额',
                                        `fans` int(10) NULL DEFAULT 0 COMMENT '粉丝数量',
                                        `create_time` int(10) NULL DEFAULT NULL COMMENT '创建时间',
                                        `update_time` int(10) NULL DEFAULT NULL COMMENT '修改时间',
                                        PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT = '用户分销信息表';

-- ----------------------------
-- Table structure for yx_user_file
-- ----------------------------
DROP TABLE IF EXISTS `yx_user_file`;
CREATE TABLE `yx_user_file`  (
                                `id` int(11) NOT NULL AUTO_INCREMENT,
                                `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文件名',
                                `type` tinyint(1) NOT NULL COMMENT '类型',
                                `uri` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文件相对路径',
                                `create_time` int(10) NOT NULL COMMENT '创建时间',
                                `del` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否删除：0-否；1-是；',
                                `user_id` int(11) NOT NULL DEFAULT 0 COMMENT '用户id',
                                PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT = '文件表';

-- ----------------------------
-- Table structure for yx_user_group
-- ----------------------------
DROP TABLE IF EXISTS `yx_user_group`;
CREATE TABLE `yx_user_group`  (
                                `id` int(11) NOT NULL AUTO_INCREMENT,
                                `name` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
                                `remark` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
                                `create_time` int(10) NULL DEFAULT NULL COMMENT '创建时间',
                                `update_time` int(10) NULL DEFAULT NULL COMMENT '更新时间',
                                `del` tinyint(1) NULL DEFAULT 0 COMMENT '是否删除；1-是；0-否',
                                PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT = '会员分组表';

-- ----------------------------
-- Table structure for yx_user_level
-- ----------------------------
DROP TABLE IF EXISTS `yx_user_level`;
CREATE TABLE `yx_user_level`  (
                                `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
                                `name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
                                `growth_value` int(11) NOT NULL DEFAULT 0 COMMENT '成长值',
                                `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '等级备注',
                                `background_image` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '背景图片',
                                `image` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '等级图标',
                                `privilege` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '等级权益',
                                `create_time` int(10) NULL DEFAULT NULL COMMENT '创建时间',
                                `update_time` int(10) NULL DEFAULT NULL COMMENT '更新时间',
                                `del` tinyint(10) NULL DEFAULT 0 COMMENT '是否删除;1-是；0-否',
                                PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT = '会员等级表';

-- ----------------------------
-- Table structure for yx_user_privilege
-- ----------------------------
DROP TABLE IF EXISTS `yx_user_privilege`;
CREATE TABLE `yx_user_privilege`  (
                                    `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
                                    `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '权益名称',
                                    `image` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '权益图标',
                                    `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权益说明',
                                    `create_time` int(10) NOT NULL COMMENT '创建时间',
                                    `update_time` int(10) NULL DEFAULT NULL COMMENT '更新时间',
                                    `del` tinyint(1) NOT NULL COMMENT '是否删除：1-是；0-否',
                                    PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT = '会员权益';

-- ----------------------------
-- Table structure for yx_user_sign
-- ----------------------------
DROP TABLE IF EXISTS `yx_user_sign`;
CREATE TABLE `yx_user_sign`  (
                                `id` int(10) NOT NULL AUTO_INCREMENT,
                                `days` int(11) NULL DEFAULT 0 COMMENT '连续签到天数',
                                `integral` int(11) NULL DEFAULT 0 COMMENT '签到奖励积分',
                                `continuous_integral` int(11) NULL DEFAULT 0 COMMENT '连续奖励积分',
                                `sign_time` int(10) NULL DEFAULT NULL COMMENT '签到时间',
                                `user_id` int(10) NULL DEFAULT NULL COMMENT '用户id',
                                `growth` int(11) NULL DEFAULT 0 COMMENT '签到奖励成长值',
                                `continuous_growth` int(11) NULL DEFAULT 0 COMMENT '连续签到奖励成长值',
                                `create_time` int(10) NULL DEFAULT NULL COMMENT '创建时间',
                                `update_time` int(10) NULL DEFAULT NULL COMMENT '更新时间',
                                `del` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否删除：0-否；1-是；',
                                PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for yx_wechat_reply
-- ----------------------------
DROP TABLE IF EXISTS `yx_wechat_reply`;
CREATE TABLE `yx_wechat_reply`  (
                                    `id` int(11) NOT NULL AUTO_INCREMENT,
                                    `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '规则名称',
                                    `keyword` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关键词',
                                    `reply_type` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '回复类型：0-默认回复',
                                    `matching_type` tinyint(1) NULL DEFAULT NULL COMMENT '匹配方式：null-不设置；1-全匹配；2-模糊匹配',
                                    `content_type` tinyint(1) NULL DEFAULT NULL COMMENT '内容类型：null-不设置；1-文本；',
                                    `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '回复内容',
                                    `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '启动状态：1-启动；0-关闭',
                                    `sort` int(11) NULL DEFAULT 0 COMMENT '排序',
                                    `create_time` int(10) NOT NULL COMMENT '创建时间',
                                    `update_time` int(10) NULL DEFAULT NULL COMMENT '更新时间',
                                    `del` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否删除：1-是；0-否',
                                    PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT = '微信公众号回复';

-- ----------------------------
-- Table structure for yx_withdraw_apply
-- ----------------------------
DROP TABLE IF EXISTS `yx_withdraw_apply`;
CREATE TABLE `yx_withdraw_apply`  (
                                    `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
                                    `sn` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '提现单号',
                                    `user_id` int(11) NOT NULL COMMENT '用户id',
                                    `real_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '真实姓名',
                                    `account` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '账号',
                                    `type` tinyint(1) NOT NULL COMMENT '类型：1-提现到余额；2-提现到微信；3-提现到支付宝',
                                    `money` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '提现金额',
                                    `left_money` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '用户可得的金额(扣除手续费后)',
                                    `money_qr_code` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '收款二维码',
                                    `poundage` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '手续费',
                                    `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
                                    `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '状态：0-待审核；1-审核通过；2-审核不通过',
                                    `create_time` int(10) NOT NULL COMMENT '创建时间',
                                    `update_time` int(10) NULL DEFAULT NULL COMMENT '更新时间',
                                    PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT = '提现申请记录表';INSERT INTO `yx_admin` VALUES (1, 1, 'admin', NULL, 'admin', 
                '55d3b8eab457a567d4f17058de9703d0', '6719', 0, '1607762951', '1607762951', '1607762951', '', 0, 0);INSERT INTO `yx_admin` VALUES (1, 1, 'admin', NULL, 'admin', 
                '57171ec3cd098d5610e7945eaefc5d79', '6ced', 0, '1607763437', '1607763437', '1607763437', '', 0, 0);INSERT INTO `yx_admin` VALUES (1, 1, 'admin', NULL, 'admin', 
                '66dfcaed3ce98528899396f8e5802526', '029b', 0, '1608272838', '1608272838', '1608272838', '', 0, 0);INSERT INTO `yx_admin` VALUES (1, 1, 'admin', NULL, 'admin', 
                '3400dce0f471511e096b66734abb5712', '10a3', 0, '1608273813', '1608273813', '1608273813', '', 0, 0);INSERT INTO `yx_admin` VALUES (1, 1, 'admin', NULL, 'admin', 
                '71ae4db9de5ad8946b7fca88b7f88c5d', '27d1', 0, '1608386605', '1608386605', '1608386605', '', 0, 0);