<html>
<head>
<link rel="stylesheet" type="text/css" href="../static/css/global.css"></link>
<script type="text/javascript" src="../static/jquery/jquery-1.8.3.js"></script>
</head>
<body>
	<div style="text-align: center;">管理端</div>
	<div class='sep20'></div>
	<div style="float: left; width: 230;">
		<ul style="list-style: none;">
			<li>个人信息管理
				<ul>
					<li><a id="update_info" class='menu' href="#">个人信息</a></li>
					<li><a id="update_psw" class='menu' href="#">密码维护</a></li>
				</ul>
			</li>

			<li><br /></li>

			<li>学生与教师管理
				<ul>
					<li><a id="stu" class='menu' href="#">学生信息维护</a></li>
					<li><a id="tea" class='menu' href="#">教师信息维护</a></li>
				</ul>
			</li>



			<li><br /></li>

			<li>课程管理
				<ul>
					<li><a id="view_course" class='menu' href="#">查看课程</a></li>
					<li><a id="insert_course" class='menu' href="#">新添课程</a></li>
				</ul>
			</li>

			<li><br /></li>

			<li>选课管理
				<ul>
					<li><a id="view_format" class='menu' href="#">学生选课信息</a></li>
					<li><a id="view_date" class='menu' href="#">查看提交截止时间</a></li>
				</ul>
			</li>

			<li>成绩管理
				<ul>
					<li><a id="submit" class='menu' href="#">查看实验报告</a></li>
					<li><a id="view_result" class='menu' href="#">查看平时成绩</a></li>
					<li><a id="view_result" class='menu' href="#">查看报告成绩</a></li>
					<li><a id="view_result" class='menu' href="#">查看实验成绩</a></li>
				</ul>
			</li>
			<li>系统管理
				<ul>
					<li><a id="submit" class='menu' href="#">权限管理</a></li>				
					<li><a id="submit" class='menu' href="#">系统备份</a></li>
					<li><a id="submit" class='menu' href="#">系统还原</a></li>
				</ul>
			</li>
		</ul>
	</div>

	<div style="float: left;">
		<iframe id="iframe_content" width=720 height=600 scrolling=auto
			frameborder=0 src="./index.php" style=""></iframe>
	</div>



	<script type="text/javascript">
var url = [ ];
url['update_info']="./info.php?action=update_info";
url['update_psw']="./info.php?action=update_psw";
url['view_course']="./course_select.php";
url['insert_course']="./course_add.php";
url['stu']="./class_select.php";
url['tea']="./tea_select.php";

      var menuEvent = function menuEvent(e)
      {
        	$('#iframe_content').attr('src',url[e.target.id]);       	
       }
      var start=function() { $(".menu").click( menuEvent );   }
      $(start);

	
</script>
</body>
</html>