<?php

/**
 * link: http://www.zjhejiang.com/
 * copyright: Copyright (c) 2020 浙江禾匠信息科技有限公司
 * author: xay
 */

namespace DesignMode\Structural\Decorator;

class Xiezi extends Middle
{
    public function totalPrice(): float
    {
        return $this->model->totalPrice() + 80;
    }

    public function desc()
    {
        return sprintf('%sxiezi:AJ;', $this->model->desc());
    }
}
