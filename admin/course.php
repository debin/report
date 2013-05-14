<head>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<link rel="stylesheet" type="text/css" href="../static/css/test.css">
<script type="text/javascript" src="../static/jquery/jquery-1.8.3.js"></script>
</head>

<?php
include '../config.php';
$conn=mysql_connect(DB_HOST,DB_USER,DB_PASSWORD) or die("连接失败:".mysql_error());
mysql_select_db(DB_NAME,$conn) or die("选择数据库失败".mysql_error());
mysql_query("SET NAMES 'UTF8'");

if(!isset($_REQUEST['tea_no']) || !isset($_REQUEST['term']))
{
	die("提交不正确");
}
$tea_no = $_REQUEST['tea_no'];
$term = $_REQUEST['term'];

// 分页中每一页的条目数量
$page_size = 10;
	
// 获取页码
if (isset ( $_REQUEST ['page'] )) {
	$page = intval ( $_GET ['page'] );
}
// 设置为第一页
else {
	$page = 1;
}


//获取搜索条件，学期与教师
$Str = " where course.tea_no=tea.tea_no";
//若选择了教师
if('all' != $tea_no)
{
		$Str = $Str . sprintf(" and course.tea_no='%s'",$tea_no) ;
}

//若选择了学期
if('all'!=$term)
{
		$Str = $Str . sprintf(" and term='%s' ",$term) ;
}

//获取总条目
$queryStr ="select count(cor_no) from course,tea " . $Str;
$result = mysql_query($queryStr,$conn) or die("查询失败:".mysql_error());
$rel = mysql_fetch_array ( $result );
$numrows = $rel [0];

$pages = intval ( $numrows / $page_size );
if ($numrows % $page_size) {
	$pages ++;
}
	
//前一页和后一页
$prev=$page-1;
$next=$page+1;

// 计算记录偏移量
$offset = $page_size * ($page - 1);

$queryStr ="select * from course,tea " . $Str . " order by term desc limit {$offset},{$page_size}";
$result = mysql_query($queryStr,$conn) or die("查询失败:".mysql_error());

echo "<form method='post' action='./course_update.php'>";
echo '<table>';
echo '<tr>';
echo '<td />';
echo '<td>课程号</td>';
echo '<td>课程名称</td>';
echo '<td>学期</td>';
echo '<td>教师</td>';
echo '</tr>';


if($rel = mysql_fetch_array($result))	
{
	do{
	echo '<tr>';
	echo '<td>', "<input type=checkbox name = id[] value={$rel['id']}>", '</td>';
	echo '<td>', $rel ["cor_no"], '</td>';
	echo '<td>', $rel ["cor_name"], '</td>';
	echo '<td>', $rel ["term"], '</td>';
	echo '<td>', $rel ["name"], '</td>';
	echo "<td><a href='./course_view_item.php?cor_no={$rel['cor_no']}'>查看实验内容</a></td>";
	echo '</tr>';
	}while ($rel = mysql_fetch_array($result));
}

//无课程
else {
	echo '<tr><td>';
	echo "无课程，请先添加课程";
	echo '</td></tr>';
}
echo '</table>';

//分页导航
if($page>1)
{
	echo "<a href=./course.php?tea_no={$tea_no}&term={$term}&page=1>首页</a>";
	echo "<a href=./course.php?tea_no={$tea_no}&term={$term}&page={$prev}>上一页</a>";
}
if ($page < $pages)
{
echo "<a href=./course.php?tea_no={$tea_no}&term={$term}&page={$next}>下一页</a>";
echo "<a href=./course.php?tea_no={$tea_no}&term={$term}&page={$pages}>尾页</a>";
}
echo "共有{$pages}页 ({$page}/{$pages})";

//功能导航
echo '<table>';
echo '<br />';
echo '<tr>';

//echo '<td>', "<input name=class_no value={$class_no} type=hidden></input>", '</td>';
echo '<td>', "<input name=action id=action value='' type=hidden></input>", '</td>';
echo '<td>', '<input type=button class=btn  value=修改 style="width:65px;background-image:url(../static/image/but_1.png)">', '</input>', '</td>';
echo '<td>', '<input type=button class=btn  value=删除 style="width:65px;background-image:url(../static/image/but_1.png)">', '</input>', '</td>';

echo '</tr></table>';
echo '</form>';


?>

<!-- 绑定导航条点击事件 -->
<script type="text/javascript">
      var submit_action = function submit_action(e)
      {
          var frm1 = $('form');  
        switch(e.target.value)
          {
          case '删除':
              $('#action').attr('value',"delete_cor");break;
          case '修改':
              $('#action').attr('value',"update_cor");break;
          default:
        	  break;
          }
         frm1.submit();     	
       }
      var start = function() { $(".btn").click( submit_action );   }
      $(start);
	
</script>