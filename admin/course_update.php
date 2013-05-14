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
	
	//更新课程
	case 'update_cor' :
		{
			//获取、判断所选课程
			if (!isset($_REQUEST['id']))
			{
				die('请先选择一门课程');
			}
			$ids = $_REQUEST['id'];
			if (count($ids)>1)
			{
				die("请只选择一个班级");
			}
			$id = $ids[0];
			
			//查询数据库获取课程信息
			$queryStr = sprintf ( "select  *  from course where  id='%s' ", $id);
			$result = mysql_query ( $queryStr, $conn ) or die ( "查询失败:" . mysql_error () );
			mysql_close ();
			
			echo '修改课程';
			echo "<form method='post' action='./course_update_deal.php?action=update_cor&id={$id}'>";
			echo '<table>';
			if($rel=mysql_fetch_array($result))
			{
				echo '<tr>';
				echo '<td>','课程编号','</td>';
				echo "<td><input name='cor_no' value={$rel['cor_no']}></input></td>";
				echo '</tr>';
				
				echo '<tr>';
				echo '<td>','课程名称','</td>';
				echo "<td><input name='cor_name' value={$rel['cor_name']}></input></td>";
				echo '</tr>';
				
				echo '<tr>';
				echo '<td>','学年','</td>';
				echo "<td><input name='term' value={$rel['term']}></input></td>";
				echo '</tr>';
				
				echo '<tr>';
				echo '<td>','教师','</td>';
				echo "<td><input name='tea_no' value={$rel['tea_no']}></input></td>";
				echo '</tr>';
				
				echo '<tr>';
				echo '<td>','选课最后期限','</td>';
				echo "<td><input name='select_time' value={$rel['select_time']}></input></td>";
				echo '</tr>';
				
				echo '<tr>';
				echo '<td>','关闭时间','</td>';
				echo "<td><input name='close_time' value={$rel['close_time']}></input></td>";
				echo '</tr>';
				
				echo '<tr>';
				echo '<td>','平时所长百分比','</td>';
				echo "<td><input name='usual_rate' value={$rel['usual_rate']}>%</input></td>";
				echo '</tr>';
				
				echo '<tr>';
				echo '<td>','实验报告所长百分比','</td>';
				echo "<td><input name='report_rate' value={$rel['report_rate']}>%</input></td>";
				echo '</tr>';
				
				echo '<tr>';
				echo '<td>','考试成绩所长百分比','</td>';
				echo "<td><input name='exam_rate' value={$rel['exam_rate']}>%</input></td>";
				echo '</tr>';
				
			
			
			}
			else 
			{
				echo '无此课程';
			}
			echo '<tr>';
			echo '<td>', "<input type=hidden name=id  value={$id} type=hidden></input>", '</td>';
			echo "<td><input type='submit' value='提交'></input></td>";
			echo '</tr>';
			echo '</table>';
			echo '</form>';
			
			
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

