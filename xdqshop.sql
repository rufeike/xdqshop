/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50727
Source Host           : localhost:3306
Source Database       : xdqshop

Target Server Type    : MYSQL
Target Server Version : 50727
File Encoding         : 65001

Date: 2019-11-24 22:05:09
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tp_article_category
-- ----------------------------
DROP TABLE IF EXISTS `tp_article_category`;
CREATE TABLE `tp_article_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cate_name` varchar(60) DEFAULT NULL,
  `pid` int(11) DEFAULT '0' COMMENT '父级ID',
  `sort` int(11) DEFAULT '99' COMMENT '排序',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态 0：禁用 1正常',
  `is_del` tinyint(1) DEFAULT '1' COMMENT '默认1：正常 1：删除',
  `create_time` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `type` tinyint(1) DEFAULT '0' COMMENT '分类类型 默认0：帮助文档，1：系统文档',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of tp_article_category
-- ----------------------------
INSERT INTO `tp_article_category` VALUES ('1', 'fdfdfd', '0', '99', '0', '1', '1574604114', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of tp_brand
-- ----------------------------
INSERT INTO `tp_brand` VALUES ('1', '大幅度发放', 'httP://电放费大幅度', '20191124\\00f743026b361fe071eb7c9eed972518.JPG', '奋斗的方法', '1', '50', '1', null);
INSERT INTO `tp_brand` VALUES ('2', '大幅度发放', 'ddfdfd', '', '对方付电费', '1', '50', '1', null);
INSERT INTO `tp_brand` VALUES ('3', '放的地方', 'http://ddfdfd', '', '辅导辅导费', '1', '50', '1', null);
INSERT INTO `tp_brand` VALUES ('4', '大幅度发放', '', '', '辅导费', '1', '50', '1', null);
INSERT INTO `tp_brand` VALUES ('5', '大幅度发放', '', '', '', '1', '50', '0', null);
INSERT INTO `tp_brand` VALUES ('6', '大幅度发放', 'http://ddfdfd', '20191124\\7cb3238c3587b8e763d46c5b79762212.png', '大幅度', '1', '50', '0', null);
INSERT INTO `tp_brand` VALUES ('7', '大幅度发放', 'http://ddfdfd', '20191124\\9449f606ec2be1c340a8227e6ff83671.png', '大多数', '1', '50', '0', null);
INSERT INTO `tp_brand` VALUES ('8', '大幅度发放', 'http://ddfdfd', '', '辅导辅导', '0', '50', '0', null);
