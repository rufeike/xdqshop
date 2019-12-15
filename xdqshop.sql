/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50727
Source Host           : localhost:3306
Source Database       : xdqshop

Target Server Type    : MYSQL
Target Server Version : 50727
File Encoding         : 65001

Date: 2019-12-15 22:52:36
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='商品品牌';

-- ----------------------------
-- Records of tp_brand
-- ----------------------------
INSERT INTO `tp_brand` VALUES ('1', '格力电器', '', '', '', '0', '50', '1', '1575376969');
INSERT INTO `tp_brand` VALUES ('2', '海尔冰箱', '', '', '', '0', '50', '1', '1575377049');
INSERT INTO `tp_brand` VALUES ('3', '联想电脑', '', '', '', '0', '50', '1', '1575523686');
INSERT INTO `tp_brand` VALUES ('4', '戴尔电脑', '', '', '', '0', '50', '1', '1575523704');

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
INSERT INTO `tp_config` VALUES ('4', 'checkboxTest', '测试多选', 'checkbox', '多选1,多选4', '多选1,多选2,多选3,多选4', '1', '50', '0', '1574869007', '1');
INSERT INTO `tp_config` VALUES ('5', 'selectTest', '测试下拉框', 'select', '下拉3', '下拉1,下拉2,下拉3,下拉4', '1', '50', '0', '1574869080', '1');
INSERT INTO `tp_config` VALUES ('6', 'waplogo', '手机端logo', 'file', 'public\\uploads\\config\\20191215\\37d4488e849ffb55b178d02cbcdb6e3b.png', '', '1', '50', '0', '1574869132', '1');
INSERT INTO `tp_config` VALUES ('7', 'weblogo', '电脑端logo', 'file', 'public\\uploads\\config\\20191215\\ebcbab72ecf8dc7a58eaa545c14da040.png', '', '1', '50', '0', '1574869166', '1');
INSERT INTO `tp_config` VALUES ('8', 'seotitle', 'SEO标题', 'input', '繁有多超市', '', '1', '50', '0', '1574915902', '1');
INSERT INTO `tp_config` VALUES ('9', 'seokeywords', 'SEO关键字', 'input', '益智玩具，数码产品', '', '1', '50', '0', '1574915934', '1');
INSERT INTO `tp_config` VALUES ('10', 'seodescription', 'SEO描述', 'textarea', '益智玩具，数码产品，益智玩具，数码产品，益智玩具，数码产品', '', '1', '50', '0', '1574915982', '1');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='商品表';

