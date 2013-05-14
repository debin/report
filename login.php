<?php
    include './config.php';

	switch($_GET['action'])
	{
		case 'login':
		  session_start();
		  $authcode= strtolower($_SESSION['authcode']);	
		  unset($_SESSION['authcode']);
		  echo $authcode,'<br />';
		  $check=strtolower(trim($_POST['check']));
	/**	  if($authcode!=$check)
		  {
			  die('验证码不正确');
		  }	
	*/	  
		  $conn=mysql_connect(DB_HOST,DB_USER,DB_PASSWORD) or die("连接失败:".mysql_error());
		  mysql_select_db(DB_NAME,$conn) or die("选择数据库失败".mysql_error());
		  $user=trim($_POST['user']);
		  $pass=trim($_POST['pass']);
		  $identify=$_POST['identify'];
		  $passEncode=md5(base64_encode($pass));
		  switch($identify)
		  {
		  	case 'stu':
		  		$table='stu';
		  		$table_user='stu_no';
		  		break;
		  	case 'tea':
		  		$table='tea';
		  		$table_user='tea_no';
		  		break;
		  	case 'admin':
		  		$table='admin';
		  		$table_user='user';
		  		break;
		  }
		  
		  $queryStr=sprintf("select * from %s where %s='%s' and psw='%s'",$table,$table_user,$user,$passEncode);
		  $result=mysql_query($queryStr,$conn) or die("查询失败:".mysql_error());
			  
		  if($rel=mysql_fetch_row($result))
		  {
			  echo $rel[0].' '.$rel[1].' '.$rel[2];
			  echo "<br />","邮箱：",$rel[3];
			  echo '<br />';
			  echo trim($_POST['identify']);
			  $_SESSION['login']='login';
			  $jump_url=sprintf("./%s/admin.php",$identify);
			  echo $jump_url,"<br />";

			  echo "<META HTTP-EQUIV=\"Refresh\" CONTENT=\"0;URL=$jump_url\">";  
			  
		  }		
		  else 
		  {
		  	echo "<META HTTP-EQUIV=\"Refresh\" CONTENT=\"0;URL='./login.html' \">";
		  }
		  mysql_close($conn);
		  
		  echo 'login';break;
		  
	    case 'signup':
		  $user=trim($_POST['user']);
		  $pass1=trim($_POST['pass1']);	  
		  $pass1=trim($_POST['pass1']);	
		  $email=trim($_POST['mail']);	
		  echo $user,'<br />';	  
		  echo 'signup';break;
		 
		case 'logout':
		  echo 'logout';
		  session_start();
		  unset($_SESSION['login']);
		  break;
		
	}
 	
    
	?>