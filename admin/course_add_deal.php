<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<link rel="stylesheet" type="text/css" href="../static/css/test.css">
<script type="text/javascript" src="../static/jquery/jquery-1.8.3.js"></script>
</head>
<body>

<?php 
if(!($_POST['cor_no'] &&  $_POST['cor_name'] && $_POST['term'] && $_POST['tea_no']  && $_POST['usual_rate'] && $_POST['report_rate'] && $_POST['exam_rate'] ))
{
die("请完整输入");

}

include '../config.php';
$conn=mysql_connect(DB_HOST,DB_USER,DB_PASSWORD) or die("连接失败:".mysql_error());
mysql_query("SET NAMES 'UTF8'");
mysql_select_db(DB_NAME,$conn) or die("选择数据库失败".mysql_error());

$queryStr = sprintf("insert into course values(NULL,'%s','%s','%s','%s','%s','%s','%s','%s',NULL,'%s',NULL)",$_POST['cor_no'],$_POST['term'],$_POST['tea_no'],$_POST['cor_name'],$_POST['usual_rate'],$_POST['report_rate'],$_POST['exam_rate'],$_POST['select_time'],$_POST['close_time']);
$result = mysql_query($queryStr,$conn) or die("查询失败:".mysql_error());

if($result==TRUE && 1==mysql_affected_rows())
	echo "插入成功 <br>";

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