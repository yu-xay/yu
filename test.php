<?php


$redis = new \Redis();
$redis->connect('yu-redis', 6379);
echo $redis->set('name', 'va');
$v = $redis->get('name');
var_dump($v);