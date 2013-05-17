<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<link rel="stylesheet" type="text/css" href="../static/css/test.css">
<script type="text/javascript" src="../static/jquery/jquery-1.8.3.js"></script>
</head>
<body>

<?php 
include '../config.php';
$conn=mysql_connect(DB_HOST,DB_USER,DB_PASSWORD) or die("连接失败:".mysql_error());
mysql_select_db(DB_NAME,$conn) or die("选择数据库失败".mysql_error());
mysql_query("SET NAMES 'UTF8'");

if(!($_REQUEST['cor_no'] &&  $_REQUEST['cor_name'] && $_REQUEST['term'] && $_REQUEST['tea_no']  && $_REQUEST['usual_rate'] && $_REQUEST['report_rate'] && $_REQUEST['exam_rate'] ))
{
die("请完整输入");
}

list($year, $month, $day) = explode('-', $_REQUEST['select_time']);

if(!checkdate($month,$day,$year))
{
	die('输入的选课截止时间不是合法日期');
}

list($year, $month, $day) = explode('-', $_REQUEST['close_time']);
if(!checkdate($month,$day,$year))
{
	die('输入的课程关闭时间不是合法日期');
}

if($_REQUEST['select_time'] > $_REQUEST['close_time'])
{
	die('添加失败:选课截止时间不能大于关闭时间');
}

$queryStr = sprintf("insert into course values(NULL,'%s','%s','%s','%s','%s','%s','%s','%s',NULL,'%s',NULL)",$_REQUEST['cor_no'],$_REQUEST['term'],$_REQUEST['tea_no'],$_REQUEST['cor_name'],$_REQUEST['usual_rate'],$_REQUEST['report_rate'],$_REQUEST['exam_rate'],$_REQUEST['select_time'],$_REQUEST['close_time']);
$result = mysql_query($queryStr,$conn) or die("查询失败:".mysql_error());

if($result==TRUE && 1==mysql_affected_rows())
	echo "添加成功 <br>";

echo $_POST['cor_no'],"<br>";
echo $_POST['cor_name'],"<br>";
echo $_POST['term'],"<br>";

echo $_POST['tea_no'],"<br>";


echo $_POST['usual_rate'],"<br>";
echo $_POST['report_rate'],"<br>";
echo $_POST['exam_rate'],"<br>";
?>

</body>



</html>