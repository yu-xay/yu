<?php

var_dump(ini_get('post_max_size'));exit;
$redis = new \Redis();
$redis->connect('redis', 6379);
echo $redis->set('name', 'va');
$v = $redis->get('name');
var_dump($v);