# ************************************************************
# Sequel Ace SQL dump
# 版本号： 20046
#
# https://sequel-ace.com/
# https://github.com/Sequel-Ace/Sequel-Ace
#
# 主机: 154.12.55.148 (MySQL 5.7.40-log)
# 数据库: chattest
# 生成时间: 2023-06-19 08:45:39 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE='NO_AUTO_VALUE_ON_ZERO', SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# 转储表 action
# ------------------------------------------------------------

DROP TABLE IF EXISTS `action`;

CREATE TABLE `action` (
  `id` bigint(255) NOT NULL,
  `user_id` bigint(255) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `describe` varchar(255) DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# 转储表 aikey
# ------------------------------------------------------------

DROP TABLE IF EXISTS `aikey`;

CREATE TABLE `aikey` (
  `id` bigint(255) unsigned NOT NULL,
  `key` varchar(255) NOT NULL DEFAULT '',
  `host` varchar(255) NOT NULL DEFAULT '',
  `remarks` varchar(255) DEFAULT NULL,
  `models` varchar(255) DEFAULT NULL COMMENT '可用模型',
  `limit` double DEFAULT '0' COMMENT '总限制',
  `usage` double DEFAULT '0' COMMENT '已经使用',
  `status` int(11) DEFAULT '1' COMMENT '1 正常 0异常',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `type` varchar(255) DEFAULT NULL COMMENT 'openai sd',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# 转储表 amount_details
# ------------------------------------------------------------

DROP TABLE IF EXISTS `amount_details`;

CREATE TABLE `amount_details` (
  `id` bigint(255) NOT NULL,
  `user_id` bigint(255) NOT NULL,
  `type` varchar(255) NOT NULL COMMENT '提现 or 提成',
  `correlation_id` bigint(255) DEFAULT NULL COMMENT '关联ID',
  `original_amount` varchar(255) NOT NULL COMMENT '原始金额 分',
  `operate_amount` varchar(255) NOT NULL COMMENT '操作金额',
  `current_amount` varchar(255) NOT NULL COMMENT '当前金额',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '1正常',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# 转储表 carmi
# ------------------------------------------------------------

DROP TABLE IF EXISTS `carmi`;

CREATE TABLE `carmi` (
  `id` bigint(255) unsigned NOT NULL,
  `ip` varchar(255) DEFAULT NULL COMMENT '使用时候的ip',
  `user_id` bigint(255) DEFAULT NULL COMMENT '使用者',
  `key` varchar(255) NOT NULL COMMENT '卡密',
  `value` varchar(255) NOT NULL COMMENT '积分',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '0有效 1使用 2过期',
  `type` varchar(255) NOT NULL COMMENT '类型',
  `end_time` varchar(255) DEFAULT NULL COMMENT '截止时间',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `level` int(11) DEFAULT NULL COMMENT '卡密充值等级',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# 转储表 cashback
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cashback`;

CREATE TABLE `cashback` (
  `id` bigint(255) NOT NULL,
  `user_id` bigint(255) DEFAULT NULL,
  `benefit_id` bigint(255) NOT NULL COMMENT '受益者',
  `pay_amount` varchar(255) DEFAULT NULL COMMENT '支付金额（分）',
  `commission_rate` varchar(255) DEFAULT NULL COMMENT '提成比例（1 - 10000）',
  `commission_amount` varchar(255) DEFAULT NULL COMMENT '提成金额（分）',
  `remarks` varchar(255) DEFAULT NULL COMMENT '评论',
  `order_id` bigint(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '3' COMMENT '0异常 1正常 3审核中 6等待下发',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`,`benefit_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# 转储表 config
# ------------------------------------------------------------

DROP TABLE IF EXISTS `config`;

CREATE TABLE `config` (
  `id` int(255) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` text,
  `remarks` varchar(255) DEFAULT '',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`,`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `config` WRITE;
/*!40000 ALTER TABLE `config` DISABLE KEYS */;

INSERT INTO `config` (`id`, `name`, `value`, `remarks`, `create_time`, `update_time`)
VALUES
	(1,'signin_reward','100','签到奖励','2023-05-19 16:21:12','2023-05-25 11:01:00'),
	(2,'register_reward','100','注册奖励','2023-05-19 16:21:49','2023-05-26 21:49:49'),
	(3,'history_message_count','5','携带历史聊天数量','2023-05-21 14:57:37','2023-05-25 11:00:53'),
	(4,'ai3_ratio','1000','3版本比例 每1积分等于多少token','2023-05-25 16:40:18','2023-06-08 23:27:48'),
	(5,'ai4_ratio','0.01','4版本比例 每1积分等于多少token','2023-05-25 16:40:20','2023-05-29 22:49:33'),
	(6,'draw_price','100','绘画价格 ','2023-05-25 16:58:26','2023-06-08 23:28:07'),
	(7,'shop_introduce','<p><br></p>','商城介绍','2023-05-29 11:51:39','2023-06-07 13:48:02'),
	(8,'user_introduce','<p><br></p>','用户中心介绍','2023-05-29 11:52:07','2023-06-07 13:53:12'),
	(9,'website_title','ChatGPT','网站标题','2023-06-07 11:08:56','2023-06-16 22:53:23'),
	(10,'website_description','我是一个基于OpenAI的ChatGpt应用。','网站描述','2023-06-07 11:08:57','2023-06-07 13:01:14'),
	(11,'website_keywords','Openai,chat,Gpt,AI','网站关键词','2023-06-07 11:09:44','2023-06-07 13:01:32'),
	(12,'website_logo','https://u1.dl0.cn/icon/openailogo.svg','网站logo','2023-06-07 11:10:05','2023-06-07 13:01:39'),
	(13,'website_footer','','网站页脚信息html','2023-06-07 11:12:13','2023-06-10 00:47:28'),
	(14,'prohibited_words','习近平,共产党','违禁词','2023-06-09 10:04:13','2023-06-09 12:55:50'),
	(15,'tuputech_key','','内容检查KEY','2023-06-09 11:20:51','2023-06-10 17:37:28'),
	(16,'invite_introduce','<h1><br></h1>','邀请页面说明','2023-06-10 17:37:02','2023-06-16 22:53:36'),
	(17,'invite_reward','10','邀请奖励','2023-06-10 18:13:30','2023-06-10 18:34:40'),
	(18,'cashback_ratio','1','','2023-06-10 18:40:02','2023-06-10 18:41:29');

/*!40000 ALTER TABLE `config` ENABLE KEYS */;
UNLOCK TABLES;


# 转储表 invite_record
# ------------------------------------------------------------

DROP TABLE IF EXISTS `invite_record`;

CREATE TABLE `invite_record` (
  `id` bigint(255) NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `invite_code` varchar(255) DEFAULT NULL COMMENT '邀请码',
  `superior_id` bigint(255) DEFAULT NULL COMMENT '上级ID（一旦确定将不可修改）',
  `reward` varchar(255) DEFAULT NULL COMMENT '奖励',
  `reward_type` varchar(255) DEFAULT NULL COMMENT '奖励类型',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '1正常',
  `remarks` varchar(255) DEFAULT NULL COMMENT '评论',
  `ip` varchar(255) DEFAULT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_agent` varchar(255) DEFAULT NULL COMMENT 'ua',
  PRIMARY KEY (`id`,`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# 转储表 message
# ------------------------------------------------------------

DROP TABLE IF EXISTS `message`;

CREATE TABLE `message` (
  `id` bigint(255) unsigned NOT NULL,
  `user_id` bigint(255) DEFAULT NULL,
  `content` text,
  `role` varchar(255) DEFAULT NULL,
  `frequency_penalty` int(255) DEFAULT NULL,
  `max_tokens` int(255) DEFAULT NULL,
  `model` varchar(255) DEFAULT NULL,
  `presence_penalty` int(255) DEFAULT NULL,
  `temperature` int(255) DEFAULT NULL,
  `parent_message_id` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# 转储表 notification
# ------------------------------------------------------------

DROP TABLE IF EXISTS `notification`;

CREATE TABLE `notification` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '标题',
  `content` text NOT NULL COMMENT '内容',
  `sort` int(11) DEFAULT '1',
  `status` int(11) DEFAULT NULL COMMENT '状态',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `notification` WRITE;
/*!40000 ALTER TABLE `notification` DISABLE KEYS */;

INSERT INTO `notification` (`id`, `title`, `content`, `sort`, `status`, `create_time`, `update_time`)
VALUES
	(53897947229720576,'系统通知','<p><strong>如需帮助请扫码加微信！</strong></p><p>后台演示地址：<a href=\"https://www.aizj.top/admin\" rel=\"noopener noreferrer\" target=\"_blank\">https://www.aizj.top/admin</a> </p><p>账号：admin@c.om</p><p>密码：admin123</p>',1,1,'2023-05-29 17:31:12','2023-06-16 15:10:10');

/*!40000 ALTER TABLE `notification` ENABLE KEYS */;
UNLOCK TABLES;


# 转储表 order
# ------------------------------------------------------------

DROP TABLE IF EXISTS `order`;

CREATE TABLE `order` (
  `id` bigint(255) NOT NULL,
  `trade_no` varchar(255) DEFAULT NULL COMMENT '支付方订单ID',
  `pay_type` varchar(255) DEFAULT NULL COMMENT '支付方式 wxpay alipay',
  `product_id` bigint(255) DEFAULT NULL COMMENT '商品产品id',
  `trade_status` varchar(255) DEFAULT NULL COMMENT '支付状态',
  `user_id` varchar(255) DEFAULT NULL COMMENT '用户ID',
  `product_info` text COMMENT '商品信息快照',
  `channel` varchar(255) DEFAULT NULL COMMENT '渠道号',
  `payment_id` bigint(255) DEFAULT NULL COMMENT '支付产品ID',
  `payment_info` text COMMENT '支付产品信息',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `money` double DEFAULT NULL COMMENT '支付金额',
  `params` text COMMENT '拓展参数',
  `ip` varchar(255) DEFAULT NULL,
  `notify_info` text COMMENT '通知回来的全部信息',
  `pay_url` varchar(255) DEFAULT NULL COMMENT '支付URL',
  `product_title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# 转储表 payment
# ------------------------------------------------------------

DROP TABLE IF EXISTS `payment`;

CREATE TABLE `payment` (
  `id` bigint(255) NOT NULL,
  `name` varchar(255) NOT NULL COMMENT '名称',
  `channel` varchar(255) NOT NULL DEFAULT '' COMMENT '标识 支付宝 微信 易支付 码支付',
  `types` varchar(255) DEFAULT NULL COMMENT '[''ailipay'',''wxpay'']',
  `params` text COMMENT '支付所需参数',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '1 正常 0异常',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;

INSERT INTO `payment` (`id`, `name`, `channel`, `types`, `params`, `status`, `create_time`, `update_time`)
VALUES
	(56501985410551808,'千青支付','yipay','alipay,wxpay','{\"pid\":\"1000\",\"key\":\"sF41fr6G69F5FBbFzz68q4zGF5fGYF49\",\"api\":\"https://pay.dl0.cn\"}',1,'2023-06-05 21:58:43','2023-06-13 13:52:06');

/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;


# 转储表 product
# ------------------------------------------------------------

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
  `id` bigint(255) unsigned NOT NULL,
  `title` varchar(255) NOT NULL DEFAULT '',
  `price` int(11) NOT NULL,
  `original_price` int(11) DEFAULT NULL,
  `value` int(11) DEFAULT NULL,
  `badge` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '1为正常',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `type` varchar(255) DEFAULT NULL COMMENT 'integral 或 day',
  `level` int(11) DEFAULT '1' COMMENT '会员级别 1 普通 2会员 3超级会员',
  `describe` varchar(255) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;

INSERT INTO `product` (`id`, `title`, `price`, `original_price`, `value`, `badge`, `status`, `create_time`, `update_time`, `type`, `level`, `describe`)
VALUES
	(345678,'3元1800积分',300,500,1800,'特惠',1,'2023-05-17 17:07:53','2023-05-27 21:17:07','integral',2,NULL),
	(4342432,'5元3天',500,500,3,'会员',1,'2023-05-17 19:49:25','2023-06-19 16:40:17','day',1,'5元3天会员'),
	(50420988902379520,'10元15天',1000,2000,10,'会员',1,'2023-05-20 03:15:01','2023-05-26 13:01:41','day',1,NULL),
	(51319724318920704,'10元1天超级会员',1000,20000,1,'低价',1,'2023-05-22 14:46:16','2023-06-15 18:56:13','day',2,NULL),
	(51616604789673984,'1元500分',100,200,500,'测试',1,'2023-05-23 10:25:57','2023-05-29 17:52:20','integral',2,NULL),
	(52899638658732032,'20元30天',2000,3000,30,'超值',1,'2023-05-26 23:24:16','2023-05-26 23:24:41','day',1,NULL),
	(52899934063562752,'50元90天',5000,8000,90,'季度',1,'2023-05-26 23:25:27','2023-06-05 09:28:02','day',1,NULL),
	(52900649888649216,'60元30天超级会员',6000,12000,30,'无限',1,'2023-05-26 23:28:17','2023-05-26 23:28:22','day',2,NULL);

/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;


# 转储表 reward
# ------------------------------------------------------------

DROP TABLE IF EXISTS `reward`;

CREATE TABLE `reward` (
  `id` bigint(255) NOT NULL COMMENT '奖励表',
  `category` varchar(255) NOT NULL COMMENT '签到 ｜ 邀请',
  `value` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL COMMENT '天 ｜ 积分',
  `demand` varchar(255) NOT NULL COMMENT '要求 签到是连续 邀请是不连续',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '1有效',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# 转储表 signin
# ------------------------------------------------------------

DROP TABLE IF EXISTS `signin`;

CREATE TABLE `signin` (
  `id` bigint(255) unsigned NOT NULL,
  `user_id` bigint(255) NOT NULL,
  `ip` varchar(255) NOT NULL,
  `status` int(11) DEFAULT '1',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# 转储表 turnover
# ------------------------------------------------------------

DROP TABLE IF EXISTS `turnover`;

CREATE TABLE `turnover` (
  `id` bigint(255) unsigned NOT NULL,
  `user_id` bigint(20) NOT NULL COMMENT '用户',
  `describe` varchar(255) NOT NULL COMMENT '描述',
  `value` varchar(255) NOT NULL COMMENT '值',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# 转储表 user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` bigint(255) unsigned NOT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `account` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `role` varchar(255) NOT NULL,
  `integral` int(255) DEFAULT '0',
  `vip_expire_time` datetime NOT NULL COMMENT '会员时间',
  `svip_expire_time` datetime DEFAULT NULL COMMENT '超级会员时间',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '1正常',
  `ip` varchar(255) DEFAULT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `invite_code` varchar(255) NOT NULL COMMENT '邀请码',
  `superior_id` bigint(255) DEFAULT NULL COMMENT '上级ID（一旦确定将不可修改）',
  `user_agent` varchar(255) DEFAULT NULL COMMENT 'ua',
  PRIMARY KEY (`id`,`account`,`invite_code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# 转储表 withdrawal_record
# ------------------------------------------------------------

DROP TABLE IF EXISTS `withdrawal_record`;

CREATE TABLE `withdrawal_record` (
  `id` bigint(255) NOT NULL,
  `user_id` bigint(255) DEFAULT NULL COMMENT '申请的用户id',
  `amount` varchar(255) DEFAULT NULL COMMENT '提现金额 分',
  `type` varchar(255) DEFAULT NULL COMMENT '提现方式',
  `name` varchar(255) DEFAULT NULL COMMENT '收款人姓名',
  `contact` varchar(255) DEFAULT NULL COMMENT '联系方式',
  `account` varchar(255) DEFAULT NULL COMMENT '收款账号',
  `remarks` varchar(255) DEFAULT NULL COMMENT '评论',
  `message` varchar(255) DEFAULT NULL COMMENT '消息',
  `status` int(11) NOT NULL DEFAULT '3' COMMENT '0异常 1正常 3审核中 6等待下发',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ip` varchar(255) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL COMMENT 'ua',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
