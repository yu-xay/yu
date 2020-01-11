<?php
/**
 * link: http://www.zjhejiang.com/
 * copyright: Copyright (c) 2020 浙江禾匠信息科技有限公司
 * author: xay
 */

namespace yu\composer;


class registry
{
    public static function autoload($class)
    {
        echo 123;exit;
        $class = substr($class, strripos($class, '\\') + 1);
        $classFile = './auto/' . $class . '.php';

        if (is_file($classFile)) {
            include $classFile;
        } else {
            file_put_contents('autoload.txt', date('Y-m-d H:i:s') . $class . PHP_EOL, FILE_APPEND);
        }
    }

    public static function error($errno, $errstr, $errfile, $errline)
    {
        file_put_contents('log.txt', date('Y-m-d H:i:s') . 'ERROR' . $errstr . PHP_EOL, FILE_APPEND);
    }

    public static function exception($class, $a)
    {
        echo 222;
        exit;
    }
}
