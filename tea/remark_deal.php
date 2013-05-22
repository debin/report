<?php
include '../config.php';
include '../is_login_tea.php';
$conn = mysql_connect ( DB_HOST, DB_USER, DB_PASSWORD ) or die ( "连接失败:" . mysql_error () );
mysql_select_db ( DB_NAME, $conn ) or die ( "选择数据库失败" . mysql_error () );
mysql_query ( "SET NAMES 'UTF8'" );
//$tea_no = "tea";

$action = NULL;
if (isset($_GET['action']))
{
	$action = $_GET['action'];
}

/** 根据action参数的值，进行不同处理后台：add添加评语，update更新评语,delete删除评语
 *
 */

switch($action)
{
	
	//添加评语，后台
	case 'add':
		{
			
			$no=$_REQUEST['no'];
			$body = $_REQUEST ['body'];

			$queryStr=sprintf("insert into remark values(NULL,'%s','%s','%s')",$tea_no,$no,$body);
			$result = mysql_query ( $queryStr, $conn ) or die ( "查询失败: " . mysql_error () ) ;
			
			if($result!=NULL && 0!=mysql_affected_rows())
			{
				echo '添加成功';
			}
			else 
			{
				echo '添加失败';
			}
			mysql_close ();
		};break;
		
	case 'update':
		{
			$id = $_REQUEST ['id'];
			$no = $_REQUEST['no'];
			$body = $_REQUEST ['body'];
			
			$queryStr = sprintf ( "update remark set  no='%s',body='%s' where   id='%s'  and tea_no='%s'", $no,$body,$id,$tea_no );
			$result = mysql_query ( $queryStr, $conn ) or die ( "查询失败: " . mysql_error () ) ;

			if($result!=NULL && 1==mysql_affected_rows())
			{
				echo '修改评语成功';
			}
			else
			{
				echo '修改评语失败';
			}
			mysql_close ();
			
		};break;
		
		//删除评语
	case 'delete':
		{
			if (!isset($_REQUEST['id']))
			{
				die('请先选择实验项目');
			}
			$ids = $_REQUEST ['id'];
			
			echo '删除评语<br />';
			echo '<table><tr>';
			echo '<td>评语编号</td>';
			echo '<td>删除状态(成功/失败)</td>';
			echo '</tr>';
			for($i = 0 ; $i < count($ids) ; $i++)
			{
				$queryStr = sprintf("delete from remark where tea_no='%s' and id='%s'",$tea_no,$ids[$i]);
				$result = mysql_query ( $queryStr, $conn ) or die ( "删除失败: " . mysql_error () ) ;
				if($result!=NULL && 1==mysql_affected_rows())
				{
					echo "<tr><td>";
					echo $ids[$i];
					echo "</td><td>";
					echo '成功';
					echo "</td></tr>";
				}
				else
				{
					echo "<tr><td>";
					echo $ids[$i];
					echo "</td><td>";
					echo '失败';
					echo "</td></tr>";
				}
				
			}
			mysql_close ();
		};break;
		
	default:
		echo '参数不正确';
		break;	
}

?>