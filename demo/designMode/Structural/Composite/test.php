<?php

/**
 * link: http://www.zjhejiang.com/
 * copyright: Copyright (c) 2020 浙江禾匠信息科技有限公司
 * author: xay
 */

namespace DesignMode\Structural\Composite;

use PHPUnit\Framework\TestCase;

class test extends TestCase
{
    public function testTree()
    {
        $play1 = new Department('HR');
        $play2 = new Department('PR');
        $children1 = new Company('子公司1');
        $children1->add($play1);
        $children1->add($play2);
        $children1->delete($play1);
        $children2 = new Company('子公司2');
        $children2->add($play1);
        $all = new Company('总公司');
        $all->add($play1);
        $all->add($play2);
        $all->add($children1);
        $all->add($children2);
        $data = $all->render();


        $n = PHP_EOL;
        $same = <<<EOL
-总公司$n--HR$n--PR$n--子公司1$n---PR$n--子公司2$n---HR$n
EOL;
        $this->assertEquals($same, $data, '数据');
    }
}
