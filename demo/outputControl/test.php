<?php

function test1()
{
    //ob_end_clean();
    ob_implicit_flush(1); //强制每当有输出的时候，即刻把输出发送到浏览器。不需要 每次 ob_flush flush
    echo str_repeat('a', 31);
    sleep(1);
    echo str_repeat('b', 1);
}

//解决脚本输入前发生
function test2()
{
    ob_end_clean();
    //header() 和setcookie() 必须在脚本产生任意输出之前发送 否则会报错
    setcookie('test', true);
    header("Expires: Mon, 26 Jul 1997 05:00:00 GMT");
    header("Cache-Control: no-cache");
    header("Pragma: cache");
    echo true;
}

function test3()
{
    ob_implicit_flush(1);
    function callback($buffer)
    {
        print_r('写这里不显示');
        return ucfirst($buffer);
    }

    function callback1($buffer)
    {
        static $a = 0;
        return $a++ . '-' . $buffer . PHP_EOL;
    }

    ob_start('callback1', 10);
    ob_start("callback", 3);
    echo "fo";
    sleep(2);
    echo 'o';
    sleep(2);
    echo "barbazz";
    sleep(2);
    echo "heabo";
}

function test4()
{
    header('X-Accel-Buffering: no');
    //apache FcgidOutputBufferSize
}

//yii or drupal
function test5()
{
    // Extract the variables to a local namespace
    $params = ['content' => 1];
    extract($params, EXTR_OVERWRITE);
    // Start output buffering
    ob_start();
    ob_implicit_flush(false);

    // Include the template file
    require 'template_file.php';

    // End buffering and return its contents
    return ob_get_clean();
}

test1();
