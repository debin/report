<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<?php
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