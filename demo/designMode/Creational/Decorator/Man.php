<?php

/**
 * link: http://www.zjhejiang.com/
 * copyright: Copyright (c) 2020 浙江禾匠信息科技有限公司
 * author: xay
 */

namespace DesignMode\Creational\Decorator;

class Man implements Decorator
{
    public function totalPrice(): float
    {
        return 0.2;
    }

    public function desc(): ?string
    {
        return null;
    }
}
