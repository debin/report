<?php
# FileName="Connection_php_mysql.htm"
# Type="MYSQL"
# HTTP="true"
$hostname_mysql = "localhost";
$database_mysql = "sy_shiyan";
$username_mysql = "test";
$password_mysql = "test";
$mysql = mysql_pconnect($hostname_mysql, $username_mysql, $password_mysql) or trigger_error(mysql_error(),E_USER_ERROR); 
?>