<?php
/**
 * link: http://www.zjhejiang.com/
 * copyright: Copyright (c) 2020 浙江禾匠信息科技有限公司
 * author: xay
 */

namespace DesignMode\Creational\Decorator;


abstract class Middle implements Decorator
{
    public Decorator $model;

    public function __construct($model)
    {
        $this->model = $model;
    }
}