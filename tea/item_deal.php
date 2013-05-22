<?php
include '../config.php';
include '../is_login_tea.php';
$conn = mysql_connect ( DB_HOST, DB_USER, DB_PASSWORD ) or die ( "连接失败:" . mysql_error () );
mysql_select_db ( DB_NAME, $conn ) or die ( "选择数据库失败" . mysql_error () );
mysql_query ( "SET NAMES 'UTF8'" );
//$tea_no = "tea";
$today = date("Y-m-d");

$action = NULL;
if (isset($_GET['action']))
{
	$action = $_GET['action'];
}

/** 根据action参数的值，进行不同处理：add添加实验内容，update更新实验内容,delete删除处理
 *    edit_time编辑实验报告提交时间
 *
 */

switch($action)
{
	
	//添加实验项目，后台
	case 'add':
		{
			$cor_no=$_POST['cor_no'];
			$item_no=$_POST['item_no'];
			$item_name = $_POST ['item_name'];
			$exam_rate = $_POST ['exam_rate'];
			$body = $_POST ['body'];
			$report_format = $_POST['report_format'];
			$body = addslashes ($body);
			$report_format = addslashes ($report_format);
			
			//判断实验编号是否已经存在
			$queryStr=sprintf("select count(*) from item where cor_no='%s' and item_no='%s'",$cor_no,$item_no);
			$result = mysql_query ( $queryStr, $conn ) or die ( "查询失败: " . mysql_error () ) ;
			$rel = mysql_fetch_array ( $result );
			if ($rel[0] != 0)
			{
				die("添加失败:实验编号已存在");
			}
			
			$queryStr=sprintf("insert into item values(NULL,'%s','%s','%s','%s','%s','%s')",$item_no,$item_name,$body,$report_format,$cor_no,$exam_rate);
			$result = mysql_query ( $queryStr, $conn ) or die ( "查询失败: " . mysql_error () ) ;
			
			if($result!=NULL && 1==mysql_affected_rows())
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
			$cor_no = $_REQUEST ['cor_no'];
			$id = $_REQUEST ['id'];
			$item_no_old = $_REQUEST['item_no_old'];
			$item_no_new = $_REQUEST['item_no_new'];
			$item_name = $_REQUEST ['item_name'];
			$report_format=$_REQUEST['report_format'];
			$exam_rate = $_REQUEST ['exam_rate'];
			$body = $_REQUEST ['body'];
			$body = addslashes ($body);
			$report_format = addslashes ($report_format);
			if ($exam_rate < 0 || $exam_rate > 100)
			{
				die('成绩比重应在0到100之间');
			}
			
			//判断实验编号是否已经存在
			if ($item_no_old != $item_no_new)
			{	
				$queryStr=sprintf("select count(*) from item where cor_no='%s' and item_no='%s'",$cor_no,$item_no_new);
				$result = mysql_query ( $queryStr, $conn ) or die ( "查询失败: " . mysql_error () ) ;
				$rel = mysql_fetch_array ( $result );
				if ($rel[0] != 0)
				{
					die("添加失败:实验编号已存在");
				}
			}
			
			$queryStr = sprintf ( "update item set  item_no='%s',item_name='%s' ,body='%s',report_format='%s',exam_rate='%s' where   id='%s'", $item_no_new,$item_name,$body,$report_format,$exam_rate,$id );
			$result = mysql_query ( $queryStr, $conn ) or die ( "查询失败: " . mysql_error () ) ;

			if($result!=NULL && 1==mysql_affected_rows())
			{
				echo '修改成功';
			}
			else
			{
				echo '修改失败';
			}
			mysql_close ();
			
		};break;
	case 'delete':
		{
			if (!isset($_REQUEST['id']))
			{
				die('请先选择实验项目');
			}
			$id = $_POST ['id'];
			$queryStr = sprintf("delete from item where id='%s'",$id);
			$result = mysql_query ( $queryStr, $conn ) or die ( "查询失败: " . mysql_error () ) ;
			if($result!=NULL && 1==mysql_affected_rows())
			{
				echo '删除成功';
			}
			else 
			{
				echo '删除失败了';
			}
			mysql_close ();
		};break;
		
	case 'edit_time':
		{
			if(!isset($_POST['report_time']) || NULL==$_POST['report_time'])
			{
				die("请先填写日期");
			}
			$report_time=$_POST['report_time'];
			
			list($year, $month, $day) = explode('-', $report_time);
			if(!checkdate($month,$day,$year))
			{
				die('输入的不是合法日期');
			}
			
			$queryStr = sprintf("update course set  report_time='%s' where cor_no='%s'",$report_time,$_POST['cor_no']);
			$result = mysql_query ( $queryStr, $conn ) or die ( "查询失败: " . mysql_error () ) ;	
			if($result!=NULL && 1==mysql_affected_rows())
			{
				echo "修改成功";
			}
			else
			{
				echo "修改失败了";
			}
		};break;
	default:
		echo '提交不成功';
		
}

?>