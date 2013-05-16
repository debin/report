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
					<li><a id="update_info" class='menu' href="#">个人信息设置</a></li>
					<li><a id="update_psw" class='menu' href="#">修改密码</a></li>
				</ul>
			</li>

			<li><br /></li>

			<li>课程管理
				<ul>
					<li><a id="update_group" class='menu' href="#">课程批次管理</a></li>
					<li><a id="update_item" class='menu' href="#">实验管理</a></li>
			
				</ul>
			</li>

			<li><br /></li>

			<li>选课管理
				<ul>	
					<li><a class='menu' href="#">导入选课信息</a></li>
					<li><a class='menu' href="#">未审核记录</a></li>
					<li><a class='menu' href="#">学生退课记录</a></li>
				</ul>
			</li>

			<li><br /></li>

			<li>报告管理
				<ul>
					<li><a class='menu' href="#">实验报告批改</a></li>
					<li><a class='menu' href="#">评语设置</a></li>
				</ul>
			</li>
			<li>成绩管理
				<ul>
					<li><a class='menu' href="#">平时成绩</a></li>
					<li><a class='menu' href="#">考试成绩</a></li>
					<li><a class='menu' href="#">综合成绩</a></li>
					<li><a class='menu' href="#">成绩报表</a></li>
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
url['update_info']="./info.php?action=update_info";
url['update_psw']="./info.php?action=update_psw";
url['update_item']="./term_select.php?action=show_item&time="+Math.random();
url['update_group']="./term_select.php?action=show_group&time="+Math.random();

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