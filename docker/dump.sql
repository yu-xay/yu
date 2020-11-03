-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: zjhj_mall_v4
-- ------------------------------------------------------
-- Server version	5.7.28-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `zjhj_bd_address`
--
USE zjhj_mall_v4;
DROP TABLE IF EXISTS `zjhj_bd_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL COMMENT '收货人',
  `province_id` int(11) NOT NULL DEFAULT '0',
  `province` varchar(255) NOT NULL DEFAULT '' COMMENT '省份名称',
  `city_id` int(11) NOT NULL DEFAULT '0',
  `city` varchar(255) NOT NULL DEFAULT '' COMMENT '城市名称',
  `district_id` int(11) NOT NULL DEFAULT '0',
  `district` varchar(255) NOT NULL DEFAULT '' COMMENT '县区名称',
  `mobile` varchar(255) NOT NULL COMMENT '联系电话',
  `detail` varchar(1000) NOT NULL COMMENT '详细地址',
  `is_default` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否默认',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `latitude` varchar(255) NOT NULL DEFAULT '' COMMENT '经度',
  `longitude` varchar(255) NOT NULL DEFAULT '' COMMENT '纬度',
  `location` varchar(255) NOT NULL DEFAULT '' COMMENT '位置',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '类型：0快递 1同城',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_address`
--

