<?php
/**
 * link: http://www.zjhejiang.com/
 * copyright: Copyright (c) 2020 浙江禾匠信息科技有限公司
 * author: xay
 */

namespace DesignMode\Structural\Bridge;


use PHPUnit\Framework\TestCase;

class test extends TestCase
{
    public function testCommon()
    {
        $cake = new CakeFood();
        $people = new Woman($cake);
        $morning = $people->start();
        $this->assertSame('eat 饭', $morning);
    }

    public function testAwesome()
    {
        $cake = new RiceFood();
        $people = new Woman($cake);
        $morning = $people->start();
        $this->assertSame('eat 蛋糕', $morning);
    }
}