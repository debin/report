<head>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<link rel="stylesheet" type="text/css" href="../static/css/global.css"></link>
<script type="text/javascript" src="../static/jquery/jquery-1.8.3.js"></script>
</head>

<?php
include '../config.php';
$conn=mysql_connect(DB_HOST,DB_USER,DB_PASSWORD) or die("连接失败:".mysql_error());
mysql_select_db(DB_NAME,$conn) or die("选择数据库失败".mysql_error());
mysql_query("SET NAMES 'UTF8'");

$stu_no = $_REQUEST['stu_no'];
$grade = $_REQUEST['grade'];

echo "<form method='post' action='./course_select_deal.php'>";
echo '<table>';
echo '<tr>';
echo '<td />';
echo '<td>课号</td>';
echo '<td>课程名称</td>';
echo '<td>实验教师</td>';
echo '</tr>';

$queryStr =sprintf("select * from course,tea where course.grade='%s' and tea.tea_no=course.tea_no and course.cor_no not in (select cor_no from sel_cor where stu_no='%s' and status!=0)",$grade,$stu_no);
$result = mysql_query($queryStr,$conn) or die("查询失败:".mysql_error());

//有课程可选
if($rel = mysql_fetch_array($result))
{
	do 
	{
		echo '<tr>';
		echo '<td>', "<input type=checkbox name = cor_no[] value={$rel['cor_no']}>", '</td>';
		echo '<td>', $rel ["cor_no"], '</td>';
		echo '<td>', $rel ["cor_name"], '</td>';
		echo '<td>', $rel ["name"], '</td>';
		echo '</tr>';
	}
	while ($rel = mysql_fetch_array($result));
	
	//功能导航
	echo '<table>';
	echo '<br />';
	echo '<tr><td>';
	
	echo '<td>', "<input name=stu_no value={$stu_no} type=hidden></input>", '</td>';
	echo '<td>', "<input name=action id=action value='' type=hidden></input>", '</td>';
	echo '<td>', '<input type=button class=btn  value=选课 style="width:65px;background-image:url(../static/image/but_1.png)">', '</input>', '</td>';
	echo '<td>', '<input type=button class=btn  value=查看 style="width:65px;background-image:url(../static/image/but_1.png)">', '</input>', '</td>';
	echo '</tr></table>';
	echo '</form>';
}
else
{
	echo '无可选实验课程';
}

?>

<!-- 绑定导航条点击事件 -->
<script type="text/javascript">
      var submit_action = function submit_action(e)
      {
          var frm1 = $('form');  
        switch(e.target.value)
          {
          case '选课':
              $('#action').attr('value',"course_select");break;
          case '查看':
              $('#action').attr('value',"course_view");break;
          default:
        	  break;
          }
         frm1.submit();     	
       }
      var start = function() { $(".btn").click( submit_action );   }
      $(start);
	
</script>
