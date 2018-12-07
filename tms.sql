/*
 Navicat Premium Data Transfer

 Source Server         : Aliyun
 Source Server Type    : MySQL
 Source Server Version : 50718
 Source Host           : rm-bp168uotg0aupq876yo.mysql.rds.aliyuncs.com:3306
 Source Schema         : tms

 Target Server Type    : MySQL
 Target Server Version : 50718
 File Encoding         : 65001

 Date: 15/03/2018 02:40:55
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for group
-- ----------------------------
DROP TABLE IF EXISTS `group`;
CREATE TABLE `group`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `order` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `master_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of group
-- ----------------------------
INSERT INTO `group` VALUES (6, '电子商城的设计与实现-第1组', 1, 1, '111');
INSERT INTO `group` VALUES (7, '电子商城的设计与实现-第1组', 1, 2, '111');
INSERT INTO `group` VALUES (8, 'HTML5图形图像处理技术的研究-第1组', 1, 5, '111');
INSERT INTO `group` VALUES (9, '学籍异动管理系统-第1组', 1, 7, '111');
INSERT INTO `group` VALUES (10, 'HTML5图形图像处理技术的研究-第2组', 2, 5, '444');

-- ----------------------------
-- Table structure for group_work
-- ----------------------------
DROP TABLE IF EXISTS `group_work`;
CREATE TABLE `group_work`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `work_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `master_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `attachment` text CHARACTER SET utf8 COLLATE utf8_bin NULL,
  `log` text CHARACTER SET utf8 COLLATE utf8_bin NULL,
  `comment` text CHARACTER SET utf8 COLLATE utf8_bin NULL,
  `score` double NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of group_work
-- ----------------------------
INSERT INTO `group_work` VALUES (1, 1, 8, '111', '/tms/file//2018/03/14/223813/微信图片_20180314165241.png', '<span class=\"am-text-success\">[2018年03月14日]</span><span class=\"am-text-primary\">[option1]</span>: 完成PPT<br><span class=\"am-text-success\">[2018年03月15日]</span><span class=\"am-text-primary\">[张昊]</span>: 书写相关文档<br><span class=\"am-text-success\">[2018年03月15日]</span><span class=\"am-text-primary\">[张昊]</span>: 完成任务分配', '完成的不错，继续努力！！！', 86);
INSERT INTO `group_work` VALUES (3, 4, 6, '111', NULL, '<span class=\"am-text-success\">[2018年03月14日]</span><span class=\"am-text-primary\">[王达]</span>: 开始作业<br><span class=\"am-text-success\">[2018年03月15日]</span><span class=\"am-text-primary\">[赵东升]</span>: 测试2', NULL, 0);
INSERT INTO `group_work` VALUES (4, 1, 10, '444', NULL, '<span class=\"am-text-success\">[2018年03月15日]</span><span class=\"am-text-primary\">[王达]</span>: 书写日志', '还行', 56);

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action` int(11) NULL DEFAULT 0 COMMENT '修改为int 0->未审批 1->已审批 默认0',
  `result` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `type` int(11) NULL DEFAULT 0,
  `state` int(11) NOT NULL DEFAULT 0,
  `project_id` int(11) NULL DEFAULT NULL,
  `work_id` int(11) NULL DEFAULT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_bin NULL,
  `send_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `receive_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `send_time` timestamp(0) NULL DEFAULT NULL,
  `action_time` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES (1, 1, '审核通过', 2, 1, 1, 0, '张昊(111)申请成为《电子商城的设计与实现》的组长，是否批准？', '111', '222', '2018-02-28 13:35:07', '2018-03-01 15:03:11');
INSERT INTO `message` VALUES (4, 1, '审核通过', 2, 1, 2, 0, '张昊(111)申请成为《电子商城的设计与实现》的组长，是否批准？', '111', '222', '2018-02-28 14:50:07', '2018-03-01 15:04:02');
INSERT INTO `message` VALUES (8, 0, NULL, 0, 1, 0, 0, '测试邮件111111111111111111111111', '111', '222', '2018-02-28 18:11:42', NULL);
INSERT INTO `message` VALUES (9, 0, NULL, 0, 1, 0, 0, '测试邮件22222222222222223@#！%……%&*（）——）（*&……%￥#@#￥%……&*&&……%￥#@#￥%……&*（）——+——）（*&……￥%……&￥%……%#@#￥%……&#￥%……&', '111', '222', '2018-02-28 18:12:57', NULL);
INSERT INTO `message` VALUES (10, 0, '', 2, 1, 3, 0, '张昊(111)申请成为《实验室排课及教学管理系统的设计与实现》的组长，是否批准？', '111', '222', '2018-03-01 13:35:05', '2018-03-01 13:37:14');
INSERT INTO `message` VALUES (11, 0, '', 2, 1, 4, 0, '张昊(111)申请成为《利用线索链表实现二叉树的非递归遍历算法》的组长，是否批准？', '111', '888', '2018-03-01 13:39:37', '2018-03-01 13:40:43');
INSERT INTO `message` VALUES (12, 0, '', 2, 1, 4, 0, '王达(444)申请成为《利用线索链表实现二叉树的非递归遍历算法》的组长，是否批准？', '444', '888', '2018-03-01 13:41:51', '2018-03-01 13:42:14');
INSERT INTO `message` VALUES (13, 1, '系统自动拒绝', 2, 1, 1, 0, '赵东升(555)申请成为《电子商城的设计与实现》的组长，是否批准？', '555', '222', '2018-03-01 16:38:56', '2018-03-01 16:39:02');
INSERT INTO `message` VALUES (14, 1, '系统自动拒绝', 2, 1, 2, 0, '赵东升(555)申请成为《电子商城的设计与实现》的组长，是否批准？', '555', '222', '2018-03-01 16:41:20', '2018-03-09 11:27:13');
INSERT INTO `message` VALUES (15, 0, NULL, 0, 1, 0, 0, '1111', '111', '111', '2018-03-06 14:30:43', NULL);
INSERT INTO `message` VALUES (16, 1, '审核通过', 2, 1, 7, 0, '张昊(111)申请成为《学籍异动管理系统》的组长，是否批准？', '111', '666', '2018-03-08 09:57:10', '2018-03-08 11:00:26');
INSERT INTO `message` VALUES (17, 1, '审核通过', 2, 1, 5, 0, '张昊(111)申请成为《HTML5图形图像处理技术的研究》的组长，是否批准？', '111', '666', '2018-03-08 10:56:03', '2018-03-08 10:56:42');
INSERT INTO `message` VALUES (18, 1, '审核通过', 2, 1, 5, 0, '王达(444)申请成为《HTML5图形图像处理技术的研究》的组长，是否批准？', '444', '666', '2018-03-15 00:20:28', '2018-03-15 00:20:40');
INSERT INTO `message` VALUES (19, 0, NULL, 2, 0, 6, 0, '张昊(111)申请成为《综合实践项目管理系统》的组长，是否批准？', '111', '333', '2018-03-15 01:51:56', NULL);

-- ----------------------------
-- Table structure for project
-- ----------------------------
DROP TABLE IF EXISTS `project`;
CREATE TABLE `project`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_bin NULL,
  `attachment` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `group_project` int(11) NOT NULL DEFAULT 0,
  `max_group` int(11) NULL DEFAULT 0,
  `group_max_member` int(11) NULL DEFAULT 0,
  `group_master` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `user_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of project
-- ----------------------------
INSERT INTO `project` VALUES (1, '电子商城的设计与实现', '设计一个电子商城前台功能主要如下：用户的注册、用户资料的修改、用户登录、商品的购买、商品的搜索、商品的分页查看、商品的分类搜索、购物车中商品的删除与商品数量的修改。     订单提交及收货人信息的修改。后台功能主要如下：管理员登录及密码修改。商品的管理，包括商品的增、删、改、查。订单的管理，包括订单的发货及删除。 管理员管理，包括管理员的添加及管理员密码重置', '', 0, 10, 6, '具备责任心，说明原缘由', '222', '姜维', '2018-01-26 11:52:32');
INSERT INTO `project` VALUES (2, '电子商城的设计与实现', '设计一个电子商城前台功能主要如下：用户的注册、用户资料的修改、用户登录、商品的购买、商品的搜索、商品的分页查看、商品的分类搜索、购物车中商品的删除与商品数量的修改。     订单提交及收货人信息的修改。后台功能主要如下：管理员登录及密码修改。商品的管理，包括商品的增、删、改、查。订单的管理，包括订单的发货及删除。 管理员管理，包括管理员的添加及管理员密码重置', '/tms/file//2018/01/26/115534/answer.ctl', 0, 10, 6, '责任心强，说明申请理由。', '222', '姜维', '2018-01-26 11:56:02');
INSERT INTO `project` VALUES (3, '实验室排课及教学管理系统的设计与实现', '目前我院各个实验室承担的课程和班级都比较多，还有很多实验器材需要管理，需要一个实验室的管理系统。内容包括如下模块：1、用户管理，用户注册及资料修改，分教师用户和学生用户；2、排课管理，生成课表及课表的管理和查询，3、学生信息管理，学生信息的录入；\n4、成绩管理，每次实验成绩和期末成绩的录入及查询、打印；5、设备管理，实验设备的登记及损坏、借出记录；6、实验管理，用学生用户登录后系统生成该班学生的出勤和实验台使用记录。学生可查看该实验的实验指导和提交实验报告。\n', '/tms/file//2018/01/26/115947/desktop.ini', 1, 10, 6, '责任心强', '222', '姜维', '2018-01-26 12:00:02');
INSERT INTO `project` VALUES (4, '利用线索链表实现二叉树的非递归遍历算法', 'n个结点的二叉链表中，有2n个指针，只用了n-1个指针，有n+1个指针是空的。利用二叉树的二叉链表中的空指针指向遍历序列的前驱、后继结点，遍历二叉树时就可以即不需要栈，也不需要递归，节约了时间和空间。', '', 0, 10, 6, '无', '888', '陈祖德', '2018-01-26 16:43:44');
INSERT INTO `project` VALUES (5, 'HTML5图形图像处理技术的研究', '网络技术一直在深刻而且快速的改变人们的生活。越来越多的人们喜欢在网络上购物、聊天、办公。越来越多的应用程序也在浏览器上出现，例如文档编辑软件、图像处理软件等。同传统的桌面应用相比，Web应用具有操作和维护起来简单，利于多人共享以及易于安装部署和易于扩展的特点，还可以充分利用本机的资源，有效的融合了Web和桌面两个软件领域的优势，是未来软件发展的趋势。新生的HTML5技术，提供了丰富的多媒体应用功能，极大的减少了传统Web应用对插件的依赖。在课题使用计算机图形图像处理的知识，利用HTML5的图形图像处理功能以及实时通信功能，研究在Web上进行图形图像处理技术，并设计开发了图形图像处理平台，以验证该项技术的可行性。', '/tms/file//2018/01/26/164907/cpts_640_cej.zip', 1, 10, 6, '无', '666', '孙达生', '2018-01-26 16:49:15');
INSERT INTO `project` VALUES (6, '综合实践项目管理系统', '综合实践项目管理系统实现校外实训基地管理、校内外实训方案管理、校外实训报名、校内外实训成绩管理、实训费用管理以及校内外实训效果反馈等功能。校外实训报名实现学生网上选择实训方案，系统完成统计，形成实训报名表。实训成绩反馈实现反馈问卷生成、网上调查和结果统计的功能。 通过实训系统的使用，提高实训管理工作的效率。系统采用Java Web技术开发。', '', 1, 10, 6, '无', '333', '黄大师', '2018-01-26 16:51:56');
INSERT INTO `project` VALUES (7, '学籍异动管理系统', '学籍异动管理系统实现学生学籍异动信息管理，包括学籍异动信息生成、学籍异动记录管理、学籍异动学生学习情况统计分析。系统需要实现学生成绩数据的自动导入。依据学生管理规定中学籍异动规则生成学籍异动学生名单，学籍异动规则可配置。对比学籍异动前后成绩情况，给出学习情况分析结果。通过学籍异动管理系统的使用，提升学籍异动工作成效。', '', 0, 10, 6, '无', '666', '孙达生', '2018-01-26 16:58:18');
INSERT INTO `project` VALUES (8, '基于微服务架构的遗留系统改造', '随着技术和应用需求的变化，遗留系统在吞吐量、稳定性以及可扩展性上都无法满足日益增长的业务需求。通过使用微服务架构，在不影响现有业务运转的情况下，可以将遗留的单块架构系统逐渐分解成不同功能的微服务应用。通过微服务开发架构，能够快速构建不同功能的微服务接口，并能方便的将其部署在验收环境和生产环境下。得益于微服务的灵活性和高扩展性，能够快速建立低耦合、易扩展、易伸缩性的应用系统。本项目拟选取开源的遗留软件系统，实施其部分功能的微服务架构改造，研究遗留软件的微服务架构改造过程。', '', 1, 10, 6, '有责任心', '666', '孙达生', '2018-01-26 16:58:48');
INSERT INTO `project` VALUES (9, '应用健康性分析统计系统', '通过对系统和应用容器（如Tomcat等）的日志分析，对业务系统的健康程度进行统计。要求系统可对C/S模式（web日志和数据库日志）或者B/S模式（数据库日志）的应用进行分析，并以HTML图表的方式展现出来，并定位各类常见警告或者错误产生的原因，给管理员以修复建议。', '', 0, 10, 6, '无', '666', '孙达生', '2018-01-26 17:00:13');
INSERT INTO `project` VALUES (10, '基于分布式文件管理系统的大数据分析', '在“大数据”时代，数据已经成为决策最为重要的参考之一。对数据进行正确的分析以求最大化地挖掘数据的价值，发挥数据的作用也变得十分重要。相比于集中式数据库而言，分布式文件管理系统更适合存储海量数据，所以基于分布式文件系统的大数据分析对于深度挖掘出校园数据蕴含的价值是十分有意义的。\n内容：1、FastDFS分布式文件管理系统介绍\n2、定义数据分析目标\n3、数据提取（从档案管理系统中随机均匀提取相关、可靠的数据）\n4、数据探索（对数据进行异常值分析、缺失值分析，保证数据质量）\n5、数据预处理（数据清洗、集成、变换）\n6、 建模（根据分析目标选择适当模型。算法ID3、ANN、K-means、Apriori等）\n7、展示、评价\n', '', 0, 10, 6, '无', '666', '孙达生', '2018-01-26 17:01:46');
INSERT INTO `project` VALUES (11, '学生管理系统', '测试6内容', '/tms/file//2018/01/26/164907/cpts_640_cej.zip', 0, 10, 6, '无', '666', '孙达生', '2018-02-09 15:13:33');
INSERT INTO `project` VALUES (12, '测试7', '测试7描述', NULL, 0, 10, 6, '责任心强', '666', '孙达生', '2018-02-09 15:16:13');
INSERT INTO `project` VALUES (13, '测试8', '测试8描述', NULL, 0, 10, 6, '责任心强', '666', '孙达生', '2018-02-09 15:16:53');
INSERT INTO `project` VALUES (14, '测试9', '测试9描述', NULL, 0, 10, 6, '责任心强', '666', '孙达生', '2018-02-09 15:16:53');
INSERT INTO `project` VALUES (15, '测试10', '测试10描述', NULL, 0, 10, 6, '责任心强', '666', '孙达生', '2018-02-09 15:16:53');
INSERT INTO `project` VALUES (16, '测试11', '测试11描述', NULL, 0, 10, 6, '责任心强', '666', '孙达生', '2018-02-09 15:16:53');
INSERT INTO `project` VALUES (17, '测试12', '测试12描述', NULL, 0, 10, 6, '责任心强', '666', '孙达生', '2018-02-09 15:16:53');
INSERT INTO `project` VALUES (18, '测试项目13', '测试', '', 0, 10, 6, '责任心强，学习优异', '666', '孙达生', '2018-02-14 17:00:00');
INSERT INTO `project` VALUES (19, '测试项目14', '', '', 0, 10, 6, '测试项目14', '666', '孙达生', '2018-02-14 17:02:26');
INSERT INTO `project` VALUES (20, '测试项目15', '', '', 0, 10, 6, '无', '666', '孙达生', '2018-02-14 17:05:26');
INSERT INTO `project` VALUES (21, '测试16', '而是', NULL, 0, 10, 6, '无', '333', '黄大师', '2018-02-27 16:19:36');
INSERT INTO `project` VALUES (22, '测试1000', '大大大', '/tms/file//2018/03/10/151619/新建文本文档.txt', 0, 6, 10, '无', '666', '孙达生', '2018-03-10 15:16:33');

-- ----------------------------
-- Table structure for task
-- ----------------------------
DROP TABLE IF EXISTS `task`;
CREATE TABLE `task`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `work_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_bin NULL,
  `process` int(11) NULL DEFAULT 0,
  `time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of task
-- ----------------------------
INSERT INTO `task` VALUES (2, '111', 1, 5, 8, '任务1 的详细内容。第二次分配任务。第三次任务。', 100, '2018-03-09 11:02:55');
INSERT INTO `task` VALUES (3, '444', 4, 1, 6, '王达的任务', 30, '2018-03-09 11:35:27');
INSERT INTO `task` VALUES (4, '111', 4, 1, 6, 'aaa', 60, '2018-03-11 01:15:51');
INSERT INTO `task` VALUES (5, '555', 4, 1, 6, 'www', 0, '2018-03-11 01:15:56');
INSERT INTO `task` VALUES (6, '444', 1, 5, 10, '完成作业', 20, '2018-03-15 01:00:06');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `pwd` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `type` int(11) NOT NULL DEFAULT 0,
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `major` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `dept` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `resume` text CHARACTER SET utf8 COLLATE utf8_bin NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('111', '张昊', '698d51a19d8a121ce581499d7b701668', 0, '21222', '21222', '21', '21', '21');
INSERT INTO `user` VALUES ('222', '姜维', 'bcbe3365e6ac95ea2c0343a2395834dd', 1, '21333123', '31133133', NULL, NULL, '个人简介知多少。。。。。。');
INSERT INTO `user` VALUES ('333', '黄大师', '310dcbbf4cce62f762a2aaa148d556bd', 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES ('444', '王达', '550a141f12de6341fba65b0ad0433500', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES ('555', '赵东升', '15de21c670ae7c3f6f3f1f37029303c9', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES ('666', '孙达生', 'fae0b27c451c728867a567e8c1bb4e53', 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES ('777', '周建', 'f1c1592588411002af340cbaedd6fc33', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES ('888', '陈祖德', '0a113ef6b61820daa5611c870ed8d5ee', 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES ('999', '马丁斯', 'b706835de79a2b4e80506f582af3676a', 0, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for user_group
-- ----------------------------
DROP TABLE IF EXISTS `user_group`;
CREATE TABLE `user_group`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `user_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `is_master` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_group
-- ----------------------------
INSERT INTO `user_group` VALUES (1, 6, 1, '111', 1);
INSERT INTO `user_group` VALUES (2, 7, 2, '111', 1);
INSERT INTO `user_group` VALUES (3, 6, 1, '444', 0);
INSERT INTO `user_group` VALUES (4, 6, 1, '555', 0);
INSERT INTO `user_group` VALUES (5, 7, 2, '555', 0);
INSERT INTO `user_group` VALUES (6, 8, 5, '111', 1);
INSERT INTO `user_group` VALUES (7, 9, 7, '111', 1);
INSERT INTO `user_group` VALUES (8, 10, 5, '444', 1);

-- ----------------------------
-- Table structure for work
-- ----------------------------
DROP TABLE IF EXISTS `work`;
CREATE TABLE `work`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_bin NULL,
  `attachment` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_bin NULL,
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `commit_time` timestamp(0) NULL DEFAULT NULL,
  `finish_time` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of work
-- ----------------------------
INSERT INTO `work` VALUES (1, 5, 'HTML5图形图像处理技术的研究-作业1', '简单的向大家介绍图像处理技术', '/tms/file//2018/02/26/145000/ScreenShot2018_0203_232429410.jpg', '研究前的了解', '2018-02-26 14:50:04', '2018-03-16 00:00:00', NULL);
INSERT INTO `work` VALUES (2, 5, 'HTML5图形图像处理技术的研究-作业2', 'ssss', '', '', '2018-02-26 14:59:21', '2018-03-16 00:00:00', NULL);
INSERT INTO `work` VALUES (3, 5, 'HTML5图形图像处理技术的研究-作业3', 'dsdsd', '', '', '2018-02-26 14:59:53', '2018-03-16 00:00:00', NULL);
INSERT INTO `work` VALUES (4, 1, '电子商城的设计与实现-作业1', '作业内容', '', '', '2018-03-09 11:25:59', '2018-03-16 00:00:00', NULL);
INSERT INTO `work` VALUES (5, 5, 'HTML5图形图像处理技术的研究-作业4', '作业4内容', '', '', '2018-03-09 13:50:43', '2018-03-16 00:00:00', NULL);
INSERT INTO `work` VALUES (6, 5, 'HTML5图形图像处理技术的研究-作业5', '作业5内容', '', '', '2018-03-09 14:00:07', '2018-03-16 00:00:00', NULL);

SET FOREIGN_KEY_CHECKS = 1;
