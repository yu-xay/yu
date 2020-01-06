<?php
/**
 * link: http://www.zjhejiang.com/
 * copyright: Copyright (c) 2020 浙江禾匠信息科技有限公司
 * author: xay
 */

class simple
{
    private $timeout = 10;  //超时时间
    private static $connectPool = [];  //连接池
    private $handShake = False; //默认未牵手
    private $master = 1;  //主进程
    private $port = 8082;  //监听端口
    private static $maxConnectNum = 1024; //最大连接数

    public function __construct()
    {
        $this->port = 8082;
    }

    public function index()
    {
        $this->log('开始运行');
        $this->master = socket_create_listen($this->port);
        self::$connectPool[] = $this->master;
        while (true) {
            $readFds = self::$connectPool;
            //阻塞接收客户端链接
            @socket_select($readFds, $writeFds, $e = null, $this->timeout);
            foreach ($readFds as $socket) {
                if ($this->master == $socket) {
                    $this->log('接收新的链接');
                    $client = socket_accept($this->master);
                    $this->handShake = false;
                    if ($client < 0) {
                        $this->log('客户端连接失败');
                    } else {
                        if (count(self::$connectPool) > self::$maxConnectNum)
                            continue;
                        array_push(self::$connectPool, $client);
                        $this->log('加入连接池');
                    }
                } else {
                    //不是主进程,开始接收数据
                    $bytes = @socket_recv($socket, $buffer, 2048, 0);
                    $this->log($bytes);
                    if ($bytes == 0) {
                        $this->log('关闭');
                        socket_close($socket);
                    } else {
                        if (!$this->handShake) {
                            $this->doHandShake($socket, $buffer);
                            $this->log('未握手 先握手');
                        } else {
                            //如果是已经握完手的数据，广播其发送的消息
                            $buffer = $this->decode($buffer);
                            $this->log('获取' . $buffer);

                            $msg = [
                                'key' => 'value'
                            ];
                            $this->log('广播');
                            $msg = $this->frame(json_encode($msg));
                            socket_write($client, $msg, strlen($msg));
                        }
                    }
                }
            }
        }
    }

    function log($data)
    {
        echo $data . PHP_EOL;
    }

    //握手协议
    function doHandShake($socket, $buffer)
    {
        list($resource, $host, $origin, $key) = $this->getHeaders($buffer);
        $upgrade = "HTTP/1.1 101 Switching Protocol\r\n" .
            "Upgrade: websocket\r\n" .
            "Connection: Upgrade\r\n" .
            "Sec-WebSocket-Accept: " . $this->calcKey($key) . "\r\n\r\n";  //必须以两个回车结尾

        socket_write($socket, $upgrade, strlen($upgrade));
        $this->handShake = true;
        return true;
    }

    //获取请求头
    function getHeaders($req)
    {
        $r = $h = $o = $key = null;
        if (preg_match("/GET (.*) HTTP/", $req, $match)) {
            $r = $match[1];
        }
        if (preg_match("/Host: (.*)\r\n/", $req, $match)) {
            $h = $match[1];
        }
        if (preg_match("/Origin: (.*)\r\n/", $req, $match)) {
            $o = $match[1];
        }
        if (preg_match("/Sec-WebSocket-Key: (.*)\r\n/", $req, $match)) {
            $key = $match[1];
        }
        return [$r, $h, $o, $key];
    }

    //验证socket
    function calcKey($key)
    {
        //基于websocket version 13
        $accept = base64_encode(sha1($key . '258EAFA5-E914-47DA-95CA-C5AB0DC85B11', true));
        return $accept;
    }

    //解码 解析数据帧
    function decode($buffer)
    {
        $len = $masks = $data = $decoded = null;
        $len = ord($buffer[1]) & 127;

        if ($len === 126) {
            $masks = substr($buffer, 4, 4);
            $data = substr($buffer, 8);
        } else if ($len === 127) {
            $masks = substr($buffer, 10, 4);
            $data = substr($buffer, 14);
        } else {
            $masks = substr($buffer, 2, 4);
            $data = substr($buffer, 6);
        }
        for ($index = 0; $index < strlen($data); $index++) {
            $decoded .= $data[$index] ^ $masks[$index % 4];
        }
        return $decoded;
    }

    //打包函数 返回帧处理
    public function frame($buffer)
    {
        $len = strlen($buffer);
        if ($len <= 125) {
            return "\x81" . chr($len) . $buffer;
        } else if ($len <= 65535) {
            return "\x81" . chr(126) . pack("n", $len) . $buffer;
        } else {
            return "\x81" . char(127) . pack("xxxxN", $len) . $buffer;
        }
    }
}