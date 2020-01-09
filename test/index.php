<?php
/**
 * link: http://www.zjhejiang.com/
 * copyright: Copyright (c) 2020 浙江禾匠信息科技有限公司
 * author: xay
 */
require_once '../vendor/autoload.php';

use PHPUnit\Framework\TestCase;
use ckg\src\Tools;

class StackTest extends TestCase
{
    public function testPushAndPop()
    {
        $a = new Tools();
        $this->expectOutputString('Hello World');
        $a::Hello();
    }
}

$a = new StackTest();
$a->testPushAndPop();


?>