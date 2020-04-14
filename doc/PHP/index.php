<?php
$str = '科技有限公司';
$encode = base64_encode($str);

xdebug_debug_zval('encode');
debug_zval_dump('encode');
echo 1;