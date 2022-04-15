<?php

/**
 * link: http://www.zjhejiang.com/
 * copyright: Copyright (c) 2020 浙江禾匠信息科技有限公司
 * author: xay
 */

namespace DesignMode\Structural\Composite;

class Department implements Limited
{
    public string $name;

    public function __construct($name)
    {
        $this->name = $name;
    }

    //放入接口 => [透明模式|安全模式]
    public function add(Limited $model)
    {
        throw new \Exception('not support', 500);
    }

    public function delete(Limited $model)
    {
        throw new \Exception('not support', 500);
    }

    public function render()
    {
        return $this->name;
    }
}
