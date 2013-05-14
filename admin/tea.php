<head>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<link rel="stylesheet" type="text/css" href="../static/css/test.css">
<script type="text/javascript" src="../static/jquery/jquery-1.8.3.js"></script>
</head>
<?php
include '../config.php';
$conn = mysql_connect ( DB_HOST, DB_USER, DB_PASSWORD ) or die ( "连接失败:" . mysql_error () );
mysql_select_db ( DB_NAME, $conn ) or die ( "选择数据库失败" . mysql_error () );
mysql_query ( "SET NAMES 'UTF8'" );


$action = $_REQUEST ['action'];
// echo $action;

/**
 * 根据action参数的值显示前台页面:add 为添加教师
 * delete 删除教师
 * select 显示教师更多信息
 */

switch ($action) {
	case 'add' :
		{
			echo "<form method='post' action='./tea_deal.php?action=add'>";
			echo '<table>';
			echo '<tr>';
			echo "<td>教师编号</td>";
			echo "<td><input name=tea_no></input></td>";
			echo '</tr>';
			
			echo '<tr>';
			echo "<td>院别</td>";
			echo "<td><input name=department></input></td>";
			echo '</tr>';

			echo '<tr>';
			echo "<td>姓名</td>";
			echo "<td><input name=name></input></td>";
			echo '</tr>';
			
			echo "<td><input type=submit value=新添></input></td>";
			echo "<td><input type=reset value=重置></input></td>";
			echo '</tr>';
			
			echo '</table>';
			echo '</form>';
			echo '教师初始密码为教师编号后6位';
		}
		;
		break;
			
	//删除教师
	case 'delete' :
		{
			if (!isset($_REQUEST['tea_no'] ))
			{
				die("请先选择教师");
			}
			$tea_nums=$_REQUEST['tea_no'];
			$url = "./tea_deal.php?action=delete";
			for($i = 0 ; $i < count($tea_nums) ; $i++)
			{
				$url =$url .  "&tea_no[{$i}]=" . $tea_nums[$i];	
			}
			echo $url;
			echo "<META HTTP-EQUIV=\"Refresh\" CONTENT=\"0;URL={$url}\">";
		};break;
		
		
		//更改教师密码
	case 'change_psw' :
		{
			if (!isset($_REQUEST['tea_no'] ))
			{
				die("请先选择学生");
			}

			$tea_nums = $_REQUEST['tea_no'];
			
			//得到学生学号
			$url = "./tea_deal.php?action=change_psw";
			for($i = 0 ; $i < count($tea_nums) ; $i++)
			{
			$url =$url .  "&tea_no[{$i}]=" . $tea_nums[$i];
			}
			
			echo '这是用来测试的:',$url;
			
			//向tea_deal.php 提出修改教师密码的请求
			echo "<form method='post' action='{$url}'>";
			echo '<table>';
			echo '<tr>';
			echo '<td>新密码</td>';
			echo '<td>',"<input type='password' name=psw1></input>",'</td>';
			echo '</tr>';
			
			echo '<tr>';
			echo '<td>重复输入</td>';
			echo '<td>',"<input type='password' name=psw2></input>",'</td>';
			echo '</tr>';
			
			echo '<tr>';
			echo "<td><input type='submit' value='更改密码'></input></td>";
			echo "<td><input type='reset' value='重置'></input></td>";
			echo '<tr>';
			echo '</form>';
			
		};break;
		
	default :
		break;
}

?>

