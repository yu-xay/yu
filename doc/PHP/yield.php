<?php declare(strict_types=1);
//https://learnku.com/laravel/t/8704/using-yield-to-do-memory-optimization-in-php
/**
 *生成器函数看上去就像一个普通函数， 除了不是返回一个值之外， 生成器会根据需求产生更多的值。
 */
function getValue()
{
    yield 'key' => 'value';
    yield 'value2';
}

//getValues() 方法不会如预期返回一个字符串 意味着你必须遍历 getValue() 方法来取值：
var_dump(getValue());  // class Generator#1 (0) {}

//一个生成器允许你使用循环来迭代一组数据，而不需要在内存中创建是一个数组，这可能会导致你超出内存限制。
$func1 = function () {
    $valuesArray = [];
// 获取初始内存使用量
    echo round(memory_get_usage() / 1024 / 1024, 2) . ' MB' . PHP_EOL;
    for ($i = 1; $i < 800000; $i++) {
        $valuesArray[] = $i;
        //yield $i;
        // 为了让我们能进行分析，所以我们测量一下内存使用量
        if (($i % 200000) == 0) {
            // 来 MB 为单位获取内存使用量
            echo round(memory_get_usage() / 1024 / 1024, 2) . ' MB' . PHP_EOL;
        }
    }
    return $valuesArray;
};


foreach ($func1() as $value) {
}
//
#### 个人实践  数组内存过大使用：field效率相较低;