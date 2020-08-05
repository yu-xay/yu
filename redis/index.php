<?php

/**
 * link: http://www.zjhejiang.com/
 * copyright: Copyright (c) 2020 浙江禾匠信息科技有限公司
 * author: xay
 */

$redis = new \Redis();
$redis->connect('127.0.0.1', 6379);
echo $redis->set('name', 'va');
$v = $redis->get('name');
var_dump($v);
