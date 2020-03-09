<?php
function test1()
{
    ob_end_clean();
    ob_start();
    for ($i = 0; $i < 3; $i++) {
        sleep(1);
        echo date('Y-m-d H:i:s') . '<br />';

        ob_flush(); //本来存在输出缓存中的内容取出来,设置为等待输出状态
        flush(); //等待输出的内容立即发送到客户端
    }
}

test1();