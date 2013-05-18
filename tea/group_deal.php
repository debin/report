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
	//添加批次，对数据库的插入更新
	case 'add':
		{
			$cor_no = trim($_REQUEST['cor_no']);
			$groups = trim($_REQUEST['groups']);
			$week_start = trim($_REQUEST['week_start']);
			$week_end = trim($_REQUEST['week_end']);
			$week_nums = trim($_REQUEST['week_nums']);
			$lesson_seq = trim($_REQUEST['lesson_seq']);
			$num = trim($_REQUEST['num']);
			if ($cor_no == NULL || $groups ==NULL || $week_start ==NULL || $week_end ==NULL  ||$week_nums==NULL || $lesson_seq==NULL || $num ==NULL)
			{
				die('请完整输入');
			}
			
			$queryStr=sprintf("insert into groups values(NULL,'%s','%s','%s','%s','%s','%s','%s')",$groups,$cor_no,$week_start,$week_end,$week_nums,$lesson_seq,$num);
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
		
		//更新批次信息，对数据库表的更新
	case 'update':
		{
			$id = trim($_REQUEST['id']);
			$cor_no = trim($_REQUEST['cor_no']);
			$groups = trim($_REQUEST['groups']);
			$week_start = trim($_REQUEST['week_start']);
			$week_end = trim($_REQUEST['week_end']);
			$week_nums = trim($_REQUEST['week_nums']);
			$lesson_seq = trim($_REQUEST['lesson_seq']);
			$num= trim($_REQUEST['num']);

			
			
			$queryStr = sprintf ( "update groups set  groups='%s',cor_no='%s' ,week_start='%s',week_end='%s',week_nums='%s',lesson_seq='%s',num='%s' where  id='%s'", $groups,$cor_no,$week_start,$week_end,$week_nums,$lesson_seq,$num,$id);
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
		
		//删除批次，更新数据库
	case 'delete':
		{
			if (!isset($_REQUEST['id']))
			{
				die('请先选择批次目');
			}
			$id = $_REQUEST ['id'];
			$queryStr = sprintf("delete from groups where id='%s'",$id);
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