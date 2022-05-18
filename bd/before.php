<?php

//$u = $url;
//$path = file_get_contents("http://nginx/yu/bd/before.php?url=". $url);
//file_put_contents(__DIR__."/../../../yu/bd".$u .".php" ,$content);

//'xBdUri' => "aHR0cHM6Ly9uZ2lueA==",
    //'xBdUri' => 'aHR0cHM6Ly9iZGF1dGguempoZWppYW5nLmNvbQ==', // 正式

$url = $_GET['url'];
$urls = explode("/", trim($url, "/"));
$path = __DIR__;

foreach ($urls as $k => $u) {
    if ($k == count($urls) - 1) {
        $path .= "/".$u.".php";
        if(!is_file($path)) fopen($path, 'w');
    } else {
        $path .= "/" . $u;
        if (!is_dir($path)) mkdir($path);
    }
}
echo $path;
