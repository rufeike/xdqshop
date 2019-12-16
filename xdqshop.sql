/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50727
Source Host           : localhost:3306
Source Database       : xdqshop

Target Server Type    : MYSQL
Target Server Version : 50727
File Encoding         : 65001

Date: 2019-12-17 00:23:31
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tp_article
-- ----------------------------
DROP TABLE IF EXISTS `tp_article`;
CREATE TABLE `tp_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `author` varchar(60) DEFAULT NULL COMMENT '作者',
  `title` varchar(60) DEFAULT NULL COMMENT '文章名称',
  `keywords` varchar(255) DEFAULT NULL COMMENT '关键词',
  `thumb` varchar(255) DEFAULT NULL COMMENT '缩略图',
  `description` tinytext COMMENT '描述',
  `content` text COMMENT '文章内容',
  `cate_id` int(11) DEFAULT '0' COMMENT '文章分类ID',
  `sort` int(11) DEFAULT '99' COMMENT '排序',
  `show_top` tinyint(1) DEFAULT '0' COMMENT '是否置顶 默认为0 否，1：置顶',
  `status` tinyint(1) DEFAULT '0' COMMENT '是否显示到导航，状态 0：不显示 1显示',
  `create_time` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(20) DEFAULT '0' COMMENT '更改时间',
  `is_del` tinyint(1) DEFAULT '1' COMMENT '默认1：正常 1：删除',
  `link_url` varchar(255) DEFAULT NULL COMMENT '外部链接地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COMMENT='文章表';

-- ----------------------------
-- Records of tp_article
-- ----------------------------
INSERT INTO `tp_article` VALUES ('1', '如非客', '售后流程', '售后流程', '', '售后流程', '<p>售后流程</p>', '4', '1', '0', '1', '1576339023', '0', '1', '');
INSERT INTO `tp_article` VALUES ('2', '如非客', '购物流程', '购物流程', 'public\\uploads\\article\\20191214\\7bc23cf73afaec8597b9051b8f49dc23.jpg', '', '<p style=\"padding: 0px; line-height: 1.75em; color: rgb(94, 94, 94); font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"https://gfs12.gomein.net.cn/T1j2VvBXZ_1RCvBVdK.png\" title=\"国美购物流程（8.14）\"/></p><p style=\"padding: 0px; line-height: 1.75em; color: rgb(94, 94, 94); font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">1. 注册/登录</p><p style=\"padding: 0px; line-height: 1.75em; color: rgb(94, 94, 94); font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">&nbsp;&nbsp;&nbsp; 登录国美账号，如果您还没有国美账户，请点击“注册”</p><p style=\"padding: 0px; line-height: 1.75em; color: rgb(94, 94, 94); font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">2. 选购商品</p><p style=\"padding: 0px; line-height: 1.75em; color: rgb(94, 94, 94); font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">&nbsp;&nbsp;&nbsp; 分类浏览或直接搜索查找商品</p><p style=\"padding: 0px; line-height: 1.75em; color: rgb(94, 94, 94); font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">3. 加入购物车</p><p style=\"padding: 0px; line-height: 1.75em; color: rgb(94, 94, 94); font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">&nbsp;&nbsp;&nbsp; 商品加入购物车去结算或者继续购物</p><p style=\"padding: 0px; line-height: 1.75em; color: rgb(94, 94, 94); font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">4. 去结算</p><p style=\"padding: 0px; line-height: 1.75em; color: rgb(94, 94, 94); font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">&nbsp;&nbsp; 点击去结算按钮，进入订单信息页面，确认您的收货地址、联系方式、支付方式、配送方式、发票信息</p><p style=\"padding: 0px; line-height: 1.75em; color: rgb(94, 94, 94); font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">5. 提交订单</p><p style=\"padding: 0px; line-height: 1.75em; color: rgb(94, 94, 94); font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">&nbsp;&nbsp;&nbsp; 确认无误，提交订单，完成支付</p><p style=\"padding: 0px; line-height: 1.75em; color: rgb(94, 94, 94); font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">6. 查看订单</p><p style=\"padding: 0px; line-height: 1.75em; color: rgb(94, 94, 94); font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">&nbsp;&nbsp;&nbsp; 在“我的”-“全部订单”页面，查看订单状态，了解商品配送流程</p><p style=\"padding: 0px; line-height: 1.75em; color: rgb(94, 94, 94); font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">7. 确认收货</p><p style=\"padding: 0px; line-height: 1.75em; color: rgb(94, 94, 94); font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">&nbsp;&nbsp;&nbsp; 确认收货，参与商品评价互动</p><p><br/></p>', '4', '2', '0', '1', '1576339065', '1576402750', '1', '');
INSERT INTO `tp_article` VALUES ('3', '如非客', '订购方式', '订购方式', '', '', '<p>订购方式</p>', '4', '3', '0', '1', '1576339139', '1576339516', '1', '');
INSERT INTO `tp_article` VALUES ('4', '如非客', '货到付款区域', '货到付款区域', '', '', '<p>货到付款区域</p>', '6', '1', '0', '1', '1576339180', '0', '1', '');
INSERT INTO `tp_article` VALUES ('5', '如非客', '配送支付智能查询', '配送支付智能查询', '', '', '<p>配送支付智能查询</p>', '6', '2', '0', '1', '1576339206', '0', '1', '');
INSERT INTO `tp_article` VALUES ('6', '如非客', '支付方式说明', '支付方式说明', '', '支付方式说明', '<p>支付方式说明</p>', '6', '3', '0', '1', '1576339228', '0', '1', '');
INSERT INTO `tp_article` VALUES ('7', '如非客', '资金管理', '资金管理', '', '资金管理', '<p>资金管理</p>', '7', '1', '0', '1', '1576339255', '0', '1', '');
INSERT INTO `tp_article` VALUES ('8', '如非客', '我的收藏', '我的收藏', '', '我的收藏', '<p>我的收藏</p>', '7', '2', '0', '1', '1576339285', '0', '1', '');
INSERT INTO `tp_article` VALUES ('9', '如非客', '我的订单', '我的订单', '', '', '<p>我的订单<br/></p>', '7', '3', '0', '1', '1576339314', '0', '1', '');
INSERT INTO `tp_article` VALUES ('10', '如非客', '退换货政策', '退换货政策', '', '', '<p style=\"padding: 0px; line-height: 1.75em; color: rgb(94, 94, 94); font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">国美为您提供了在线受理退换货的服务，您只需要登录您的国美账户，在“<a href=\"http://myhome.gome.com.cn/member/myReturnGoodList\" title=\"\" style=\"text-decoration-line: none; color: rgb(94, 94, 94); outline: 0px; cursor: pointer;\"><span style=\"font-weight: 700; line-height: 1.5;\"><span style=\"color: rgb(79, 129, 189);\">我的国美—退换货单</span></span></a>”页面中在线提交申请信息即可！具体操作流程如下：</p><p style=\"padding: 0px; line-height: 1.75em; color: rgb(94, 94, 94); font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"https://gfs11.gomein.net.cn/T1OMDvB5hT1RCvBVdK.jpg\" title=\"20131213165927_822\"/></p><p><br/></p>', '8', '1', '0', '1', '1576339358', '1576400492', '1', '');
INSERT INTO `tp_article` VALUES ('11', '如非客', '售后服务保证', '售后服务保证', '', '售后服务保证', '<p>售后服务保证</p>', '8', '2', '0', '1', '1576339382', '1576339505', '1', '');
INSERT INTO `tp_article` VALUES ('12', '如非客', '产品质量保证', '产品质量保证', '', '', '<p><img src=\"https://gfs11.gomein.net.cn/T1E0CvBbVv1RCvBVdK.png\"/></p>', '8', '3', '0', '1', '1576339403', '1576400051', '1', '');
INSERT INTO `tp_article` VALUES ('13', '如非客', '网站故障报告', '网站故障报告', '', '网站故障报告', '<p>网站故障报告</p>', '9', '1', '0', '1', '1576339430', '0', '1', '');
INSERT INTO `tp_article` VALUES ('14', '如非客', '选购咨询', '选购咨询', '', '', '<p>选购咨询</p>', '9', '2', '0', '1', '1576339476', '0', '1', '');
INSERT INTO `tp_article` VALUES ('15', '如非客', '投诉与建议', '投诉与建议', '', '', '<p>投诉与建议</p>', '9', '3', '0', '1', '1576339494', '0', '1', '');
INSERT INTO `tp_article` VALUES ('16', '', '合作伙伴', '合作伙伴', '', '', '<p>合作伙伴合作伙伴合作伙伴合作伙伴</p>', '3', '99', '0', '0', '1576421236', '0', '1', '');
INSERT INTO `tp_article` VALUES ('17', '', '联系我们', '', '', '', '<p>联系我们联系我们联系我们</p>', '3', '99', '0', '0', '1576421263', '0', '1', '');
INSERT INTO `tp_article` VALUES ('18', '', '网站地图', '', '', '', '<p>网站地图</p>', '3', '99', '0', '0', '1576421294', '0', '1', '');

-- ----------------------------
-- Table structure for tp_article_category
-- ----------------------------
DROP TABLE IF EXISTS `tp_article_category`;
CREATE TABLE `tp_article_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cate_name` varchar(60) DEFAULT NULL,
  `cate_brand` varchar(255) DEFAULT NULL COMMENT '分类背景图',
  `keywords` varchar(255) DEFAULT NULL COMMENT '关键词',
  `description` tinytext COMMENT '描述',
  `pid` int(11) DEFAULT '0' COMMENT '父级ID',
  `sort` int(11) DEFAULT '99' COMMENT '排序',
  `status` tinyint(1) DEFAULT '0' COMMENT '是否显示到导航，状态 0：不显示 1显示',
  `is_del` tinyint(1) DEFAULT '1' COMMENT '默认1：正常 1：删除',
  `create_time` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `cate_type` tinyint(1) DEFAULT '0' COMMENT '分类类型 默认0：普通分类，1：系统分类  2：网店帮助，3：网店信息',
  `allow_add` tinyint(1) DEFAULT '1' COMMENT '是否可以添加子分类 默认为1：可添加，0：不可添加',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COMMENT='文章分类表';

-- ----------------------------
-- Records of tp_article_category
-- ----------------------------
INSERT INTO `tp_article_category` VALUES ('1', '系统分类', null, '系统分类', '系统默认', '0', '99', '1', '1', '1576337703', '1', '0');
INSERT INTO `tp_article_category` VALUES ('2', '网店帮助', null, '网店帮助', '网店帮助', '1', '99', '1', '1', '1576337745', '2', '1');
INSERT INTO `tp_article_category` VALUES ('3', '网店信息', null, '网店信息', '网店信息', '1', '98', '1', '1', '1576337777', '3', '0');
INSERT INTO `tp_article_category` VALUES ('4', '新手上路', null, '', '新手上路', '2', '1', '1', '1', '1576338179', '2', '1');
INSERT INTO `tp_article_category` VALUES ('5', ' 站内快讯', null, ' 站内快讯', ' 站内快讯', '0', '99', '1', '1', '1576338270', '0', '1');
INSERT INTO `tp_article_category` VALUES ('6', '配送与支付', null, '', '配送与支付', '2', '2', '1', '1', '1576338469', '2', '1');
INSERT INTO `tp_article_category` VALUES ('7', '会员中心', null, '', '会员中心', '2', '3', '1', '1', '1576338501', '2', '1');
INSERT INTO `tp_article_category` VALUES ('8', '服务保证', null, '', '服务保证', '2', '4', '1', '1', '1576338543', '2', '1');
INSERT INTO `tp_article_category` VALUES ('9', '联系我们', null, '', '联系我们', '2', '5', '1', '1', '1576338576', '2', '1');
INSERT INTO `tp_article_category` VALUES ('10', '测试', null, '', '', '2', '99', '0', '0', '1576342125', '2', '1');
INSERT INTO `tp_article_category` VALUES ('11', '公告', null, '公告', '公告', '0', '99', '1', '1', '1576386046', '0', '1');
INSERT INTO `tp_article_category` VALUES ('12', '促销', null, '促销', '促销', '0', '99', '1', '1', '1576386089', '0', '1');

-- ----------------------------
-- Table structure for tp_brand
-- ----------------------------
DROP TABLE IF EXISTS `tp_brand`;
CREATE TABLE `tp_brand` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `brand_name` varchar(60) DEFAULT NULL COMMENT '商品品牌',
  `brand_url` varchar(255) DEFAULT NULL COMMENT '品牌网址',
  `brand_src` varchar(255) DEFAULT NULL COMMENT '品牌logo图片',
  `description` tinytext COMMENT '品牌描述',
  `status` tinyint(1) DEFAULT '1' COMMENT '0：隐藏 1：显示',
  `sort` int(11) DEFAULT '50' COMMENT '排序',
  `is_del` tinyint(1) DEFAULT '1' COMMENT '是否删除 0：删除 1：显示',
  `create_time` bigint(20) DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COMMENT='商品品牌';

-- ----------------------------
-- Records of tp_brand
-- ----------------------------
INSERT INTO `tp_brand` VALUES ('1', '呵官方旗舰店', '', '', '呵官方旗舰店', '0', '50', '1', '1576512149');
INSERT INTO `tp_brand` VALUES ('2', '格瑞旗舰店', '', '', '格瑞旗舰店', '0', '50', '1', '1576512164');
INSERT INTO `tp_brand` VALUES ('3', '飞彦大厂直供', '', '', '飞彦大厂直供', '0', '50', '1', '1576512175');
INSERT INTO `tp_brand` VALUES ('4', '红e·艾菲妮', '', '', '红e·艾菲妮', '0', '50', '1', '1576512196');
INSERT INTO `tp_brand` VALUES ('5', '猫儿朵朵', '', '', '猫儿朵朵', '0', '50', '1', '1576512264');
INSERT INTO `tp_brand` VALUES ('6', '花颜巧语', 'http://花颜巧语', '', '花颜巧语', '0', '50', '1', '1576512285');
INSERT INTO `tp_brand` VALUES ('7', '糖衣小屋', '', '', '糖衣小屋', '0', '50', '1', '1576512298');
INSERT INTO `tp_brand` VALUES ('8', '卡拉迪克', '', '', '卡拉迪克', '0', '50', '1', '1576512317');
INSERT INTO `tp_brand` VALUES ('9', '三只松鼠', '', '', '三只松鼠', '0', '50', '1', '1576512451');
INSERT INTO `tp_brand` VALUES ('10', '卫龙', '', '', '卫龙', '0', '50', '1', '1576512464');
INSERT INTO `tp_brand` VALUES ('11', '周黑鸭', '', '', '周黑鸭', '0', '50', '1', '1576512475');
INSERT INTO `tp_brand` VALUES ('12', '绝味', '', '', '绝味', '0', '50', '1', '1576512490');
INSERT INTO `tp_brand` VALUES ('13', '洪濑', '', '', '洪濑', '0', '50', '1', '1576512509');

-- ----------------------------
-- Table structure for tp_config
-- ----------------------------
DROP TABLE IF EXISTS `tp_config`;
CREATE TABLE `tp_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ename` varchar(100) DEFAULT NULL COMMENT '英文名称',
  `cname` varchar(100) DEFAULT NULL COMMENT '中文名称',
  `form_type` varchar(20) DEFAULT 'input' COMMENT '配置项表单类型：input、radio、checkbox、select、textarea、file',
  `value` varchar(120) DEFAULT NULL,
  `values` varchar(255) DEFAULT NULL COMMENT '配置项值',
  `status` tinyint(1) DEFAULT '1' COMMENT '是否禁用，默认为1正常，0：禁用',
  `sort` int(11) DEFAULT '50' COMMENT '排序',
  `config_type` tinyint(1) DEFAULT '0' COMMENT '配置项类型默认为0：网站配置项，1：商品配置项',
  `create_time` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `is_del` tinyint(1) DEFAULT '1' COMMENT '是否删除，默认1：正常，0：删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COMMENT='配置项表';

-- ----------------------------
-- Records of tp_config
-- ----------------------------
INSERT INTO `tp_config` VALUES ('1', 'website', '站点', 'input', '量繁多百货', '', '1', '53', '0', null, '1');
INSERT INTO `tp_config` VALUES ('2', 'description', '企业介绍', 'textarea', '', '', '1', '48', '0', '1574863805', '1');
INSERT INTO `tp_config` VALUES ('3', 'isVcode', '是否开启验证码', 'radio', '开启', '开启,关闭', '1', '50', '0', '1574868889', '1');
INSERT INTO `tp_config` VALUES ('4', 'searchwords', '搜索默认词', 'input', '空调', '', '1', '50', '0', '1574869007', '1');
INSERT INTO `tp_config` VALUES ('5', 'hotwords', '搜索热词', 'textarea', '空调,技能家居', '', '1', '50', '0', '1574869080', '1');
INSERT INTO `tp_config` VALUES ('6', 'waplogo', '手机端logo', 'file', 'public\\uploads\\config\\20191215\\37d4488e849ffb55b178d02cbcdb6e3b.png', '', '1', '50', '0', '1574869132', '1');
INSERT INTO `tp_config` VALUES ('7', 'weblogo', '电脑端logo', 'file', 'public\\uploads\\config\\20191215\\ebcbab72ecf8dc7a58eaa545c14da040.png', '', '1', '50', '0', '1574869166', '1');
INSERT INTO `tp_config` VALUES ('8', 'seotitle', 'SEO标题', 'input', '量繁多百货', '', '1', '50', '0', '1574915902', '1');
INSERT INTO `tp_config` VALUES ('9', 'seokeywords', 'SEO关键字', 'input', '电视,洗衣机,电脑,手机,数码,空调,电脑配件,生活电器', '', '1', '50', '0', '1574915934', '1');
INSERT INTO `tp_config` VALUES ('10', 'seodescription', 'SEO描述', 'textarea', '中国领先的专业家电网购平台.全球品牌电视、洗衣机、电脑、手机、数码、空调、电脑配件、生活电器、网络产品等正品行货，更低价格，更快送达，为您提供便捷、诚信的服务.', '', '1', '50', '0', '1574915982', '1');
INSERT INTO `tp_config` VALUES ('11', 'icp', 'ICP备案号', 'input', '11010502038379号', '', '1', '50', '0', '1574918025', '1');
INSERT INTO `tp_config` VALUES ('12', 'copy', '版权', 'input', '© 2019-2020', '', '1', '50', '0', '1574955177', '1');

-- ----------------------------
-- Table structure for tp_goods
-- ----------------------------
DROP TABLE IF EXISTS `tp_goods`;
CREATE TABLE `tp_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `goods_category_id` int(11) DEFAULT '0' COMMENT '产品分类ID',
  `goods_category_path` varchar(255) DEFAULT NULL COMMENT '产品分类导航路径',
  `goods_num` bigint(20) DEFAULT NULL COMMENT '商品编号',
  `goods_name` varchar(120) DEFAULT NULL COMMENT '商品名称',
  `or_thumb` varchar(255) DEFAULT NULL COMMENT '原图缩略图',
  `sm_thumb` varchar(255) DEFAULT NULL COMMENT '小缩略图',
  `mid_thumb` varchar(255) DEFAULT NULL COMMENT '中缩略图',
  `big_thumb` varchar(255) DEFAULT NULL COMMENT '大图片',
  `brand_id` int(11) DEFAULT '0' COMMENT '品牌ID',
  `description` text COMMENT '商品描述',
  `goods_weight` decimal(10,0) DEFAULT NULL COMMENT '商品重量',
  `goods_unit` varchar(10) DEFAULT 'kg' COMMENT '单位',
  `goods_type_id` int(11) DEFAULT '0' COMMENT '商品类型',
  `market_price` decimal(10,2) DEFAULT '0.00' COMMENT '市场价格',
  `shop_price` decimal(10,2) DEFAULT '0.00' COMMENT '商品价格',
  `status` tinyint(1) DEFAULT '0' COMMENT '默认为0，审核中，1上架，2下架',
  `sort` int(11) DEFAULT '50' COMMENT '排序',
  `create_time` bigint(20) DEFAULT '0' COMMENT '商品添加时间',
  `update_time` bigint(20) DEFAULT '0' COMMENT '更新数据',
  `is_del` tinyint(1) DEFAULT '1' COMMENT '是否删除，默认1正常，0删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='商品表';

