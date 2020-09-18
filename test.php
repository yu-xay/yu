<?php
require 'vendor/autoload.php';


$client = new \GuzzleHttp\Client();
// 发送一个异步请求
$request = new \GuzzleHttp\Psr7\Request('GET', 'http://www.sopans.com');
$request2 = new \GuzzleHttp\Psr7\Request('GET', 'http://www.sopans.com/laruence');
$request3 = new \GuzzleHttp\Psr7\Request('GET', 'http://www.sopans.com/about');
$promise = $client->sendAsync($request)->then(function ($response) {
    sleep(4);
    echo 111;
});
$promise = $client->sendAsync($request2)->then(function ($response)use($client,$request3) {
    $client->sendAsync($request3)->then(function ($res){
        echo 444;
    });
    echo 222;
});
echo 333;
$promise->wait();