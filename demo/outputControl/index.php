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
        //
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
    //var_dump(ini_get('implicit_flush'));
    ob_implicit_flush(1);
    echo str_repeat('a', 31);
    sleep(1);
    echo 'b';   // flush();
    sleep(1);
    echo 'c'; //   flush();
}

function test4()
{

    //  echo file_get_contents('index.php')
    echo highlight_file('index.php');
    return;
    function callback($buffer)
    {
        // replace all the apples with oranges
        print_r('1231');
        return ucfirst($buffer);
    }

    function callback1($buffer)
    {
        // replace all the apples with oranges
        static $a = 0;
        return $a++ . '-' . $buffer . "\n";
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

function test5()
{

    ob_implicit_flush(1);
    ob_end_clean();
    function a($data){
        return json_encode($data);
    }
    echo a([
        'code' => 1,
    ]);
    sleep(1);
    echo a([
        'code' =>2,
    ]);
    sleep(1);
    echo a([
        'code' =>2,
    ]);
//
//    ob_implicit_flush(1);
//    // ob_end_clean();
//
//    ob_start();
//
//    for ($i = 0; $i < 10; $i++) {
//        echo str_repeat(' ', 1024 * 4 * 8) . $i . "<br/>";
//        sleep($i);
//    }
}
function test6(){
//    ob_end_clean();
//    ob_implicit_flush(false);
//
//    $a = 1;
//    include '2.php';

    ob_start();//使用gz格式压缩输出
    print'my contents';
    echo memory_get_usage();

}
test6();
