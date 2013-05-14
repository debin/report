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

<?php
$action=NULL;
if (isset($_REQUEST['action']))
{
	$action = $_POST['action'];
}
/** 根据action参数的值，进行不同处理：select选择课号查看实验内容，add添加实验内容，update更新实验内容
 *    edit_time编辑实验报告提交时间
 * 
 */

switch($action)
{
	//根据课号查看实验项目
	case 'select':
		{
			if (!isset($_POST ['cor_no']))
			{
				die('请先选择一个实验项目');
			}
			$cor_no = $_POST ['cor_no'];
			
		//	echo '课程名称：',$_POST['cor_name'];
			echo "<form method='post' action='./item.php'>";
			echo '<table>';
			echo '<tr>';
			echo '<td />';
					
			echo '<td>实验编号</td>';
			echo '<td>实验名称</td>';
			echo '<td>成绩百分比</td>';
			echo '</tr>';

			$queryStr = sprintf ( "select  *  from item where  cor_no='%s'", $cor_no);
			$result = mysql_query ( $queryStr, $conn ) or die ( "查询失败:" . mysql_error () );
			mysql_close ();
			if ( $rel = mysql_fetch_array ( $result ) ) {
				do{
				echo '<tr>';
				echo '<td>', "<input type=radio name = id value={$rel['id']}>",'</td>';
				echo '<td>', $rel ["item_no"], '</td>';
				echo '<td>', $rel ["item_name"], '</td>';
				echo '<td>', $rel ["exam_rate"], '</td>';
				echo '</tr>';
				}while($rel = mysql_fetch_array ( $result ));
			}
			else 
			{
				echo '<tr><td>';
				echo "该课程暂时还没有添加实验内容";
				echo '</tr></td>';
			}
			echo '<br />';
			echo '<table><tr>';
			echo '<td>',"<input type=hidden name=cor_no value={$cor_no}>",'<td>';
			echo '<td>',"<input name=action id=action value='' type=hidden></input>",'</td>';
			echo '<td>','<input type=button class=btn  value=增加 style="width:65px;background-image:url(../static/image/but_1.png)">','</input>','</td>';
			echo '<td>','<input type=button class=btn  value=更新 style="width:65px;background-image:url(../static/image/but_1.png)">','</input>','</td>';
			echo '<td>','<input type=button class=btn  value=删除 style="width:65px;background-image:url(../static/image/but_1.png)">','</input>','</td>';
			echo '</tr></table>';
			echo '</table>';	
			echo '</form>';
			
		};break;
		
	//修改实验项目
	case 'update':
		{
			if (!isset($_REQUEST['id']))
			{
				die('请先选择实验项目');
			}
			$id = $_REQUEST['id'];
			//$item_no=$_GET ['item_no'];
			$queryStr = sprintf ( "select  *  from item where  id='%s' ", $id);
			$result = mysql_query ( $queryStr, $conn ) or die ( "查询失败:" . mysql_error () );
			mysql_close ();
			
		
			if($rel=mysql_fetch_array($result))
			{
				echo "<form method='post' action='./item_deal.php?action=update&id={$rel['id']}'>";
				echo '实验编号:';
				echo "<input name='item_no' value={$rel['item_no']}></input>";
				echo '<br />';
				echo '实验名称:';
				echo "<input name='item_name' value={$rel['item_name']}></input>";
				echo '<br />';
				echo '所占成绩百分比:';
				echo "<input name='exam_rate' value={$rel['exam_rate']}>%</input>";
				echo '<br />';
				echo '实验内容：:';
				echo '<br />';
				echo "<textarea name='body' style='width:700;height:400;'>{$rel['body']}</textarea>";
				
				echo '<br /><br />';
				echo '实验报告模板:';
				echo '<br />';
				echo "<textarea name='report_format' style='width:700;height:500;'>{$rel['report_format']}</textarea>";
				echo '<br /><br />';

			}
			
			echo "<td><input type='submit' value='提交'></input></td>";
			echo '</form>';
			
		};break;
		
	//新添实验项目
	case 'add':
		{
			echo "<form method='post' action='./item_deal.php?action=add'>";
			echo '实验编号:';
			echo "<input name='item_no' ></input>";
			echo '<br />';
			echo '实验名称:';
			echo "<input name='item_name' ></input>";
			echo '<br />';
			echo '本次实验报告成绩所长百分比:';
			echo "<input name='exam_rate' >%</input>";
			echo '<br />';
			echo '实验内容：';
			echo '<br />';
			echo "<textarea name='body' style='width:700;height:400;margin-left:auto;margin-right:auto;'></textarea>";
			echo '<br /><br />';
			
			echo '实验报告提交模板：';
			echo '<br />';				
			echo "<textarea name='report_format' style='width:700;height:500;margin-left:auto;margin-right:auto;'></textarea>";
			echo '<br /><br />';
			
			echo "<input type='hidden' name='cor_no' value={$_POST['cor_no']}> </input>";
			
			echo "<td><input type='submit' value='提交'></input></td>";
		};break;
		
		//删除实验项目
/**		case 'delete':
			{
				echo "<form  method='post' action='./item_deal.php?action=delete'>";
				echo "";
				
			};break;
*/			
			//修改实验报告提交截止时间
		case 'edit_time':
			{
				if (! isset($_REQUEST['cor_no']))
				{
					die('请先选择一项');
				}
				$queryStr = sprintf ( "select report_time from course where  cor_no='%s'", $_POST['cor_no']);
				$result = mysql_query ( $queryStr, $conn ) or die ( "查询失败:" . mysql_error () );
				mysql_close ();	
                
				echo "<form method='post' action='./item_deal.php?action=edit_time'>";
				echo '报告提交截止时间：';
				
				if($rel=mysql_fetch_array($result))
				{
					
					echo "<input name=report_time value={$rel['report_time']}>(格式:2013-05-05)</input>";
					
				}
				else
				{
					echo "<input name=report_time value=>(格式:2013-05-05)</input>";
				}
				echo '<br /><br />';
				echo "<input type=hidden name=cor_no value={$_POST['cor_no']}></input>";
				echo "<input type=submit value='提交'></input>";
				echo '</form>';

				
				
			};break;
		
		//显示所有课程
	default:
		{

			
			echo "<form  method='post' action='./item.php'>";
		//	echo "正常";
			echo '<table>';
			echo '<tr>';
			echo '<td />';
			echo '<td>课号</td>';
			echo '<td>课程名称</td>';
			echo '<td>学期</td>';
			echo '<td />';
			echo '</tr>';
			
			$queryStr = sprintf ( "select  *  from course where tea_no='%s'", $tea_no );
			if (isset($_POST['term']) &&  'all'!=$_POST['term'])
			{
				$queryStr =$queryStr . sprintf(" and term='%s'",$_POST['term']);
			}
			
			$result = mysql_query ( $queryStr, $conn ) or die ( "查询失败:" . mysql_error () );
			mysql_close ();
			if ( $rel = mysql_fetch_array ( $result ) ) {
				do{
				echo '<tr>';
				echo '<td>', "<input type=radio name=cor_no value={$rel['cor_no']}>", '</td>';
				
				echo '<td>', $rel ["cor_no"], '</td>';
				echo '<td>', $rel ["cor_name"], '</td>';
				echo '<td>', $rel ["term"], '</td>';
			//	echo "<td><a href='./update_item.php?action=select&cor_no={$rel['cor_no']}'>进入修改</a></td>";
				echo '</tr>';
				}while($rel = mysql_fetch_array ( $result ) );
			}
			else
			{
				echo '<tr><td>';
				echo '暂时没有您的课程';
				echo '</tr></td>';
			}

			echo '</table>';
            echo '<br />';
            
    
            
			echo "<table style='align:center;'>";
			echo '<tr>';
			echo '<td>','<input type=button class=btn value=查看 style="width:65px;background-image:url(../static/image/but_1.png)">','</input>','</td>';
			echo '<td>','<input type=button class=btn value=编辑时间 style="width:65px;background-image:url(../static/image/but_1.png)">','</input>','</td>';
				
			echo '</tr>';			
			echo '</table>';
			echo '<input type=hidden name=action id=action value="" />';
			echo '</form>';
		}
}

?>





<!-- 绑定导航条点击事件 -->

<div id='table'></div>
<script type="text/javascript">
      var submit_action = function submit_action(e)
      {
          var frm1=$('form');
          
        switch(e.target.value)
          {
          case '查看':
              $('#action').attr('value',"select");break;
          case '增加':
              $('#action').attr('value',"add");break;
          case '更新':
              $('#action').attr('value',"update");break;
          case '删除':
              $('form').attr('action',"./item_deal.php?action=delete");
              $('#action').attr('value',"delete");break;
          case '编辑时间':
        	  $('#action').attr('value',"edit_time");break;
          default:
        	  break;
          }
    //    alert($('#action').attr('value'));
       
         frm1.submit();     	
       }
      var start=function() { $(".btn").click( submit_action );   }
      $(start);
	
</script>
