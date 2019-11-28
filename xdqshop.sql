/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50727
Source Host           : localhost:3306
Source Database       : xdqshop

Target Server Type    : MYSQL
Target Server Version : 50727
File Encoding         : 65001

Date: 2019-11-29 00:33:55
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
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of tp_article
-- ----------------------------
INSERT INTO `tp_article` VALUES ('4', '1', '年庆优惠', '', null, '', null, '2', '99', '0', '0', null, '0', '1', null);
INSERT INTO `tp_article` VALUES ('5', '1', '新手指南', '', null, '', null, '12', '99', '0', '0', null, '0', '1', null);
INSERT INTO `tp_article` VALUES ('7', '1', '支付说明', '', 'public\\uploads\\article\\20191128\\99618728dceb597963438d60475dd460.jpg', '', '<p><img src=\"/public/ueditor/image/20191126/1574773033157353.png\" title=\"1574773033157353.png\" alt=\"tag-1.png\"/></p>', '2', '99', '0', '0', null, '1574956018', '1', '');
INSERT INTO `tp_article` VALUES ('8', '1', '免责声明', '', null, '', null, '7', '99', '0', '0', null, '0', '1', null);
INSERT INTO `tp_article` VALUES ('9', '1', '支付宝支付', '', '', '', '<p><img src=\"/public/ueditor/image/20191126/1574771681757601.jpg\" title=\"1574771681757601.jpg\" alt=\"login_bg.jpg\"/></p>', '7', '99', '1', '0', null, '1574771684', '1', '');
INSERT INTO `tp_article` VALUES ('10', '1', '微信支付', '', 'public\\uploads\\article\\20191128\\3cb7d3f0b78a51b03ebd74c1c7e9ebdc.jpg', '', '<p>45454</p>', '7', '99', '0', '1', null, '1574956008', '1', '');
INSERT INTO `tp_article` VALUES ('15', '老公', '我老婆使用信用卡心得', '我老婆', 'public\\uploads\\article\\20191128\\d2f6a141fe686106f8f205de9350dd9d.jpg', '我老婆超额贷款', '<p>放得开发快递发的开发贷款发的咖啡店父类大风大浪发卡方发卡夫卡六块腹肌卡了法力浮龙的奥卡菲娜付款啦法拉开发暖风机afafklafa凯迪拉克你客<br/></p><p>亏大发了发卡量发了疯奥拉夫啦lfakfalfdkfka</p><p><br/></p><p><br/></p><p>辅导费健康路否那falf</p><p><br/></p><p>代付款发快递看就看见风使舵金粉世家方法sjwmf.v四季分明快捷方式咖啡机积分开始大家风范节目否爱睡觉按啥的看法夹噶嘎婆上课慢jaguargfagh&#39;gkf赶紧来看古灵精怪</p><p>LGJLSGN&#39;SLGHALS</p><p><img src=\"/public/ueditor/image/20191126/1574782927279414.jpg\" title=\"1574782927279414.jpg\" alt=\"001.JPG\"/></p><p>&nbsp;ASIDGLKDGNLL海格力斯看过了更好地客户嘎嘎红薯干活uwdtierhj8vbjwk4ntofnb</p>', '7', '99', '0', '1', '1574782955', '1574955997', '1', 'http://www.rufeike.top');

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
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of tp_article_category
-- ----------------------------
INSERT INTO `tp_article_category` VALUES ('1', '系统分类', null, '', '', '0', '104', '1', '1', '1574604114', '1', '0');
INSERT INTO `tp_article_category` VALUES ('2', '网店帮助', null, '', 'dfafafd', '1', '98', '1', '1', '1574607894', '2', '0');
INSERT INTO `tp_article_category` VALUES ('3', '网店信息', null, '', '', '1', '99', '0', '1', null, '3', '0');
INSERT INTO `tp_article_category` VALUES ('4', '年庆优惠', null, '', '', '2', '99', '0', '1', null, '0', '1');
INSERT INTO `tp_article_category` VALUES ('5', '新手指南', null, '', '', '12', '99', '0', '1', null, '0', '1');
INSERT INTO `tp_article_category` VALUES ('6', '其他分类', null, '', 'fdfd', '0', '95', '0', '1', null, '0', '1');
INSERT INTO `tp_article_category` VALUES ('7', '支付说明', null, '', '', '2', '99', '0', '1', null, '0', '1');
INSERT INTO `tp_article_category` VALUES ('8', '免责声明', null, '', '', '7', '99', '0', '1', null, '0', '1');
INSERT INTO `tp_article_category` VALUES ('9', '支付宝支付', null, null, null, '7', '99', '0', '1', null, '0', '1');
INSERT INTO `tp_article_category` VALUES ('10', '微信支付', null, null, null, '7', '99', '0', '1', null, '0', '1');
INSERT INTO `tp_article_category` VALUES ('11', '闪电付', null, null, null, '7', '99', '0', '1', null, '0', '1');
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of tp_brand
-- ----------------------------
INSERT INTO `tp_brand` VALUES ('1', '大幅度发放', 'httP://电放费大幅度', 'public\\uploads\\brand\\20191128\\848e90fef35923b8ff379fd5e167372f.png', '奋斗的方法', '1', '50', '1', null);
INSERT INTO `tp_brand` VALUES ('2', '大幅度发放', 'ddfdfd', '', '对方付电费', '1', '50', '1', null);
INSERT INTO `tp_brand` VALUES ('3', '放的地方', 'http://ddfdfd', '', '辅导辅导费', '1', '50', '1', null);
INSERT INTO `tp_brand` VALUES ('4', '大幅度发放', '', 'public\\uploads\\brand\\20191128\\e96e43b2b70fd2780f4475eacaa39b1c.jpg', '辅导费', '1', '50', '1', null);
INSERT INTO `tp_brand` VALUES ('5', '大幅度发放', '', '', '', '1', '50', '0', null);
INSERT INTO `tp_brand` VALUES ('6', '大幅度发放', 'http://ddfdfd', '20191124\\7cb3238c3587b8e763d46c5b79762212.png', '大幅度', '1', '50', '0', null);
INSERT INTO `tp_brand` VALUES ('7', '大幅度发放', 'http://ddfdfd', '20191124\\9449f606ec2be1c340a8227e6ff83671.png', '大多数', '1', '50', '0', null);
INSERT INTO `tp_brand` VALUES ('8', '大幅度发放', 'http://ddfdfd', '', '辅导辅导', '0', '50', '0', null);

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
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of tp_link
-- ----------------------------
INSERT INTO `tp_link` VALUES ('1', '粤凯信息科技有限公司', 'http://www.yuekai.com', 'public\\uploads\\link\\20191129\\5e3ed5d84b667726d6aea153eed57376.jpg', '世界第一，宇宙最强', '1', '50', '1', '1574784547');
