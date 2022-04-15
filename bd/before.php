<?php

//$path = file_get_contents("http://nginx/yu/bd/before.php?url=". $url);

echo 1;exit;
$url = $_GET['url'];
$urls = explode("/", trim($url, "/"));
$path = __DIR__;
//exit;
var_dump($urls);
foreach ($urls as $k => $u) {
    $path .= "/" . $u;
    if (!is_dir($path)) mkdir($path);

    if ($k == count($urls) - 1) {
        $path .= "/index.php";
        if(!is_file($path)) fopen($path, 'w');
    }
}
echo $path;
