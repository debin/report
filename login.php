<head>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<link rel="stylesheet" type="text/css" href="./static/css/global.css">
<script type="text/javascript" src="./static/jquery/jquery-1.8.3.js"></script>
</head>

<?php
include './config.php';
$conn = mysql_connect ( DB_HOST, DB_USER, DB_PASSWORD ) or die ( "连接失败:" . mysql_error () );
mysql_select_db ( DB_NAME, $conn ) or die ( "选择数据库失败" . mysql_error () );
mysql_query ( "SET NAMES 'UTF8'" );

$action = NULL;
if (isset ( $_REQUEST ['action'] )) {
	$action = $_REQUEST ['action'];
}

switch ($action) {
	case 'signup' :
		{
			$user = trim ( $_POST ['user'] );
			$pass1 = trim ( $_POST ['pass1'] );
			$pass1 = trim ( $_POST ['pass1'] );
			$email = trim ( $_POST ['mail'] );
			echo $user, '<br />';
			echo 'signup';
		}
		;
		break;
	
	// 登陆，用户名判断
	case 'login' :
		{
			session_start ();
			$authcode = strtolower ( $_SESSION ['authcode'] );
			unset ( $_SESSION ['authcode'] );
			
			$img_code = strtolower ( trim ( $_REQUEST ['img_code'] ) );
		
			 if($authcode!=$img_code)
			 {
			  die('验证码不正确');
			  }
		
			if (!isset ( $_REQUEST ['user'] ) ||  NULL == $_REQUEST ['user']) {
				die ( '请输入用户' );
			}
			if (!isset ( $_REQUEST ['psw'] ) ||  NULL == $_REQUEST ['psw']) {
				die ( '请输入密码' );
			}
			$user = trim ( $_REQUEST ['user'] );
			$psw = trim ( $_REQUEST ['psw'] );
			$identify = $_REQUEST ['identify'];
			$psw = md5 ( base64_encode ( $psw ) );
	//		echo $user,$psw;

			//根据用户身份确定数据库用户表
		switch ($identify) {
				case 'stu' :
					$table = 'stu';
					$table_field = 'stu_no';
					break;
				case 'tea' :
					$table = 'tea';
					$table_field = 'tea_no';
					break;
				case 'admin' :
					$table = 'admin';
					$table_field = 'user';
					break;
			}
			
			$queryStr = sprintf ( "select * from %s where %s='%s' and psw='%s'", $table, $table_field, $user, $psw );
			$result = mysql_query ( $queryStr, $conn ) or die ( "查询失败:" . mysql_error () );
			mysql_close ( $conn );
			if ($rel = mysql_fetch_array( $result )) {
				$a = array();
				$a['type'] = $identify;
				$a['id'] = $user;
				$_SESSION['user'] = $a;
				echo "<div class='center' style='width:720px;'>";
				echo '登陆正确,2秒后跳转到首页<br /><br/>';
				echo "<a href='./index.php'>立即跳转</a>";
				echo "<META HTTP-EQUIV=\"Refresh\" CONTENT=\"2;URL='./index.php' \">";	
				echo "</div>";
			}
			else
			{
				echo '密码不正确，2秒后自动返回登陆页面<br /><br/>';
				echo "<a href='./login.php'>立即跳转</a>";
				echo "<META HTTP-EQUIV=\"Refresh\" CONTENT=\"2;URL='./login.php' \">";
			}
		}
		;
		break;
	
	case 'logout' :
		{
			session_start ();
			unset ( $_SESSION ['user'] );
			echo "<div class='center' style='width:720px;'>";
			echo '你已经退出登陆了,2秒后自动返回首页<br /><br/>';
			echo "<a href='./index.php'>立即跳转</a>";
			echo "<META HTTP-EQUIV=\"Refresh\" CONTENT=\"2;URL='./index.php' \">";
			echo "</div>";
		}
		;
		break;
	
	// 默认为登陆界面
	default :
		{
			session_start();
			if (isset ( $_SESSION ['user'] ) && NULL != $_SESSION ['user']) {
				echo '你已经登陆过了,2秒后自动跳转到首页';
				echo "<a href='./index.php'>立即跳转</a>";
				echo "<META HTTP-EQUIV=\"Refresh\" CONTENT=\"2;URL='./index.php' \">";
				die ( );
			}
			echo "<div class='center' style='width:720px;'>";
			echo '<a href=./index.php>回到首页</a><br/><br />';
			echo "<form action='./login.php' method='post'>";
			echo '<table>';
			echo '<tr>';
			echo "<td>用户名</td>";
			echo "<td><input name=user></input></td>";
			echo '</tr>';
			
			echo '<tr>';
			echo "<td>密码</td>";
			echo "<td><input type='password' name=psw></input></td>";
			echo '</tr>';
			
			echo '<tr>';
			echo "<td>验证码</td>";
			echo "<td><input  name=img_code></input></td>";
			echo "<td><img id='imgCode' src='./authcode.php'></td>";
			echo "<td><a id='fresh' href='#'>刷新</a></td>";
			echo '</tr>';

			echo '<tr>';
			echo '<td>选择身份</td>';
			echo "<td><select name='identify'><option value='stu'>学生</option><option value='tea'>教师</option><option value='admin'>管理员</option></select></td>";
			echo '</tr>';
			
			echo "<tr><td><input type='hidden' name=action value='login' ></td></tr>";
			
			echo '<tr>';
			echo "<td><input type='submit' value='登录' class='button'></td>";
			echo "<td><input type='reset' value='重置' class='button'></td>";
			echo '</tr>';
			echo '</table>';
			echo '</form>';	
			echo "</div>";
		}
		;
		break;
}

?>
<script type="text/javascript">
var fresh=$("#fresh");
fresh.click(function (){
$('#imgCode').attr('src','./authcode.php?time='+Math.random());
});
</script>