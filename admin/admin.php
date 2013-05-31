<?php session_start ();?>
<?php 
/*名称：管理员端系统管理首页
 * 作用：显示功能列表，响应用户点击请求
 */
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link rel="stylesheet" type="text/css" href="../static/css/global.css"></link>
<script type="text/javascript" src="../static/jquery/jquery-1.8.3.js"></script>
</head>
<body>
<?php
// 判断用户身份
if (! isset ( $_SESSION ['user'] ) || NULL == $_SESSION ['user']) {
	echo '你还没有登陆，请先登陆<br /><br />';
	echo "<a href='../login.php'>立即登陆</a>";
	die ();
}
if ('admin' != $_SESSION ['user'] ['type']) {
	echo '非管理员身份不可登陆<br /><br />';
	echo "<a href='../index.php'>回到首页</a>";
	die ();
}

?>

<div
		style="background-image: url(../static/image/topback.jpg); width: 1024px; height: 80px; margin-left: auto; margin-right: auto;"></div>
	<div class="sep3"></div>

	<!-- 导航条 -->
	<div
		style="margin-left: auto; margin-right: auto; min-width: 960px; text-align: center;">
		<ul class="heng" style="margin-top: 10px; margin-bottom: 5px;">
			<li><a href="../index.php">首页</a></li>
			<li><a href="../bbs.php">讨论区</a></li>
			<li><a href="../report.php">实验报告管理</a></li>
			<li><a href="../about_center.php">中心概括</a></li>
			<?php
			// session_start();
			if (! isset ( $_SESSION ['user'] ) || NULL == $_SESSION ['user']) {
				echo "<li><a href='../login.php'>登陆</a></li>";
			} else {
				
				echo "<li><a href='../login.php?action=logout'>退出</a></li>";
			}
			?>


		</ul>
	</div>


	<div class='sep3'></div>
	<div style="min-width: 1024px;">
		<!-- 左栏功能列表 -->
		<div style="float: left; width: 230;">
			<ul style="list-style: none;">
				<li>个人信息管理
					<ul style="list-style: none;">
						<li><a id="update_info" class='menu' href="#">个人信息</a></li>
						<li><a id="update_psw" class='menu' href="#">密码维护</a></li>
					</ul>
				</li>

				<li>学生与教师管理
					<ul style="list-style: none;">
						<li><a id="stu" class='menu' href="#">学生信息维护</a></li>
						<li><a id="tea" class='menu' href="#">教师信息维护</a></li>
					</ul>
				</li>

				<li>课程管理
					<ul style="list-style: none;">
						<li><a id="view_course" class='menu' href="#">查看课程</a></li>
						<li><a id="insert_course" class='menu' href="#">新添课程</a></li>
					</ul>
				</li>


				<li>成绩管理
					<ul style="list-style: none;">
						<li><a id="view_mark" class='menu' href="#">查看成绩</a></li>
					</ul>
				</li>

				<li>帖子管理
					<ul style="list-style: none;">
						<li><a id="post_manage" class='menu' href="#">帖子管理</a></li>
						<li><a id="post_sort" class='menu' href="#">分类管理</a></li>
					</ul>
				</li>

				<li>系统管理
					<ul style="list-style: none;">
						<li><a id="submit" class='menu' href="#">权限管理</a></li>
						<li><a id="backup" class='menu' href="#">系统备份</a></li>
						<li><a id="restore" class='menu' href="#">系统还原</a></li>
					</ul>
				</li>
			</ul>
		</div>



		<!-- 右边框架 -->
		<div class='sep10'></div>
		<div style="text-align: center;mid-width:960;font-size:150%;">
			<iframe id="iframe_content" width=760 height=600 scrolling=auto
				frameborder=0 src="./index.php" style=""></iframe>

		</div>

	</div>
	<div style="clear: both; text-align: center;">
		<hr />
	© 2013
	By 梁德斌
			<?php
			if (isset ( $_SESSION ['user'] ) && NULL != $_SESSION ['user']) {
				echo "<div style='float:right;'>";
				echo "你的身份是:{$_SESSION['user']['type']}&nbspID为:{$_SESSION['user']['id']}";
				echo "</div>";
			}
			?>
	</div>

	<!-- 绑定左边导航点击事件 -->

	<script type="text/javascript">
var url = [ ];
url['update_info']="./info.php?action=update_info";
url['update_psw']="./info.php?action=update_psw";
url['view_course']="./course_select.php";
url['insert_course']="./course_add.php";
url['stu']="./class_select.php";
url['tea']="./tea_select.php";
url['view_mark']="./mark.php";

url['post_manage']="./post.php?action=post_manage";
url['post_sort']="./post.php?action=post_sort";

url['backup']="./backup.php?action=backup";
url['restore']="./backup.php?action=restore";

      var menuEvent = function menuEvent(e)
      {
        	$('#iframe_content').attr('src',url[e.target.id]);       	
       }
      var start=function() { $(".menu").click( menuEvent );   }
      $(start);

	
</script>
</body>
</html>