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
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;
insert into `item`(`id`,`item_no`,`item_name`,`body`,`report_format`,`cor_no`,`exam_rate`) values('46','1','用贪心方法解背包问题','一: 实验目的
    掌握按贪心方法原理求背包问题最优解的方法

二:问题描述
   背包问题描述如下:  已知
   背包容量M=120
   物品种类数n=10
   各种物品的总效益pi(i=1,2,………10) : 50,60,70,80,90,80,70,60,50,40
   各种物品的总重量wi(i=1,2………10) : 17,30,25,41,80,70,64,56,47,38
求: 各种物品所取重量占其总重量的比例xi(i=1,2,…..10),满足0<=xi<=1,

三. 基本要求
(1)按三种不同的量度标准分别计算所得最大总效益,然后比较哪个最大
1.	按效益值由大到小取物品. 
2. 按重量值由小到大取物品
3.按比值pi/wi的值由大到小取物品

','一: 实验目的
    掌握按贪心方法原理求背包问题最优解的方法
二:问题描述
   背包问题描述如下:  已知
   背包容量M=120
   物品种类数n=10
   各种物品的总效益pi(i=1,2,………10) : 50,60,70,80,90,80,70,60,50,40
   各种物品的总重量wi(i=1,2………10) : 17,30,25,41,80,70,64,56,47,38
求: 各种物品所取重量占其总重量的比例xi(i=1,2,…..10),满足0<=xi<=1,

三. 基本要求
(1)按三种不同的量度标准分别计算所得最大总效益,然后比较哪个最大
1.按效益值由大到小取物品.
2. 按重量值由小到大取物品
3.按比值pi/wi的值由大到小取物品
四．程序清单




五．结果



六．总结
','sf_2013001','25');
insert into `item`(`id`,`item_no`,`item_name`,`body`,`report_format`,`cor_no`,`exam_rate`) values('47','2','动态规划原理1','一: 实验目的
    掌握按动态规划原理解决计算图的任两结点间的距离的Floyd算法

二:问题描述
   
  设图G 的结点个数n=10,给定一个10*10矩阵作为图G 的成本矩阵.
  其中的元素99相当于无穷，表示相应的两个结点间没有边相连
     0    99     8     7     6     5     4     3     2     1  
     99    0     99    8     7     6     5     4     3     2
     8    99     0     99   8      7     6     5     4     3
     7     8     99    0    99     8     7     6     5     4
C＝  6    7      8     99   0      99    8     7     6     5
     5    6      7     8    99     0     99    8     7     6
     4    5      6     7    8      99    0     99    8     7
     3    4      5     6    7      8     99     0    99    8
     2    3      4     5    6      7     8      99   0     99
     1    2      3     4    5      6     7      8    99    0
三. 基本要求
（1）	算法采用三重循环。
（2）	显示结果要清晰易懂
（3）	本题运行结果 
','一: 实验目的
    掌握按动态规划原理解决计算图的任两结点间的距离的Floyd算法

二:问题描述
   
  设图G 的结点个数n=10,给定一个10*10矩阵作为图G 的成本矩阵.
  其中的元素99相当于无穷，表示相应的两个结点间没有边相连
     0    99     8     7     6     5     4     3     2     1  
     99    0     99    8     7     6     5     4     3     2
     8    99     0     99   8      7     6     5     4     3
     7     8     99    0    99     8     7     6     5     4
C＝  6    7      8     99   0      99    8     7     6     5
     5    6      7     8    99     0     99    8     7     6
     4    5      6     7    8      99    0     99    8     7
     3    4      5     6    7      8     99     0    99    8
     2    3      4     5    6      7     8      99   0     99
     1    2      3     4    5      6     7      8    99    0
三. 基本要求
（1）	算法采用三重循环。
（2）	显示结果要清晰易懂
（3）	本题运行结果 

四．程序清单



五．结果


六．总结
','sf_2013001','25');
insert into `item`(`id`,`item_no`,`item_name`,`body`,`report_format`,`cor_no`,`exam_rate`) values('48','3','动态规划原理2','一: 实验目的
    掌握按动态规划原理求解一类特定条件下的流水线调度问题
具体做法.

二:问题描述
   已知
   作业个数n=10
   各个作业第一道工序所须时间ai(I=1,2……,n)
   各个作业第二道工序所须时间bi(I=1,2……,n)

作业序号:  1    2     3    4     5    6    7     8    9   10
    a;    25    30   35   40    45    50   55    60   65   70
    b;    21    31  41    51    61    39   49   59    69   79

规定:  (1)任一个作业必须先做完第一道工序才能做第二道工序

(2) 任一个作业的任一道工序必须连续做完,才能中断而让别的作业做完.
   求: 一种最优调度方案,即使总的完成时间最短的调度方案,用长度为n的一维数组s表示，使s[i]为按先后次序排在第ii位进行处理的作业的序号．

三：要求：
（１）	用一个４＊２０的二维数组Ｍ，第１行存放按从小到大排序的20个所给出的ai和bi，第２行存放相应的作业序号，第３行存放１或２(１代表是来自ai，２代表是来自bi), 第4行存放0或１（０代表作业序号未进入最优调度方案；１代表作业序号已进入最优调度方案）

（２）	排序完后，按课本所述方法求一种最优调度方案，存放在S中。
','一: 实验目的
    掌握按动态规划原理求解一类特定条件下的流水线调度问题
具体做法.

二:问题描述
   已知
   作业个数n=10
   各个作业第一道工序所须时间ai(I=1,2……,n)
   各个作业第二道工序所须时间bi(I=1,2……,n)

作业序号:  1    2     3    4     5    6    7     8    9   10
    a;    25    30   35   40    45    50   55    60   65   70
    b;    21    31  41    51    61    39   49   59    69   79

规定:  (1)任一个作业必须先做完第一道工序才能做第二道工序

(2) 任一个作业的任一道工序必须连续做完,才能中断而让别的作业做完.
   求: 一种最优调度方案,即使总的完成时间最短的调度方案,用长度为n的一维数组s表示，使s[i]为按先后次序排在第ii位进行处理的作业的序号．

三：要求：
（１）	用一个４＊２０的二维数组Ｍ，第１行存放按从小到大排序的20个所给出的ai和bi，第２行存放相应的作业序号，第３行存放１或２(１代表是来自ai，２代表是来自bi), 第4行存放0或１（０代表作业序号未进入最优调度方案；１代表作业序号已进入最优调度方案）

（２）	排序完后，按课本所述方法求一种最优调度方案，存放在S中。

四．程序清单



五．结果


六．总结
','sf_2013001','25');
insert into `item`(`id`,`item_no`,`item_name`,`body`,`report_format`,`cor_no`,`exam_rate`) values('49','4','回溯法','一: 实验目的
    理解回溯法解8皇后问题的具体做法。

二：问题描述
假设已放了7个皇后的棋盘

检查若X[8]=5是否使第8个皇后不被前面7个皇后中的任一个攻击。


三： 基本要求
（1）	按课本167页所述算法6。4编程序计算。
（2）	结果：若X[8]=5，则第8个皇后不被前面7个皇后中的任一个攻击，也就是说8个皇后中的任何两个不能相应攻击。
','一: 实验目的
    理解回溯法解8皇后问题的具体做法。

二：问题描述
假设已放了7个皇后的棋盘

检查若X[8]=5是否使第8个皇后不被前面7个皇后中的任一个攻击。


三： 基本要求
（1）	按课本167页所述算法6。4编程序计算。
（2）	结果：若X[8]=5，则第8个皇后不被前面7个皇后中的任一个攻击，也就是说8个皇后中的任何两个不能相应攻击。
四．程序清单




五．结果


六．总结','sf_2013001','25');
insert into `item`(`id`,`item_no`,`item_name`,`body`,`report_format`,`cor_no`,`exam_rate`) values('50','1','汇编语言上机过程和Debug常用调试命令（验证）','一．实验目的：
学习程序设计的基本方法和技能，熟练掌握用汇编语言设计、编写、调试和运行程序的方法。

二．实验题目：
     熟悉与实验有关的系统软件(如编辑程序、汇编程序、连接程序和调试程序等)的使用方法。在调试过程中，学习及掌握debug程序的各种操作命令。

三．问题描述：
      试编写一程序：比较两个字符串string1和string2所含的字符是否相同，若相同则显示‘match’; 否则，显示‘no match’。



','一．实验目的：
学习程序设计的基本方法和技能，熟练掌握用汇编语言设计、编写、调试和运行程序的方法。

二．实验题目：
     熟悉与实验有关的系统软件(如编辑程序、汇编程序、连接程序和调试程序等)的使用方法。在调试过程中，学习及掌握debug程序的各种操作命令。

三．问题描述：
      试编写一程序：比较两个字符串string1和string2所含的字符是否相同，若相同则显示‘match’; 否则，显示‘no match’。

四．	程序清单


五．	总结','hb_2013001','20');
insert into `item`(`id`,`item_no`,`item_name`,`body`,`report_format`,`cor_no`,`exam_rate`) values('51','2','循环程序设计1（设计）','一.实验目的：
学会用循环结构进行程序编程。

二.实验题目：
设计一个按表格形式显示ASC||码为10H—100H的所有字符的程序。

三.实验要求：
    按15行*16列的表格形式显示ASC||码为10H----100H的所有字符，即以行为主的顺序及ASC||码递增的次序依次显示对应的字符。每16个字符为一行,每行中的相邻两个字符之间用空白符(ASC||为0)隔开。
','一.实验目的：
学会用循环结构进行程序编程。

二.实验题目：
设计一个按表格形式显示ASC||码为10H—100H的所有字符的程序。

三.实验要求：
    按15行*16列的表格形式显示ASC||码为10H----100H的所有字符，即以行为主的顺序及ASC||码递增的次序依次显示对应的字符。每16个字符为一行,每行中的相邻两个字符之间用空白符(ASC||为0)隔开。

四.程序清单

五.总结','hb_2013001','20');
insert into `item`(`id`,`item_no`,`item_name`,`body`,`report_format`,`cor_no`,`exam_rate`) values('52','3','循环程序设计2（设计）','一.实验目的：
学会用循环程序设计进行程序编程。

二.实验题目：
设计查找匹配字符串SEARCH的程序。

三.问题要求：
    程序接收用户键入的一个关键字以及一个句子。如果句子中不包含关键字则显示’no match’;如果句子中包含关键字则显示‘match’，且把该字在句子中的位置用十六进制数显示出来，要求程序的执行过程如下：
    enter   keyword :abc
    enter   sentence :we   are   studying  abc
    match  at  location :11H of  the  sentence 
    enter   sentence: xyz ,ok?
    no  match
    enter  sentence :^c
','一.实验目的：
学会用循环程序设计进行程序编程。

二.实验题目：
设计查找匹配字符串SEARCH的程序。

三.问题要求：
    程序接收用户键入的一个关键字以及一个句子。如果句子中不包含关键字则显示’no match’;如果句子中包含关键字则显示‘match’，且把该字在句子中的位置用十六进制数显示出来，要求程序的执行过程如下：
    enter   keyword :abc
    enter   sentence :we   are   studying  abc
    match  at  location :11H of  the  sentence 
    enter   sentence: xyz ,ok?
    no  match
    enter  sentence :^c
 
四.程序清单

五.总结
','hb_2013001','20');
insert into `item`(`id`,`item_no`,`item_name`,`body`,`report_format`,`cor_no`,`exam_rate`) values('54','5','分支程序设计','一.实验目的：
学会用分支程序设计进行程序编程。

二.实验题目：
设计一个程序能分类统计字符个数

三.实验要求：
        程序接收用户键入的一行字符(字符个数不超过80个，该字符串用回车符结束)，并按字母、数字及其它字符分类计数，然后将结果存入以letter、digit和other为名的存储单元中。

','一.实验目的：
学会用分支程序设计进行程序编程。

二.实验题目：
设计一个程序能分类统计字符个数

三.实验要求：
        程序接收用户键入的一行字符(字符个数不超过80个，该字符串用回车符结束)，并按字母、数字及其它字符分类计数，然后将结果存入以letter、digit和other为名的存储单元中。

 
四.程序清单

五.总结
','hb_2013001','20');
insert into `item`(`id`,`item_no`,`item_name`,`body`,`report_format`,`cor_no`,`exam_rate`) values('56','7','子程序设计','一．实验目的：
学会用子程序设计进行程序编程。

二．实验题目：
设计一个能查找电话号码phone的程序。

三．实验要求：
i.要求程序建立一个可存放50项的电话号码表，每项包括人名(20个字符)及电话号码(8个字符)两部分；
ii.程序可接收输入人名及相应的电话号码，并把它们加入电话号码表中；
iii.凡有新的输入后，程序应按人名对电话号码表重新排序；
iv.程序可接收需要查找电话号码的人名，并从电话号码表中查出其电话号码，再在屏幕上以如下格式显示出来。

        name  tel
        ****  ****
','一．实验目的：
学会用子程序设计进行程序编程。

二．实验题目：
设计一个能查找电话号码phone的程序。

三．实验要求：
i.要求程序建立一个可存放50项的电话号码表，每项包括人名(20个字符)及电话号码(8个字符)两部分；
ii.程序可接收输入人名及相应的电话号码，并把它们加入电话号码表中；
iii.凡有新的输入后，程序应按人名对电话号码表重新排序；
iv.程序可接收需要查找电话号码的人名，并从电话号码表中查出其电话号码，再在屏幕上以如下格式显示出来。

        name  tel
        ****  ****

四.程序清单

五.总结
','hb_2013001','20');
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
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8;
insert into `reply`(`reply_id`,`author`,`body`,`reply_time`,`floor`,`post_id`) values('69','123','你好啊
哈哈','2013-05-22 17:06:34','1','49');
insert into `reply`(`reply_id`,`author`,`body`,`reply_time`,`floor`,`post_id`) values('70','123','你好啊
哈哈','2013-05-22 17:12:00','2','49');
insert into `reply`(`reply_id`,`author`,`body`,`reply_time`,`floor`,`post_id`) values('71','123','a
a
','2013-05-22 17:13:52','1','52');
insert into `reply`(`reply_id`,`author`,`body`,`reply_time`,`floor`,`post_id`) values('72','123','<div>a</div>','2013-05-22 17:15:37','1','53');
insert into `reply`(`reply_id`,`author`,`body`,`reply_time`,`floor`,`post_id`) values('73','123','<a>a</a>','2013-05-22 17:19:09','2','53');
insert into `reply`(`reply_id`,`author`,`body`,`reply_time`,`floor`,`post_id`) values('74','123','<a>a</a>','2013-05-22 17:19:16','3','53');
insert into `reply`(`reply_id`,`author`,`body`,`reply_time`,`floor`,`post_id`) values('75','123','<a>a</a>','2013-05-22 17:19:19','4','53');
insert into `reply`(`reply_id`,`author`,`body`,`reply_time`,`floor`,`post_id`) values('76','123','<a>a</a>','2013-05-22 17:19:21','5','53');
insert into `reply`(`reply_id`,`author`,`body`,`reply_time`,`floor`,`post_id`) values('77','123','<a>a</a>','2013-05-22 17:19:22','6','53');
insert into `reply`(`reply_id`,`author`,`body`,`reply_time`,`floor`,`post_id`) values('78','123','nia
we','2013-05-22 17:33:04','1','55');
insert into `reply`(`reply_id`,`author`,`body`,`reply_time`,`floor`,`post_id`) values('79','tea008','a\'\'<a></a>','2013-05-22 18:17:33','1','60');
insert into `reply`(`reply_id`,`author`,`body`,`reply_time`,`floor`,`post_id`) values('80','123','aaa','2013-05-22 19:15:00','1','46');
insert into `reply`(`reply_id`,`author`,`body`,`reply_time`,`floor`,`post_id`) values('81','123','可能是网络延时','2013-05-24 22:32:11','1','63');
insert into `reply`(`reply_id`,`author`,`body`,`reply_time`,`floor`,`post_id`) values('82','0900310315','hello','2013-05-28 22:19:42','1','89');
insert into `reply`(`reply_id`,`author`,`body`,`reply_time`,`floor`,`post_id`) values('83','0900310315','你好','2013-05-28 22:19:52','2','89');
insert into `reply`(`reply_id`,`author`,`body`,`reply_time`,`floor`,`post_id`) values('84','tea008','测试啊啊啊啊啊啊','2013-05-29 09:33:02','1','88');
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
insert into `report`(`id`,`cor_no`,`stu_no`,`item_no`,`date`,`body`,`item_mark`,`remark`,`status`) values('16','sf_2013001','0900310315','1','2013-05-20','实验1 贪心方法原理的实验内容

我提交<div>a</div>','80','做的不错','2');
insert into `report`(`id`,`cor_no`,`stu_no`,`item_no`,`date`,`body`,`item_mark`,`remark`,`status`) values('17','sf_2013001','0900310315','2','2013-05-20','实验2 动态规划原理1的实验内容

提交','70','做得一般，还需努力','2');
insert into `report`(`id`,`cor_no`,`stu_no`,`item_no`,`date`,`body`,`item_mark`,`remark`,`status`) values('18','sf_2013001','0900310315','3','2013-05-20','实验3 动态规划原理2 的实验报告内容
提交','75','做得一般，还需努力','2');
insert into `report`(`id`,`cor_no`,`stu_no`,`item_no`,`date`,`body`,`item_mark`,`remark`,`status`) values('19','sf_2013001','0900310315','4','2013-05-20','实验4 回溯法 的实验内容

已提交','90','做的不错','2');
insert into `report`(`id`,`cor_no`,`stu_no`,`item_no`,`date`,`body`,`item_mark`,`remark`,`status`) values('20','hb_2013001','0900310315','1','2013-05-29','一．实验目的：
学习程序设计的基本方法和技能，熟练掌握用汇编语言设计、编写、调试和运行程序的方法。

二．实验题目：
     熟悉与实验有关的系统软件(如编辑程序、汇编程序、连接程序和调试程序等)的使用方法。在调试过程中，学习及掌握debug程序的各种操作命令。

三．问题描述：
      试编写一程序：比较两个字符串string1和string2所含的字符是否相同，若相同则显示‘match’; 否则，显示‘no match’。

aaaaaa
qqq
','80','做的不错','2');
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
insert into `sel_cor`(`id`,`stu_no`,`cor_no`,`groups`,`status`,`mark`,`usual_mark`,`report_mark`,`exam_mark`) values('20','0900310315','hb_2013001','A','1','','','0','');
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
insert into `tea`(`tea_no`,`psw`,`name`,`mail`,`department`,`skill`,`mobile`) values('tea008','31a296bb98cc15aa4dce4fa44b3b17f3','张三','san@san.com','3','java,c++,汇编','15587987414');
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
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8;
insert into `topic`(`post_id`,`sort`,`title`,`author`,`body`,`post_time`,`last_floor`,`last_reply_time`,`visible`,`enable_post`,`top`) values('46','2','如何成为Android高手','123','sss
','2013-05-22 16:58:40','1','2013-05-22 10:15:00','0','0','0');
insert into `topic`(`post_id`,`sort`,`title`,`author`,`body`,`post_time`,`last_floor`,`last_reply_time`,`visible`,`enable_post`,`top`) values('47','1','sa','123','','2013-05-22 17:03:03','0','2013-05-22 17:03:03','0','0','0');
insert into `topic`(`post_id`,`sort`,`title`,`author`,`body`,`post_time`,`last_floor`,`last_reply_time`,`visible`,`enable_post`,`top`) values('48','1','sa','123','1、Q：如何成为高手？

A：成为一名真正的Android高手必须掌握和遵循的一些准则：

1）学会懒惰

　　　　ａDon\'t Reinvent the Wheel（不要重复发明轮子）。

　　　　ｂInventing the Wheel(发明轮子)。

　　　　ｃDon\'t Reinvent the Wheel（不要重复发明轮子）。','2013-05-22 17:06:03','0','2013-05-22 17:06:03','0','0','0');
insert into `topic`(`post_id`,`sort`,`title`,`author`,`body`,`post_time`,`last_floor`,`last_reply_time`,`visible`,`enable_post`,`top`) values('49','1','sa','123','1、Q：如何成为高手？

A：成为一名真正的Android高手必须掌握和遵循的一些准则：

1）学会懒惰


　　　　ａDon\'t Reinvent the Wheel（不要重复发明轮子）。

　　　　ｂInventing the Wheel(发明轮子)。

　　　　ｃDon\'t Reinvent the Wheel（不要重复发明轮子）。','2013-05-22 17:06:24','2','2013-05-22 17:12:00','0','0','0');
insert into `topic`(`post_id`,`sort`,`title`,`author`,`body`,`post_time`,`last_floor`,`last_reply_time`,`visible`,`enable_post`,`top`) values('50','1','啊','123','我
我','2013-05-22 17:06:46','0','2013-05-22 17:06:46','0','0','0');
insert into `topic`(`post_id`,`sort`,`title`,`author`,`body`,`post_time`,`last_floor`,`last_reply_time`,`visible`,`enable_post`,`top`) values('51','1','hahaa','123','1、Q：如何成为高手？

A：成为一名真正的Android高手必须掌握和遵循的一些准则：

1）学会懒惰


　　　　ａDon\'t Reinvent the Wheel（不要重复发明轮子）。

　　　　ｂInventing the Wheel(发明轮子)。

　　　　ｃDon\'t Reinvent the Wheel（不要重复发明轮子）。','2013-05-22 17:12:11','0','2013-05-22 17:12:11','0','0','0');
insert into `topic`(`post_id`,`sort`,`title`,`author`,`body`,`post_time`,`last_floor`,`last_reply_time`,`visible`,`enable_post`,`top`) values('52','1','w','123','nihao
nihao','2013-05-22 17:12:54','1','2013-05-22 17:13:52','0','0','0');
insert into `topic`(`post_id`,`sort`,`title`,`author`,`body`,`post_time`,`last_floor`,`last_reply_time`,`visible`,`enable_post`,`top`) values('53','1','a','123','a
a
a','2013-05-22 17:14:46','6','2013-05-22 17:19:22','0','0','0');
insert into `topic`(`post_id`,`sort`,`title`,`author`,`body`,`post_time`,`last_floor`,`last_reply_time`,`visible`,`enable_post`,`top`) values('54','1','ad','123','ad.


add','2013-05-22 17:16:38','0','2013-05-22 17:16:38','0','0','0');
insert into `topic`(`post_id`,`sort`,`title`,`author`,`body`,`post_time`,`last_floor`,`last_reply_time`,`visible`,`enable_post`,`top`) values('55','1','awwww','123','<div>aaa
</div>','2013-05-22 17:19:57','1','2013-05-22 17:33:04','0','0','0');
insert into `topic`(`post_id`,`sort`,`title`,`author`,`body`,`post_time`,`last_floor`,`last_reply_time`,`visible`,`enable_post`,`top`) values('56','1','awwww','tea008','aaa\'\'\'\'\'\'a\'\'\'a\'a\'a\'a\'','2013-05-22 18:06:51','0','2013-05-22 18:06:51','0','0','0');
insert into `topic`(`post_id`,`sort`,`title`,`author`,`body`,`post_time`,`last_floor`,`last_reply_time`,`visible`,`enable_post`,`top`) values('57','4','毕设系统','tea008','毕设系统开了吗？ 毕设系统的密码忘记了怎么办','2013-05-22 18:08:04','0','2013-05-22 18:08:04','0','0','0');
insert into `topic`(`post_id`,`sort`,`title`,`author`,`body`,`post_time`,`last_floor`,`last_reply_time`,`visible`,`enable_post`,`top`) values('58','4','形势与政策实践在哪里选课','tea008','RT','2013-05-22 18:08:34','0','2013-05-22 18:08:34','0','0','0');
insert into `topic`(`post_id`,`sort`,`title`,`author`,`body`,`post_time`,`last_floor`,`last_reply_time`,`visible`,`enable_post`,`top`) values('59','4','关于多选的专业限选课的问题','tea008','按照教学计划的要求来看，我的限选课学分已经修够，这学期多选了两门限选课，如果挂掉，对毕业会有影响么？

挂掉多选的限选课，是不是只是说钱白扔了，不需要重修吧？','2013-05-22 18:08:59','0','2013-05-22 18:08:59','0','0','0');
insert into `topic`(`post_id`,`sort`,`title`,`author`,`body`,`post_time`,`last_floor`,`last_reply_time`,`visible`,`enable_post`,`top`) values('60','2','线性代数B补考在哪里','tea008','线性代数B补考地点在哪里，知道的麻烦说下','2013-05-22 18:09:31','1','2013-05-22 18:17:33','0','0','0');
insert into `topic`(`post_id`,`sort`,`title`,`author`,`body`,`post_time`,`last_floor`,`last_reply_time`,`visible`,`enable_post`,`top`) values('61','2','我的邮箱申请得了，为何在在登录时候总是说没有用户名呢？','tea008','我申请了本校的邮箱，已经申请下来了，为何在登录的时候总是显示用户名或密码错误，找回密码时却说没有用户名，很气愤，很无语，求速速解决~~~万分感谢~~~~','2013-05-22 18:09:52','0','2013-05-22 18:09:52','0','0','0');
insert into `topic`(`post_id`,`sort`,`title`,`author`,`body`,`post_time`,`last_floor`,`last_reply_time`,`visible`,`enable_post`,`top`) values('62','1','你好吗你好吗你好吗你好吗你好吗你好吗你好吗你好吗你好吗你好吗你好吗','tea008','玩玩','2013-05-22 18:23:27','0','2013-05-22 18:23:27','0','0','0');
insert into `topic`(`post_id`,`sort`,`title`,`author`,`body`,`post_time`,`last_floor`,`last_reply_time`,`visible`,`enable_post`,`top`) values('63','1','一卡通','tea008','为什么一卡通的自助刷卡购电进不去？','2013-05-22 18:25:44','1','2013-05-24 08:32:11','0','0','0');
insert into `topic`(`post_id`,`sort`,`title`,`author`,`body`,`post_time`,`last_floor`,`last_reply_time`,`visible`,`enable_post`,`top`) values('64','3','求职意向该怎么写？实例＋点评教你巧妙应对','tea008','例1

求职意向：

能吃苦耐劳，适应各个环境，要求能提供基本福利保障，签定正式合同协议，有发展空间。

点评：该求职意向其实什么也没写，看了让人不知所云，完全不知道求职者是在寻找一个什么样的工作，适合做些什么，都是一些空话。

例2

求职意向自我评估

本人五官端正。性格开朗乐观，在校期间努力学习，与同学及老师的关系很好，善于沟通交流，多次参加校内组织的志愿活动，富有爱心。为了不断完善自己，也积极投身于校外的实践活动，掌握一定的经验和知识。诚实进取，负责好学，喜欢创新，学习新的事物能力非常强，做事勤奋努力。不断完善自己，发挥自己特长的同时又尊重团队精神。以专业知识和社会交往能力以及发展自我为基础，寻求在各企事业单位咨询，文秘，策划编辑，文书，广播传媒，公关等相关文职。

点评：这是典型的学生简历中出现的问题，大段大段的关于自己的描述堆砌着一大堆好话套话空话，HR并不喜欢看到这样的描述，这是自己对自己的评价，带有很多的主观成分，求职意向直到最后才提到，很容易被忽略掉了。

优秀求职意向撰写实例

良好人际沟通技巧，做事耐心细致，欲求行政、助理类初级职位。

5年跨国公司人事经验，谋求跨国公司人事管理类岗位。

计算机软件开发，熟练掌握。asp、。net等语言','2013-05-22 18:26:33','0','2013-05-22 18:26:33','0','0','0');
insert into `topic`(`post_id`,`sort`,`title`,`author`,`body`,`post_time`,`last_floor`,`last_reply_time`,`visible`,`enable_post`,`top`) values('65','1','关于统计、核对2012年度拟奖励科研成果的通知','tea008','校内各单位：
根据《桂林电子科技大学科技奖励办法》（桂电科[2007]15号）、《关于修订<桂林电子科技大学科技奖励方法>部分条款的通知》（桂电科[2011]1号）、《关于重新修订<桂林电子科技大学科技奖励办法>部分条款的通知》（桂电科[2011]2号）、《关于修订<桂林电子科技大学科技奖励办法>第三章部分条款的通知》（桂电科[2012]1号）的规定，拟对2012年度符合奖励条件的各项成果进行奖励，请各单位按要求填写、核对《2012年科研成果清单》（附件1），并提供相应的支撑材料，具体要求如下：
1.  学校统一检索了2012年SCIE、CPCI-S（ISTP）、ISSHP和2011年SCI核心库收录的论文（附件2：论文检索结果.rar），请各单位根据论文检索结果，将本单位教师的论文基本信息填入《2012年科研成果清单》，作者姓名栏统一填写中文姓名，校内排名第一的作者加粗，支撑附件不用再提交，只需在备注栏标明论文检索的序号，如“Record 1 of 61”或“第 1 条，共 94 条”。如有遗漏，请按照本通知第7点要求提供相应支撑材料。
2、根据《关于修订<桂林电子科技大学科技奖励方法>部分条款的通知》（桂电科[2011]1号）的规定，学校实行对2011年SCI核心库收录论文影响因子（以发表刊物当年的影响因子为准）大于1的进行奖励，请各位教师将影响因子填入《2011年度SCI核心库收录一览表》，由学校统一检索确认。
3.  其他相关各数据库（SSCI等）、期刊收录、转载或发表的论文学校不作统一检索。请各单位自行检索后将论文基本信息填入《2012年科研成果清单》中，作者姓名栏统一填写中文姓名，校内排名第一的作者姓名加粗，并按照本通知第7点要求提供相应支撑材料。
4.  同时被多个数据库收录的论文只填写奖励级别最高的收录情况表，并在备注中注明被其他数据收录的情况，如一篇论文同时被SCIE和EI收录，则只填写SCIE收录情况表，并在备注中注明“同时被EI收录”。
5.  2012年符合奖励条件的学术专著、专利及软件著作权和科研成果获奖的清单已在《2012年科研成果清单》中列出，请各单位仔细核对。专利及软件著作权如有错漏，请填写《2012年科研成果清单》，并提交证书原件作为支撑材料。
6.  符合奖励条件而当年未奖励的，往前补到2010年（SCI核心论文可补','2013-05-22 18:35:12','0','2013-05-22 18:35:12','0','0','0');
insert into `topic`(`post_id`,`sort`,`title`,`author`,`body`,`post_time`,`last_floor`,`last_reply_time`,`visible`,`enable_post`,`top`) values('66','1','关于组织参加2013年全区专利代理人资格考试高校研究生培训班','tea008','校内各单位：

　　南宁市已被确定为2013年全国专利代理人资格考试的考点城市之一。根据国家专利代理人资格考试的最新政策，高等院校在读研究生可报名参加考试。为鼓励我校研究生参加全国专利代理人资格考试，学校将统一组织我校研究生参加在桂林市举办的2013年全区专利代理人资格考试高校研究生培训班（桂林班），现将有关事项通知如下：

　　一、时间和地点

　　培训班于6月5日至10日在桂林理工大学举办，上课地点：桂林理工大学屏风校区图书馆报告厅。

　　二、培训对象

　　高等学校在读硕士、博士研究生。非理工科研究生应已取得国家承认的理工科大专以上学历、获得毕业文凭或者学位证书，或者具有理工科大专以上同等学力。

　　三、授课教师及培训内容

　　聘请国家专利局及有关资深专家授课。授课老师聘请由自治区知识产权局负责。课程由自治区知识产权局统一安排，授课内容见附件1。

　　四、培训费用

　　培训费、资料费及学员午餐补贴等相关费用由自治区知识产权局承担。

　　五、报名要求

　　请有意参加本次培训并能坚持完成课程学习的同学填写报名回执（附件2），并于2013年5月29日之前将回执电子文档发送至以下邮箱：1667861666@qq.com，联系人：张福兴。本次培训班名额有限，我校可报人数为80名，培训名额将优先用于博士研究生、硕士研究生学习期满两年以及大学毕业两年以上的在读研究生。

 

　　全国专利代理人资格考试：国家知识产权举办的从事专利代理行业的职业资格考试，开始于1992年。全国专利代理人资格考试每年举行一次，一般在11月全国十几个考点城市同时进行。应试人员自取得某一部分成绩合格记录当年起三年内，两部分均合格的，由考核委员会办公室发出总成绩合格通知单。应试人员在收到总成绩合格通知单后向考核委员会提出申请，经审查符合《专利代理条例》有关规定的，由专利代理人考核委员会颁发“专利代理人资格证书”。

　　专利代理人：指获得了专利代理人资格，持有专利代理人工作证并在专利代理机构专职或兼职从事专利代理工作的人员。专利代理人受专利代理机构指派从事以下业务：
　　（1）为申请专利提供咨询；
　　（2）代理撰写专利申请文件、申请专利以及办理审批程序中的各种手续以及批准后的事务；
　　（3）代理专利申请的复审、专利权的撤','2013-05-22 18:37:13','0','2013-05-22 18:37:13','0','0','0');
insert into `topic`(`post_id`,`sort`,`title`,`author`,`body`,`post_time`,`last_floor`,`last_reply_time`,`visible`,`enable_post`,`top`) values('67','1','关于2013年高校教师资格认定报名的通知','tea008','相关单位及个人：
　　2013年教师资格认定报名工作已经开始，现将有关事项通知如下：
　　一、报名受理时间
　　高校教师资格认定个人网上报名时间为5月21日至5月24日，请拟申报高校教师资格认定且符合申报条件者到人事处（花江校区行政楼410）领取《教师资格认定申请表》2份、思想品德鉴定表1份等申请材料，并请登录网上报名系统进行网上报名，2013年5月24日下午5：30前将申报材料交人事处。
　　二、报名条件
    申请人必须是高校拟聘教师（含在职、聘用），并符合以下条件：
    1、遵守宪法和法律，热爱教育事业，具有良好的思想品德。
    2、具备《教师法》规定的合格学历。高校教师资格要求具有国民教育本科以上学历，其中博士需提供学位证；大学普通班，须进修一年以上本专业主干学科4门课程并取得及格以上成绩；境外学历需提供教育部留学服务中心学历学位认证书。
    3、普通话水平要求达到二级乙等以上，获副高以上职称或博士学位者此项不作要求。
    4、具有符合国家规定的从事教育教学工作的身体条件。要求在认定机构指定医院，按照教师资格认定体检标准体检，体检结论合格。
    5、取得教育理论考试和教学技能考试合格证书（副高以上职称或具有博士学位者除外）。
    三、报名办法及流程
    申请人登录中国教师资格网http://www.jszg.edu.cn ，或从广西教师教育网---全国教师资格认定信息管理入口进入报名网站，进行网上注册和填报申请人信息，具体步骤：
    (一)进入中国教师资格网站后，点击“未参加全国统考申请人网报入口”，再点击“未参加全国统考申请人注册”，进入网上申报流程。
    (二)“申报第一步 申报人必读”；
    (三)“申报第二步 确认服务条款”；
    (四)“申报第三步 选择认定机构”；
    “资格种类”请选择“高等学校教师资格”,“认定机构”请选择“广西壮族自治区教育厅”。
    (五)“申报第四步 选择确认点”；
      请选择申请人所在的学校。
    注：选择正确的“认定机构”和“确认点”是关键步骤，因选择“认定机构”和“确认点”不正确，会导致认定机构无法确认。
    (六)“申报第五步 阅读注意事项”；
    (七)“申报第六步 填写身份信息”；
    ','2013-05-22 18:50:08','0','2013-05-22 18:50:08','0','0','0');
insert into `topic`(`post_id`,`sort`,`title`,`author`,`body`,`post_time`,`last_floor`,`last_reply_time`,`visible`,`enable_post`,`top`) values('68','1','关于领先接触——第五届民用飞机先进制造技术及装备论坛的会议通知','tea008','校内各单位、各位老师：

　　“十二五”期间，我国的民机制造行业将迎来难得的战略机遇，提升创新能力仍是实现跨越发展的不竭动力。为进一步加强航空制造技术和装备的交流合作，促进自主创新，推进“十二五”期间民用飞机制造技术的快速发展，在成功举办四届论坛的基础上，中国机械工程学会、中国航空学会将于2013年6月5日-8日日共同举办“领先接触——第五届民用飞机先进制造技术及装备论坛”。

　　组织机构：
　　主办：中国机械工程学会 中国航空学会
　　承办：北京高博特广告有限公司（高博特军工网）

　　联系方式：

　　中国机械工程学会
　　联系人：袁俊瑞 电 话：010-68799027

　　中国航空学会
　　联系人：肇晓兰 电 话：010-84924389

　　北京高博特广告有限公司（高博特军工网） 
　　联系人：吴琼 18211001530 谈珮钦13311060917
　　电 话： 010-88587506/07 传 真：010-88587416
　　E-mail：gobetter2002＠126.com

　　有意参会的老师，请于5月20日之前与主办方联系报名事宜。','2013-05-22 18:50:37','0','2013-05-22 18:50:37','0','0','0');
insert into `topic`(`post_id`,`sort`,`title`,`author`,`body`,`post_time`,`last_floor`,`last_reply_time`,`visible`,`enable_post`,`top`) values('69','1','关于组织申报第二批企业专利特派员的通知','tea008','校内各单位、各位老师：

　　第二批企业专利特派员申报工作已经开始，现广西知识产权局《关于组织申报第二批企业专利特派员的通知》（桂知管字[2013]17号）转发给你们，并将有关事项通知如下：

　　一、申报条件

　　在专利服务机构或高等学校、科研院所从事专利工作两年以上，具有较高的专利创造、运用、保护和管理能力，能胜任专利培训、代理和分析服务工作，年龄不超过60周岁。

　　二、工作内容

　　专利特派员将通过咨询、培训、代理等对口帮扶服务方式指导企业开展知识产权工作，扫除“零”发明专利申请，贯彻《企业知识产权管理规范》，培育知识产权优势企业。 广西知识产权局将以项目形式支持专利特派员与帮扶服务企业开展工作。

　　三、申报要求

　　请有意申报的老师填写《第二批企业专利特派员申报表》（附件2）和《第二批企业专利特派员申报汇总表》（附件3），并于2013年5月29日下班前将上述表格电子文档发送至科技处邮箱：zhuanli@guet.edu.cn。

　　未尽事宜，请联系科技处。

　　联系电话：2290805。','2013-05-22 18:51:10','0','2013-05-22 18:51:10','0','0','0');
insert into `topic`(`post_id`,`sort`,`title`,`author`,`body`,`post_time`,`last_floor`,`last_reply_time`,`visible`,`enable_post`,`top`) values('70','2','关于转发区科技厅《更新广西自然科学基金项目评估咨询专家库》的','tea008','各有关单位及老师：
　　现将区科技厅《更新广西自然科学基金项目评估咨询专家库》的通知转发给你们，请于2013年6月23号前在网上提交！
关于更新广西自然科学基金项目评估咨询专家库的通知
为适应广西自然科学基金项目管理的形势与要求，更好发挥各行业、各领域专家的作用，做好广西自然科学基金项目立项评估工作，我厅决定对广西自然科学基金项目评估咨询专家库进行充实更新。具体要求如下。
一、已入库专家的个人信息更新
对于已获得入库专家证书的专家，如果同意继续作为评估专家参加区内、区外（广东、云南、湖南等省市）的自然科学基金项目评估，请登录专家库更新个人信息（联系方式、近来所获得科研项目、专利、成果、论文、著作等情况）。
二、征集新的专业人员进入专家库
广西自然科学基金项目评估专家库专家采取个人自荐、单位推荐、科技厅审定相结合的方法进行管理。
（一）个人填报信息。
1.新增入库专家必须具备的资格条件。
（1）在广西区内工作，受聘于广西的法人单位、在职在岗人员；
（2）遵守法律，恪守科学道德，学风端正严谨，熟悉国家和广西科技方针，熟悉本行业科技发展动态，具有高度责任感和事业心，有良好的职业道德和科学素养，能够独立、客观、公正、实事求是地提出评价意见；
（3）曾主持过省部级以上基础研究项目，均已实施，或正式通过验收、结题；
（4）具有副高及以上专业技术职称或博士学位；
（5）具有一定的计算机操作能力，在精力和时间上能够保证参加评审的相关工作和活动；
（6）年龄不超过60周岁（对享受国务院政府津贴或自治区优秀专家、博士生导师可放宽至65周岁，两院院士年龄不限）；
（7）无不良科技信用记录。
2.登录广西科技项目评估咨询专家库（http://www.gxkfy.cn），点击“专家注册”，填写个人相关信息，截止时间为2013年6月23日。
未尽事宜请拨打电话：0773-2290811。','2013-05-22 18:51:36','0','2013-05-22 18:51:36','0','0','0');
insert into `topic`(`post_id`,`sort`,`title`,`author`,`body`,`post_time`,`last_floor`,`last_reply_time`,`visible`,`enable_post`,`top`) values('71','1','关于转发区科技厅《关于开展2013年度广西科技计划软科学研究课题申报的通知》的通知','tea008','校内各单位、个人：
 
2013年度广西科技计划软科学研究课题已开始申报，现将科技厅《关于开展2013年度广西科技计划软科学研究课题申报的通知》转发，请有意申报的老师认真阅读通知内容，按要求网上填写课题申报书，。
“广西科技计划业务管理信息系统”（网址:kjxm.gxsti.net），在“项目申报”菜单下，点击“新增项目”项，选择好申报年度（2013）后点击“创建”按钮，项目名称选择“软科学研究项目”后即可填写网上申报书（格式见附件），同时上传可行性报告（格式要求等请详见附件中的申报通知）。
请各申报者在5月14日中午前完成网上申报，经科技处审核后在线打印申报书一式2份（A4纸打印）交到科技处人文社科项目管理科。首次申报的老师请于5月8日前致电科技处人文社科室（2290810），索要填报系统所需的账号密码。
未尽事宜，请致电0773-2290810！
 
 
 
附件：1、关于开展2013年度广西科技计划软科学研究课题申报的通知
      　　2、2013广西科学研究与技术开发计划软科学研究项目申报书','2013-05-22 18:52:01','0','2013-05-22 18:52:01','0','0','0');
insert into `topic`(`post_id`,`sort`,`title`,`author`,`body`,`post_time`,`last_floor`,`last_reply_time`,`visible`,`enable_post`,`top`) values('72','2','关于2013年高等学校教师资格教学技能考试安排的通知','tea008','各相关单位及个人： 
　　2013年参加高等学校教师资格教学技能考试报名已经结束，现将考试安排及有关事宜通知如下： 
　　一、教学技能考试地点和时间： 
　　南宁点：广西师范学院明秀校区，2013年5月4日、5日全天。
　　桂林点：广西师范大学育才校区，2013年5月4日全天。
　　二、参加教学技能考试人员应提供以下材料： 
　　(一)教案一式3份（用标准A4纸打印，尺寸为210毫米×297毫米,并写上讲课人的名字）及与教学技能考试教材内容对应的有关章节的复印件，在考试时直接交给各学科组专家； 
　　(二)出示符合教学技能考试要求的合格教材(必须是高等学校本、专科生的教材，不得使用中专教材或其他非高等教育层次的教材)，否则视为不合格。 
　　(三)申请人在教学技能考试时应交验身份证原件，没有身份证的提交单位证明及有效证件。 
　　三、考点提供下列教学设备： 
　　(一)普通教室：黑板、粉笔； 
　　(二)音乐专业教室备有钢琴； 
　　(三)体育专业（室外）备有足球、篮球等常见体育器械； 
　　(四)考试点没有准备的教学设备，比如收录音机、CD机等，如有需要，请参加考试人员自备。 
　　四、其它注意事项： 
　　(一)不能使用课件，不提供多媒体教室； 
　　(二)外语类专业提交的教案必须使用外语书写，外语类专业一律用外语进行应试，非外语类专业一律用普通话进行应试； 
　　(三)不安排学生旁听。 
　　(四)参加教学技能考试的申请人签到时间（迟到自误）：
　　南宁点：
　　4号上午报到时间为9：20，下午报到时间为14：10；
　　5号上午报到时间为7：40，下午报到时间为14：10；
　　桂林点：
　　4号上午报到时间为8：10，下午报到时间为14：10。
　　五、教学技能考试点地址及联系电话： 
　　(一)广西师范学院明秀校区，地址：南宁市明秀东路175号，联系电话：0771-3908956，3908854。
　　(二)广西师范大学育才校区，地址：桂林市育才路15号，联系电话：0773-5846403，5843267 
　 
　　请报名教学技能考试人员按时参加考试，并对公布的名单进行核对，如有误请及时反馈,以便更正。联系电话：2291258。','2013-05-22 18:52:32','0','2013-05-22 18:52:32','0','0','0');
insert into `topic`(`post_id`,`sort`,`title`,`author`,`body`,`post_time`,`last_floor`,`last_reply_time`,`visible`,`enable_post`,`top`) values('73','1','关于桂林市华杰专利商标事务所延长到校现场办公时间的通知','tea008','校内各单位有关人员：
　　桂林市华杰专利商标事务所从2012年5月开始派专人到我校现场办公，提供专利申请代理及其他相关知识产权服务，为我校师生申请专利及其他知识产权提供了极大便利。为更好地为服务师生员工，事务所决定延长在校办公时间，具体安排通知如下：

　　现场办公地点：金鸡岭校区第二教学楼2204室。

　　现场办公时间：每周一、三、五上午9：00－12：00，

　　　　　　　　　每周一、三下午2：30－5：00。

　　办公电话：291261（金鸡岭校区）

　　联系人：白工（13907736781）
　　　　　　刘副所长（18507837198）

　　邮箱地址：huajie45112@vip.126.com

　　

附：桂林市华杰专利商标事务所简介
　　桂林市华杰专利商标事务所是一家同时具有专利代理、计算机软件著作权登记、商标代理资质的代理机构，发明专利授权率这几年一直位于广西第一，本所坚持以诚为本，客户利益为已任的服务宗旨，为国内客户提供优质的专利、计算机软件著作权登记、商标代理服务，同时还为美国、日本、香港、台湾等国家和地区的客户代理了多项专利申请，得到好评。
　　事务所拥有一批具有高级工程师、工程师职称的专利商标代理精英，多人从事专利代理工作20年以上，其中5人荣获国家知识产权局2010年颁发的“为表彰长期以来为我国专利工作和知识产权事业作出贡献”和中华全国代理人协会2008年颁发的“为我国专利代理事业做出重要贡献”的荣誉证书。2013年我所资深专利代理人巢雄辉荣获广西唯一一个“全国专利代理行业专利申请文件撰写类型高层次人才”，全国仅有35人获此殊荣。
　　事务所所长罗玉荣女士，从事专利代理和科技管理工作长达25年，曾任桂林市专利事务所第一任所长，代理专利和审理专利几千件以上，并在知识产权业内具有丰富的人脉资源。','2013-05-22 18:53:01','0','2013-05-22 18:53:01','0','0','0');
insert into `topic`(`post_id`,`sort`,`title`,`author`,`body`,`post_time`,`last_floor`,`last_reply_time`,`visible`,`enable_post`,`top`) values('74','1','关于开展2013年自治区企业科技特派员认定工作的通知','tea008','各有关单位及教师：
    现将“关于开展2013年自治区企业科技特派员认定工作的通知”转发给您们，请有意向申报的老师于4月15号前将相关材料（按照文件通知要求）交到科技处理工科。
  
关于开展2013年自治区企业科技特派员
认定工作的通知
各市科技局，各有关高校、科研院所及有关单位：
为进一步加强企业科技服务和科技人员企业创业工作，按照《广西科技特派员管理暂行办法》（桂科政字〔2009〕122号）规定和2013年全区科技工作会议部署，决定开展2013年自治区企业科技特派员的认定工作。现将有关事项通知如下。
一、申请认定范围
（一）自愿服务于广西企业科技工作，为提升企业自主创新能力和竞争力，开展企业技术发展战略研究、推动产学研合作、参与企业新技术和新产品研发、共建企业技术创新平台、培养企业研发团队、完善企业技术创新体系等方面服务，有企业科技工作相关专业特长、实践经验丰富的个人、团队和企事业单位，均可申请认定为企业科技特派员。
（二）企业科技特派员分为法人科技特派员和个人科技特派员两类。法人科技特派员由高校、科研院所、学会、企事单位组织本单位专业技术人员3人以上，以单位名义开展创新创业和科技服务；个人科技特派员以个人身份开展创新创业和科技服务。
（三）曾列入自治区企业科技特派员且聘任期已过的单位和个人，如需继续从事企业科技特派员工作，需按本通知要求重新申请认定。
二、申请认定条件
（一）申请个人身体健康，具备一定政治素质，作风踏实，有创业积极性。
（二）申请个人具有一定的专业特长和专业技能以及科技成果应用推广经验。
（三）申请个人年龄原则上不超过58周岁。
（四）具有专利技术、发明成果或副高以上职称、博士学位的科技人员，或与服务对象结成利益共同体的科技人员，可优先选派为企业科技特派员。
（五）主动为高新技术产业开发区、高新技术特色产业化基地、工业领域产业技术创新战略联盟、高新技术企业，在培育高新技术企业、各级工程技术研究中心依托单位、各级孵化器在孵或毕业企业提供服务的科技人员可优先选派为企业科技特派员。
三、申请程序及要求
（一）申请人（或单位）按要求填写“广西壮族自治区企业科技特派员申请表”（附件1），并与服务对象签订《广西壮族自治区企业科技特派员派驻协议书》（附件2）。派出单位审核签章后于2013年4月15日前报送推荐单位。','2013-05-22 18:53:31','0','2013-05-22 18:53:31','0','0','0');
insert into `topic`(`post_id`,`sort`,`title`,`author`,`body`,`post_time`,`last_floor`,`last_reply_time`,`visible`,`enable_post`,`top`) values('75','1','关于开展2013年自治区企业科技特派员认定工作的通知','tea008','各有关单位及教师：
    现将“关于开展2013年自治区企业科技特派员认定工作的通知”转发给您们，请有意向申报的老师于4月15号前将相关材料（按照文件通知要求）交到科技处理工科。
  
关于开展2013年自治区企业科技特派员
认定工作的通知
各市科技局，各有关高校、科研院所及有关单位：
为进一步加强企业科技服务和科技人员企业创业工作，按照《广西科技特派员管理暂行办法》（桂科政字〔2009〕122号）规定和2013年全区科技工作会议部署，决定开展2013年自治区企业科技特派员的认定工作。现将有关事项通知如下。
一、申请认定范围
（一）自愿服务于广西企业科技工作，为提升企业自主创新能力和竞争力，开展企业技术发展战略研究、推动产学研合作、参与企业新技术和新产品研发、共建企业技术创新平台、培养企业研发团队、完善企业技术创新体系等方面服务，有企业科技工作相关专业特长、实践经验丰富的个人、团队和企事业单位，均可申请认定为企业科技特派员。
（二）企业科技特派员分为法人科技特派员和个人科技特派员两类。法人科技特派员由高校、科研院所、学会、企事单位组织本单位专业技术人员3人以上，以单位名义开展创新创业和科技服务；个人科技特派员以个人身份开展创新创业和科技服务。
（三）曾列入自治区企业科技特派员且聘任期已过的单位和个人，如需继续从事企业科技特派员工作，需按本通知要求重新申请认定。
二、申请认定条件
（一）申请个人身体健康，具备一定政治素质，作风踏实，有创业积极性。
（二）申请个人具有一定的专业特长和专业技能以及科技成果应用推广经验。
（三）申请个人年龄原则上不超过58周岁。
（四）具有专利技术、发明成果或副高以上职称、博士学位的科技人员，或与服务对象结成利益共同体的科技人员，可优先选派为企业科技特派员。
（五）主动为高新技术产业开发区、高新技术特色产业化基地、工业领域产业技术创新战略联盟、高新技术企业，在培育高新技术企业、各级工程技术研究中心依托单位、各级孵化器在孵或毕业企业提供服务的科技人员可优先选派为企业科技特派员。
三、申请程序及要求
（一）申请人（或单位）按要求填写“广西壮族自治区企业科技特派员申请表”（附件1），并与服务对象签订《广西壮族自治区企业科技特派员派驻协议书》（附件2）。派出单位审核签章后于2013年4月15日前报送推荐单位。','2013-05-22 18:53:42','0','2013-05-22 18:53:42','0','0','0');
insert into `topic`(`post_id`,`sort`,`title`,`author`,`body`,`post_time`,`last_floor`,`last_reply_time`,`visible`,`enable_post`,`top`) values('76','1','关于开展2013年自治区企业科技特派员认定工作的通知2','tea008','各有关单位及教师：
    现将“关于开展2013年自治区企业科技特派员认定工作的通知”转发给您们，请有意向申报的老师于4月15号前将相关材料（按照文件通知要求）交到科技处理工科。
  
关于开展2013年自治区企业科技特派员
认定工作的通知
各市科技局，各有关高校、科研院所及有关单位：
为进一步加强企业科技服务和科技人员企业创业工作，按照《广西科技特派员管理暂行办法》（桂科政字〔2009〕122号）规定和2013年全区科技工作会议部署，决定开展2013年自治区企业科技特派员的认定工作。现将有关事项通知如下。
一、申请认定范围
（一）自愿服务于广西企业科技工作，为提升企业自主创新能力和竞争力，开展企业技术发展战略研究、推动产学研合作、参与企业新技术和新产品研发、共建企业技术创新平台、培养企业研发团队、完善企业技术创新体系等方面服务，有企业科技工作相关专业特长、实践经验丰富的个人、团队和企事业单位，均可申请认定为企业科技特派员。
（二）企业科技特派员分为法人科技特派员和个人科技特派员两类。法人科技特派员由高校、科研院所、学会、企事单位组织本单位专业技术人员3人以上，以单位名义开展创新创业和科技服务；个人科技特派员以个人身份开展创新创业和科技服务。
（三）曾列入自治区企业科技特派员且聘任期已过的单位和个人，如需继续从事企业科技特派员工作，需按本通知要求重新申请认定。
二、申请认定条件
（一）申请个人身体健康，具备一定政治素质，作风踏实，有创业积极性。
（二）申请个人具有一定的专业特长和专业技能以及科技成果应用推广经验。
（三）申请个人年龄原则上不超过58周岁。
（四）具有专利技术、发明成果或副高以上职称、博士学位的科技人员，或与服务对象结成利益共同体的科技人员，可优先选派为企业科技特派员。
（五）主动为高新技术产业开发区、高新技术特色产业化基地、工业领域产业技术创新战略联盟、高新技术企业，在培育高新技术企业、各级工程技术研究中心依托单位、各级孵化器在孵或毕业企业提供服务的科技人员可优先选派为企业科技特派员。
三、申请程序及要求
（一）申请人（或单位）按要求填写“广西壮族自治区企业科技特派员申请表”（附件1），并与服务对象签订《广西壮族自治区企业科技特派员派驻协议书》（附件2）。派出单位审核签章后于2013年4月15日前报送推荐单位。','2013-05-22 18:53:50','0','2013-05-22 18:53:50','0','0','0');
insert into `topic`(`post_id`,`sort`,`title`,`author`,`body`,`post_time`,`last_floor`,`last_reply_time`,`visible`,`enable_post`,`top`) values('77','1','关于征集广西国防军工计量工作论文的通知1','tea008','校内各单位、各位老师：

　　广西国防军工计量工作论文征集工作现已开始，请有意报送论文的老师于3月25日前与科技处联系，以便查看相关文件及准备材料。

　　联系电话：2290805。','2013-05-22 18:54:12','0','2013-05-22 18:54:12','0','0','0');
insert into `topic`(`post_id`,`sort`,`title`,`author`,`body`,`post_time`,`last_floor`,`last_reply_time`,`visible`,`enable_post`,`top`) values('78','1','关于征集广西国防军工计量工作论文的通知2','tea008','校内各单位、各位老师：

　　广西国防军工计量工作论文征集工作现已开始，请有意报送论文的老师于3月25日前与科技处联系，以便查看相关文件及准备材料。

　　联系电话：2290805。','2013-05-22 18:54:24','0','2013-05-22 18:54:24','0','0','0');
insert into `topic`(`post_id`,`sort`,`title`,`author`,`body`,`post_time`,`last_floor`,`last_reply_time`,`visible`,`enable_post`,`top`) values('79','1','关于征集广西国防军工计量工作论文的通知3','tea008','校内各单位、各位老师：

　　广西国防军工计量工作论文征集工作现已开始，请有意报送论文的老师于3月25日前与科技处联系，以便查看相关文件及准备材料。

　　联系电话：2290805。','2013-05-22 18:54:31','0','2013-05-22 18:54:31','0','0','0');
insert into `topic`(`post_id`,`sort`,`title`,`author`,`body`,`post_time`,`last_floor`,`last_reply_time`,`visible`,`enable_post`,`top`) values('80','1','关于征集广西国防军工计量工作论文的通知4','tea008','校内各单位、各位老师：

　　广西国防军工计量工作论文征集工作现已开始，请有意报送论文的老师于3月25日前与科技处联系，以便查看相关文件及准备材料。

　　联系电话：2290805。','2013-05-22 18:54:39','0','2013-05-22 18:54:39','0','0','0');
insert into `topic`(`post_id`,`sort`,`title`,`author`,`body`,`post_time`,`last_floor`,`last_reply_time`,`visible`,`enable_post`,`top`) values('81','1','关于征集广西国防军工计量工作论文的通知5','tea008','校内各单位、各位老师：

　　广西国防军工计量工作论文征集工作现已开始，请有意报送论文的老师于3月25日前与科技处联系，以便查看相关文件及准备材料。

　　联系电话：2290805。','2013-05-22 18:54:46','0','2013-05-22 18:54:46','0','0','0');
insert into `topic`(`post_id`,`sort`,`title`,`author`,`body`,`post_time`,`last_floor`,`last_reply_time`,`visible`,`enable_post`,`top`) values('82','1','关于征集广西国防军工计量工作论文的通知6','tea008','校内各单位、各位老师：

　　广西国防军工计量工作论文征集工作现已开始，请有意报送论文的老师于3月25日前与科技处联系，以便查看相关文件及准备材料。

　　联系电话：2290805。','2013-05-22 18:54:54','0','2013-05-22 18:54:54','0','0','0');
insert into `topic`(`post_id`,`sort`,`title`,`author`,`body`,`post_time`,`last_floor`,`last_reply_time`,`visible`,`enable_post`,`top`) values('83','1','关于征集广西国防军工计量工作论文的通知7','tea008','校内各单位、各位老师：

　　广西国防军工计量工作论文征集工作现已开始，请有意报送论文的老师于3月25日前与科技处联系，以便查看相关文件及准备材料。

　　联系电话：2290805。','2013-05-22 18:55:01','0','2013-05-22 18:55:01','0','0','0');
insert into `topic`(`post_id`,`sort`,`title`,`author`,`body`,`post_time`,`last_floor`,`last_reply_time`,`visible`,`enable_post`,`top`) values('84','1','关于征集广西国防军工计量工作论文的通知8','tea008','校内各单位、各位老师：

　　广西国防军工计量工作论文征集工作现已开始，请有意报送论文的老师于3月25日前与科技处联系，以便查看相关文件及准备材料。

　　联系电话：2290805。','2013-05-22 18:55:07','0','2013-05-22 18:55:07','0','0','0');
insert into `topic`(`post_id`,`sort`,`title`,`author`,`body`,`post_time`,`last_floor`,`last_reply_time`,`visible`,`enable_post`,`top`) values('85','1','关于征集广西国防军工计量工作论文的通知9','tea008','校内各单位、各位老师：

　　广西国防军工计量工作论文征集工作现已开始，请有意报送论文的老师于3月25日前与科技处联系，以便查看相关文件及准备材料。

　　联系电话：2290805。','2013-05-22 18:55:15','0','2013-05-22 18:55:15','0','0','0');
insert into `topic`(`post_id`,`sort`,`title`,`author`,`body`,`post_time`,`last_floor`,`last_reply_time`,`visible`,`enable_post`,`top`) values('86','1','关于征集广西国防军工计量工作论文的通知10','tea008','校内各单位、各位老师：

　　广西国防军工计量工作论文征集工作现已开始，请有意报送论文的老师于3月25日前与科技处联系，以便查看相关文件及准备材料。

　　联系电话：2290805。','2013-05-22 18:55:22','0','2013-05-22 18:55:22','0','0','0');
insert into `topic`(`post_id`,`sort`,`title`,`author`,`body`,`post_time`,`last_floor`,`last_reply_time`,`visible`,`enable_post`,`top`) values('87','1','关于征集广西国防军工计量工作论文的通知11','tea008','校内各单位、各位老师：

　　广西国防军工计量工作论文征集工作现已开始，请有意报送论文的老师于3月25日前与科技处联系，以便查看相关文件及准备材料。

　　联系电话：2290805。','2013-05-22 18:55:28','0','2013-05-22 18:55:28','0','0','0');
insert into `topic`(`post_id`,`sort`,`title`,`author`,`body`,`post_time`,`last_floor`,`last_reply_time`,`visible`,`enable_post`,`top`) values('88','4','关于组织申报第十五届中国专利奖的通知','tea008','校内各单位、各位老师：

　　第十五届中国专利奖申报工作已经开始，现将广西知识产权局《关于组织申报第十五届中国专利奖的通知》（桂知管字〔2013〕3号）转发给你们，并就有关事宜通知如下：

　　1.申报项目以有效发明专利为主。

　　2.请有意申报该奖项的专利发明人按照通知要求准备参评项目材料并于3月7日前将申报材料电子文档发至科技处邮箱：kejichu@guet.edu.cn，同时将申报书原件以及专利证书复印件、项目应用证明等其他材料的纸件一式两份交至科技处办公室。

　　3.学校将根据教育厅分配的名额数量，选择合适的项目推荐至教育厅，具体择优标准如下：以有效发明专利为主，以发明创造水平高和取得较大经济效益为选择标准，重点推荐已解决本行业本领域重要技术难题并取得重大经济效益的项目，通过加强专利运用和保护有效扩大市场份额的项目，获国外专利授权的项目。

　　未尽事宜，请联系科技处。','2013-05-22 18:56:30','1','2013-05-29 09:33:02','0','0','0');
insert into `topic`(`post_id`,`sort`,`title`,`author`,`body`,`post_time`,`last_floor`,`last_reply_time`,`visible`,`enable_post`,`top`) values('89','3','关于转发中国科协《关于举办第十五届中国科协年会的通知》的通知','tea008','校内各单位、个人：
根据自治区科协通知要求，现将中国科协《关于举办第十五届中国科协年会的通知》转发给你们，请按照通知要求撰写论文参加年会于2013年3月12日前将报名表电子档发至kejichu@guet.edu.cn, 同时报送报名表、论文的电子版和纸质材料至相应专题分会场组织单位（见附件）。
未尽事宜，请致电2290810！
附件：关于举办第十五届中国科协年会的通知
 
            科技处
         2013年3月8日','2013-05-22 18:56:50','2','2013-05-28 22:19:52','0','0','0');
