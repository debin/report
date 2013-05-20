<html>
<head>
<link rel="stylesheet" type="text/css" href="./static/css/global.css"></link>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div class="sep3"></div>
	<div
		style="margin-left: auto; margin-right: auto; min-width: 960px; text-align: center;">
		<ul class="heng">
			<li><a href="./index.php">首页</a></li>
			<li><a href="./bbs.php">讨论区</a></li>
			<li><a href="./report.php">实验报告管理</a></li>
			<li><a href="about_center.php">中心概括</a></li>
			<?php
			session_start ();
			if (! isset ( $_SESSION ['user'] ) || NULL == $_SESSION ['user']) {
				echo "<li><a href='./login.php'>登陆</a></li>";
			} else {
				echo "<li><a href='./login.php?action=logout'>退出</a></li>";
			}
			?>
		</ul>
	</div>

<!--中心介绍-->
	<div style="margin-left: 200px;">
		<div style="float: left; width: 250px; height: 330px;">
			<div style="text-align: center; background-color: rgb(204, 204, 255)">
				<span><strong>中心介绍</strong></span>
			</div>
			<p class="white" style="margin-top: 1px;">   
				桂林电子科技大学的计算机学科始建于1980年，是全国高校中较早开办计算机及应用专业的学校之一。2000年学校在体制改革中，为了加强计算机基础实验课程建设，通过对全校各系相关专业的计算机实验室进行重新整合成立了校级计算机基础实验教学中心。中心现有基础课程实
				验室8个，并设有一个软件设计训练基地、一个大学生创新基地、一个软件开发基...</p>

		</div>

<!--友情链接-->
		<div style="clear: both; float: left; width: 250px; height: 250px;">
			<div style="text-align: center; background-color: rgb(204, 204, 255)">
				<span><strong>友情链接</strong></span>
			</div>
			<ul
				style="list-style: none; font-size: 18px; margin: 0px; padding: 0px;">
				<li><a href="http://www.guet.edu.cn/">桂林电子科技大学</a></li>
				<li><a href="http://w5.guet.edu.cn/jxsjb/">桂电教学实践部</a></li>
				<li><a href="http://szhxy.guet.edu.cn/qxgl/">桂电数字化校园</a></li>
				<li><a href="http://lib.gliet.edu.cn/">桂林电子科技大学图书馆</a></li>
				<li><a href="http://202.117.58.254/ctec/">西安交大计算机实验中心</a></li>
			</ul>
		</div>


<!--教学资源-->
		<div
			style="float: left; width: 250px; height: 250px; margin-left: 5px;">
			<div style="text-align: center; background-color: rgb(204, 204, 255)">
				<span><strong>教学资源</strong></span>
			</div>
			<ul
				style="list-style: none; font-size: 18px; margin: 0px; padding: 0px;">
				<li><a href="http://www.guet.edu.cn/">数据结构课程网站</a></li>
				<li><a href="http://w5.guet.edu.cn/jxsjb/">大学计算机基础PBL网络课堂</a></li>
				<li><a href="http://szhxy.guet.edu.cn/qxgl/">算法分析与设计课程网站</a></li>
				<li><a href="http://lib.gliet.edu.cn/">电子商务课程网站</a></li>
				<li><a href="http://202.117.58.254/ctec/">桂电blackboar教学平台</a></li>
				<li><a href="http://202.117.58.254/ctec/">程序设计训练基地</a></li>
				<li><a href="http://202.117.58.254/ctec/">大学生创新实践基地</a></li>
			</ul>
		</div>

		<div
			style="float: left; width: 250px; height: 250px; margin-left: 0px;">
			<div style="text-align: center; background-color: rgb(204, 204, 255)">
				<span><strong>-</strong></span>
			</div>
			<ul
				style="list-style: none; font-size: 18px; margin: 0px; padding: 0px;">
				<li><a href="http://www.guet.edu.cn/">桂电教育在线</a></li>
				<li><a href="http://w5.guet.edu.cn/jxsjb/">计算机中心教学资源网站</a></li>
				<li><a href="http://szhxy.guet.edu.cn/qxgl/">oracle数据库基础教学网站</a></li>
				<li><a href="http://lib.gliet.edu.cn/">网页设计学习网站</a></li>
				<li><a href="http://202.117.58.254/ctec/">在线教学过程登记表</a></li>
				<li><a href="http://202.117.58.254/ctec/">校级程序设计大赛(校内）</a></li>
			</ul>
		</div>

		<!--网络服务-->
		<div
			style="float: left; width: 250px; height: 250px; margin-left: 5px;">
			<div style="text-align: center; background-color: rgb(204, 204, 255)">
				<span><strong>网络服务</strong></span>
			</div>
			<ul
				style="list-style: none; font-size: 18px; margin: 0px; padding: 0px;">
				<li><a href="http://www.guet.edu.cn/">实验教学信息管理系统</a></li>
				<li><a href="http://w5.guet.edu.cn/jxsjb/">教师网络化办公系统</a></li>
				<li><a href="http://szhxy.guet.edu.cn/qxgl/">实验预约系统</a></li>
				<li><a href="http://lib.gliet.edu.cn/">计算机中心教学BBS</a></li>
				<li><a href="http://202.117.58.254/ctec/">计算机一级等级考试样卷库</a></li>
				<li><a href="http://202.117.58.254/ctec/">学习互助中心</a></li>
				<li><a href="http://202.117.58.254/ctec/">程序在线智能测评系统</a></li>
				<li><a href="http://202.117.58.254/ctec/">Android开发团队</a></li>
			</ul>
		</div>


	</div>



	<div></div>


	<div style="clear: both; text-align: center;">
		<hr />
2013 By 梁德斌
<?php
if (isset ( $_SESSION ['user'] ) && NULL != $_SESSION ['user']) {
	echo "<div style='float:right;'>";
	echo "你的身份是:{$_SESSION['user']['type']}&nbspID为:{$_SESSION['user']['id']}";
	echo "</div>";
}
?>
	</div>

</body>
</html>
