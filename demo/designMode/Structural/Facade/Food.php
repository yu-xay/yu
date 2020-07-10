<?php

/**
 * link: http://www.zjhejiang.com/
 * copyright: Copyright (c) 2020 浙江禾匠信息科技有限公司
 * author: xay
 */

namespace DesignMode\Structural\Facade;

class Food
{
    public Chicken $chicken;
    public Pig $pig;
    public function __construct($chicken, $pig)
    {
        $this->chicken = $chicken;
        $this->pig = $pig;
    }

    public function getName()
    {
        $this->chicken->name();
        $this->pig->cname();
    }

    public function eat()
    {
        $this->chicken->eat();
        return 'end';
    }

    public function __toString(): string
    {

    }
}
