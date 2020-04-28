<?php
/**
 * link: http://www.zjhejiang.com/
 * copyright: Copyright (c) 2020 浙江禾匠信息科技有限公司
 * author: xay
 */

//var_dump(stream_get_wrappers());
$path = realpath('data.txt');
//
//
//$a = fopen("file://$path", "r+");
//$a = fread($a,9999);
//echo $a;

//$requestBody = http_build_query(
//    array(
//        'var1' => 'some content',
//        'var2' => 'doh'
//    )
//);
//var_dump($requestBody);
//$context = stream_context_create(array(
//    'http' => array(
//        'method' => 'POST',
//        'header'  => 'Content-type: application/x-www-form-urlencoded',
//        'content' => $requestBody,
//    )
//));
//var_dump($context);
//$response = file_get_contents('http://localhost/yu/test/get.php', false,$context);
//var_dump($response);

$handle = fopen($path, 'rb');
stream_filter_append($handle, 'string.toupper');
//while(feof($handle) !== true) {
    echo fgets($handle);
//}
fclose($handle);

