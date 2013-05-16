<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<?php



$a = "2013-06-16";
$b = "2013-07-07";

if($a <$b)
	echo '360';

$t=time();
echo $t,'<br />';
echo  date('日期Y-M-d,星期:D,时间:H:i:s',$t);

$passEncode=md5(base64_encode("stu2"));
echo '密码是：',$passEncode;

?> 
<br />
<?php

$array = array('lastname', 'email', 'phone');
$comma_separated = implode(",", $array);

echo $comma_separated; // lastname,email,phone
 
// Empty string when using an empty array:
var_dump(implode('hello', array())); // string(0) ""

?>