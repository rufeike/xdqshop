/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50727
Source Host           : localhost:3306
Source Database       : xdqshop

Target Server Type    : MYSQL
Target Server Version : 50727
File Encoding         : 65001

Date: 2019-12-09 00:05:28
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COMMENT='文章表';

-- ----------------------------
-- Records of tp_article
-- ----------------------------
INSERT INTO `tp_article` VALUES ('4', '1', '年庆优惠', '', null, '', null, '2', '99', '0', '0', null, '0', '1', null);
INSERT INTO `tp_article` VALUES ('5', '1', '新手指南', '', null, '', null, '12', '99', '0', '0', null, '0', '1', null);
INSERT INTO `tp_article` VALUES ('7', '1', '支付说明', '', 'public\\uploads\\article\\20191128\\99618728dceb597963438d60475dd460.jpg', '', '<p><img src=\"/public/ueditor/image/20191126/1574773033157353.png\" title=\"1574773033157353.png\" alt=\"tag-1.png\"/></p>', '2', '99', '0', '0', null, '1574956018', '1', '');
INSERT INTO `tp_article` VALUES ('8', '1', '免责声明', '', null, '', null, '7', '99', '0', '0', null, '0', '1', null);
INSERT INTO `tp_article` VALUES ('9', '1', '支付宝支付', '', '', '', '<p><img src=\"/public/ueditor/image/20191126/1574771681757601.jpg\" title=\"1574771681757601.jpg\" alt=\"login_bg.jpg\"/></p>', '7', '99', '1', '0', null, '1574771684', '1', '');
INSERT INTO `tp_article` VALUES ('10', '1', '微信支付', '', 'public\\uploads\\article\\20191128\\3cb7d3f0b78a51b03ebd74c1c7e9ebdc.jpg', '', '<p>45454</p>', '7', '99', '0', '1', null, '1574956008', '1', '');
INSERT INTO `tp_article` VALUES ('15', '老公', '我老婆使用信用卡心得', '我老婆', 'public\\uploads\\article\\20191128\\d2f6a141fe686106f8f205de9350dd9d.jpg', '我老婆超额贷款', '<p>放得开发快递发的开发贷款发的咖啡店父类大风大浪发卡方发卡夫卡六块腹肌卡了法力浮龙的奥卡菲娜付款啦法拉开发暖风机afafklafa凯迪拉克你客<br/></p><p>亏大发了发卡量发了疯奥拉夫啦lfakfalfdkfka</p><p><br/></p><p><br/></p><p>辅导费健康路否那falf</p><p><br/></p><p>代付款发快递看就看见风使舵金粉世家方法sjwmf.v四季分明快捷方式咖啡机积分开始大家风范节目否爱睡觉按啥的看法夹噶嘎婆上课慢jaguargfagh&#39;gkf赶紧来看古灵精怪</p><p>LGJLSGN&#39;SLGHALS</p><p><img src=\"/public/ueditor/image/20191126/1574782927279414.jpg\" title=\"1574782927279414.jpg\" alt=\"001.JPG\"/></p><p>&nbsp;ASIDGLKDGNLL海格力斯看过了更好地客户嘎嘎红薯干活uwdtierhj8vbjwk4ntofnb</p>', '7', '99', '0', '1', '1574782955', '1574955997', '0', 'http://www.rufeike.top');

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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COMMENT='文章分类表';

