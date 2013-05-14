<?php
include '../config.php';
$conn=mysql_connect(DB_HOST,DB_USER,DB_PASSWORD) or die("连接失败:".mysql_error());
mysql_select_db(DB_NAME,$conn) or die("选择数据库失败".mysql_error());
mysql_query("SET NAMES 'UTF8'");

$action = $_REQUEST['action'];

switch($action)
{
	//选课
	case 'course_select':
		{
			if (!isset($_REQUEST['cor_no'] ))
			{
				die("请先选择课程");
			}
			$cor_no = $_REQUEST['cor_no'];
			$stu_no = trim($_REQUEST['stu_no']);
			
			$count_cor = count($cor_no);	
		    //	echo $count_cor;
		    
			//向选课表添加选课信息
			echo '选课结果:<br /><br />';
			echo '<table><tr>';
			echo '<td>课程编号</td>';
			echo '<td>添加状态(成功/失败)</td>';
			echo '</tr>';
		    for($i = 0; $i < $count_cor ; $i ++)
		    {
		    	$queryStr = sprintf("insert into sel_cor values('%s','%s',0,NULL,NULL,NULL,NULL)",$stu_no,$cor_no[$i]);
		    	$result = mysql_query ( $queryStr, $conn ) or die ( "添加失败:" . mysql_error () );
		    	
		    	//添加成功
		    	if($result==TRUE && 1==mysql_affected_rows())
		    	{
		    		echo "<tr><td>";
		    		echo $cor_no[$i];
		    		echo "</td><td>";
		    		echo '成功';
		    		echo "</td></tr>";	
		    	}
		    	//添加失败
		    	else
		    	{
		    		$count_fail ++;
		    		echo "<tr><td>";
		    	    echo $cor_no[$i];
		    		echo "</td><td>";
		    		echo '失败';
		    		echo "</td></tr>";
		    	}
		    }
		    mysql_close()	;
		}
			
}


?>

