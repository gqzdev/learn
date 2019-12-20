/*
 Navicat MySQL Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50718
 Source Host           : localhost:3306
 Source Schema         : learn

 Target Server Type    : MySQL
 Target Server Version : 50718
 File Encoding         : 65001

 Date: 24/05/2019 20:44:40
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT '管理员名',
  `account` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT '管理员账号',
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT '管理员登录密码',
  `state` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `isDel` int(11) NULL DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, '管理员', 'admin', 'admin', NULL, 0);

-- ----------------------------
-- Table structure for college
-- ----------------------------
DROP TABLE IF EXISTS `college`;
CREATE TABLE `college`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '学院名称',
  `intro` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL COMMENT '学院介绍',
  `state` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `isDel` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of college
-- ----------------------------
INSERT INTO `college` VALUES (2, '计算机学院', '计算机学院创建于1995年。现有专职教师49人，其中具有硕士以上学历学位的教师占75%，博士8人，中级以上职称的教师占85%；本专科在校生近千人；开设有计算机科学与技术、网络工程和软件工程，物联网工程等四个本科专业和计算机科学与技术专业数字媒体艺术方向，以及计算机应用技术、计算机网络技术两个专科专业。', NULL, NULL);
INSERT INTO `college` VALUES (3, '信息管理学院', '信息管理学院，信息管理与信息系统', NULL, NULL);
INSERT INTO `college` VALUES (8, '外国语学院', '外国语学院于2004年12月在原公共课部大学外语教研室的基础上成立。自1994开办经贸英语专业伊始，已有20多年专业办学历史，2005年开始招收英语专业本科生。', NULL, NULL);
INSERT INTO `college` VALUES (9, '艺术学校', '艺术院校是指专门开设艺术及含有艺术性质各专业的院校，普通类高校也设有艺术学院或艺术系。以及具有院校性质从事艺术教育教学机构。教育部对于艺术院校学历分为：具有学历教育资格的艺术院校和非学历的艺术院校。', NULL, NULL);
INSERT INTO `college` VALUES (10, '经管学院', '经济与管理学院始于1982年，是我校最早开办的学院之一。学院汇集了经济类、管理类的主要学科，设有工商管理系、国际经济与贸易系、市场营销系、财务会计系；根据专业学科需要还设有企业经济研究所和金融实验室、ERP综合实验室、电子商务实验室、国际贸易实验室、企业经营实战演练室、会计模拟室、商务谈判室等7个专业实验室；现有国际经济与贸易、市场营销、工商管理、财务管理、物流管理5个本科专业和会计、电子商务、国际贸易实务3个专科专业。', NULL, NULL);
INSERT INTO `college` VALUES (11, '环境科学与工程学院', '学院开设有环境工程、环境科学、给排水工程、安全工程、能源与环境系统工程五个本科专业和环境监测与治理技术（原环境工程）、机械设计与制造（环保设备方向）、环境监测与评价（原环境监理）、给排水工程技术等4个专科专业。其中环境工程专业为国家教育部第四批特色建设专业、湖北省品牌建设专业；环境监测与治理技术是湖北省级重点专业，教育部教学改革试点专业。学院在校本、专科学生1100多人，并与武汉理工大学、武汉科技大学等高校联合开始了环境工程硕士研究生的培养。', NULL, NULL);
INSERT INTO `college` VALUES (12, '生命科学与化学学院', '　生命科学与化学学院设有生物技术、生物制药、应用化学3个本科专业和化工生物技术（制药与检测方向）专科专业。其中生物技术专业为湖北省普通高等学校战略性新兴（支柱）产业人才培养计划项目专业、湖北省首批重点培育本科专业和湖北省本科高校专业综合改革试点项目专业。', NULL, NULL);
INSERT INTO `college` VALUES (13, '数理学院', '数理学院成立于2004年。经过十年的发展，数理学院的办学条件和基础设施不断完善，招生规模和招生专业不断扩展。现设有信息与计算科学教研室、物理教研室、公共数学教研室和物理与信息处理实验中心等4个教学单位，开设有信息与计算科学与应用物理学2个本科专业。数学为校级重点学科，量子材料研究所为校级研究所。', NULL, NULL);
INSERT INTO `college` VALUES (14, '土木建筑工程学院', '土木建筑工程学院创建于1983年，即原黄石职业大学工业与民用建筑专业。创办之初第一届仅有42名学生。1987年成立土木建筑工程系；2004年首次招收本科生；2005年土木建筑工程系更名为土木建筑工程学院。', NULL, NULL);

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT '课程名',
  `college_id` int(11) NOT NULL DEFAULT 0 COMMENT '所属学院',
  `num` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT '课程编号',
  `intro` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '课程介绍',
  `state` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `isDel` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES (1, 'Java Web 程序设计', 2, 'D80015001', '介绍MVC设计思想，包括JSP+Servet+Java Bean，以及Spring MVC+MyBatis的框架整合开发。', NULL, NULL);
INSERT INTO `course` VALUES (3, 'MySQL数据库技术', 2, 'D80015002', '掌握微软SQLServer 2016数据库的使用以及触发器等开发！', NULL, NULL);
INSERT INTO `course` VALUES (5, '英语高级写作技巧', 8, 'Y70010002', '基于英语写作基础，进阶教授英语写作高级技巧，锻炼学生写作能力。', NULL, NULL);
INSERT INTO `course` VALUES (6, '计算机组成原理', 2, 'D04017098', '计算机简史;冯 诺依曼计算机组成及相关思想;总线相关知识;存储器相关知识;处理器相关知识;数据计算，原反补移码;指令;IO操作;', NULL, NULL);
INSERT INTO `course` VALUES (7, 'Spring项目实战', 2, 'D80015012', 'Spring是一个开源框架，它由Rod Johnson创建。它是为了解决企业应用开发的复杂性而创建的。Spring使用基本的JavaBean来完成以前只可能由EJB完成的事情。', NULL, NULL);
INSERT INTO `course` VALUES (8, 'Spring Boot项目实战', 2, 'D904130', 'Spring Boot 是由 Pivotal 团队提供的全新框架，其设计目的是用来简化新 Spring 应用的初始搭建以及开发过程。该框架使用了特定的方式来进行配置，从而使开发人员不再需要定义样板化的配置。', NULL, NULL);
INSERT INTO `course` VALUES (9, 'Java EE面试攻略', 2, 'D9042341', 'Java平台上不断推出翻新的标准框架，致使软件应用业的业务核心组件架构无所适从，从一直以来是否需要EJB的讨论声中说明了这种彷徨。', NULL, NULL);
INSERT INTO `course` VALUES (10, 'C语言高级程序设计', 2, 'D8924012', 'C语言是一种计算机程序设计语言。它既有高级语言的特点，又具有汇编语言的特点。它可以作为系统设计语言，编写工作系统应用程序，也可以作为应用程序设计语言，编写不依赖计算机硬件的应用程序。', NULL, NULL);
INSERT INTO `course` VALUES (11, '数据结构', 2, 'D7032013', '数据结构是计算机存储、组织数据的方式。数据结构是指相互之间存在一种或多种特定关系的数据元素的集合。通常情况下，精心选择的数据结构可以带来更高的运行或者存储效率。', NULL, NULL);
INSERT INTO `course` VALUES (12, '高等数学A', 13, 'S9032032', '高等数学A（或高等数学1）适用于力学、机械工程、光学工程、仪器科学与技术、冶金工程、动力工程及工程热物理、电气工程、电子科学与技术、信息与通信工程、控制科学与工程、计算机科学与技术、土木工程、水利工程、测绘科学与技术、交通运输工程、船舶与海洋工程、航空宇航科学与技术、兵器科学与技术、核科学与技术、生物医学工程等一级学科中所有的二级学科的研究生招生。', NULL, NULL);
INSERT INTO `course` VALUES (13, '计算机操作系统', 2, 'D950403', '操作系统（英语：operating system，缩写作 OS）是管理计算机硬件与软件资源的计算机程序，同时也是计算机系统的内核与基石', NULL, NULL);
INSERT INTO `course` VALUES (14, '大学英语1', 8, 'Y894023', '练习设计将听、说、读、写、译各项语言技能有机结合，通过鲜活生动的语言和真实的交际场景激发学生兴趣，鼓励学生参与，培养其交际能力和语言综合应用能力。', NULL, NULL);
INSERT INTO `course` VALUES (15, 'Java高级程序设计', 2, 'jsj901231', '以Java语言为载体，循序渐进地讲述了高级语言程序设计的基础知识和Java语言程序设计。全书分为10个主题', NULL, NULL);

-- ----------------------------
-- Table structure for course_file
-- ----------------------------
DROP TABLE IF EXISTS `course_file`;
CREATE TABLE `course_file`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `path` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL COMMENT '课程文档的路径',
  `course_id` int(11) NULL DEFAULT 0 COMMENT '所属课程',
  `record_time` datetime(0) NULL DEFAULT NULL COMMENT '上传时间',
  `teacher_id` int(11) NULL DEFAULT 0 COMMENT '所属教师',
  `state` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `isDel` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of course_file
-- ----------------------------
INSERT INTO `course_file` VALUES (7, 'JAVA面试题解惑系列合集.pdf', 9, '2019-03-03 18:53:29', 9, NULL, 0);
INSERT INTO `course_file` VALUES (8, '[课件] Spring Boot 初体验.pptx', 8, '2019-03-03 19:05:44', 8, NULL, 0);
INSERT INTO `course_file` VALUES (9, 'MySql性能优化.pdf', 3, '2019-03-04 00:07:32', 8, NULL, 0);
INSERT INTO `course_file` VALUES (10, '京东技术解密 带书签目录 高清.pdf', 1, '2019-03-11 13:24:29', 11, NULL, NULL);
INSERT INTO `course_file` VALUES (11, 'Spring Boot核心技术-笔记.pdf', 8, '2019-03-11 13:26:12', 11, NULL, NULL);
INSERT INTO `course_file` VALUES (12, '最全面的redis教程.docx', 9, '2019-05-06 16:27:54', 4, NULL, NULL);
INSERT INTO `course_file` VALUES (13, 'SpringBoot课件.pdf', 8, '2019-05-07 21:53:42', 10, NULL, NULL);
INSERT INTO `course_file` VALUES (14, 'Spring Boot实战.pdf', 8, '2019-05-08 11:54:00', 10, NULL, NULL);

-- ----------------------------
-- Table structure for course_video
-- ----------------------------
DROP TABLE IF EXISTS `course_video`;
CREATE TABLE `course_video`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `path` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '课程视频的路径',
  `course_id` int(11) NOT NULL DEFAULT 0 COMMENT '所属课程',
  `record_time` datetime(0) NOT NULL COMMENT '上传时间',
  `teacher_id` int(11) NOT NULL COMMENT '所属教师',
  `state` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `isDel` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of course_video
-- ----------------------------
INSERT INTO `course_video` VALUES (10, '1.SpringBoot实战开发之-初识SpringBoot.mp4', 8, '2019-03-01 20:00:28', 8, NULL, NULL);
INSERT INTO `course_video` VALUES (11, 'Java面试题14.线程并发库和线程池的作用？.mp4', 9, '2019-03-03 18:52:51', 9, NULL, NULL);
INSERT INTO `course_video` VALUES (12, '2.SpringBoot实战开发之-SpringBoot入门程序.mp4', 8, '2019-03-03 19:04:25', 8, NULL, NULL);
INSERT INTO `course_video` VALUES (14, '3.SpringBoot实战开发之-启用自动配置注解.mp4', 8, '2019-03-03 19:05:22', 8, NULL, NULL);
INSERT INTO `course_video` VALUES (15, '4.SpringBoot实战开发之-自定义banner.mp4', 8, '2019-03-04 00:05:43', 8, NULL, NULL);
INSERT INTO `course_video` VALUES (18, '面试必问之JVM.mp4', 9, '2019-03-11 13:28:54', 11, NULL, NULL);
INSERT INTO `course_video` VALUES (20, '4-6Tomcat集群快速入门：Nginx+Tomcat搭建集群（linux,mac,windows).mp4', 15, '2019-04-20 20:26:59', 4, NULL, NULL);
INSERT INTO `course_video` VALUES (21, '5-6Redis基础命令实战.mp4', 15, '2019-04-24 23:27:27', 4, NULL, NULL);
INSERT INTO `course_video` VALUES (22, 'Java面试题65：数据库优化方面的事情.mp4', 9, '2019-05-08 22:56:53', 10, NULL, NULL);
INSERT INTO `course_video` VALUES (23, 'Java面试题29.触发器的使用场景.mp4', 9, '2019-05-08 22:57:12', 10, NULL, NULL);
INSERT INTO `course_video` VALUES (24, 'Java面试题67：数据库优化之数据库表设计遵循范式.mp4', 9, '2019-05-08 22:57:40', 10, NULL, NULL);
INSERT INTO `course_video` VALUES (25, 'Java面试题68：选择合适的数据库引擎.mp4', 9, '2019-05-08 22:57:55', 10, NULL, NULL);
INSERT INTO `course_video` VALUES (26, 'Java面试题76：有没有使用过redis.mp4', 9, '2019-05-08 22:58:11', 10, NULL, NULL);

-- ----------------------------
-- Table structure for discuss
-- ----------------------------
DROP TABLE IF EXISTS `discuss`;
CREATE TABLE `discuss`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT '话题题目',
  `content` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '话题内容',
  `teacher_id` int(11) NULL DEFAULT NULL COMMENT '发布的教师',
  `record_time` datetime(0) NULL DEFAULT NULL COMMENT '发布时间',
  `course_id` int(11) NULL DEFAULT NULL COMMENT '所属课程',
  `state` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `isDel` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of discuss
-- ----------------------------
INSERT INTO `discuss` VALUES (1, '在大学英语六级考试中，看图写作文的语言组织思路是什么？', '大学六级考试作文部分越来越重视看图写作文技巧的考察，从读懂图中所说含义到架构构思，再到具体撰写，应该遵循怎样的思路？', 1, '2019-02-28 22:52:37', 5, NULL, NULL);
INSERT INTO `discuss` VALUES (5, '@ResponseBody注解的使用', '在SpringMVC框架的使用中常常会使用@ResponseBody注解，修饰“处理器”（Controller的方法），这样在处理器在返回完毕后，就不走逻辑视图，而是将返回的对象转成JSON字符串响应给客户端，但这种操作有时会出现406错误。', 8, '2019-03-05 23:25:50', 7, NULL, NULL);

-- ----------------------------
-- Table structure for discuss_post
-- ----------------------------
DROP TABLE IF EXISTS `discuss_post`;
CREATE TABLE `discuss_post`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '回复内容',
  `discuss_id` int(11) NOT NULL DEFAULT 0 COMMENT '回复话题',
  `student_id` int(11) NOT NULL DEFAULT 0 COMMENT '回复的学生',
  `record_time` datetime(0) NOT NULL COMMENT '回复时间',
  `state` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `isDel` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of discuss_post
-- ----------------------------
INSERT INTO `discuss_post` VALUES (1, '大学英语课堂基本学习不到什么，还是得靠平时', 1, 2, '2019-02-28 22:21:08', NULL, NULL);
INSERT INTO `discuss_post` VALUES (2, '我这是第二次考试了', 1, 4, '2019-02-28 22:22:30', NULL, NULL);
INSERT INTO `discuss_post` VALUES (3, '平时多加训练', 1, 3, '2019-02-28 22:23:34', NULL, NULL);
INSERT INTO `discuss_post` VALUES (4, '六级听力和阅读很重要', 1, 4, '2019-02-28 22:31:41', NULL, NULL);
INSERT INTO `discuss_post` VALUES (6, '看图写作文应当从图中人物或事物关系开始，理解图中所描述的事是关于生活、工作、旅行、哲学等等，搞清楚这些才是理解图文的重要步骤！！！', 1, 3, '2019-02-28 23:00:15', NULL, NULL);
INSERT INTO `discuss_post` VALUES (7, '2018年上学期六级398分，听力查了点！', 1, 30, '2019-02-28 18:14:16', NULL, NULL);
INSERT INTO `discuss_post` VALUES (8, '132123', 1, 26, '2019-03-04 16:31:52', NULL, NULL);
INSERT INTO `discuss_post` VALUES (9, '出现406问题的可能原因：原因一该项目并没有导入jackson的相关jar包。原因二：\r\n     请求后缀为.html，浏览器默认将相应体的内容当做html资源，但实际上相应的并不是Html资源，而是一个JSON。此时就会报406错误。', 5, 26, '2019-03-05 23:28:25', NULL, NULL);
INSERT INTO `discuss_post` VALUES (10, '不能使用.html拦截', 5, 41, '2019-03-10 23:04:10', NULL, NULL);
INSERT INTO `discuss_post` VALUES (11, '四级考试都是啃高中学的底子！！', 1, 41, '2019-03-10 23:05:01', NULL, NULL);
INSERT INTO `discuss_post` VALUES (12, '现在的后端开发都是返回JSON数据！', 5, 21, '2019-03-11 14:51:46', NULL, NULL);
INSERT INTO `discuss_post` VALUES (13, '1213123', 1, 53, '2019-04-03 16:43:47', NULL, NULL);
INSERT INTO `discuss_post` VALUES (14, '123', 5, 3, '2019-04-13 17:38:05', NULL, NULL);
INSERT INTO `discuss_post` VALUES (15, 'SPring MVC的JSON', 5, 1, '2019-05-11 14:33:11', NULL, NULL);

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT '公告标题',
  `content` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '公告内容',
  `record_time` datetime(0) NOT NULL COMMENT '发布时间',
  `state` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `isDel` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES (2, '关于学院期中考试安排的通知', '学院期中考试将于2019年1月03日至2019年1月20日进行，请各专业、各班级组织和实施好各自的考试进度安排以及阅卷工作！  学院管理处，2018年3月31日', '2019-02-28 22:49:21', NULL, NULL);
INSERT INTO `notice` VALUES (5, '2019届计算机学院毕业生通知', '实践教学管理平台。中期检查结束时间：2019-03-15！', '2019-04-03 16:06:23', NULL, NULL);
INSERT INTO `notice` VALUES (7, '第一次论文检查时间', '2019年3月15日', '2019-03-09 22:24:40', NULL, NULL);
INSERT INTO `notice` VALUES (8, '论文初稿提交', '请大家尽快完成论文初稿！', '2019-03-12 23:54:13', NULL, NULL);
INSERT INTO `notice` VALUES (9, '第一轮答辩通知', '请符合答辩的同学按时参加答辩，具体事宜按学院通知为准！', '2019-05-11 00:02:28', NULL, NULL);

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT '学生账号',
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT '登录密码',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT '学生名',
  `gender` int(11) NOT NULL DEFAULT 0 COMMENT '性别',
  `num` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT '学号',
  `college_id` int(11) NOT NULL DEFAULT 0 COMMENT '所属学院',
  `telphone` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT '手机号码',
  `id_card_no` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT '身份证号码',
  `state` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `isDel` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 54 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES (40, '201540410127', '123456', '叶佳伟', 0, '201540410127', 2, '18219220918', '421121199609087895', '叶佳伟', 0);
INSERT INTO `student` VALUES (41, '201540410128', '123456', '徐金波', 0, '201540410128', 2, '18219220918', '421121199609087895', '徐金波', 0);
INSERT INTO `student` VALUES (42, '201540410129', '123456', '吴群', 0, '201540410129', 2, '18219220918', '421121199609087895', '吴群', 0);
INSERT INTO `student` VALUES (43, '201540410130', '123456', '张天', 0, '201540410130', 2, '18219220918', '421121199609087895', '张天', 0);
INSERT INTO `student` VALUES (44, '201540410131', '123456', '彭峰', 0, '201540410131', 2, '18219220918', '421121199609087895', '彭峰', 0);
INSERT INTO `student` VALUES (45, '201540410132', '123456', '陈楚', 0, '201540410132', 2, '18219220918', '421121199609087895', '陈楚', 0);
INSERT INTO `student` VALUES (46, '201540410133', '123456', '刘磊', 0, '201540410133', 2, '18219220918', '421121199609087895', '刘磊', 0);
INSERT INTO `student` VALUES (47, '201540410135', '123456', '石慧', 1, '201540410135', 2, '18219220918', '421121199609087823', '石慧', 0);
INSERT INTO `student` VALUES (53, 'test', 'test123', '测试用户', 0, '2019000000001', 2, '13995978321', '421121199609087832', NULL, NULL);

-- ----------------------------
-- Table structure for student_task
-- ----------------------------
DROP TABLE IF EXISTS `student_task`;
CREATE TABLE `student_task`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL DEFAULT 0 COMMENT '学生id',
  `task_id` int(11) NOT NULL DEFAULT 0 COMMENT '考试id',
  `score` int(11) NOT NULL DEFAULT 0 COMMENT '成绩',
  `record_time` datetime(0) NOT NULL COMMENT '时间',
  `state` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `isDel` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student_task
-- ----------------------------
INSERT INTO `student_task` VALUES (1, 1, 2, 96, '2019-01-26 20:28:53', NULL, NULL);
INSERT INTO `student_task` VALUES (2, 2, 2, 60, '2019-02-15 22:40:56', NULL, NULL);
INSERT INTO `student_task` VALUES (3, 1, 4, 60, '2019-02-16 23:00:57', NULL, NULL);
INSERT INTO `student_task` VALUES (4, 3, 2, 60, '2019-02-28 18:48:05', NULL, NULL);
INSERT INTO `student_task` VALUES (5, 1, 5, 80, '2019-03-02 16:56:33', NULL, NULL);
INSERT INTO `student_task` VALUES (6, 9, 5, 100, '2019-03-02 23:45:21', NULL, NULL);
INSERT INTO `student_task` VALUES (7, 3, 4, 60, '2019-03-03 23:55:09', NULL, NULL);
INSERT INTO `student_task` VALUES (8, 2, 5, 60, '2019-03-03 23:55:30', NULL, NULL);
INSERT INTO `student_task` VALUES (9, 14, 5, 60, '2019-03-04 16:32:49', NULL, NULL);
INSERT INTO `student_task` VALUES (10, 15, 2, 10, '2019-03-05 23:27:33', NULL, NULL);
INSERT INTO `student_task` VALUES (11, 14, 2, 10, '2019-03-09 22:53:09', NULL, NULL);
INSERT INTO `student_task` VALUES (12, 41, 5, 80, '2019-03-10 23:05:35', NULL, NULL);
INSERT INTO `student_task` VALUES (13, 26, 8, 50, '2019-03-11 14:01:27', NULL, NULL);
INSERT INTO `student_task` VALUES (14, 25, 8, 50, '2019-03-11 14:01:59', NULL, NULL);
INSERT INTO `student_task` VALUES (15, 24, 8, 20, '2019-03-11 14:06:07', NULL, NULL);
INSERT INTO `student_task` VALUES (16, 20, 8, 100, '2019-03-11 14:26:56', NULL, NULL);
INSERT INTO `student_task` VALUES (17, 19, 8, 60, '2019-03-11 14:31:30', NULL, NULL);
INSERT INTO `student_task` VALUES (18, 26, 9, 100, '2019-03-11 15:33:42', NULL, NULL);
INSERT INTO `student_task` VALUES (19, 40, 9, 20, '2019-03-11 19:57:02', NULL, NULL);
INSERT INTO `student_task` VALUES (20, 39, 9, 80, '2019-03-25 01:07:25', NULL, NULL);
INSERT INTO `student_task` VALUES (21, 53, 8, 60, '2019-04-03 16:45:18', NULL, NULL);
INSERT INTO `student_task` VALUES (22, 25, 2, 30, '2019-04-04 13:21:41', NULL, NULL);
INSERT INTO `student_task` VALUES (23, 51, 9, 80, '2019-04-09 21:06:14', NULL, NULL);
INSERT INTO `student_task` VALUES (25, 53, 2, 10, '2019-04-13 17:15:22', NULL, NULL);
INSERT INTO `student_task` VALUES (26, 1, 9, 80, '2019-05-11 14:33:52', NULL, NULL);

-- ----------------------------
-- Table structure for task
-- ----------------------------
DROP TABLE IF EXISTS `task`;
CREATE TABLE `task`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '考试',
  `teacher_id` int(11) NOT NULL DEFAULT 0 COMMENT '发布考试的教师',
  `course_id` int(11) NOT NULL DEFAULT 0 COMMENT '考试所属的课程',
  `record_time` datetime(0) NOT NULL COMMENT '时间',
  `state` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `isDel` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of task
-- ----------------------------
INSERT INTO `task` VALUES (2, 1, 1, '2019-02-28 22:23:24', NULL, NULL);
INSERT INTO `task` VALUES (3, 1, 3, '2019-02-28 22:28:09', NULL, NULL);
INSERT INTO `task` VALUES (4, 1, 5, '2019-02-28 22:55:35', NULL, NULL);
INSERT INTO `task` VALUES (5, 8, 6, '2019-02-28 20:01:00', NULL, NULL);
INSERT INTO `task` VALUES (6, 8, 7, '2019-03-03 16:41:05', NULL, NULL);
INSERT INTO `task` VALUES (8, 11, 11, '2019-03-11 12:49:28', NULL, NULL);
INSERT INTO `task` VALUES (9, 11, 13, '2019-03-11 12:49:36', NULL, NULL);

-- ----------------------------
-- Table structure for task_question
-- ----------------------------
DROP TABLE IF EXISTS `task_question`;
CREATE TABLE `task_question`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '考试的题目',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT '题目的问题',
  `item_a` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT '选项A',
  `item_b` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT '选项B',
  `item_c` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT '选项C',
  `item_d` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT '选项D',
  `answer` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT '答案',
  `task_id` int(11) NOT NULL DEFAULT 0 COMMENT '所属的考试',
  `score` int(11) NULL DEFAULT NULL COMMENT '题目的分值',
  `state` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `isDel` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of task_question
-- ----------------------------
INSERT INTO `task_question` VALUES (3, 'MVC三层模式中，C指的是哪一层？', '控制层', '模型层', '视图层', '以上都不是', 'A', 2, 10, NULL, 0);
INSERT INTO `task_question` VALUES (4, '以下关于重定向forward说法正确的是？', '重定向时URL不变而且不可传递参数', '重定向时URL会变而且不可传递参数', '重定向时URL不变而且可传递参数', '重定向时URL会变而且可传递参数', 'C', 2, 10, NULL, 0);
INSERT INTO `task_question` VALUES (5, '以下关于Http Session会话的说法正确的是？', 'Session对象保存于磁盘中', 'Session存在于服务器内存中', 'Session存在于服务器数据库中', 'session存在于客户端浏览器中', 'B', 2, 10, NULL, 0);
INSERT INTO `task_question` VALUES (9, 'What’s the mean on the earth road ?', 'YES OR NO', 'NO', 'YES', 'BOTH YES', 'B', 4, 20, NULL, 0);
INSERT INTO `task_question` VALUES (10, 'How much dose the sheep on the moution ?', 'Three sheeps in the house.', 'No sheep in the house.', 'Much sheep in the door.', 'Both Wrong', 'C', 4, 10, NULL, 0);
INSERT INTO `task_question` VALUES (11, '当[x]反＝1.1111时，对应的真值是(  )', '－0', '－15/16', '－1/16', '－6/16', 'A', 5, 20, NULL, 0);
INSERT INTO `task_question` VALUES (12, 'I/O采用统一编址时，进行输入输出操作的指令是(  )', '控制指令', '访存指令', '输入输出指令', '伪指令', 'B', 5, 20, NULL, 0);
INSERT INTO `task_question` VALUES (13, '变址寻址方式中，操作数的有效地址是(  )', '基址寄存器内容加上形式地址（位移量）', '程序计数器内容加上形式地址', '变址寄存器内容加上形式地址', '堆栈内容加上形式地址', 'C', 5, 20, NULL, 0);
INSERT INTO `task_question` VALUES (14, '计算机系统中的存储系统是指(  )', 'RAM存储器', 'ROM存储器', '主存', '主存和辅存', 'D', 5, 20, NULL, 0);
INSERT INTO `task_question` VALUES (15, '主机与设备传送数据时，采用(  )，主机与设备是串行工作的', '程序查询方式', '中断方式', 'DMA方式', 'I/O方式', 'A', 5, 20, NULL, 0);
INSERT INTO `task_question` VALUES (16, '栈和队列的共同特点是(    )', '只允许在端点处插入和删除元素', '都是先进后出', '都是先进先出', '没有共同点', 'A', 8, 20, NULL, NULL);
INSERT INTO `task_question` VALUES (17, '用链接方式存储的队列，在进行插入运算时(    )', '仅修改头指针', '头、尾指针都要修改', '仅修改尾指针', '头、尾指针可能都要修改', 'D', 8, 20, NULL, NULL);
INSERT INTO `task_question` VALUES (18, '以下数据结构中哪一个是非线性结构？(    )', '队列', '栈', '线性表', '二叉树', 'D', 8, 20, NULL, NULL);
INSERT INTO `task_question` VALUES (19, '设有一个二维数组A[m][n]，假设A[0][0]存放位置在644(10)，A[2][2]存放位置在676(10)，每个元素占一个空间，问A[3][3](10)存放在什么位置？脚注(10)表示用10进制表示（   ）', '688', '678', '692', '696', 'C', 8, 20, NULL, NULL);
INSERT INTO `task_question` VALUES (20, '树最适合用来表示(      )', '有序数据元素', '无序数据元素', '元素之间具有分支层次关系的数据', '元素之间无联系的数据', 'C', 8, 20, NULL, NULL);
INSERT INTO `task_question` VALUES (21, 'Windows7及Windows8 是（ ）操作系统', '多用户单任务', '单用户单任务', '多用户多任务', '单用户多任务', 'C', 9, 20, NULL, NULL);
INSERT INTO `task_question` VALUES (22, '设计分时操作系统时，首先应考虑系统的（ ）', '可适应性和灵活性', '交互性和响应时间', '周转时间和系统吞吐量', '实时性和可靠性', 'B', 9, 20, NULL, NULL);
INSERT INTO `task_question` VALUES (23, '用户程序要获得系统帮助，必须通过（ ）', '键盘命令', '系统调用', '作业调度', '进程调度', 'B', 9, 20, NULL, NULL);
INSERT INTO `task_question` VALUES (24, '操作系统的功能是进行处理机管理、（ ）管理、设备管理及信息管理。', '软件', '硬件', '存储器', '进程调度', 'C', 9, 20, NULL, NULL);
INSERT INTO `task_question` VALUES (25, '所谓（ ）是指将一个以上的作业放入主存，并且同时准备运行，这些作业共享处理机的时间和外围设备等其他资源。', '实时处理', '多重处理', '共行执行', '多道程序设计', 'D', 9, 20, NULL, NULL);

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '教师表',
  `account` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT '教师登录账号',
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT '登录密码',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT '教师名',
  `gender` int(11) NOT NULL DEFAULT 0 COMMENT '性别',
  `num` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT '教师编号',
  `college_id` int(11) NOT NULL DEFAULT 0 COMMENT '所属学院',
  `course_id` int(11) NOT NULL DEFAULT 0 COMMENT '教授课程',
  `telphone` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT '手机号码',
  `id_card_no` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT '身份证',
  `state` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `isDel` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES (1, 'liling', '111111', '李琳', 1, '80012001', 13, 12, '13990390912', '622923196012091351', NULL, 0);
INSERT INTO `teacher` VALUES (3, 'litao', '123456', '林涛', 0, '232312312', 8, 5, '13589893142', '412923196012090131', NULL, 0);
INSERT INTO `teacher` VALUES (4, 'wuhonghua', '123456', '伍红华', 0, '42342432', 2, 15, '13995976112', '422923196012090125', NULL, 0);
INSERT INTO `teacher` VALUES (5, '321312', '312321', '郭林', 1, '32131423', 2, 3, '15571398102', '622923196012090112', NULL, 0);
INSERT INTO `teacher` VALUES (8, 'teacher', 'admin', '李波', 0, 'jsj10132012', 2, 1, '13965424242', '421121198409087895', NULL, 0);
INSERT INTO `teacher` VALUES (9, '971785418', 'admin', '李浩强', 0, 'jsj901390', 2, 7, '13995976182', '421121199609097053', NULL, 0);
INSERT INTO `teacher` VALUES (10, 'liyanhong', '123456', '李彦宏', 0, 'jsj4234901', 2, 3, '15532342422', '4321423421341234', NULL, 0);
INSERT INTO `teacher` VALUES (11, 'tech0001', '123456', '高海慧', 1, '80016001', 3, 3, '18219220923', '62292319991231', NULL, NULL);
INSERT INTO `teacher` VALUES (12, 'tech0002', '123456', '陈蓉', 1, 'Y80016002', 8, 5, '18219220920', '62292319991232', NULL, NULL);
INSERT INTO `teacher` VALUES (13, 'tech0003', '123456', '刘伟', 1, '80016003', 2, 7, '18219220921', '62292319991233', NULL, NULL);
INSERT INTO `teacher` VALUES (14, 'tech0004', '123456', '张嘉译', 0, '80016004', 2, 8, '18219220922', '62292319991234', NULL, NULL);
INSERT INTO `teacher` VALUES (15, 'tech0005', '123456', '刘文泽', 0, '80016005', 2, 9, '18219220924', '62292319991235', NULL, NULL);
INSERT INTO `teacher` VALUES (16, 'tech0006', '123456', '蔡伟忠', 0, '80016001', 2, 10, '18219220925', '62292319991236', NULL, NULL);
INSERT INTO `teacher` VALUES (17, 'tech0007', '123456', '杨晓华', 1, '80016002', 2, 6, '18219220926', '62292319991237', NULL, NULL);
INSERT INTO `teacher` VALUES (18, 'tech0008', '123456', '陈涛', 1, '80016003', 2, 7, '18219220927', '62292319991238', NULL, NULL);
INSERT INTO `teacher` VALUES (19, 'tech0009', '123456', '王欢', 0, '80016004', 2, 8, '18219220928', '62292319991239', NULL, NULL);
INSERT INTO `teacher` VALUES (20, 'tech0010', '123456', '钟成军', 1, '80016005', 2, 9, '18219220929', '62292319991230', NULL, NULL);
INSERT INTO `teacher` VALUES (21, 'tech0011', '123456', '吴雨薇', 1, '80016001', 2, 10, '18219220920', '62292319991211', NULL, NULL);
INSERT INTO `teacher` VALUES (22, 'tech0012', '123456', '何中华', 1, '80016002', 2, 6, '18219220910', '62292319991212', NULL, NULL);
INSERT INTO `teacher` VALUES (23, 'tech0013', '123456', '齐昌瑞', 0, '80016003', 2, 7, '18219220911', '62292319991213', NULL, NULL);
INSERT INTO `teacher` VALUES (24, 'tech0014', '123456', '赵卫华', 1, '80016004', 2, 8, '18219220912', '62292319991214', NULL, NULL);
INSERT INTO `teacher` VALUES (25, 'tech0015', '123456', '陈明伟', 0, '80016005', 2, 9, '18219220913', '62292319991215', NULL, NULL);
INSERT INTO `teacher` VALUES (26, 'tech0016', '123456', '李志轩', 1, '80016001', 2, 10, '18219220914', '62292319991216', NULL, NULL);
INSERT INTO `teacher` VALUES (27, 'tech0017', '123456', '杨轩', 1, '80016002', 2, 6, '18219220915', '62292319991217', NULL, NULL);
INSERT INTO `teacher` VALUES (28, 'tech0018', '123456', '何云伟', 1, '80016003', 2, 7, '18219220916', '62292319991218', NULL, NULL);
INSERT INTO `teacher` VALUES (29, 'tech0019', '123456', '张秋霞', 1, '80016004', 2, 8, '18219220917', '62292319991219', NULL, NULL);
INSERT INTO `teacher` VALUES (30, 'tech0020', '123456', '杨文丽', 1, '80016005', 2, 9, '18219220918', '62292319991220', NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
