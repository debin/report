<?php
include '../config.php';
$conn=mysql_connect(DB_HOST,DB_USER,DB_PASSWORD) or die("连接失败:".mysql_error());
mysql_select_db(DB_NAME,$conn) or die("选择数据库失败".mysql_error());
mysql_query("SET NAMES 'UTF8'");

$stu_no='stu2';

//$action=$_REQUEST['action'];
//echo $action;

/**  根据参数 action 的值显示不同的前台页面：
 * 
 * 
 */

//$year = date('Y');
// echo $year;
	$action = $_REQUEST['action'];
	switch($action)
	{
		case 'course_select':
			{
				echo "<form method='post' action='./course_select.php'>";
				$queryStr = "select  distinct grade  from stu where stu_no='{$stu_no}'";
				$result = mysql_query($queryStr,$conn) or die("查询失败:".mysql_error());
				$rel = mysql_fetch_array($result);
				echo "年级<input name='grade'  value={$rel[0]}>";
				echo '</input>';
				
				echo "<input type='hidden'  name=stu_no value={$stu_no}></input>";
				echo "<input type='submit' value='查看'></input>";
	            echo "</form>";

			}break;
			
		case 'report_select':
			{
				echo '填写报告';
				$stu_no = 'stu2';
				
				echo "<form method='post' action='./course_selected_deal.php'>";
				echo '<table>';
				echo '<tr>';
				echo '<td />';
				echo '<td>课号</td>';
				echo '<td>课程名称</td>';
				echo '<td>实验教师</td>';
				echo '</tr>';
				
				$queryStr = sprintf("select * from course,sel_cor,tea where sel_cor.stu_no='%s' and sel_cor.cor_no=course.cor_no and tea.tea_no=course.tea_no",$stu_no);
				$result = mysql_query($queryStr,$conn) or die("查询失败:".mysql_error());
				
				//有课程可选
				if($rel = mysql_fetch_array($result))
				{
					do
					{
						echo '<tr>';
						echo '<td>', "<input type=checkbox name = cor_no[] value={$rel['cor_no']}>", '</td>';
						echo '<td>', $rel ["cor_no"], '</td>';
						echo '<td>', $rel ["cor_name"], '</td>';
						echo '<td>', $rel ["name"], '</td>';
						echo '</tr>';
					}
					while ($rel = mysql_fetch_array($result));
				}
			};break;

			
		default:
			break;
		
	}

?>



