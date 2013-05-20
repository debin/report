<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<link rel="stylesheet" type="text/css" href="./static/css/global.css"></link>
<script type="text/javascript" src="../static/jquery/jquery-1.8.3.js"></script>
<?php

//判断用户身份
session_start();
if (!isset($_SESSION['user']) || NULL == $_SESSION['user'])
{
	echo "<div class='center' style='width:720px;'>";
	echo '请重新登陆,2秒后自动跳到登陆页面<br /><br />';
	echo "<a href='./login.php'>立即登陆</a>";
	echo "<META HTTP-EQUIV=\"Refresh\" CONTENT=\"2;URL='./login.php' \">";
	echo "</div>";
	die();
}
switch($_SESSION['user']['type'])
{
	case 'stu':
		{
		        echo "<META HTTP-EQUIV=\"Refresh\" CONTENT=\"0;URL='./stu/admin.php' \">";
		};break;
		
		case 'tea':
			{
				echo "<META HTTP-EQUIV=\"Refresh\" CONTENT=\"0;URL='./tea/admin.php' \">";
			};break;
			
		case 'admin':
			{
				echo "<META HTTP-EQUIV=\"Refresh\" CONTENT=\"0;URL='./admin/admin.php' \">";
			};break;
		
		
}

?>