<head>
<link rel="stylesheet" type="text/css" href="./static/css/global.css"></link>
<script type="text/javascript" src="../static/jquery/jquery-1.8.3.js"></script>
</head>
<?php
include './config.php';
$conn = mysql_connect ( DB_HOST, DB_USER, DB_PASSWORD ) or die ( "连接失败:" . mysql_error () );
mysql_select_db ( DB_NAME, $conn ) or die ( "选择数据库失败" . mysql_error () );
mysql_query ( "SET NAMES 'UTF8'" );
$now = date ( "Y-m-d G:i:s" );
$stu = 'stu2';

echo '<div id=top>讨论区</div>';
?>

<div id='topMain'>
<?php
// 若有主题的id，则显示主题
if (isset ( $_REQUEST ['topic'] )) {
	echo "<a href=./bbs.php style=''>首页</a>";
//	echo '<br />';
	$post_id = $_REQUEST ['topic'] ;
	
	// 获取帖子
	$queryStr = sprintf ( "select  *  from topic,sort where post_id='%s' and topic.sort=sort.id",$post_id );
	$result = mysql_query ( $queryStr, $conn ) or die ( "查询失败:" . mysql_error () );
	if($rel = mysql_fetch_array ( $result ))
	{
	//	echo '此帖子存在';
	
		echo "<span>>{$rel['name']}</span><br />";
		echo "<span class=post_title>{$rel['title']}</span>";
		echo "<br /><span style='font-size:16px;'>By {$rel['author']}</span>";
		echo "<span style='margin-left:50px;'>发表时间:{$rel['post_time']}<span>";
		echo '<hr />';
		echo '<div class=sep20></div>';
		echo $rel['body'];
	}
	//帖子不存在
	else
	{
		echo '<br /><br />帖子不存在';
		
	}
	
	
} 

// 默认显示主题列表
else {
	// 分页中每一页的条目数量
	$page_size = 10;
	
	// 获取页码
	if (isset ( $_GET ['page'] )) {
		$page = intval ( $_GET ['page'] );
	} 	// 设置为第一页
	else {
		$page = 1;
	}
	
	// 获取主题总数
	$queryStr = sprintf ( "select  count(post_id)  from topic" );
	$result = mysql_query ( $queryStr, $conn ) or die ( "查询失败:" . mysql_error () );
	$rel = mysql_fetch_array ( $result );
	$numrows = $rel [0];
	
	// 总页数
	$pages = intval ( $numrows / $page_size );
	if ($numrows % $page_size) {
		$pages ++;
	}
	
	// 前一页和后一页
	$prev = $page - 1;
	$next = $page + 1;
	
	// 计算记录偏移量
	$offset = $page_size * ($page - 1);
	
	$queryStr = sprintf ( "select  post_id,sort,title,author,post_time,last_reply_time  from topic where visible='0'  order by last_reply_time desc limit %s,%s", $offset, $page_size );
	$result = mysql_query ( $queryStr, $conn ) or die ( "查询失败:" . mysql_error () );
	mysql_close ();
	if ($rel = mysql_fetch_array ( $result )) {
		do {
			echo '<div>';
			
			echo "<span class='title' style='margin-left:20px;'><a href=./bbs.php?topic={$rel['post_id']}>{$rel['title']}</a></span>";
			echo "<span style='float:right;font-size:15px;margin-right:10px'>最后回复:{$rel['last_reply_time']}</span>";
			echo "<span style='float:right;font-size:15px;margin-right:10px'>楼主:{$rel['author']}</span>";
			echo '</div>';
		} while ( $rel = mysql_fetch_array ( $result ) );
	} else {
		echo '暂时还没有帖子';
	}
	
	// 分页导航
	echo '<br />';
	if ($page > 1) {
		echo "<a href=./bbs.php?page=1>首页</a>";
		echo "<a href=./bbs.php?page={$prev}>上一页</a>";
	}
	if ($page < $pages) {
		echo "<a href=./bbs.php?page={$next}>下一页</a>";
		echo "<a href=./bbs.php?page={$pages}>尾页</a>";
	}
	echo "共有{$pages}页 ({$page}/{$pages})";
}

?>


</div>



