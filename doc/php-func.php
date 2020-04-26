<?php
$str = '科技有限公司';
$encode = base64_encode($str);

$a = php_sapi_name();
echo $a;
xdebug_debug_zval('encode');
debug_zval_dump('encode');
echo 1;
