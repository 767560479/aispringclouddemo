/*
 Navicat Premium Data Transfer

 Source Server         : fei
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : localhost:3306
 Source Schema         : orderingsystem

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 12/09/2019 20:39:28
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_admin
-- ----------------------------
DROP TABLE IF EXISTS `t_admin`;
CREATE TABLE `t_admin`  (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_admin
-- ----------------------------
INSERT INTO `t_admin` VALUES (1, 'admin', 'admin');

-- ----------------------------
-- Table structure for t_menu
-- ----------------------------
DROP TABLE IF EXISTS `t_menu`;
CREATE TABLE `t_menu`  (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `price` double(10, 2) NULL DEFAULT NULL,
  `flavor` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tid` int(8) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `tid`(`tid`) USING BTREE,
  CONSTRAINT `t_menu_ibfk_1` FOREIGN KEY (`tid`) REFERENCES `t_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_menu
-- ----------------------------
INSERT INTO `t_menu` VALUES (1, '香酥鸡', 39.00, '五香', 2);
INSERT INTO `t_menu` VALUES (2, '烧焦扣肉', 46.00, '微辣', 3);
INSERT INTO `t_menu` VALUES (6, '测试3', 55.00, '五香', 2);
INSERT INTO `t_menu` VALUES (7, '测试4', 66.00, '五香', 3);
INSERT INTO `t_menu` VALUES (8, '测试5', 77.00, '五香', 2);
INSERT INTO `t_menu` VALUES (9, '测试6', 55.00, '五香', 3);
INSERT INTO `t_menu` VALUES (10, '测试7', 66.00, '五香', 2);
INSERT INTO `t_menu` VALUES (11, '测试8', 77.00, '五香', 3);
INSERT INTO `t_menu` VALUES (12, '测试9', 55.00, '五香', 2);
INSERT INTO `t_menu` VALUES (13, '测试10', 66.00, '五香', 3);
INSERT INTO `t_menu` VALUES (14, '测试11', 77.00, '五香', 4);
INSERT INTO `t_menu` VALUES (15, '测试12', 55.00, '五香', 5);
INSERT INTO `t_menu` VALUES (16, '测试13', 66.00, '五香', 3);
INSERT INTO `t_menu` VALUES (17, '测试14', 77.00, '五香', 2);
INSERT INTO `t_menu` VALUES (18, '测试15', 55.00, '五香', 3);
INSERT INTO `t_menu` VALUES (19, '测试16', 66.00, '五香', 2);
INSERT INTO `t_menu` VALUES (20, '测试17', 77.00, '五香', 3);
INSERT INTO `t_menu` VALUES (21, '测试18', 55.00, '五香', 2);
INSERT INTO `t_menu` VALUES (22, '测试19', 66.00, '五香', 3);
INSERT INTO `t_menu` VALUES (23, '测试20', 77.00, '五香', 2);
INSERT INTO `t_menu` VALUES (24, '测试3', 55.00, '五香', 3);
INSERT INTO `t_menu` VALUES (25, '测试3', 66.00, '五香', 3);
INSERT INTO `t_menu` VALUES (26, '测试3', 77.00, '五香', NULL);
INSERT INTO `t_menu` VALUES (27, '测试3', 55.00, '五香', 2);
INSERT INTO `t_menu` VALUES (28, '测试3', 66.00, '五香', 2);
INSERT INTO `t_menu` VALUES (29, '测试3', 77.00, '五香', 3);

-- ----------------------------
-- Table structure for t_order
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order`  (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `uid` int(8) NULL DEFAULT NULL,
  `mid` int(8) NULL DEFAULT NULL,
  `aid` int(8) NULL DEFAULT NULL,
  `date` date NULL DEFAULT NULL,
  `state` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `mid`(`mid`) USING BTREE,
  INDEX `aid`(`aid`) USING BTREE,
  CONSTRAINT `t_order_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `t_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `t_order_ibfk_2` FOREIGN KEY (`mid`) REFERENCES `t_menu` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `t_order_ibfk_3` FOREIGN KEY (`aid`) REFERENCES `t_admin` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_type
-- ----------------------------
DROP TABLE IF EXISTS `t_type`;
CREATE TABLE `t_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_type
-- ----------------------------
INSERT INTO `t_type` VALUES (2, '凉菜');
INSERT INTO `t_type` VALUES (3, '热菜');
INSERT INTO `t_type` VALUES (4, '主食');
INSERT INTO `t_type` VALUES (5, '烘培');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `nickname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gender` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `telephone` int(255) NULL DEFAULT NULL,
  `registerdate` date NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES (1, 'zhangsan', '123', '张三', '男', 110, '2019-07-12', '康裕路');
INSERT INTO `t_user` VALUES (2, 'lisi', '123', '李四', '男', 120, '2019-07-03', '上海路');

SET FOREIGN_KEY_CHECKS = 1;
