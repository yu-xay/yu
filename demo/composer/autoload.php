<?php
require './registry.class.php';
if (!function_exists('dd')) {
    function dd($arg)
    {
        echo "<pre>";
        print_r($arg);
        echo "</pre>";
    }
}

spl_autoload_register(['yu\composer\registry', 'autoload'], true, false);
set_error_handler(['yu\composer\registry', 'error']);
//set_exception_handler(['yu\composer\registry', 'exception']);
// 还原成之前的全局异常处理程序
//restore_exception_handler();

