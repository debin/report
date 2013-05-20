<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<?php

session_start();
//$b = array();

$b = $_SESSION["user"];

echo $b['type'];
echo $b['id'];


?>