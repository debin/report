<?php
include '../config.php';
$conn = mysql_connect ( DB_HOST, DB_USER, DB_PASSWORD ) or die ( "连接失败:" . mysql_error () );
mysql_select_db ( DB_NAME, $conn ) or die ( "选择数据库失败" . mysql_error () );
mysql_query ( "SET NAMES 'UTF8'" );
$tea_no = "tea";

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
	case 'add':
		{
			$cor_no=$_POST['cor_no'];
			$item_no=$_POST['item_no'];
			$item_name = $_POST ['item_name'];
			$exam_rate = $_POST ['exam_rate'];
			$body = $_POST ['body'];
			$report_format = $_POST['report_format'];
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
			//$cor_no = $_GET ['cor_no'];
			$id = $_GET ['id'];
			$item_no=$_POST['item_no'];
			$item_name = $_POST ['item_name'];
			$report_format=$_POST['report_format'];
			$exam_rate = $_POST ['exam_rate'];
			$body = $_POST ['body'];
			$queryStr = sprintf ( "update item set  item_no='%s',item_name='%s' ,body='%s',report_format='%s',exam_rate='%s' where   id='%s'", $item_no,$item_name,$body,$report_format,$exam_rate,$id );
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