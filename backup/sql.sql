set charset utf8;
CREATE TABLE `admin` (
  `user` varchar(12) NOT NULL,
  `psw` varchar(33) NOT NULL,
  `name` varchar(10) DEFAULT NULL,
  `mail` varchar(50) DEFAULT NULL,
  `mobile` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
insert into `admin`(`user`,`psw`,`name`,`mail`,`mobile`) values('123','6fd742a61bd034804c00c49b18045020','123','123@admin.com','');
insert into `admin`(`user`,`psw`,`name`,`mail`,`mobile`) values('test','5fa62ae6176f3746142503a6ebe96cb3','小明','test@admin.com','15878361552');
CREATE TABLE `course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cor_no` varchar(12) NOT NULL,
  `term` varchar(11) NOT NULL DEFAULT '0',
  `tea_no` varchar(12) NOT NULL,
  `cor_name` varchar(50) NOT NULL,
  `usual_rate` tinyint(4) DEFAULT NULL,
  `report_rate` tinyint(4) DEFAULT NULL,
  `exam_rate` tinyint(4) DEFAULT NULL,
  `select_time` date DEFAULT NULL,
  `report_time` date DEFAULT NULL,
  `close_time` date DEFAULT NULL,
  `grade` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cor_no` (`cor_no`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
insert into `course`(`id`,`cor_no`,`term`,`tea_no`,`cor_name`,`usual_rate`,`report_rate`,`exam_rate`,`select_time`,`report_time`,`close_time`,`grade`) values('18','sf_2013001','2013-2','tea008','计算机算法','10','30','60','2013-07-01','2013-06-15','2013-07-20','2009');
insert into `course`(`id`,`cor_no`,`term`,`tea_no`,`cor_name`,`usual_rate`,`report_rate`,`exam_rate`,`select_time`,`report_time`,`close_time`,`grade`) values('19','hb_2013001','2013-2','tea008','计算机汇编','10','30','60','2013-07-01','2013-06-15','2013-07-20','2009');
CREATE TABLE `groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groups` varchar(2) DEFAULT NULL,
  `cor_no` varchar(12) DEFAULT NULL,
  `week_start` varchar(2) DEFAULT NULL,
  `week_end` varchar(2) DEFAULT NULL,
  `week_nums` varchar(7) DEFAULT NULL,
  `lesson_seq` char(1) DEFAULT NULL,
  `num` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
insert into `groups`(`id`,`groups`,`cor_no`,`week_start`,`week_end`,`week_nums`,`lesson_seq`,`num`) values('1','1','16416','3','10','25','3','30');
insert into `groups`(`id`,`groups`,`cor_no`,`week_start`,`week_end`,`week_nums`,`lesson_seq`,`num`) values('2','2','16416','5','12','36','3','30');
insert into `groups`(`id`,`groups`,`cor_no`,`week_start`,`week_end`,`week_nums`,`lesson_seq`,`num`) values('3','1','13698','4','11','2','2','45');
insert into `groups`(`id`,`groups`,`cor_no`,`week_start`,`week_end`,`week_nums`,`lesson_seq`,`num`) values('4','2','13698','5','12','3','3','50');
insert into `groups`(`id`,`groups`,`cor_no`,`week_start`,`week_end`,`week_nums`,`lesson_seq`,`num`) values('5','1','001','1','7','6','2','50');
insert into `groups`(`id`,`groups`,`cor_no`,`week_start`,`week_end`,`week_nums`,`lesson_seq`,`num`) values('6','2','001','2','4','5','1','35');
insert into `groups`(`id`,`groups`,`cor_no`,`week_start`,`week_end`,`week_nums`,`lesson_seq`,`num`) values('7','1','1313664163','5','10','6','2','30');
insert into `groups`(`id`,`groups`,`cor_no`,`week_start`,`week_end`,`week_nums`,`lesson_seq`,`num`) values('8','1','123','1','5','5','3','50');
insert into `groups`(`id`,`groups`,`cor_no`,`week_start`,`week_end`,`week_nums`,`lesson_seq`,`num`) values('9','A','sf_2013001','8','12','5','3','35');
insert into `groups`(`id`,`groups`,`cor_no`,`week_start`,`week_end`,`week_nums`,`lesson_seq`,`num`) values('10','B','sf_2013001','8','12','5','4','35');
insert into `groups`(`id`,`groups`,`cor_no`,`week_start`,`week_end`,`week_nums`,`lesson_seq`,`num`) values('11','C','sf_2013001','8','12','5','5','35');
insert into `groups`(`id`,`groups`,`cor_no`,`week_start`,`week_end`,`week_nums`,`lesson_seq`,`num`) values('12','A','hb_2013001','12','17','35','2','35');
insert into `groups`(`id`,`groups`,`cor_no`,`week_start`,`week_end`,`week_nums`,`lesson_seq`,`num`) values('13','B','hb_2013001','12','17','46','3','35');
CREATE TABLE `item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_no` varchar(12) NOT NULL,
  `item_name` varchar(80) NOT NULL,
  `body` varchar(1000) NOT NULL,
  `report_format` varchar(1000) NOT NULL,
  `cor_no` varchar(12) NOT NULL,
  `exam_rate` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;
insert into `item`(`id`,`item_no`,`item_name`,`body`,`report_format`,`cor_no`,`exam_rate`) values('46','1','贪心方法原理','实验1 贪心方法原理的实验内容','实验1 贪心方法原理的报告模板','sf_2013001','25');
insert into `item`(`id`,`item_no`,`item_name`,`body`,`report_format`,`cor_no`,`exam_rate`) values('47','2','动态规划原理1','实验2 动态规划原理1的实验内容','实验2 动态规划原理1的报告模板','sf_2013001','25');
insert into `item`(`id`,`item_no`,`item_name`,`body`,`report_format`,`cor_no`,`exam_rate`) values('48','3','动态规划原理2','实验3 动态规划原理2 的实验报告内容','实验3 动态规划原理2 的实验报告模板','sf_2013001','25');
insert into `item`(`id`,`item_no`,`item_name`,`body`,`report_format`,`cor_no`,`exam_rate`) values('49','4','回溯法','实验4 回溯法 的实验内容','实验4 回溯法 的实验报告模板','sf_2013001','25');
insert into `item`(`id`,`item_no`,`item_name`,`body`,`report_format`,`cor_no`,`exam_rate`) values('50','1','汇编语言上机过程和Debug常用调试命令（验证）','实验1 汇编语言上机过程和Debug常用调试命令（验证）的实验内容','实验1 汇编语言上机过程和Debug常用调试命令（验证）的报告模板','hb_2013001','10');
insert into `item`(`id`,`item_no`,`item_name`,`body`,`report_format`,`cor_no`,`exam_rate`) values('51','2','循环程序设计1（设计）','实验2 循环程序设计1（设计）的实验内容','实验2 循环程序设计1（设计）的报告模板','hb_2013001','10');
insert into `item`(`id`,`item_no`,`item_name`,`body`,`report_format`,`cor_no`,`exam_rate`) values('52','3','循环程序设计2（设计）','实验3 循环程序设计2（设计） 的报告内容','实验3 循环程序设计2（设计） 的模板','hb_2013001','10');
insert into `item`(`id`,`item_no`,`item_name`,`body`,`report_format`,`cor_no`,`exam_rate`) values('53','4','循环程序设计2（设计）','实验4 循环程序设计2（设计）的实验内容','实验4 循环程序设计2（设计）的模板','hb_2013001','10');
insert into `item`(`id`,`item_no`,`item_name`,`body`,`report_format`,`cor_no`,`exam_rate`) values('54','5','分支程序设计1（设计）','实验5 分支程序设计1（设计）的实验内容','实验5 分支程序设计1（设计）的实验内容','hb_2013001','10');
insert into `item`(`id`,`item_no`,`item_name`,`body`,`report_format`,`cor_no`,`exam_rate`) values('55','6','分支程序设计2（设计）','实验6 分支程序设计2（设计）的实验内容','实验6 分支程序设计2（设计）的实验报告模板','hb_2013001','10');
insert into `item`(`id`,`item_no`,`item_name`,`body`,`report_format`,`cor_no`,`exam_rate`) values('56','7','子程序设计（设计）','实验7 子程序设计（设计）的实验内容','实验7 子程序设计（设计）的模板','hb_2013001','20');
insert into `item`(`id`,`item_no`,`item_name`,`body`,`report_format`,`cor_no`,`exam_rate`) values('57','8','子程序设计（设计）','实验8 子程序设计（设计）的实验内容','实验8 子程序设计（设计）的实验报告模板','hb_2013001','20');
CREATE TABLE `remark` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tea_no` varchar(12) NOT NULL DEFAULT '',
  `no` varchar(25) DEFAULT NULL,
  `body` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
insert into `remark`(`id`,`tea_no`,`no`,`body`) values('1','tea','01','实验做得一般实验做得一般实验做得一般实验做得一般');
insert into `remark`(`id`,`tea_no`,`no`,`body`) values('2','tea','02','做得很好好');
insert into `remark`(`id`,`tea_no`,`no`,`body`) values('4','tea','03','42424');
insert into `remark`(`id`,`tea_no`,`no`,`body`) values('5','tea','04','42432');
insert into `remark`(`id`,`tea_no`,`no`,`body`) values('9','tea','08','424242');
insert into `remark`(`id`,`tea_no`,`no`,`body`) values('10','tea008','1','做的不错');
insert into `remark`(`id`,`tea_no`,`no`,`body`) values('11','tea008','2','做得一般，还需努力');
insert into `remark`(`id`,`tea_no`,`no`,`body`) values('12','tea008','3','不及格');
insert into `remark`(`id`,`tea_no`,`no`,`body`) values('13','tea008','4','做得还可以');
CREATE TABLE `reply` (
  `reply_id` int(11) NOT NULL AUTO_INCREMENT,
  `author` varchar(12) DEFAULT NULL,
  `body` varchar(600) NOT NULL,
  `reply_time` datetime DEFAULT NULL,
  `floor` int(11) DEFAULT NULL,
  `post_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`reply_id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;
insert into `reply`(`reply_id`,`author`,`body`,`reply_time`,`floor`,`post_id`) values('1','admin','感谢楼主','1899-12-30 01:00:00','1','2');
insert into `reply`(`reply_id`,`author`,`body`,`reply_time`,`floor`,`post_id`) values('2','niyh','我是2楼','1899-12-30 04:00:00','2','2');
insert into `reply`(`reply_id`,`author`,`body`,`reply_time`,`floor`,`post_id`) values('3','f','我是3楼','1899-12-30 01:00:00','3','2');
insert into `reply`(`reply_id`,`author`,`body`,`reply_time`,`floor`,`post_id`) values('4','www','俺是4楼','1899-12-30 01:00:00','4','2');
insert into `reply`(`reply_id`,`author`,`body`,`reply_time`,`floor`,`post_id`) values('5','哇哇哇','我是5楼','1899-12-30 01:00:00','5','2');
insert into `reply`(`reply_id`,`author`,`body`,`reply_time`,`floor`,`post_id`) values('10','stu2','ss','2013-05-19 02:16:21','1','1');
insert into `reply`(`reply_id`,`author`,`body`,`reply_time`,`floor`,`post_id`) values('11','stu2','ss','2013-05-19 02:16:53','2','1');
insert into `reply`(`reply_id`,`author`,`body`,`reply_time`,`floor`,`post_id`) values('15','stu2','4','2013-05-19 02:18:28','4','7');
insert into `reply`(`reply_id`,`author`,`body`,`reply_time`,`floor`,`post_id`) values('16','stu2','5','2013-05-19 02:18:31','5','7');
insert into `reply`(`reply_id`,`author`,`body`,`reply_time`,`floor`,`post_id`) values('17','stu2','6','2013-05-19 02:18:35','6','7');
insert into `reply`(`reply_id`,`author`,`body`,`reply_time`,`floor`,`post_id`) values('18','stu2','7','2013-05-19 02:18:39','7','7');
insert into `reply`(`reply_id`,`author`,`body`,`reply_time`,`floor`,`post_id`) values('19','stu2','8','2013-05-19 02:18:43','8','7');
insert into `reply`(`reply_id`,`author`,`body`,`reply_time`,`floor`,`post_id`) values('20','stu2','9','2013-05-19 02:18:47','9','7');
insert into `reply`(`reply_id`,`author`,`body`,`reply_time`,`floor`,`post_id`) values('21','stu2','10','2013-05-19 02:18:51','10','7');
insert into `reply`(`reply_id`,`author`,`body`,`reply_time`,`floor`,`post_id`) values('22','stu2','11','2013-05-19 02:18:54','11','7');
insert into `reply`(`reply_id`,`author`,`body`,`reply_time`,`floor`,`post_id`) values('23','stu2','12','2013-05-19 02:19:00','12','7');
insert into `reply`(`reply_id`,`author`,`body`,`reply_time`,`floor`,`post_id`) values('24','stu2','13','2013-05-19 02:19:07','13','7');
insert into `reply`(`reply_id`,`author`,`body`,`reply_time`,`floor`,`post_id`) values('25','stu2','14','2013-05-19 02:19:16','14','7');
insert into `reply`(`reply_id`,`author`,`body`,`reply_time`,`floor`,`post_id`) values('26','stu2','回复','2013-05-19 02:20:34','1','5');
insert into `reply`(`reply_id`,`author`,`body`,`reply_time`,`floor`,`post_id`) values('27','stu2','我','2013-05-19 02:21:31','1','6');
insert into `reply`(`reply_id`,`author`,`body`,`reply_time`,`floor`,`post_id`) values('28','stu2','lzsb','2013-05-19 02:25:51','15','7');
insert into `reply`(`reply_id`,`author`,`body`,`reply_time`,`floor`,`post_id`) values('29','stu2','啊','2013-05-19 02:26:03','16','7');
insert into `reply`(`reply_id`,`author`,`body`,`reply_time`,`floor`,`post_id`) values('30','stu2','是是是131','2013-05-19 02:28:22','1','8');
insert into `reply`(`reply_id`,`author`,`body`,`reply_time`,`floor`,`post_id`) values('35','stu2','哈哈','2013-05-19 13:22:28','2','6');
insert into `reply`(`reply_id`,`author`,`body`,`reply_time`,`floor`,`post_id`) values('39','stu2','ls','2013-05-19 15:51:56','3','1');
insert into `reply`(`reply_id`,`author`,`body`,`reply_time`,`floor`,`post_id`) values('40','stu2','我你他我你他我你他我你他我你他我你他我你他我你他我你他我你他我你他我你他我你他我你他我你他我你他我你他我你他我你他我你他我你他我你他我你他我你他我你他我你他我你他我你他我你他我你他我你他我你他我你他我你他我你他我你他我你他我你他我你他我你他我你他我你他我你他我你他我你他我你他我你他我你他我你他我你他我你他我你他我你他我你他我你他我你他我你他我你他我你他我你他','2013-05-19 16:45:33','1','18');
insert into `reply`(`reply_id`,`author`,`body`,`reply_time`,`floor`,`post_id`) values('41','stu2','ceshi ','2013-05-19 19:38:38','17','7');
insert into `reply`(`reply_id`,`author`,`body`,`reply_time`,`floor`,`post_id`) values('42','stu2','13146341','2013-05-19 19:38:50','18','7');
insert into `reply`(`reply_id`,`author`,`body`,`reply_time`,`floor`,`post_id`) values('43','stu2','5772','2013-05-19 19:38:54','19','7');
insert into `reply`(`reply_id`,`author`,`body`,`reply_time`,`floor`,`post_id`) values('44','stu2','5772','2013-05-19 19:38:56','20','7');
insert into `reply`(`reply_id`,`author`,`body`,`reply_time`,`floor`,`post_id`) values('45','stu2','5772','2013-05-19 19:38:58','21','7');
insert into `reply`(`reply_id`,`author`,`body`,`reply_time`,`floor`,`post_id`) values('46','stu2','5772','2013-05-19 19:39:00','22','7');
insert into `reply`(`reply_id`,`author`,`body`,`reply_time`,`floor`,`post_id`) values('47','stu2','5772','2013-05-19 19:39:02','23','7');
insert into `reply`(`reply_id`,`author`,`body`,`reply_time`,`floor`,`post_id`) values('48','stu2','727','2013-05-19 19:39:12','24','7');
insert into `reply`(`reply_id`,`author`,`body`,`reply_time`,`floor`,`post_id`) values('49','stu2','2727','2013-05-19 19:39:16','25','7');
insert into `reply`(`reply_id`,`author`,`body`,`reply_time`,`floor`,`post_id`) values('50','stu2','你好吗你好吗你好吗你好吗你好吗你好吗你好吗你好吗你好吗你好吗你好吗你好吗你好吗你好吗你好吗你好吗你好吗你好吗你好吗','2013-05-19 19:46:10','1','41');
insert into `reply`(`reply_id`,`author`,`body`,`reply_time`,`floor`,`post_id`) values('51','stu2','哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈','2013-05-19 19:51:29','1','40');
insert into `reply`(`reply_id`,`author`,`body`,`reply_time`,`floor`,`post_id`) values('52','stu2','s','2013-05-19 21:14:57','1','37');
insert into `reply`(`reply_id`,`author`,`body`,`reply_time`,`floor`,`post_id`) values('53','0900310102','哈哈','2013-05-20 00:00:29','1','43');
insert into `reply`(`reply_id`,`author`,`body`,`reply_time`,`floor`,`post_id`) values('54','0900310102','a','2013-05-20 00:04:38','2','43');
insert into `reply`(`reply_id`,`author`,`body`,`reply_time`,`floor`,`post_id`) values('55','0900310102','1464','2013-05-20 00:05:18','1','36');
insert into `reply`(`reply_id`,`author`,`body`,`reply_time`,`floor`,`post_id`) values('56','123','haha','2013-05-20 13:58:18','1','44');
insert into `reply`(`reply_id`,`author`,`body`,`reply_time`,`floor`,`post_id`) values('57','123','a','2013-05-21 13:28:53','1','42');
CREATE TABLE `report` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cor_no` varchar(12) DEFAULT NULL,
  `stu_no` varchar(12) NOT NULL,
  `item_no` varchar(12) NOT NULL,
  `date` date DEFAULT NULL,
  `body` varchar(2000) NOT NULL,
  `item_mark` tinyint(4) DEFAULT NULL,
  `remark` varchar(60) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
insert into `report`(`id`,`cor_no`,`stu_no`,`item_no`,`date`,`body`,`item_mark`,`remark`,`status`) values('16','sf_2013001','0900310315','1','2013-05-20','实验1 贪心方法原理的实验内容

我提交','80','做的不错','2');
insert into `report`(`id`,`cor_no`,`stu_no`,`item_no`,`date`,`body`,`item_mark`,`remark`,`status`) values('17','sf_2013001','0900310315','2','2013-05-20','实验2 动态规划原理1的实验内容

提交','70','做得一般，还需努力','2');
insert into `report`(`id`,`cor_no`,`stu_no`,`item_no`,`date`,`body`,`item_mark`,`remark`,`status`) values('18','sf_2013001','0900310315','3','2013-05-20','实验3 动态规划原理2 的实验报告内容
提交','75','做得一般，还需努力','2');
insert into `report`(`id`,`cor_no`,`stu_no`,`item_no`,`date`,`body`,`item_mark`,`remark`,`status`) values('19','sf_2013001','0900310315','4','2013-05-20','实验4 回溯法 的实验内容

已提交','90','做的不错','2');
CREATE TABLE `sel_cor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stu_no` varchar(12) NOT NULL,
  `cor_no` varchar(12) NOT NULL,
  `groups` varchar(2) DEFAULT NULL,
  `status` tinyint(3) DEFAULT NULL,
  `mark` tinyint(4) DEFAULT NULL,
  `usual_mark` tinyint(4) DEFAULT NULL,
  `report_mark` tinyint(4) DEFAULT NULL,
  `exam_mark` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
insert into `sel_cor`(`id`,`stu_no`,`cor_no`,`groups`,`status`,`mark`,`usual_mark`,`report_mark`,`exam_mark`) values('19','0900310315','sf_2013001','A','1','77','80','79','75');
insert into `sel_cor`(`id`,`stu_no`,`cor_no`,`groups`,`status`,`mark`,`usual_mark`,`report_mark`,`exam_mark`) values('20','0900310315','hb_2013001','A','1','','','','');
CREATE TABLE `sort` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
insert into `sort`(`id`,`name`) values('1','C++');
insert into `sort`(`id`,`name`) values('2','JAVA');
insert into `sort`(`id`,`name`) values('3','汇编');
insert into `sort`(`id`,`name`) values('4','测试');
CREATE TABLE `stu` (
  `stu_no` varchar(12) NOT NULL,
  `psw` varchar(33) NOT NULL,
  `mail` varchar(50) DEFAULT NULL,
  `name` varchar(10) DEFAULT NULL,
  `statue` tinyint(4) DEFAULT NULL,
  `mobile` varchar(11) DEFAULT NULL,
  `class_no` varchar(12) DEFAULT NULL,
  `grade` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`stu_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
insert into `stu`(`stu_no`,`psw`,`mail`,`name`,`statue`,`mobile`,`class_no`,`grade`) values('0900310102','425e21f13c1bba436903f2919e73cde6','','张明','1','','09003101','2009');
insert into `stu`(`stu_no`,`psw`,`mail`,`name`,`statue`,`mobile`,`class_no`,`grade`) values('0900310104','abb34258d4b9cc44de09569ad555bf93','','小光','1','','09003101','2009');
insert into `stu`(`stu_no`,`psw`,`mail`,`name`,`statue`,`mobile`,`class_no`,`grade`) values('0900310105','4671eaf9b066e20c1ba651922d823921','nihao@as.com','小三','1','1333','09003101','2009');
insert into `stu`(`stu_no`,`psw`,`mail`,`name`,`statue`,`mobile`,`class_no`,`grade`) values('0900310107','f716d913ef001cd6d7bb2cad6c556fee','','','1','','09003102','2002');
insert into `stu`(`stu_no`,`psw`,`mail`,`name`,`statue`,`mobile`,`class_no`,`grade`) values('0900310108','2d7db46a5a84f2f9d4ad9555bd287713','','','1','','09003102','2002');
insert into `stu`(`stu_no`,`psw`,`mail`,`name`,`statue`,`mobile`,`class_no`,`grade`) values('0900310201','3525273febc53dbf1cb108092095e52a','','','1','','09003102','09003');
insert into `stu`(`stu_no`,`psw`,`mail`,`name`,`statue`,`mobile`,`class_no`,`grade`) values('0900310202','1f29635d7aa3cb84299a11b59a85cf05','','','1','','09003102','09003');
insert into `stu`(`stu_no`,`psw`,`mail`,`name`,`statue`,`mobile`,`class_no`,`grade`) values('0900310203','79a27b5629b119ad647fa818dfc87840','','','1','','09003102','09003');
insert into `stu`(`stu_no`,`psw`,`mail`,`name`,`statue`,`mobile`,`class_no`,`grade`) values('0900310204','a4fdbf5eb77fea5985e58f5e86d82ab9','','','1','','09003102','09003');
insert into `stu`(`stu_no`,`psw`,`mail`,`name`,`statue`,`mobile`,`class_no`,`grade`) values('0900310205','d58246aea7503476a18e834c90850891','','','1','','09003102','09003');
insert into `stu`(`stu_no`,`psw`,`mail`,`name`,`statue`,`mobile`,`class_no`,`grade`) values('0900310206','123960747b2f78ed229fc785bea6cf88','','','1','','09003102','09003');
insert into `stu`(`stu_no`,`psw`,`mail`,`name`,`statue`,`mobile`,`class_no`,`grade`) values('0900310207','f0a3621ce283bd3d7d28ce8ec34f18c7','','','1','','09003102','09003');
insert into `stu`(`stu_no`,`psw`,`mail`,`name`,`statue`,`mobile`,`class_no`,`grade`) values('0900310208','3e2104a5e30d50755bdcc6cf47d757d4','','','1','','09003102','09003');
insert into `stu`(`stu_no`,`psw`,`mail`,`name`,`statue`,`mobile`,`class_no`,`grade`) values('0900310209','6f1327a2f28a9c7d262169a63f004d16','','','1','','09003102','09003');
insert into `stu`(`stu_no`,`psw`,`mail`,`name`,`statue`,`mobile`,`class_no`,`grade`) values('0900310210','6cbc81501f8538c7aeb82da59c8d4f74','','','1','','09003102','09003');
insert into `stu`(`stu_no`,`psw`,`mail`,`name`,`statue`,`mobile`,`class_no`,`grade`) values('0900310304','6b4a4231a5cd96aef79099dfaf892bab','','','1','','09003103','2009');
insert into `stu`(`stu_no`,`psw`,`mail`,`name`,`statue`,`mobile`,`class_no`,`grade`) values('0900310305','7badf103b73581dbb40f46e78aad7279','','','1','','09003103','2009');
insert into `stu`(`stu_no`,`psw`,`mail`,`name`,`statue`,`mobile`,`class_no`,`grade`) values('0900310306','cd88f86a6444d40c3ad9f2014896b8fb','','','1','','09003103','2009');
insert into `stu`(`stu_no`,`psw`,`mail`,`name`,`statue`,`mobile`,`class_no`,`grade`) values('0900310307','360e1e40b06eb5f11b69e4d7d14319fd','','','1','','09003103','2009');
insert into `stu`(`stu_no`,`psw`,`mail`,`name`,`statue`,`mobile`,`class_no`,`grade`) values('0900310308','77b1b50e6251e52ab1e234c31c170c32','','','1','','09003103','2009');
insert into `stu`(`stu_no`,`psw`,`mail`,`name`,`statue`,`mobile`,`class_no`,`grade`) values('0900310309','237b4e480b78ff8144f9f3a2e4987497','','','1','','09003103','2009');
insert into `stu`(`stu_no`,`psw`,`mail`,`name`,`statue`,`mobile`,`class_no`,`grade`) values('0900310310','89452442d2f520b805e47ed248c0e2c4','youyou@126.com','呵呵','1','126888558','09003103','2009');
insert into `stu`(`stu_no`,`psw`,`mail`,`name`,`statue`,`mobile`,`class_no`,`grade`) values('0900310311','96d87461e0b65d3f8ab71eab60520f35','','','1','','09003103','2009');
insert into `stu`(`stu_no`,`psw`,`mail`,`name`,`statue`,`mobile`,`class_no`,`grade`) values('0900310312','709566396bef124fb0ecb7e8f23571c8','','','1','','09003103','2009');
insert into `stu`(`stu_no`,`psw`,`mail`,`name`,`statue`,`mobile`,`class_no`,`grade`) values('0900310313','a4e9e1a45d33574cbb16222b841a2d6f','','','1','','09003103','2009');
insert into `stu`(`stu_no`,`psw`,`mail`,`name`,`statue`,`mobile`,`class_no`,`grade`) values('0900310314','2f7e6c6d2801bf6872941155b1d88f67','','','1','','09003103','2009');
insert into `stu`(`stu_no`,`psw`,`mail`,`name`,`statue`,`mobile`,`class_no`,`grade`) values('0900310315','859d85f7c42448e9b4d8f97ed2105e4c','liangdebin@ldb.com','梁德斌','1','13800138000','09003103','2009');
insert into `stu`(`stu_no`,`psw`,`mail`,`name`,`statue`,`mobile`,`class_no`,`grade`) values('0900310316','9dc86bbaef5c9035c277492a1b060eb2','','','1','','09003103','2009');
insert into `stu`(`stu_no`,`psw`,`mail`,`name`,`statue`,`mobile`,`class_no`,`grade`) values('0900310317','e00959d0d443c7a07a05d76405cf763a','','','1','','09003103','2009');
insert into `stu`(`stu_no`,`psw`,`mail`,`name`,`statue`,`mobile`,`class_no`,`grade`) values('0900310318','8fbee763c3ede18a59fdf9bcbf5afae6','','','1','','09003103','2009');
insert into `stu`(`stu_no`,`psw`,`mail`,`name`,`statue`,`mobile`,`class_no`,`grade`) values('0900310319','d2a8f961071d1d2a1161b7f0b54a2e47','','','1','','09003103','2009');
insert into `stu`(`stu_no`,`psw`,`mail`,`name`,`statue`,`mobile`,`class_no`,`grade`) values('0900310320','fe6db26db4f414df0de3bd2ce38f0e3d','','','1','','09003103','2009');
insert into `stu`(`stu_no`,`psw`,`mail`,`name`,`statue`,`mobile`,`class_no`,`grade`) values('0900310321','9c99b6fad64294dde5dda0cbfbebaca7','','','1','','09003103','2009');
insert into `stu`(`stu_no`,`psw`,`mail`,`name`,`statue`,`mobile`,`class_no`,`grade`) values('0900310322','0da412ecc316cb98623f8c97e3abac2a','','','1','','09003103','2009');
insert into `stu`(`stu_no`,`psw`,`mail`,`name`,`statue`,`mobile`,`class_no`,`grade`) values('0900310323','fbe0b616520c48802320c744a61abee8','','','1','','09003103','2009');
insert into `stu`(`stu_no`,`psw`,`mail`,`name`,`statue`,`mobile`,`class_no`,`grade`) values('0900310324','27f7ee010a8667871ea7667f3498bfc2','','','1','','09003103','2009');
insert into `stu`(`stu_no`,`psw`,`mail`,`name`,`statue`,`mobile`,`class_no`,`grade`) values('0900310325','0f3378e34e1e656c0bd2a6f9dc189496','','','1','','09003103','2009');
insert into `stu`(`stu_no`,`psw`,`mail`,`name`,`statue`,`mobile`,`class_no`,`grade`) values('10088','b0bb5481337e56b6f67320e0a55b5de8','','','1','','09003102','2003');
insert into `stu`(`stu_no`,`psw`,`mail`,`name`,`statue`,`mobile`,`class_no`,`grade`) values('10099','bf18a32d121131eb5f88bc1cc713d28f','','','1','','09003102','2001');
insert into `stu`(`stu_no`,`psw`,`mail`,`name`,`statue`,`mobile`,`class_no`,`grade`) values('stu2','1f24692ca5b1cb06b395574be5141c05','你好','你好','','13800138000','09003102','2009');
CREATE TABLE `tea` (
  `tea_no` varchar(12) NOT NULL,
  `psw` varchar(33) NOT NULL,
  `name` varchar(10) DEFAULT NULL,
  `mail` varchar(50) DEFAULT NULL,
  `department` tinyint(4) DEFAULT NULL,
  `skill` varchar(60) DEFAULT NULL,
  `mobile` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`tea_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
insert into `tea`(`tea_no`,`psw`,`name`,`mail`,`department`,`skill`,`mobile`) values('009','009','李明','009@tea.com','3','c,c++','');
insert into `tea`(`tea_no`,`psw`,`name`,`mail`,`department`,`skill`,`mobile`) values('123','6fd742a61bd034804c00c49b18045020','123','123@tea.com','3','','123456789');
insert into `tea`(`tea_no`,`psw`,`name`,`mail`,`department`,`skill`,`mobile`) values('tea008','31a296bb98cc15aa4dce4fa44b3b17f3','张三','','3','','');
CREATE TABLE `topic` (
  `post_id` int(11) NOT NULL AUTO_INCREMENT,
  `sort` varchar(4) DEFAULT NULL,
  `title` varchar(80) NOT NULL,
  `author` varchar(12) DEFAULT NULL,
  `body` varchar(1000) NOT NULL,
  `post_time` datetime DEFAULT NULL,
  `last_floor` int(11) DEFAULT NULL,
  `last_reply_time` datetime DEFAULT NULL,
  `visible` tinyint(4) DEFAULT NULL,
  `enable_post` tinyint(4) DEFAULT NULL,
  `top` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;
insert into `topic`(`post_id`,`sort`,`title`,`author`,`body`,`post_time`,`last_floor`,`last_reply_time`,`visible`,`enable_post`,`top`) values('1','1','新手报到帖','stu','ss','1899-12-30 13:00:00','3','2013-05-19 15:51:56','0','0','0');
insert into `topic`(`post_id`,`sort`,`title`,`author`,`body`,`post_time`,`last_floor`,`last_reply_time`,`visible`,`enable_post`,`top`) values('2','1','求解','sss','bw','1899-12-30 01:00:00','5','1899-12-30 01:00:00','0','0','0');
insert into `topic`(`post_id`,`sort`,`title`,`author`,`body`,`post_time`,`last_floor`,`last_reply_time`,`visible`,`enable_post`,`top`) values('4','1','www','stu2','www','2013-05-19 01:51:12','0','0000-00-00 00:00:00','0','0','0');
insert into `topic`(`post_id`,`sort`,`title`,`author`,`body`,`post_time`,`last_floor`,`last_reply_time`,`visible`,`enable_post`,`top`) values('5','1','www','stu2','www','2013-05-19 01:53:42','1','2013-05-19 02:20:34','0','0','0');
insert into `topic`(`post_id`,`sort`,`title`,`author`,`body`,`post_time`,`last_floor`,`last_reply_time`,`visible`,`enable_post`,`top`) values('6','1','www','stu2','www','2013-05-19 01:55:00','2','2013-05-19 13:22:28','0','0','0');
insert into `topic`(`post_id`,`sort`,`title`,`author`,`body`,`post_time`,`last_floor`,`last_reply_time`,`visible`,`enable_post`,`top`) values('7','1','测试','stu2','测试是','2013-05-19 02:18:05','25','2013-05-19 19:39:16','0','0','0');
insert into `topic`(`post_id`,`sort`,`title`,`author`,`body`,`post_time`,`last_floor`,`last_reply_time`,`visible`,`enable_post`,`top`) values('8','1','1111','stu2','是是','2013-05-19 02:28:07','3','2013-05-19 02:28:48','0','0','0');
insert into `topic`(`post_id`,`sort`,`title`,`author`,`body`,`post_time`,`last_floor`,`last_reply_time`,`visible`,`enable_post`,`top`) values('9','1','1','stu2','1','2013-05-19 02:30:03','0','2013-05-19 02:30:03','0','0','0');
insert into `topic`(`post_id`,`sort`,`title`,`author`,`body`,`post_time`,`last_floor`,`last_reply_time`,`visible`,`enable_post`,`top`) values('10','1','2','stu2','2','2013-05-19 02:30:08','0','2013-05-19 02:30:08','0','0','0');
insert into `topic`(`post_id`,`sort`,`title`,`author`,`body`,`post_time`,`last_floor`,`last_reply_time`,`visible`,`enable_post`,`top`) values('15','2','你好','stu2','你好啊','2013-05-19 12:36:14','0','2013-05-19 12:36:14','0','0','0');
insert into `topic`(`post_id`,`sort`,`title`,`author`,`body`,`post_time`,`last_floor`,`last_reply_time`,`visible`,`enable_post`,`top`) values('17','2','测试帖子','stu2','玩玩','2013-05-19 14:11:54','0','2013-05-19 14:11:54','0','0','0');
insert into `topic`(`post_id`,`sort`,`title`,`author`,`body`,`post_time`,`last_floor`,`last_reply_time`,`visible`,`enable_post`,`top`) values('18','3','测试帖子','stu2','我你他','2013-05-19 14:12:18','1','2013-05-19 16:45:33','0','0','0');
insert into `topic`(`post_id`,`sort`,`title`,`author`,`body`,`post_time`,`last_floor`,`last_reply_time`,`visible`,`enable_post`,`top`) values('19','3','ww','stu2','wefee','2013-05-19 19:40:51','0','2013-05-19 19:40:51','0','0','0');
insert into `topic`(`post_id`,`sort`,`title`,`author`,`body`,`post_time`,`last_floor`,`last_reply_time`,`visible`,`enable_post`,`top`) values('20','1','q','stu2','t34t2','2013-05-19 19:41:36','0','2013-05-19 19:41:36','0','0','0');
insert into `topic`(`post_id`,`sort`,`title`,`author`,`body`,`post_time`,`last_floor`,`last_reply_time`,`visible`,`enable_post`,`top`) values('21','1','geeg','stu2','wge','2013-05-19 19:41:42','0','2013-05-19 19:41:42','0','0','0');
insert into `topic`(`post_id`,`sort`,`title`,`author`,`body`,`post_time`,`last_floor`,`last_reply_time`,`visible`,`enable_post`,`top`) values('22','1','wgege','stu2','wge','2013-05-19 19:41:49','0','2013-05-19 19:41:49','0','0','0');
insert into `topic`(`post_id`,`sort`,`title`,`author`,`body`,`post_time`,`last_floor`,`last_reply_time`,`visible`,`enable_post`,`top`) values('23','1','wgeg','stu2','egwgewg','2013-05-19 19:41:56','0','2013-05-19 19:41:56','0','0','0');
insert into `topic`(`post_id`,`sort`,`title`,`author`,`body`,`post_time`,`last_floor`,`last_reply_time`,`visible`,`enable_post`,`top`) values('24','1','geg','stu2','wgwgw','2013-05-19 19:42:06','0','2013-05-19 19:42:06','0','0','0');
insert into `topic`(`post_id`,`sort`,`title`,`author`,`body`,`post_time`,`last_floor`,`last_reply_time`,`visible`,`enable_post`,`top`) values('25','1','wgegeg','stu2','gewgwgegw','2013-05-19 19:42:14','0','2013-05-19 19:42:14','0','0','0');
insert into `topic`(`post_id`,`sort`,`title`,`author`,`body`,`post_time`,`last_floor`,`last_reply_time`,`visible`,`enable_post`,`top`) values('26','1','grgw14641','stu2','gwegewgwegw','2013-05-19 19:42:22','0','2013-05-19 19:42:22','0','0','0');
insert into `topic`(`post_id`,`sort`,`title`,`author`,`body`,`post_time`,`last_floor`,`last_reply_time`,`visible`,`enable_post`,`top`) values('27','1','832783','stu2','erhrhee','2013-05-19 19:42:45','0','2013-05-19 19:42:45','0','0','0');
insert into `topic`(`post_id`,`sort`,`title`,`author`,`body`,`post_time`,`last_floor`,`last_reply_time`,`visible`,`enable_post`,`top`) values('28','1','sab','stu2','ebwbw','2013-05-19 19:42:52','0','2013-05-19 19:42:52','0','0','0');
insert into `topic`(`post_id`,`sort`,`title`,`author`,`body`,`post_time`,`last_floor`,`last_reply_time`,`visible`,`enable_post`,`top`) values('29','1','WGEG','stu2','GE','2013-05-19 19:42:57','0','2013-05-19 19:42:57','0','0','0');
insert into `topic`(`post_id`,`sort`,`title`,`author`,`body`,`post_time`,`last_floor`,`last_reply_time`,`visible`,`enable_post`,`top`) values('30','1','ern','stu2','aren','2013-05-19 19:43:03','0','2013-05-19 19:43:03','0','0','0');
insert into `topic`(`post_id`,`sort`,`title`,`author`,`body`,`post_time`,`last_floor`,`last_reply_time`,`visible`,`enable_post`,`top`) values('31','1','wgeg','stu2','ssga','2013-05-19 19:43:13','0','2013-05-19 19:43:13','0','0','0');
insert into `topic`(`post_id`,`sort`,`title`,`author`,`body`,`post_time`,`last_floor`,`last_reply_time`,`visible`,`enable_post`,`top`) values('32','1','13146346','stu2','agewgw','2013-05-19 19:43:22','0','2013-05-19 19:43:22','0','0','0');
insert into `topic`(`post_id`,`sort`,`title`,`author`,`body`,`post_time`,`last_floor`,`last_reply_time`,`visible`,`enable_post`,`top`) values('33','3','154134','stu2','wgeegwe','2013-05-19 19:43:32','0','2013-05-19 19:43:32','0','0','0');
insert into `topic`(`post_id`,`sort`,`title`,`author`,`body`,`post_time`,`last_floor`,`last_reply_time`,`visible`,`enable_post`,`top`) values('34','1','ag','stu2','gw1g63w14eg','2013-05-19 19:43:39','0','2013-05-19 19:43:39','0','0','0');
insert into `topic`(`post_id`,`sort`,`title`,`author`,`body`,`post_time`,`last_floor`,`last_reply_time`,`visible`,`enable_post`,`top`) values('35','1','13143','stu2','wgegew','2013-05-19 19:43:51','0','2013-05-19 19:43:51','0','0','0');
insert into `topic`(`post_id`,`sort`,`title`,`author`,`body`,`post_time`,`last_floor`,`last_reply_time`,`visible`,`enable_post`,`top`) values('36','1','ahe','stu2','whwhwehg','2013-05-19 19:43:57','1','2013-05-20 00:05:18','0','0','0');
insert into `topic`(`post_id`,`sort`,`title`,`author`,`body`,`post_time`,`last_floor`,`last_reply_time`,`visible`,`enable_post`,`top`) values('37','1','wgefg','stu2','wgegw','2013-05-19 19:44:03','1','2013-05-19 21:14:57','0','0','0');
insert into `topic`(`post_id`,`sort`,`title`,`author`,`body`,`post_time`,`last_floor`,`last_reply_time`,`visible`,`enable_post`,`top`) values('38','1','wgefgwww','stu2','wgegw','2013-05-19 19:44:08','0','2013-05-19 19:44:08','0','0','0');
insert into `topic`(`post_id`,`sort`,`title`,`author`,`body`,`post_time`,`last_floor`,`last_reply_time`,`visible`,`enable_post`,`top`) values('39','1','wgefgwwwww','stu2','wgegwgee','2013-05-19 19:44:13','0','2013-05-19 19:44:13','0','0','0');
insert into `topic`(`post_id`,`sort`,`title`,`author`,`body`,`post_time`,`last_floor`,`last_reply_time`,`visible`,`enable_post`,`top`) values('40','1','wgefgwwwwwwwwwww','stu2','wgegwgeegegeg','2013-05-19 19:44:17','1','2013-05-19 19:51:29','0','0','0');
insert into `topic`(`post_id`,`sort`,`title`,`author`,`body`,`post_time`,`last_floor`,`last_reply_time`,`visible`,`enable_post`,`top`) values('41','1','qyw','stu2','wtw','2013-05-19 19:44:24','1','2013-05-19 19:46:10','0','0','0');
insert into `topic`(`post_id`,`sort`,`title`,`author`,`body`,`post_time`,`last_floor`,`last_reply_time`,`visible`,`enable_post`,`top`) values('42','1','你好啊','stu2','你好啊你好啊你好啊你好啊你好啊你好啊你好啊你好啊你好啊你好啊你好啊你好啊你好啊你好啊你好啊你好啊你好啊你好啊你好啊你好啊你好啊你好啊你好啊你好啊你好啊你好啊你好啊你好啊你好啊你好啊你好啊你好啊你好啊你好啊你好啊你好啊你好啊你好啊你好啊你好啊你好啊你好啊你好啊你好啊你好啊你好啊你好啊你好啊你好啊你好啊你好啊你好啊你好啊你好啊你好啊你好啊你好啊你好啊你好啊你好啊你好啊你好啊你好啊你好啊你好啊你好啊你好啊你好啊你好啊你好啊你好啊你好啊你好啊你好啊你好啊你好啊你好啊你好啊你好啊你好啊你好啊你好啊你好啊你好啊你好啊你好啊你好啊你好啊你好啊你好啊你好啊你好啊你好啊你好啊你好啊你好啊你好啊你好啊你好啊你好啊你好啊你好啊你好啊你好啊你好啊你好啊你好啊你好啊你好啊你好啊你好啊你好啊','2013-05-19 19:56:48','1','2013-05-21 13:28:53','0','0','0');
insert into `topic`(`post_id`,`sort`,`title`,`author`,`body`,`post_time`,`last_floor`,`last_reply_time`,`visible`,`enable_post`,`top`) values('43','1','session开始了','0900310102','session开始了','2013-05-19 23:59:09','2','2013-05-20 00:04:38','0','0','0');
insert into `topic`(`post_id`,`sort`,`title`,`author`,`body`,`post_time`,`last_floor`,`last_reply_time`,`visible`,`enable_post`,`top`) values('44','2','管理员123发帖测试','123','管理员123发帖测试','2013-05-20 00:35:09','1','2013-05-20 13:58:18','0','0','0');
insert into `topic`(`post_id`,`sort`,`title`,`author`,`body`,`post_time`,`last_floor`,`last_reply_time`,`visible`,`enable_post`,`top`) values('45','1','测试一下发帖','0900310315','测试而已','2013-05-20 19:41:14','0','2013-05-20 19:41:14','0','0','0');
