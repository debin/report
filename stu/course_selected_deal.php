<?php 
include '../config.php';
$conn=mysql_connect(DB_HOST,DB_USER,DB_PASSWORD) or die("连接失败:".mysql_error());
mysql_select_db(DB_NAME,$conn) or die("选择数据库失败".mysql_error());
mysql_query("SET NAMES 'UTF8'");

if (!isset($_REQUEST['cor_no'] ))
{
	die("请先选择课程");
}

$cor_nums = $_REQUEST['cor_no'];
$stu_no = $_REQUEST['stu_no'];
$count_cor = count($cor_nums) ;

//echo $cor_no[0],$cor_no[1],$stu_no;

//删除选课信息
for($i = 0 ; $i < $count_cor ; $i++)
{
	$queryStr = sprintf("update sel_cor set status=0 where stu_no='%s' and cor_no='%s'",$stu_no,$cor_nums[$i]);
	$result = mysql_query ( $queryStr, $conn ) or die ( "查询失败: " . mysql_error () ) ;
	
}

?>