/*
Navicat MySQL Data Transfer

Source Server         : root
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : movie

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2018-10-17 19:46:08
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `pwd` varchar(100) DEFAULT NULL,
  `is_super` smallint(6) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `role_id` (`role_id`),
  KEY `ix_admin_addtime` (`addtime`),
  CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'jimmovie', 'pbkdf2:sha256:50000$PdWfGN2W$bf0a6b19a7f6942171a939e8c8388adc6290cda7b7b1b2dbe62e593540a1d11a', '0', '1', '2018-01-28 17:43:01');
INSERT INTO `admin` VALUES ('2', 'jim', 'pbkdf2:sha256:50000$NZCiw4KO$bb4b044de7fae8d722181aea27eb34e32f85b8de3351cbeff3ed106ca9c0f897', '1', '1', '2018-02-07 00:55:51');

-- ----------------------------
-- Table structure for adminlog
-- ----------------------------
DROP TABLE IF EXISTS `adminlog`;
CREATE TABLE `adminlog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) DEFAULT NULL,
  `ip` varchar(100) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_id` (`admin_id`),
  KEY `ix_adminlog_addtime` (`addtime`),
  CONSTRAINT `adminlog_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of adminlog
-- ----------------------------
INSERT INTO `adminlog` VALUES ('1', '1', '127.0.0.1', '2018-02-06 00:35:50');
INSERT INTO `adminlog` VALUES ('2', '1', '127.0.0.1', '2018-02-06 00:35:54');
INSERT INTO `adminlog` VALUES ('3', '1', '127.0.0.1', '2018-02-06 00:35:58');
INSERT INTO `adminlog` VALUES ('4', '1', '127.0.0.1', '2018-02-06 18:46:22');
INSERT INTO `adminlog` VALUES ('5', '1', '127.0.0.1', '2018-02-07 11:42:20');
INSERT INTO `adminlog` VALUES ('6', '1', '127.0.0.1', '2018-02-07 11:51:44');
INSERT INTO `adminlog` VALUES ('7', '1', '127.0.0.1', '2018-02-07 11:54:02');
INSERT INTO `adminlog` VALUES ('8', '1', '127.0.0.1', '2018-02-07 13:05:40');
INSERT INTO `adminlog` VALUES ('9', '1', '127.0.0.1', '2018-02-07 13:06:40');
INSERT INTO `adminlog` VALUES ('10', '1', '127.0.0.1', '2018-02-07 13:07:30');
INSERT INTO `adminlog` VALUES ('11', '1', '127.0.0.1', '2018-02-07 13:08:19');
INSERT INTO `adminlog` VALUES ('12', '2', '127.0.0.1', '2018-02-07 13:10:56');
INSERT INTO `adminlog` VALUES ('13', '1', '127.0.0.1', '2018-02-07 13:15:21');
INSERT INTO `adminlog` VALUES ('14', '2', '127.0.0.1', '2018-02-07 13:15:35');
INSERT INTO `adminlog` VALUES ('15', '1', '127.0.0.1', '2018-02-07 13:23:08');
INSERT INTO `adminlog` VALUES ('16', '1', '127.0.0.1', '2018-02-09 00:14:04');

-- ----------------------------
-- Table structure for auth
-- ----------------------------
DROP TABLE IF EXISTS `auth`;
CREATE TABLE `auth` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `url` (`url`),
  KEY `ix_auth_addtime` (`addtime`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth
-- ----------------------------
INSERT INTO `auth` VALUES ('1', '添加标签', '/admin/tag/add/', '2018-02-06 18:49:10');
INSERT INTO `auth` VALUES ('2', '编辑标签', '/admin/tag/edit/<int:id>/', '2018-02-06 18:50:26');
INSERT INTO `auth` VALUES ('3', '标签列表', '/admin/tag/list/<int:page>/', '2018-02-06 18:51:05');
INSERT INTO `auth` VALUES ('4', '删除标签', '/admin/tag/del/<int:id>/', '2018-02-06 18:51:42');
INSERT INTO `auth` VALUES ('8', 'aaa', 'aaa', '2018-02-06 19:25:56');

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text,
  `user_id` int(11) DEFAULT NULL,
  `movie_id` int(11) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `movie_id` (`movie_id`),
  KEY `ix_comment_addtime` (`addtime`),
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('1', '123', '2', '1', '2018-02-05 18:40:22');
INSERT INTO `comment` VALUES ('2', '11111', '3', '1', '2018-02-05 18:40:49');
INSERT INTO `comment` VALUES ('10', '<p>11</p>', null, '1', '2018-02-14 19:17:30');
INSERT INTO `comment` VALUES ('11', '<p>22</p>', null, '1', '2018-02-14 19:17:40');
INSERT INTO `comment` VALUES ('12', '<p>11<br/></p>', null, '1', '2018-02-14 19:18:58');
INSERT INTO `comment` VALUES ('13', '<p>11</p>', null, '1', '2018-02-14 19:19:08');
INSERT INTO `comment` VALUES ('14', '<p>11</p>', null, '1', '2018-02-14 19:28:15');
INSERT INTO `comment` VALUES ('15', '<p>11</p>', null, '1', '2018-02-14 19:28:22');
INSERT INTO `comment` VALUES ('16', '<p>333</p>', null, '1', '2018-02-14 19:28:27');
INSERT INTO `comment` VALUES ('17', '<p>123</p>', null, '1', '2018-02-14 19:28:43');
INSERT INTO `comment` VALUES ('18', '<p>222</p>', null, '1', '2018-02-14 19:28:51');
INSERT INTO `comment` VALUES ('19', '<p>222</p>', '5', '1', '2018-02-14 19:31:01');
INSERT INTO `comment` VALUES ('20', '<p>333</p>', '5', '1', '2018-02-14 19:31:08');
INSERT INTO `comment` VALUES ('21', '<p>444</p>', '5', '1', '2018-02-14 19:31:13');
INSERT INTO `comment` VALUES ('22', '<p>555</p>', '5', '1', '2018-02-14 19:31:19');
INSERT INTO `comment` VALUES ('23', '<p>aaa</p>', '5', '1', '2018-02-14 19:31:24');
INSERT INTO `comment` VALUES ('24', '<p>bbb</p>', '5', '1', '2018-02-14 19:31:37');
INSERT INTO `comment` VALUES ('25', '<p>ccc</p>', '5', '1', '2018-02-14 19:31:40');
INSERT INTO `comment` VALUES ('26', '<p>ddd</p>', '5', '1', '2018-02-14 19:31:43');
INSERT INTO `comment` VALUES ('27', '<p>eee</p>', '5', '1', '2018-02-14 19:31:47');
INSERT INTO `comment` VALUES ('28', '<p>rrr</p>', '5', '1', '2018-02-14 19:31:57');
INSERT INTO `comment` VALUES ('29', '<p>www</p>', '5', '1', '2018-02-14 19:32:26');
INSERT INTO `comment` VALUES ('30', '<p>11</p>', '5', '2', '2018-02-14 23:17:15');

-- ----------------------------
-- Table structure for movie
-- ----------------------------
DROP TABLE IF EXISTS `movie`;
CREATE TABLE `movie` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `info` text,
  `logo` varchar(255) DEFAULT NULL,
  `start` smallint(6) DEFAULT NULL,
  `playnum` bigint(20) DEFAULT NULL,
  `commentnum` bigint(20) DEFAULT NULL,
  `tag_id` int(11) DEFAULT NULL,
  `area` varchar(255) DEFAULT NULL,
  `release_time` date DEFAULT NULL,
  `length` varchar(100) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`),
  UNIQUE KEY `url` (`url`),
  UNIQUE KEY `logo` (`logo`),
  KEY `tag_id` (`tag_id`),
  KEY `ix_movie_addtime` (`addtime`),
  CONSTRAINT `movie_ibfk_1` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of movie
-- ----------------------------
INSERT INTO `movie` VALUES ('1', '111', '20180204213048f25ef5b35c864974ac6b46cf13d9be0f.mp4', '121の243445', '20180204213048904218c00b2d4b96bf94259cf7a83107.jpg', '1', '86', '23', '2', '茂名', '2018-03-03', '6', '2018-02-04 21:30:48');
INSERT INTO `movie` VALUES ('2', 'python', '201802051128308b68a64b45e54783a265f17546f41b95.mp4', 'python', '20180205112830d79b98ae5fee4a4a9242369c83e4ed7a.png', '5', '10', '1', '1', '123', '2018-03-01', '7', '2018-02-05 11:28:30');

-- ----------------------------
-- Table structure for moviecol
-- ----------------------------
DROP TABLE IF EXISTS `moviecol`;
CREATE TABLE `moviecol` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `movie_id` int(11) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `movie_id` (`movie_id`),
  KEY `ix_moviecol_addtime` (`addtime`),
  CONSTRAINT `moviecol_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `moviecol_ibfk_2` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of moviecol
-- ----------------------------
INSERT INTO `moviecol` VALUES ('1', '2', '1', '2018-02-05 19:05:50');
INSERT INTO `moviecol` VALUES ('2', '3', '1', '2018-02-05 19:06:10');
INSERT INTO `moviecol` VALUES ('3', '3', '2', '2018-02-05 19:06:29');
INSERT INTO `moviecol` VALUES ('4', '5', '2', '2018-02-14 23:18:24');
INSERT INTO `moviecol` VALUES ('5', '5', '1', '2018-02-14 23:25:22');

-- ----------------------------
-- Table structure for oplog
-- ----------------------------
DROP TABLE IF EXISTS `oplog`;
CREATE TABLE `oplog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) DEFAULT NULL,
  `ip` varchar(100) DEFAULT NULL,
  `reson` varchar(600) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_id` (`admin_id`),
  KEY `ix_Oplog_addtime` (`addtime`),
  CONSTRAINT `oplog_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oplog
-- ----------------------------
INSERT INTO `oplog` VALUES ('1', '1', '127.0.0.1', '添加标签222', '2018-02-05 22:43:17');
INSERT INTO `oplog` VALUES ('2', '1', '127.0.0.1', '添加标签333', '2018-02-05 22:43:21');
INSERT INTO `oplog` VALUES ('3', '1', '127.0.0.1', '添加标签555', '2018-02-05 22:43:25');
INSERT INTO `oplog` VALUES ('4', '1', '127.0.0.1', '添加标签666', '2018-02-05 22:43:27');
INSERT INTO `oplog` VALUES ('5', '1', '127.0.0.1', '添加标签777', '2018-02-05 22:43:30');
INSERT INTO `oplog` VALUES ('6', '1', '127.0.0.1', '添加标签888', '2018-02-05 22:43:32');
INSERT INTO `oplog` VALUES ('7', '1', '127.0.0.1', '添加标签999', '2018-02-05 22:43:35');
INSERT INTO `oplog` VALUES ('8', '1', '127.0.0.1', '添加标签aaa', '2018-02-05 22:43:38');
INSERT INTO `oplog` VALUES ('9', '1', '127.0.0.1', '添加标签bbb', '2018-02-05 22:43:42');
INSERT INTO `oplog` VALUES ('10', '1', '127.0.0.1', '添加标签ccc', '2018-02-05 22:43:44');
INSERT INTO `oplog` VALUES ('11', '2', '127.0.0.1', '添加标签123', '2018-02-07 13:16:23');

-- ----------------------------
-- Table structure for preview
-- ----------------------------
DROP TABLE IF EXISTS `preview`;
CREATE TABLE `preview` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`),
  UNIQUE KEY `logo` (`logo`),
  KEY `ix_preview_addtime` (`addtime`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of preview
-- ----------------------------
INSERT INTO `preview` VALUES ('1', 'python3', '201802051554332d49bfe355104bf1b202740280dfee0e.PNG', '2018-02-05 15:06:22');
INSERT INTO `preview` VALUES ('2', '122', '20180205153651a276e62ca73f42469574735d60f75df4.PNG', '2018-02-05 15:36:51');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `auths` varchar(600) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `ix_role_addtime` (`addtime`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', '超级管理员', '', '2018-01-28 17:37:55');
INSERT INTO `role` VALUES ('2', '标签管理员1', '1,3', '2018-02-06 22:32:11');
INSERT INTO `role` VALUES ('4', '标签管理员', '1,2,3,4', '2018-02-06 22:36:30');

-- ----------------------------
-- Table structure for tag
-- ----------------------------
DROP TABLE IF EXISTS `tag`;
CREATE TABLE `tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `ix_tag_addtime` (`addtime`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tag
-- ----------------------------
INSERT INTO `tag` VALUES ('1', '爱情', '2018-02-04 15:53:16');
INSERT INTO `tag` VALUES ('2', '科幻', '2018-02-04 15:53:29');
INSERT INTO `tag` VALUES ('6', '动作', '2018-02-04 16:58:32');
INSERT INTO `tag` VALUES ('7', '111', '2018-02-05 22:42:07');
INSERT INTO `tag` VALUES ('8', '222', '2018-02-05 22:43:17');
INSERT INTO `tag` VALUES ('9', '333', '2018-02-05 22:43:21');
INSERT INTO `tag` VALUES ('10', '555', '2018-02-05 22:43:25');
INSERT INTO `tag` VALUES ('11', '666', '2018-02-05 22:43:27');
INSERT INTO `tag` VALUES ('12', '777', '2018-02-05 22:43:30');
INSERT INTO `tag` VALUES ('13', '888', '2018-02-05 22:43:32');
INSERT INTO `tag` VALUES ('14', '999', '2018-02-05 22:43:35');
INSERT INTO `tag` VALUES ('15', 'aaa', '2018-02-05 22:43:38');
INSERT INTO `tag` VALUES ('16', 'bbb', '2018-02-05 22:43:42');
INSERT INTO `tag` VALUES ('17', 'ccc', '2018-02-05 22:43:44');
INSERT INTO `tag` VALUES ('18', '123', '2018-02-07 13:16:23');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `pwd` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `info` text,
  `face` varchar(255) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  `uuid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone` (`phone`),
  UNIQUE KEY `face` (`face`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `ix_user_addtime` (`addtime`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('2', '112', '122', '1232@qq.com', '12345678913', '2122222222', 'bb.jpg', '2018-01-30 18:25:53', '2');
INSERT INTO `user` VALUES ('3', 'cc', 'ccc', 'ccc@163.com', '12345678916', '3333333', 'cc.jpg', '2018-02-28 18:27:37', '3');
INSERT INTO `user` VALUES ('4', 'dd', 'ddd', 'ddd@163com', '12345678914', '444', 'aa.jpg', '2018-02-05 18:29:56', '4');
INSERT INTO `user` VALUES ('5', 'jim', 'pbkdf2:sha256:50000$GA4i2lb8$a812048bf2dee758bbe8ab3e89edd1e37d823ad108bc7f8e11f5faf0f0ddeb78', '1232213@qq.com', '13128908911', '231', '20180208230840f0f7f759afaf444495536b81769e3d46.PNG', '2018-02-07 15:58:43', '0eda45a298f54d968dea9e6cf3faad42');

-- ----------------------------
-- Table structure for userlog
-- ----------------------------
DROP TABLE IF EXISTS `userlog`;
CREATE TABLE `userlog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `ip` varchar(100) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `ix_userlog_addtime` (`addtime`),
  CONSTRAINT `userlog_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userlog
-- ----------------------------
INSERT INTO `userlog` VALUES ('1', '2', '192.168.1.6', '2018-02-06 00:56:47');
INSERT INTO `userlog` VALUES ('2', '3', '192.168.1.6', '2018-02-06 00:57:11');
INSERT INTO `userlog` VALUES ('3', '4', '192.168.1.6', '2018-02-06 00:57:31');
INSERT INTO `userlog` VALUES ('4', '5', '127.0.0.1', '2018-02-07 16:25:34');
INSERT INTO `userlog` VALUES ('5', '5', '127.0.0.1', '2018-02-08 23:08:21');
INSERT INTO `userlog` VALUES ('6', '5', '127.0.0.1', '2018-02-08 23:39:54');
INSERT INTO `userlog` VALUES ('7', '5', '127.0.0.1', '2018-02-13 21:06:39');
INSERT INTO `userlog` VALUES ('8', '5', '127.0.0.1', '2018-02-13 21:10:10');
INSERT INTO `userlog` VALUES ('9', '5', '127.0.0.1', '2018-02-14 10:38:17');
