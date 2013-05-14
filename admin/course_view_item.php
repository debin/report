<?php
include '../config.php';
$conn=mysql_connect(DB_HOST,DB_USER,DB_PASSWORD) or die("连接失败:".mysql_error());
mysql_select_db(DB_NAME,$conn) or die("选择数据库失败".mysql_error());
mysql_query("SET NAMES 'UTF8'");

if(!isset($_GET ['cor_no']))
{
	die("提交失败");
}

$cor_no = $_GET ['cor_no'];
// echo $cor_no;



$queryStr = sprintf ( "select  *  from item where  cor_no='%s'", $cor_no);
$result = mysql_query ( $queryStr, $conn ) or die ( "查询失败:" . mysql_error () );
mysql_close ();

echo '<table>';
echo '<tr>';
echo '<td>实验编号</td>';
echo '<td>实验名称</td>';
echo '<td>成绩百分比</td>';
echo '</tr>';

if ( $rel = mysql_fetch_array ( $result ) )
 {
 	
 	do{
	echo '<tr>';
	echo '<td>', $rel ["item_no"], '</td>';
	echo '<td>', $rel ["item_name"], '</td>';
	echo '<td>', $rel ["exam_rate"], '</td>';
	echo "<td><a href='./update_item.php?action=update&cor_no=$cor_no& id={$rel['id']}'>修改</a></td>";
	echo "<td><a href='./update_item_deal.php?action=delete&id={$rel['id']}'>删除</a></td>";
	echo '</tr>';
 	}while($rel = mysql_fetch_array ( $result ));
 	
}
else
{
echo '<tr>';
echo '<td>';
echo "没实验内容";
echo '</td>';
echo '</tr>';
}

echo '</table>';

?>