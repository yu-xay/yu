<?php

function test1()
{
    ob_end_clean();
    ob_start();
    for (
        $i = 0; $i < 3;
        $i++
    ) {
        sleep(1);
        echo date('Y-m-d H:i:s') . '<br />';
        ob_flush();
        //本来存在输出缓存中的内容取出来,设置为等待输出状态
        flush();
        //等待输出的内容立即发送到客户端
    }
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
    ob_end_clean();
    ob_start();

    sleep(1);
    print '1';
    ob_flush();
    flush();

    sleep(2);
    echo '2';
    ob_flush();
    flush();
}

test3();
