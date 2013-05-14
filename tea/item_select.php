<head>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<link rel="stylesheet" type="text/css" href="../static/css/global.css"></link>
<script type="text/javascript" src="../static/jquery/jquery-1.8.3.js"></script>
</head>
<?php
include '../config.php';
$conn = mysql_connect ( DB_HOST, DB_USER, DB_PASSWORD ) or die ( "连接失败:" . mysql_error () );
mysql_select_db ( DB_NAME, $conn ) or die ( "选择数据库失败" . mysql_error () );
mysql_query ( "SET NAMES 'UTF8'" );
$tea_no = "tea";
?> 

<div>
<form method="post" action="./item.php">
学期<select name="term">
<option value='all'>所有</option>
<?php 
$queryStr = sprintf("select  distinct term  from course where tea_no='%s' order by term desc",$tea_no);
$result = mysql_query($queryStr,$conn) or die("查询失败:".mysql_error());
while($rel = mysql_fetch_array($result))
{
	echo "<option value='{$rel['term']}'>{$rel['term']}</option>";
}
mysql_close();
?>

</select>
<input type="submit" value="提交"></input>
</form>
</div>