-- ----------------------------
-- Records of tp_article_category
-- ----------------------------
INSERT INTO `tp_article_category` VALUES ('1', '系统分类', null, '', '', '0', '104', '1', '1', '1574604114', '1', '0');
INSERT INTO `tp_article_category` VALUES ('2', '网店帮助', null, '', 'dfafafd', '1', '98', '1', '1', '1574607894', '2', '0');
INSERT INTO `tp_article_category` VALUES ('3', '网店信息', null, '', '', '1', '99', '0', '1', null, '3', '0');
INSERT INTO `tp_article_category` VALUES ('4', '年庆优惠', null, '', '', '2', '99', '0', '1', null, '0', '1');
INSERT INTO `tp_article_category` VALUES ('5', '新手指南', null, '', '', '12', '99', '0', '1', null, '0', '1');
INSERT INTO `tp_article_category` VALUES ('6', '其他分类', null, '', 'fdfd', '0', '95', '0', '1', null, '0', '1');
INSERT INTO `tp_article_category` VALUES ('7', '支付说明', null, '', '', '4', '99', '0', '1', null, '0', '1');
INSERT INTO `tp_article_category` VALUES ('8', '免责声明', null, '', '', '7', '99', '0', '1', null, '0', '1');
INSERT INTO `tp_article_category` VALUES ('9', '支付宝支付', null, '', '', '7', '99', '0', '1', null, '0', '1');
INSERT INTO `tp_article_category` VALUES ('10', '微信支付', null, null, null, '7', '99', '0', '1', null, '0', '1');
INSERT INTO `tp_article_category` VALUES ('11', '闪电付', null, '', '', '7', '99', '0', '1', null, '0', '1');
INSERT INTO `tp_article_category` VALUES ('12', '购物流程', null, null, null, '5', '99', '0', '1', null, '0', '1');
INSERT INTO `tp_article_category` VALUES ('13', 'fdfdfd', null, '', 'dfdfd', '4', '99', '0', '0', '1574661095', '0', '1');

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
INSERT INTO `tp_config` VALUES ('1', 'website', '站点', 'input', 'gfgfg', '', '1', '53', '0', null, '1');
INSERT INTO `tp_config` VALUES ('2', 'description', '企业介绍', 'textarea', '', '', '1', '48', '0', '1574863805', '1');
INSERT INTO `tp_config` VALUES ('3', 'isVcode', '是否开启验证码', 'radio', '关闭', '开启,关闭', '1', '50', '0', '1574868889', '1');
INSERT INTO `tp_config` VALUES ('4', 'checkboxTest', '测试多选', 'checkbox', '多选1,多选4', '多选1,多选2,多选3,多选4', '1', '50', '0', '1574869007', '1');
INSERT INTO `tp_config` VALUES ('5', 'selectTest', '测试下拉框', 'select', '下拉3', '下拉1,下拉2,下拉3,下拉4', '1', '50', '0', '1574869080', '1');
INSERT INTO `tp_config` VALUES ('6', 'qrcode', '二维码', 'file', 'public\\uploads\\config\\20191128\\bf85223890ad189165bd64b79ae51edf.png', '', '1', '50', '0', '1574869132', '1');
INSERT INTO `tp_config` VALUES ('7', 'wxcode', '微信二维码', 'file', 'public\\uploads\\config\\20191128\\ea89a06c799f961bbcac6e6797881fb5.jpg', '', '1', '50', '0', '1574869166', '1');
INSERT INTO `tp_config` VALUES ('8', 'seotitle', 'SEO标题', 'input', '', '', '1', '50', '0', '1574915902', '1');
INSERT INTO `tp_config` VALUES ('9', 'seokeywords', 'SEO关键字', 'input', '', '', '1', '50', '0', '1574915934', '1');
INSERT INTO `tp_config` VALUES ('10', 'seodescription', 'SEO描述', 'textarea', '', '', '1', '50', '0', '1574915982', '1');
INSERT INTO `tp_config` VALUES ('11', 'checkboxTest2', '多选框测试2', 'checkbox', '复选框2,复选框3', '复选框1,复选框2,复选框3,复选框4', '1', '50', '0', '1574918025', '1');
INSERT INTO `tp_config` VALUES ('12', 'shoppingTest', '商品配置测试', 'input', '大幅度发', '', '1', '50', '1', '1574955177', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COMMENT='商品表';

-- ----------------------------
-- Records of tp_goods
-- ----------------------------
INSERT INTO `tp_goods` VALUES ('1', '15', '15_11_10_', null, '联想Level5600', 'public\\uploads\\goods\\20191208\\efa080b014d91686e3593cff07b3c97f.jpg', 'public\\uploads\\goods\\20191208\\sm_efa080b014d91686e3593cff07b3c97f.jpg', 'public\\uploads\\goods\\20191208\\mid_efa080b014d91686e3593cff07b3c97f.jpg', 'public\\uploads\\goods\\20191208\\big_efa080b014d91686e3593cff07b3c97f.jpg', '3', '&lt;p&gt;&lt;img src=&quot;/public/ueditor/image/20191208/1575777235852408.jpg&quot; title=&quot;1575777235852408.jpg&quot; alt=&quot;timg (2).jpg&quot;/&gt;&lt;/p&gt;', '12', 'kg', '1', '7800.00', '7500.00', '0', '51', '1575777380', '0', '1');
INSERT INTO `tp_goods` VALUES ('2', '9', '9_', null, 'dsdsds', null, null, null, null, '1', '', '434334', 'kg', '0', '34.00', '343.00', '0', '50', '1575813595', '0', '1');
INSERT INTO `tp_goods` VALUES ('3', '9', '9_', null, '232', null, null, null, null, '1', '', '3232', 'kg', '0', '2.00', '232.00', '0', '50', '1575813920', '0', '1');
INSERT INTO `tp_goods` VALUES ('4', '9', '9_', null, '232232', null, null, null, null, '1', '', '232', 'kg', '0', '2332.00', '23232.00', '0', '50', '1575813973', '0', '1');
INSERT INTO `tp_goods` VALUES ('5', '18', '18_9_', null, '23323323223', null, null, null, null, '1', '', '2332332', 'kg', '0', '232.00', '232.00', '0', '50', '1575814002', '0', '1');
INSERT INTO `tp_goods` VALUES ('6', '17', '17_9_', null, '1111111111111', null, null, null, null, '2', '', '223', 'kg', '0', '11111.00', '111.00', '0', '50', '1575814133', '0', '1');
INSERT INTO `tp_goods` VALUES ('7', '28', '28_27_19_9_', null, '2222222222222', null, null, null, null, '2', '', '232', 'kg', '0', '32.00', '23.00', '0', '50', '1575814287', '0', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COMMENT='商品属性表';

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COMMENT='商品属性详细表';

-- ----------------------------
-- Records of tp_goods_attribute_detail
-- ----------------------------
INSERT INTO `tp_goods_attribute_detail` VALUES ('1', '1', '7', '独立显卡', '100.00');
INSERT INTO `tp_goods_attribute_detail` VALUES ('2', '1', '7', '集成显卡', '0.00');
INSERT INTO `tp_goods_attribute_detail` VALUES ('3', '1', '5', '4G', '100.00');
INSERT INTO `tp_goods_attribute_detail` VALUES ('4', '1', '5', '8G', '150.00');
INSERT INTO `tp_goods_attribute_detail` VALUES ('5', '1', '5', '16G', '200.00');
INSERT INTO `tp_goods_attribute_detail` VALUES ('6', '1', '6', 'Internet', '100.00');
INSERT INTO `tp_goods_attribute_detail` VALUES ('7', '1', '6', '奔腾', '50.00');
INSERT INTO `tp_goods_attribute_detail` VALUES ('8', '1', '8', '2019-10-10', '0.00');
INSERT INTO `tp_goods_attribute_detail` VALUES ('9', '1', '9', '深圳富士康', '0.00');

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='商品相册表';

-- ----------------------------
-- Records of tp_goods_photo
-- ----------------------------
INSERT INTO `tp_goods_photo` VALUES ('1', '1', 'public\\uploads\\goods\\20191208\\368f6fd1d7c868b23a14d85bec1a61e8.jpg', 'public\\uploads\\goods\\20191208\\sm_368f6fd1d7c868b23a14d85bec1a61e8.jpg', 'public\\uploads\\goods\\20191208\\mid_368f6fd1d7c868b23a14d85bec1a61e8.jpg', 'public\\uploads\\goods\\20191208\\big_368f6fd1d7c868b23a14d85bec1a61e8.jpg');

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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COMMENT='商品库存表';

-- ----------------------------
-- Records of tp_goods_stock
-- ----------------------------
INSERT INTO `tp_goods_stock` VALUES ('5', '10', null, '7');
INSERT INTO `tp_goods_stock` VALUES ('14', '10', '3,6,2', '1');

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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_price` decimal(10,2) DEFAULT '0.00' COMMENT '会员价格',
  `member_level_id` int(11) DEFAULT '0' COMMENT '会员等级ID',
  `goods_id` int(11) DEFAULT '0' COMMENT '产品ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='会员价格表';

-- ----------------------------
-- Records of tp_member_price
-- ----------------------------
INSERT INTO `tp_member_price` VALUES ('1', '7500.00', '1', '1');
INSERT INTO `tp_member_price` VALUES ('2', '7400.00', '2', '1');
INSERT INTO `tp_member_price` VALUES ('3', '7300.00', '3', '1');
