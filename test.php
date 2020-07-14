<?php

//function gen() {
//    $tid = (yield 1 + 1);
//    for ($i = 1; $i <= 10; ++$i) {
//        echo "This is $tid task iteration $i.\n";
//        yield $i;
//    }
//}
//
////$t1是[generator](http://php.net/manual/en/class.generator.php)类的实例(instance)
//$t1 = gen();
////取出yield后面的表达式的结构，并没有进行赋值就暂停了当前的操作 `$tid = (yield 1 + 1) `，（特性一：中断点)
//$r1 = $t1->current();
////结果为 2
//echo 'AAA';
//echo $r1;
////将字符'+++'（特性二：占位符)，替换到刚才暂停的地方 `$tid = '+++++'`，并进入for循环，遇见yield表达式，获取yield 表达式后面的值，并保存当前的局部变量的值，yield后面是$i，返回$i
//var_dump($t1->send('+++'));
function func($value, $arr)
{
    if (count($arr) == 0) {
        return '';
    }
    $center = floor(count($arr) / 2);

    if ($value == $arr[$center]) {
        return $center;
    }
    if ($value > $arr[$center]) {
        $arr = array_slice($arr, $center, count($arr));
        return $center + func($value, $arr);
    }
    if ($value < $arr[$center]) {
        $arr = array_slice($arr, 0, $center);
        return func($value, $arr);
    }
}


$value = 1;
$default = [1, 2, 3, 4, 6, 11, 66];
echo func($value, $default);
