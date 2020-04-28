<?php

namespace yu\wrappers;

require './customize.php';

use PHPUnit\Framework\TestCase;

class Wrappers extends TestCase
{
    public function testIndex()
    {
        $a = new \DateTime('2020-12-21 03:08:43');
        var_dump($a->getDateInterval);exit;
        echo 1;
        $this->assertSame(1, 1);
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
            //可以过滤器列表 => https://www.php.net/manual/zh/filters.php 通常没用
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
