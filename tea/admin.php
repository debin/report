<?php session_start ();?>
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
if ('tea' != $_SESSION ['user'] ['type']) {
	echo '非教师身份不可登陆<br /><br />';
	echo "<a href='../index.php'>回到首页</a>";
	die ();
}
?>
<div
		style="background-image: url(../static/image/topback.jpg); width: 1024px; height: 80px; margin-left: auto; margin-right: auto;"></div>
	<div class="sep3"></div>
	<div
		style="margin-left: auto; margin-right: auto; min-width: 960px; text-align: center; margin-top: 1px;">
		<ul class="heng" style="margin-top:10px;margin-bottom:5px;">
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
	<div style="float: left; width: 220;">
		<ul style="list-style: none;">
			<li>个人信息管理
				<ul style="list-style: none;">
					<li><a id="update_info" class='menu' href="#">个人信息</a></li>
					<li><a id="update_psw" class='menu' href="#">修改密码</a></li>
				</ul>
			</li>


			<li>课程管理
				<ul style="list-style: none;">
					<li><a id="update_group" class='menu' href="#">课程批次管理</a></li>
					<li><a id="update_item" class='menu' href="#">实验管理</a></li>

				</ul>
			</li>


			<li>选课管理
				<ul style="list-style: none;">
					<li><a class='menu' href="#">选课信息</a></li>
					<li><a id='record' class='menu' href="#">审核管理</a></li>
				</ul>
			</li>


			<li>报告管理
				<ul style="list-style: none;">
					<li><a id='report_manage' class='menu' href="#">报告管理</a></li>
					<li><a id='report_correct' class='menu' href="#">报告批改</a></li>
					<li><a id='remark' class='menu' href="#">评语管理</a></li>
				</ul>
			</li>
			<li style="list-style: none;">成绩管理
				<ul style="list-style: none;">
					<li><a id='mark_exam' class='menu' href="#">考试成绩</a></li>
					<li><a id='mark_update' class='menu' href="#">成绩更新</a></li>
					<li><a id='mark_all_cor' class='menu' href="#">成绩报表</a></li>
				</ul>
			</li>

			<li><a href="#"></a></li>
			<li><a href="#"></a></li>
		</ul>

	</div>

	<div style="float: left; width: 720;">
		<div class='sep10'></div>
		<iframe id="iframe_content" width=720 height=600 scrolling=auto
			frameborder=0 src="./index.php"></iframe>
	</div>

	<div style="clear: both; text-align: center;">
		<hr />
		© 2013 By 梁德斌
				<?php
				if (isset ( $_SESSION ['user'] ) && NULL != $_SESSION ['user']) {
					echo "<div style='float:right;'>";
					echo "你的身份是:{$_SESSION['user']['type']}&nbspID为:{$_SESSION['user']['id']}";
					echo "</div>";
				}
				?>
	</div>

	<script type="text/javascript">
var url = [ ];
url['update_info']="./info.php?action=update_info";
url['update_psw']="./info.php?action=update_psw";
url['update_item']="./term_select.php?action=show_item&time="+Math.random();
url['update_group']="./term_select.php?action=show_group&time="+Math.random();
url['remark']="./remark.php?action=default";
url['report_correct']="./report.php?action=default";
url['report_manage']="./report.php?action=report_manage";
url['record']="./select.php?action=default";
url['mark_exam']="./mark.php?action=default";
url['mark_update']="./mark.php?action=mark_update";
url['mark_all_cor']="./mark.php?action=mark_all_cor";
      var menuEvent = function menuEvent(e)
      {
    	//  alert(url[e.target.id]);
        	$('#iframe_content').attr('src',url[e.target.id]);    	
       }

      //绑定点击事件
      var start=function() { $(".menu").click( menuEvent );   }
      $(start);

	
</script>
</body>
</html>