-- ----------------------------
-- Records of tp_goods
-- ----------------------------
INSERT INTO `tp_goods` VALUES ('1', '15', '15_11_10_', '157595757353172', '联想Level5600', 'public\\uploads\\goods\\20191210\\c0527d99d74357922ae5fcfb42db1620.jpg', 'public\\uploads\\goods\\20191210\\sm_c0527d99d74357922ae5fcfb42db1620.jpg', 'public\\uploads\\goods\\20191210\\mid_c0527d99d74357922ae5fcfb42db1620.jpg', 'public\\uploads\\goods\\20191210\\big_c0527d99d74357922ae5fcfb42db1620.jpg', '3', '&lt;p&gt;&lt;img src=&quot;/public/ueditor/image/20191210/1575957408880600.jpg&quot; title=&quot;1575957408880600.jpg&quot; alt=&quot;timg (2).jpg&quot;/&gt;&lt;/p&gt;', '10', 'kg', '1', '7000.00', '6500.00', '0', '50', '1575957572', '1575957666', '1');
INSERT INTO `tp_goods` VALUES ('2', '21', '21_9_', '157595774095775', '立式空调', 'public\\uploads\\goods\\20191210\\b69bc0cc762119955e74f108b4cc64b7.jpg', 'public\\uploads\\goods\\20191210\\sm_b69bc0cc762119955e74f108b4cc64b7.jpg', 'public\\uploads\\goods\\20191210\\mid_b69bc0cc762119955e74f108b4cc64b7.jpg', 'public\\uploads\\goods\\20191210\\big_b69bc0cc762119955e74f108b4cc64b7.jpg', '1', '', '70', 'kg', '0', '10000.00', '9000.00', '0', '50', '1575957740', '0', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COMMENT='商品属性表';

-- ----------------------------
-- Records of tp_goods_attribute
-- ----------------------------
INSERT INTO `tp_goods_attribute` VALUES ('1', '内存', '1', '4G,8G,16G', '2', '-2', '0', '1');
INSERT INTO `tp_goods_attribute` VALUES ('2', '机身内存', '1', '32G,64G,128G,256G', '2', '2', '0', '1');
INSERT INTO `tp_goods_attribute` VALUES ('3', '颜色', '1', '土豪金,粉红色,黑色', '2', '0', '0', '1');
INSERT INTO `tp_goods_attribute` VALUES ('4', '尺寸', '0', '', '2', '9', '0', '1');
INSERT INTO `tp_goods_attribute` VALUES ('5', '运行内存', '1', '4G,8G,16G,32G', '1', '1', '0', '1');
INSERT INTO `tp_goods_attribute` VALUES ('6', 'CPU', '1', 'Internet,奔腾', '1', '9', '0', '1');
INSERT INTO `tp_goods_attribute` VALUES ('7', '显卡', '1', '', '1', '0', '0', '1');
INSERT INTO `tp_goods_attribute` VALUES ('8', '生产日期', '0', '', '1', '0', '0', '1');
INSERT INTO `tp_goods_attribute` VALUES ('9', '厂家', '0', '', '1', '0', '0', '1');
INSERT INTO `tp_goods_attribute` VALUES ('10', '颜色', '1', '黑色,红色,白色,黄色', '1', '0', '0', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COMMENT='商品属性详细表';

-- ----------------------------
-- Records of tp_goods_attribute_detail
-- ----------------------------
INSERT INTO `tp_goods_attribute_detail` VALUES ('1', '1', '7', '集成显卡', '0.00');
INSERT INTO `tp_goods_attribute_detail` VALUES ('2', '1', '7', '独立显卡', '100.00');
INSERT INTO `tp_goods_attribute_detail` VALUES ('3', '1', '10', '黑色', '0.00');
INSERT INTO `tp_goods_attribute_detail` VALUES ('4', '1', '10', '红色', '20.00');
INSERT INTO `tp_goods_attribute_detail` VALUES ('5', '1', '10', '白色', '25.00');
INSERT INTO `tp_goods_attribute_detail` VALUES ('6', '1', '10', '黄色', '5.00');
INSERT INTO `tp_goods_attribute_detail` VALUES ('7', '1', '5', '4G', '0.00');
INSERT INTO `tp_goods_attribute_detail` VALUES ('8', '1', '5', '8G', '100.00');
INSERT INTO `tp_goods_attribute_detail` VALUES ('9', '1', '5', '16G', '200.00');
INSERT INTO `tp_goods_attribute_detail` VALUES ('10', '1', '5', '32G', '300.00');
INSERT INTO `tp_goods_attribute_detail` VALUES ('11', '1', '6', 'Internet', '100.00');
INSERT INTO `tp_goods_attribute_detail` VALUES ('12', '1', '6', '奔腾', '50.00');
INSERT INTO `tp_goods_attribute_detail` VALUES ('13', '1', '8', '2019-12-10', '0.00');
INSERT INTO `tp_goods_attribute_detail` VALUES ('14', '1', '9', '深圳富士康', '0.00');

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
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COMMENT='商品分类表';

-- ----------------------------
-- Records of tp_goods_category
-- ----------------------------
INSERT INTO `tp_goods_category` VALUES ('1', '服装', 'public\\uploads\\goodscategory\\20191129\\2ecf87c0cdf0b8cd1ba7c369ffbf19f4.jpg', '服装', '服装', '0', '100', '1', '1', '1575004934', '1');
INSERT INTO `tp_goods_category` VALUES ('2', '男装', '', '男装', '男装', '1', '101', '1', '1', '1575005613', '1');
INSERT INTO `tp_goods_category` VALUES ('3', '女装', '', '女装', '', '1', '100', '0', '1', '1575005672', '1');
INSERT INTO `tp_goods_category` VALUES ('4', '童装', '', '童装', '', '1', '99', '0', '1', '1575005690', '1');
INSERT INTO `tp_goods_category` VALUES ('5', '冬装', '', '', '', '2', '99', '0', '1', '1575005759', '1');
INSERT INTO `tp_goods_category` VALUES ('6', '羽绒服', '', '', '', '5', '99', '0', '1', '1575350033', '1');
INSERT INTO `tp_goods_category` VALUES ('7', '毛衣', '', '', '', '5', '99', '0', '1', '1575350046', '1');
INSERT INTO `tp_goods_category` VALUES ('8', '风衣', '', '', '', '5', '99', '0', '1', '1575350065', '1');
INSERT INTO `tp_goods_category` VALUES ('9', '家电', '', '', '', '0', '99', '0', '1', '1575350254', '1');
INSERT INTO `tp_goods_category` VALUES ('10', '数码产品', '', '', '', '0', '99', '0', '1', '1575350268', '1');
INSERT INTO `tp_goods_category` VALUES ('11', '电脑', '', '', '', '10', '99', '0', '1', '1575350287', '1');
INSERT INTO `tp_goods_category` VALUES ('12', '手机', '', '', '', '10', '99', '0', '1', '1575350303', '1');
INSERT INTO `tp_goods_category` VALUES ('13', '照相机', '', '', '', '10', '99', '0', '1', '1575350330', '1');
INSERT INTO `tp_goods_category` VALUES ('14', '摄影机', '', '', '', '10', '99', '0', '1', '1575350341', '1');
INSERT INTO `tp_goods_category` VALUES ('15', '笔记本', '', '', '', '11', '99', '0', '1', '1575350368', '1');
INSERT INTO `tp_goods_category` VALUES ('16', '台式电脑', '', '', '', '11', '99', '0', '1', '1575350383', '1');
INSERT INTO `tp_goods_category` VALUES ('17', '电视机', '', '', '', '9', '99', '0', '1', '1575350707', '1');
INSERT INTO `tp_goods_category` VALUES ('18', '冰箱', '', '', '', '9', '99', '0', '1', '1575350722', '1');
INSERT INTO `tp_goods_category` VALUES ('19', '洗衣机', '', '', '', '9', '99', '0', '1', '1575350735', '1');
INSERT INTO `tp_goods_category` VALUES ('20', '厨房电器', '', '', '', '9', '99', '0', '1', '1575350783', '1');
INSERT INTO `tp_goods_category` VALUES ('21', '空调', '', '', '', '9', '99', '0', '1', '1575350815', '1');
INSERT INTO `tp_goods_category` VALUES ('22', '电饭煲', '', '', '', '20', '99', '0', '1', '1575350861', '1');
INSERT INTO `tp_goods_category` VALUES ('23', '电磁炉', '', '', '', '20', '99', '0', '1', '1575350890', '1');
INSERT INTO `tp_goods_category` VALUES ('24', '电水壶', '', '', '', '20', '99', '0', '1', '1575350911', '1');
INSERT INTO `tp_goods_category` VALUES ('25', '电压力锅', '', '', '', '20', '99', '0', '1', '1575350928', '1');
INSERT INTO `tp_goods_category` VALUES ('26', '滚筒式', '', '', '', '19', '99', '0', '1', '1575350980', '1');
INSERT INTO `tp_goods_category` VALUES ('27', '直筒式', '', '', '', '19', '99', '0', '1', '1575351013', '1');
INSERT INTO `tp_goods_category` VALUES ('28', '全自动', '', '', '', '27', '99', '0', '1', '1575351037', '1');
INSERT INTO `tp_goods_category` VALUES ('29', '半自动', '', '', '', '27', '99', '0', '1', '1575351050', '1');
INSERT INTO `tp_goods_category` VALUES ('30', '鞋', '', '', '', '0', '99', '0', '1', '1575352288', '1');
INSERT INTO `tp_goods_category` VALUES ('31', '男鞋', '', '', '', '30', '99', '0', '1', '1575352329', '1');
INSERT INTO `tp_goods_category` VALUES ('32', '女鞋', '', '', '', '30', '99', '0', '1', '1575352344', '1');
INSERT INTO `tp_goods_category` VALUES ('33', '高跟鞋', '', '', '', '32', '99', '0', '1', '1575352360', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COMMENT='商品相册表';

-- ----------------------------
-- Records of tp_goods_photo
-- ----------------------------
INSERT INTO `tp_goods_photo` VALUES ('1', '1', 'public\\uploads\\goods\\20191208\\368f6fd1d7c868b23a14d85bec1a61e8.jpg', 'public\\uploads\\goods\\20191208\\sm_368f6fd1d7c868b23a14d85bec1a61e8.jpg', 'public\\uploads\\goods\\20191208\\mid_368f6fd1d7c868b23a14d85bec1a61e8.jpg', 'public\\uploads\\goods\\20191208\\big_368f6fd1d7c868b23a14d85bec1a61e8.jpg');
INSERT INTO `tp_goods_photo` VALUES ('2', '8', 'public\\uploads\\goods\\20191209\\d7c650f7c5424636fd16033f2a6bc1db.png', 'public\\uploads\\goods\\20191209\\sm_d7c650f7c5424636fd16033f2a6bc1db.png', 'public\\uploads\\goods\\20191209\\mid_d7c650f7c5424636fd16033f2a6bc1db.png', 'public\\uploads\\goods\\20191209\\big_d7c650f7c5424636fd16033f2a6bc1db.png');
INSERT INTO `tp_goods_photo` VALUES ('3', '10', 'public\\uploads\\goods\\20191210\\5ef1c4f55c5e71295723b0bf6b764eac.png', 'public\\uploads\\goods\\20191210\\sm_5ef1c4f55c5e71295723b0bf6b764eac.png', 'public\\uploads\\goods\\20191210\\mid_5ef1c4f55c5e71295723b0bf6b764eac.png', 'public\\uploads\\goods\\20191210\\big_5ef1c4f55c5e71295723b0bf6b764eac.png');
INSERT INTO `tp_goods_photo` VALUES ('4', '11', 'public\\uploads\\goods\\20191210\\d466ebb4993bbf978b37ddf2f67b44fa.jpg', 'public\\uploads\\goods\\20191210\\sm_d466ebb4993bbf978b37ddf2f67b44fa.jpg', 'public\\uploads\\goods\\20191210\\mid_d466ebb4993bbf978b37ddf2f67b44fa.jpg', 'public\\uploads\\goods\\20191210\\big_d466ebb4993bbf978b37ddf2f67b44fa.jpg');
INSERT INTO `tp_goods_photo` VALUES ('5', '11', 'public\\uploads\\goods\\20191210\\5981aa527a1d9d5096fe0c7ecd160087.jpg', 'public\\uploads\\goods\\20191210\\sm_5981aa527a1d9d5096fe0c7ecd160087.jpg', 'public\\uploads\\goods\\20191210\\mid_5981aa527a1d9d5096fe0c7ecd160087.jpg', 'public\\uploads\\goods\\20191210\\big_5981aa527a1d9d5096fe0c7ecd160087.jpg');
INSERT INTO `tp_goods_photo` VALUES ('6', '1', 'public\\uploads\\goods\\20191210\\773f41f4b536438058686e3821f6a1a7.jpg', 'public\\uploads\\goods\\20191210\\sm_773f41f4b536438058686e3821f6a1a7.jpg', 'public\\uploads\\goods\\20191210\\mid_773f41f4b536438058686e3821f6a1a7.jpg', 'public\\uploads\\goods\\20191210\\big_773f41f4b536438058686e3821f6a1a7.jpg');
INSERT INTO `tp_goods_photo` VALUES ('7', '1', 'public\\uploads\\goods\\20191210\\2f1bad06e77611e6712f01aea67c6a68.jpg', 'public\\uploads\\goods\\20191210\\sm_2f1bad06e77611e6712f01aea67c6a68.jpg', 'public\\uploads\\goods\\20191210\\mid_2f1bad06e77611e6712f01aea67c6a68.jpg', 'public\\uploads\\goods\\20191210\\big_2f1bad06e77611e6712f01aea67c6a68.jpg');
INSERT INTO `tp_goods_photo` VALUES ('8', '2', 'public\\uploads\\goods\\20191210\\e9705adf844be45e42112b9129b973d8.png', 'public\\uploads\\goods\\20191210\\sm_e9705adf844be45e42112b9129b973d8.png', 'public\\uploads\\goods\\20191210\\mid_e9705adf844be45e42112b9129b973d8.png', 'public\\uploads\\goods\\20191210\\big_e9705adf844be45e42112b9129b973d8.png');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='商品类型表';

-- ----------------------------
-- Records of tp_goods_type
-- ----------------------------
INSERT INTO `tp_goods_type` VALUES ('1', '笔记本', '1');
INSERT INTO `tp_goods_type` VALUES ('2', '手机', '1');

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
INSERT INTO `tp_member_price` VALUES ('6500.00', '1', '1');
INSERT INTO `tp_member_price` VALUES ('6400.00', '2', '1');
INSERT INTO `tp_member_price` VALUES ('6300.00', '3', '1');
INSERT INTO `tp_member_price` VALUES ('6200.00', '4', '1');
INSERT INTO `tp_member_price` VALUES ('6000.00', '5', '1');

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
