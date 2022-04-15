<?php
use Workerman\Worker;

//require_once __DIR__ . '/../vendor/workerman/workerman/Autoloader.php';
require_once '../vendor/autoload.php';

class HttpTest
{
    public function index()
    {

        // 创建一个Worker监听2345端口，使用http协议通讯
        $http_worker = new Worker("tcp://127.0.0.1:8082");


        // 启动4个进程对外提供服务
        $http_worker->count = 4;

        // 接收到浏览器发送的数据时回复hello world给浏览器
        $http_worker->onMessage = function ($connection, $data) {
            // 向浏览器发送hello world
            $connection->send('hello world');
        };

        // 运行worker
        Worker::runAll();
    }
}

$a = new HttpTest();
$a->index();