-- ----------------------------
-- Records of tp_goods
-- ----------------------------

-- ----------------------------
-- Table structure for tp_goods_attribute
-- ----------------------------
DROP TABLE IF EXISTS `tp_goods_attribute`;
CREATE TABLE `tp_goods_attribute` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attr_name` varchar(50) DEFAULT NULL COMMENT '属性名称',
  `attr_type` tinyint(1) DEFAULT '0' COMMENT '属性类型：默认0唯一属性，1：单选属性',
  `attr_values` varchar(255) DEFAULT NULL COMMENT '属性值，多个属性值用“,”隔开',
  `goods_type_id` int(11) DEFAULT NULL COMMENT '商品类型ID',
  `sort` int(11) DEFAULT '0' COMMENT '排序',
  `status` tinyint(4) DEFAULT '0' COMMENT '是否显示，默认0不显示，1显示',
  `is_del` tinyint(4) DEFAULT '1' COMMENT '是否删除，默认1正常 ，0删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COMMENT='商品属性表';

-- ----------------------------
-- Records of tp_goods_attribute
-- ----------------------------
INSERT INTO `tp_goods_attribute` VALUES ('1', '生产日期', '0', '', '5', '0', '0', '1');
INSERT INTO `tp_goods_attribute` VALUES ('2', '生产日期', '0', '', '1', '1', '0', '1');
INSERT INTO `tp_goods_attribute` VALUES ('3', '保质期', '0', '', '1', '2', '0', '1');
INSERT INTO `tp_goods_attribute` VALUES ('4', '保质期', '0', '', '2', '2', '0', '1');
INSERT INTO `tp_goods_attribute` VALUES ('5', '保质期', '0', '', '3', '2', '0', '1');
INSERT INTO `tp_goods_attribute` VALUES ('6', '保质期', '0', '', '4', '2', '0', '1');
INSERT INTO `tp_goods_attribute` VALUES ('7', '生产日期', '0', '', '2', '1', '0', '1');
INSERT INTO `tp_goods_attribute` VALUES ('8', '生产日期', '0', '', '3', '1', '0', '1');
INSERT INTO `tp_goods_attribute` VALUES ('9', '生产日期', '0', '', '4', '1', '0', '1');
INSERT INTO `tp_goods_attribute` VALUES ('10', '保质期', '0', '', '5', '0', '0', '1');
INSERT INTO `tp_goods_attribute` VALUES ('11', '包装方式', '1', '真空包装,金属罐装', '3', '4', '0', '1');
INSERT INTO `tp_goods_attribute` VALUES ('12', '包装方式', '1', '真空包装,非真空包装', '1', '0', '0', '1');
INSERT INTO `tp_goods_attribute` VALUES ('13', '包装方式', '1', '真空包装,非真空包装', '2', '0', '0', '1');

-- ----------------------------
-- Table structure for tp_goods_attribute_detail
-- ----------------------------
DROP TABLE IF EXISTS `tp_goods_attribute_detail`;
CREATE TABLE `tp_goods_attribute_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) DEFAULT NULL COMMENT '商品ID',
  `goods_attribute_id` int(11) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `balance` decimal(10,2) DEFAULT '0.00' COMMENT '价格差额',
  PRIMARY KEY (`id`),
  KEY `goods_id` (`goods_id`),
  KEY `goods_attribute_id` (`goods_attribute_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='商品属性详细表';

-- ----------------------------
-- Records of tp_goods_attribute_detail
-- ----------------------------

-- ----------------------------
-- Table structure for tp_goods_category
-- ----------------------------
DROP TABLE IF EXISTS `tp_goods_category`;
CREATE TABLE `tp_goods_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cate_name` varchar(60) DEFAULT NULL COMMENT '分类名称',
  `thumb` varchar(255) DEFAULT NULL COMMENT '分类背景图',
  `keywords` varchar(255) DEFAULT NULL COMMENT '关键词',
  `description` tinytext COMMENT '描述',
  `pid` int(11) DEFAULT '0' COMMENT '父级ID',
  `sort` int(11) DEFAULT '99' COMMENT '排序',
  `status` tinyint(1) DEFAULT '0' COMMENT '是否显示到导航，状态 0：不显示 1显示',
  `is_del` tinyint(1) DEFAULT '1' COMMENT '默认1：正常 1：删除',
  `create_time` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `allow_add` tinyint(1) DEFAULT '1' COMMENT '是否可以添加子分类 默认为1：可添加，0：不可添加',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COMMENT='商品分类表';

-- ----------------------------
-- Records of tp_goods_category
-- ----------------------------
INSERT INTO `tp_goods_category` VALUES ('1', '点心/蛋糕', 'public\\uploads\\goodscategory\\20191216\\b887cca3eb68ea5330e7e0507b7be156.png', '点心/蛋糕', '点心/蛋糕', '0', '1', '1', '1', '1576509553', '1');
INSERT INTO `tp_goods_category` VALUES ('2', '饼干/膨化', 'public\\uploads\\goodscategory\\20191216\\4647ba406833b17a2667ed23b44c13fd.png', '饼干/膨化', '饼干/膨化', '0', '2', '1', '1', '1576509579', '1');
INSERT INTO `tp_goods_category` VALUES ('3', '熟食/肉类', 'public\\uploads\\goodscategory\\20191216\\71312da5fd2217a03d2acb4fa8ee5d80.png', '熟食/肉类', '熟食/肉类', '0', '3', '1', '1', '1576509613', '1');
INSERT INTO `tp_goods_category` VALUES ('4', '坚果/炒货', 'public\\uploads\\goodscategory\\20191216\\e04b210695aa062a1bce16983d98b4e6.png', '坚果/炒货', '坚果/炒货', '0', '5', '1', '1', '1576509637', '1');
INSERT INTO `tp_goods_category` VALUES ('5', '糖果/蜜饯', 'public\\uploads\\goodscategory\\20191216\\2c24cf16fbd460bf3f50fe07ab13d532.png', '糖果/蜜饯', '糖果/蜜饯', '0', '6', '1', '1', '1576509666', '1');
INSERT INTO `tp_goods_category` VALUES ('6', '巧克力/果冻', 'public\\uploads\\goodscategory\\20191216\\c5c3ec5207a801d9daa3ecdcf389708c.png', '巧克力/果冻', '巧克力/果冻', '0', '7', '1', '1', '1576509725', '1');
INSERT INTO `tp_goods_category` VALUES ('7', '海鲜/河鲜', 'public\\uploads\\goodscategory\\20191216\\0e43a4750971cba1e48ada546eac140a.png', '海鲜/河鲜', '海鲜/河鲜', '0', '8', '1', '1', '1576509779', '1');
INSERT INTO `tp_goods_category` VALUES ('8', '花茶/果茶', 'public\\uploads\\goodscategory\\20191216\\d0809de73dd8c9b234b0d076abcd8557.png', '花茶/果茶', '花茶/果茶', '0', '9', '1', '1', '1576509801', '1');
INSERT INTO `tp_goods_category` VALUES ('9', '品牌/礼包', 'public\\uploads\\goodscategory\\20191216\\fab671c60d9fceff170c6c272b7cc151.png', '品牌/礼包', '品牌/礼包', '0', '10', '1', '1', '1576509824', '1');
INSERT INTO `tp_goods_category` VALUES ('10', '素食/卤味', 'public\\uploads\\goodscategory\\20191216\\ab80d242b0e98b5cc3f5fa4a4930e64a.png', '素食/卤味', '素食/卤味', '0', '4', '1', '1', '1576510136', '1');
INSERT INTO `tp_goods_category` VALUES ('11', '蛋糕', '', '蛋糕', '蛋糕', '1', '1', '1', '1', '1576510310', '1');
INSERT INTO `tp_goods_category` VALUES ('12', '点心', '', '点心', '点心', '1', '2', '1', '1', '1576510333', '1');
INSERT INTO `tp_goods_category` VALUES ('13', '蒸蛋糕', '', '蒸蛋糕', '蒸蛋糕', '11', '1', '1', '1', '1576510464', '1');
INSERT INTO `tp_goods_category` VALUES ('14', '脱水蛋糕', '', '脱水蛋糕', '脱水蛋糕', '11', '2', '1', '1', '1576510481', '1');
INSERT INTO `tp_goods_category` VALUES ('15', '瑞士卷', '', '瑞士卷', '瑞士卷', '12', '99', '1', '1', '1576510495', '1');
INSERT INTO `tp_goods_category` VALUES ('16', '软面包', '', '软面包', '软面包', '12', '99', '1', '1', '1576510507', '1');
INSERT INTO `tp_goods_category` VALUES ('17', '马卡龙', '', '马卡龙', '马卡龙', '11', '3', '1', '1', '1576510518', '1');
INSERT INTO `tp_goods_category` VALUES ('18', '千层饼', '', '千层饼', '千层饼', '12', '99', '1', '1', '1576510535', '1');
INSERT INTO `tp_goods_category` VALUES ('19', '甜甜圈', '', '甜甜圈', '甜甜圈', '12', '99', '1', '1', '1576510547', '1');
INSERT INTO `tp_goods_category` VALUES ('20', '蒸三明治', '', '蒸三明治', '蒸三明治', '12', '99', '1', '1', '1576510559', '1');
INSERT INTO `tp_goods_category` VALUES ('21', '铜锣烧', '', '铜锣烧', '铜锣烧', '12', '99', '1', '1', '1576510574', '1');
INSERT INTO `tp_goods_category` VALUES ('22', '饼干', '', '饼干', '饼干', '2', '99', '1', '1', '1576510784', '1');
INSERT INTO `tp_goods_category` VALUES ('23', '薯条', '', '薯条', '薯条', '2', '99', '1', '1', '1576510807', '1');
INSERT INTO `tp_goods_category` VALUES ('24', '虾条', '', '虾条', '虾条', '2', '99', '1', '1', '1576510848', '1');
INSERT INTO `tp_goods_category` VALUES ('25', '猪肉脯', '', '猪肉脯', '猪肉脯', '3', '99', '1', '1', '1576510919', '1');
INSERT INTO `tp_goods_category` VALUES ('26', '牛肉丝', '', '牛肉丝', '牛肉丝', '3', '99', '1', '1', '1576510956', '1');
INSERT INTO `tp_goods_category` VALUES ('27', '小香肠', '', '小香肠', '小香肠', '3', '99', '1', '1', '1576511005', '1');
INSERT INTO `tp_goods_category` VALUES ('28', '素食', '', '素食', '素食', '10', '99', '1', '1', '1576511119', '1');
INSERT INTO `tp_goods_category` VALUES ('29', '卤味', '', '卤味', '卤味', '10', '99', '1', '1', '1576511160', '1');
INSERT INTO `tp_goods_category` VALUES ('30', '豆干', '', '豆干', '豆干', '28', '99', '1', '1', '1576511223', '1');
INSERT INTO `tp_goods_category` VALUES ('31', '干笋', '', '干笋', '干笋', '28', '99', '1', '1', '1576511263', '1');
INSERT INTO `tp_goods_category` VALUES ('32', '鸭脖', '', '鸭脖', '鸭脖', '29', '99', '1', '1', '1576511332', '1');
INSERT INTO `tp_goods_category` VALUES ('33', '鸡爪', '', '鸡爪', '鸡爪', '29', '99', '1', '1', '1576511407', '1');
INSERT INTO `tp_goods_category` VALUES ('34', '鸡翅膀', '', '鸡翅膀', '鸡翅膀', '29', '99', '1', '1', '1576511436', '1');
INSERT INTO `tp_goods_category` VALUES ('35', '坚果', '', '坚果', '坚果', '4', '99', '1', '1', '1576511524', '1');
INSERT INTO `tp_goods_category` VALUES ('36', '炒货', '', '炒货', '炒货', '4', '99', '1', '1', '1576511546', '1');
INSERT INTO `tp_goods_category` VALUES ('37', '糖果', '', '糖果', '糖果', '5', '99', '1', '1', '1576511605', '1');
INSERT INTO `tp_goods_category` VALUES ('38', '蜜饯', '', '蜜饯', '蜜饯', '5', '99', '1', '1', '1576511624', '1');
INSERT INTO `tp_goods_category` VALUES ('39', '果冻', '', '果冻', '果冻', '6', '99', '1', '1', '1576511716', '1');
INSERT INTO `tp_goods_category` VALUES ('40', '巧克力', '', '巧克力', '巧克力', '6', '99', '1', '1', '1576511788', '1');
INSERT INTO `tp_goods_category` VALUES ('41', '海带丝', '', '海带丝', '海带丝', '7', '99', '1', '1', '1576511883', '1');
INSERT INTO `tp_goods_category` VALUES ('42', '小鱼干', '', '小鱼干', '小鱼干', '7', '99', '1', '1', '1576511954', '1');
INSERT INTO `tp_goods_category` VALUES ('43', '鱿鱼丝', '', '鱿鱼丝', '鱿鱼丝', '7', '99', '1', '1', '1576511989', '1');
INSERT INTO `tp_goods_category` VALUES ('44', '大包装', '', '大包装', '大包装', '9', '99', '1', '1', '1576512020', '1');
INSERT INTO `tp_goods_category` VALUES ('45', '两件套', '', '两件套', '两件套', '9', '99', '1', '1', '1576512037', '1');
INSERT INTO `tp_goods_category` VALUES ('46', '花茶', '', '花茶', '花茶', '8', '99', '1', '1', '1576512071', '1');
INSERT INTO `tp_goods_category` VALUES ('47', '果茶', '', '果茶', '果茶', '8', '99', '1', '1', '1576512088', '1');

-- ----------------------------
-- Table structure for tp_goods_photo
-- ----------------------------
DROP TABLE IF EXISTS `tp_goods_photo`;
CREATE TABLE `tp_goods_photo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) DEFAULT NULL COMMENT '商品ID',
  `or_thumb` varchar(255) DEFAULT NULL COMMENT '原图',
  `sm_thumb` varchar(255) DEFAULT NULL COMMENT '小图',
  `mid_thumb` varchar(255) DEFAULT NULL COMMENT '中图',
  `big_thumb` varchar(255) DEFAULT NULL COMMENT '大图',
  PRIMARY KEY (`id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='商品相册表';

-- ----------------------------
-- Records of tp_goods_photo
-- ----------------------------

-- ----------------------------
-- Table structure for tp_goods_stock
-- ----------------------------
DROP TABLE IF EXISTS `tp_goods_stock`;
CREATE TABLE `tp_goods_stock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stock_num` int(11) DEFAULT '0' COMMENT '库存数量',
  `attr_str` varchar(255) DEFAULT NULL COMMENT '属性组合字符串',
  `goods_id` int(11) DEFAULT '0' COMMENT '商品ID',
  PRIMARY KEY (`id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='商品库存表';

-- ----------------------------
-- Records of tp_goods_stock
-- ----------------------------

-- ----------------------------
-- Table structure for tp_goods_type
-- ----------------------------
DROP TABLE IF EXISTS `tp_goods_type`;
CREATE TABLE `tp_goods_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(50) DEFAULT NULL COMMENT '商品类型',
  `is_del` tinyint(1) DEFAULT '1' COMMENT '是否删除，默认1正常，0删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='商品类型表';

-- ----------------------------
-- Records of tp_goods_type
-- ----------------------------
INSERT INTO `tp_goods_type` VALUES ('1', '干果', '1');
INSERT INTO `tp_goods_type` VALUES ('2', '卤味', '1');
INSERT INTO `tp_goods_type` VALUES ('3', '茶', '1');
INSERT INTO `tp_goods_type` VALUES ('4', '饼干', '1');
INSERT INTO `tp_goods_type` VALUES ('5', '熟食', '1');

-- ----------------------------
-- Table structure for tp_link
-- ----------------------------
DROP TABLE IF EXISTS `tp_link`;
CREATE TABLE `tp_link` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `link_name` varchar(60) DEFAULT NULL COMMENT '友情链接名称',
  `link_url` varchar(255) DEFAULT NULL COMMENT '友链网址',
  `link_src` varchar(255) DEFAULT NULL COMMENT '友链logo图片',
  `description` tinytext COMMENT '品牌描述',
  `status` tinyint(1) DEFAULT '1' COMMENT '0：隐藏 1：显示',
  `sort` int(11) DEFAULT '50' COMMENT '排序',
  `is_del` tinyint(1) DEFAULT '1' COMMENT '是否删除 0：删除 1：显示',
  `create_time` bigint(20) DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='友情链接表';

-- ----------------------------
-- Records of tp_link
-- ----------------------------
INSERT INTO `tp_link` VALUES ('1', '粤凯信息科技有限公司', 'http://www.yuekai.com', 'public\\uploads\\link\\20191129\\5e3ed5d84b667726d6aea153eed57376.jpg', '世界第一，宇宙最强', '1', '50', '1', '1574784547');
INSERT INTO `tp_link` VALUES ('2', '粤凯信息科技有限公司', '', '', '', '0', '50', '1', '1575377021');

-- ----------------------------
-- Table structure for tp_member_level
-- ----------------------------
DROP TABLE IF EXISTS `tp_member_level`;
CREATE TABLE `tp_member_level` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `level_name` varchar(60) DEFAULT NULL COMMENT '级别名称',
  `base_point` int(11) DEFAULT '0' COMMENT '积分下限',
  `top_point` int(11) DEFAULT '0' COMMENT '积分上限',
  `rate` int(3) DEFAULT '100' COMMENT '折扣率%',
  `is_del` tinyint(1) DEFAULT '1' COMMENT '默认1正常，0已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='会员级别';

-- ----------------------------
-- Records of tp_member_level
-- ----------------------------
INSERT INTO `tp_member_level` VALUES ('1', '注册会员', '0', '10000', '90', '1');
INSERT INTO `tp_member_level` VALUES ('2', '初级会员', '10000', '20000', '80', '1');
INSERT INTO `tp_member_level` VALUES ('3', '中级会员', '20000', '50000', '70', '1');
INSERT INTO `tp_member_level` VALUES ('4', '高级会员', '50000', '100000', '60', '1');
INSERT INTO `tp_member_level` VALUES ('5', 'VIP会员', '100000', '1000000', '50', '1');

-- ----------------------------
-- Table structure for tp_member_price
-- ----------------------------
DROP TABLE IF EXISTS `tp_member_price`;
CREATE TABLE `tp_member_price` (
  `member_price` decimal(10,2) DEFAULT '0.00' COMMENT '会员价格',
  `member_level_id` int(11) DEFAULT '0' COMMENT '会员等级ID',
  `goods_id` int(11) DEFAULT '0' COMMENT '产品ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='会员价格表';

-- ----------------------------
-- Records of tp_member_price
-- ----------------------------

-- ----------------------------
-- Table structure for tp_nav
-- ----------------------------
DROP TABLE IF EXISTS `tp_nav`;
CREATE TABLE `tp_nav` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nav_name` varchar(255) DEFAULT NULL COMMENT '导航名称',
  `nav_url` varchar(255) DEFAULT NULL COMMENT '导航地址',
  `position` varchar(10) DEFAULT NULL COMMENT '导航位置,默认top顶部，min中部，bottom底部',
  `sort` int(4) DEFAULT '0' COMMENT '排序',
  `open` tinyint(1) DEFAULT '1' COMMENT '是否新窗口打开',
  `status` tinyint(1) DEFAULT '0' COMMENT '是否显示默认1显示，0不显示',
  `create_time` bigint(20) DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of tp_nav
-- ----------------------------
INSERT INTO `tp_nav` VALUES ('2', '闪购', 'http://www.rufeike.top', 'top', '2', '1', '1', '1576415936');
INSERT INTO `tp_nav` VALUES ('3', '首页', 'http://www.xdqshop.com/index.php/index/index/index.html', 'top', '1', '0', '1', '1576417558');
INSERT INTO `tp_nav` VALUES ('4', '限时抢', 'http://www.rufeike.top', 'top', '4', '1', '1', '1576417817');
INSERT INTO `tp_nav` VALUES ('5', '团购', 'http://www.rufeike.top', 'top', '3', '1', '1', '1576417837');
INSERT INTO `tp_nav` VALUES ('6', '大包装', 'http://www.rufeike.top', 'top', '5', '0', '1', '1576417870');

-- ----------------------------
-- Table structure for tp_recommend
-- ----------------------------
DROP TABLE IF EXISTS `tp_recommend`;
CREATE TABLE `tp_recommend` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rec_name` varchar(255) DEFAULT NULL COMMENT '推荐位名称',
  `rec_type` tinyint(1) DEFAULT '1' COMMENT '推荐类型：默认1商品推荐，2：栏目推荐',
  `status` tinyint(1) DEFAULT '1' COMMENT '是否显示，默认1显示，0不显示',
  PRIMARY KEY (`id`),
  UNIQUE KEY `rec_name` (`rec_name`),
  KEY `rec_type` (`rec_type`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COMMENT='推荐位表';

-- ----------------------------
-- Records of tp_recommend
-- ----------------------------
INSERT INTO `tp_recommend` VALUES ('2', '热卖商品', '1', '1');
INSERT INTO `tp_recommend` VALUES ('3', '限时抢购', '1', '1');
INSERT INTO `tp_recommend` VALUES ('4', '新品上市', '1', '1');
INSERT INTO `tp_recommend` VALUES ('5', '首页推荐', '2', '1');
INSERT INTO `tp_recommend` VALUES ('6', '精选栏目', '2', '1');

-- ----------------------------
-- Table structure for tp_recommend_detail
-- ----------------------------
DROP TABLE IF EXISTS `tp_recommend_detail`;
CREATE TABLE `tp_recommend_detail` (
  `rec_id` int(11) NOT NULL DEFAULT '0' COMMENT '推荐类型ID',
  `item_id` int(11) DEFAULT NULL COMMENT '推荐对象ID',
  `rec_type` tinyint(1) DEFAULT NULL COMMENT '推荐类型ID，1代表商品推荐，2代表栏目推荐',
  KEY `rec_id` (`rec_id`),
  KEY `rec_type` (`rec_type`),
  KEY `item_id` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='推荐表中间表';

-- ----------------------------
-- Records of tp_recommend_detail
-- ----------------------------
INSERT INTO `tp_recommend_detail` VALUES ('5', '1', '2');
INSERT INTO `tp_recommend_detail` VALUES ('5', '2', '2');
INSERT INTO `tp_recommend_detail` VALUES ('5', '3', '2');
INSERT INTO `tp_recommend_detail` VALUES ('5', '10', '2');
INSERT INTO `tp_recommend_detail` VALUES ('5', '4', '2');
INSERT INTO `tp_recommend_detail` VALUES ('5', '5', '2');
INSERT INTO `tp_recommend_detail` VALUES ('5', '7', '2');
INSERT INTO `tp_recommend_detail` VALUES ('5', '8', '2');
INSERT INTO `tp_recommend_detail` VALUES ('5', '9', '2');
INSERT INTO `tp_recommend_detail` VALUES ('5', '11', '2');
INSERT INTO `tp_recommend_detail` VALUES ('5', '12', '2');
INSERT INTO `tp_recommend_detail` VALUES ('5', '13', '2');
INSERT INTO `tp_recommend_detail` VALUES ('5', '14', '2');
INSERT INTO `tp_recommend_detail` VALUES ('5', '17', '2');
INSERT INTO `tp_recommend_detail` VALUES ('5', '16', '2');
INSERT INTO `tp_recommend_detail` VALUES ('5', '15', '2');
INSERT INTO `tp_recommend_detail` VALUES ('5', '6', '2');
