<?php
/**
 * link: http://www.zjhejiang.com/
 * copyright: Copyright (c) 2020 浙江禾匠信息科技有限公司
 * author: xay
 */

namespace DesignMode\Creational\Bridge;


abstract class People
{
    protected Food $food;

    public function __construct(Food $food)
    {
        $this->food = $food;
    }

    abstract public function start();
}