<html>
<head>
<link rel="stylesheet" type="text/css" href="../static/css/global.css"></link>
<script type="text/javascript" src="../static/jquery/jquery-1.8.3.js"></script>
</head>
<body>
	<div style="text-align: center;">教师端</div>
	<div class='sep20'></div>
	<div style="float: left; width: 200;">
		<ul style="list-style: none;">
			<li>个人信息管理
				<ul>
					<li><a id="name" class='menu' href="#">个人信息设置</a></li>
					<li><a id="pass" class='menu' href="#">修改密码</a></li>
				</ul>
			</li>

			<li><br /></li>

			<li>课程管理
				<ul>
					<li><a class='menu' href="#">查看实验课程</a></li>
					<li><a id='update_item' class='menu' href="#">实验内容和模板</a></li>
					<li><a id='update_time' class='menu' href="#">设置截止时间</a></li>
				</ul>
			</li>

			<li><br /></li>

			<li>选课管理
				<ul>
					<li><a class='menu' href="#">学生选课信息</a></li>
					<li><a class='menu' href="#">选课审核设置</a></li>
				</ul>
			</li>

			<li><br /></li>

			<li>报告管理
				<ul>
					<li><a class='menu' href="#">实验报告批改</a></li>
					<li><a class='menu' href="#">报告模板设置</a></li>
				</ul>
			</li>
			<li>成绩管理
				<ul>
					<li><a class='menu' href="#">实验考勤成绩</a></li>
					<li><a class='menu' href="#">成绩统计信息</a></li>
				</ul>
			</li>

			<li><a href="#"></a></li>
			<li><a href="#"></a></li>
		</ul>

	</div>

	<div style="float: left;">
		<iframe id="iframe_content" width=720 height=600 scrolling=auto
			frameborder=0 src="./index.php" style=""></iframe>
	</div>






	<script type="text/javascript">
var url = [ ];
url['name']="../login.html";
url['pass']="../signup.html";
url['update_item']="./item_select.php?time="+Math.random();
url['update_time']="./item_select.php?time="+Math.random();

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