<head>
<link rel="stylesheet" type="text/css" href="../static/css/global.css"></link>
<script type="text/javascript" src="../static/jquery/jquery-1.8.3.js"></script>
</head>

<?php
include '../config.php';
include '../is_login_admin.php';
$conn=mysql_connect(DB_HOST,DB_USER,DB_PASSWORD) or die("连接失败:".mysql_error());
mysql_select_db(DB_NAME,$conn) or die("选择数据库失败".mysql_error());
mysql_query("SET NAMES 'UTF8'");

?>

<div>
<form method="post" action="./course.php?action=default">
教师<select name="tea_no">
<option value='all'>所有</option>
<?php
$queryStr = "select  distinct tea_no,name  from tea order by name asc";
$result = mysql_query($queryStr,$conn) or die("查询失败:".mysql_error());
while($rel = mysql_fetch_array($result))
{
	if ($rel['name'] == NULL )
	{
		echo "<option value='{$rel['tea_no']}'>教师编号:{$rel['tea_no']}</option>";
	}
	else 
	{
		echo "<option value='{$rel['tea_no']}'>{$rel['name']}</option>";	
	}
}
 ?>
</select>

学期<select name="term">
<option value='all'>所有</option>
<?php 
$queryStr = "select  distinct term  from course order by term desc";
$result = mysql_query($queryStr,$conn) or die("查询失败:".mysql_error());
while($rel = mysql_fetch_array($result))
{
	echo "<option value='{$rel['term']}'>{$rel['term']}</option>";
}
mysql_close();
?>
</select>
<input class=button type="submit" value="查看"></input>
</form>
</div>