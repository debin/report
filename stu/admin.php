<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<link rel="stylesheet" type="text/css" href="../static/css/global.css"></link>
<script type="text/javascript" src="../static/jquery/jquery-1.8.3.js"></script>
</head>
<body>
	<div style="text-align: center;">学生</div>
	<div class='sep20'></div>
	<div style="float: left; width: 200;">
		<ul style="list-style: none;">
			<li>个人信息管理
				<ul>
					<li><a id="update_info" class='menu' href="#">个人信息设置</a></li>
					<li><a id="update_psw" class='menu' href="#">密码修改</a></li>
				</ul>
			</li>
			<li><br /></li>

			<li>选课管理
				<ul>
					<li><a id="course_select" class='menu' href="#">选择课程</a></li>
					<li><a id="course_selected" class='menu' href="#">已选课程</a></li>
				</ul>
			</li>
			<li><br /></li>

			<li>报告管理
				<ul>
					<li><a id="view_date" class='menu' href="#">提交截止时间</a></li>
					<li><a id="report_show_course" class='menu' href="#">填写实验报告</a></li>
				</ul>
			</li>

			<li>成绩查看
				<ul>
					<li><a id="view_format" class='menu' href="#">查看成绩</a></li>
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

url['pass']="../signup.html";
url['update_info']="./info.php?action=update_info";
url['update_psw']="./info.php?action=update_psw";
url['course_select']="./course_select_grade.php?action=course_select";
url['course_selected']="./course.php?action=view_selected";
url['report_show_course']="./report.php?action=default";
      var menuEvent = function menuEvent(e)
      {
    	//  alert(url[e.target.id]);
        	$('#iframe_content').attr('src',url[e.target.id]);
        	
    //	  ('#iframe_content').attr('location',url[e.target.id]);
       }
      var start=function() { $(".menu").click( menuEvent );   }
      $(start);
      
</script>
</body>
</html>