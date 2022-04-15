<?php

namespace yu\wrappers;

require './customize.php';

use PHPUnit\Framework\TestCase;

class Wrappers extends TestCase
{
    /*
     * 有的流可以接受一系列可选的参数，叫做作流的上下文 使用stream_content_create()
     * note1： Content-Type: application/x-www-form-urlencoded时 请求主体body数据会转换关联数组放入$_POST; php://input 获取元素数据
     * note2： Content-Type: multipart/form-data 也会放入$_POST 能正常打印数据，但$_POST是接收不了的
     */
    public function testStreamParams()
    {
        //todo mulipart/form-data $_POST 获取不到 原因未知 =>  failed to open stream: HTTP request failed!
        $params = stream_context_create([
            'http' => [
                'method' => 'POST',
                'header' => "'Expect:  \r\nContent-Type: multipart/form-data; boundary=" . uniqid() . "\r\n",
                //."Content-Length: 30\r\n",
                //'header' => "Content-Type: application/x-www-form-urlencoded\r\n", //$_POST
                //'content' => '{"username": "join"}', //php://input
                'content' => http_build_query(['username' => 'join']), //$_POST
            ],
        ]);
        file_get_contents('http://localhost/yu/test.php?get=1', false, $params);

        //file_put_contents('my-errors.log', '');
        //error_log(json_encode($_GET,JSON_UNESCAPED_UNICODE). "\n", 3, "./my-errors.log");
        //error_log(json_encode($_POST,JSON_UNESCAPED_UNICODE). "\n", 3, "./my-errors.log");
        //error_log(json_encode(file_get_contents('php://input'),JSON_UNESCAPED_UNICODE). "\n", 3, "./my-errors.log");
        //error_log(json_encode(getallheaders(),JSON_UNESCAPED_UNICODE). "\n", 3, "./my-errors.log");
    }

    /**
     * 使用流封装协议打开一些资源
     * 流过滤器
     */
    public function testStreamFilter()
    {
        $path = '1.txt';
        file_put_contents($path, 'remark');

        {
            goto a;
            $handle = fopen($path, 'rb');
            //可以过滤器列表 => stream_get_filters() https://www.php.net/manual/zh/filters.php
            stream_filter_append($handle, 'string.toupper');
            a:
        }

        {
            /**
             * 相比stream_filter_append比较繁琐；因为莫些文件系统例如file()、fpassthru()、
             * 所以这些函数只能使用php://filter流封装协议附加流过滤器
             */
            /* filter/read=<filter_name>/resource=<scheme>://<target> */
            $handle = fopen("php://filter/read=string.toupper/resource=$path", 'rb');
        }

        while (feof($handle) !== true) {
            $this->assertSame('REMARK', fgets($handle)); //大写
        }
        fclose($handle);
        unlink(realpath($path));
    }

    /**
     * 自定义流过滤器
     */
    public function testCustomize()
    {
        //必须使用此函数支持自定义流过滤器
        stream_filter_register('customize_filter', 'yu\wrappers\customize') or die('fail');
        $path = '2.txt';
        file_put_contents($path, 'remark/n/ratliff');

        $handle = fopen("php://filter/read=customize_filter/resource=$path", 'rb');
        while (feof($handle) !== true) {
            $this->assertSame('rem*rk/n/r*tliff', fgets($handle)); //大写
        }
    }
}
