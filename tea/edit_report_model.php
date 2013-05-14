<?php
include '../config.php';
$conn = mysql_connect ( DB_HOST, DB_USER, DB_PASSWORD ) or die ( "连接失败:" . mysql_error () );
mysql_select_db ( DB_NAME, $conn ) or die ( "选择数据库失败" . mysql_error () );
mysql_query ( "SET NAMES 'UTF8'" );
$tea_no = "tea";

echo '<table>';
echo '<tr>';
echo '<td>课号</td>';
echo '<td>课程名称</td>';
echo '<td>学期</td>';
echo '</tr>';
$queryStr = sprintf ( "select  *  from course where tea_no='%s'", $tea_no );
$result = mysql_query ( $queryStr, $conn ) or die ( "查询失败:" . mysql_error () );
mysql_close ();
if( $rel = mysql_fetch_array ( $result ) ) {
	do{
	echo '<tr>';
	echo '<td>', $rel ["cor_no"], '</td>';
	echo '<td>', $rel ["cor_name"], '</td>';
	echo '<td>', $rel ["term"], '</td>';
	echo "<td><a href='./update_item.php?action=select&cor_no={$rel['cor_no']}'>进入修改</a></td>";
	echo '</tr>';
	}while($rel = mysql_fetch_array ( $result ));
}
echo '</table>';

?>