LOCK TABLES `zjhj_bd_address` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_admin_info`
--

DROP TABLE IF EXISTS `zjhj_bd_admin_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_admin_info` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `app_max_count` int(11) NOT NULL DEFAULT '-1' COMMENT '创建小程序最大数量-1.无限制',
  `permissions` text NOT NULL COMMENT '账户权限',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `expired_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '账户过期时间',
  `is_delete` int(11) NOT NULL DEFAULT '0',
  `we7_user_id` int(11) NOT NULL COMMENT '默认填0',
  `is_default` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否使用默认权限',
  `secondary_permissions` longtext COMMENT '二级权限',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `is_delete` (`is_delete`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_admin_info`
--

LOCK TABLES `zjhj_bd_admin_info` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_admin_info` DISABLE KEYS */;
INSERT INTO `zjhj_bd_admin_info` VALUES (1,1,0,'[]','','0000-00-00 00:00:00',0,0,0,NULL);
/*!40000 ALTER TABLE `zjhj_bd_admin_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_admin_notice`
--

DROP TABLE IF EXISTS `zjhj_bd_admin_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_admin_notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `type` varchar(20) NOT NULL DEFAULT '' COMMENT 'update更新urgent紧急important重要',
  `content` text NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_admin_notice`
--

LOCK TABLES `zjhj_bd_admin_notice` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_admin_notice` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_admin_notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_admin_register`
--

DROP TABLE IF EXISTS `zjhj_bd_admin_register`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_admin_register` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL DEFAULT '' COMMENT '用户名',
  `password` varchar(255) NOT NULL DEFAULT '' COMMENT '密码',
  `mobile` varchar(255) NOT NULL DEFAULT '' COMMENT '手机号',
  `name` varchar(45) NOT NULL DEFAULT '' COMMENT '姓名/企业名',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '申请原因',
  `wechat_id` varchar(64) NOT NULL DEFAULT '' COMMENT '微信号',
  `id_card_front_pic` varchar(2000) NOT NULL DEFAULT '' COMMENT '身份证正面',
  `id_card_back_pic` varchar(2000) NOT NULL DEFAULT '' COMMENT '身份证反面',
  `business_pic` varchar(2000) NOT NULL DEFAULT '' COMMENT '营业执照',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '审核状态：0=待审核，1=通过，2=不通过',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_admin_register`
--

LOCK TABLES `zjhj_bd_admin_register` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_admin_register` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_admin_register` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_advance_banner`
--

DROP TABLE IF EXISTS `zjhj_bd_advance_banner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_advance_banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `banner_id` int(11) NOT NULL,
  `mall_id` int(11) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='预售轮播图';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_advance_banner`
--

LOCK TABLES `zjhj_bd_advance_banner` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_advance_banner` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_advance_banner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_advance_goods`
--

DROP TABLE IF EXISTS `zjhj_bd_advance_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_advance_goods` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL,
  `mall_id` int(11) NOT NULL,
  `ladder_rules` varchar(4096) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '阶梯规则',
  `deposit` decimal(10,2) NOT NULL DEFAULT '0.00',
  `swell_deposit` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '定金膨胀金',
  `start_prepayment_at` timestamp NOT NULL COMMENT '预售开始时间',
  `end_prepayment_at` timestamp NOT NULL COMMENT '预售结束时间',
  `pay_limit` int(11) NOT NULL COMMENT '尾款支付时间 -1:无限制',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_advance_goods`
--

LOCK TABLES `zjhj_bd_advance_goods` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_advance_goods` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_advance_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_advance_goods_attr`
--

DROP TABLE IF EXISTS `zjhj_bd_advance_goods_attr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_advance_goods_attr` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `deposit` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '商品所需定金',
  `swell_deposit` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '定金膨胀金',
  `goods_id` int(11) NOT NULL,
  `goods_attr_id` int(11) NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  `advance_num` int(11) NOT NULL DEFAULT '0' COMMENT '预约数量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_advance_goods_attr`
--

LOCK TABLES `zjhj_bd_advance_goods_attr` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_advance_goods_attr` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_advance_goods_attr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_advance_order`
--

DROP TABLE IF EXISTS `zjhj_bd_advance_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_advance_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL COMMENT '商品ID',
  `goods_attr_id` int(11) NOT NULL COMMENT '规格ID',
  `goods_num` int(11) NOT NULL DEFAULT '0',
  `order_id` int(11) NOT NULL DEFAULT '0',
  `order_no` varchar(255) NOT NULL DEFAULT '0',
  `advance_no` varchar(255) NOT NULL COMMENT '定金订单号',
  `deposit` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '定金',
  `swell_deposit` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '膨胀金',
  `is_cancel` tinyint(2) NOT NULL DEFAULT '0' COMMENT '1取消',
  `cancel_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_refund` tinyint(2) NOT NULL DEFAULT '0' COMMENT '1退款',
  `is_delete` tinyint(2) NOT NULL DEFAULT '0' COMMENT '1删除',
  `is_pay` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否支付：0.未支付|1.已支付',
  `is_recycle` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否加入回收站 0.否|1.是',
  `pay_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '支付方式：1.在线支付 2.货到付款 3.余额支付',
  `pay_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `auto_cancel_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '自动取消时间',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `goods_info` longtext NOT NULL,
  `token` varchar(32) NOT NULL,
  `order_token` varchar(32) DEFAULT NULL,
  `preferential_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '活动优惠金额',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_advance_order`
--

LOCK TABLES `zjhj_bd_advance_order` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_advance_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_advance_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_advance_order_submit_result`
--

DROP TABLE IF EXISTS `zjhj_bd_advance_order_submit_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_advance_order_submit_result` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(32) NOT NULL,
  `data` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_advance_order_submit_result`
--

LOCK TABLES `zjhj_bd_advance_order_submit_result` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_advance_order_submit_result` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_advance_order_submit_result` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_advance_setting`
--

DROP TABLE IF EXISTS `zjhj_bd_advance_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_advance_setting` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `is_advance` tinyint(1) NOT NULL DEFAULT '1',
  `payment_type` text NOT NULL,
  `deposit_payment_type` varchar(255) NOT NULL DEFAULT '',
  `is_share` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否开启分销',
  `is_sms` tinyint(1) NOT NULL DEFAULT '0',
  `is_mail` tinyint(1) NOT NULL DEFAULT '0',
  `is_print` tinyint(1) NOT NULL DEFAULT '0',
  `is_territorial_limitation` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否开启区域允许购买',
  `goods_poster` longtext NOT NULL,
  `send_type` varchar(255) NOT NULL DEFAULT '' COMMENT '发货方式',
  `over_time` int(11) NOT NULL DEFAULT '0' COMMENT '未支付定金订单超时时间',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_advance_setting`
--

LOCK TABLES `zjhj_bd_advance_setting` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_advance_setting` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_advance_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_aliapp_config`
--

DROP TABLE IF EXISTS `zjhj_bd_aliapp_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_aliapp_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `appid` varchar(32) NOT NULL,
  `app_private_key` varchar(2000) NOT NULL,
  `alipay_public_key` varchar(2000) NOT NULL,
  `cs_tnt_inst_id` varchar(32) NOT NULL DEFAULT '',
  `cs_scene` varchar(32) NOT NULL DEFAULT '',
  `app_aes_secret` varchar(32) NOT NULL DEFAULT '' COMMENT '内容加密AES密钥',
  `transfer_app_id` varchar(64) DEFAULT '' COMMENT '打款到用户app_id',
  `transfer_app_private_key` varchar(2048) DEFAULT '' COMMENT '打款到用户app_private_key',
  `transfer_alipay_public_key` text,
  `transfer_appcert` text COMMENT '应用公钥证书',
  `transfer_alipay_rootcert` text COMMENT '支付宝根证书',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_aliapp_config`
--

LOCK TABLES `zjhj_bd_aliapp_config` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_aliapp_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_aliapp_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_aliapp_template`
--

DROP TABLE IF EXISTS `zjhj_bd_aliapp_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_aliapp_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `tpl_name` varchar(255) NOT NULL,
  `tpl_id` varchar(255) NOT NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_aliapp_template`
--

LOCK TABLES `zjhj_bd_aliapp_template` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_aliapp_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_aliapp_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_article`
--

DROP TABLE IF EXISTS `zjhj_bd_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL DEFAULT '0',
  `article_cat_id` int(11) NOT NULL COMMENT '分类id：1=关于我们，2=服务中心 , 3=拼团',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0隐藏 1显示',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '标题',
  `content` longtext NOT NULL COMMENT '内容',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `is_delete` smallint(1) NOT NULL DEFAULT '0' COMMENT '删除',
  `deleted_at` timestamp NOT NULL COMMENT '删除时间',
  `created_at` timestamp NOT NULL COMMENT '创建时间',
  `updated_at` timestamp NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `store_id` (`mall_id`) USING BTREE,
  KEY `is_delete` (`is_delete`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_article`
--

LOCK TABLES `zjhj_bd_article` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_article` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_assistant_data`
--

DROP TABLE IF EXISTS `zjhj_bd_assistant_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_assistant_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '类型 0--淘宝 1--淘宝app 2--天猫 3--天猫app 4--京东 5--拼多多',
  `itemId` varchar(255) NOT NULL DEFAULT '0' COMMENT '原始商品id',
  `json` longtext NOT NULL COMMENT '数据',
  `created_at` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='采集助手数据存储';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_assistant_data`
--

LOCK TABLES `zjhj_bd_assistant_data` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_assistant_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_assistant_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_attachment`
--

DROP TABLE IF EXISTS `zjhj_bd_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_attachment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `storage_id` int(11) NOT NULL,
  `attachment_group_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL,
  `mall_id` int(11) NOT NULL DEFAULT '0',
  `mch_id` int(11) NOT NULL DEFAULT '0' COMMENT '多商户id',
  `name` varchar(128) NOT NULL,
  `size` int(11) NOT NULL COMMENT '大小：字节',
  `url` varchar(2080) NOT NULL,
  `thumb_url` varchar(2080) NOT NULL DEFAULT '',
  `type` tinyint(2) NOT NULL COMMENT '类型：1=图片，2=视频',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  `is_recycle` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否加入回收站 0.否|1.是',
  PRIMARY KEY (`id`),
  KEY `attachment_group_id` (`attachment_group_id`),
  KEY `mall_id` (`mall_id`),
  KEY `mch_id` (`mch_id`),
  KEY `type` (`type`),
  KEY `is_delete` (`is_delete`),
  KEY `is_recycle` (`is_recycle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='附件、文件';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_attachment`
--

LOCK TABLES `zjhj_bd_attachment` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_attachment_group`
--

DROP TABLE IF EXISTS `zjhj_bd_attachment_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_attachment_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `mch_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(64) NOT NULL,
  `is_delete` smallint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `is_recycle` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否加入回收站 0.否|1.是',
  `type` tinyint(2) NOT NULL DEFAULT '0' COMMENT '0 图片 1商品',
  PRIMARY KEY (`id`),
  KEY `mall_id` (`mall_id`),
  KEY `mch_id` (`mch_id`),
  KEY `type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_attachment_group`
--

LOCK TABLES `zjhj_bd_attachment_group` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_attachment_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_attachment_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_attachment_storage`
--

DROP TABLE IF EXISTS `zjhj_bd_attachment_storage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_attachment_storage` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL DEFAULT '0',
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '存储类型：1=本地，2=阿里云，3=腾讯云，4=七牛',
  `config` longtext NOT NULL COMMENT '存储配置',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态：0=未启用，1=已启用',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int(11) NOT NULL DEFAULT '1' COMMENT '存储设置所属账号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='附件存储器';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_attachment_storage`
--

LOCK TABLES `zjhj_bd_attachment_storage` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_attachment_storage` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_attachment_storage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_auth_role`
--

DROP TABLE IF EXISTS `zjhj_bd_auth_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_auth_role` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `creator_id` int(11) NOT NULL COMMENT '创建者ID',
  `mall_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL DEFAULT '',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '角色描述、备注',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_auth_role`
--

LOCK TABLES `zjhj_bd_auth_role` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_auth_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_auth_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_auth_role_permission`
--

DROP TABLE IF EXISTS `zjhj_bd_auth_role_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_auth_role_permission` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `permissions` longtext NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_auth_role_permission`
--

LOCK TABLES `zjhj_bd_auth_role_permission` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_auth_role_permission` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_auth_role_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_auth_role_user`
--

DROP TABLE IF EXISTS `zjhj_bd_auth_role_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_auth_role_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_auth_role_user`
--

LOCK TABLES `zjhj_bd_auth_role_user` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_auth_role_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_auth_role_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_balance_log`
--

DROP TABLE IF EXISTS `zjhj_bd_balance_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_balance_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `type` tinyint(1) NOT NULL COMMENT '类型：1=收入，2=支出',
  `money` decimal(10,2) NOT NULL COMMENT '变动金额',
  `desc` varchar(255) NOT NULL DEFAULT '' COMMENT '变动说明',
  `custom_desc` longtext NOT NULL COMMENT '自定义详细说明|记录',
  `order_no` varchar(255) NOT NULL DEFAULT '' COMMENT '订单号',
  `created_at` timestamp NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mall_id` (`mall_id`),
  KEY `user_id` (`user_id`),
  KEY `type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_balance_log`
--

LOCK TABLES `zjhj_bd_balance_log` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_balance_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_balance_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_banner`
--

DROP TABLE IF EXISTS `zjhj_bd_banner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL DEFAULT '0',
  `pic_url` varchar(2080) NOT NULL COMMENT '图片',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '标题',
  `page_url` varchar(2048) NOT NULL DEFAULT '' COMMENT '页面路径',
  `open_type` varchar(65) NOT NULL DEFAULT '' COMMENT '打开方式',
  `params` text NOT NULL COMMENT '导航参数',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL COMMENT '创建时间',
  `deleted_at` timestamp NOT NULL COMMENT '删除时间',
  `updated_at` timestamp NOT NULL COMMENT '修改时间',
  `sign` varchar(65) NOT NULL DEFAULT '' COMMENT '插件标识',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_banner`
--

LOCK TABLES `zjhj_bd_banner` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_banner` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_banner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_bargain_banner`
--

DROP TABLE IF EXISTS `zjhj_bd_bargain_banner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_bargain_banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `banner_id` int(11) NOT NULL,
  `mall_id` int(11) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='砍价轮播图';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_bargain_banner`
--

LOCK TABLES `zjhj_bd_bargain_banner` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_bargain_banner` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_bargain_banner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_bargain_goods`
--

DROP TABLE IF EXISTS `zjhj_bd_bargain_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_bargain_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL,
  `mall_id` int(11) NOT NULL,
  `min_price` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '最低价',
  `begin_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '活动开始时间',
  `end_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '活动结束时间',
  `time` int(11) NOT NULL DEFAULT '0' COMMENT '砍价小时数',
  `status_data` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '砍价方式数据',
  `is_delete` smallint(6) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '活动是否开放 0--不开放 1--开放',
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否允许中途下单 1--允许 2--不允许',
  `stock` int(11) NOT NULL DEFAULT '0' COMMENT '活动库存',
  `initiator` int(11) NOT NULL DEFAULT '0' COMMENT '发起人数',
  `participant` int(11) NOT NULL DEFAULT '0' COMMENT '参与人数',
  `min_price_goods` int(11) NOT NULL DEFAULT '0' COMMENT '砍到最小价格数',
  `underway` int(11) NOT NULL DEFAULT '0' COMMENT '进行中的',
  `success` int(11) NOT NULL DEFAULT '0' COMMENT '成功的',
  `fail` int(11) NOT NULL DEFAULT '0' COMMENT '失败的',
  `stock_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '减库存的方式 1--参与减库存 2--拍下减库存',
  PRIMARY KEY (`id`),
  UNIQUE KEY `goods_id` (`goods_id`) USING BTREE,
  KEY `mall_id` (`mall_id`),
  KEY `is_delete` (`is_delete`),
  KEY `end_time` (`end_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='砍价商品设置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_bargain_goods`
--

LOCK TABLES `zjhj_bd_bargain_goods` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_bargain_goods` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_bargain_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_bargain_order`
--

DROP TABLE IF EXISTS `zjhj_bd_bargain_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_bargain_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `bargain_goods_id` int(11) NOT NULL COMMENT '砍价商品id',
  `token` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '售价',
  `min_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '最低价',
  `time` int(11) NOT NULL DEFAULT '0' COMMENT '砍价时间',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态 0--进行中 1--成功 2--失败',
  `bargain_goods_data` longtext NOT NULL COMMENT '砍价设置',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_delete` tinyint(1) NOT NULL,
  `preferential_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '优惠金额',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_bargain_order`
--

LOCK TABLES `zjhj_bd_bargain_order` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_bargain_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_bargain_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_bargain_setting`
--

DROP TABLE IF EXISTS `zjhj_bd_bargain_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_bargain_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` longtext NOT NULL,
  `created_at` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='砍价设置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_bargain_setting`
--

LOCK TABLES `zjhj_bd_bargain_setting` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_bargain_setting` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_bargain_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_bargain_user_order`
--

DROP TABLE IF EXISTS `zjhj_bd_bargain_user_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_bargain_user_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `bargain_order_id` int(11) NOT NULL COMMENT '砍价订单ID',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '砍价的金额',
  `is_delete` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `token` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mall_id` (`mall_id`),
  KEY `user_id` (`user_id`),
  KEY `bargain_order_id` (`bargain_order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户参与砍价所砍的金额';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_bargain_user_order`
--

LOCK TABLES `zjhj_bd_bargain_user_order` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_bargain_user_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_bargain_user_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_bdapp_config`
--

DROP TABLE IF EXISTS `zjhj_bd_bdapp_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_bdapp_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `app_id` varchar(16) DEFAULT NULL,
  `app_key` varchar(64) DEFAULT NULL,
  `app_secret` varchar(64) DEFAULT NULL,
  `pay_dealid` varchar(64) DEFAULT NULL,
  `pay_public_key` text,
  `pay_private_key` text,
  `pay_app_key` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_bdapp_config`
--

LOCK TABLES `zjhj_bd_bdapp_config` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_bdapp_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_bdapp_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_bdapp_order`
--

DROP TABLE IF EXISTS `zjhj_bd_bdapp_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_bdapp_order` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `order_no` varchar(255) NOT NULL DEFAULT '' COMMENT '订单号',
  `bd_user_id` varchar(255) NOT NULL DEFAULT '',
  `bd_order_id` varchar(255) NOT NULL DEFAULT '' COMMENT '百度平台订单ID',
  `bd_refund_batch_id` varchar(255) NOT NULL DEFAULT '' COMMENT '百度平台退款批次号',
  `bd_refund_money` int(11) NOT NULL DEFAULT '0',
  `refund_money` decimal(10,2) NOT NULL DEFAULT '0.00',
  `is_refund` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='百度订单号与商城订单号关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_bdapp_order`
--

LOCK TABLES `zjhj_bd_bdapp_order` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_bdapp_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_bdapp_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_bdapp_template`
--

DROP TABLE IF EXISTS `zjhj_bd_bdapp_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_bdapp_template` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `tpl_name` varchar(65) NOT NULL DEFAULT '',
  `tpl_id` varchar(255) NOT NULL DEFAULT '',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_bdapp_template`
--

LOCK TABLES `zjhj_bd_bdapp_template` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_bdapp_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_bdapp_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_bonus_captain`
--

DROP TABLE IF EXISTS `zjhj_bd_bonus_captain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_bonus_captain` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '队长姓名',
  `mobile` varchar(64) NOT NULL DEFAULT '' COMMENT '队长手机',
  `user_id` int(11) NOT NULL,
  `all_bonus` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '累计分红',
  `total_bonus` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '已分红',
  `expect_bonus` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '预计分红，未到账分红',
  `reason` varchar(255) NOT NULL DEFAULT '',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `level` int(11) NOT NULL DEFAULT '0' COMMENT '会员等级:0. 普通成员 关联等级表',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '-1重新申请未提交 0--申请中 1--成功 2--失败 3--处理中',
  `all_member` int(11) NOT NULL DEFAULT '0' COMMENT '团员数量',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `apply_at` timestamp NULL DEFAULT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='团队分红队长表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_bonus_captain`
--

LOCK TABLES `zjhj_bd_bonus_captain` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_bonus_captain` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_bonus_captain` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_bonus_captain_log`
--

DROP TABLE IF EXISTS `zjhj_bd_bonus_captain_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_bonus_captain_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `handler` int(11) NOT NULL DEFAULT '0' COMMENT '操作人',
  `user_id` int(11) NOT NULL COMMENT '队长',
  `event` varchar(255) NOT NULL COMMENT '事件名',
  `content` mediumtext NOT NULL COMMENT '记录信息',
  `create_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mall_id` (`mall_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='队长操作日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_bonus_captain_log`
--

LOCK TABLES `zjhj_bd_bonus_captain_log` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_bonus_captain_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_bonus_captain_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_bonus_captain_relation`
--

DROP TABLE IF EXISTS `zjhj_bd_bonus_captain_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_bonus_captain_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `captain_id` int(11) NOT NULL COMMENT '队长id',
  `user_id` int(11) NOT NULL COMMENT '团队id',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_bonus_captain_relation`
--

LOCK TABLES `zjhj_bd_bonus_captain_relation` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_bonus_captain_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_bonus_captain_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_bonus_cash`
--

DROP TABLE IF EXISTS `zjhj_bd_bonus_cash`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_bonus_cash` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `order_no` varchar(255) NOT NULL DEFAULT '' COMMENT '订单号',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '提现金额',
  `service_charge` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '提现手续费（%）',
  `type` varchar(255) NOT NULL DEFAULT '' COMMENT '提现方式 auto--自动打款 wechat--微信打款 alipay--支付宝打款 bank--银行转账 balance--打款到余额',
  `extra` longtext COMMENT '额外信息 例如微信账号、支付宝账号等',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '提现状态 0--申请 1--同意 2--已打款 3--驳回',
  `is_delete` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL,
  `content` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='提现记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_bonus_cash`
--

LOCK TABLES `zjhj_bd_bonus_cash` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_bonus_cash` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_bonus_cash` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_bonus_cash_log`
--

DROP TABLE IF EXISTS `zjhj_bd_bonus_cash_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_bonus_cash_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `type` int(11) NOT NULL DEFAULT '1' COMMENT '类型 1--收入 2--支出',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '变动佣金',
  `desc` longtext,
  `custom_desc` longtext,
  `is_delete` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_bonus_cash_log`
--

LOCK TABLES `zjhj_bd_bonus_cash_log` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_bonus_cash_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_bonus_cash_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_bonus_members`
--

DROP TABLE IF EXISTS `zjhj_bd_bonus_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_bonus_members` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `level` int(11) unsigned NOT NULL COMMENT '等级',
  `name` varchar(64) NOT NULL DEFAULT '' COMMENT '等级名称',
  `auto_update` tinyint(1) NOT NULL COMMENT '是否开启自动升级',
  `update_type` int(11) NOT NULL DEFAULT '0' COMMENT '升级条件类型',
  `update_condition` varchar(64) NOT NULL COMMENT '升级条件',
  `rate` varchar(32) NOT NULL DEFAULT '0' COMMENT '分红比例',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态 0--禁用 1--启用',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_bonus_members`
--

LOCK TABLES `zjhj_bd_bonus_members` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_bonus_members` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_bonus_members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_bonus_order_log`
--

DROP TABLE IF EXISTS `zjhj_bd_bonus_order_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_bonus_order_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL DEFAULT '0',
  `order_id` int(11) NOT NULL DEFAULT '0' COMMENT '订单ID',
  `from_user_id` int(11) NOT NULL DEFAULT '0' COMMENT '下单用户ID',
  `to_user_id` int(11) NOT NULL DEFAULT '0' COMMENT '受益用户ID',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '订单商品实付金额',
  `bonus_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '分红金额',
  `fail_bonus_price` decimal(10,2) DEFAULT '0.00' COMMENT '失败分红金额',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '0预计分红，1完成分红，2分红失败',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_delete` tinyint(2) NOT NULL DEFAULT '0',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `bonus_rate` varchar(32) NOT NULL DEFAULT '0' COMMENT '下单时的分红比例%',
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_id` (`order_id`) USING BTREE,
  KEY `from_user_id` (`from_user_id`) USING BTREE,
  KEY `to_user_id` (`to_user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_bonus_order_log`
--

LOCK TABLES `zjhj_bd_bonus_order_log` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_bonus_order_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_bonus_order_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_bonus_setting`
--

DROP TABLE IF EXISTS `zjhj_bd_bonus_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_bonus_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `created_at` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `is_delete` int(11) NOT NULL DEFAULT '0' COMMENT '是否删除 0--未删除 1--已删除',
  `deleted_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='团队分红设置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_bonus_setting`
--

LOCK TABLES `zjhj_bd_bonus_setting` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_bonus_setting` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_bonus_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_booking_cats`
--

DROP TABLE IF EXISTS `zjhj_bd_booking_cats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_booking_cats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `sort` int(11) NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_booking_cats`
--

LOCK TABLES `zjhj_bd_booking_cats` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_booking_cats` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_booking_cats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_booking_goods`
--

DROP TABLE IF EXISTS `zjhj_bd_booking_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_booking_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `form_data` longtext NOT NULL COMMENT '自定义表单',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `is_order_form` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否开启自定义表单0.否|1.是',
  `order_form_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1.选择表单|2.自定义表单',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_booking_goods`
--

LOCK TABLES `zjhj_bd_booking_goods` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_booking_goods` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_booking_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_booking_order`
--

DROP TABLE IF EXISTS `zjhj_bd_booking_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_booking_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `token` varchar(255) NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除',
  `created_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_booking_order`
--

LOCK TABLES `zjhj_bd_booking_order` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_booking_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_booking_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_booking_setting`
--

DROP TABLE IF EXISTS `zjhj_bd_booking_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_booking_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `is_share` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否开启分销',
  `is_sms` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否开启短信通知',
  `is_mail` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否开启邮件通知',
  `is_print` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否开启订单打印',
  `is_cat` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否显示分类',
  `is_form` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否启用默认form',
  `form_data` longtext NOT NULL COMMENT 'form默认表单',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `payment_type` longtext NOT NULL COMMENT '支付方式',
  `goods_poster` longtext NOT NULL COMMENT '自定义海报',
  PRIMARY KEY (`id`),
  KEY `mall_id` (`mall_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_booking_setting`
--

LOCK TABLES `zjhj_bd_booking_setting` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_booking_setting` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_booking_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_booking_store`
--

DROP TABLE IF EXISTS `zjhj_bd_booking_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_booking_store` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除',
  `created_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_booking_store`
--

LOCK TABLES `zjhj_bd_booking_store` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_booking_store` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_booking_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_cart`
--

DROP TABLE IF EXISTS `zjhj_bd_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL COMMENT '商品',
  `attr_id` int(11) NOT NULL COMMENT '商品规格',
  `num` int(11) NOT NULL DEFAULT '1' COMMENT '商品数量',
  `mch_id` int(11) NOT NULL DEFAULT '0' COMMENT '商户id',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除',
  `sign` varchar(65) NOT NULL DEFAULT '',
  `created_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `attr_info` text,
  PRIMARY KEY (`id`),
  KEY `mall_id` (`mall_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_cart`
--

LOCK TABLES `zjhj_bd_cart` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_check_in_award_config`
--

DROP TABLE IF EXISTS `zjhj_bd_check_in_award_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_check_in_award_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `number` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '奖励数量',
  `day` int(11) NOT NULL DEFAULT '0' COMMENT '领取奖励的天数',
  `type` varchar(255) NOT NULL DEFAULT '' COMMENT '奖励类型integral--积分|balance--余额',
  `status` tinyint(1) NOT NULL COMMENT '领取类型1--普通签到领取|2--连续签到领取|3--累计签到领取',
  `is_delete` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='签到奖励设置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_check_in_award_config`
--

LOCK TABLES `zjhj_bd_check_in_award_config` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_check_in_award_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_check_in_award_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_check_in_config`
--

DROP TABLE IF EXISTS `zjhj_bd_check_in_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_check_in_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否开启 0--关闭|1--开启',
  `is_remind` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否提醒 0--关闭|1--开启',
  `time` varchar(255) NOT NULL COMMENT '提醒时间',
  `continue_type` tinyint(1) NOT NULL COMMENT '连续签到周期1--不限|2--周清|3--月清',
  `rule` longtext NOT NULL COMMENT '签到规则',
  `is_delete` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='签到设置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_check_in_config`
--

LOCK TABLES `zjhj_bd_check_in_config` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_check_in_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_check_in_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_check_in_customize`
--

DROP TABLE IF EXISTS `zjhj_bd_check_in_customize`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_check_in_customize` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `value` longtext NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_check_in_customize`
--

LOCK TABLES `zjhj_bd_check_in_customize` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_check_in_customize` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_check_in_customize` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_check_in_queue`
--

DROP TABLE IF EXISTS `zjhj_bd_check_in_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_check_in_queue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(255) NOT NULL,
  `data` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='签到定时任务执行记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_check_in_queue`
--

LOCK TABLES `zjhj_bd_check_in_queue` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_check_in_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_check_in_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_check_in_sign`
--

DROP TABLE IF EXISTS `zjhj_bd_check_in_sign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_check_in_sign` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `number` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '签到奖励数量',
  `type` varchar(255) NOT NULL DEFAULT '' COMMENT '签到奖励类型integral--积分|balance--余额',
  `day` int(11) NOT NULL DEFAULT '1' COMMENT '签到天数',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1--普通签到奖励 2--连续签到奖励 3--累计签到奖励',
  `is_delete` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `token` varchar(255) NOT NULL,
  `award_id` int(11) NOT NULL DEFAULT '0' COMMENT '签到奖励id',
  PRIMARY KEY (`id`),
  KEY `mall_id` (`mall_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='签到领取奖励';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_check_in_sign`
--

LOCK TABLES `zjhj_bd_check_in_sign` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_check_in_sign` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_check_in_sign` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_check_in_user`
--

DROP TABLE IF EXISTS `zjhj_bd_check_in_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_check_in_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `total` int(11) NOT NULL DEFAULT '0' COMMENT '累计签到时间',
  `continue` int(11) NOT NULL DEFAULT '0' COMMENT '连续签到时间',
  `is_remind` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否开启签到提醒',
  `created_at` timestamp NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `updated_at` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NOT NULL,
  `continue_start` timestamp NULL DEFAULT NULL COMMENT '连续签到的起始日期',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `mall_id` (`mall_id`),
  KEY `is_delete` (`is_delete`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='签到插件--用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_check_in_user`
--

LOCK TABLES `zjhj_bd_check_in_user` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_check_in_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_check_in_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_check_in_user_remind`
--

DROP TABLE IF EXISTS `zjhj_bd_check_in_user_remind`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_check_in_user_remind` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date` timestamp NOT NULL,
  `is_remind` tinyint(1) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mall_id` (`mall_id`),
  KEY `user_id` (`user_id`),
  KEY `is_remind` (`is_remind`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户签到提醒记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_check_in_user_remind`
--

LOCK TABLES `zjhj_bd_check_in_user_remind` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_check_in_user_remind` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_check_in_user_remind` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_city_delivery_setting`
--

DROP TABLE IF EXISTS `zjhj_bd_city_delivery_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_city_delivery_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL DEFAULT '0',
  `key` varchar(60) DEFAULT NULL,
  `value` text,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `is_delete` tinyint(2) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `key` (`key`),
  KEY `is_delete` (`is_delete`),
  KEY `mall_id` (`mall_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_city_delivery_setting`
--

LOCK TABLES `zjhj_bd_city_delivery_setting` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_city_delivery_setting` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_city_delivery_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_city_deliveryman`
--

DROP TABLE IF EXISTS `zjhj_bd_city_deliveryman`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_city_deliveryman` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL DEFAULT '0',
  `mch_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL COMMENT '配送员名称',
  `mobile` varchar(255) NOT NULL COMMENT '联系方式',
  `is_delete` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_city_deliveryman`
--

LOCK TABLES `zjhj_bd_city_deliveryman` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_city_deliveryman` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_city_deliveryman` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_city_preview_order`
--

DROP TABLE IF EXISTS `zjhj_bd_city_preview_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_city_preview_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `result_data` text,
  `order_info` text,
  `created_at` timestamp NULL DEFAULT NULL,
  `order_detail_sign` varchar(255) DEFAULT NULL,
  `all_order_info` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_city_preview_order`
--

LOCK TABLES `zjhj_bd_city_preview_order` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_city_preview_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_city_preview_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_city_service`
--

DROP TABLE IF EXISTS `zjhj_bd_city_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_city_service` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `platform` varchar(255) DEFAULT NULL COMMENT '所属平台',
  `name` varchar(255) NOT NULL COMMENT '配送名称',
  `distribution_corporation` int(11) NOT NULL COMMENT '配送公司 1.顺丰|2.闪送|3.美团配送|4.达达',
  `shop_no` varchar(255) DEFAULT NULL COMMENT '门店编号',
  `data` text,
  `created_at` timestamp NULL DEFAULT NULL,
  `is_delete` int(1) NOT NULL DEFAULT '0',
  `service_type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_city_service`
--

LOCK TABLES `zjhj_bd_city_service` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_city_service` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_city_service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_clerk_user`
--

DROP TABLE IF EXISTS `zjhj_bd_clerk_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_clerk_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `mall_id` int(11) NOT NULL,
  `mch_id` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_clerk_user`
--

LOCK TABLES `zjhj_bd_clerk_user` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_clerk_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_clerk_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_clerk_user_store_relation`
--

DROP TABLE IF EXISTS `zjhj_bd_clerk_user_store_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_clerk_user_store_relation` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `clerk_user_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_clerk_user_store_relation`
--

LOCK TABLES `zjhj_bd_clerk_user_store_relation` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_clerk_user_store_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_clerk_user_store_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_community_activity`
--

DROP TABLE IF EXISTS `zjhj_bd_community_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_community_activity` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '状态 0下架 1上架',
  `is_delete` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '活动标题',
  `start_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '活动开始时间',
  `end_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '活动结束时间',
  `is_area_limit` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否单独区域购买',
  `area_limit` longtext NOT NULL,
  `full_price` varchar(200) NOT NULL DEFAULT '' COMMENT '满减方案json',
  `condition` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0关闭，1开启人数条件，2开启件数条件',
  `num` int(11) NOT NULL DEFAULT '0' COMMENT '条件数量',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_1` (`mall_id`,`is_delete`,`created_at`),
  KEY `sort` (`start_at`,`end_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='社区团购活动';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_community_activity`
--

LOCK TABLES `zjhj_bd_community_activity` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_community_activity` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_community_activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_community_activity_locking`
--

DROP TABLE IF EXISTS `zjhj_bd_community_activity_locking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_community_activity_locking` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) NOT NULL DEFAULT '0',
  `middleman_id` int(11) NOT NULL DEFAULT '0',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_community_activity_locking`
--

LOCK TABLES `zjhj_bd_community_activity_locking` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_community_activity_locking` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_community_activity_locking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_community_activity_robots`
--

DROP TABLE IF EXISTS `zjhj_bd_community_activity_robots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_community_activity_robots` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) NOT NULL DEFAULT '0',
  `middleman_id` int(11) NOT NULL DEFAULT '0',
  `robots_ids` varchar(100) NOT NULL DEFAULT '',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_community_activity_robots`
--

LOCK TABLES `zjhj_bd_community_activity_robots` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_community_activity_robots` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_community_activity_robots` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_community_address`
--

DROP TABLE IF EXISTS `zjhj_bd_community_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_community_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL COMMENT '收货人',
  `province_id` int(11) NOT NULL,
  `province` varchar(255) NOT NULL COMMENT '省份名称',
  `city_id` int(11) NOT NULL,
  `city` varchar(255) NOT NULL COMMENT '城市名称',
  `district_id` int(11) NOT NULL,
  `district` varchar(255) NOT NULL COMMENT '县区名称',
  `mobile` varchar(255) NOT NULL COMMENT '联系电话',
  `detail` varchar(1000) NOT NULL COMMENT '详细地址',
  `is_default` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否默认',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `latitude` varchar(255) NOT NULL DEFAULT '' COMMENT '经度',
  `longitude` varchar(255) NOT NULL DEFAULT '' COMMENT '纬度',
  `location` varchar(255) NOT NULL DEFAULT '' COMMENT '位置',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='团长地址';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_community_address`
--

LOCK TABLES `zjhj_bd_community_address` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_community_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_community_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_community_bonus_log`
--

DROP TABLE IF EXISTS `zjhj_bd_community_bonus_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_community_bonus_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `order_id` int(11) NOT NULL DEFAULT '0',
  `activity_id` int(11) NOT NULL DEFAULT '0' COMMENT '活动ID',
  `desc` varchar(200) NOT NULL DEFAULT '',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `profit_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '利润',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_community_bonus_log`
--

LOCK TABLES `zjhj_bd_community_bonus_log` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_community_bonus_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_community_bonus_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_community_cart`
--

DROP TABLE IF EXISTS `zjhj_bd_community_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_community_cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL DEFAULT '0',
  `mch_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `activity_id` int(11) NOT NULL DEFAULT '0',
  `community_goods_id` int(11) NOT NULL DEFAULT '0',
  `goods_id` int(11) NOT NULL DEFAULT '0',
  `goods_attr_id` int(11) NOT NULL DEFAULT '0',
  `attr_info` longtext NOT NULL,
  `num` int(11) NOT NULL DEFAULT '0',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='社区团购用户购物车';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_community_cart`
--

LOCK TABLES `zjhj_bd_community_cart` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_community_cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_community_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_community_goods`
--

DROP TABLE IF EXISTS `zjhj_bd_community_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_community_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL DEFAULT '0',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `activity_id` int(11) NOT NULL DEFAULT '0' COMMENT '活动id',
  `sort` int(11) NOT NULL DEFAULT '100' COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `activity` (`activity_id`) USING BTREE,
  KEY `goods_id` (`goods_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='社区团购商品';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_community_goods`
--

LOCK TABLES `zjhj_bd_community_goods` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_community_goods` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_community_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_community_goods_attr`
--

DROP TABLE IF EXISTS `zjhj_bd_community_goods_attr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_community_goods_attr` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL DEFAULT '0',
  `attr_id` int(11) NOT NULL DEFAULT '0',
  `supply_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '供货价',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_community_goods_attr`
--

LOCK TABLES `zjhj_bd_community_goods_attr` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_community_goods_attr` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_community_goods_attr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_community_log`
--

DROP TABLE IF EXISTS `zjhj_bd_community_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_community_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `middleman_id` int(11) NOT NULL DEFAULT '0',
  `activity_id` int(11) NOT NULL DEFAULT '0',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_community_log`
--

LOCK TABLES `zjhj_bd_community_log` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_community_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_community_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_community_middleman`
--

DROP TABLE IF EXISTS `zjhj_bd_community_middleman`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_community_middleman` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '可提现利润',
  `total_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '累计利润',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0--申请中 1--通过 2--拒绝 -1--未支付',
  `apply_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '申请时间',
  `become_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '通过审核时间',
  `delete_first_show` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除后是否显示0--不显示 1--显示',
  `reason` varchar(255) NOT NULL DEFAULT '' COMMENT '审核结果原因',
  `content` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '收货人',
  `mobile` varchar(255) NOT NULL DEFAULT '' COMMENT '联系电话',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `pay_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '支付的金额',
  `token` varchar(255) NOT NULL DEFAULT '',
  `pay_type` tinyint(255) NOT NULL DEFAULT '0' COMMENT '支付方式',
  `pay_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '支付时间',
  `total_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '销售总额',
  `order_count` int(11) NOT NULL DEFAULT '0' COMMENT '订单总数',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='社区团购 团长信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_community_middleman`
--

LOCK TABLES `zjhj_bd_community_middleman` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_community_middleman` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_community_middleman` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_community_middleman_activity`
--

DROP TABLE IF EXISTS `zjhj_bd_community_middleman_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_community_middleman_activity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `middleman_id` int(11) NOT NULL DEFAULT '0' COMMENT '团长user_id',
  `activity_id` int(11) NOT NULL DEFAULT '0' COMMENT '活动id',
  `is_remind` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否提醒 0--未提醒 1--已提醒',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_community_middleman_activity`
--

LOCK TABLES `zjhj_bd_community_middleman_activity` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_community_middleman_activity` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_community_middleman_activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_community_order`
--

DROP TABLE IF EXISTS `zjhj_bd_community_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_community_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL DEFAULT '0',
  `order_id` int(11) NOT NULL DEFAULT '0',
  `activity_id` int(11) NOT NULL DEFAULT '0' COMMENT '活动ID',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `middleman_id` int(11) NOT NULL COMMENT '团长ID',
  `profit_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '总利润',
  `profit_data` text NOT NULL COMMENT '利润详情',
  `full_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '满多少',
  `discount_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '优惠金额',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  `activity_no` varchar(100) NOT NULL DEFAULT '' COMMENT '活动编号',
  `no` int(11) NOT NULL DEFAULT '0' COMMENT '编号',
  `num` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_community_order`
--

LOCK TABLES `zjhj_bd_community_order` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_community_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_community_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_community_relations`
--

DROP TABLE IF EXISTS `zjhj_bd_community_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_community_relations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `middleman_id` int(11) NOT NULL DEFAULT '0',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='社区团购 用户与团长关系';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_community_relations`
--

LOCK TABLES `zjhj_bd_community_relations` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_community_relations` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_community_relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_community_switch`
--

DROP TABLE IF EXISTS `zjhj_bd_community_switch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_community_switch` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `middleman_id` int(11) NOT NULL DEFAULT '0',
  `activity_id` int(11) NOT NULL DEFAULT '0',
  `goods_id` int(11) NOT NULL DEFAULT '0',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='活动商品关闭表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_community_switch`
--

LOCK TABLES `zjhj_bd_community_switch` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_community_switch` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_community_switch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_composition`
--

DROP TABLE IF EXISTS `zjhj_bd_composition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_composition` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT ' ',
  `mall_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '套餐名',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '套餐价',
  `type` tinyint(255) NOT NULL DEFAULT '1' COMMENT '套餐类型 1--固定套餐 2--搭配套餐',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '是否上架 0--下架 1--上架',
  `sort` int(11) NOT NULL DEFAULT '100' COMMENT '排序',
  `is_delete` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `sort_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '排序的优惠金额',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='套餐表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_composition`
--

LOCK TABLES `zjhj_bd_composition` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_composition` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_composition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_composition_goods`
--

DROP TABLE IF EXISTS `zjhj_bd_composition_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_composition_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `model_id` int(11) NOT NULL COMMENT '套餐id',
  `goods_id` int(11) NOT NULL COMMENT '商品id',
  `is_host` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否是主商品',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '优惠金额',
  `payment_people` int(11) NOT NULL DEFAULT '0' COMMENT '支付人数',
  `payment_num` int(11) NOT NULL DEFAULT '0' COMMENT '支付件数',
  `payment_amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '支付金额',
  `created_at` timestamp NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mall_id` (`mall_id`) USING BTREE,
  KEY `model_id` (`model_id`) USING BTREE,
  KEY `goods_id` (`goods_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_composition_goods`
--

LOCK TABLES `zjhj_bd_composition_goods` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_composition_goods` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_composition_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_composition_order`
--

DROP TABLE IF EXISTS `zjhj_bd_composition_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_composition_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `composition_id` int(11) NOT NULL DEFAULT '0' COMMENT '优惠金额',
  `price` decimal(10,2) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_composition_order`
--

LOCK TABLES `zjhj_bd_composition_order` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_composition_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_composition_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_core_action_log`
--

DROP TABLE IF EXISTS `zjhj_bd_core_action_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_core_action_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL COMMENT '操作人ID',
  `model` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '模型名称',
  `model_id` int(11) NOT NULL COMMENT '模模型ID',
  `before_update` longtext COLLATE utf8mb4_german2_ci,
  `after_update` longtext COLLATE utf8mb4_german2_ci,
  `created_at` timestamp NOT NULL COMMENT '创建时间',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  `remark` varchar(255) COLLATE utf8mb4_german2_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `store_id` (`mall_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_core_action_log`
--

LOCK TABLES `zjhj_bd_core_action_log` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_core_action_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_core_action_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_core_exception_log`
--

DROP TABLE IF EXISTS `zjhj_bd_core_exception_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_core_exception_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `level` tinyint(4) NOT NULL DEFAULT '1' COMMENT '异常等级1.报错|2.警告|3.记录信息',
  `title` mediumtext NOT NULL COMMENT '异常标题',
  `content` mediumtext NOT NULL COMMENT '异常内容',
  `created_at` timestamp NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_core_exception_log`
--

LOCK TABLES `zjhj_bd_core_exception_log` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_core_exception_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_core_exception_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_core_plugin`
--

DROP TABLE IF EXISTS `zjhj_bd_core_plugin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_core_plugin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `display_name` varchar(64) NOT NULL,
  `version` varchar(64) NOT NULL DEFAULT '',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `pic_url` text,
  `desc` longtext,
  `sort` int(11) NOT NULL DEFAULT '100',
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_core_plugin`
--

LOCK TABLES `zjhj_bd_core_plugin` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_core_plugin` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_core_plugin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_core_queue`
--

DROP TABLE IF EXISTS `zjhj_bd_core_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_core_queue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel` varchar(64) NOT NULL,
  `job` blob NOT NULL,
  `pushed_at` int(11) NOT NULL,
  `ttr` int(11) NOT NULL,
  `delay` int(11) NOT NULL DEFAULT '0',
  `priority` int(11) unsigned NOT NULL DEFAULT '1024',
  `reserved_at` int(11) DEFAULT NULL,
  `attempt` int(11) DEFAULT NULL,
  `done_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `channel` (`channel`),
  KEY `reserved_at` (`reserved_at`),
  KEY `priority` (`priority`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_core_queue`
--

LOCK TABLES `zjhj_bd_core_queue` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_core_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_core_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_core_queue_data`
--

DROP TABLE IF EXISTS `zjhj_bd_core_queue_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_core_queue_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `queue_id` int(11) NOT NULL DEFAULT '0' COMMENT '队列返回值',
  `token` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `queue_id` (`queue_id`),
  KEY `token` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='队列存储';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_core_queue_data`
--

LOCK TABLES `zjhj_bd_core_queue_data` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_core_queue_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_core_queue_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_core_session`
--

DROP TABLE IF EXISTS `zjhj_bd_core_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_core_session` (
  `id` char(40) NOT NULL,
  `expire` int(11) DEFAULT NULL,
  `DATA` blob,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_core_session`
--

LOCK TABLES `zjhj_bd_core_session` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_core_session` DISABLE KEYS */;
INSERT INTO `zjhj_bd_core_session` VALUES ('06lqq82u1m89l9s5hc8enib8s9',1603811059,0x5F5F666C6173687C613A303A7B7D5F5F636170746368612F736974652F7069632D636170746368617C733A353A22666F626A72223B5F5F636170746368612F736974652F7069632D63617074636861636F756E747C693A313B5F5F69647C693A313B),('2n0knj30k1s1o395di29on7epv',1603808779,0x5F5F666C6173687C613A303A7B7D5F5F636170746368612F736974652F7069632D636170746368617C733A343A2267616C6C223B5F5F636170746368612F736974652F7069632D63617074636861636F756E747C693A313B),('bt4smv4c48g0n1ccvm3riuor73',1603814122,0x5F5F666C6173687C613A303A7B7D5F5F636170746368612F736974652F7069632D636170746368617C733A343A2276656776223B5F5F636170746368612F736974652F7069632D63617074636861636F756E747C693A313B);
/*!40000 ALTER TABLE `zjhj_bd_core_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_core_task`
--

DROP TABLE IF EXISTS `zjhj_bd_core_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_core_task` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(64) CHARACTER SET utf8 NOT NULL,
  `delay_seconds` int(11) NOT NULL,
  `is_executed` int(1) NOT NULL,
  `class` varchar(128) CHARACTER SET utf8 NOT NULL,
  `params` longtext,
  `content` longtext,
  `is_delete` int(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_core_task`
--

LOCK TABLES `zjhj_bd_core_task` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_core_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_core_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_core_template`
--

DROP TABLE IF EXISTS `zjhj_bd_core_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_core_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `template_id` int(11) NOT NULL DEFAULT '0' COMMENT '模板id',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '模板名称',
  `author` varchar(255) NOT NULL DEFAULT '' COMMENT '作者',
  `price` decimal(10,0) NOT NULL DEFAULT '0' COMMENT '价格',
  `pics` longtext NOT NULL,
  `data` longtext NOT NULL COMMENT '数据',
  `order_no` varchar(255) NOT NULL DEFAULT '' COMMENT '订单号',
  `version` varchar(255) NOT NULL DEFAULT '' COMMENT '版本号',
  `type` varchar(255) NOT NULL DEFAULT '' COMMENT 'home--首页布局 diy--DIY模板',
  `detail` longtext NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_core_template`
--

LOCK TABLES `zjhj_bd_core_template` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_core_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_core_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_core_template_edit`
--

DROP TABLE IF EXISTS `zjhj_bd_core_template_edit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_core_template_edit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `template_id` int(11) NOT NULL DEFAULT '0' COMMENT '模板id',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '修改后名称',
  `price` decimal(10,0) NOT NULL DEFAULT '0' COMMENT '修改后价格',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_core_template_edit`
--

LOCK TABLES `zjhj_bd_core_template_edit` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_core_template_edit` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_core_template_edit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_core_template_type`
--

DROP TABLE IF EXISTS `zjhj_bd_core_template_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_core_template_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `template_id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL DEFAULT '' COMMENT '模板适用地方',
  `is_delete` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='模板市场中模板适用的地方';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_core_template_type`
--

LOCK TABLES `zjhj_bd_core_template_type` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_core_template_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_core_template_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_core_validate_code`
--

DROP TABLE IF EXISTS `zjhj_bd_core_validate_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_core_validate_code` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `target` varchar(255) NOT NULL,
  `code` varchar(128) NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `is_validated` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否已验证：0=未验证，1-已验证',
  PRIMARY KEY (`id`),
  KEY `target` (`target`),
  KEY `code` (`code`),
  KEY `created_at` (`created_at`),
  KEY `updated_at` (`updated_at`),
  KEY `is_validated` (`is_validated`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='短信、邮箱验证码';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_core_validate_code`
--

LOCK TABLES `zjhj_bd_core_validate_code` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_core_validate_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_core_validate_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_core_validate_code_log`
--

DROP TABLE IF EXISTS `zjhj_bd_core_validate_code_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_core_validate_code_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `target` varchar(255) NOT NULL DEFAULT '',
  `content` varchar(255) NOT NULL DEFAULT '',
  `created_at` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_core_validate_code_log`
--

LOCK TABLES `zjhj_bd_core_validate_code_log` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_core_validate_code_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_core_validate_code_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_coupon`
--

DROP TABLE IF EXISTS `zjhj_bd_coupon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_coupon` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL COMMENT '优惠券名称',
  `type` smallint(1) NOT NULL COMMENT '优惠券类型：1=折扣，2=满减',
  `discount` decimal(3,1) NOT NULL DEFAULT '10.0' COMMENT '折扣率',
  `pic_url` int(11) NOT NULL DEFAULT '0' COMMENT '未用',
  `desc` varchar(2000) NOT NULL DEFAULT '' COMMENT '未用',
  `min_price` decimal(10,2) NOT NULL COMMENT '最低消费金额',
  `sub_price` decimal(10,2) NOT NULL COMMENT '优惠金额',
  `total_count` int(11) NOT NULL DEFAULT '-1' COMMENT '可发放的数量（剩余数量）',
  `sort` int(11) NOT NULL DEFAULT '1' COMMENT '排序按升序排列',
  `expire_type` smallint(1) NOT NULL COMMENT '到期类型：1=领取后N天过期，2=指定有效期',
  `expire_day` int(11) NOT NULL DEFAULT '0' COMMENT '有效天数，expire_type=1时',
  `begin_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '有效期开始时间',
  `end_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '有效期结束时间',
  `appoint_type` smallint(11) NOT NULL COMMENT '1 指定分类 2 指定商品 3全部',
  `rule` varchar(2000) NOT NULL DEFAULT '' COMMENT '使用说明',
  `is_member` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否指定会员等级',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除',
  `deleted_at` timestamp NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `discount_limit` decimal(10,2) DEFAULT NULL COMMENT '折扣优惠上限',
  `can_receive_count` int(11) NOT NULL DEFAULT '1' COMMENT '可领取数量',
  `app_share_title` varchar(255) NOT NULL DEFAULT '',
  `app_share_pic` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `store_id` (`mall_id`) USING BTREE,
  KEY `is_delete` (`is_delete`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_coupon`
--

LOCK TABLES `zjhj_bd_coupon` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_coupon` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_coupon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_coupon_auto_send`
--

DROP TABLE IF EXISTS `zjhj_bd_coupon_auto_send`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_coupon_auto_send` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `coupon_id` int(11) NOT NULL COMMENT '优惠卷',
  `event` int(11) NOT NULL DEFAULT '1' COMMENT '触发事件：1=分享，2=购买并付款',
  `send_count` int(11) NOT NULL DEFAULT '0' COMMENT '最多发放次数，0表示不限制',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除',
  `deleted_at` timestamp NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '领取人 0--所有人 1--指定用户',
  `user_list` longtext COMMENT '指定用户id列表',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_coupon_auto_send`
--

LOCK TABLES `zjhj_bd_coupon_auto_send` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_coupon_auto_send` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_coupon_auto_send` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_coupon_cat_relation`
--

DROP TABLE IF EXISTS `zjhj_bd_coupon_cat_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_coupon_cat_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_id` int(11) NOT NULL COMMENT '优惠券',
  `cat_id` int(11) NOT NULL COMMENT '分类',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_coupon_cat_relation`
--

LOCK TABLES `zjhj_bd_coupon_cat_relation` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_coupon_cat_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_coupon_cat_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_coupon_center`
--

DROP TABLE IF EXISTS `zjhj_bd_coupon_center`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_coupon_center` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `coupon_id` int(11) NOT NULL COMMENT '优惠券id',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除',
  `created_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_coupon_center`
--

LOCK TABLES `zjhj_bd_coupon_center` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_coupon_center` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_coupon_center` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_coupon_goods_relation`
--

DROP TABLE IF EXISTS `zjhj_bd_coupon_goods_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_coupon_goods_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_id` int(11) NOT NULL COMMENT '优惠券',
  `goods_warehouse_id` int(11) NOT NULL COMMENT '商品',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_coupon_goods_relation`
--

LOCK TABLES `zjhj_bd_coupon_goods_relation` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_coupon_goods_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_coupon_goods_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_coupon_mall_relation`
--

DROP TABLE IF EXISTS `zjhj_bd_coupon_mall_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_coupon_mall_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `user_coupon_id` int(11) NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除',
  PRIMARY KEY (`id`),
  KEY `mall_id` (`mall_id`),
  KEY `user_coupon_id` (`user_coupon_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_coupon_mall_relation`
--

LOCK TABLES `zjhj_bd_coupon_mall_relation` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_coupon_mall_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_coupon_mall_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_coupon_member_relation`
--

DROP TABLE IF EXISTS `zjhj_bd_coupon_member_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_coupon_member_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `coupon_id` int(11) NOT NULL COMMENT '优惠券id',
  `member_level` int(11) NOT NULL COMMENT '会员id',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除',
  `created_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_coupon_member_relation`
--

LOCK TABLES `zjhj_bd_coupon_member_relation` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_coupon_member_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_coupon_member_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_delivery`
--

DROP TABLE IF EXISTS `zjhj_bd_delivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_delivery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `mch_id` int(11) NOT NULL DEFAULT '0',
  `express_id` int(11) NOT NULL DEFAULT '0' COMMENT '快递公司id',
  `customer_account` varchar(255) NOT NULL DEFAULT '' COMMENT '电子面单客户账号',
  `customer_pwd` varchar(255) NOT NULL DEFAULT '' COMMENT '电子面单密码',
  `month_code` varchar(255) NOT NULL DEFAULT '' COMMENT '月结编码',
  `outlets_name` varchar(255) NOT NULL DEFAULT '' COMMENT '网点名称',
  `outlets_code` varchar(255) NOT NULL DEFAULT '' COMMENT '网点编码',
  `company` varchar(255) NOT NULL DEFAULT '' COMMENT '发件人公司',
  `name` varchar(255) NOT NULL COMMENT '发件人名称',
  `tel` varchar(255) NOT NULL DEFAULT '' COMMENT '发件人电话',
  `mobile` varchar(255) NOT NULL DEFAULT '' COMMENT '发件人手机',
  `zip_code` varchar(255) NOT NULL DEFAULT '' COMMENT '发件人邮政编码',
  `province` varchar(255) NOT NULL COMMENT '发件人省',
  `city` varchar(255) NOT NULL COMMENT '发件人市',
  `district` varchar(255) NOT NULL COMMENT '发件人区',
  `address` varchar(255) NOT NULL COMMENT '发件人详细地址',
  `is_sms` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否订阅短信',
  `template_size` varchar(255) NOT NULL DEFAULT '' COMMENT '快递鸟电子面单模板规格',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `goods_alias` varchar(255) NOT NULL DEFAULT '商品' COMMENT '自定义商品别名',
  `is_goods_alias` tinyint(1) NOT NULL DEFAULT '0' COMMENT '自定义商品别名开关',
  `is_goods` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否商品信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_delivery`
--

LOCK TABLES `zjhj_bd_delivery` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_delivery` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_delivery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_diy_ad_coupon`
--

DROP TABLE IF EXISTS `zjhj_bd_diy_ad_coupon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_diy_ad_coupon` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_coupon_id` int(11) NOT NULL,
  `is_delete` tinyint(2) NOT NULL DEFAULT '0' COMMENT '删除',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_diy_ad_coupon`
--

LOCK TABLES `zjhj_bd_diy_ad_coupon` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_diy_ad_coupon` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_diy_ad_coupon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_diy_ad_log`
--

DROP TABLE IF EXISTS `zjhj_bd_diy_ad_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_diy_ad_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `template_id` int(11) NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `raffled_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_diy_ad_log`
--

LOCK TABLES `zjhj_bd_diy_ad_log` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_diy_ad_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_diy_ad_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_diy_alone_page`
--

DROP TABLE IF EXISTS `zjhj_bd_diy_alone_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_diy_alone_page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `type` varchar(255) DEFAULT '' COMMENT '类型 auth--授权页面',
  `params` longtext COMMENT '参数',
  `is_delete` smallint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `is_open` smallint(1) DEFAULT '0' COMMENT '是否显示 0--不显示 1--显示',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_diy_alone_page`
--

LOCK TABLES `zjhj_bd_diy_alone_page` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_diy_alone_page` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_diy_alone_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_diy_coupon_log`
--

DROP TABLE IF EXISTS `zjhj_bd_diy_coupon_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_diy_coupon_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `template_id` int(11) NOT NULL,
  `user_coupon_id` int(11) NOT NULL,
  `is_delete` tinyint(2) NOT NULL DEFAULT '0' COMMENT '删除',
  `created_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_diy_coupon_log`
--

LOCK TABLES `zjhj_bd_diy_coupon_log` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_diy_coupon_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_diy_coupon_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_diy_form`
--

DROP TABLE IF EXISTS `zjhj_bd_diy_form`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_diy_form` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `form_data` longtext NOT NULL,
  `created_at` datetime NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `mall_id` (`mall_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='diy表单信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_diy_form`
--

LOCK TABLES `zjhj_bd_diy_form` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_diy_form` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_diy_form` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_diy_page`
--

DROP TABLE IF EXISTS `zjhj_bd_diy_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_diy_page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `show_navs` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否显示导航条：0=不显示，1=显示',
  `is_disable` tinyint(1) NOT NULL DEFAULT '0' COMMENT '禁用状态：0=启用，1=禁用',
  `is_home_page` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否是首页0--否 1--是',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `is_delete` (`is_delete`),
  KEY `mall_id` (`mall_id`),
  KEY `is_disable` (`is_disable`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_diy_page`
--

LOCK TABLES `zjhj_bd_diy_page` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_diy_page` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_diy_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_diy_page_nav`
--

DROP TABLE IF EXISTS `zjhj_bd_diy_page_nav`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_diy_page_nav` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `page_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `template_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_diy_page_nav`
--

LOCK TABLES `zjhj_bd_diy_page_nav` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_diy_page_nav` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_diy_page_nav` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_diy_template`
--

DROP TABLE IF EXISTS `zjhj_bd_diy_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_diy_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `data` longtext NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `type` varchar(100) NOT NULL DEFAULT '' COMMENT 'page:微页面',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_diy_template`
--

LOCK TABLES `zjhj_bd_diy_template` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_diy_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_diy_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_ecard`
--

DROP TABLE IF EXISTS `zjhj_bd_ecard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_ecard` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '卡密名称',
  `content` longtext COMMENT '使用说明',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `list` longtext NOT NULL COMMENT '卡密字段',
  `sales` int(11) NOT NULL DEFAULT '0' COMMENT '已售',
  `stock` int(11) NOT NULL DEFAULT '0' COMMENT '库存',
  `is_unique` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否去重 0--否 1--是',
  `pre_stock` int(11) NOT NULL DEFAULT '0' COMMENT '预占用的库存',
  `total_stock` int(11) NOT NULL DEFAULT '0' COMMENT '总库存',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='电子卡密';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_ecard`
--

LOCK TABLES `zjhj_bd_ecard` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_ecard` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_ecard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_ecard_data`
--

DROP TABLE IF EXISTS `zjhj_bd_ecard_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_ecard_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `ecard_id` int(11) NOT NULL,
  `token` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` longtext NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_ecard_data`
--

LOCK TABLES `zjhj_bd_ecard_data` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_ecard_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_ecard_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_ecard_log`
--

DROP TABLE IF EXISTS `zjhj_bd_ecard_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_ecard_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `ecard_id` int(11) NOT NULL DEFAULT '0',
  `status` varchar(255) NOT NULL DEFAULT '' COMMENT '日志操作 add--添加 occupy--占用 sales--卖出 delete--删除',
  `sign` varchar(255) NOT NULL DEFAULT '' COMMENT '插件标示',
  `number` int(11) NOT NULL DEFAULT '0' COMMENT '数量',
  `created_at` timestamp NOT NULL,
  `goods_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_ecard_log`
--

LOCK TABLES `zjhj_bd_ecard_log` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_ecard_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_ecard_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_ecard_options`
--

DROP TABLE IF EXISTS `zjhj_bd_ecard_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_ecard_options` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `token` varchar(255) NOT NULL DEFAULT '' COMMENT '加密字符串',
  `ecard_id` int(11) NOT NULL DEFAULT '0' COMMENT '电子卡密id',
  `value` longtext NOT NULL COMMENT '卡密字段值',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除',
  `is_sales` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否出售',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `is_occupy` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否被占用 0--否 1--是',
  PRIMARY KEY (`id`),
  KEY `e_card_id` (`ecard_id`),
  KEY `token` (`token`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='电子卡密数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_ecard_options`
--

LOCK TABLES `zjhj_bd_ecard_options` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_ecard_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_ecard_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_ecard_order`
--

DROP TABLE IF EXISTS `zjhj_bd_ecard_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_ecard_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `ecard_id` int(11) NOT NULL,
  `value` longtext NOT NULL,
  `order_id` int(11) NOT NULL,
  `order_detail_id` int(11) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `token` varchar(255) NOT NULL DEFAULT '' COMMENT '加密字符串',
  `ecard_options_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `order_token` varchar(255) NOT NULL DEFAULT '' COMMENT '订单token',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='卡密订单列表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_ecard_order`
--

LOCK TABLES `zjhj_bd_ecard_order` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_ecard_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_ecard_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_exchange_code`
--

DROP TABLE IF EXISTS `zjhj_bd_exchange_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_exchange_code` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `library_id` int(11) NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 后台 1礼品卡',
  `code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态开关 0禁用 1 启用 2 兑换 3结束',
  `validity_type` varchar(100) NOT NULL DEFAULT '',
  `valid_end_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `valid_start_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `r_user_id` int(11) NOT NULL DEFAULT '0',
  `r_raffled_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `r_rewards` longtext,
  `r_origin` varchar(100) NOT NULL DEFAULT '' COMMENT '兑换来源',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '后台联系人',
  `mobile` varchar(100) NOT NULL DEFAULT '' COMMENT '后台手机号码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_exchange_code`
--

LOCK TABLES `zjhj_bd_exchange_code` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_exchange_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_exchange_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_exchange_code_log`
--

DROP TABLE IF EXISTS `zjhj_bd_exchange_code_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_exchange_code_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `is_success` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否兑换成功',
  `code` varchar(255) NOT NULL DEFAULT '',
  `origin` varchar(100) NOT NULL COMMENT 'admin app',
  `remake` longtext COMMENT '简单说明',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_exchange_code_log`
--

LOCK TABLES `zjhj_bd_exchange_code_log` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_exchange_code_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_exchange_code_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_exchange_coupon_relation`
--

DROP TABLE IF EXISTS `zjhj_bd_exchange_coupon_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_exchange_coupon_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `code_id` int(11) NOT NULL,
  `user_coupon_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_exchange_coupon_relation`
--

LOCK TABLES `zjhj_bd_exchange_coupon_relation` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_exchange_coupon_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_exchange_coupon_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_exchange_goods`
--

DROP TABLE IF EXISTS `zjhj_bd_exchange_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_exchange_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `library_id` int(11) NOT NULL DEFAULT '0',
  `goods_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_exchange_goods`
--

LOCK TABLES `zjhj_bd_exchange_goods` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_exchange_goods` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_exchange_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_exchange_library`
--

DROP TABLE IF EXISTS `zjhj_bd_exchange_library`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_exchange_library` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL COMMENT '名称',
  `remark` longtext COMMENT '说明',
  `expire_type` varchar(100) NOT NULL DEFAULT 'all' COMMENT 'all 永久 fixed 固定 relatively相对',
  `expire_start_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '固定开始',
  `expire_end_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '固定开始',
  `expire_start_day` int(10) NOT NULL DEFAULT '0' COMMENT '相对开始',
  `expire_end_day` int(10) NOT NULL DEFAULT '0' COMMENT '相对结束',
  `mode` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 全部 1 份',
  `code_format` varchar(100) NOT NULL DEFAULT 'english_num' COMMENT 'english_num, num',
  `rewards` longtext NOT NULL COMMENT '奖励品',
  `rewards_s` varchar(255) NOT NULL COMMENT '奖励品类型 后台搜索使用',
  `is_recycle` tinyint(1) NOT NULL COMMENT '是否加入回收站',
  `recycle_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_exchange_library`
--

LOCK TABLES `zjhj_bd_exchange_library` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_exchange_library` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_exchange_library` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_exchange_order`
--

DROP TABLE IF EXISTS `zjhj_bd_exchange_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_exchange_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `exchange_id` int(11) NOT NULL,
  `code_id` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_exchange_order`
--

LOCK TABLES `zjhj_bd_exchange_order` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_exchange_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_exchange_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_exchange_record_order`
--

DROP TABLE IF EXISTS `zjhj_bd_exchange_record_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_exchange_record_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `token` varchar(255) NOT NULL,
  `code_id` int(11) NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_exchange_record_order`
--

LOCK TABLES `zjhj_bd_exchange_record_order` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_exchange_record_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_exchange_record_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_exchange_reward_result`
--

DROP TABLE IF EXISTS `zjhj_bd_exchange_reward_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_exchange_reward_result` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `code_token` varchar(255) NOT NULL DEFAULT '',
  `token` varchar(32) NOT NULL DEFAULT '',
  `data` longtext NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_exchange_reward_result`
--

LOCK TABLES `zjhj_bd_exchange_reward_result` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_exchange_reward_result` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_exchange_reward_result` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_exchange_svip_order`
--

DROP TABLE IF EXISTS `zjhj_bd_exchange_svip_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_exchange_svip_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `code_id` int(11) NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_exchange_svip_order`
--

LOCK TABLES `zjhj_bd_exchange_svip_order` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_exchange_svip_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_exchange_svip_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_favorite`
--

DROP TABLE IF EXISTS `zjhj_bd_favorite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_favorite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `goods_id` int(11) NOT NULL DEFAULT '0',
  `mirror_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '收藏时的售价',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `is_delete` int(11) NOT NULL DEFAULT '0',
  `deleted_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `is_delete` (`is_delete`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_favorite`
--

LOCK TABLES `zjhj_bd_favorite` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_favorite` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_favorite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_finance`
--

DROP TABLE IF EXISTS `zjhj_bd_finance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_finance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `order_no` varchar(255) NOT NULL DEFAULT '' COMMENT '订单号',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '提现金额',
  `service_charge` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '提现手续费（%）',
  `type` varchar(255) NOT NULL DEFAULT '' COMMENT '提现方式 auto--自动打款 wechat--微信打款 alipay--支付宝打款 bank--银行转账 balance--打款到余额',
  `extra` longtext COMMENT '额外信息 例如微信账号、支付宝账号等',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '提现状态 0--申请 1--同意 2--已打款 3--驳回',
  `is_delete` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL,
  `content` longtext,
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '真实姓名',
  `model` varchar(255) NOT NULL DEFAULT '' COMMENT '提现插件(share,bonus,stock,region,mch)',
  `transfer_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0.待转账 | 1.已转账  | 2.拒绝转账',
  `phone` varchar(255) NOT NULL DEFAULT '' COMMENT '手机号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='提现记录汇总表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_finance`
--

LOCK TABLES `zjhj_bd_finance` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_finance` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_finance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_flash_sale_activity`
--

DROP TABLE IF EXISTS `zjhj_bd_flash_sale_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_flash_sale_activity` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '状态 0下架 1上架',
  `is_delete` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '活动标题',
  `start_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '活动开始时间',
  `end_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '活动结束时间',
  `notice` int(11) NOT NULL DEFAULT '0' COMMENT '活动预告',
  `notice_hours` int(11) NOT NULL DEFAULT '0' COMMENT '提前N小时',
  PRIMARY KEY (`id`),
  KEY `idx_1` (`mall_id`,`is_delete`,`created_at`) USING BTREE,
  KEY `sort` (`start_at`,`end_at`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='显示购买活动';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_flash_sale_activity`
--

LOCK TABLES `zjhj_bd_flash_sale_activity` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_flash_sale_activity` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_flash_sale_activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_flash_sale_goods`
--

DROP TABLE IF EXISTS `zjhj_bd_flash_sale_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_flash_sale_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL COMMENT '状态 0 关闭 1开启',
  `goods_id` int(11) NOT NULL DEFAULT '0',
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1打折  2减钱  3促销价',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `activity_id` int(11) NOT NULL DEFAULT '0' COMMENT '活动id',
  `sort` int(11) NOT NULL DEFAULT '100' COMMENT '排序',
  PRIMARY KEY (`id`),
  KEY `activity` (`activity_id`) USING BTREE,
  KEY `goods_id` (`goods_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='限时抢购商品表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_flash_sale_goods`
--

LOCK TABLES `zjhj_bd_flash_sale_goods` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_flash_sale_goods` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_flash_sale_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_flash_sale_goods_attr`
--

DROP TABLE IF EXISTS `zjhj_bd_flash_sale_goods_attr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_flash_sale_goods_attr` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `discount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '商品折扣',
  `cut` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '商品减钱',
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1打折  2减钱  3促销价',
  `goods_id` int(11) NOT NULL,
  `goods_attr_id` int(11) NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='显示购买商品规格';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_flash_sale_goods_attr`
--

LOCK TABLES `zjhj_bd_flash_sale_goods_attr` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_flash_sale_goods_attr` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_flash_sale_goods_attr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_flash_sale_order_discount`
--

DROP TABLE IF EXISTS `zjhj_bd_flash_sale_order_discount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_flash_sale_order_discount` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL COMMENT '订单id',
  `discount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '优惠金额',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_flash_sale_order_discount`
--

LOCK TABLES `zjhj_bd_flash_sale_order_discount` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_flash_sale_order_discount` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_flash_sale_order_discount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_footprint_data_log`
--

DROP TABLE IF EXISTS `zjhj_bd_footprint_data_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_footprint_data_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `key` varchar(60) NOT NULL,
  `value` varchar(60) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  `statistics_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '上一次统计的时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_footprint_data_log`
--

LOCK TABLES `zjhj_bd_footprint_data_log` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_footprint_data_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_footprint_data_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_footprint_goods_log`
--

DROP TABLE IF EXISTS `zjhj_bd_footprint_goods_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_footprint_goods_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `goods_id` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `is_delete` (`is_delete`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_footprint_goods_log`
--

LOCK TABLES `zjhj_bd_footprint_goods_log` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_footprint_goods_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_footprint_goods_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_form`
--

DROP TABLE IF EXISTS `zjhj_bd_form`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_form` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL DEFAULT '0',
  `mch_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否启用',
  `data` longtext COMMENT '表单内容',
  `is_default` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否默认',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `value` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mall_id` (`mall_id`),
  KEY `mch_id` (`mch_id`),
  KEY `is_default` (`is_default`),
  KEY `status` (`status`),
  KEY `is_delete` (`is_delete`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_form`
--

LOCK TABLES `zjhj_bd_form` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_form` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_form` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_formid`
--

DROP TABLE IF EXISTS `zjhj_bd_formid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_formid` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `form_id` varchar(1000) NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `remains` int(11) NOT NULL COMMENT '剩余次数',
  `expired_at` timestamp NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `created_at` (`created_at`),
  KEY `remains` (`remains`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_formid`
--

LOCK TABLES `zjhj_bd_formid` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_formid` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_formid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_free_delivery_rules`
--

DROP TABLE IF EXISTS `zjhj_bd_free_delivery_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_free_delivery_rules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `mch_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `detail` longtext NOT NULL,
  `is_delete` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_free_delivery_rules`
--

LOCK TABLES `zjhj_bd_free_delivery_rules` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_free_delivery_rules` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_free_delivery_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_fxhb_activity`
--

DROP TABLE IF EXISTS `zjhj_bd_fxhb_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_fxhb_activity` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否开启活动：0.关闭|1.开启',
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '红包分配方式：1.随机|2.平均',
  `number` int(11) NOT NULL COMMENT '拆包人数',
  `count_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '红包总金额',
  `least_price` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '最低消费金额',
  `effective_time` int(11) NOT NULL COMMENT '代金券有效期',
  `open_effective_time` int(11) NOT NULL COMMENT '拆红包有效期',
  `coupon_type` tinyint(1) NOT NULL COMMENT '代金券使用场景：1.指定分类|2.指定商品|3.全场通用',
  `sponsor_num` int(11) NOT NULL DEFAULT '-1' COMMENT '该用户可发起活动的次数',
  `help_num` int(11) NOT NULL DEFAULT '-1' COMMENT '帮拆的次数',
  `sponsor_count` int(11) NOT NULL DEFAULT '-1' COMMENT '此活动可发红包总次数',
  `sponsor_count_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '次数扣除方式：0.活动成功扣除|1.活动发起就扣除',
  `start_time` timestamp NOT NULL COMMENT '活动开始时间',
  `end_time` timestamp NOT NULL COMMENT '活动结束时间',
  `remark` text NOT NULL COMMENT '活动规则 ',
  `pic_url` varchar(255) NOT NULL DEFAULT '' COMMENT '活动图片',
  `share_title` text NOT NULL COMMENT '分享标题',
  `share_pic_url` varchar(255) NOT NULL DEFAULT '' COMMENT '分享图片',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  `deleted_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `mall_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL COMMENT '活动名称',
  `is_home_model` tinyint(1) NOT NULL DEFAULT '0' COMMENT '首页弹窗开关',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_fxhb_activity`
--

LOCK TABLES `zjhj_bd_fxhb_activity` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_fxhb_activity` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_fxhb_activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_fxhb_activity_cat_relation`
--

DROP TABLE IF EXISTS `zjhj_bd_fxhb_activity_cat_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_fxhb_activity_cat_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) NOT NULL COMMENT '活动ID',
  `cat_id` int(11) NOT NULL COMMENT '分类',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_fxhb_activity_cat_relation`
--

LOCK TABLES `zjhj_bd_fxhb_activity_cat_relation` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_fxhb_activity_cat_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_fxhb_activity_cat_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_fxhb_activity_goods_relation`
--

DROP TABLE IF EXISTS `zjhj_bd_fxhb_activity_goods_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_fxhb_activity_goods_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) NOT NULL COMMENT '活动ID',
  `goods_warehouse_id` int(11) NOT NULL COMMENT '商品',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_fxhb_activity_goods_relation`
--

LOCK TABLES `zjhj_bd_fxhb_activity_goods_relation` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_fxhb_activity_goods_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_fxhb_activity_goods_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_fxhb_user_activity`
--

DROP TABLE IF EXISTS `zjhj_bd_fxhb_user_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_fxhb_user_activity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `fxhb_activity_id` int(11) NOT NULL COMMENT '活动ID',
  `number` int(11) NOT NULL COMMENT '拆包人数',
  `count_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '红包总金额',
  `created_at` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `is_delete` tinyint(1) NOT NULL,
  `updated_at` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `data` longtext NOT NULL COMMENT '活动发起时活动的设置',
  `status` tinyint(1) NOT NULL COMMENT '状态0--进行中 1--成功 2--失败',
  `mall_id` int(11) NOT NULL,
  `token` varchar(255) NOT NULL,
  `user_coupon_id` int(11) NOT NULL,
  `get_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '拆红包获得的金额',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户参与红包';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_fxhb_user_activity`
--

LOCK TABLES `zjhj_bd_fxhb_user_activity` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_fxhb_user_activity` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_fxhb_user_activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_gift_log`
--

DROP TABLE IF EXISTS `zjhj_bd_gift_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_gift_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `num` int(11) NOT NULL DEFAULT '0' COMMENT '礼物总数',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  `is_confirm` tinyint(1) NOT NULL DEFAULT '0' COMMENT '送礼状态：0.未完成送礼|1.已完成送礼',
  `type` varchar(60) CHARACTER SET utf8 NOT NULL COMMENT '送礼方式',
  `open_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '开奖时间',
  `open_num` int(11) NOT NULL DEFAULT '0' COMMENT '开奖所需人数',
  `open_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0一人拿奖，1多人各领一份奖',
  `bless_word` varchar(200) NOT NULL COMMENT '祝福语',
  `bless_music` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '祝福语音',
  `auto_refund_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '自动退款时间',
  `is_pay` tinyint(1) NOT NULL DEFAULT '0',
  `order_id` int(11) NOT NULL DEFAULT '0',
  `is_cancel` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_gift_log`
--

LOCK TABLES `zjhj_bd_gift_log` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_gift_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_gift_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_gift_lottery`
--

DROP TABLE IF EXISTS `zjhj_bd_gift_lottery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_gift_lottery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL DEFAULT '0',
  `send_order_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  `is_prize` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0未中，1中奖',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_gift_lottery`
--

LOCK TABLES `zjhj_bd_gift_lottery` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_gift_lottery` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_gift_lottery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_gift_open_result`
--

DROP TABLE IF EXISTS `zjhj_bd_gift_open_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_gift_open_result` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(32) NOT NULL,
  `data` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_gift_open_result`
--

LOCK TABLES `zjhj_bd_gift_open_result` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_gift_open_result` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_gift_open_result` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_gift_order`
--

DROP TABLE IF EXISTS `zjhj_bd_gift_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_gift_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL DEFAULT '0',
  `order_no` varchar(255) NOT NULL DEFAULT '',
  `goods_id` int(11) NOT NULL DEFAULT '0',
  `goods_attr_id` int(11) NOT NULL DEFAULT '0',
  `num` int(11) NOT NULL DEFAULT '0',
  `order_id` int(11) NOT NULL DEFAULT '0' COMMENT '商城订单ID',
  `type` varchar(60) NOT NULL COMMENT '送礼方式',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  `user_order_id` int(11) NOT NULL DEFAULT '0',
  `is_refund` tinyint(1) NOT NULL DEFAULT '0' COMMENT '退款，前端显示超时',
  `buy_order_detail_id` int(11) NOT NULL DEFAULT '0' COMMENT '买礼物的商城订单详情id',
  `gift_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_gift_order`
--

LOCK TABLES `zjhj_bd_gift_order` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_gift_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_gift_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_gift_order_submit_result`
--

DROP TABLE IF EXISTS `zjhj_bd_gift_order_submit_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_gift_order_submit_result` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(32) NOT NULL,
  `data` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_gift_order_submit_result`
--

LOCK TABLES `zjhj_bd_gift_order_submit_result` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_gift_order_submit_result` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_gift_order_submit_result` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_gift_send_order`
--

DROP TABLE IF EXISTS `zjhj_bd_gift_send_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_gift_send_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL DEFAULT '0',
  `mch_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `gift_id` int(11) NOT NULL DEFAULT '0' COMMENT 'gift_log的id',
  `order_no` varchar(60) NOT NULL DEFAULT '',
  `total_price` decimal(10,2) NOT NULL COMMENT '订单总金额(含运费)',
  `total_pay_price` decimal(10,2) NOT NULL COMMENT '实际支付总费用(含运费）',
  `is_pay` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否支付：0.未支付|1.已支付',
  `pay_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '支付方式：1.在线支付 2.货到付款 3.余额支付',
  `pay_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '支付时间',
  `is_refund` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0未退款，1已退款',
  `is_confirm` tinyint(1) NOT NULL DEFAULT '0' COMMENT '送礼状态：0.未完成送礼|1.已完成送礼',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  `support_pay_types` text NOT NULL COMMENT '支持的支付方式，空表示支持系统设置支持的所有方式',
  `token` varchar(32) NOT NULL,
  `total_goods_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `total_goods_original_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `member_discount_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `use_user_coupon_id` int(11) NOT NULL DEFAULT '0',
  `coupon_discount_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `use_integral_num` int(11) NOT NULL DEFAULT '0',
  `integral_deduction_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `is_cancel` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_gift_send_order`
--

LOCK TABLES `zjhj_bd_gift_send_order` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_gift_send_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_gift_send_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_gift_send_order_detail`
--

DROP TABLE IF EXISTS `zjhj_bd_gift_send_order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_gift_send_order_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `send_order_id` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `goods_attr_id` int(11) NOT NULL DEFAULT '0',
  `goods_info` longtext COMMENT '购买商品信息',
  `num` int(11) NOT NULL,
  `unit_price` decimal(10,2) NOT NULL COMMENT '商品单价',
  `total_original_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '商品原总价(优惠前)',
  `total_price` decimal(10,2) NOT NULL COMMENT '商品总价(优惠后)',
  `member_discount_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `is_refund` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0未退款，1已退款',
  `refund_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '售后状态 0--未售后 1--售后中 2--售后结束',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  `receive_num` int(11) NOT NULL DEFAULT '0' COMMENT '已领取数量',
  `refund_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_gift_send_order_detail`
--

LOCK TABLES `zjhj_bd_gift_send_order_detail` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_gift_send_order_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_gift_send_order_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_gift_setting`
--

DROP TABLE IF EXISTS `zjhj_bd_gift_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_gift_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(200) NOT NULL,
  `type` varchar(200) NOT NULL DEFAULT '[]' COMMENT '玩法',
  `auto_refund` int(11) NOT NULL DEFAULT '0' COMMENT '自动退款天数',
  `auto_remind` int(11) NOT NULL DEFAULT '0' COMMENT '送礼失败提醒天数',
  `bless_word` varchar(200) NOT NULL COMMENT '祝福语',
  `ask_gift` varchar(200) NOT NULL COMMENT '求礼物',
  `is_share` tinyint(1) NOT NULL DEFAULT '0',
  `is_sms` tinyint(1) NOT NULL DEFAULT '0',
  `is_mail` tinyint(1) NOT NULL DEFAULT '0',
  `is_print` tinyint(1) NOT NULL DEFAULT '0',
  `payment_type` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  `poster` longtext NOT NULL COMMENT '海报',
  `background` varchar(200) NOT NULL DEFAULT '[]' COMMENT '自定义背景',
  `theme` text NOT NULL COMMENT '主题色',
  `send_type` varchar(200) NOT NULL DEFAULT '[]',
  `explain` text NOT NULL COMMENT '规则说明',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_gift_setting`
--

LOCK TABLES `zjhj_bd_gift_setting` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_gift_setting` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_gift_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_gift_user_order`
--

DROP TABLE IF EXISTS `zjhj_bd_gift_user_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_gift_user_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `gift_id` int(11) NOT NULL DEFAULT '0',
  `is_turn` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否转赠0未转1已转',
  `turn_no` varchar(255) NOT NULL DEFAULT '' COMMENT '转赠码',
  `turn_user_id` int(11) NOT NULL DEFAULT '0' COMMENT '被转赠用户ID',
  `is_receive` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0未领取，1已领取',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  `is_win` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0未中，1已中',
  `token` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_gift_user_order`
--

LOCK TABLES `zjhj_bd_gift_user_order` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_gift_user_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_gift_user_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_goods`
--

DROP TABLE IF EXISTS `zjhj_bd_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `mch_id` int(11) NOT NULL DEFAULT '0',
  `goods_warehouse_id` int(11) NOT NULL,
  `status` smallint(1) NOT NULL DEFAULT '0' COMMENT '上架状态：0=下架，1=上架',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '售价',
  `use_attr` smallint(1) NOT NULL DEFAULT '1' COMMENT '是否使用规格：0=不使用，1=使用',
  `attr_groups` text CHARACTER SET utf8 NOT NULL COMMENT '商品规格组',
  `goods_stock` int(11) NOT NULL DEFAULT '0' COMMENT '商品库存',
  `virtual_sales` int(11) NOT NULL DEFAULT '0' COMMENT '已出售量',
  `confine_count` int(11) NOT NULL DEFAULT '-1' COMMENT '购物数量限制',
  `pieces` int(11) NOT NULL DEFAULT '0' COMMENT '单品满件包邮',
  `forehead` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '单口满额包邮',
  `freight_id` int(11) NOT NULL COMMENT '运费模板ID',
  `give_integral` int(11) NOT NULL DEFAULT '0' COMMENT '赠送积分',
  `give_integral_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '赠送积分类型1.固定值 |2.百分比',
  `give_balance` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '赠送余额',
  `give_balance_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '赠送余额类型1.固定值 |2.百分比',
  `forehead_integral` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '可抵扣积分',
  `forehead_integral_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '可抵扣积分类型1.固定值 |2.百分比',
  `accumulative` tinyint(1) NOT NULL DEFAULT '0' COMMENT '允许多件累计折扣',
  `individual_share` smallint(1) NOT NULL DEFAULT '0' COMMENT '是否单独分销设置：0=否，1=是',
  `attr_setting_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '分销设置类型 0.普通设置|1.详细设置',
  `is_level` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否享受会员价购买',
  `is_level_alone` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否单独设置会员价',
  `share_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '佣金配比 0--固定金额 1--百分比',
  `sign` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '商品标示用于区分商品属于什么模块',
  `app_share_pic` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '自定义分享图片',
  `app_share_title` varchar(65) NOT NULL DEFAULT '' COMMENT '自定义分享标题',
  `is_default_services` tinyint(1) NOT NULL DEFAULT '1' COMMENT '默认服务 0.否|1.是',
  `sort` int(11) NOT NULL DEFAULT '100' COMMENT '排序',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  `payment_people` int(11) NOT NULL DEFAULT '0' COMMENT '支付人数',
  `payment_num` int(11) NOT NULL DEFAULT '0' COMMENT '支付件数',
  `payment_amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '支付金额',
  `payment_order` int(11) NOT NULL DEFAULT '0' COMMENT '支付订单数',
  `confine_order_count` int(11) NOT NULL DEFAULT '-1',
  `is_area_limit` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否单独区域购买',
  `area_limit` longtext COMMENT '区域限制',
  `form_id` int(11) NOT NULL DEFAULT '0' COMMENT '自定义表单id 0--表示默认表单 -1--表示不使用表单',
  `sales` int(11) NOT NULL DEFAULT '0' COMMENT '商品实际销量',
  PRIMARY KEY (`id`),
  KEY `mall_id` (`mall_id`),
  KEY `goods_warehouse_id` (`goods_warehouse_id`),
  KEY `sign` (`sign`),
  KEY `index1` (`mall_id`,`is_delete`,`sign`,`status`,`goods_warehouse_id`),
  KEY `index2` (`is_delete`,`mall_id`,`status`),
  KEY `status` (`status`),
  KEY `is_delete` (`is_delete`),
  KEY `sort` (`sort`),
  KEY `created_at` (`created_at`),
  KEY `sales` (`sales`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='商品通用信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_goods`
--

LOCK TABLES `zjhj_bd_goods` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_goods` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_goods_attr`
--

DROP TABLE IF EXISTS `zjhj_bd_goods_attr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_goods_attr` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL,
  `sign_id` varchar(255) NOT NULL DEFAULT '' COMMENT '规格ID标识',
  `stock` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '库存',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '价格',
  `no` varchar(255) NOT NULL DEFAULT '' COMMENT '货号',
  `weight` int(11) NOT NULL DEFAULT '0' COMMENT '重量（克）',
  `pic_url` varchar(255) NOT NULL DEFAULT '' COMMENT '规格图片',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `goods_id` (`goods_id`),
  KEY `is_delete` (`is_delete`),
  KEY `index1` (`is_delete`,`goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_goods_attr`
--

LOCK TABLES `zjhj_bd_goods_attr` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_goods_attr` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_goods_attr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_goods_attr_template`
--

DROP TABLE IF EXISTS `zjhj_bd_goods_attr_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_goods_attr_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `mch_id` int(11) NOT NULL DEFAULT '0',
  `attr_group_name` varchar(255) NOT NULL DEFAULT '' COMMENT '规格名',
  `attr_group_id` int(11) NOT NULL DEFAULT '0' COMMENT '规格组',
  `attr_list` longtext NOT NULL COMMENT '规格值',
  `select_attr_list` longtext NOT NULL COMMENT '后台 搜索用的',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_goods_attr_template`
--

LOCK TABLES `zjhj_bd_goods_attr_template` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_goods_attr_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_goods_attr_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_goods_card_clerk_log`
--

DROP TABLE IF EXISTS `zjhj_bd_goods_card_clerk_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_goods_card_clerk_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_card_id` int(11) NOT NULL COMMENT '用户卡券ID',
  `clerk_id` int(11) NOT NULL COMMENT '核销员ID',
  `store_id` int(11) NOT NULL COMMENT '核销门店ID',
  `use_number` int(11) NOT NULL COMMENT '核销次数',
  `surplus_number` int(11) NOT NULL COMMENT '剩余次数',
  `clerked_at` timestamp NOT NULL COMMENT '核销时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_goods_card_clerk_log`
--

LOCK TABLES `zjhj_bd_goods_card_clerk_log` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_goods_card_clerk_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_goods_card_clerk_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_goods_card_relation`
--

DROP TABLE IF EXISTS `zjhj_bd_goods_card_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_goods_card_relation` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL,
  `card_id` int(11) NOT NULL,
  `is_delete` int(11) NOT NULL DEFAULT '0',
  `num` int(11) NOT NULL DEFAULT '1' COMMENT '卡券数量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_goods_card_relation`
--

LOCK TABLES `zjhj_bd_goods_card_relation` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_goods_card_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_goods_card_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_goods_cards`
--

DROP TABLE IF EXISTS `zjhj_bd_goods_cards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_goods_cards` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `mch_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(65) NOT NULL DEFAULT '',
  `pic_url` varchar(255) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `expire_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '到期类型：1=领取后N天过期，2=指定有效期',
  `expire_day` int(11) NOT NULL DEFAULT '0' COMMENT '有效天数',
  `begin_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '有效期开始时间',
  `end_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '有效期结束时间',
  `total_count` int(11) NOT NULL DEFAULT '-1' COMMENT '卡券数量',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `is_delete` int(11) NOT NULL DEFAULT '0',
  `number` int(11) NOT NULL DEFAULT '1' COMMENT '卡券可核销总次数',
  `app_share_title` varchar(255) NOT NULL DEFAULT '',
  `app_share_pic` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_goods_cards`
--

LOCK TABLES `zjhj_bd_goods_cards` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_goods_cards` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_goods_cards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_goods_cat_relation`
--

DROP TABLE IF EXISTS `zjhj_bd_goods_cat_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_goods_cat_relation` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `goods_warehouse_id` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `goods_warehouse_id` (`goods_warehouse_id`),
  KEY `cat_id` (`cat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_goods_cat_relation`
--

LOCK TABLES `zjhj_bd_goods_cat_relation` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_goods_cat_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_goods_cat_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_goods_cats`
--

DROP TABLE IF EXISTS `zjhj_bd_goods_cats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_goods_cats` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `mch_id` int(11) NOT NULL DEFAULT '0',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT '父级ID',
  `name` varchar(45) NOT NULL DEFAULT '' COMMENT '分类名称',
  `pic_url` varchar(255) NOT NULL DEFAULT '',
  `sort` int(11) NOT NULL DEFAULT '100' COMMENT '排序，升序',
  `big_pic_url` varchar(255) NOT NULL DEFAULT '',
  `advert_pic` varchar(255) NOT NULL DEFAULT '' COMMENT '广告图片',
  `advert_url` varchar(255) NOT NULL DEFAULT '' COMMENT '广告链接',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否启用:0.禁用|1.启用',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  `is_show` tinyint(1) DEFAULT '1',
  `advert_open_type` varchar(65) NOT NULL DEFAULT '' COMMENT '打开方式',
  `advert_params` text NOT NULL COMMENT '导航参数',
  PRIMARY KEY (`id`),
  KEY `index1` (`is_delete`,`status`,`is_show`,`mch_id`,`mall_id`),
  KEY `mall_id` (`mall_id`),
  KEY `mch_id` (`mch_id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_goods_cats`
--

LOCK TABLES `zjhj_bd_goods_cats` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_goods_cats` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_goods_cats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_goods_coupon_relation`
--

DROP TABLE IF EXISTS `zjhj_bd_goods_coupon_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_goods_coupon_relation` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL,
  `coupon_id` int(11) NOT NULL,
  `num` int(11) NOT NULL DEFAULT '1',
  `is_delete` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='商品赠送优惠券信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_goods_coupon_relation`
--

LOCK TABLES `zjhj_bd_goods_coupon_relation` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_goods_coupon_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_goods_coupon_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_goods_member_price`
--

DROP TABLE IF EXISTS `zjhj_bd_goods_member_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_goods_member_price` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `level` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `goods_attr_id` int(11) NOT NULL,
  `is_delete` tinyint(4) NOT NULL DEFAULT '0',
  `goods_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `goods_attr_id` (`goods_attr_id`),
  KEY `index1` (`is_delete`,`goods_id`,`level`),
  KEY `goods_id` (`goods_id`),
  KEY `is_delete` (`is_delete`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_goods_member_price`
--

LOCK TABLES `zjhj_bd_goods_member_price` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_goods_member_price` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_goods_member_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_goods_service_relation`
--

DROP TABLE IF EXISTS `zjhj_bd_goods_service_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_goods_service_relation` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `service_id` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index1` (`goods_id`,`is_delete`) USING BTREE,
  KEY `index2` (`service_id`,`is_delete`) USING BTREE,
  KEY `service_id` (`service_id`),
  KEY `goods_id` (`goods_id`),
  KEY `is_delete` (`is_delete`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_goods_service_relation`
--

LOCK TABLES `zjhj_bd_goods_service_relation` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_goods_service_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_goods_service_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_goods_services`
--

DROP TABLE IF EXISTS `zjhj_bd_goods_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_goods_services` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `mch_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(65) NOT NULL DEFAULT '' COMMENT '服务名称',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注、描述',
  `sort` int(11) NOT NULL DEFAULT '100',
  `is_default` tinyint(1) NOT NULL DEFAULT '0' COMMENT '默认服务',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_goods_services`
--

LOCK TABLES `zjhj_bd_goods_services` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_goods_services` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_goods_services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_goods_share`
--

DROP TABLE IF EXISTS `zjhj_bd_goods_share`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_goods_share` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `share_commission_first` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '一级分销佣金比例',
  `share_commission_second` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '二级分销佣金比例',
  `share_commission_third` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '三级分销佣金比例',
  `goods_id` int(11) NOT NULL,
  `goods_attr_id` int(11) NOT NULL DEFAULT '0',
  `is_delete` tinyint(4) NOT NULL DEFAULT '0',
  `level` int(11) NOT NULL DEFAULT '0' COMMENT '分销商等级',
  PRIMARY KEY (`id`),
  KEY `goods_attr_id` (`goods_attr_id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_goods_share`
--

LOCK TABLES `zjhj_bd_goods_share` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_goods_share` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_goods_share` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_goods_warehouse`
--

DROP TABLE IF EXISTS `zjhj_bd_goods_warehouse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_goods_warehouse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL COMMENT '商品名称',
  `original_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '原价',
  `cost_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '成本价',
  `detail` longtext NOT NULL COMMENT '商品详情，图文',
  `cover_pic` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '商品缩略图',
  `pic_url` text CHARACTER SET utf8 NOT NULL COMMENT '商品轮播图',
  `video_url` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '商品视频',
  `unit` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '件' COMMENT '单位',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  `type` varchar(255) NOT NULL DEFAULT 'goods' COMMENT '商品类型：goods--实体商品 ecard--电子卡密',
  `ecard_id` int(11) NOT NULL DEFAULT '0' COMMENT '卡密id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `store_id` (`mall_id`) USING BTREE,
  KEY `mall_id` (`mall_id`),
  KEY `is_delete` (`is_delete`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='商品';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_goods_warehouse`
--

LOCK TABLES `zjhj_bd_goods_warehouse` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_goods_warehouse` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_goods_warehouse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_home_block`
--

DROP TABLE IF EXISTS `zjhj_bd_home_block`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_home_block` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `name` varchar(65) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '样式类型：1.默认|2.样式一|3.样式二',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_home_block`
--

LOCK TABLES `zjhj_bd_home_block` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_home_block` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_home_block` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_home_nav`
--

DROP TABLE IF EXISTS `zjhj_bd_home_nav`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_home_nav` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `name` varchar(65) NOT NULL DEFAULT '' COMMENT '导航名称',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '导航链接',
  `open_type` varchar(65) NOT NULL DEFAULT '' COMMENT '打开方式',
  `icon_url` varchar(255) NOT NULL DEFAULT '' COMMENT '导航图标',
  `sort` int(11) NOT NULL DEFAULT '100' COMMENT '排序',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态：0.隐藏|1.显示',
  `params` text NOT NULL COMMENT '导航参数',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  `sign` varchar(65) NOT NULL DEFAULT '' COMMENT '插件标识',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_home_nav`
--

LOCK TABLES `zjhj_bd_home_nav` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_home_nav` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_home_nav` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_import_data`
--

DROP TABLE IF EXISTS `zjhj_bd_import_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_import_data` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `mch_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL COMMENT '操作账户ID',
  `status` tinyint(4) NOT NULL COMMENT '导入状态|1.全部失败|2.部分失败|3.全部成功',
  `file_name` varchar(191) NOT NULL DEFAULT '' COMMENT '导入文件名',
  `count` int(11) NOT NULL COMMENT '导入总数量',
  `success_count` int(11) NOT NULL,
  `error_count` int(11) NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `is_delete` int(11) NOT NULL DEFAULT '0',
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1.商品导入|2.分类导入',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_import_data`
--

LOCK TABLES `zjhj_bd_import_data` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_import_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_import_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_integral_log`
--

DROP TABLE IF EXISTS `zjhj_bd_integral_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_integral_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `type` tinyint(1) NOT NULL COMMENT '类型：1=收入，2=支出',
  `integral` int(11) NOT NULL COMMENT '变动积分',
  `desc` varchar(255) NOT NULL DEFAULT '' COMMENT '变动说明',
  `custom_desc` longtext NOT NULL COMMENT '自定义详细说明|记录',
  `order_no` varchar(255) NOT NULL DEFAULT '' COMMENT '订单号',
  `created_at` timestamp NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mall_id` (`mall_id`),
  KEY `user_id` (`user_id`),
  KEY `type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_integral_log`
--

LOCK TABLES `zjhj_bd_integral_log` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_integral_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_integral_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_integral_mall_banners`
--

DROP TABLE IF EXISTS `zjhj_bd_integral_mall_banners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_integral_mall_banners` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `banner_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `is_delete` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_integral_mall_banners`
--

LOCK TABLES `zjhj_bd_integral_mall_banners` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_integral_mall_banners` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_integral_mall_banners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_integral_mall_cats`
--

DROP TABLE IF EXISTS `zjhj_bd_integral_mall_cats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_integral_mall_cats` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `sort` int(11) NOT NULL DEFAULT '100',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_integral_mall_cats`
--

LOCK TABLES `zjhj_bd_integral_mall_cats` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_integral_mall_cats` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_integral_mall_cats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_integral_mall_coupon_order_submit_result`
--

DROP TABLE IF EXISTS `zjhj_bd_integral_mall_coupon_order_submit_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_integral_mall_coupon_order_submit_result` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `token` varchar(32) NOT NULL DEFAULT '',
  `data` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_integral_mall_coupon_order_submit_result`
--

LOCK TABLES `zjhj_bd_integral_mall_coupon_order_submit_result` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_integral_mall_coupon_order_submit_result` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_integral_mall_coupon_order_submit_result` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_integral_mall_coupons`
--

DROP TABLE IF EXISTS `zjhj_bd_integral_mall_coupons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_integral_mall_coupons` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `coupon_id` int(11) NOT NULL,
  `exchange_num` int(11) NOT NULL DEFAULT '-1' COMMENT '兑换次数-1.不限制',
  `integral_num` int(11) NOT NULL COMMENT '所需兑换积分',
  `send_count` int(11) NOT NULL COMMENT '发放优惠券总数',
  `price` decimal(10,2) NOT NULL COMMENT '价格',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_integral_mall_coupons`
--

LOCK TABLES `zjhj_bd_integral_mall_coupons` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_integral_mall_coupons` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_integral_mall_coupons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_integral_mall_coupons_orders`
--

DROP TABLE IF EXISTS `zjhj_bd_integral_mall_coupons_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_integral_mall_coupons_orders` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `mall_id` int(11) NOT NULL,
  `order_no` varchar(255) NOT NULL DEFAULT '',
  `integral_mall_coupon_id` int(11) NOT NULL COMMENT '积分商城优惠券ID',
  `integral_mall_coupon_info` text NOT NULL COMMENT '积分商城优惠券信息',
  `user_coupon_id` int(11) NOT NULL COMMENT '关联用户优惠券ID',
  `price` decimal(11,2) NOT NULL COMMENT '优惠券价格',
  `integral_num` int(11) NOT NULL COMMENT '优惠券积分',
  `is_pay` tinyint(1) NOT NULL DEFAULT '0',
  `pay_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `pay_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '支付方式：1.在线支付 2.货到付款 3.余额支付',
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_integral_mall_coupons_orders`
--

LOCK TABLES `zjhj_bd_integral_mall_coupons_orders` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_integral_mall_coupons_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_integral_mall_coupons_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_integral_mall_coupons_user`
--

DROP TABLE IF EXISTS `zjhj_bd_integral_mall_coupons_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_integral_mall_coupons_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `mall_id` int(11) NOT NULL,
  `integral_mall_coupon_id` int(11) NOT NULL COMMENT '积分商城优惠券ID',
  `user_coupon_id` int(11) NOT NULL COMMENT '关联用户优惠券ID',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_integral_mall_coupons_user`
--

LOCK TABLES `zjhj_bd_integral_mall_coupons_user` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_integral_mall_coupons_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_integral_mall_coupons_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_integral_mall_goods`
--

DROP TABLE IF EXISTS `zjhj_bd_integral_mall_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_integral_mall_goods` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL,
  `mall_id` int(11) NOT NULL,
  `is_home` tinyint(1) NOT NULL DEFAULT '0' COMMENT '放置首页0.否|1.是',
  `integral_num` int(11) NOT NULL DEFAULT '0',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_integral_mall_goods`
--

LOCK TABLES `zjhj_bd_integral_mall_goods` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_integral_mall_goods` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_integral_mall_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_integral_mall_goods_attr`
--

DROP TABLE IF EXISTS `zjhj_bd_integral_mall_goods_attr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_integral_mall_goods_attr` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `integral_num` int(11) NOT NULL DEFAULT '0' COMMENT '商品所需积分',
  `goods_id` int(11) NOT NULL,
  `goods_attr_id` int(11) NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `goods_id` (`goods_id`),
  KEY `goods_attr_id` (`goods_attr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_integral_mall_goods_attr`
--

LOCK TABLES `zjhj_bd_integral_mall_goods_attr` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_integral_mall_goods_attr` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_integral_mall_goods_attr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_integral_mall_orders`
--

DROP TABLE IF EXISTS `zjhj_bd_integral_mall_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_integral_mall_orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `token` varchar(255) NOT NULL DEFAULT '',
  `integral_num` int(11) NOT NULL COMMENT '商品所需积分',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除',
  `created_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_integral_mall_orders`
--

LOCK TABLES `zjhj_bd_integral_mall_orders` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_integral_mall_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_integral_mall_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_integral_mall_setting`
--

DROP TABLE IF EXISTS `zjhj_bd_integral_mall_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_integral_mall_setting` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `is_share` int(11) NOT NULL DEFAULT '0',
  `is_sms` int(11) NOT NULL DEFAULT '0',
  `is_mail` int(11) NOT NULL DEFAULT '0',
  `is_print` int(11) NOT NULL DEFAULT '0',
  `is_territorial_limitation` int(11) NOT NULL DEFAULT '0',
  `desc` text NOT NULL COMMENT '积分说明',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `payment_type` longtext NOT NULL COMMENT '支付方式',
  `send_type` longtext NOT NULL COMMENT '发货方式',
  `goods_poster` longtext NOT NULL COMMENT '自定义海报',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_integral_mall_setting`
--

LOCK TABLES `zjhj_bd_integral_mall_setting` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_integral_mall_setting` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_integral_mall_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_live_goods`
--

DROP TABLE IF EXISTS `zjhj_bd_live_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_live_goods` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `audit_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_name` (`goods_id`,`audit_id`,`mall_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_live_goods`
--

LOCK TABLES `zjhj_bd_live_goods` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_live_goods` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_live_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_lottery`
--

DROP TABLE IF EXISTS `zjhj_bd_lottery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_lottery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL COMMENT '规格',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0关闭 1开启',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0未完成 1已完成 2超限 3过期',
  `stock` int(11) NOT NULL DEFAULT '0' COMMENT '库存',
  `start_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '开始时间',
  `end_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '结束时间',
  `join_min_num` int(11) NOT NULL DEFAULT '0' COMMENT '参加最少人数限制',
  `sort` int(11) NOT NULL DEFAULT '1' COMMENT '排序',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `participant` int(11) NOT NULL DEFAULT '0' COMMENT '参与人',
  `invitee` int(11) NOT NULL DEFAULT '0' COMMENT '被邀请人',
  `code_num` int(11) NOT NULL DEFAULT '0' COMMENT '抽奖券码数量',
  `buy_goods_id` int(11) NOT NULL COMMENT '购买商品id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_lottery`
--

LOCK TABLES `zjhj_bd_lottery` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_lottery` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_lottery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_lottery_banner`
--

DROP TABLE IF EXISTS `zjhj_bd_lottery_banner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_lottery_banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `banner_id` int(11) NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除',
  `created_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_lottery_banner`
--

LOCK TABLES `zjhj_bd_lottery_banner` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_lottery_banner` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_lottery_banner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_lottery_default`
--

DROP TABLE IF EXISTS `zjhj_bd_lottery_default`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_lottery_default` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `lottery_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除',
  `created_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_lottery_default`
--

LOCK TABLES `zjhj_bd_lottery_default` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_lottery_default` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_lottery_default` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_lottery_log`
--

DROP TABLE IF EXISTS `zjhj_bd_lottery_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_lottery_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `lottery_id` int(11) NOT NULL,
  `status` smallint(1) NOT NULL DEFAULT '0' COMMENT '0未抽奖 1待开奖 2未中奖 3中奖 4已领取 ',
  `goods_id` int(11) NOT NULL COMMENT '规格id',
  `child_id` int(11) NOT NULL DEFAULT '0' COMMENT '受邀请userid',
  `lucky_code` varchar(255) NOT NULL COMMENT '幸运码',
  `raffled_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '领取时间',
  `obtain_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_at` timestamp NOT NULL,
  `token` varchar(255) NOT NULL DEFAULT '' COMMENT '订单表token',
  PRIMARY KEY (`id`),
  KEY `lottery_id` (`lottery_id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `mall_id` (`mall_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_lottery_log`
--

LOCK TABLES `zjhj_bd_lottery_log` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_lottery_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_lottery_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_lottery_order`
--

DROP TABLE IF EXISTS `zjhj_bd_lottery_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_lottery_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `lottery_log_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除',
  `created_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_lottery_order`
--

LOCK TABLES `zjhj_bd_lottery_order` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_lottery_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_lottery_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_lottery_setting`
--

DROP TABLE IF EXISTS `zjhj_bd_lottery_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_lottery_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0：分享即送 1： 被分享人参与抽奖',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '小程序标题',
  `rule` longtext NOT NULL COMMENT '规则',
  `created_at` timestamp NOT NULL,
  `payment_type` longtext NOT NULL COMMENT '支付方式',
  `send_type` longtext NOT NULL COMMENT '发货方式',
  `goods_poster` longtext NOT NULL COMMENT '自定义海报',
  `is_sms` tinyint(1) NOT NULL DEFAULT '0' COMMENT '开启短信提醒',
  `is_mail` tinyint(1) NOT NULL DEFAULT '0' COMMENT '开启邮件提醒',
  `is_print` tinyint(1) NOT NULL DEFAULT '0' COMMENT '开启打印',
  `cs_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否开启客服提示',
  `cs_prompt_pic` varchar(255) NOT NULL DEFAULT '' COMMENT '客服提示图片',
  `cs_wechat` longtext NOT NULL COMMENT '客服微信号',
  `cs_wechat_flock_qrcode_pic` longtext NOT NULL COMMENT '微信群',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_lottery_setting`
--

LOCK TABLES `zjhj_bd_lottery_setting` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_lottery_setting` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_lottery_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_mail_setting`
--

DROP TABLE IF EXISTS `zjhj_bd_mail_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_mail_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL DEFAULT '-1',
  `mch_id` int(11) NOT NULL DEFAULT '0',
  `send_mail` longtext CHARACTER SET utf8 NOT NULL COMMENT '发件人邮箱',
  `send_pwd` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '授权码',
  `send_name` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '发件人名称',
  `receive_mail` longtext CHARACTER SET utf8 NOT NULL COMMENT '收件人邮箱 多个用英文逗号隔开',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '是否开启邮件通知 0--关闭 1--开启',
  `is_delete` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `show_type` longtext NOT NULL COMMENT 'attr 规格 goods_no 货号 form_data 下单表单',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_mail_setting`
--

LOCK TABLES `zjhj_bd_mail_setting` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_mail_setting` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_mail_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_mall`
--

DROP TABLE IF EXISTS `zjhj_bd_mall`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_mall` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL DEFAULT '',
  `user_id` int(11) unsigned NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  `is_recycle` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否回收',
  `is_disable` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否禁用',
  `expired_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='商城';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_mall`
--

LOCK TABLES `zjhj_bd_mall` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_mall` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_mall` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_mall_banner_relation`
--

DROP TABLE IF EXISTS `zjhj_bd_mall_banner_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_mall_banner_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `banner_id` int(11) NOT NULL COMMENT '轮播图id',
  `created_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_mall_banner_relation`
--

LOCK TABLES `zjhj_bd_mall_banner_relation` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_mall_banner_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_mall_banner_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_mall_goods`
--

DROP TABLE IF EXISTS `zjhj_bd_mall_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_mall_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `is_quick_shop` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否快速购买',
  `is_sell_well` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否热销',
  `is_negotiable` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否面议商品',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index1` (`goods_id`),
  KEY `mall_id` (`mall_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='商城商品额外信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_mall_goods`
--

LOCK TABLES `zjhj_bd_mall_goods` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_mall_goods` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_mall_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_mall_member_orders`
--

DROP TABLE IF EXISTS `zjhj_bd_mall_member_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_mall_member_orders` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `mall_id` int(11) NOT NULL,
  `order_no` varchar(30) NOT NULL DEFAULT '' COMMENT '订单号',
  `pay_price` decimal(10,2) NOT NULL COMMENT '支付金额',
  `pay_type` tinyint(1) NOT NULL COMMENT '支付方式 1.线上支付',
  `is_pay` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否支付 0--未支付 1--支付',
  `pay_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '支付时间',
  `detail` mediumtext,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_mall_member_orders`
--

LOCK TABLES `zjhj_bd_mall_member_orders` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_mall_member_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_mall_member_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_mall_member_rights`
--

DROP TABLE IF EXISTS `zjhj_bd_mall_member_rights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_mall_member_rights` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL,
  `title` varchar(65) NOT NULL DEFAULT '',
  `content` varchar(255) NOT NULL DEFAULT '',
  `pic_url` varchar(255) NOT NULL DEFAULT '',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_mall_member_rights`
--

LOCK TABLES `zjhj_bd_mall_member_rights` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_mall_member_rights` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_mall_member_rights` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_mall_members`
--

DROP TABLE IF EXISTS `zjhj_bd_mall_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_mall_members` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `level` int(11) unsigned NOT NULL COMMENT '会员等级',
  `name` varchar(65) NOT NULL DEFAULT '' COMMENT '等级名称',
  `auto_update` tinyint(1) NOT NULL COMMENT '是否开启自动升级',
  `money` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '会员完成订单金额满足则升级',
  `discount` decimal(11,1) NOT NULL DEFAULT '0.0' COMMENT '会员折扣',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态 0--禁用 1--启用',
  `pic_url` varchar(255) NOT NULL DEFAULT '' COMMENT '会员图片',
  `is_purchase` tinyint(1) NOT NULL COMMENT '会员是否可购买',
  `price` decimal(11,2) NOT NULL COMMENT '购买会员价格',
  `rules` mediumtext NOT NULL COMMENT '会员规则',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  `bg_pic_url` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mall_id` (`mall_id`),
  KEY `level` (`level`),
  KEY `is_delete` (`is_delete`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_mall_members`
--

LOCK TABLES `zjhj_bd_mall_members` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_mall_members` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_mall_members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_mall_setting`
--

DROP TABLE IF EXISTS `zjhj_bd_mall_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_mall_setting` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `key` varchar(65) NOT NULL DEFAULT '',
  `value` mediumtext,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mall_id` (`mall_id`),
  KEY `key` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_mall_setting`
--

LOCK TABLES `zjhj_bd_mall_setting` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_mall_setting` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_mall_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_mch`
--

DROP TABLE IF EXISTS `zjhj_bd_mch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_mch` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否营业0.否|1.是',
  `is_recommend` tinyint(1) NOT NULL DEFAULT '0' COMMENT '好店推荐：0.不推荐|1.推荐',
  `review_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '审核状态：0=待审核，1.审核通过.2=审核不通过',
  `review_remark` varchar(255) NOT NULL DEFAULT '' COMMENT '审核结果、备注',
  `review_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '审核时间',
  `realname` varchar(65) NOT NULL DEFAULT '' COMMENT '真实姓名',
  `wechat` varchar(65) NOT NULL DEFAULT '' COMMENT '微信号',
  `mobile` varchar(255) NOT NULL DEFAULT '' COMMENT '手机号码',
  `mch_common_cat_id` int(11) NOT NULL COMMENT '商户所属类目',
  `transfer_rate` int(11) NOT NULL DEFAULT '0' COMMENT '商户手续费',
  `account_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '账户余额',
  `sort` int(11) NOT NULL DEFAULT '100' COMMENT '店铺排序|升序',
  `form_data` mediumtext NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_mch`
--

LOCK TABLES `zjhj_bd_mch` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_mch` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_mch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_mch_account_log`
--

DROP TABLE IF EXISTS `zjhj_bd_mch_account_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_mch_account_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `mch_id` int(11) NOT NULL,
  `money` decimal(11,2) NOT NULL COMMENT '金额',
  `desc` text NOT NULL COMMENT '备注说明',
  `type` tinyint(1) NOT NULL COMMENT '类型：1=收入，2=支出',
  `created_at` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_mch_account_log`
--

LOCK TABLES `zjhj_bd_mch_account_log` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_mch_account_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_mch_account_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_mch_cash`
--

DROP TABLE IF EXISTS `zjhj_bd_mch_cash`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_mch_cash` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `mch_id` int(11) NOT NULL COMMENT '多商户ID',
  `money` decimal(10,2) NOT NULL COMMENT '提现金额',
  `order_no` varchar(255) NOT NULL DEFAULT '' COMMENT '订单号',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '提现状态：0=待处理，1=同意，2=拒绝',
  `transfer_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0.待转账 | 1.已转账  | 2.拒绝转账',
  `type` varchar(65) NOT NULL DEFAULT '0' COMMENT 'wx 微信| alipay 支付宝 | bank 银行卡 | balance 余额',
  `type_data` varchar(255) NOT NULL DEFAULT '' COMMENT '不同提现类型，提交的数据',
  `virtual_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '实际上打款方式',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  `content` longtext COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_mch_cash`
--

LOCK TABLES `zjhj_bd_mch_cash` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_mch_cash` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_mch_cash` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_mch_common_cat`
--

DROP TABLE IF EXISTS `zjhj_bd_mch_common_cat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_mch_common_cat` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '类目名称',
  `sort` int(11) NOT NULL DEFAULT '100' COMMENT '排序：升序',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否显示',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_mch_common_cat`
--

LOCK TABLES `zjhj_bd_mch_common_cat` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_mch_common_cat` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_mch_common_cat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_mch_goods`
--

DROP TABLE IF EXISTS `zjhj_bd_mch_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_mch_goods` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `mch_id` int(11) NOT NULL,
  `mall_id` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0.申请上架|1.申请中|2.同意上架|3.拒绝上架',
  `sort` int(11) NOT NULL DEFAULT '100' COMMENT '商户的排序',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `is_delete` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_mch_goods`
--

LOCK TABLES `zjhj_bd_mch_goods` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_mch_goods` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_mch_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_mch_mall_setting`
--

DROP TABLE IF EXISTS `zjhj_bd_mch_mall_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_mch_mall_setting` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `mch_id` int(11) NOT NULL,
  `is_share` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否开启分销0.否|1.是',
  `created_at` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_mch_mall_setting`
--

LOCK TABLES `zjhj_bd_mch_mall_setting` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_mch_mall_setting` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_mch_mall_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_mch_order`
--

DROP TABLE IF EXISTS `zjhj_bd_mch_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_mch_order` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `is_transfer` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否转入商户0.否|1.是',
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_mch_order`
--

LOCK TABLES `zjhj_bd_mch_order` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_mch_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_mch_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_mch_setting`
--

DROP TABLE IF EXISTS `zjhj_bd_mch_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_mch_setting` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `mch_id` int(11) NOT NULL,
  `is_share` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否开启分销0.否|1.是',
  `is_sms` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否开启短信提醒',
  `is_mail` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否开启邮件通知',
  `is_print` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否开启订单打印',
  `is_territorial_limitation` tinyint(1) NOT NULL DEFAULT '0' COMMENT '区域购买限制',
  `send_type` longtext NOT NULL COMMENT '发货方式',
  `created_at` timestamp NOT NULL,
  `is_web_service` tinyint(1) NOT NULL DEFAULT '0',
  `web_service_url` varchar(255) NOT NULL DEFAULT '',
  `web_service_pic` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_mch_setting`
--

LOCK TABLES `zjhj_bd_mch_setting` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_mch_setting` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_mch_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_mch_visit_log`
--

DROP TABLE IF EXISTS `zjhj_bd_mch_visit_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_mch_visit_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `mch_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `num` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_mch_visit_log`
--

LOCK TABLES `zjhj_bd_mch_visit_log` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_mch_visit_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_mch_visit_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_miaosha_activitys`
--

DROP TABLE IF EXISTS `zjhj_bd_miaosha_activitys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_miaosha_activitys` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '秒杀活动状态0.关闭|1.开启',
  `open_date` date NOT NULL DEFAULT '0000-00-00' COMMENT '活动开始时间',
  `end_date` date NOT NULL DEFAULT '0000-00-00' COMMENT '活动结束时间',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_miaosha_activitys`
--

LOCK TABLES `zjhj_bd_miaosha_activitys` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_miaosha_activitys` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_miaosha_activitys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_miaosha_banners`
--

DROP TABLE IF EXISTS `zjhj_bd_miaosha_banners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_miaosha_banners` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `banner_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `is_delete` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_miaosha_banners`
--

LOCK TABLES `zjhj_bd_miaosha_banners` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_miaosha_banners` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_miaosha_banners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_miaosha_goods`
--

DROP TABLE IF EXISTS `zjhj_bd_miaosha_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_miaosha_goods` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `goods_warehouse_id` int(11) NOT NULL,
  `open_time` tinyint(1) NOT NULL COMMENT '开放时间',
  `open_date` date NOT NULL,
  `buy_limit` int(11) NOT NULL DEFAULT '-1' COMMENT '限单 -1|不限单',
  `virtual_miaosha_num` int(11) NOT NULL DEFAULT '0' COMMENT '虚拟秒杀量',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  `activity_id` int(11) NOT NULL DEFAULT '0' COMMENT '活动ID',
  PRIMARY KEY (`id`),
  KEY `index1` (`is_delete`,`open_date`,`open_time`),
  KEY `index2` (`is_delete`,`goods_id`),
  KEY `mall_id` (`mall_id`),
  KEY `goods_id` (`goods_id`),
  KEY `goods_warehouse_id` (`goods_warehouse_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_miaosha_goods`
--

LOCK TABLES `zjhj_bd_miaosha_goods` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_miaosha_goods` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_miaosha_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_miaosha_setting`
--

DROP TABLE IF EXISTS `zjhj_bd_miaosha_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_miaosha_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `over_time` int(11) NOT NULL DEFAULT '1' COMMENT '未支付订单取消时间',
  `is_share` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否开启分销',
  `is_sms` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否短信提醒',
  `is_mail` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否开启邮件通知',
  `is_print` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否开启订单打印',
  `is_territorial_limitation` tinyint(1) NOT NULL DEFAULT '0' COMMENT '区域购买限制',
  `open_time` text NOT NULL COMMENT '秒杀开放时间',
  `created_at` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `payment_type` longtext NOT NULL,
  `send_type` longtext NOT NULL,
  `goods_poster` longtext NOT NULL COMMENT '自定义海报',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='秒杀设置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_miaosha_setting`
--

LOCK TABLES `zjhj_bd_miaosha_setting` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_miaosha_setting` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_miaosha_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_mp_template_record`
--

DROP TABLE IF EXISTS `zjhj_bd_mp_template_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_mp_template_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `open_id` varchar(255) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '模板消息是否发送成功0--失败|1--成功',
  `data` longtext NOT NULL COMMENT '模板消息内容',
  `error` longtext NOT NULL COMMENT '错误信息',
  `created_at` timestamp NOT NULL,
  `token` varchar(255) NOT NULL DEFAULT '' COMMENT '模板消息发送标示',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='模板消息发送记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_mp_template_record`
--

LOCK TABLES `zjhj_bd_mp_template_record` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_mp_template_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_mp_template_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_option`
--

DROP TABLE IF EXISTS `zjhj_bd_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_option` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `mch_id` int(11) NOT NULL DEFAULT '0',
  `group` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL,
  `value` longtext NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `mall_id` (`mall_id`),
  KEY `mch_id` (`mch_id`),
  KEY `group` (`group`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_option`
--

LOCK TABLES `zjhj_bd_option` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_option` DISABLE KEYS */;
INSERT INTO `zjhj_bd_option` VALUES (1,0,0,'','version','\"4.3.35\"','0000-00-00 00:00:00','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `zjhj_bd_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_order`
--

DROP TABLE IF EXISTS `zjhj_bd_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_order` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `mch_id` int(11) NOT NULL DEFAULT '0' COMMENT '多商户id，0表示商城订单',
  `order_no` varchar(255) NOT NULL DEFAULT '' COMMENT '订单号',
  `total_price` decimal(10,2) NOT NULL COMMENT '订单总金额(含运费)',
  `total_pay_price` decimal(10,2) NOT NULL COMMENT '实际支付总费用(含运费）',
  `express_original_price` decimal(10,2) NOT NULL COMMENT '运费(后台修改前)',
  `express_price` decimal(10,2) NOT NULL COMMENT '运费(后台修改后)',
  `total_goods_price` decimal(10,2) NOT NULL COMMENT '订单商品总金额(优惠后)',
  `total_goods_original_price` decimal(10,2) NOT NULL COMMENT '订单商品总金额(优惠前)',
  `member_discount_price` decimal(10,2) NOT NULL COMMENT '会员优惠价格(正数表示优惠，负数表示加价)',
  `use_user_coupon_id` int(11) NOT NULL COMMENT '使用的用户优惠券id',
  `coupon_discount_price` decimal(10,2) NOT NULL COMMENT '优惠券优惠金额',
  `use_integral_num` int(11) NOT NULL COMMENT '使用积分数量',
  `integral_deduction_price` decimal(10,2) NOT NULL COMMENT '积分抵扣金额',
  `name` varchar(65) NOT NULL DEFAULT '' COMMENT '收件人姓名',
  `mobile` varchar(255) NOT NULL DEFAULT '' COMMENT '收件人手机号',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '收件人地址',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '用户订单备注',
  `order_form` longtext COMMENT '自定义表单（JSON）',
  `words` varchar(255) NOT NULL DEFAULT '' COMMENT '商家留言',
  `seller_remark` varchar(255) NOT NULL DEFAULT '' COMMENT '商家订单备注',
  `is_pay` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否支付：0.未支付|1.已支付',
  `pay_type` tinyint(4) NOT NULL COMMENT '支付方式：1.在线支付 2.货到付款 3.余额支付',
  `pay_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '支付时间',
  `is_send` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否发货：0.未发货|1.已发货',
  `send_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '发货时间',
  `customer_name` varchar(65) DEFAULT '' COMMENT '京东商家编号',
  `express` varchar(65) NOT NULL DEFAULT '' COMMENT '物流公司',
  `express_no` varchar(255) NOT NULL DEFAULT '' COMMENT '物流订单号',
  `is_sale` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否过售后时间',
  `is_confirm` tinyint(1) NOT NULL DEFAULT '0' COMMENT '收货状态：0.未收货|1.已收货',
  `confirm_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '确认收货时间',
  `cancel_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '订单取消状态：0.未取消|1.已取消|2.申请取消',
  `cancel_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '订单取消时间',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  `is_recycle` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否加入回收站 0.否|1.是',
  `send_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '配送方式：0--快递配送 1--到店自提 2--同城配送 3--无配送',
  `offline_qrcode` varchar(255) NOT NULL DEFAULT '' COMMENT '核销码',
  `clerk_id` int(11) NOT NULL DEFAULT '0' COMMENT '核销员ID',
  `store_id` int(11) NOT NULL DEFAULT '0' COMMENT '自提门店ID',
  `sign` varchar(255) NOT NULL DEFAULT '' COMMENT '订单标识，用于区分插件',
  `token` varchar(32) NOT NULL DEFAULT '',
  `support_pay_types` longtext COMMENT '支持的支付方式，空表示支持系统设置支持的所有方式',
  `is_comment` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否评价0.否|1.是',
  `comment_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `sale_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否申请售后',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '订单状态|1.已完成|0.进行中不能对订单进行任何操作',
  `back_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '后台优惠(正数表示优惠，负数表示加价)',
  `auto_cancel_time` timestamp NULL DEFAULT NULL COMMENT '自动取消时间',
  `auto_confirm_time` timestamp NULL DEFAULT NULL COMMENT '自动确认收货时间',
  `auto_sales_time` timestamp NULL DEFAULT NULL COMMENT '自动售后时间',
  `distance` int(11) DEFAULT '-1' COMMENT '同城配送距离，-1不在范围内，正数为距离KM',
  `city_mobile` varchar(100) DEFAULT '' COMMENT '同城配送联系方式',
  `location` varchar(255) DEFAULT NULL,
  `city_name` varchar(255) DEFAULT NULL,
  `city_info` varchar(255) DEFAULT NULL,
  `cancel_data` text COMMENT '订单申请退款数据',
  PRIMARY KEY (`id`),
  KEY `mall_id` (`mall_id`),
  KEY `user_id` (`user_id`),
  KEY `index1` (`mall_id`,`is_delete`,`is_pay`,`pay_type`,`cancel_status`),
  KEY `order_no` (`order_no`),
  KEY `is_pay` (`is_pay`),
  KEY `is_send` (`is_send`),
  KEY `is_sale` (`is_sale`),
  KEY `is_confirm` (`is_confirm`),
  KEY `is_delete` (`is_delete`),
  KEY `is_recycle` (`is_recycle`),
  KEY `token` (`token`),
  KEY `is_comment` (`is_comment`),
  KEY `status` (`status`),
  KEY `sale_status` (`sale_status`),
  KEY `sign` (`sign`),
  KEY `clerk_id` (`clerk_id`),
  KEY `store_id` (`store_id`),
  KEY `cancel_status` (`cancel_status`),
  KEY `index2` (`mall_id`,`is_delete`,`cancel_status`),
  KEY `index3` (`mall_id`,`is_delete`,`cancel_status`,`is_pay`),
  KEY `index4` (`mall_id`,`is_delete`,`cancel_status`,`pay_type`),
  KEY `index5` (`mall_id`,`is_delete`,`cancel_status`,`is_pay`,`pay_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_order`
--

LOCK TABLES `zjhj_bd_order` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_order_clerk`
--

DROP TABLE IF EXISTS `zjhj_bd_order_clerk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_order_clerk` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `affirm_pay_type` tinyint(1) NOT NULL DEFAULT '-1' COMMENT '确认收款类型|1.小程序收款|2.后台收款',
  `clerk_type` tinyint(1) NOT NULL DEFAULT '-1' COMMENT '确认核销类型|1.小程序核销|2.后台核销',
  `clerk_remark` varchar(255) NOT NULL DEFAULT '' COMMENT '核销备注',
  `mall_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `is_delete` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_order_clerk`
--

LOCK TABLES `zjhj_bd_order_clerk` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_order_clerk` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_order_clerk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_order_comments`
--

DROP TABLE IF EXISTS `zjhj_bd_order_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_order_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `mch_id` int(11) NOT NULL DEFAULT '0',
  `order_id` int(11) NOT NULL,
  `order_detail_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `score` tinyint(4) NOT NULL COMMENT '评分：1=差评，2=中评，3=好',
  `content` text NOT NULL COMMENT '评价内容',
  `pic_url` text NOT NULL COMMENT '评价图片',
  `is_show` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否显示：0.不显示|1.显示',
  `is_virtual` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否虚拟用户',
  `virtual_user` varchar(255) NOT NULL DEFAULT '' COMMENT '虚拟用户名',
  `virtual_avatar` varchar(255) NOT NULL DEFAULT '' COMMENT '虚拟头像',
  `virtual_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '虚拟评价时间',
  `goods_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品ID',
  `goods_warehouse_id` int(11) NOT NULL COMMENT '商品库ID',
  `sign` varchar(255) NOT NULL DEFAULT '',
  `reply_content` text NOT NULL COMMENT '商家回复内容',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  `is_anonymous` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否匿名 0.否|1.是',
  `is_top` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否置顶0.否|1.是',
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_order_comments`
--

LOCK TABLES `zjhj_bd_order_comments` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_order_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_order_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_order_comments_templates`
--

DROP TABLE IF EXISTS `zjhj_bd_order_comments_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_order_comments_templates` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `mch_id` int(11) NOT NULL DEFAULT '0',
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '模板类型:1.好评|2.中评|3.差评',
  `title` varchar(65) NOT NULL DEFAULT '' COMMENT '标题',
  `content` varchar(255) NOT NULL DEFAULT '' COMMENT '内容',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_order_comments_templates`
--

LOCK TABLES `zjhj_bd_order_comments_templates` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_order_comments_templates` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_order_comments_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_order_detail`
--

DROP TABLE IF EXISTS `zjhj_bd_order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_order_detail` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `num` int(11) NOT NULL COMMENT '购买商品数量',
  `unit_price` decimal(10,2) NOT NULL COMMENT '商品单价',
  `total_original_price` decimal(10,2) NOT NULL COMMENT '商品原总价(优惠前)',
  `total_price` decimal(10,2) NOT NULL COMMENT '商品总价(优惠后)',
  `member_discount_price` decimal(10,2) NOT NULL COMMENT '会员优惠金额(正数表示优惠，负数表示加价)',
  `goods_info` longtext NOT NULL COMMENT '购买商品信息',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `is_refund` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否退款',
  `refund_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '售后状态 0--未售后 1--售后中 2--售后结束',
  `back_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '后台优惠(正数表示优惠，负数表示加价)',
  `sign` varchar(255) NOT NULL DEFAULT '' COMMENT '订单详情标识，用于区分插件',
  `goods_no` varchar(60) NOT NULL DEFAULT '' COMMENT '商品货号',
  `form_data` longtext COMMENT '自定义表单提交的数据',
  `form_id` int(11) DEFAULT '0' COMMENT '自定义表单的id',
  `goods_type` varchar(255) NOT NULL DEFAULT 'goods' COMMENT '商品类型',
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `index1` (`goods_id`,`is_refund`,`order_id`),
  KEY `created_at` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_order_detail`
--

LOCK TABLES `zjhj_bd_order_detail` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_order_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_order_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_order_detail_express`
--

DROP TABLE IF EXISTS `zjhj_bd_order_detail_express`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_order_detail_express` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `mch_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL COMMENT '订单ID',
  `express` varchar(65) NOT NULL DEFAULT '',
  `send_type` tinyint(1) NOT NULL COMMENT '1.快递|2.其它方式',
  `express_no` varchar(255) NOT NULL DEFAULT '',
  `merchant_remark` varchar(255) NOT NULL DEFAULT '' COMMENT '商家留言',
  `express_content` varchar(255) NOT NULL DEFAULT '' COMMENT '物流内容',
  `is_delete` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `customer_name` varchar(255) NOT NULL DEFAULT '' COMMENT '京东物流编号',
  `express_single_id` int(11) NOT NULL DEFAULT '0' COMMENT '电子面单ID',
  `city_mobile` varchar(255) DEFAULT NULL,
  `city_info` longtext,
  `city_name` varchar(255) DEFAULT NULL,
  `shop_order_id` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `express_type` varchar(255) DEFAULT '',
  `city_service_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mall_id` (`mall_id`),
  KEY `mch_id` (`mch_id`),
  KEY `order_id` (`order_id`),
  KEY `send_type` (`send_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_order_detail_express`
--

LOCK TABLES `zjhj_bd_order_detail_express` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_order_detail_express` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_order_detail_express` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_order_detail_express_relation`
--

DROP TABLE IF EXISTS `zjhj_bd_order_detail_express_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_order_detail_express_relation` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `mch_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `order_detail_id` int(11) NOT NULL,
  `order_detail_express_id` int(11) NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_order_detail_express_relation`
--

LOCK TABLES `zjhj_bd_order_detail_express_relation` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_order_detail_express_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_order_detail_express_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_order_detail_vip_card_info`
--

DROP TABLE IF EXISTS `zjhj_bd_order_detail_vip_card_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_order_detail_vip_card_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vip_card_order_id` int(11) NOT NULL,
  `order_detail_id` int(11) NOT NULL,
  `order_detail_total_price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_order_detail_vip_card_info`
--

LOCK TABLES `zjhj_bd_order_detail_vip_card_info` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_order_detail_vip_card_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_order_detail_vip_card_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_order_express_single`
--

DROP TABLE IF EXISTS `zjhj_bd_order_express_single`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_order_express_single` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL COMMENT '订单id',
  `express_code` varchar(255) NOT NULL COMMENT '快递公司编码',
  `ebusiness_id` varchar(255) NOT NULL COMMENT '快递鸟id',
  `print_teplate` longtext NOT NULL,
  `order` longtext NOT NULL COMMENT '订单信息',
  `is_delete` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_order_express_single`
--

LOCK TABLES `zjhj_bd_order_express_single` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_order_express_single` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_order_express_single` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_order_pay_result`
--

DROP TABLE IF EXISTS `zjhj_bd_order_pay_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_order_pay_result` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `data` longtext COMMENT 'json数据',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_order_pay_result`
--

LOCK TABLES `zjhj_bd_order_pay_result` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_order_pay_result` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_order_pay_result` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_order_refund`
--

DROP TABLE IF EXISTS `zjhj_bd_order_refund`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_order_refund` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `mch_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `order_detail_id` int(11) NOT NULL COMMENT '关联订单详情',
  `order_no` varchar(255) NOT NULL DEFAULT '' COMMENT '退款单号',
  `type` tinyint(1) NOT NULL COMMENT '售后类型：1=退货退款，2=换货',
  `refund_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '退款金额',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '用户退款备注、说明',
  `pic_list` mediumtext NOT NULL COMMENT '用户上传图片凭证',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1.待商家处理 2.同意 3.拒绝',
  `status_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '商家处理时间',
  `merchant_remark` varchar(255) NOT NULL DEFAULT '' COMMENT '商家同意|拒绝备注、理由',
  `is_send` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户是否发货 0.未发货1.已发货',
  `send_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '发货时间',
  `customer_name` varchar(65) DEFAULT '' COMMENT '京东商家编号',
  `express` varchar(65) NOT NULL DEFAULT '' COMMENT '快递公司',
  `express_no` varchar(255) NOT NULL DEFAULT '' COMMENT '快递单号',
  `address_id` int(11) NOT NULL DEFAULT '0' COMMENT '退换货地址ID',
  `is_confirm` tinyint(1) NOT NULL DEFAULT '0' COMMENT '商家确认操作',
  `confirm_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '确认时间',
  `merchant_customer_name` varchar(65) DEFAULT '' COMMENT '商家京东商家编号',
  `merchant_express` varchar(65) NOT NULL DEFAULT '' COMMENT '商家发货快递公司',
  `merchant_express_no` varchar(255) NOT NULL DEFAULT '' COMMENT '商家发货快递单号',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  `refund_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_refund` tinyint(1) NOT NULL DEFAULT '2' COMMENT '是否打款，2代表旧数据',
  `reality_refund_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '商家实际退款金额',
  `merchant_express_content` varchar(255) NOT NULL DEFAULT '' COMMENT '物流内容',
  `mobile` varchar(255) NOT NULL DEFAULT '' COMMENT '联系方式',
  `refund_data` text NOT NULL COMMENT '售后数据',
  PRIMARY KEY (`id`),
  KEY `mall_id` (`mall_id`),
  KEY `mch_id` (`mch_id`),
  KEY `user_id` (`user_id`),
  KEY `order_id` (`order_id`),
  KEY `order_detail_id` (`order_detail_id`),
  KEY `order_no` (`order_no`),
  KEY `type` (`type`),
  KEY `status` (`status`),
  KEY `is_send` (`is_send`),
  KEY `is_confirm` (`is_confirm`),
  KEY `is_refund` (`is_refund`),
  KEY `is_delete` (`is_delete`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_order_refund`
--

LOCK TABLES `zjhj_bd_order_refund` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_order_refund` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_order_refund` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_order_send_template`
--

DROP TABLE IF EXISTS `zjhj_bd_order_send_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_order_send_template` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `mch_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(60) NOT NULL DEFAULT '' COMMENT '发货单名称',
  `cover_pic` varchar(255) NOT NULL DEFAULT '' COMMENT '缩略图',
  `params` text NOT NULL COMMENT '模板参数',
  `is_default` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否为默认模板0.否|1.是',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_order_send_template`
--

LOCK TABLES `zjhj_bd_order_send_template` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_order_send_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_order_send_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_order_send_template_address`
--

DROP TABLE IF EXISTS `zjhj_bd_order_send_template_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_order_send_template_address` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `mch_id` int(11) NOT NULL,
  `name` varchar(60) NOT NULL DEFAULT '' COMMENT '网点名称',
  `username` varchar(60) NOT NULL DEFAULT '' COMMENT '联系人',
  `mobile` varchar(60) NOT NULL DEFAULT '' COMMENT '联系电话',
  `code` varchar(60) NOT NULL DEFAULT '' COMMENT '网点邮编',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '地址',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_order_send_template_address`
--

LOCK TABLES `zjhj_bd_order_send_template_address` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_order_send_template_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_order_send_template_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_order_submit_result`
--

DROP TABLE IF EXISTS `zjhj_bd_order_submit_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_order_submit_result` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(32) NOT NULL,
  `data` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_order_submit_result`
--

LOCK TABLES `zjhj_bd_order_submit_result` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_order_submit_result` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_order_submit_result` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_order_vip_card_info`
--

DROP TABLE IF EXISTS `zjhj_bd_order_vip_card_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_order_vip_card_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL COMMENT '订单ID',
  `vip_card_detail_id` int(11) NOT NULL COMMENT '超级会员卡子卡ID',
  `order_total_price` decimal(10,2) NOT NULL COMMENT '超级会员卡优惠后订单的金额',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_order_vip_card_info`
--

LOCK TABLES `zjhj_bd_order_vip_card_info` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_order_vip_card_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_order_vip_card_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_payment_order`
--

DROP TABLE IF EXISTS `zjhj_bd_payment_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_payment_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_order_union_id` int(11) NOT NULL,
  `order_no` varchar(32) NOT NULL,
  `amount` decimal(9,2) NOT NULL,
  `is_pay` int(1) NOT NULL DEFAULT '0' COMMENT '支付状态：0=未支付，1=已支付',
  `pay_type` int(1) NOT NULL DEFAULT '0' COMMENT '支付方式：1=微信支付，2=货到付款，3=余额支付，4=支付宝支付',
  `title` varchar(128) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `notify_class` varchar(512) NOT NULL,
  `refund` decimal(9,2) NOT NULL DEFAULT '0.00' COMMENT '已退款金额',
  PRIMARY KEY (`id`),
  KEY `payment_order_union_id` (`payment_order_union_id`),
  KEY `order_no` (`order_no`),
  KEY `is_pay` (`is_pay`),
  KEY `pay_type` (`pay_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_payment_order`
--

LOCK TABLES `zjhj_bd_payment_order` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_payment_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_payment_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_payment_order_union`
--

DROP TABLE IF EXISTS `zjhj_bd_payment_order_union`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_payment_order_union` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `order_no` varchar(32) NOT NULL,
  `amount` decimal(9,2) NOT NULL,
  `is_pay` int(1) NOT NULL DEFAULT '0' COMMENT '支付状态：0=未支付，1=已支付',
  `pay_type` int(1) NOT NULL DEFAULT '0' COMMENT '支付方式：1=微信支付，2=货到付款，3=余额支付，4=支付宝支付',
  `title` varchar(128) NOT NULL,
  `support_pay_types` text COMMENT '支持的支付方式（JSON）',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `app_version` varchar(32) NOT NULL DEFAULT '' COMMENT '小程序端版本',
  PRIMARY KEY (`id`),
  KEY `mall_id` (`mall_id`),
  KEY `user_id` (`user_id`),
  KEY `order_no` (`order_no`),
  KEY `is_pay` (`is_pay`),
  KEY `pay_type` (`pay_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_payment_order_union`
--

LOCK TABLES `zjhj_bd_payment_order_union` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_payment_order_union` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_payment_order_union` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_payment_refund`
--

DROP TABLE IF EXISTS `zjhj_bd_payment_refund`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_payment_refund` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `order_no` varchar(255) NOT NULL DEFAULT '' COMMENT '退款单号',
  `amount` decimal(9,2) NOT NULL DEFAULT '0.00' COMMENT '退款金额',
  `is_pay` int(1) NOT NULL DEFAULT '0' COMMENT '支付状态 0--未支付|1--已支付',
  `pay_type` int(1) NOT NULL DEFAULT '0' COMMENT '支付方式：1=微信支付，2=货到付款，3=余额支付，4=支付宝支付',
  `title` varchar(128) NOT NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `out_trade_no` varchar(255) NOT NULL DEFAULT '' COMMENT '支付单号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='退款订单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_payment_refund`
--

LOCK TABLES `zjhj_bd_payment_refund` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_payment_refund` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_payment_refund` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_payment_transfer`
--

DROP TABLE IF EXISTS `zjhj_bd_payment_transfer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_payment_transfer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `order_no` varchar(255) NOT NULL COMMENT '提交微信或支付宝的订单号',
  `transfer_order_no` varchar(255) NOT NULL COMMENT '发起 打款的订单号',
  `amount` decimal(9,2) NOT NULL DEFAULT '0.00' COMMENT '金额',
  `is_pay` int(1) NOT NULL DEFAULT '0' COMMENT '支付状态 0--未支付|1--已支付',
  `pay_type` varchar(255) NOT NULL DEFAULT '' COMMENT '方式：wechat--微信打款 alipay--支付宝打款',
  `title` varchar(128) NOT NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='平台向用户打款';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_payment_transfer`
--

LOCK TABLES `zjhj_bd_payment_transfer` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_payment_transfer` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_payment_transfer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_pick_activity`
--

DROP TABLE IF EXISTS `zjhj_bd_pick_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_pick_activity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '状态 0下架 1上架',
  `is_delete` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '活动标题',
  `start_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '活动开始时间',
  `end_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '活动结束时间',
  `rule_price` decimal(10,2) NOT NULL COMMENT '组合方案 元',
  `rule_num` int(11) NOT NULL COMMENT '组合方案 件',
  `is_area_limit` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否单独区域购买',
  `area_limit` longtext NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_1` (`mall_id`,`is_delete`,`created_at`),
  KEY `sort` (`start_at`,`end_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='N元任选活动';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_pick_activity`
--

LOCK TABLES `zjhj_bd_pick_activity` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_pick_activity` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_pick_activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_pick_cart`
--

DROP TABLE IF EXISTS `zjhj_bd_pick_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_pick_cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL COMMENT '商品',
  `attr_id` int(11) NOT NULL COMMENT '商品规格',
  `num` int(11) NOT NULL DEFAULT '1' COMMENT '商品数量',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除',
  `created_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `attr_info` text,
  `pick_activity_id` int(11) NOT NULL COMMENT '活动id',
  PRIMARY KEY (`id`),
  KEY `mall_id` (`mall_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_pick_cart`
--

LOCK TABLES `zjhj_bd_pick_cart` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_pick_cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_pick_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_pick_goods`
--

DROP TABLE IF EXISTS `zjhj_bd_pick_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_pick_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL COMMENT '状态 0 关闭 1开启',
  `goods_id` int(11) NOT NULL DEFAULT '0',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `pick_activity_id` int(11) NOT NULL DEFAULT '0' COMMENT '活动id',
  `stock` int(11) NOT NULL COMMENT '总库存',
  `sort` int(11) NOT NULL DEFAULT '100' COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `activity` (`pick_activity_id`) USING BTREE,
  KEY `goods_id` (`goods_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='N元任选商品';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_pick_goods`
--

LOCK TABLES `zjhj_bd_pick_goods` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_pick_goods` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_pick_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_pick_setting`
--

DROP TABLE IF EXISTS `zjhj_bd_pick_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_pick_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `created_at` timestamp NOT NULL COMMENT '创建时间',
  `updated_at` timestamp NOT NULL COMMENT '更新时间',
  `is_delete` int(11) NOT NULL DEFAULT '0' COMMENT '是否删除 0--未删除 1--已删除',
  `deleted_at` timestamp NOT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='N元任选设置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_pick_setting`
--

LOCK TABLES `zjhj_bd_pick_setting` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_pick_setting` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_pick_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_pintuan_banners`
--

DROP TABLE IF EXISTS `zjhj_bd_pintuan_banners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_pintuan_banners` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `banner_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `is_delete` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_pintuan_banners`
--

LOCK TABLES `zjhj_bd_pintuan_banners` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_pintuan_banners` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_pintuan_banners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_pintuan_cats`
--

DROP TABLE IF EXISTS `zjhj_bd_pintuan_cats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_pintuan_cats` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `sort` int(11) NOT NULL DEFAULT '100',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_pintuan_cats`
--

LOCK TABLES `zjhj_bd_pintuan_cats` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_pintuan_cats` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_pintuan_cats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_pintuan_goods`
--

DROP TABLE IF EXISTS `zjhj_bd_pintuan_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_pintuan_goods` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `is_alone_buy` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许单独购买',
  `mall_id` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `end_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '拼团结束时间',
  `groups_restrictions` int(11) NOT NULL DEFAULT '-1' COMMENT '拼团次数限制',
  `is_delete` tinyint(4) NOT NULL DEFAULT '0',
  `is_sell_well` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否热销',
  `start_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '活动开始日期',
  `is_auto_add_robot` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否自动添加机器人0.否|1.是',
  `add_robot_time` int(11) NOT NULL DEFAULT '0' COMMENT '机器人参与时间0.表示不添加',
  `pintuan_goods_id` int(11) NOT NULL DEFAULT '0' COMMENT '是否为同一组',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_pintuan_goods`
--

LOCK TABLES `zjhj_bd_pintuan_goods` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_pintuan_goods` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_pintuan_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_pintuan_goods_attr`
--

DROP TABLE IF EXISTS `zjhj_bd_pintuan_goods_attr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_pintuan_goods_attr` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pintuan_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '拼团价',
  `pintuan_stock` int(11) NOT NULL COMMENT '拼团库存',
  `pintuan_goods_groups_id` int(11) NOT NULL COMMENT '拼团设置ID',
  `goods_attr_id` int(11) NOT NULL COMMENT '商城商品规格ID',
  `goods_id` int(11) NOT NULL COMMENT '商城商品ID',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_pintuan_goods_attr`
--

LOCK TABLES `zjhj_bd_pintuan_goods_attr` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_pintuan_goods_attr` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_pintuan_goods_attr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_pintuan_goods_groups`
--

DROP TABLE IF EXISTS `zjhj_bd_pintuan_goods_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_pintuan_goods_groups` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL,
  `people_num` int(11) NOT NULL DEFAULT '2' COMMENT '拼团人数',
  `preferential_price` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '团长优惠',
  `pintuan_time` int(11) NOT NULL DEFAULT '1' COMMENT '拼团限间',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  `group_num` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_pintuan_goods_groups`
--

LOCK TABLES `zjhj_bd_pintuan_goods_groups` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_pintuan_goods_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_pintuan_goods_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_pintuan_goods_member_price`
--

DROP TABLE IF EXISTS `zjhj_bd_pintuan_goods_member_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_pintuan_goods_member_price` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `level` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `goods_id` int(11) NOT NULL COMMENT '商城商品ID',
  `goods_attr_id` int(11) NOT NULL COMMENT '商城商品规格ID',
  `pintuan_goods_groups_id` int(11) NOT NULL COMMENT '拼团设置ID',
  `pintuan_goods_attr_id` int(11) NOT NULL COMMENT '拼团商品规格ID',
  `is_delete` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_pintuan_goods_member_price`
--

LOCK TABLES `zjhj_bd_pintuan_goods_member_price` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_pintuan_goods_member_price` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_pintuan_goods_member_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_pintuan_goods_share`
--

DROP TABLE IF EXISTS `zjhj_bd_pintuan_goods_share`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_pintuan_goods_share` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `share_commission_first` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '一级分销佣金比例',
  `share_commission_second` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '二级分销佣金比例',
  `share_commission_third` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '三级分销佣金比例',
  `goods_id` int(11) NOT NULL,
  `goods_attr_id` int(11) NOT NULL COMMENT '商城商品规格ID',
  `pintuan_goods_groups_id` int(11) NOT NULL COMMENT '拼团设置ID',
  `pintuan_goods_attr_id` int(11) NOT NULL DEFAULT '0' COMMENT '拼团商品规格ID',
  `is_delete` tinyint(4) NOT NULL DEFAULT '0',
  `level` int(11) NOT NULL DEFAULT '0' COMMENT '分销商等级',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_pintuan_goods_share`
--

LOCK TABLES `zjhj_bd_pintuan_goods_share` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_pintuan_goods_share` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_pintuan_goods_share` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_pintuan_order_relation`
--

DROP TABLE IF EXISTS `zjhj_bd_pintuan_order_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_pintuan_order_relation` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL COMMENT '商城订单ID',
  `user_id` int(11) NOT NULL,
  `pintuan_order_id` int(11) NOT NULL COMMENT '组团订单ID',
  `is_parent` tinyint(11) NOT NULL DEFAULT '0' COMMENT '是否为团长',
  `is_groups` tinyint(4) NOT NULL COMMENT '0.单独购买|1.拼团购买',
  `created_at` timestamp NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  `robot_id` int(11) NOT NULL DEFAULT '0',
  `cancel_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '拼团订单取消状态:0.未取消|1.超出拼团总人数取消',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_pintuan_order_relation`
--

LOCK TABLES `zjhj_bd_pintuan_order_relation` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_pintuan_order_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_pintuan_order_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_pintuan_orders`
--

DROP TABLE IF EXISTS `zjhj_bd_pintuan_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_pintuan_orders` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `preferential_price` decimal(10,2) NOT NULL COMMENT '团长优惠',
  `mall_id` int(11) NOT NULL,
  `success_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '成团时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0.待付款|1.拼团中|2.拼团成功|3.拼团失败',
  `people_num` int(11) NOT NULL COMMENT '成团所需人数',
  `pintuan_time` int(11) NOT NULL DEFAULT '2' COMMENT '拼团限时(小时)',
  `pintuan_goods_groups_id` int(11) NOT NULL COMMENT '阶梯团ID',
  `goods_id` int(11) NOT NULL COMMENT '商品ID',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `expected_over_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_name` (`expected_over_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_pintuan_orders`
--

LOCK TABLES `zjhj_bd_pintuan_orders` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_pintuan_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_pintuan_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_pintuan_robots`
--

DROP TABLE IF EXISTS `zjhj_bd_pintuan_robots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_pintuan_robots` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `nickname` varchar(65) NOT NULL DEFAULT '' COMMENT '机器人昵称',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_pintuan_robots`
--

LOCK TABLES `zjhj_bd_pintuan_robots` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_pintuan_robots` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_pintuan_robots` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_pintuan_setting`
--

DROP TABLE IF EXISTS `zjhj_bd_pintuan_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_pintuan_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `is_share` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否开启分销',
  `is_sms` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否短信提醒',
  `is_mail` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否开启邮件通知',
  `is_print` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否开启订单打印',
  `rules` text NOT NULL COMMENT '拼团规则',
  `is_territorial_limitation` tinyint(1) NOT NULL DEFAULT '0' COMMENT '区域购买限制',
  `advertisement` text NOT NULL COMMENT '拼团广告',
  `is_advertisement` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否开启拼团广告',
  `created_at` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `payment_type` longtext NOT NULL COMMENT '支付方式',
  `send_type` longtext NOT NULL COMMENT '发货方式',
  `goods_poster` longtext NOT NULL COMMENT '自定义海报',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='砍价设置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_pintuan_setting`
--

LOCK TABLES `zjhj_bd_pintuan_setting` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_pintuan_setting` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_pintuan_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_plugin_cat`
--

DROP TABLE IF EXISTS `zjhj_bd_plugin_cat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_plugin_cat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(24) NOT NULL,
  `display_name` varchar(255) NOT NULL,
  `color` varchar(24) NOT NULL DEFAULT '',
  `sort` int(11) NOT NULL DEFAULT '100',
  `icon` text,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  `add_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `sort` (`sort`),
  KEY `is_delete` (`is_delete`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_plugin_cat`
--

LOCK TABLES `zjhj_bd_plugin_cat` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_plugin_cat` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_plugin_cat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_plugin_cat_rel`
--

DROP TABLE IF EXISTS `zjhj_bd_plugin_cat_rel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_plugin_cat_rel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plugin_name` varchar(32) NOT NULL,
  `plugin_cat_name` varchar(24) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `plugin_name` (`plugin_name`),
  KEY `plugin_cat_name` (`plugin_cat_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_plugin_cat_rel`
--

LOCK TABLES `zjhj_bd_plugin_cat_rel` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_plugin_cat_rel` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_plugin_cat_rel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_pond`
--

DROP TABLE IF EXISTS `zjhj_bd_pond`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_pond` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '别名',
  `type` int(11) NOT NULL COMMENT '1.红包2.优惠卷3.积分4.实物.5.无',
  `goods_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品',
  `num` int(11) NOT NULL DEFAULT '0' COMMENT '积分数量',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '红包价格',
  `image_url` varchar(255) NOT NULL DEFAULT '' COMMENT '图片',
  `coupon_id` int(11) NOT NULL DEFAULT '0' COMMENT '优惠卷',
  `stock` int(11) NOT NULL DEFAULT '0' COMMENT '库存',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_pond`
--

LOCK TABLES `zjhj_bd_pond` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_pond` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_pond` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_pond_log`
--

DROP TABLE IF EXISTS `zjhj_bd_pond_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_pond_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL DEFAULT '0',
  `pond_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` int(11) NOT NULL COMMENT ' 0未领取1 已领取',
  `type` int(11) NOT NULL COMMENT '1.红包2.优惠卷3.积分4.实物5无',
  `num` int(11) NOT NULL DEFAULT '0' COMMENT '积分数量',
  `detail` varchar(2000) NOT NULL DEFAULT '' COMMENT '优惠券信息',
  `goods_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品id',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '价格',
  `order_id` int(11) NOT NULL DEFAULT '0',
  `raffled_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_at` timestamp NOT NULL,
  `token` varchar(255) NOT NULL DEFAULT '' COMMENT '订单表token',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `mall_id` (`mall_id`),
  KEY `pond_id` (`pond_id`),
  KEY `user_id` (`user_id`),
  KEY `status` (`status`),
  KEY `type` (`type`),
  KEY `goods_id` (`goods_id`),
  KEY `order_id` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_pond_log`
--

LOCK TABLES `zjhj_bd_pond_log` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_pond_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_pond_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_pond_log_coupon_relation`
--

DROP TABLE IF EXISTS `zjhj_bd_pond_log_coupon_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_pond_log_coupon_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `user_coupon_id` int(11) NOT NULL COMMENT '用户优惠券id',
  `pond_log_id` int(11) NOT NULL COMMENT '奖品记录id',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除',
  `created_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_pond_log_coupon_relation`
--

LOCK TABLES `zjhj_bd_pond_log_coupon_relation` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_pond_log_coupon_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_pond_log_coupon_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_pond_order`
--

DROP TABLE IF EXISTS `zjhj_bd_pond_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_pond_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `pond_log_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除',
  `deleted_at` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_pond_order`
--

LOCK TABLES `zjhj_bd_pond_order` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_pond_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_pond_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_pond_setting`
--

DROP TABLE IF EXISTS `zjhj_bd_pond_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_pond_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '小程序标题',
  `type` smallint(1) NOT NULL COMMENT '1.天 2 用户',
  `probability` int(11) NOT NULL DEFAULT '0' COMMENT '概率',
  `oppty` int(11) NOT NULL DEFAULT '0' COMMENT '抽奖次数',
  `start_at` timestamp NOT NULL COMMENT '开始时间',
  `end_at` timestamp NOT NULL COMMENT '结束时间',
  `deplete_integral_num` int(11) NOT NULL DEFAULT '0' COMMENT '消耗积分',
  `rule` longtext NOT NULL COMMENT '规则',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `payment_type` longtext NOT NULL COMMENT '支付方式',
  `send_type` longtext NOT NULL COMMENT '发货方式',
  `is_sms` tinyint(1) NOT NULL DEFAULT '0' COMMENT '开启短信提醒',
  `is_mail` tinyint(1) NOT NULL DEFAULT '0' COMMENT '开启邮件提醒',
  `is_print` tinyint(1) NOT NULL DEFAULT '0' COMMENT '开启打印',
  `bg_pic` varchar(255) NOT NULL DEFAULT '' COMMENT '背景图',
  `bg_color` varchar(255) NOT NULL DEFAULT '' COMMENT '背景颜色',
  `bg_color_type` varchar(255) NOT NULL DEFAULT '' COMMENT '背景颜色类型',
  `bg_gradient_color` varchar(255) NOT NULL DEFAULT '' COMMENT '背景渐变颜色',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_pond_setting`
--

LOCK TABLES `zjhj_bd_pond_setting` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_pond_setting` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_pond_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_postage_rules`
--

DROP TABLE IF EXISTS `zjhj_bd_postage_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_postage_rules` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `mch_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(65) NOT NULL DEFAULT '',
  `detail` longtext NOT NULL COMMENT '规则详情',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否默认',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '计费方式【1=>按重计费、2=>按件计费】',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_postage_rules`
--

LOCK TABLES `zjhj_bd_postage_rules` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_postage_rules` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_postage_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_printer`
--

DROP TABLE IF EXISTS `zjhj_bd_printer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_printer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `mch_id` int(11) NOT NULL DEFAULT '0',
  `type` varchar(255) NOT NULL COMMENT '类型',
  `name` varchar(255) NOT NULL COMMENT '名称',
  `setting` longtext NOT NULL COMMENT '设置',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_printer`
--

LOCK TABLES `zjhj_bd_printer` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_printer` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_printer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_printer_setting`
--

DROP TABLE IF EXISTS `zjhj_bd_printer_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_printer_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `mch_id` int(11) NOT NULL DEFAULT '0',
  `printer_id` int(11) NOT NULL COMMENT '打印机id',
  `block_id` int(11) NOT NULL DEFAULT '0' COMMENT '模板id',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0关闭 1启用',
  `is_attr` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0不使用规格 1使用规格',
  `type` longtext NOT NULL COMMENT 'order(下单打印)-> 0关闭 1开启 \r\npay (付款打印)-> 0关闭 1开启 \r\nconfirm (确认收货打印)-> 0关闭 1开启 \r\n ',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `big` int(11) NOT NULL DEFAULT '0' COMMENT '放大倍数',
  `show_type` longtext NOT NULL COMMENT '打印参数 attr 规格 goods_no 货号 form_data 下单表单',
  `store_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mall_id` (`mall_id`),
  KEY `mch_id` (`mch_id`),
  KEY `status` (`status`),
  KEY `store_id` (`store_id`),
  KEY `is_delete` (`is_delete`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_printer_setting`
--

LOCK TABLES `zjhj_bd_printer_setting` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_printer_setting` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_printer_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_qr_code_parameter`
--

DROP TABLE IF EXISTS `zjhj_bd_qr_code_parameter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_qr_code_parameter` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `token` varchar(30) NOT NULL DEFAULT '',
  `data` mediumtext NOT NULL,
  `created_at` timestamp NOT NULL,
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '小程序路径',
  `use_number` int(11) NOT NULL DEFAULT '0' COMMENT '使用次数',
  PRIMARY KEY (`id`),
  KEY `mall_id` (`mall_id`),
  KEY `token` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_qr_code_parameter`
--

LOCK TABLES `zjhj_bd_qr_code_parameter` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_qr_code_parameter` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_qr_code_parameter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_quick_share_goods`
--

DROP TABLE IF EXISTS `zjhj_bd_quick_share_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_quick_share_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  `share_text` varchar(255) NOT NULL COMMENT '分享文本',
  `share_pic` longtext NOT NULL COMMENT '素材图片',
  `material_sort` int(11) NOT NULL DEFAULT '0' COMMENT '素材排序',
  `is_top` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否置顶',
  `material_video_url` varchar(255) NOT NULL DEFAULT '' COMMENT '动态视频',
  `material_cover_url` varchar(255) NOT NULL DEFAULT '' COMMENT '视频封面',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  PRIMARY KEY (`id`),
  KEY `goods_id` (`goods_id`) USING BTREE,
  KEY `mall_id` (`mall_id`),
  KEY `status` (`status`),
  KEY `is_top` (`is_top`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_quick_share_goods`
--

LOCK TABLES `zjhj_bd_quick_share_goods` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_quick_share_goods` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_quick_share_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_quick_share_setting`
--

DROP TABLE IF EXISTS `zjhj_bd_quick_share_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_quick_share_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '发圈对象 仅素材 1全部商品',
  `goods_poster` longtext NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_quick_share_setting`
--

LOCK TABLES `zjhj_bd_quick_share_setting` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_quick_share_setting` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_quick_share_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_quick_shop_cats`
--

DROP TABLE IF EXISTS `zjhj_bd_quick_shop_cats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_quick_shop_cats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_quick_shop_cats`
--

LOCK TABLES `zjhj_bd_quick_shop_cats` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_quick_shop_cats` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_quick_shop_cats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_recharge`
--

DROP TABLE IF EXISTS `zjhj_bd_recharge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_recharge` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '名称',
  `pay_price` decimal(10,2) NOT NULL COMMENT '支付价格',
  `send_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '赠送价格',
  `is_delete` smallint(1) NOT NULL DEFAULT '0' COMMENT '删除',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `send_integral` int(11) NOT NULL DEFAULT '0' COMMENT '赠送的积分',
  `send_member_id` int(11) NOT NULL DEFAULT '0' COMMENT '赠送的会员',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_recharge`
--

LOCK TABLES `zjhj_bd_recharge` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_recharge` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_recharge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_recharge_orders`
--

DROP TABLE IF EXISTS `zjhj_bd_recharge_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_recharge_orders` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `order_no` varchar(32) NOT NULL DEFAULT '',
  `user_id` int(11) NOT NULL,
  `pay_price` decimal(10,2) NOT NULL COMMENT '充值金额',
  `send_price` decimal(10,2) NOT NULL COMMENT '赠送金额',
  `pay_type` tinyint(4) NOT NULL COMMENT '支付方式 1.线上支付',
  `is_pay` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否支付 0--未支付 1--支付',
  `pay_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_delete` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `send_integral` int(11) NOT NULL DEFAULT '0' COMMENT '赠送的积分',
  `send_member_id` int(11) NOT NULL DEFAULT '0' COMMENT '赠送的会员',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_recharge_orders`
--

LOCK TABLES `zjhj_bd_recharge_orders` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_recharge_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_recharge_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_refund_address`
--

DROP TABLE IF EXISTS `zjhj_bd_refund_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_refund_address` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `mch_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(65) NOT NULL DEFAULT '',
  `address` varchar(255) NOT NULL DEFAULT '',
  `address_detail` varchar(255) NOT NULL DEFAULT '',
  `mobile` varchar(255) NOT NULL DEFAULT '',
  `remark` varchar(255) NOT NULL DEFAULT '',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_refund_address`
--

LOCK TABLES `zjhj_bd_refund_address` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_refund_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_refund_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_region_area`
--

DROP TABLE IF EXISTS `zjhj_bd_region_area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_region_area` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '区域名称',
  `province_rate` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '省代理分红比例',
  `city_rate` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '市代理分红比例',
  `district_rate` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '区/县分红比例',
  `province_condition` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '省代理条件',
  `city_condition` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '市代理条件',
  `district_condition` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '区/县代理条件',
  `become_type` tinyint(2) NOT NULL DEFAULT '0' COMMENT '1:下线总人数\r\n2:分销订单总数\r\n3:分销订单总金额\r\n4:累计佣金总额\r\n5:已提现佣金总额\r\n6:消费金额',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_1` (`mall_id`,`is_delete`,`created_at`),
  KEY `created_at` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='区域区域表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_region_area`
--

LOCK TABLES `zjhj_bd_region_area` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_region_area` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_region_area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_region_area_detail`
--

DROP TABLE IF EXISTS `zjhj_bd_region_area_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_region_area_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `area_id` int(11) NOT NULL COMMENT '区域id',
  `province_id` int(2) NOT NULL COMMENT '省id',
  `is_delete` tinyint(2) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `area_id` (`area_id`),
  KEY `index_1` (`mall_id`,`area_id`,`is_delete`),
  KEY `created_at` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='代理区域详情表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_region_area_detail`
--

LOCK TABLES `zjhj_bd_region_area_detail` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_region_area_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_region_area_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_region_bonus_log`
--

DROP TABLE IF EXISTS `zjhj_bd_region_bonus_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_region_bonus_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL DEFAULT '0',
  `bonus_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '1按周，2按月',
  `pre_bonus_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '预计分红金额',
  `bonus_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '分红金额',
  `bonus_rate` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '当时的分红比例',
  `pre_order_num` int(11) NOT NULL DEFAULT '0' COMMENT '预计分红订单数',
  `order_num` int(11) NOT NULL DEFAULT '0' COMMENT '分红订单数',
  `region_num` int(11) NOT NULL DEFAULT '0' COMMENT '当时区域人数',
  `start_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '分红时间段-开始时间',
  `end_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '分红时间段-结束时间',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_region_bonus_log`
--

LOCK TABLES `zjhj_bd_region_bonus_log` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_region_bonus_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_region_bonus_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_region_cash`
--

DROP TABLE IF EXISTS `zjhj_bd_region_cash`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_region_cash` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `order_no` varchar(255) NOT NULL DEFAULT '' COMMENT '订单号',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '提现金额',
  `service_charge` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '提现手续费（%）',
  `type` varchar(255) NOT NULL DEFAULT '' COMMENT '提现方式 auto--自动打款 wechat--微信打款 alipay--支付宝打款 bank--银行转账 balance--打款到余额',
  `extra` longtext NOT NULL COMMENT '额外信息 例如微信账号、支付宝账号等',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '提现状态 0--申请 1--同意 2--已打款 3--驳回',
  `is_delete` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL,
  `content` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='提现记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_region_cash`
--

LOCK TABLES `zjhj_bd_region_cash` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_region_cash` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_region_cash` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_region_cash_log`
--

DROP TABLE IF EXISTS `zjhj_bd_region_cash_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_region_cash_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `type` int(11) NOT NULL DEFAULT '1' COMMENT '类型 1--收入 2--支出',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '变动佣金',
  `desc` longtext,
  `custom_desc` longtext,
  `level_id` int(11) NOT NULL DEFAULT '0' COMMENT '当时的区域等级',
  `level_name` varchar(100) NOT NULL DEFAULT '',
  `order_num` int(11) NOT NULL DEFAULT '0',
  `bonus_rate` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '当时的分红比例',
  `bonus_id` int(11) NOT NULL DEFAULT '0' COMMENT '区域完成分红记录ID',
  `is_delete` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `province_id` int(11) NOT NULL DEFAULT '0',
  `city_id` int(11) NOT NULL DEFAULT '0',
  `district_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_1` (`mall_id`,`is_delete`,`province_id`,`level_id`,`type`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='分红日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_region_cash_log`
--

LOCK TABLES `zjhj_bd_region_cash_log` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_region_cash_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_region_cash_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_region_level_up`
--

DROP TABLE IF EXISTS `zjhj_bd_region_level_up`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_region_level_up` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:申请升级中  1:通过升级 2:拒绝升级',
  `level` tinyint(1) NOT NULL COMMENT '升级的等级',
  `reason` varchar(512) NOT NULL DEFAULT '' COMMENT '理由',
  `is_read` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0未读  1已读',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `idx_1` (`mall_id`,`is_delete`,`user_id`,`created_at`),
  KEY `idx_2` (`user_id`),
  KEY `idx_3` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='代理升级申请表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_region_level_up`
--

LOCK TABLES `zjhj_bd_region_level_up` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_region_level_up` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_region_level_up` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_region_order`
--

DROP TABLE IF EXISTS `zjhj_bd_region_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_region_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL DEFAULT '0',
  `order_id` int(11) NOT NULL DEFAULT '0',
  `total_pay_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '订单实付金额',
  `is_bonus` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1已分红，0未分红',
  `bonus_rate` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '分红比例',
  `bonus_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '分红时间',
  `bonus_id` int(11) NOT NULL DEFAULT '0' COMMENT '区域完成分红记录ID',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  `deleted_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `province` varchar(20) NOT NULL COMMENT '省',
  `city` varchar(20) NOT NULL COMMENT '市',
  `district` varchar(20) NOT NULL COMMENT '区',
  `province_id` int(11) NOT NULL DEFAULT '0',
  `city_id` int(11) NOT NULL DEFAULT '0',
  `district_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='分红池';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_region_order`
--

LOCK TABLES `zjhj_bd_region_order` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_region_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_region_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_region_relation`
--

DROP TABLE IF EXISTS `zjhj_bd_region_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_region_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL COMMENT '代理id',
  `district_id` int(11) NOT NULL COMMENT '代理的省市区id',
  `is_update` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否是升级中的关联地区0：否 1：是',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `mall_id` (`mall_id`,`district_id`,`is_update`,`is_delete`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='代理 --- 地区关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_region_relation`
--

LOCK TABLES `zjhj_bd_region_relation` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_region_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_region_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_region_setting`
--

DROP TABLE IF EXISTS `zjhj_bd_region_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_region_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `created_at` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_delete` int(11) NOT NULL DEFAULT '0' COMMENT '是否删除 0--未删除 1--已删除',
  `deleted_at` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='区域分红设置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_region_setting`
--

LOCK TABLES `zjhj_bd_region_setting` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_region_setting` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_region_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_region_user`
--

DROP TABLE IF EXISTS `zjhj_bd_region_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_region_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `area_id` int(11) NOT NULL COMMENT '区域ID',
  `province_id` int(11) NOT NULL COMMENT '所属省',
  `level` tinyint(2) NOT NULL COMMENT '1:省代理  2:市代理 3:区代理',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '-2被拒或移除后再次申请没提交 -1移除 0审核中，1同意，2拒绝',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `applyed_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '申请时间',
  `agreed_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '审核时间',
  PRIMARY KEY (`id`),
  KEY `created_at` (`created_at`),
  KEY `idx_1` (`mall_id`,`is_delete`,`status`,`created_at`) USING BTREE,
  KEY `idx_2` (`mall_id`,`is_delete`,`user_id`,`status`,`created_at`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='代理表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_region_user`
--

LOCK TABLES `zjhj_bd_region_user` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_region_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_region_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_region_user_info`
--

DROP TABLE IF EXISTS `zjhj_bd_region_user_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_region_user_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '区域姓名',
  `phone` varchar(11) NOT NULL DEFAULT '' COMMENT '区域手机号',
  `all_bonus` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '累计分红',
  `total_bonus` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '当前分红',
  `out_bonus` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '已提现分红',
  `remark` varchar(200) NOT NULL DEFAULT '' COMMENT '备注',
  `reason` text NOT NULL COMMENT '拒绝理由',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `idx_1` (`user_id`,`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='代理信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_region_user_info`
--

LOCK TABLES `zjhj_bd_region_user_info` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_region_user_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_region_user_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_scan_code_pay_activities`
--

DROP TABLE IF EXISTS `zjhj_bd_scan_code_pay_activities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_scan_code_pay_activities` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '活动名称',
  `start_time` timestamp NOT NULL COMMENT '活动开始时间',
  `end_time` timestamp NOT NULL COMMENT '活动结束时间',
  `send_type` tinyint(1) NOT NULL DEFAULT '2' COMMENT '1.赠送所有规则|2.赠送满足最高规则',
  `rules` text COMMENT '买单规则',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否启用',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_scan_code_pay_activities`
--

LOCK TABLES `zjhj_bd_scan_code_pay_activities` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_scan_code_pay_activities` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_scan_code_pay_activities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_scan_code_pay_activities_groups`
--

DROP TABLE IF EXISTS `zjhj_bd_scan_code_pay_activities_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_scan_code_pay_activities_groups` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `activity_id` int(11) NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_scan_code_pay_activities_groups`
--

LOCK TABLES `zjhj_bd_scan_code_pay_activities_groups` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_scan_code_pay_activities_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_scan_code_pay_activities_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_scan_code_pay_activities_groups_level`
--

DROP TABLE IF EXISTS `zjhj_bd_scan_code_pay_activities_groups_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_scan_code_pay_activities_groups_level` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_scan_code_pay_activities_groups_level`
--

LOCK TABLES `zjhj_bd_scan_code_pay_activities_groups_level` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_scan_code_pay_activities_groups_level` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_scan_code_pay_activities_groups_level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_scan_code_pay_activities_groups_rules`
--

DROP TABLE IF EXISTS `zjhj_bd_scan_code_pay_activities_groups_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_scan_code_pay_activities_groups_rules` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `rules_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1.赠送规则|2.优惠规则',
  `consume_money` decimal(10,2) NOT NULL COMMENT '单次消费金额',
  `send_integral_num` int(11) NOT NULL COMMENT '赠送积分',
  `send_integral_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1.固定值|2.百分比',
  `send_money` decimal(10,2) NOT NULL COMMENT '赠送余额',
  `preferential_money` decimal(10,2) NOT NULL COMMENT '优惠金额',
  `integral_deduction` int(11) NOT NULL COMMENT '积分抵扣',
  `integral_deduction_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1.固定值|2.百分比',
  `is_coupon` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否可使用优惠券',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_scan_code_pay_activities_groups_rules`
--

LOCK TABLES `zjhj_bd_scan_code_pay_activities_groups_rules` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_scan_code_pay_activities_groups_rules` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_scan_code_pay_activities_groups_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_scan_code_pay_activities_groups_rules_cards`
--

DROP TABLE IF EXISTS `zjhj_bd_scan_code_pay_activities_groups_rules_cards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_scan_code_pay_activities_groups_rules_cards` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `group_rule_id` int(11) NOT NULL,
  `card_id` int(11) NOT NULL,
  `send_num` int(11) NOT NULL COMMENT '赠送数量',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_scan_code_pay_activities_groups_rules_cards`
--

LOCK TABLES `zjhj_bd_scan_code_pay_activities_groups_rules_cards` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_scan_code_pay_activities_groups_rules_cards` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_scan_code_pay_activities_groups_rules_cards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_scan_code_pay_activities_groups_rules_coupons`
--

DROP TABLE IF EXISTS `zjhj_bd_scan_code_pay_activities_groups_rules_coupons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_scan_code_pay_activities_groups_rules_coupons` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `group_rule_id` int(11) NOT NULL,
  `coupon_id` int(11) NOT NULL,
  `send_num` int(11) NOT NULL COMMENT '赠送数量',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_scan_code_pay_activities_groups_rules_coupons`
--

LOCK TABLES `zjhj_bd_scan_code_pay_activities_groups_rules_coupons` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_scan_code_pay_activities_groups_rules_coupons` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_scan_code_pay_activities_groups_rules_coupons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_scan_code_pay_orders`
--

DROP TABLE IF EXISTS `zjhj_bd_scan_code_pay_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_scan_code_pay_orders` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `activity_preferential_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '活动优惠价格',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_scan_code_pay_orders`
--

LOCK TABLES `zjhj_bd_scan_code_pay_orders` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_scan_code_pay_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_scan_code_pay_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_scan_code_pay_setting`
--

DROP TABLE IF EXISTS `zjhj_bd_scan_code_pay_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_scan_code_pay_setting` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `is_scan_code_pay` tinyint(1) NOT NULL DEFAULT '0',
  `payment_type` text NOT NULL,
  `is_share` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否开启分销',
  `is_sms` tinyint(1) NOT NULL DEFAULT '0',
  `is_mail` tinyint(1) NOT NULL DEFAULT '0',
  `share_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1.百分比|2.固定金额',
  `share_commission_first` decimal(10,2) NOT NULL DEFAULT '0.00',
  `share_commission_second` decimal(10,2) NOT NULL DEFAULT '0.00',
  `share_commission_third` decimal(10,2) NOT NULL DEFAULT '0.00',
  `poster` mediumtext NOT NULL COMMENT '自定义海报',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_scan_code_pay_setting`
--

LOCK TABLES `zjhj_bd_scan_code_pay_setting` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_scan_code_pay_setting` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_scan_code_pay_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_scratch`
--

DROP TABLE IF EXISTS `zjhj_bd_scratch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_scratch` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `type` int(11) NOT NULL COMMENT '1.红包2.优惠卷3.积分4.实物.5.无',
  `status` tinyint(1) NOT NULL COMMENT '状态 0 关闭 1开启',
  `goods_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品',
  `num` int(11) NOT NULL DEFAULT '0' COMMENT '积分数量',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '红包价格',
  `coupon_id` int(11) NOT NULL DEFAULT '0' COMMENT '优惠券',
  `stock` int(11) NOT NULL DEFAULT '0' COMMENT '库存',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_scratch`
--

LOCK TABLES `zjhj_bd_scratch` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_scratch` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_scratch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_scratch_log`
--

DROP TABLE IF EXISTS `zjhj_bd_scratch_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_scratch_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `scratch_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0' COMMENT ' 0预领取 1 未领取 2 已领取',
  `type` int(11) NOT NULL DEFAULT '0' COMMENT '1.红包2.优惠卷3.积分4.实物5无',
  `num` int(11) NOT NULL DEFAULT '0' COMMENT '积分数量',
  `detail` longtext NOT NULL COMMENT '优惠券信息',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '价格',
  `order_id` int(11) NOT NULL DEFAULT '0',
  `goods_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品ID',
  `raffled_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_at` timestamp NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除',
  `deleted_at` timestamp NOT NULL,
  `token` varchar(255) NOT NULL DEFAULT '' COMMENT '订单表token',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_scratch_log`
--

LOCK TABLES `zjhj_bd_scratch_log` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_scratch_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_scratch_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_scratch_log_coupon_relation`
--

DROP TABLE IF EXISTS `zjhj_bd_scratch_log_coupon_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_scratch_log_coupon_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `user_coupon_id` int(11) NOT NULL COMMENT '用户优惠券id',
  `scratch_log_id` int(11) NOT NULL COMMENT '记录id',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除',
  `created_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_scratch_log_coupon_relation`
--

LOCK TABLES `zjhj_bd_scratch_log_coupon_relation` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_scratch_log_coupon_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_scratch_log_coupon_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_scratch_order`
--

DROP TABLE IF EXISTS `zjhj_bd_scratch_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_scratch_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `scratch_log_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除',
  `deleted_at` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_scratch_order`
--

LOCK TABLES `zjhj_bd_scratch_order` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_scratch_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_scratch_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_scratch_setting`
--

DROP TABLE IF EXISTS `zjhj_bd_scratch_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_scratch_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '小程序标题',
  `type` smallint(1) NOT NULL COMMENT '1.天 2 用户',
  `probability` int(11) NOT NULL DEFAULT '0' COMMENT '概率',
  `oppty` int(11) NOT NULL DEFAULT '0' COMMENT '抽奖次数',
  `start_at` timestamp NOT NULL COMMENT '开始时间',
  `end_at` timestamp NOT NULL COMMENT '结束时间',
  `deplete_integral_num` int(11) NOT NULL DEFAULT '0' COMMENT '消耗积分',
  `rule` longtext NOT NULL COMMENT '规则',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `payment_type` longtext NOT NULL COMMENT '支付方式',
  `send_type` longtext NOT NULL COMMENT '发货方式',
  `is_sms` tinyint(1) NOT NULL DEFAULT '0' COMMENT '开启短信提醒',
  `is_mail` tinyint(1) NOT NULL DEFAULT '0' COMMENT '开启邮件提醒',
  `is_print` tinyint(1) NOT NULL DEFAULT '0' COMMENT '开启打印',
  `bg_pic` varchar(255) NOT NULL DEFAULT '' COMMENT '背景图',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_scratch_setting`
--

LOCK TABLES `zjhj_bd_scratch_setting` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_scratch_setting` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_scratch_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_share`
--

DROP TABLE IF EXISTS `zjhj_bd_share`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_share` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '分销商名称',
  `mobile` varchar(255) NOT NULL DEFAULT '' COMMENT '分销商手机号',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '可提现佣金',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '用户申请分销商状态0--申请中 1--成功 2--失败',
  `total_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '累计佣金',
  `content` longtext COMMENT '备注',
  `is_delete` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL,
  `apply_at` datetime DEFAULT NULL COMMENT '申请时间',
  `become_at` datetime DEFAULT NULL COMMENT '成为分销商时间',
  `reason` longtext COMMENT '审核原因',
  `first_children` int(11) NOT NULL DEFAULT '0' COMMENT '直接下级数量',
  `all_children` int(11) NOT NULL DEFAULT '0' COMMENT '所有下级数量',
  `all_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '总佣金数量(包括已发放和未发放且未退款的佣金）',
  `all_order` int(11) NOT NULL DEFAULT '0' COMMENT '分销订单数量',
  `level` int(11) NOT NULL DEFAULT '0' COMMENT '分销商等级',
  `level_at` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '成为分销商等级时间',
  `delete_first_show` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除后是否第一次展示',
  PRIMARY KEY (`id`),
  KEY `mall_id` (`mall_id`),
  KEY `is_delete` (`is_delete`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='分销商信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_share`
--

LOCK TABLES `zjhj_bd_share` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_share` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_share` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_share_cash`
--

DROP TABLE IF EXISTS `zjhj_bd_share_cash`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_share_cash` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `order_no` varchar(255) NOT NULL DEFAULT '' COMMENT '订单号',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '提现金额',
  `service_charge` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '提现手续费（%）',
  `type` varchar(255) NOT NULL DEFAULT '' COMMENT '提现方式 auto--自动打款 wechat--微信打款 alipay--支付宝打款 bank--银行转账 balance--打款到余额',
  `extra` longtext COMMENT '额外信息 例如微信账号、支付宝账号等',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '提现状态 0--申请 1--同意 2--已打款 3--驳回',
  `is_delete` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL,
  `content` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='提现记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_share_cash`
--

LOCK TABLES `zjhj_bd_share_cash` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_share_cash` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_share_cash` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_share_cash_log`
--

DROP TABLE IF EXISTS `zjhj_bd_share_cash_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_share_cash_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `type` int(11) NOT NULL DEFAULT '1' COMMENT '类型 1--收入 2--支出',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '变动佣金',
  `desc` longtext,
  `custom_desc` longtext,
  `is_delete` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `mall_id` (`mall_id`),
  KEY `user_id` (`user_id`),
  KEY `type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_share_cash_log`
--

LOCK TABLES `zjhj_bd_share_cash_log` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_share_cash_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_share_cash_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_share_level`
--

DROP TABLE IF EXISTS `zjhj_bd_share_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_share_level` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `level` int(11) NOT NULL DEFAULT '1' COMMENT '分销等级1~100',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '分销等级名称',
  `condition_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '升级条件：1--下线用户数|2--累计佣金|3--已提现佣金',
  `condition` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '下线用户数（人）|累计佣金数（元）|已提现佣金数（元）',
  `price_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '分销佣金类型：1--百分比|2--固定金额',
  `first` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '一级分销佣金数（元）',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否启用',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `second` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '二级分销佣金数（元）',
  `third` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '三级分销佣金数（元）',
  `is_auto_level` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否启用自动升级',
  `rule` varchar(255) NOT NULL DEFAULT '' COMMENT '等级说明',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_share_level`
--

LOCK TABLES `zjhj_bd_share_level` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_share_level` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_share_level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_share_order`
--

DROP TABLE IF EXISTS `zjhj_bd_share_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_share_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `order_detail_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL COMMENT '购物者用户id',
  `first_parent_id` int(11) NOT NULL DEFAULT '0' COMMENT '上一级用户id',
  `second_parent_id` int(11) NOT NULL DEFAULT '0' COMMENT '上二级用户id',
  `third_parent_id` int(11) NOT NULL DEFAULT '0' COMMENT '上三级用户id',
  `first_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '上一级分销佣金',
  `second_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '上二级分销佣金',
  `third_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '上三级分销佣金',
  `is_refund` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0未退款 1退款',
  `is_transfer` tinyint(1) NOT NULL DEFAULT '0' COMMENT '佣金发放状态：0=未发放，1=已发放',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '用于分销的金额',
  `first_share_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '一级分销的分销类型',
  `first_share_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '一级佣金',
  `second_share_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '二级分销的分销类型',
  `second_share_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '二级佣金',
  `third_share_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '三级分销的分销类型',
  `third_share_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '三级佣金',
  `flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '修改记录 0--售后优化之前的分销订单 1--售后优化之后的订单',
  PRIMARY KEY (`id`),
  KEY `mall_id` (`mall_id`),
  KEY `order_id` (`order_id`),
  KEY `order_detail_id` (`order_detail_id`),
  KEY `user_id` (`user_id`),
  KEY `first_parent_id` (`first_parent_id`),
  KEY `second_parent_id` (`second_parent_id`),
  KEY `third_parent_id` (`third_parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='分销订单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_share_order`
--

LOCK TABLES `zjhj_bd_share_order` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_share_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_share_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_share_order_log`
--

DROP TABLE IF EXISTS `zjhj_bd_share_order_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_share_order_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `share_setting` longtext NOT NULL COMMENT '分销设置情况',
  `order_share_info` longtext NOT NULL COMMENT '订单分销情况',
  `created_at` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_share_order_log`
--

LOCK TABLES `zjhj_bd_share_order_log` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_share_order_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_share_order_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_share_setting`
--

DROP TABLE IF EXISTS `zjhj_bd_share_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_share_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` longtext NOT NULL,
  `created_at` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_delete` int(11) NOT NULL DEFAULT '0' COMMENT '是否删除 0--未删除 1--已删除',
  `deleted_at` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '删除时间',
  PRIMARY KEY (`id`),
  KEY `mall_id` (`mall_id`),
  KEY `key` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='分销设置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_share_setting`
--

LOCK TABLES `zjhj_bd_share_setting` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_share_setting` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_share_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_shopping_buys`
--

DROP TABLE IF EXISTS `zjhj_bd_shopping_buys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_shopping_buys` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mall_id` (`mall_id`),
  KEY `order_id` (`order_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_shopping_buys`
--

LOCK TABLES `zjhj_bd_shopping_buys` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_shopping_buys` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_shopping_buys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_shopping_like_users`
--

DROP TABLE IF EXISTS `zjhj_bd_shopping_like_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_shopping_like_users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `like_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL,
  `is_delete` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_shopping_like_users`
--

LOCK TABLES `zjhj_bd_shopping_like_users` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_shopping_like_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_shopping_like_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_shopping_likes`
--

DROP TABLE IF EXISTS `zjhj_bd_shopping_likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_shopping_likes` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_shopping_likes`
--

LOCK TABLES `zjhj_bd_shopping_likes` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_shopping_likes` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_shopping_likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_shopping_setting`
--

DROP TABLE IF EXISTS `zjhj_bd_shopping_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_shopping_setting` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `is_open` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否开启0.关闭|1.开启',
  `created_at` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_shopping_setting`
--

LOCK TABLES `zjhj_bd_shopping_setting` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_shopping_setting` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_shopping_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_statistics_data_log`
--

DROP TABLE IF EXISTS `zjhj_bd_statistics_data_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_statistics_data_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL DEFAULT '0',
  `key` varchar(100) NOT NULL DEFAULT '',
  `value` int(11) NOT NULL DEFAULT '0',
  `time_stamp` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mall_id` (`mall_id`),
  KEY `key` (`key`),
  KEY `value` (`value`),
  KEY `time_stamp` (`time_stamp`),
  KEY `created_at` (`created_at`),
  KEY `mall_id_2` (`mall_id`),
  KEY `key_2` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_statistics_data_log`
--

LOCK TABLES `zjhj_bd_statistics_data_log` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_statistics_data_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_statistics_data_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_statistics_user_log`
--

DROP TABLE IF EXISTS `zjhj_bd_statistics_user_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_statistics_user_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `num` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  `time_stamp` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mall_id` (`mall_id`),
  KEY `user_id` (`user_id`),
  KEY `num` (`num`),
  KEY `created_at` (`created_at`),
  KEY `is_delete` (`is_delete`),
  KEY `time_stamp` (`time_stamp`),
  KEY `mall_id_2` (`mall_id`),
  KEY `user_id_2` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_statistics_user_log`
--

LOCK TABLES `zjhj_bd_statistics_user_log` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_statistics_user_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_statistics_user_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_step_activity`
--

DROP TABLE IF EXISTS `zjhj_bd_step_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_step_activity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `currency` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '奖金池',
  `step_num` int(11) NOT NULL DEFAULT '0' COMMENT '挑战步数',
  `bail_currency` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '保证金',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `type` smallint(1) NOT NULL DEFAULT '0' COMMENT '0进行中 1 已完成 2 已解散',
  `begin_at` date NOT NULL COMMENT '开始时间',
  `end_at` date NOT NULL COMMENT '结束时间',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除',
  `created_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_step_activity`
--

LOCK TABLES `zjhj_bd_step_activity` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_step_activity` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_step_activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_step_activity_info`
--

DROP TABLE IF EXISTS `zjhj_bd_step_activity_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_step_activity_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `activity_log_id` int(11) NOT NULL COMMENT 'a',
  `num` int(11) NOT NULL COMMENT '提交步数',
  `open_date` date NOT NULL COMMENT '创建时间',
  `created_at` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_step_activity_info`
--

LOCK TABLES `zjhj_bd_step_activity_info` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_step_activity_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_step_activity_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_step_activity_log`
--

DROP TABLE IF EXISTS `zjhj_bd_step_activity_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_step_activity_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `step_id` int(11) NOT NULL,
  `activity_id` int(11) NOT NULL,
  `step_currency` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '缴纳金',
  `reward_currency` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '奖励金额',
  `status` tinyint(255) NOT NULL DEFAULT '0' COMMENT '0报名1达标  2成功 3失败 4解散',
  `created_at` timestamp NOT NULL,
  `raffled_at` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_step_activity_log`
--

LOCK TABLES `zjhj_bd_step_activity_log` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_step_activity_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_step_activity_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_step_ad`
--

DROP TABLE IF EXISTS `zjhj_bd_step_ad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_step_ad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `unit_id` varchar(255) NOT NULL DEFAULT '' COMMENT '广告id',
  `site` int(11) NOT NULL DEFAULT '0' COMMENT '位置',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0关闭 1开启',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除',
  `created_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `type` varchar(255) NOT NULL DEFAULT '' COMMENT '流量主类型',
  `pic_url` varchar(255) NOT NULL DEFAULT '' COMMENT '广告封面',
  `video_url` varchar(255) NOT NULL DEFAULT '' COMMENT '广告视频',
  `reward_data` longtext NOT NULL COMMENT '奖励数据',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_step_ad`
--

LOCK TABLES `zjhj_bd_step_ad` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_step_ad` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_step_ad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_step_ad_coupon`
--

DROP TABLE IF EXISTS `zjhj_bd_step_ad_coupon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_step_ad_coupon` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_coupon_id` int(11) NOT NULL,
  `is_delete` tinyint(2) NOT NULL DEFAULT '0' COMMENT '删除',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_step_ad_coupon`
--

LOCK TABLES `zjhj_bd_step_ad_coupon` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_step_ad_coupon` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_step_ad_coupon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_step_ad_log`
--

DROP TABLE IF EXISTS `zjhj_bd_step_ad_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_step_ad_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `ad_id` int(11) NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `raffled_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_step_ad_log`
--

LOCK TABLES `zjhj_bd_step_ad_log` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_step_ad_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_step_ad_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_step_banner_relation`
--

DROP TABLE IF EXISTS `zjhj_bd_step_banner_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_step_banner_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `banner_id` int(11) NOT NULL COMMENT '轮播图id',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除',
  `created_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_step_banner_relation`
--

LOCK TABLES `zjhj_bd_step_banner_relation` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_step_banner_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_step_banner_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_step_daily`
--

DROP TABLE IF EXISTS `zjhj_bd_step_daily`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_step_daily` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `step_id` int(11) NOT NULL,
  `ratio` int(11) NOT NULL COMMENT '兑换概率',
  `real_num` int(11) NOT NULL COMMENT '真实步数',
  `num` int(11) NOT NULL COMMENT '兑换加成后数量',
  `created_at` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_step_daily`
--

LOCK TABLES `zjhj_bd_step_daily` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_step_daily` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_step_daily` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_step_goods`
--

DROP TABLE IF EXISTS `zjhj_bd_step_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_step_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `currency` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '活力币',
  `goods_id` int(11) NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_step_goods`
--

LOCK TABLES `zjhj_bd_step_goods` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_step_goods` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_step_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_step_goods_attr`
--

DROP TABLE IF EXISTS `zjhj_bd_step_goods_attr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_step_goods_attr` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `attr_id` int(11) NOT NULL COMMENT '规格',
  `currency` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '活力币',
  `goods_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_step_goods_attr`
--

LOCK TABLES `zjhj_bd_step_goods_attr` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_step_goods_attr` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_step_goods_attr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_step_log`
--

DROP TABLE IF EXISTS `zjhj_bd_step_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_step_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `step_id` int(11) NOT NULL,
  `type` int(11) NOT NULL COMMENT '1收入 2 支出',
  `currency` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '活力币',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `data` longtext NOT NULL COMMENT '详情',
  `created_at` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_step_log`
--

LOCK TABLES `zjhj_bd_step_log` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_step_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_step_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_step_order`
--

DROP TABLE IF EXISTS `zjhj_bd_step_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_step_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL DEFAULT '0',
  `mall_id` int(11) NOT NULL,
  `num` int(11) NOT NULL COMMENT '商品数量',
  `total_pay_price` decimal(10,2) NOT NULL COMMENT '订单实际支付价格',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `currency` decimal(10,2) NOT NULL,
  `created_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `token` varchar(255) NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_step_order`
--

LOCK TABLES `zjhj_bd_step_order` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_step_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_step_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_step_setting`
--

DROP TABLE IF EXISTS `zjhj_bd_step_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_step_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `convert_max` int(11) NOT NULL DEFAULT '0' COMMENT '每日最高兑换数',
  `convert_ratio` int(11) NOT NULL DEFAULT '0' COMMENT '兑换比率',
  `currency_name` varchar(255) NOT NULL DEFAULT '' COMMENT '活力币别名',
  `activity_pic` varchar(255) NOT NULL DEFAULT '' COMMENT '活动背景',
  `ranking_pic` varchar(255) NOT NULL DEFAULT '' COMMENT '排行榜背景',
  `qrcode_pic` longtext NOT NULL COMMENT '海报缩略图',
  `invite_ratio` int(11) NOT NULL DEFAULT '0' COMMENT '邀请比率',
  `remind_at` varchar(255) NOT NULL DEFAULT '16' COMMENT '提醒时间',
  `rule` longtext NOT NULL COMMENT '活动规则',
  `activity_rule` longtext NOT NULL COMMENT '活动规则',
  `ranking_num` int(11) NOT NULL DEFAULT '0' COMMENT '全国排行限制',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '小程序标题',
  `share_title` varchar(255) NOT NULL DEFAULT '' COMMENT '转发标题',
  `qrcode_title` varchar(255) NOT NULL DEFAULT '' COMMENT '海报文字',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `payment_type` longtext NOT NULL COMMENT '支付方式',
  `send_type` longtext NOT NULL COMMENT '发货方式',
  `is_share` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否开启分销',
  `is_sms` tinyint(1) NOT NULL DEFAULT '0' COMMENT '开启短信提醒',
  `is_mail` tinyint(1) NOT NULL DEFAULT '0' COMMENT '开启邮件提醒',
  `is_print` tinyint(1) NOT NULL DEFAULT '0' COMMENT '开启打印',
  `is_territorial_limitation` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否开启区域允许购买',
  `goods_poster` longtext NOT NULL COMMENT '自定义海报',
  `step_poster` longtext NOT NULL COMMENT '步数海报',
  `share_pic` varchar(255) NOT NULL DEFAULT '' COMMENT '分享图片',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_step_setting`
--

LOCK TABLES `zjhj_bd_step_setting` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_step_setting` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_step_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_step_user`
--

DROP TABLE IF EXISTS `zjhj_bd_step_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_step_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `ratio` int(11) NOT NULL DEFAULT '0' COMMENT '概率加成',
  `step_currency` decimal(10,2) NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT '邀请ID',
  `invite_ratio` int(11) NOT NULL DEFAULT '0' COMMENT '邀请好友加成',
  `is_remind` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否提醒',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除',
  `created_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_step_user`
--

LOCK TABLES `zjhj_bd_step_user` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_step_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_step_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_stock_bonus_log`
--

DROP TABLE IF EXISTS `zjhj_bd_stock_bonus_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_stock_bonus_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL DEFAULT '0',
  `bonus_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '1按周，2按月',
  `bonus_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '分红金额',
  `bonus_rate` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '当时的分红比例',
  `order_num` int(11) NOT NULL DEFAULT '0' COMMENT '分红订单数',
  `stock_num` int(11) NOT NULL DEFAULT '0' COMMENT '当时股东人数',
  `start_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '分红时间段-开始时间',
  `end_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '分红时间段-结束时间',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_stock_bonus_log`
--

LOCK TABLES `zjhj_bd_stock_bonus_log` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_stock_bonus_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_stock_bonus_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_stock_cash`
--

DROP TABLE IF EXISTS `zjhj_bd_stock_cash`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_stock_cash` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `order_no` varchar(255) NOT NULL DEFAULT '' COMMENT '订单号',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '提现金额',
  `service_charge` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '提现手续费（%）',
  `type` varchar(255) NOT NULL DEFAULT '' COMMENT '提现方式 auto--自动打款 wechat--微信打款 alipay--支付宝打款 bank--银行转账 balance--打款到余额',
  `extra` longtext COMMENT '额外信息 例如微信账号、支付宝账号等',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '提现状态 0--申请 1--同意 2--已打款 3--驳回',
  `is_delete` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL,
  `content` longtext,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='提现记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_stock_cash`
--

LOCK TABLES `zjhj_bd_stock_cash` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_stock_cash` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_stock_cash` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_stock_cash_log`
--

DROP TABLE IF EXISTS `zjhj_bd_stock_cash_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_stock_cash_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `type` int(11) NOT NULL DEFAULT '1' COMMENT '类型 1--收入 2--支出',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '变动佣金',
  `desc` longtext,
  `custom_desc` longtext,
  `level_id` int(11) DEFAULT '0' COMMENT '当时的股东等级',
  `level_name` varchar(100) DEFAULT NULL,
  `order_num` int(11) DEFAULT '0',
  `bonus_rate` decimal(10,2) DEFAULT '0.00' COMMENT '当时的分红比例',
  `bonus_id` int(11) DEFAULT '0' COMMENT '股东完成分红记录ID',
  `is_delete` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='分红日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_stock_cash_log`
--

LOCK TABLES `zjhj_bd_stock_cash_log` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_stock_cash_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_stock_cash_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_stock_level`
--

DROP TABLE IF EXISTS `zjhj_bd_stock_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_stock_level` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '等级名称',
  `bonus_rate` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '分红比例',
  `condition` int(11) NOT NULL DEFAULT '0' COMMENT '升级条件，0不自动升级',
  `is_default` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否默认等级，0否1是',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  `deleted_at` timestamp NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='股东等级表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_stock_level`
--

LOCK TABLES `zjhj_bd_stock_level` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_stock_level` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_stock_level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_stock_level_up`
--

DROP TABLE IF EXISTS `zjhj_bd_stock_level_up`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_stock_level_up` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL DEFAULT '0',
  `type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1下线总人数，2累计佣金总额，3已提现佣金总额，4分销订单总数，5分销订单总金额',
  `remark` text,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='股东等级升级条件';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_stock_level_up`
--

LOCK TABLES `zjhj_bd_stock_level_up` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_stock_level_up` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_stock_level_up` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_stock_order`
--

DROP TABLE IF EXISTS `zjhj_bd_stock_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_stock_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL DEFAULT '0',
  `order_id` int(11) NOT NULL DEFAULT '0',
  `total_pay_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '订单实付金额',
  `is_bonus` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1已分红，0未分红',
  `bonus_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '分红时间',
  `bonus_id` int(11) NOT NULL DEFAULT '0' COMMENT '股东完成分红记录ID',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  `deleted_at` timestamp NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='分红池';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_stock_order`
--

LOCK TABLES `zjhj_bd_stock_order` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_stock_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_stock_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_stock_setting`
--

DROP TABLE IF EXISTS `zjhj_bd_stock_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_stock_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `created_at` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_delete` int(11) NOT NULL DEFAULT '0' COMMENT '是否删除 0--未删除 1--已删除',
  `deleted_at` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='股东分红设置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_stock_setting`
--

LOCK TABLES `zjhj_bd_stock_setting` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_stock_setting` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_stock_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_stock_user`
--

DROP TABLE IF EXISTS `zjhj_bd_stock_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_stock_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `level_id` int(11) NOT NULL DEFAULT '0' COMMENT '对应等级表ID',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '-2被拒或移除后再次申请没提交 -1移除 0审核中，1同意，2拒绝',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  `deleted_at` timestamp NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `applyed_at` timestamp NOT NULL COMMENT '申请时间',
  `agreed_at` timestamp NOT NULL COMMENT '审核时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='股东表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_stock_user`
--

LOCK TABLES `zjhj_bd_stock_user` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_stock_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_stock_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_stock_user_info`
--

DROP TABLE IF EXISTS `zjhj_bd_stock_user_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_stock_user_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(100) DEFAULT '' COMMENT '股东姓名',
  `phone` varchar(11) DEFAULT '' COMMENT '股东手机号',
  `all_bonus` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '累计分红',
  `total_bonus` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '当前分红',
  `out_bonus` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '已提现分红',
  `remark` varchar(200) NOT NULL DEFAULT '' COMMENT '备注',
  `reason` text NOT NULL COMMENT '拒绝理由',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='股东信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_stock_user_info`
--

LOCK TABLES `zjhj_bd_stock_user_info` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_stock_user_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_stock_user_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_store`
--

DROP TABLE IF EXISTS `zjhj_bd_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_store` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `mch_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(65) NOT NULL DEFAULT '' COMMENT '店铺名称',
  `mobile` varchar(255) NOT NULL DEFAULT '' COMMENT '联系电话',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '地址',
  `province_id` int(11) NOT NULL DEFAULT '0',
  `city_id` int(11) NOT NULL DEFAULT '0',
  `district_id` int(11) NOT NULL DEFAULT '0',
  `longitude` varchar(255) NOT NULL DEFAULT '' COMMENT '经度',
  `latitude` varchar(255) NOT NULL DEFAULT '' COMMENT '纬度',
  `score` int(11) NOT NULL DEFAULT '5' COMMENT '店铺评分',
  `cover_url` varchar(255) NOT NULL DEFAULT '' COMMENT '店铺封面图',
  `pic_url` text NOT NULL COMMENT '门店轮播图',
  `business_hours` varchar(125) NOT NULL DEFAULT '' COMMENT '营业时间',
  `description` longtext NOT NULL COMMENT '门店描述',
  `scope` mediumtext NOT NULL COMMENT '门店经营范围',
  `is_default` tinyint(1) NOT NULL DEFAULT '0' COMMENT '默认总店0.否|1.是',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  `is_all_day` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否全天营业0.否|1.是',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_store`
--

LOCK TABLES `zjhj_bd_store` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_store` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_template_record`
--

DROP TABLE IF EXISTS `zjhj_bd_template_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_template_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '模板消息是否发送成功0--失败|1--成功',
  `data` longtext NOT NULL COMMENT '模板消息内容',
  `error` longtext NOT NULL COMMENT '错误信息',
  `created_at` timestamp NULL DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL COMMENT '模板消息发送标示',
  PRIMARY KEY (`id`),
  KEY `mall_id` (`mall_id`),
  KEY `user_id` (`user_id`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='模板消息发送记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_template_record`
--

LOCK TABLES `zjhj_bd_template_record` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_template_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_template_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_topic`
--

DROP TABLE IF EXISTS `zjhj_bd_topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_topic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `type` int(11) NOT NULL COMMENT '分类',
  `title` varchar(255) NOT NULL COMMENT '名称',
  `sub_title` varchar(255) NOT NULL DEFAULT '' COMMENT '副标题（未用）',
  `content` longtext NOT NULL COMMENT '专题内容',
  `layout` smallint(1) NOT NULL DEFAULT '0' COMMENT '布局方式：0=小图，1=大图模式',
  `sort` int(11) NOT NULL DEFAULT '1' COMMENT '排序：升序',
  `cover_pic` varchar(255) NOT NULL COMMENT '封面图',
  `read_count` int(11) NOT NULL DEFAULT '0' COMMENT '阅读量',
  `agree_count` int(11) NOT NULL DEFAULT '0' COMMENT '点赞数（未用）',
  `virtual_read_count` int(11) NOT NULL DEFAULT '0' COMMENT '虚拟阅读量',
  `virtual_agree_count` int(11) NOT NULL DEFAULT '0' COMMENT '虚拟点赞数（未用）',
  `virtual_favorite_count` int(11) NOT NULL DEFAULT '0' COMMENT '虚拟收藏量',
  `qrcode_pic` varchar(255) NOT NULL DEFAULT '' COMMENT '自定义分享图片(海报图)',
  `app_share_title` varchar(65) NOT NULL DEFAULT '' COMMENT '自定义分享标题',
  `is_chosen` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否精选',
  `is_delete` tinyint(11) NOT NULL DEFAULT '0' COMMENT '删除',
  `deleted_at` timestamp NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `pic_list` longtext,
  `detail` longtext,
  `abstract` varchar(255) NOT NULL DEFAULT '' COMMENT '摘要',
  PRIMARY KEY (`id`),
  KEY `store_id` (`mall_id`) USING BTREE,
  KEY `is_delete` (`is_delete`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_topic`
--

LOCK TABLES `zjhj_bd_topic` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_topic` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_topic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_topic_favorite`
--

DROP TABLE IF EXISTS `zjhj_bd_topic_favorite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_topic_favorite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `topic_id` int(11) NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  `deleted_at` timestamp NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_topic_favorite`
--

LOCK TABLES `zjhj_bd_topic_favorite` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_topic_favorite` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_topic_favorite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_topic_type`
--

DROP TABLE IF EXISTS `zjhj_bd_topic_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_topic_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL COMMENT '名称',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0隐藏 1开启',
  `sort` int(11) NOT NULL DEFAULT '1' COMMENT '排序',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除',
  `created_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_topic_type`
--

LOCK TABLES `zjhj_bd_topic_type` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_topic_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_topic_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_ttapp_config`
--

DROP TABLE IF EXISTS `zjhj_bd_ttapp_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_ttapp_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `mch_id` varchar(64) DEFAULT NULL COMMENT '商户号',
  `app_key` varchar(64) DEFAULT NULL,
  `app_secret` varchar(64) DEFAULT NULL,
  `pay_app_secret` varchar(128) DEFAULT NULL,
  `pay_app_id` varchar(64) DEFAULT NULL,
  `alipay_app_id` varchar(128) DEFAULT NULL,
  `alipay_public_key` text,
  `alipay_private_key` text,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_ttapp_config`
--

LOCK TABLES `zjhj_bd_ttapp_config` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_ttapp_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_ttapp_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_ttapp_template`
--

DROP TABLE IF EXISTS `zjhj_bd_ttapp_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_ttapp_template` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `tpl_name` varchar(65) NOT NULL DEFAULT '',
  `tpl_id` varchar(255) NOT NULL DEFAULT '',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_ttapp_template`
--

LOCK TABLES `zjhj_bd_ttapp_template` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_ttapp_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_ttapp_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_user`
--

DROP TABLE IF EXISTS `zjhj_bd_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `mch_id` int(11) NOT NULL DEFAULT '0' COMMENT '多商户ID',
  `username` varchar(64) NOT NULL,
  `password` varchar(128) NOT NULL,
  `nickname` varchar(45) NOT NULL DEFAULT '',
  `auth_key` varchar(128) NOT NULL,
  `access_token` varchar(128) NOT NULL,
  `mobile` varchar(255) NOT NULL DEFAULT '',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `username` (`username`),
  KEY `access_token` (`access_token`),
  KEY `mall_id` (`mall_id`),
  KEY `mch_id` (`mch_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_user`
--

LOCK TABLES `zjhj_bd_user` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_user` DISABLE KEYS */;
INSERT INTO `zjhj_bd_user` VALUES (1,0,0,'admin','$2y$13$l3cS2VMFjdg6x6TW.rYpD.MD0cQ79KiZ1Gq.vdpxw8Hr4uqfbYFTO','admin','jaXEErQOC6xUG2aZhcxNzPq00FBLSC3x','WtaGmnvibJIvnnclmHSunFe956YDCTIq','','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',0);
/*!40000 ALTER TABLE `zjhj_bd_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_user_auth_login`
--

DROP TABLE IF EXISTS `zjhj_bd_user_auth_login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_user_auth_login` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `token` varchar(255) NOT NULL DEFAULT '',
  `is_pass` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否确认登录',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_user_auth_login`
--

LOCK TABLES `zjhj_bd_user_auth_login` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_user_auth_login` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_user_auth_login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_user_card`
--

DROP TABLE IF EXISTS `zjhj_bd_user_card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_user_card` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `card_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL COMMENT '名称',
  `pic_url` varchar(255) NOT NULL COMMENT '图片',
  `content` longtext NOT NULL COMMENT '详情',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `is_use` int(11) NOT NULL DEFAULT '0' COMMENT '是否使用 0--未使用 1--已使用',
  `clerk_id` int(11) NOT NULL DEFAULT '0' COMMENT '核销人id',
  `store_id` int(11) NOT NULL DEFAULT '0' COMMENT '门店ID',
  `clerked_at` timestamp NOT NULL COMMENT ' 核销时间',
  `order_id` int(11) NOT NULL DEFAULT '0' COMMENT '发放卡券的订单id',
  `order_detail_id` int(11) NOT NULL DEFAULT '0' COMMENT '订单详情ID',
  `data` longtext COMMENT '额外信息字段',
  `start_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `end_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `use_number` int(11) NOT NULL DEFAULT '0' COMMENT '卡券已核销次数',
  `number` int(11) NOT NULL DEFAULT '1' COMMENT '卡券可核销次数',
  `receive_id` int(11) NOT NULL DEFAULT '0' COMMENT '转赠领取的用户id',
  `parent_card_id` int(11) NOT NULL DEFAULT '0' COMMENT '转赠的用户卡券id',
  `remark` varchar(255) DEFAULT '' COMMENT '简单备注来源',
  PRIMARY KEY (`id`),
  KEY `mall_id` (`mall_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_user_card`
--

LOCK TABLES `zjhj_bd_user_card` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_user_card` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_user_card` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_user_coupon`
--

DROP TABLE IF EXISTS `zjhj_bd_user_coupon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_user_coupon` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL COMMENT '用户',
  `coupon_id` int(11) NOT NULL COMMENT '优惠卷',
  `sub_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '满减',
  `discount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '折扣',
  `coupon_min_price` decimal(10,2) NOT NULL COMMENT '最低消费金额',
  `type` int(11) NOT NULL DEFAULT '1' COMMENT '优惠券类型：1=折扣，2=满减',
  `start_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '有效期开始时间',
  `end_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '有效期结束时间',
  `is_use` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否已使用：0=未使用，1=已使用',
  `is_delete` smallint(1) NOT NULL DEFAULT '0' COMMENT '删除',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `receive_type` varchar(255) NOT NULL DEFAULT '' COMMENT '获取方式',
  `coupon_data` longtext NOT NULL COMMENT '优惠券信息json格式',
  `discount_limit` decimal(10,2) DEFAULT NULL COMMENT '折扣优惠上限',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `store_id` (`mall_id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `coupon_id` (`coupon_id`) USING BTREE,
  KEY `is_delete` (`is_delete`) USING BTREE,
  KEY `is_use` (`is_use`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_user_coupon`
--

LOCK TABLES `zjhj_bd_user_coupon` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_user_coupon` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_user_coupon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_user_coupon_auto`
--

DROP TABLE IF EXISTS `zjhj_bd_user_coupon_auto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_user_coupon_auto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_coupon_id` int(11) NOT NULL,
  `auto_coupon_id` int(11) NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除',
  PRIMARY KEY (`id`),
  KEY `user_coupon_id` (`user_coupon_id`),
  KEY `auto_coupon_id` (`auto_coupon_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_user_coupon_auto`
--

LOCK TABLES `zjhj_bd_user_coupon_auto` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_user_coupon_auto` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_user_coupon_auto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_user_coupon_center`
--

DROP TABLE IF EXISTS `zjhj_bd_user_coupon_center`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_user_coupon_center` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL DEFAULT '0' COMMENT '商城ID',
  `user_coupon_id` int(11) NOT NULL DEFAULT '0' COMMENT '优惠券ID',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `is_delete` int(11) NOT NULL DEFAULT '0' COMMENT '是否删除 0--不删除 1--删除',
  `created_at` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted_at` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '删除时间',
  PRIMARY KEY (`id`),
  KEY `mall_id` (`mall_id`),
  KEY `user_coupon_id` (`user_coupon_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户领取的优惠券关联表（领券中心）';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_user_coupon_center`
--

LOCK TABLES `zjhj_bd_user_coupon_center` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_user_coupon_center` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_user_coupon_center` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_user_coupon_goods`
--

DROP TABLE IF EXISTS `zjhj_bd_user_coupon_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_user_coupon_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL DEFAULT '0' COMMENT '商城ID',
  `user_coupon_id` int(11) NOT NULL DEFAULT '0' COMMENT '优惠券ID',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `goods_id` int(11) NOT NULL COMMENT '商品ID',
  `is_delete` int(11) NOT NULL DEFAULT '0' COMMENT '是否删除 0--不删除 1--删除',
  `created_at` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted_at` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '删除时间',
  PRIMARY KEY (`id`),
  KEY `mall_id` (`mall_id`) USING BTREE,
  KEY `user_coupon_id` (`user_coupon_id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='随商品赠送优惠券关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_user_coupon_goods`
--

LOCK TABLES `zjhj_bd_user_coupon_goods` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_user_coupon_goods` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_user_coupon_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_user_coupon_member`
--

DROP TABLE IF EXISTS `zjhj_bd_user_coupon_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_user_coupon_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `member_level` int(11) NOT NULL DEFAULT '0' COMMENT '会员等级',
  `user_coupon_id` int(11) NOT NULL,
  `is_delete` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_user_coupon_member`
--

LOCK TABLES `zjhj_bd_user_coupon_member` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_user_coupon_member` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_user_coupon_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_user_identity`
--

DROP TABLE IF EXISTS `zjhj_bd_user_identity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_user_identity` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户身份表',
  `user_id` int(11) NOT NULL,
  `is_super_admin` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否为超级管理员',
  `is_admin` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否为管理员',
  `is_operator` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否为操作员|员工',
  `member_level` int(11) NOT NULL DEFAULT '0' COMMENT '会员等级:0.普通成员',
  `is_distributor` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否为分销商',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `is_super_admin` (`is_super_admin`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_user_identity`
--

LOCK TABLES `zjhj_bd_user_identity` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_user_identity` DISABLE KEYS */;
INSERT INTO `zjhj_bd_user_identity` VALUES (1,1,1,0,0,0,0,0);
/*!40000 ALTER TABLE `zjhj_bd_user_identity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_user_info`
--

DROP TABLE IF EXISTS `zjhj_bd_user_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_user_info` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `avatar` varchar(255) NOT NULL DEFAULT '' COMMENT '头像',
  `platform_user_id` varchar(255) NOT NULL DEFAULT '' COMMENT '用户所属平台的用户id',
  `integral` int(11) NOT NULL DEFAULT '0' COMMENT '积分',
  `total_integral` int(11) NOT NULL DEFAULT '0' COMMENT '最高积分',
  `balance` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '余额',
  `total_balance` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '总余额',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT '上级id',
  `is_blacklist` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否黑名单',
  `contact_way` varchar(255) NOT NULL DEFAULT '' COMMENT '联系方式',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  `junior_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '成为下级时间',
  `platform` varchar(255) NOT NULL DEFAULT '' COMMENT '用户所属平台标识',
  `temp_parent_id` int(11) NOT NULL DEFAULT '0' COMMENT '临时上级',
  `remark_name` varchar(60) NOT NULL DEFAULT '' COMMENT '备注名',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `parent_id` (`parent_id`),
  KEY `platform_user_id` (`platform_user_id`),
  KEY `temp_parent_id` (`temp_parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_user_info`
--

LOCK TABLES `zjhj_bd_user_info` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_user_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_user_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_video`
--

DROP TABLE IF EXISTS `zjhj_bd_video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_video` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL COMMENT '标题',
  `type` tinyint(1) NOT NULL COMMENT '视频来源 0--源地址 1--腾讯视频',
  `url` varchar(2048) NOT NULL DEFAULT '' COMMENT '链接',
  `pic_url` varchar(255) NOT NULL COMMENT '封面图',
  `content` longtext NOT NULL COMMENT '详情介绍',
  `sort` int(11) NOT NULL DEFAULT '1' COMMENT '排序',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_video`
--

LOCK TABLES `zjhj_bd_video` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_video` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_video` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_vip_card`
--

DROP TABLE IF EXISTS `zjhj_bd_vip_card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_vip_card` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '会员卡名称',
  `cover` varchar(2048) NOT NULL DEFAULT '' COMMENT '卡片样式',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0:指定商品类别 1:指定商品 2:全场通用',
  `type_info` varchar(2048) NOT NULL DEFAULT '',
  `discount` decimal(11,1) NOT NULL DEFAULT '0.0' COMMENT '折扣',
  `is_discount` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:关闭 1开启',
  `is_free_delivery` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:不包邮 1:包邮',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mall_id` (`mall_id`),
  KEY `is_delete` (`is_delete`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_vip_card`
--

LOCK TABLES `zjhj_bd_vip_card` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_vip_card` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_vip_card` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_vip_card_appoint_goods`
--

DROP TABLE IF EXISTS `zjhj_bd_vip_card_appoint_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_vip_card_appoint_goods` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_vip_card_appoint_goods`
--

LOCK TABLES `zjhj_bd_vip_card_appoint_goods` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_vip_card_appoint_goods` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_vip_card_appoint_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_vip_card_cards`
--

DROP TABLE IF EXISTS `zjhj_bd_vip_card_cards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_vip_card_cards` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `detail_id` int(11) NOT NULL COMMENT 'vip卡id',
  `card_id` int(11) NOT NULL COMMENT '卡券id',
  `send_num` int(11) NOT NULL COMMENT '赠送数量',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_vip_card_cards`
--

LOCK TABLES `zjhj_bd_vip_card_cards` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_vip_card_cards` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_vip_card_cards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_vip_card_coupons`
--

DROP TABLE IF EXISTS `zjhj_bd_vip_card_coupons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_vip_card_coupons` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `detail_id` int(11) NOT NULL,
  `coupon_id` int(11) NOT NULL,
  `send_num` int(11) NOT NULL COMMENT '赠送数量',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_vip_card_coupons`
--

LOCK TABLES `zjhj_bd_vip_card_coupons` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_vip_card_coupons` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_vip_card_coupons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_vip_card_detail`
--

DROP TABLE IF EXISTS `zjhj_bd_vip_card_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_vip_card_detail` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `vip_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL COMMENT '标题',
  `cover` varchar(2048) NOT NULL DEFAULT '' COMMENT '子卡封面',
  `expire_day` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `num` int(11) NOT NULL DEFAULT '0' COMMENT '库存',
  `sort` int(11) NOT NULL DEFAULT '100' COMMENT '排序',
  `send_integral_num` int(11) NOT NULL DEFAULT '0' COMMENT '积分赠送',
  `send_integral_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '积分赠送类型 1.固定值|2.百分比',
  `send_balance` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '赠送余额',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '使用说明',
  `content` varchar(2048) NOT NULL DEFAULT '' COMMENT '使用内容',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:正常 1：停发',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_vip_card_detail`
--

LOCK TABLES `zjhj_bd_vip_card_detail` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_vip_card_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_vip_card_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_vip_card_discount`
--

DROP TABLE IF EXISTS `zjhj_bd_vip_card_discount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_vip_card_discount` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `order_detail_id` int(11) NOT NULL,
  `main_id` int(11) NOT NULL DEFAULT '0',
  `main_name` varchar(255) NOT NULL DEFAULT '' COMMENT '主卡名称',
  `detail_id` int(11) NOT NULL DEFAULT '0',
  `detail_name` varchar(255) NOT NULL DEFAULT '' COMMENT '子卡名称',
  `discount_num` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '折扣',
  `discount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '折扣优惠',
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_vip_card_discount`
--

LOCK TABLES `zjhj_bd_vip_card_discount` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_vip_card_discount` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_vip_card_discount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_vip_card_order`
--

DROP TABLE IF EXISTS `zjhj_bd_vip_card_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_vip_card_order` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `main_id` int(11) NOT NULL COMMENT '主卡id',
  `main_name` varchar(255) NOT NULL DEFAULT '' COMMENT '主卡名称',
  `detail_id` int(11) NOT NULL,
  `detail_name` varchar(255) NOT NULL DEFAULT '' COMMENT '子卡名称',
  `price` decimal(10,2) NOT NULL COMMENT '购买价格',
  `expire` int(11) NOT NULL COMMENT '有效期',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0未售 1已售',
  `all_send` varchar(4096) NOT NULL DEFAULT '',
  `is_admin_add` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否后台添加',
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `sign` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_vip_card_order`
--

LOCK TABLES `zjhj_bd_vip_card_order` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_vip_card_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_vip_card_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_vip_card_setting`
--

DROP TABLE IF EXISTS `zjhj_bd_vip_card_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_vip_card_setting` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `is_vip_card` tinyint(1) NOT NULL DEFAULT '0',
  `payment_type` text NOT NULL,
  `is_share` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否开启分销',
  `is_sms` tinyint(1) NOT NULL DEFAULT '0',
  `is_mail` tinyint(1) NOT NULL DEFAULT '0',
  `is_agreement` tinyint(1) NOT NULL DEFAULT '0',
  `agreement_title` varchar(255) NOT NULL DEFAULT '',
  `agreement_content` text NOT NULL,
  `is_buy_become_share` tinyint(1) NOT NULL DEFAULT '0' COMMENT '购买成为分销商 0:关闭 1开启',
  `share_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1.百分比|2.固定金额',
  `share_commission_first` decimal(10,2) NOT NULL DEFAULT '0.00',
  `share_commission_second` decimal(10,2) NOT NULL DEFAULT '0.00',
  `share_commission_third` decimal(10,2) NOT NULL DEFAULT '0.00',
  `form` text NOT NULL,
  `rules` text NOT NULL COMMENT '允许的插件',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  `share_level` text COMMENT '分销等级',
  PRIMARY KEY (`id`),
  KEY `mall_id` (`mall_id`),
  KEY `is_delete` (`is_delete`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_vip_card_setting`
--

LOCK TABLES `zjhj_bd_vip_card_setting` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_vip_card_setting` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_vip_card_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_vip_card_user`
--

DROP TABLE IF EXISTS `zjhj_bd_vip_card_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_vip_card_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `main_id` int(11) NOT NULL DEFAULT '0',
  `detail_id` int(11) NOT NULL,
  `image_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:指定商品类别 1:指定商品 2:全场通用',
  `image_type_info` varchar(2048) NOT NULL DEFAULT '',
  `image_discount` decimal(11,1) NOT NULL DEFAULT '0.0' COMMENT '折扣',
  `image_is_free_delivery` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:不包邮 1:包邮',
  `image_main_name` varchar(255) NOT NULL DEFAULT '' COMMENT '主卡名称',
  `image_name` varchar(255) NOT NULL COMMENT '名称',
  `all_send` longtext NOT NULL COMMENT '所有赠送信息',
  `data` longtext COMMENT '额外信息字段',
  `start_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `end_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mall_id` (`mall_id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_vip_card_user`
--

LOCK TABLES `zjhj_bd_vip_card_user` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_vip_card_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_vip_card_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_we7_app`
--

DROP TABLE IF EXISTS `zjhj_bd_we7_app`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_we7_app` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `acid` int(11) NOT NULL COMMENT '微擎应用的acid',
  `is_delete` smallint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_we7_app`
--

LOCK TABLES `zjhj_bd_we7_app` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_we7_app` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_we7_app` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_wxapp_config`
--

DROP TABLE IF EXISTS `zjhj_bd_wxapp_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_wxapp_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `appid` varchar(128) NOT NULL,
  `appsecret` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `mchid` varchar(32) NOT NULL DEFAULT '',
  `key` varchar(32) NOT NULL DEFAULT '',
  `cert_pem` varchar(2000) NOT NULL DEFAULT '',
  `key_pem` varchar(2000) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mall_id` (`mall_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_wxapp_config`
--

LOCK TABLES `zjhj_bd_wxapp_config` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_wxapp_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_wxapp_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_wxapp_jump_appid`
--

DROP TABLE IF EXISTS `zjhj_bd_wxapp_jump_appid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_wxapp_jump_appid` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `appid` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_wxapp_jump_appid`
--

LOCK TABLES `zjhj_bd_wxapp_jump_appid` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_wxapp_jump_appid` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_wxapp_jump_appid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_wxapp_service`
--

DROP TABLE IF EXISTS `zjhj_bd_wxapp_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_wxapp_service` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL COMMENT 'wxapp_config',
  `appid` varchar(128) NOT NULL COMMENT '服务商appid',
  `mchid` varchar(32) NOT NULL COMMENT '服务商mchid',
  `is_choise` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1选中  0不选',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `key` varchar(32) NOT NULL COMMENT '服务商微信支付Api密钥',
  `cert_pem` varchar(2000) NOT NULL DEFAULT '',
  `key_pem` varchar(2000) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_wxapp_service`
--

LOCK TABLES `zjhj_bd_wxapp_service` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_wxapp_service` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_wxapp_service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_wxapp_subscribe`
--

DROP TABLE IF EXISTS `zjhj_bd_wxapp_subscribe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_wxapp_subscribe` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `tpl_name` varchar(65) NOT NULL DEFAULT '',
  `tpl_id` varchar(255) NOT NULL DEFAULT '',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mall_id` (`mall_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='微信订阅消息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_wxapp_subscribe`
--

LOCK TABLES `zjhj_bd_wxapp_subscribe` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_wxapp_subscribe` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_wxapp_subscribe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zjhj_bd_wxapp_template`
--

DROP TABLE IF EXISTS `zjhj_bd_wxapp_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zjhj_bd_wxapp_template` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `mall_id` int(11) NOT NULL,
  `tpl_name` varchar(65) NOT NULL DEFAULT '',
  `tpl_id` varchar(255) NOT NULL DEFAULT '',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zjhj_bd_wxapp_template`
--

LOCK TABLES `zjhj_bd_wxapp_template` WRITE;
/*!40000 ALTER TABLE `zjhj_bd_wxapp_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `zjhj_bd_wxapp_template` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-04  0:18:15
